using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Text;
using NamedFolder = Ws2Explorer.FileHelper.Named<Ws2Explorer.IFolder>;
using OverwriteMode = Ws2Explorer.FileHelper.OverwriteMode;

namespace Ws2Explorer.Gui;

class ApplicationState
{
    private const string CONFIG_FILENAME = "config.json";

    private readonly string? openPath;
    private int currentTaskId;
    private readonly Progress<TaskProgressInfo> progress;
    private readonly Config config;
    private readonly DisposingList<NamedFolder> folderStack = [];
    private SelectedFile? selectedFile;
    private SelectedFile? selectedFileNonParent;
    private List<FileInfo> fileList = [];
    private List<int> selectedIndices = [];
    private bool showEmptyPnaFiles = true;
    private readonly Stack<string> backHistory = [];
    private readonly Stack<string> forwardHistory = [];

    public IProgress<TaskProgressInfo>? Progress { get; set; }
    public Action<Exception>? OnError { get; set; }
    public Action<string>? OnInfo { get; set; }
    public Action<string>? OnStatus { get; set; }
    public Action<ReadOnlyCollection<FileInfo>>? OnFileList { get; set; }
    public Action<string>? OnPathText { get; set; }
    public Action<string>? OnFileCaption { get; set; }
    public Action<BinaryStream>? OnPreviewBinary { get; set; }
    public Action<BinaryStream>? OnPreviewPng { get; set; }
    public Action<BinaryStream>? OnPreviewOgg { get; set; }
    public Action<BinaryStream>? OnPreviewFont { get; set; }
    public Action<string>? OnPreviewText { get; set; }

    public EditorSettings EditorSettings
    {
        get
        {
            return new EditorSettings
            {
                TextEditorPath = config.TextEditorPath,
                TextEditorArgs = config.TextEditorArgs,
                ImageEditorPath = config.ImageEditorPath,
                ImageEditorArgs = config.ImageEditorArgs,
                HexEditorPath = config.HexEditorPath,
                HexEditorArgs = config.HexEditorArgs,
            };
        }
        set
        {
            config.TextEditorPath = value.TextEditorPath;
            config.TextEditorArgs = value.TextEditorArgs;
            config.ImageEditorPath = value.ImageEditorPath;
            config.ImageEditorArgs = value.ImageEditorArgs;
            config.HexEditorPath = value.HexEditorPath;
            config.HexEditorArgs = value.HexEditorArgs;
        }
    }

    public ApplicationState(string? openPath)
    {
        progress = new Progress<TaskProgressInfo>(info =>
        {
            if (info.Value <= 0)
            {
                currentTaskId = info.Id;
            }
            else if (info.Id != currentTaskId)
            {
                return;
            }
            Progress?.Report(info);
        });

        var module = Process.GetCurrentProcess().MainModule;
        var exeFolder = module == null ? null : Path.GetDirectoryName(module.FileName);
        var configPath = Path.Combine(exeFolder ?? string.Empty, CONFIG_FILENAME);
        config = Config.Load(configPath);

        this.openPath = openPath ?? exeFolder;
    }

    public void Init()
    {
        if (openPath != null)
        {
            OpenPath(openPath);
        }
    }

    public void Close()
    {
        config.Save();
    }

    // Staticness is implementation detail
    [SuppressMessage("Performance", "CA1822:Mark members as static", Justification = "<Pending>")]
    public void CancelTask()
    {
        TaskLock.Cancel();
    }

    public void OpenPath(string path)
    {
        Protect(interruptable: false, async ct =>
        {
            await OpenPathInternal(path, ct);
            PushHistory();
        });
    }

    private async Task OpenPathInternal(string path, CancellationToken ct)
    {
        var hierarchy = await FileHelper.OpenFolderHierarchy(
            path,
            progress,
            ct);
        folderStack.Clear();
        folderStack.AddRange(hierarchy);
        UpdateFileListInternal();
    }

    public void SelectFiles(IEnumerable<int> indices)
    {
        Protect(interruptable: true, async ct =>
        {
            selectedIndices = indices.ToList();
            if (selectedIndices.Count == 0)
            {
                await SetSelectedFileInternal(null, ct);
            }
            else if (selectedIndices.Count == 1)
            {
                await SelectSingleFileInternal(selectedIndices[0], ct);
            }
        });
    }

