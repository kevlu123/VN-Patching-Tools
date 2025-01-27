using System.Text.RegularExpressions;

namespace Ws2Explorer.HighLevel;

public static class FileTool
{
    public static async Task<DisposingList<NamedFolder>> OpenFolderHierarchy(
        string path,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var parts = SplitPath(path);
        var folders = new DisposingList<NamedFolder>();
        try
        {
            int i = 1;
            try
            {
                for (; i <= parts.Count; i++)
                {
                    var partialPath = Path.Combine([.. parts[..i]]);
                    folders.Add(new NamedFolder
                    {
                        Folder = new Directory(partialPath),
                        Name = parts[i - 1],
                    });
                }
            }
            catch (DirectoryNotFoundException) { }

            for (; i <= parts.Count; i++)
            {
                var child = await folders[^1].Folder
                    .OpenFile(parts[i - 1], progress, ct)
                    .Decode(progress, ct);
                if (child is IFolder subfolder)
                {
                    folders.Add(new NamedFolder
                    {
                        Folder = subfolder,
                        Name = parts[i - 1],
                    });
                }
                else
                {
                    child.Dispose();
                    throw new IOException($"'{parts[i - 1]}' is not a folder.");
                }
            }

            return folders;
        }
        catch
        {
            folders.Dispose();
            throw;
        }
    }

    public static async Task PropagateModifications(
        IList<NamedFolder> hierarchy,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        for (int i = hierarchy.Count - 2; i >= 0; i--)
        {
            var child = hierarchy[i + 1];
            var parent = hierarchy[i];
            var childStream = ((IFile)child.Folder).Stream;
            if (parent.Folder is Directory directory)
            {
                await directory.WriteFile(
                    child.Name,
                    childStream,
                    progress,
                    ct);
                return;
            }
            else
            {
                using var contents = await parent.Folder.GetContents(progress, ct);
                var newContents = contents.ToDictionary();
                newContents[child.Name] = childStream;
                hierarchy[i] = new NamedFolder
                {
                    Folder = ((IArchive)parent.Folder).Create(newContents),
                    Name = parent.Name,
                };
            }
        }
    }

    public static async Task<BinaryStream> ReadFile(
        string path,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var parts = SplitPath(path);
        var folderPath = Path.Combine([.. parts[..^1]]);
        using var folders = await OpenFolderHierarchy(folderPath, progress, ct);
        return await folders[^1].Folder.OpenFile(parts[^1], progress, ct);
    }

    public static async Task<DisposingDictionary<string, BinaryStream>> ReadFiles(
        IEnumerable<string> paths,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        // TODO: optimize when source are from the same folder
        var streams = new DisposingDictionary<string, BinaryStream>();
        try
        {
            foreach (var path in paths)
            {
                var filename = SplitPath(path)[^1];
                streams.Add(
                    filename,
                    await ReadFile(path, progress, ct));
            }
            return streams;
        }
        catch
        {
            streams.Dispose();
            throw;
        }
    }

    public static async Task WriteFile(
        string path,
        BinaryStream stream,
        OverwriteMode overwriteMode = OverwriteMode.Throw,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var parts = SplitPath(path);
        var folderPath = Path.Combine([.. parts[..^1]]);
        using var folders = await OpenFolderHierarchy(folderPath, progress, ct);
        await Insert(
            folders,
            new Dictionary<string, BinaryStream> { { parts[^1], stream } },
            overwriteMode,
            progress,
            ct);
    }

    public static async Task<IArchive> ModifyFolder(
        IArchive folder,
        Action<IDictionary<string, BinaryStream>> modify,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var contents = await folder.GetContents(progress, ct);
        try
        {
            modify(contents);
            return folder.Create(contents);
        }
        catch
        {
            contents.Dispose();
            throw;
        }
    }

    public static Task<IArchive> Rename(
        IArchive folder,
        string oldChildName,
        string newChildName,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        return ModifyFolder(folder, contents =>
        {
            if (!contents.TryGetValue(oldChildName, out var stream))
            {
                throw new FileNotFoundException("File not found.", oldChildName);
            }
            else if (oldChildName != newChildName)
            {
                contents[newChildName] = stream;
                contents.Remove(oldChildName);
            }
        }, progress, ct);
    }

    public static async Task Rename(
        IList<NamedFolder> hierarchy,
        string oldChildName,
        string newChildName,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var dst = hierarchy[^1].Folder;
        if (dst is Directory directory)
        {
            var fileInfo = directory.ListFiles()
                .FirstOrDefault(fi => fi.Filename == oldChildName)
                ?? throw new FileNotFoundException("File not found.", oldChildName);
            if (oldChildName == newChildName)
            {
                return;
            } else if (fileInfo.IsDirectory)
            {
                System.IO.Directory.Move(
                    Path.Combine(directory.FullPath, oldChildName),
                    Path.Combine(directory.FullPath, newChildName));
            }
            else
            {
                File.Move(
                    Path.Combine(directory.FullPath, oldChildName),
                    Path.Combine(directory.FullPath, newChildName));
            }
        }
        else
        {
            var rebuilt = await Rename(
                (IArchive)dst,
                oldChildName,
                newChildName,
                progress,
                ct);
            hierarchy[^1] = hierarchy[^1] with
            {
                Folder = rebuilt,
            };
            await PropagateModifications(hierarchy, progress, ct);
        }
    }

    private static Task<IArchive> Delete(
        IArchive folder,
        IEnumerable<string> childNames,
        IProgress<TaskProgressInfo>? progress = null,
                             CancellationToken ct = default)
    {
        return ModifyFolder(folder, contents =>
        {
            foreach (var childName in childNames)
            {
                if (!contents.Remove(childName))
                {
                    throw new FileNotFoundException("File not found.", childName);
                }
            }
        }, progress, ct);
    }

