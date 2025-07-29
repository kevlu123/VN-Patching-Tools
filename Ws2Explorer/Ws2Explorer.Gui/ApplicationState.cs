using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Text.RegularExpressions;
using Ws2Explorer.HighLevel;
using Ws2Explorer.FileTypes;
using Flowchart = System.Collections.Generic.Dictionary<string, System.Collections.Generic.List<string>>;
using Ws2Directory = Ws2Explorer.FileTypes.Directory;

namespace Ws2Explorer.Gui;

class ApplicationState(string? openPath)
{
    private readonly string? openPath = openPath;
    private int currentTaskId;
    private bool initialised;
    private Progress<TaskProgressInfo>? progress;
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
    public Action<string>? OnStatus { get; set; }
    public Action<ReadOnlyCollection<FileInfo>>? OnFileList { get; set; }
    public Action<string>? OnPathText { get; set; }
    public Action<string>? OnFileCaption { get; set; }
    public Action<BinaryStream>? OnPreviewBinary { get; set; }
    public Action<BinaryStream>? OnPreviewPng { get; set; }
    public Action<BinaryStream>? OnPreviewOgg { get; set; }
    public Action<BinaryStream>? OnPreviewFont { get; set; }
    public Action<string>? OnPreviewText { get; set; }

    private Comparison<FileInfo>? sortFileList;
    public Comparison<FileInfo>? SortFileList
    {
        get => sortFileList;
        set
        {
            sortFileList = value;
            // Don't update file list on init because it is too early
            if (initialised)
            {
                UpdateFileListInternal();
            }
        }
    }

    public static string? GetExeFolderPath()
    {
        var module = Process.GetCurrentProcess().MainModule;
        return module == null ? null : Path.GetDirectoryName(module.FileName);
    }

    public async void Init()
    {
        List<string?> paths = [
            openPath,
            GetExeFolderPath(),
            "C:\\",
        ];
        foreach (var path in paths)
        {
            if (string.IsNullOrEmpty(path))
            {
                continue;
            }
            try
            {
                await OpenPathInternal(path, CancellationToken.None);
            }
            catch { }
            if (folderStack.Count > 0)
            {
                goto success;
            }
        }
        var ex = new IOException("Failed to open any path.");
        OnError?.Invoke(ex);
        throw ex;

    success:
        PushHistoryInternal();
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
        initialised = true;
    }

    public void CancelTask()
    {
        GC.KeepAlive(this); // Suppress warning about static method
        TaskLock.Cancel();
    }

    public void OpenPath(string path)
    {
        Protect(interruptable: false, async ct =>
        {
            await OpenPathInternal(path, ct);
            PushHistoryInternal();
        });
    }

