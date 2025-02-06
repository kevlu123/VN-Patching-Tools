using System.Security.Cryptography;
using System.Text.RegularExpressions;
using Directory = Ws2Explorer.FileTypes.Directory;

namespace Ws2Explorer.HighLevel;

/// <summary>
/// Utilities for file operations.
/// </summary>
public static class FileTool
{
    /// <summary>
    /// Opens a list of folders from a path.
    /// The path may point inside archives.
    /// The first folder is the root directory and
    /// the next folders are direct subfolders of the previous folder.
    /// This is useful for navigation, and for operations need to propagate
    /// changes back to the real filesystem (rather than staying in memory).
    /// </summary>
    /// <param name="path"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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

    /// <summary>
    /// Propagates modifications in the last folder to the parent folders,
    /// moving up the hierarchy until a real directory is reached
    /// (where the changes are written to the filesystem).
    /// </summary>
    /// <param name="hierarchy">
    /// The input folder hierarchy.
    /// After the operation, this list is modified to contain the updated folders.
    /// </param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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
                using var contents = await parent.Folder.LoadAllStreams(progress, ct);
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

    /// <summary>
    /// Reads the data from a path.
    /// The path may point inside archives.
    /// </summary>
    /// <param name="path"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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

    /// <summary>
    /// Batch reads data from multiple paths.
    /// The paths may point inside archives.
    /// </summary>
    /// <param name="paths"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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

    /// <summary>
    /// Writes data to a path.
    /// The path may point inside archives.
    /// </summary>
    /// <param name="path"></param>
    /// <param name="stream"></param>
    /// <param name="overwriteMode">The policy used when writing to a file that already exists.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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

    /// <summary>
    /// Modifies an archive.
    /// </summary>
    /// <param name="archive">The archive to modify.</param>
    /// <param name="modify">
    /// The function to modify the contents of the archive.
    /// The dictionary parameter receives the subfiles in the
    /// archive. This dictionary is to be modified.
    /// </param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The modified archive.</returns>
    public static Task<IArchive> ModifyFolder(
        IArchive archive,
        Action<IDictionary<string, BinaryStream>> modify,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        return ModifyFolder(archive, contents =>
        {
            modify(contents);
            return Task.CompletedTask;
        }, progress, ct);
    }

    /// <summary>
    /// Modifies an archive.
    /// </summary>
    /// <param name="archive">The archive to modify.</param>
    /// <param name="modify">
    /// The awaitable function to modify the contents of the archive.
    /// The dictionary parameter receives the subfiles in the
    /// archive. This dictionary is to be modified.
    /// </param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The modified archive.</returns>
    public static async Task<IArchive> ModifyFolder(
        IArchive archive,
        Func<IDictionary<string, BinaryStream>, Task> modify,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var contents = await archive.LoadAllStreams(progress, ct);
        try
        {
            await modify(contents);
            return archive.Create(contents);
        }
        catch
        {
            contents.Dispose();
            throw;
        }
    }

    /// <summary>
    /// Renames a subfile in an archive.
    /// </summary>
    /// <param name="archive">The archive to modify.</param>
    /// <param name="oldName">The subfile to rename.</param>
    /// <param name="newName">The new name of the subfile.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The modified archive.</returns>
    public static Task<IArchive> Rename(
        IArchive archive,
        string oldName,
        string newName,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        return ModifyFolder(archive, contents =>
        {
            if (!contents.TryGetValue(oldName, out var stream))
            {
                throw new FileNotFoundException("File not found.", oldName);
            }
            else if (oldName != newName)
            {
                contents[newName] = stream;
                contents.Remove(oldName);
            }
        }, progress, ct);
    }