    public static async Task Delete(
        IList<NamedFolder> hierarchy,
        IEnumerable<string> childNames,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var dst = hierarchy[^1].Folder;
        if (dst is Directory directory)
        {
            foreach (var childName in childNames)
            {
                var fileInfo = directory.ListFiles()
                    .FirstOrDefault(fi => fi.Filename == childName)
                    ?? throw new FileNotFoundException("File not found.", childName);
                if (fileInfo.IsDirectory)
                {
                    System.IO.Directory.Delete(
                        Path.Combine(directory.FullPath, childName),
                        true);
                }
                else
                {
                    File.Delete(Path.Combine(directory.FullPath, childName));
                }
            }
        }
        else
        {
            var rebuilt = await Delete(
                (IArchive)dst,
                childNames,
                progress,
                ct);
            hierarchy[^1] = hierarchy[^1] with
            {
                Folder = rebuilt,
            };
            await PropagateModifications(hierarchy, progress, ct);
        }
    }

    public static async Task<IArchive> Insert(
        IArchive folder,
        IDictionary<string, BinaryStream> streams,
        OverwriteMode overwriteMode = OverwriteMode.Throw,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        return await ModifyFolder(folder, contents =>
        {
            var existing = contents.Keys;
            foreach (var (name, stream) in streams)
            {
                switch (overwriteMode)
                {
                    case OverwriteMode.Throw:
                        if (contents.ContainsKey(name))
                        {
                            throw new IOException($"File '{name}' already exists.");
                        }
                        contents[name] = stream;
                        break;
                    case OverwriteMode.Overwrite:
                        contents[name] = stream;
                        break;
                    case OverwriteMode.Rename:
                        contents[AlternativeName(name, existing)] = stream;
                        break;
                    case OverwriteMode.Skip:
                        if (!contents.ContainsKey(name))
                        {
                            contents[name] = stream;
                        }
                        break;
                    default:
                        throw new ArgumentException("Invalid overwrite mode.", nameof(overwriteMode));
                }
            }
        }, progress, ct);
    }

    public static async Task Insert(
        IList<NamedFolder> hierarchy,
        IDictionary<string, BinaryStream> streams,
        OverwriteMode overwriteMode = OverwriteMode.Throw,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var dst = hierarchy[^1].Folder;
        if (dst is Directory directory)
        {
            var existing = directory
                .ListFiles()
                .ConvertAll(fi => fi.Filename);
            foreach (var (name, stream) in streams)
            {
                switch (overwriteMode)
                {
                    case OverwriteMode.Throw:
                        if (existing.Contains(name))
                        {
                            throw new IOException($"File '{name}' already exists.");
                        }
                        await directory.WriteFile(name, stream, progress, ct);
                        break;
                    case OverwriteMode.Overwrite:
                        await directory.WriteFile(name, stream, progress, ct);
                        break;
                    case OverwriteMode.Rename:
                        var altName = AlternativeName(name, existing);
                        await directory.WriteFile(altName, stream, progress, ct);
                        break;
                    case OverwriteMode.Skip:
                        if (!existing.Contains(name))
                        {
                            await directory.WriteFile(name, stream, progress, ct);
                        }
                        break;
                    default:
                        throw new ArgumentException("Invalid overwrite mode.", nameof(overwriteMode));
                }
            }
        }
        else
        {
            var rebuilt = await Insert(
                (IArchive)dst,
                streams,
                overwriteMode,
                progress,
                ct);
            hierarchy[^1] = hierarchy[^1] with
            {
                Folder = rebuilt,
            };
            await PropagateModifications(hierarchy, progress, ct);
        }
    }

    public static async Task Copy(
        string src,
        string dst,
        OverwriteMode overwriteMode = OverwriteMode.Throw,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var stream = await ReadFile(src, progress, ct);
        await WriteFile(dst, stream, overwriteMode, progress, ct);
    }

    public static async Task<HashSet<string>> RecursiveExtract(
        IFolder folder,
        string dst,
        Regex pattern,
        OverwriteMode overwriteMode = OverwriteMode.Throw,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var extracted = new HashSet<string>();
        System.IO.Directory.CreateDirectory(dst);
        foreach (var fileInfo in folder.ListFiles())
        {
            using var file = await folder.OpenFile(fileInfo.Filename, progress, ct)
                .DecodeWithHint(
                    fileInfo.Filename,
                    progress,
                    ct,
                    requiredHintConfidence: DecodeConfidence.Low); // Speed things up
            if (file is IFolder subfolder)
            {
                var subextracted = await RecursiveExtract(
                    subfolder,
                    Path.Combine(dst, fileInfo.Filename),
                    pattern,
                    overwriteMode,
                    progress,
                    ct);
                extracted.UnionWith(subextracted
                    .Select(f => Path.Combine(fileInfo.Filename, f)));
            }
            else if (pattern.IsMatch(fileInfo.Filename))
            {
                await WriteFile(
                    Path.Combine(dst, fileInfo.Filename),
                    file.Stream,
                    overwriteMode,
                    progress,
                    ct);
                extracted.Add(fileInfo.Filename);
            }
        }
        return extracted;
    }

    public static List<string> SplitPath(string path)
    {
        var parts = new List<string>();
        DirectoryInfo? current = new(path);
        do
        {
            parts.Add(current.Name);
            current = current.Parent;
        } while (current != null);
        parts.Reverse();
        return parts;
    }

    public static string AlternativeName(string name, IEnumerable<string> existingNames)
    {
        var baseName = Path.GetFileNameWithoutExtension(name);
        var ext = Path.GetExtension(name);
        var i = 1;
        while (existingNames.Contains(name))
        {
            name = $"{baseName} ({i++}){ext}";
        }
        return name;
    }
}
