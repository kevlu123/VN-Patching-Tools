using DokanNet;
using DokanNet.Logging;
using System.Security.AccessControl;
using Ws2Explorer.HighLevel;

namespace Ws2Explorer.Dokan;

class FS : IDokanOperations
{
    private const string DATA_PREFIX = "@";

    private readonly ILogger logger;
    private readonly DisposingList<NamedFolder> folderStack;
    private readonly Dictionary<string, IFile> cache = [];
    private readonly object mutex = new();

    private IFile GetFile(string fileName, out bool isDirectory)
    {
        bool forceData = fileName.Contains(DATA_PREFIX);
        if (forceData)
        {
            fileName = fileName.Replace(DATA_PREFIX, "");
        }
        var parts = fileName.Split('\\', StringSplitOptions.RemoveEmptyEntries)
            .ToList();
        lock (mutex)
        {
            for (int i = 0; i < parts.Count; i++)
            {
                var parentPartialPath = string.Join('\\', parts.Take(i));
                var partialPath = string.Join('\\', parts.Take(i + 1));
                if (!cache.ContainsKey(partialPath))
                {
                    var parent = (IFolder)cache[parentPartialPath];
                    var file = parent.OpenFile(parts[i]).Result
                        .DecodeWithHint(parts[i]).Result;
                    cache[partialPath] = file;
                }
            }
            var ret = cache[string.Join('\\', parts)];
            isDirectory = !forceData && ret is IFolder;
            return ret;
        }
    }

    public FS(string archivePath, ILogger logger)
    {
        this.logger = logger;
        folderStack = FileTool.OpenFolderHierarchy(archivePath).Result;
        cache.Add(string.Empty, (IFile)folderStack[^1].Folder);
    }

    public void Cleanup(string fileName, IDokanFileInfo info)
    {
    }

    public void CloseFile(string fileName, IDokanFileInfo info)
    {
    }

    public NtStatus CreateFile(string fileName, DokanNet.FileAccess access, FileShare share, FileMode mode, FileOptions options, FileAttributes attributes, IDokanFileInfo info)
    {
        try
        {
            var file = GetFile(fileName, out var isDir);
            info.IsDirectory = isDir;
            return DokanResult.Success;
        }
        catch (Exception ex)
        {
            logger.Error($"Failed to open file {fileName}: {ex.Message}");
            return DokanResult.FileNotFound;
        }
    }

    public NtStatus DeleteDirectory(string fileName, IDokanFileInfo info)
    {
        return DokanResult.NotImplemented;
    }

    public NtStatus DeleteFile(string fileName, IDokanFileInfo info)
    {
        return DokanResult.NotImplemented;
    }

    public NtStatus FindFiles(string fileName, out IList<FileInformation> files, IDokanFileInfo info)
    {
        try
        {
            var folder = (IFolder)GetFile(fileName, out _);
            files = folder.ListFiles()
                .SelectMany(f => new[] {
                    new FileInformation
                    {
                        FileName = f.Filename,
                        Attributes = FileAttributes.Directory,
                    },
                    new FileInformation
                    {
                        FileName = DATA_PREFIX + f.Filename,
                        Length = f.FileSize ?? 0,
                        Attributes = FileAttributes.Normal,
                    },
                })
                .ToList();
            return DokanResult.Success;
        }
        catch (Exception ex)
        {
            logger.Error($"Failed to list files in {fileName}: {ex.Message}");
            files = new List<FileInformation>();
            return DokanResult.FileNotFound;
        }
    }

    public NtStatus FindFilesWithPattern(string fileName, string searchPattern, out IList<FileInformation> files, IDokanFileInfo info)
    {
        // Not used. Uses FindFiles instead.
        files = new List<FileInformation>();
        return DokanResult.NotImplemented;
    }

    public NtStatus FindStreams(string fileName, out IList<FileInformation> streams, IDokanFileInfo info)
    {
        streams = new List<FileInformation>();
        return DokanResult.NotImplemented;
    }

    public NtStatus FlushFileBuffers(string fileName, IDokanFileInfo info)
    {
        return DokanResult.Success;
    }