    /// <summary>
    /// Renames a subfile in a folder and propagates the changes
    /// up the hierarchy.
    /// </summary>
    /// <param name="hierarchy">
    /// The hierarchy that the changes will propagate through.
    /// The last folder will have the file renamed.
    /// </param>
    /// <param name="oldName">The subfile to rename.</param>
    /// <param name="newName">The new name of the subfile.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public static async Task Rename(
        IList<NamedFolder> hierarchy,
        string oldName,
        string newName,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var dst = hierarchy[^1].Folder;
        if (dst is Directory directory)
        {
            var fileInfo = directory.ListFiles()
                .FirstOrDefault(fi => fi.Filename == oldName)
                ?? throw new FileNotFoundException("File not found.", oldName);
            if (oldName == newName)
            {
                return;
            } else if (fileInfo.IsDirectory)
            {
                System.IO.Directory.Move(
                    Path.Combine(directory.FullPath, oldName),
                    Path.Combine(directory.FullPath, newName));
            }
            else
            {
                File.Move(
                    Path.Combine(directory.FullPath, oldName),
                    Path.Combine(directory.FullPath, newName));
            }
        }
        else
        {
            var rebuilt = await Rename(
                (IArchive)dst,
                oldName,
                newName,
                progress,
                ct);
            hierarchy[^1] = hierarchy[^1] with
            {
                Folder = rebuilt,
            };
            await PropagateModifications(hierarchy, progress, ct);
        }
    }

    /// <summary>
    /// Deletes subfiles from an archive.
    /// </summary>
    /// <param name="archive">The archive to modify.</param>
    /// <param name="names">The subfiles to delete.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The modified archive.</returns>
    private static Task<IArchive> Delete(
        IArchive archive,
        IEnumerable<string> names,
        IProgress<TaskProgressInfo>? progress = null,
                             CancellationToken ct = default)
    {
        return ModifyFolder(archive, contents =>
        {
            foreach (var name in names)
            {
                if (!contents.Remove(name))
                {
                    throw new FileNotFoundException("File not found.", name);
                }
            }
        }, progress, ct);
    }

    /// <summary>
    /// Deletes subfiles from a folder and propagates the changes
    /// up the hierarchy.
    /// </summary>
    /// <param name="hierarchy">
    /// The hierarchy that the changes will propagate through.
    /// The last folder will have the subfiles deleted.
    /// </param>
    /// <param name="names">The subfiles to delete.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public static async Task Delete(
        IList<NamedFolder> hierarchy,
        IEnumerable<string> names,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var dst = hierarchy[^1].Folder;
        if (dst is Directory directory)
        {
            foreach (var name in names)
            {
                var fileInfo = directory.ListFiles()
                    .FirstOrDefault(fi => fi.Filename == name)
                    ?? throw new FileNotFoundException("File not found.", name);
                if (fileInfo.IsDirectory)
                {
                    System.IO.Directory.Delete(
                        Path.Combine(directory.FullPath, name),
                        true);
                }
                else
                {
                    File.Delete(Path.Combine(directory.FullPath, name));
                }
            }
        }
        else
        {
            var rebuilt = await Delete(
                (IArchive)dst,
                names,
                progress,
                ct);
            hierarchy[^1] = hierarchy[^1] with
            {
                Folder = rebuilt,
            };
            await PropagateModifications(hierarchy, progress, ct);
        }
    }

    /// <summary>
    /// Inserts subfiles into an archive.
    /// </summary>
    /// <param name="archive">The archive to modify/</param>
    /// <param name="streams">A map of the new files to insert.</param>
    /// <param name="overwriteMode">The policy used when writing to a file that already exists.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The modified archive.</returns>
    public static async Task<IArchive> Insert(
        IArchive archive,
        IDictionary<string, BinaryStream> streams,
        OverwriteMode overwriteMode = OverwriteMode.Throw,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        return await ModifyFolder(archive, contents =>
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

    /// <summary>
    /// Inserts subfiles into a folder and propagates the changes
    /// up the hierarchy.
    /// </summary>
    /// <param name="hierarchy">The hierarchy that the changes will propagate through.</param>
    /// <param name="streams">A map of the new files to insert.</param>
    /// <param name="overwriteMode">The policy used when writing to a file that already exists.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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

    /// <summary>
    /// Copies a file from a source path to a destination path.
    /// The paths may point inside archives.
    /// </summary>
    /// <param name="src"></param>
    /// <param name="dst"></param>
    /// <param name="overwriteMode">The policy used when writing to a file that already exists.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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

    /// <summary>
    /// Recursively extracts all files matching a pattern from a folder
    /// to a destination path.
    /// The path may point inside archives.
    /// </summary>
    /// <param name="folder"></param>
    /// <param name="dst"></param>
    /// <param name="pattern">The pattern to match.</param>
    /// <param name="overwriteMode">The policy used when writing to a file that already exists.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>
    /// The paths of the extracted files relative to the source folder.
    /// </returns>
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

    /// <summary>
    /// Compares the subfiles in two archives.
    /// If a subfile appears twice in the same set, the result is unspecified.
    /// </summary>
    /// <param name="oldArchive"></param>
    /// <param name="newArchive"></param>
    /// <param name="partitionMode">Flags listing the category of files to be returned.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public static async Task<DisposingDictionary<string, BinaryStream>> Diff(
        IFolder oldArchive,
        IFolder newArchive,
        DiffPartitionMode partitionMode,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        return await Diff(
            [oldArchive],
            [newArchive],
            partitionMode,
            progress,
            ct);
    }

    /// <summary>
    /// Compares the subfiles in two sets of archives.
    /// If a subfile appears twice in the same set, the result is unspecified.
    /// </summary>
    /// <param name="oldArchives"></param>
    /// <param name="newArchives"></param>
    /// <param name="partitionMode">Flags listing the category of files to be returned.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public static async Task<DisposingDictionary<string, BinaryStream>> Diff(
        IEnumerable<IFolder> oldArchives,
        IEnumerable<IFolder> newArchives,
        DiffPartitionMode partitionMode,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        static string Hash(BinaryStream stream)
        {
            return Convert.ToHexString(SHA1.HashData(stream.Span));
        }

        var oldSeen = new Dictionary<string, string>();
        foreach (var oldArchive in oldArchives)
        {
            using var contents = await oldArchive.LoadAllStreams(progress, ct);
            foreach (var (name, content) in contents)
            {
                oldSeen[name] = Hash(content);
            }
        }

        var newSeen = new HashSet<string>();
        using var @new = new DisposingDictionary<string, BinaryStream>();
        using var old = new DisposingDictionary<string, BinaryStream>();
        using var common = new DisposingDictionary<string, BinaryStream>();
        using var changed = new DisposingDictionary<string, BinaryStream>();
        foreach (var newArchive in newArchives)
        {
            using var contents = await newArchive.LoadAllStreams(progress, ct);
            foreach (var (name, content) in contents)
            {
                newSeen.Add(name);
                if (oldSeen.TryGetValue(name, out var oldHash))
                {
                    if (Hash(content) == oldHash)
                    {
                        if (partitionMode.HasFlag(DiffPartitionMode.Common))
                        {
                            content.IncRef();
                            common[name] = content;
                        }
                    }
                    else if (partitionMode.HasFlag(DiffPartitionMode.Changed))
                    {
                        content.IncRef();
                        changed[name] = content;
                    }
                }
                else if (partitionMode.HasFlag(DiffPartitionMode.New))
                {
                    content.IncRef();
                    @new[name] = content;
                }
            }
        }

        if (partitionMode.HasFlag(DiffPartitionMode.Old))
        {
            foreach (var (name, oldHash) in oldSeen)
            {
                if (!newSeen.Contains(name))
                {
                    foreach (var oldArchive in oldArchives)
                    {
                        if (oldArchive.ListFiles().Any(f => f.Filename == name))
                        {
                            var content = await oldArchive.OpenFile(name, progress, ct);
                            content.IncRef();
                            old[name] = content;
                            goto next;
                        }
                    }
                    throw new InvalidOperationException("IFolder.ListFiles has changed.");
                next:;
                }
            }
        }

        return new[] { @new, old, common, changed }
            .SelectMany(x => x)
            .ToDisposingDictionary();
    }

    /// <summary>
    /// Splits a path into its parts.
    /// </summary>
    /// <param name="path"></param>
    /// <returns></returns>
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

    /// <summary>
    /// Generates an alternative name for a file that does not conflict with existing names.
    /// </summary>
    /// <param name="name"></param>
    /// <param name="existingNames"></param>
    /// <returns></returns>
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