    private async Task OpenPathInternal(string path, CancellationToken ct)
    {
        var hierarchy = await FileTool.OpenFolderHierarchy(
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
            { File: IFile file } => GetFileShortDescriptionInternal(file),
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
                throw new QuietError("No folder selected.");
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
                    Folder = ((Ws2Directory)folderStack[^1].Folder).OpenDirectory(name),
                    Name = name,
                });
            }
            else if (selectedFile.File is IFolder subfolder)
            {
                // Open virtual directory
                folderStack.Add(new NamedFolder
                {
                    Folder = subfolder,
                    Name = name,
                });
            }
            else
            {
                throw new QuietError($"'{name}' is not a folder.");
            }
            UpdateFileListInternal();
            PushHistoryInternal();
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
                throw new QuietError("No folder selected.");
            }

            var folder = await selectedFileNonParent.File.Stream
                .Decode<T>(decRef: false);
            folderStack.Add(new NamedFolder
            {
                Folder = folder,
                Name = selectedFileNonParent.Info.Filename,
            });
            UpdateFileListInternal();
            PushHistoryInternal();
        });
    }

    public void CreateArchive<T>(string dst)
        where T : class, IArchive<T>
    {
        Protect(interruptable: false, async ct =>
        {
            using var streams = new DisposingList<BinaryStream>();
            var filenames = GetSelectedFilenamesInternal();
            var folder = folderStack[^1].Folder;
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
            OnStatus?.Invoke($"Created archive '{dst}'.");
        });
    }

    public void CreateNewFile(string filename)
    {
        Protect(interruptable: false, async ct =>
        {
            await FileTool.Insert(
                folderStack,
                new Dictionary<string, BinaryStream> { { filename, BinaryStream.Empty } },
                OverwriteMode.Throw,
                progress,
                ct);
            await RefreshFolderInternal(ct);
        });
    }

    public void CreateNewDirectory(string filename)
    {
        Protect(interruptable: false, async ct =>
        {
            if (folderStack[^1].Folder is not Ws2Directory directory)
            {
                throw new QuietError("Cannot create directory in an archive.");
            }
            var path = Path.Combine(directory.FullPath, filename);
            System.IO.Directory.CreateDirectory(path);
            await RefreshFolderInternal(ct);
        });
    }

    public void OpenParentFolder()
    {
        ProtectSync(() =>
        {
            if (folderStack.Count <= 1)
            {
                throw new QuietError("Already at root directory.");
            }
            folderStack.Pop();
            UpdateFileListInternal();
            PushHistoryInternal();
        });
    }

    public void RefreshFolder()
    {
        Protect(interruptable: false, RefreshFolderInternal);
    }

    private async Task RefreshFolderInternal(CancellationToken ct)
    {
        var index = fileList.IndexOf(selectedFile?.Info!);
        await OpenPathInternal(GetCurrentFolderPathInternal(), ct);
        if (index != -1)
        {
            await SelectSingleFileInternal(index, ct);
        }
    }

    public void ShowFileMetadata(Action<string> onResult)
    {
        ProtectSync(() =>
        {
            if (selectedFile != null)
            {
                if (selectedFile.File != null)
                {
                    onResult(GetFileLongDescriptionInternal(selectedFile.File));
                }
                else
                {
                    onResult("Directory");
                }
            }
            else
            {
                throw new QuietError("No file selected.");
            }
        });
    }

    public void RenameFile(Func<string, string> renamePrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            var selectedFilenames = GetSelectedFilenamesInternal();
            if (selectedFilenames.Count != 1)
            {
                throw new QuietError("Select exactly one file to rename.");
            }
            var oldName = selectedFilenames[0];
            var newName = renamePrompt(oldName);
            if (newName == oldName)
            {
                throw new QuietError("Cancelled rename.");
            }
            await FileTool.Rename(
                folderStack,
                oldName,
                newName,
                progress,
                ct);
            await RefreshFolderInternal(ct);
            OnStatus?.Invoke($"Renamed file '{oldName}' -> '{newName}'.");
        });
    }

    public void DeleteSelectedFiles(Func<IEnumerable<string>, bool> deletePrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            var paths = GetSelectedFilenamesInternal();
            if (paths.Count == 0)
            {
                throw new QuietError("No files selected.");
            }
            if (deletePrompt(paths))
            {
                await FileTool.Delete(
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
            var paths = GetFullSelectedFilenamesInternal();
            Clipboard.SetFileDropList([.. paths]);
            if (paths.Count == 1)
            {
                OnStatus?.Invoke($"Copied '{paths[0]}'.");
            }
            else
            {
                OnStatus?.Invoke($"Copied {paths.Count} files.");
            }
        });
    }

    public void PasteFiles(Func<IEnumerable<string>, OverwriteMode?> overwritePrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            var paths = Clipboard.GetFileDropList();
            if (paths.Count == 0)
            {
                throw new QuietError("No files to paste.");
            }
            await InsertFilesInternal([.. paths], overwritePrompt, ct);
        });
    }

    public void InsertFiles(string[] paths, Func<IEnumerable<string>, OverwriteMode?> overwritePrompt)
    {
        Protect(interruptable: false, async ct => await InsertFilesInternal(paths, overwritePrompt, ct));
    }

    private async Task InsertFilesInternal(
        string[] paths,
        Func<IEnumerable<string>, OverwriteMode?> overwritePrompt,
        CancellationToken ct)
    {
        using var srcs = await FileTool.ReadFiles([.. paths], progress, ct);
        var dst = folderStack[^1].Folder;
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

        await FileTool.Insert(
            folderStack,
            srcs,
            overwriteMode.Value,
            progress,
            ct);
        await RefreshFolderInternal(ct);
    }

    public void DuplicateSelectedFile(Func<IEnumerable<string>, OverwriteMode?> overwritePrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            if (selectedFileNonParent == null)
            {
                throw new QuietError("No file selected.");
            }
            var name = selectedFileNonParent.Info.Filename;
            var dupName = $"{name}.bak";
            var dst = folderStack[^1].Folder;

            OverwriteMode? overwriteMode = dst.ListFiles().Exists(fi => fi.Filename == dupName)
                ? overwritePrompt([dupName])
                : OverwriteMode.Throw;
            if (overwriteMode == null)
            {
                return;
            }

            using var stream = await dst.OpenFile(name, progress, ct);
            await FileTool.Insert(
                folderStack,
                new Dictionary<string, BinaryStream> { { dupName, stream } },
                overwriteMode.Value,
                progress,
                ct);
            await RefreshFolderInternal(ct);
            OnStatus?.Invoke($"Created file '{dupName}'.");
        });
    }

    public void SetShowEmptyPnaFiles(bool showEmptyPnaFiles)
    {
        this.showEmptyPnaFiles = showEmptyPnaFiles;
        // Don't update file list on init because it is too early
        if (initialised)
        {
            ProtectSync(UpdateFileListInternal);
        }
    }

    public void AddPnaEntry()
    {
        Protect(interruptable: false, async ct =>
        {
            if (folderStack[^1].Folder is PnaFile pna)
            {
                folderStack[^1] = folderStack[^1] with
                {
                    Folder = await pna.AddEntry(progress, ct),
                };
                await FileTool.PropagateModifications(folderStack, progress, ct);
                await RefreshFolderInternal(ct);
                OnStatus?.Invoke("Created new PNA entry.");
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
                throw new QuietError("Select exactly two files to swap.");
            }
            var filename1 = fileList[selectedIndices[0]].Filename;
            var filename2 = fileList[selectedIndices[1]].Filename;
            if (folderStack[^1].Folder is PnaFile pna)
            {
                folderStack[^1] = folderStack[^1] with
                {
                    Folder = await pna.SwapEntry(
                        filename1,
                        filename2,
                        progress,
                        ct),
                };
                await FileTool.PropagateModifications(folderStack, progress, ct);
                await RefreshFolderInternal(ct);
                OnStatus?.Invoke($"Swapped PNA entries '{filename1}' <-> '{filename2}'.");
            }
            else
            {
                throw new InvalidOperationException("Not a PNA file.");
            }
        });
    }

    public void EditSelectedFileInApp(Func<EditorType, (string editor, string args)> getEditor)
    {
        Protect(interruptable: false, async ct =>
        {
            if (selectedFileNonParent?.File == null)
            {
                throw new QuietError("Select exactly one file to edit.");
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

            var (editor, args) = getEditor(selectedFileNonParent.File switch
            {
                PngFile => EditorType.Image,
                TextFile => EditorType.Text,
                _ => EditorType.Hex,
            });
            if (editor.Trim().Length == 0)
            {
                throw new InvalidOperationException("No editor configured for this file type.");
            }

            using Process proc = Process.Start(editor, $"{args} \"{tempFilename}\"");
            await proc.WaitForExitAsync(ct);

            using var newStream = await FileTool.ReadFile(tempFilename, progress, ct);
            if (BinaryStream.StreamEquals(oldStream, newStream))
            {
                OnStatus?.Invoke("No changes made.");
                return;
            }

            await FileTool.Insert(
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
            var filenames = GetFullSelectedFilenamesInternal();
            if (filenames.Count == 0)
            {
                throw new QuietError("Select at least one file.");
            }
            Process.Start("explorer.exe", $"/select, \"{filenames[0]}\"");
        });
    }

    public void ExportSelectedFile(Func<IEnumerable<string>, IEnumerable<string>?> pathPickerPrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            var filenames = GetSelectedFilenamesInternal();
            var destinations = pathPickerPrompt(filenames)?.ToArray();
            if (destinations == null)
            {
                return;
            }
            foreach (var (src, dst) in filenames.Zip(destinations))
            {
                var stream = await folderStack[^1].Folder
                    .OpenFile(src, progress, ct);
                await using var file = File.Create(dst);
                await stream.CopyTo(file, dst, progress, ct);
            }
            if (destinations.Length == 1)
            {
                OnStatus?.Invoke($"Exported '{filenames[0]}' -> '{destinations[0]}'.");
            }
            else
            {
                OnStatus?.Invoke($"Exported {destinations.Length} files.");
            }
        });
    }

    public void GoBack()
    {
        Protect(interruptable: false, async ct =>
        {
            // Must contain a current and previous entry
            if (backHistory.Count < 2)
            {
                throw new QuietError("Cannot go back.");
            }

            backHistory.Pop();
            var newPath = backHistory.Peek();
            var oldPath = GetCurrentFolderPathInternal();

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
        });
    }

    public void GoForward()
    {
        Protect(interruptable: false, async ct =>
        {
            if (forwardHistory.TryPop(out var path))
            {
                await OpenPathInternal(path, ct);
                backHistory.Push(GetCurrentFolderPathInternal());
            }
            else
            {
                throw new QuietError("Cannot go forward.");
            }
        });
    }

    private void PushHistoryInternal()
    {
        backHistory.Push(GetCurrentFolderPathInternal());
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
                    var parts = FileTool.SplitPath(newText);
                    if (parts.Count == 0)
                    {
                        return;
                    }
                    pattern = parts[^1];
                    partialPath = Path.Combine([.. parts[..^1]]);
                }
                var folders = await FileTool.OpenFolderHierarchy(partialPath, progress, ct);
                var fileInfos = folders[^1].Folder.ListFiles();

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
                        using var file = await folders[^1].Folder
                            .OpenFile(fileInfo.Filename, progress, ct)
                            .DecodeWithHint(fileInfo.Filename, progress, ct);
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

    public void LaunchGame()
    {
        ProtectSync(() =>
        {
            if (GetGameFolderOrCurrentInternal() is Ws2Directory gameFolder)
            {
                var gamePath = Path.Combine(gameFolder.FullPath, "AdvHD.exe");
                var leprocPath = Path.Combine(GetExeFolderPath()!, "LEProc.exe");
                if (!File.Exists(leprocPath))
                {
                    leprocPath = Path.Combine(GetExeFolderPath()!, "LEProc/LEProc.exe");
                }

                if (!File.Exists(gamePath))
                {
                    throw new FileNotFoundException("Game executable not found.");
                }

                using var proc = Process.Start(new ProcessStartInfo(leprocPath)
                {
                    ArgumentList = { gamePath },
                    WorkingDirectory = gameFolder.FullPath,
                }) ?? throw new IOException($"Failed to launch Locale Emulator ({leprocPath}).");
            }
            else
            {
                throw new QuietError("Navigate to the game directory.");
            }
        });
    }

    private IFolder GetGameFolderOrCurrentInternal()
    {
        return GameTool.FindGameFolder(folderStack) ?? folderStack[^1].Folder;
    }

    public void SetEntry(Func<string, IEnumerable<string>, string> setEntryPrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            if (GetGameFolderOrCurrentInternal() is Ws2Directory dir)
            {
                await GameTool.SetEntryPoint(dir, setEntryPrompt, progress, ct);
                await RefreshFolderInternal(ct);
            }
            else
            {
                throw new QuietError("Navigate to the game directory.");
            }
        });
    }

    public void ConvertLuacToText()
    {
        Protect(interruptable: false, async ct =>
        {
            if (GetGameFolderOrCurrentInternal() is Ws2Directory dir)
            {
                await GameTool.ConvertLuacToText(dir, progress, ct);
                await RefreshFolderInternal(ct);
            }
            else
            {
                throw new QuietError("Navigate to the game directory.");
            }
        });
    }

    public void GetChoices(Action<List<ChoiceInfo>> onResult)
    {
        Protect(interruptable: false, async ct =>
        {
            if (GetGameFolderOrCurrentInternal() is Ws2Directory dir)
            {
                var choices = await GameTool.GetChoices(dir, progress, ct);
                onResult(choices);
            }
            else
            {
                throw new QuietError("Navigate to the game directory.");
            }
        });
    }

    public void GetJsonFlowchart(Action<Flowchart> onResult)
    {
        Protect(interruptable: false, async ct => await GetFlowChartInternal(onResult, ct));
    }

    public void GetMermaidFlowchart(Action<Flowchart> onResult)
    {
        Protect(interruptable: false, async ct => await GetFlowChartInternal(onResult, ct));
    }

    private async Task GetFlowChartInternal(Action<Flowchart> onResult, CancellationToken ct)
    {
        if (GetGameFolderOrCurrentInternal() is Ws2Directory dir)
        {
            onResult(await GameTool.GetFlowchart(dir, progress, ct));
        }
        else
        {
            throw new QuietError("Navigate to the game directory.");
        }
    }

    public void ModifyNames(Func<IEnumerable<string>, Dictionary<string, string>> modifyNamesPrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            if (GetGameFolderOrCurrentInternal() is Ws2Directory dir)
            {
                await GameTool.ModifyNames(dir, modifyNamesPrompt, progress, ct);
                await RefreshFolderInternal(ct);
            }
            else
            {
                throw new QuietError("Navigate to the game directory.");
            }
        });
    }

    public void RecursiveExtract(Func<(string extractLocation, Regex pattern)?> extractPrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            var folderNames = GetFullSelectedFilenamesInternal();
            if (folderNames.Count == 0)
            {
                throw new QuietError("Select folders to extract.");
            }

            var extractInfo = extractPrompt();
            if (extractInfo == null)
            {
                return;
            }
            var (extractLocation, pattern) = extractInfo.Value;

            using var streams = await FileTool.ReadFiles(folderNames, progress, ct);
            var extracted = new HashSet<string>();
            foreach (var (name, stream) in streams)
            {
                var file = await stream.DecodeWithHint(name, progress, ct, decRef: false);
                if (file is IFolder folder)
                {
                    extracted.UnionWith(await FileTool.RecursiveExtract(
                        folder,
                        folderNames.Count == 1 ? extractLocation : Path.Combine(extractLocation, name),
                        pattern,
                        OverwriteMode.Overwrite,
                        progress,
                        ct));
                }
                else
                {
                    await FileTool.WriteFile(
                        Path.Combine(extractLocation, name),
                        file.Stream,
                        OverwriteMode.Overwrite,
                        progress,
                        ct);
                    extracted.Add(name);
                }
            }

            if (extracted.Count == 1)
            {
                OnStatus?.Invoke("Extracted 1 file.");
            }
            else
            {
                OnStatus?.Invoke($"Extracted {extracted.Count} files.");
            }
        });
    }

    public void DiffFiles(Func<
        IEnumerable<string>,
        (
            string[] oldFilenames,
            string[] newFilenames,
            string dst,
            DiffPartitionMode mode,
            Type createArchiveType
        )?> fileListPrompt)
    {
        Protect(interruptable: false, async ct =>
        {
            var newArchiveNames = GetFullSelectedFilenamesInternal();

            var pathInfo = fileListPrompt(newArchiveNames);
            if (pathInfo == null)
            {
                return;
            }
            var (oldFilenames, newFilenames, dst, mode, createArchiveType) = pathInfo.Value;

            using var newArchiveStreams = await FileTool.ReadFiles(newFilenames, progress, ct);
            using var newArchives = new DisposingList<IFolder>();
            foreach (var (name, stream) in newArchiveStreams)
            {
                var file = await stream.DecodeWithHint(name, progress, ct, decRef: false);
                if (file is not IFolder folder)
                {
                    throw new InvalidOperationException("Can only diff folders.");
                }
                newArchives.Add(folder);
            }

            using var oldArchiveStreams = await FileTool.ReadFiles(oldFilenames, progress, ct);
            using var oldArchive = new DisposingList<IFolder>();
            foreach (var (name, stream) in oldArchiveStreams)
            {
                var file = await stream.DecodeWithHint(name, progress, ct, decRef: false);
                if (file is not IFolder folder)
                {
                    throw new InvalidOperationException("Can only diff folders.");
                }
                oldArchive.Add(folder);
            }

            using var diff = await FileTool.Diff(
                oldArchive,
                newArchives,
                mode,
                progress,
                ct);
            if (diff.Count == 0)
            {
                OnStatus?.Invoke("No files to write.");
                return;
            }

            using IArchive arc = createArchiveType switch {
                Type t when t == typeof(ArcFile) => ArcFile.Create(diff),
                Type t when t == typeof(LegacyArc8File) => LegacyArc8File.Create(diff),
                Type t when t == typeof(LegacyArc12File) => LegacyArc12File.Create(diff),
                _ => throw new InvalidOperationException("Unsupported archive type for diff."),
            };

            await FileTool.WriteFile(dst, arc.Stream, OverwriteMode.Overwrite, progress, ct);
            await RefreshFolderInternal(ct);
            if (diff.Count == 1)
            {
                OnStatus?.Invoke("Wrote 1 file to {dst}.");
            }
            else
            {
                OnStatus?.Invoke($"Wrote {diff.Count} files to {dst}.");
            }
        });
    }

    public void ListFilesInFolder(Action<IEnumerable<FileInfo>> onResult)
    {
        ProtectSync(() => onResult(folderStack[^1].Folder.ListFiles()));
    }

    public void FindReferences(
        Func<(string text, bool caseSensitive, bool matchWholeString)?> searchTextPrompt,
        Action<IDictionary<string, int>> onResult)
    {
        Protect(interruptable: false, async ct =>
        {
            if (GetGameFolderOrCurrentInternal() is Ws2Directory dir)
            {
                var search = searchTextPrompt();
                if (search == null)
                {
                    return;
                }
                onResult(await GameTool.FindReferences(
                    dir,
                    search.Value.text,
                    search.Value.caseSensitive
                        ? StringComparison.InvariantCulture
                        : StringComparison.InvariantCultureIgnoreCase,
                    search.Value.matchWholeString,
                    progress,
                    ct));
            }
            else
            {
                throw new QuietError("Navigate to the game directory.");
            }
        });
    }

    private string GetCurrentFolderPathInternal()
    {
        return Path.Combine(
            folderStack
                .Select(f => f.Name)
                .ToArray());
    }

    private List<string> GetFullSelectedFilenamesInternal()
    {
        var folderPath = GetCurrentFolderPathInternal();
        return GetSelectedFilenamesInternal()
            .ConvertAll(s => Path.Combine(folderPath, s))
;
    }

    private List<string> GetSelectedFilenamesInternal()
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
                file = await folderStack[^1].Folder
                    .OpenFile(fileInfo.Filename, progress, ct)
                    .DecodeWithHint(fileInfo.Filename, progress, ct);
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

    private static string GetFileShortDescriptionInternal(IFile file)
    {
        return file switch
        {
            ArcFile => "ARC",
            BinFile => "BIN",
            LegacyArc8File => "ARC (Legacy, 8 char filename)",
            LegacyArc12File => "ARC (Legacy, 12 char filename)",
            LngFile => "LNG",
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
            Ws2File ws2 => ws2.HasUnresolvedLabels
                ? $"WS2 ({ws2.Version}; WARNING UNRESOLVED LABELS)"
                : $"WS2 ({ws2.Version})",
            WscFile wsc => wsc.HasUnresolvedLabels
                ? $"WSC ({wsc.Version}; WARNING UNRESOLVED LABELS)"
                : $"WSC ({wsc.Version})",
            _ => "UNKNOWN",
        };
    }

    private static string GetFileLongDescriptionInternal(IFile file)
    {
        return file switch
        {
            ArcFile arc => "(ARC) Archive file\n\n"
                        + $"File count: {arc.ListFiles().Count}",
            BinFile => "Generic binary file",
            LegacyArc8File arc => "(ARC) Legacy archive file with max 8 character filename\n\n"
                        + $"File count: {arc.ListFiles().Count}",
            LegacyArc12File arc => "(ARC) Legacy archive file with max 12 character filename\n\n"
                        + $"File count: {arc.ListFiles().Count}",
            LngFile => "(LNG) Language pack file",
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
                         + $"Version: {ws2.Version}\n"
                         + $"Has unresolved labels: {ws2.HasUnresolvedLabels}",
            WscFile wsc => "(WSC) Script file\n\n"
                         + $"Version: {wsc.Version}\n"
                         + $"Has unresolved labels: {wsc.HasUnresolvedLabels}",
            _ => "Unknown file type",
        };
    }

    private void UpdateFileListInternal()
    {
        fileList = folderStack[^1].Folder.ListFiles();

        if (SortFileList != null)
        {
            fileList.Sort(SortFileList);
        }
        fileList = [.. fileList.OrderBy(f => f.IsDirectory ? 0 : 1)];

        if (folderStack.Count > 1)
        {
            fileList.Insert(0, new FileInfo
            {
                Filename = "..",
                IsDirectory = true,
            });
        }
        if (!showEmptyPnaFiles && folderStack[^1].Folder is PnaFile)
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
        OnPathText?.Invoke(GetCurrentFolderPathInternal());
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
        if (!initialised)
        {
            return;
        }
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
        catch (QuietError ex)
        {
            OnStatus?.Invoke(ex.Message);
        }
        catch (Exception ex)
        {
            OnError?.Invoke(ex);
        }
    }
}

class QuietError : Exception
{
    public QuietError() { }
    public QuietError(string message) : base(message) { }
    public QuietError(string? message, Exception? innerException) : base(message, innerException) { }
}

class SelectedFile
{
    public IFile? File { get; init; }
    public required FileInfo Info { get; init; }
    public required int Index { get; init; }
}

enum EditorType
{
    Text,
    Image,
    Hex,
}