    public NtStatus GetDiskFreeSpace(out long freeBytesAvailable, out long totalNumberOfBytes, out long totalNumberOfFreeBytes, IDokanFileInfo info)
    {
        freeBytesAvailable = long.MaxValue;
        totalNumberOfBytes = long.MaxValue;
        totalNumberOfFreeBytes = long.MaxValue;
        return DokanResult.Success;
    }

    public NtStatus GetFileInformation(string fileName, out FileInformation fileInfo, IDokanFileInfo info)
    {
        try
        {
            var file = GetFile(fileName, out var isDir);
            fileInfo = new FileInformation()
            {
                FileName = fileName,
                Attributes = isDir ? FileAttributes.Directory : FileAttributes.Normal,
                Length = file.Stream.Length,
            };
            return DokanResult.Success;
        }
        catch (Exception ex)
        {
            logger.Error($"Failed to get file information for {fileName}: {ex.Message}");
            fileInfo = new FileInformation();
            return DokanResult.FileNotFound;
        }
    }

    public NtStatus GetFileSecurity(string fileName, out FileSystemSecurity security, AccessControlSections sections, IDokanFileInfo info)
    {
        security = null!;
        return DokanResult.NotImplemented;
    }

    public NtStatus GetVolumeInformation(out string volumeLabel, out FileSystemFeatures features, out string fileSystemName, out uint maximumComponentLength, IDokanFileInfo info)
    {
        volumeLabel = "Ws2Explorer";
        features = FileSystemFeatures.CasePreservedNames
            | FileSystemFeatures.CaseSensitiveSearch
            | FileSystemFeatures.UnicodeOnDisk;
        fileSystemName = "Ws2Explorer";
        maximumComponentLength = 255;
        return DokanResult.Success;
    }

    public NtStatus LockFile(string fileName, long offset, long length, IDokanFileInfo info)
    {
        return DokanResult.Success;
    }

    public NtStatus Mounted(string mountPoint, IDokanFileInfo info)
    {
        return DokanResult.Success;
    }

    public NtStatus MoveFile(string oldName, string newName, bool replace, IDokanFileInfo info)
    {
        return DokanResult.NotImplemented;
    }

    public NtStatus ReadFile(string fileName, byte[] buffer, out int bytesRead, long offset, IDokanFileInfo info)
    {
        try
        {
            var file = GetFile(fileName, out _);
            bytesRead = checked((int)Math.Min(buffer.Length, file.Stream.Length - offset));
            file.Stream.Span.Slice(checked((int)offset), bytesRead).CopyTo(buffer);
            return DokanResult.Success;
        }
        catch (Exception ex)
        {
            logger.Error($"Failed to read file {fileName}: {ex.Message}");
            bytesRead = 0;
            return DokanResult.FileNotFound;
        }
    }

    public NtStatus SetAllocationSize(string fileName, long length, IDokanFileInfo info)
    {
        return DokanResult.NotImplemented;
    }

    public NtStatus SetEndOfFile(string fileName, long length, IDokanFileInfo info)
    {
        return DokanResult.NotImplemented;
    }

    public NtStatus SetFileAttributes(string fileName, FileAttributes attributes, IDokanFileInfo info)
    {
        return DokanResult.Success;
    }

    public NtStatus SetFileSecurity(string fileName, FileSystemSecurity security, AccessControlSections sections, IDokanFileInfo info)
    {
        return DokanResult.Success;
    }

    public NtStatus SetFileTime(string fileName, DateTime? creationTime, DateTime? lastAccessTime, DateTime? lastWriteTime, IDokanFileInfo info)
    {
        return DokanResult.Success;
    }

    public NtStatus UnlockFile(string fileName, long offset, long length, IDokanFileInfo info)
    {
        return DokanResult.Success;
    }

    public NtStatus Unmounted(IDokanFileInfo info)
    {
        return DokanResult.Success;
    }

    public NtStatus WriteFile(string fileName, byte[] buffer, out int bytesWritten, long offset, IDokanFileInfo info)
    {
        bytesWritten = 0;
        return DokanResult.NotImplemented;
    }
}