    private async Task SelectSingleFileInternal(int index, CancellationToken ct)
    {
        await SetSelectedFileInternal(index, ct);
        var description = selectedFile switch
        {
            null => string.Empty,
            { File: null } => "DIRECTORY",
            { File: IFile file } => GetFileShortDescription(file),
        };

        if (ct.IsCancellationRequested)
        {
            return;
        }

        OnFileCaption?.Invoke(description);
        switch (selectedFile?.File)
        {
            case PngFile png:
                OnPreviewPng?.Invoke(png.Stream);
                break;
            case OggFile ogg:
                OnPreviewOgg?.Invoke(ogg.Stream);
                break;
            case TtfFile ttf:
                OnPreviewFont?.Invoke(ttf.Stream);
                break;
            case OtfFile otf:
                OnPreviewFont?.Invoke(otf.Stream);
                break;
            case TextFile text:
                OnPreviewText?.Invoke(text.Text);
                break;
            case IFile file:
                OnPreviewBinary?.Invoke(file.Stream);
                break;
        }
    }

    public void OpenSelectedFolder(int index)
    {
        Protect(interruptable: false, async ct =>
        {
            await SetSelectedFileInternal(index, ct);
            if (selectedFile == null)
            {
                throw new SilentError("No folder selected.");
            }
            var name = selectedFile.Info.Filename;
            if (name == "..")
            {
                // Go up a directory
                folderStack.Pop();
            }
            else if (selectedFile.File == null)
            {
                // Open real directory
                folderStack.Add(new NamedFolder
                {
                    Value = folderStack[^1].Value.OpenFolder(name),
                    Name = name,
                });
            }
            else if (selectedFile.File is IFolder subfolder)
            {
                // Open virtual directory
                folderStack.Add(new NamedFolder
                {
                    Value = subfolder,
                    Name = name,
                });
            }
            else
            {
                throw new SilentError($"'{name}' is not a folder.");
            }
            UpdateFileListInternal();
            PushHistory();
        });
    }

    public void OpenArchiveAs<T>(int index)
        where T : class, IArchive<T>
    {
        Protect(interruptable: false, async ct =>
        {
            await SetSelectedFileInternal(index, ct);
            if (selectedFileNonParent?.File == null)
            {
                throw new SilentError("No folder selected.");
            }

            var folder = await selectedFileNonParent.File.Stream
                .ToDataFile<T>(progress, decRef: false);
            folderStack.Add(new NamedFolder
            {
                Value = folder,
                Name = selectedFileNonParent.Info.Filename,
            });
            UpdateFileListInternal();
            PushHistory();
        });
    }

    public void CreateArchive<T>(string dst)
        where T : class, IArchive<T>
    {
        Protect(interruptable: false, async ct =>
        {
            using var streams = new DisposingList<BinaryStream>();
            var filenames = GetSelectedFilenames();
            var folder = folderStack[^1].Value;
            foreach (var filename in filenames)
            {
                streams.Add(await folder.OpenFile(
                    filename,
                    progress,
                    ct));
            }
            using var archive = T.Create(filenames.Zip(streams).ToDictionary());
            await using var dstStream = File.Create(dst);
            await archive.Stream.CopyTo(dstStream, dst, progress, ct);
        });
    }

    public void CreateNewFile(string filename)
    {
        Protect(interruptable: false, async ct =>
        {
            await FileHelper.Insert(
                folderStack,
                new Dictionary<string, BinaryStream> { { filename, BinaryStream.Empty } },
                OverwriteMode.Throw,
                progress,
                ct);
            await RefreshFolderInternal(ct);
        });
    }

    public void OpenParentFolder()
    {
        ProtectSync(() =>
        {
            if (folderStack.Count <= 1)
            {
                throw new SilentError("Already at root directory.");
            }
            folderStack.Pop();
            UpdateFileListInternal();
            PushHistory();
        });
    }

    public void RefreshFolder()
    {
        Protect(interruptable: false, RefreshFolderInternal);
    }

    private async Task RefreshFolderInternal(CancellationToken ct)
    {
        await OpenPathInternal(GetCurrentFolderPath(), ct);
    }

    public void ShowFileMetadata()
    {
        ProtectSync(() =>
        {
            if (selectedFile != null)
            {
                if (selectedFile.File != null)
                {
                    OnInfo?.Invoke(GetFileLongDescription(selectedFile.File));
                }
                else
                {
                    OnInfo?.Invoke("Directory");
                }
            }
        });
    }

    public void RenameFile(Func<string, string> renamePrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            var selectedFilenames = GetSelectedFilenames();
            if (selectedFilenames.Count != 1)
            {
                throw new SilentError("Select exactly one file to rename.");
            }
            var oldName = selectedFilenames[0];
            var newName = renamePrompt(oldName);
            await FileHelper.Rename(
                folderStack,
                oldName,
                newName,
                progress,
                ct);
            await RefreshFolderInternal(ct);
        });
    }

    public void DeleteSelectedFiles(Func<IEnumerable<string>, bool> deletePrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            var paths = GetSelectedFilenames();
            if (paths.Count == 0)
            {
                throw new SilentError("No files selected.");
            }
            if (deletePrompt(paths))
            {
                await FileHelper.Delete(
                    folderStack,
                    paths,
                    progress,
                    ct);
                await RefreshFolderInternal(ct);
            }
        });
    }

    public void CopySelectedFiles()
    {
        ProtectSync(() =>
        {
            var paths = GetFullSelectedFilenames();
            Clipboard.SetFileDropList([.. paths]);
        });
    }

    public void PasteFiles(Func<IEnumerable<string>, OverwriteMode?> overwritePrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            var paths = Clipboard.GetFileDropList();
            if (paths.Count == 0)
            {
                throw new SilentError("No files to paste.");
            }

            using var srcs = (await FileHelper.ReadFiles([.. paths], progress, ct))
                .ToDisposingDictionary();
            var dst = folderStack[^1].Value;
            var existing = dst.ListFiles()
                .Select(f => f.Filename)
                .Where(f => srcs.ContainsKey(f));

            OverwriteMode? overwriteMode = existing.Any()
                ? overwritePrompt(existing)
                : OverwriteMode.Throw;
            if (overwriteMode == null)
            {
                return;
            }

            await FileHelper.Insert(
                folderStack,
                srcs,
                overwriteMode.Value,
                progress,
                ct);
            await RefreshFolderInternal(ct);
        });
    }

    public void DuplicateSelectedFile(Func<IEnumerable<string>, OverwriteMode?> overwritePrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            if (selectedFileNonParent == null)
            {
                throw new SilentError("No file selected.");
            }
            var name = selectedFileNonParent.Info.Filename;
            var dupName = $"{name}.bak";
            var dst = folderStack[^1].Value;

            OverwriteMode? overwriteMode = dst.ListFiles().Exists(fi => fi.Filename == dupName)
                ? overwritePrompt([dupName])
                : OverwriteMode.Throw;
            if (overwriteMode == null)
            {
                return;
            }

            using var stream = await dst.OpenFile(name, progress, ct);
            await FileHelper.Insert(
                folderStack,
                new Dictionary<string, BinaryStream> { { dupName, stream } },
                overwriteMode.Value,
                progress,
                ct);
            await RefreshFolderInternal(ct);
        });
    }

    public void SetShowEmptyPnaFiles(bool showEmptyPnaFiles)
    {
        ProtectSync(() =>
        {
            this.showEmptyPnaFiles = showEmptyPnaFiles;
            UpdateFileListInternal();
        });
    }

    public void AddPnaEntry()
    {
        Protect(interruptable: false, async ct =>
        {
            if (folderStack[^1].Value is PnaFile pna)
            {
                folderStack[^1] = folderStack[^1] with
                {
                    Value = await pna.AddEntry(progress, ct),
                };
                await FileHelper.PropagateModifications(folderStack, progress, ct);
                await RefreshFolderInternal(ct);
            }
            else
            {
                throw new InvalidOperationException("Not a PNA file.");
            }
        });
    }

    public void SwapSelectedPnaEntries()
    {
        Protect(interruptable: false, async ct =>
        {
            if (selectedIndices.Count != 2)
            {
                throw new SilentError("Select exactly two files to swap.");
            }
            var filename1 = fileList[selectedIndices[0]].Filename;
            var filename2 = fileList[selectedIndices[1]].Filename;
            if (folderStack[^1].Value is PnaFile pna)
            {
                folderStack[^1] = folderStack[^1] with
                {
                    Value = await pna.SwapEntry(
                        filename1,
                        filename2,
                        progress,
                        ct),
                };
                await FileHelper.PropagateModifications(folderStack, progress, ct);
                await RefreshFolderInternal(ct);
            }
            else
            {
                throw new InvalidOperationException("Not a PNA file.");
            }
        });
    }

    public void EditSelectedFileInApp(EditorType? editorType)
    {
        Protect(interruptable: false, async ct =>
        {
            if (selectedFileNonParent?.File == null)
            {
                throw new SilentError("Select exactly one file to edit.");
            }

            var tempFilename = Path.Combine(
                Path.GetTempPath(),
                Random.Shared.Next().ToString("X8") + "_" +
                selectedFileNonParent.Info.Filename);
            var oldStream = selectedFileNonParent.File.Stream;
            {
                await using var tempFile = File.Create(tempFilename);
                await oldStream.CopyTo(
                    tempFile,
                    tempFilename,
                    progress,
                    ct);
            }

            editorType ??= selectedFileNonParent.File switch
            {
                PngFile => EditorType.Image,
                TextFile => EditorType.Text,
                _ => EditorType.Hex,
            };
            var editor = editorType switch
            {
                EditorType.Text => config.TextEditorPath,
                EditorType.Image => config.ImageEditorPath,
                EditorType.Hex => config.HexEditorPath,
                _ => throw new UnreachableException(),
            };
            var args = editorType switch
            {
                EditorType.Text => config.TextEditorArgs,
                EditorType.Image => config.ImageEditorArgs,
                EditorType.Hex => config.HexEditorArgs,
                _ => throw new UnreachableException(),
            };

            using Process proc = Process.Start(editor, $"{args} \"{tempFilename}\"");
            await proc.WaitForExitAsync(ct);

            using var newStream = await FileHelper.ReadFile(tempFilename, progress, ct);
            if (BinaryStream.StreamEquals(oldStream, newStream))
            {
                OnStatus?.Invoke("No changes made.");
                return;
            }

            await FileHelper.Insert(
                folderStack,
                new Dictionary<string, BinaryStream> {
                    { selectedFileNonParent.Info.Filename, newStream },
                },
                OverwriteMode.Overwrite,
                progress,
                ct);
            await RefreshFolderInternal(ct);
            OnStatus?.Invoke("Changes applied.");
        });
    }

    public void RevealInFileExplorer()
    {
        ProtectSync(() =>
        {
            var filenames = GetFullSelectedFilenames();
            if (filenames.Count == 0)
            {
                throw new SilentError("Select at least one file.");
            }
            Process.Start("explorer.exe", $"/select, \"{filenames[0]}\"");
        });
    }

    public void ExportSelectedFile(Func<string[], string[]?> saveDialog)
    {
        Protect(interruptable: false, async ct =>
        {
            var filenames = GetSelectedFilenames();
            var destinations = saveDialog([.. filenames]);
            if (destinations == null)
            {
                return;
            }
            foreach (var (src, dst) in filenames.Zip(destinations))
            {
                var stream = await folderStack[^1].Value
                    .OpenFile(src, progress, ct);
                await using var file = File.Create(dst);
                await stream.CopyTo(file, dst, progress, ct);
            }
        });
    }

    public void GoBack()
    {
        Protect(interruptable: false, async ct =>
        {
            if (backHistory.Count >= 2) // Contains a current and previous entry
            {
                backHistory.Pop();
                var newPath = backHistory.Peek();
                var oldPath = GetCurrentFolderPath();

                // Optimize going up a directory
                try
                {
                    var oldDir = new DirectoryInfo(oldPath);
                    if (oldDir.Parent?.FullName == newPath)
                    {
                        folderStack.Pop();
                        await RefreshFolderInternal(ct);
                        forwardHistory.Push(oldPath);
                        return;
                    }
                }
                catch { }

                await OpenPathInternal(newPath, ct);
                forwardHistory.Push(oldPath);
            }
        });
    }

    public void GoForward()
    {
        Protect(interruptable: false, async ct =>
        {
            if (forwardHistory.TryPop(out var path))
            {
                await OpenPathInternal(path, ct);
                backHistory.Push(GetCurrentFolderPath());
            }
        });
    }

    private void PushHistory()
    {
        backHistory.Push(GetCurrentFolderPath());
        forwardHistory.Clear();
    }

    public void AutoCompletePath(string text)
    {
        Protect(interruptable: true, async ct =>
        {
            try
            {
                string newText = text.Replace("~", Environment.GetFolderPath(
                    Environment.SpecialFolder.UserProfile));

                string pattern;
                string partialPath;
                if (newText.EndsWith(Path.DirectorySeparatorChar) || newText.EndsWith(Path.AltDirectorySeparatorChar))
                {
                    pattern = "";
                    partialPath = newText;
                }
                else
                {
                    var parts = FileHelper.SplitPath(newText);
                    if (parts.Count == 0)
                    {
                        return;
                    }
                    pattern = parts[^1];
                    partialPath = Path.Combine([.. parts[..^1]]);
                }
                var folders = (await FileHelper.OpenFolderHierarchy(partialPath, progress, ct))
                    .ToDisposingList();
                var fileInfos = folders[^1].Value.ListFiles();

                string? match = null;
                foreach (var fileInfo in fileInfos)
                {
                    if (!fileInfo.Filename.StartsWith(pattern, StringComparison.OrdinalIgnoreCase))
                    {
                        continue;
                    }

                    bool isMatch;
                    if (fileInfo.IsDirectory)
                    {
                        isMatch = true;
                    }
                    else
                    {
                        using var file = await folders[^1].Value
                            .OpenFile(fileInfo.Filename, progress, ct)
                            .ToDataFile(progress);
                        isMatch = file is IFolder;
                    }
                    if (!isMatch)
                    {
                        continue;
                    }

                    if (match != null)
                    {
                        match = null;
                        break;
                    }
                    match = fileInfo.Filename;
                }

                if (match != null)
                {
                    newText = Path.Combine(partialPath, match)
                        + Path.DirectorySeparatorChar;
                }

                if (text != newText)
                {
                    OnPathText?.Invoke(newText);
                }
            }
            catch { }
        });
    }

    private string GetCurrentFolderPath()
    {
        return Path.Combine(
            folderStack
                .Select(f => f.Name)
                .ToArray());
    }

    private List<string> GetFullSelectedFilenames()
    {
        var folderPath = GetCurrentFolderPath();
        return GetSelectedFilenames()
            .ConvertAll(s => Path.Combine(folderPath, s))
;
    }

    private List<string> GetSelectedFilenames()
    {
        return selectedIndices
            .Select(i => fileList[i].Filename)
            .Where(s => s != "..")
            .ToList();
    }

    private async Task SetSelectedFileInternal(int? index, CancellationToken ct)
    {
        if (index.HasValue)
        {
            if (selectedFile?.Index == index.Value)
            {
                return;
            }
            var fileInfo = fileList[index.Value];
            IFile? file = null;
            if (!fileInfo.IsDirectory)
            {
                file = await folderStack[^1].Value
                    .OpenFile(fileInfo.Filename, progress, ct)
                    .ToDataFile(progress);
            }
            if (selectedFile is IDisposable disposable)
            {
                disposable.Dispose();
            }
            selectedFile = new SelectedFile
            {
                File = file,
                Info = fileInfo,
                Index = index.Value,
            };
            selectedFileNonParent = selectedFile.Info.Filename == ".."
                ? null
                : selectedFile;
        }
        else
        {
            if (selectedFile is IDisposable disposable)
            {
                disposable.Dispose();
            }
            selectedFile = null;
            selectedFileNonParent = null;
        }
    }

    private static string GetFileShortDescription(IFile file)
    {
        return file switch
        {
            ArcFile => "ARC",
            BinFile => "BIN",
            LuacFile luac => $"LUAC (v{luac.LuaVersion:X2})",
            OggFile ogg => $"OGG ({ogg.Duration / 60:00}:{ogg.Duration % 60:00})",
            OtfFile => "OTF",
            PanFile => "PAN",
            PnaFile pna => $"PNA ({pna.Header.ImageWidth}x{pna.Header.ImageHeight})",
            PngFile png => $"PNG ({png.ImageWidth}x{png.ImageHeight})",
            PtfFile ptf => $"PTF ({ptf.FontType})",
            TextFile txt => $"TXT ({txt.Encoding.GetPrettyEncodingName()})",
            TtfFile => "TTF",
            VideoFile => "VIDEO",
            Ws2File ws2 => $"WS2 ({ws2.Version})",
            _ => "UNKNOWN",
        };
    }

    private static string GetFileLongDescription(IFile file)
    {
        return file switch
        {
            ArcFile => "(ARC) Archive file",
            BinFile => "Generic binary file",
            LuacFile luac => "(LUAC) Compiled Lua file\n\n"
                         + $"Lua version: {luac.LuaVersion:X2}",
            OggFile ogg => "(OGG) Audio file\n\n"
                         + $"Sample rate: {ogg.SampleRate}Hz\n"
                         + $"Channel: {ogg.ChannelCount}\n"
                         + $"Duration: {ogg.Duration / 60:00}:{ogg.Duration % 60:00}",
            OtfFile => "(OTF) OpenType font file",
            PanFile => "(PAN) Audio panning data file?",
            PnaFile pna => "(PNA) PNG array file\n\n"
                         + $"Dimensions: {pna.Header.ImageWidth}x{pna.Header.ImageHeight}\n"
                         + $"File count: {pna.Header.FileCount}",
            PngFile png => "(PNG) Image file\n\n"
                         + $"Dimensions: {png.ImageWidth}x{png.ImageHeight}\n",
            PtfFile ptf => "(PTF) Compressed font file\n\n"
                         + $"Font type: {ptf.FontType}\n"
                         + $"XOR key: 0x{ptf.XorKey:X2}",
            TtfFile => "(TTF) TrueType font file",
            TextFile txt => "Generic text file\n\n"
                          + $"Encoding: {txt.Encoding.GetPrettyEncodingName()}",
            VideoFile => "(WMV) Windows media player video file",
            Ws2File ws2 => "(WS2) Script file\n\n"
                         + $"Version: {ws2.Version}",
            _ => "Unknown file type",
        };
    }

    private void UpdateFileListInternal()
    {
        fileList = folderStack[^1].Value.ListFiles();
        if (folderStack.Count > 1)
        {
            fileList.Insert(0, new FileInfo
            {
                Filename = "..",
                IsDirectory = true,
            });
        }
        if (!showEmptyPnaFiles && folderStack[^1].Value is PnaFile)
        {
            fileList = fileList
                .Where(f => f.FileSize != 0)
                .ToList();
        }
        selectedIndices.Clear();
        if (selectedFile is IDisposable disposable)
        {
            disposable.Dispose();
        }
        selectedFile = null;
        selectedFileNonParent = null;
        OnPathText?.Invoke(GetCurrentFolderPath());
        OnFileList?.Invoke(fileList.AsReadOnly());
    }

    private void ProtectSync(Action fn)
    {
        Protect(interruptable: false, (_) =>
        {
            fn();
            return Task.CompletedTask;
        });
    }

    private async void Protect(bool interruptable, Func<CancellationToken, Task> fn)
    {
        try
        {
            using var taskLock = new TaskLock(interruptable, out var ct);
            if (taskLock.Acquired)
            {
                await fn(ct);
            }
            else
            {
                OnStatus?.Invoke("Wait for the current operation to finish.");
            }
        }
        catch (OperationCanceledException)
        {
        }
        catch (SilentError ex)
        {
            OnStatus?.Invoke(ex.Message);
        }
        catch (Exception ex)
        {
            OnError?.Invoke(ex);
        }
    }
}

class SilentError : Exception
{
    public SilentError() { }
    public SilentError(string message) : base(message) { }
    public SilentError(string? message, Exception? innerException) : base(message, innerException) { }
}

class SelectedFile
{
    public IFile? File { get; init; }
    public required FileInfo Info { get; init; }
    public required int Index { get; init; }
}

class EditorSettings
{
    public required string TextEditorPath { get; init; }
    public required string TextEditorArgs { get; init; }
    public required string ImageEditorPath { get; init; }
    public required string ImageEditorArgs { get; init; }
    public required string HexEditorPath { get; init; }
    public required string HexEditorArgs { get; init; }
}

enum EditorType
{
    Text,
    Image,
    Hex,
}
