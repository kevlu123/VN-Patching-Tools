using Ws2Explorer.Compiler;
using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;

namespace Ws2Explorer.Examples;

/*
 * Examples to get and set the text of an ARC file containing WS2 files.
 * The text is represented as a dictionary of filenames to lists of strings.
 */
public static class Examples
{
    public static async Task<Dictionary<string, List<string>>> GetText(string arcFilename)
    {
        // Load the ARC file
        using ArcFile arcFile = await FileTool.ReadFile(arcFilename).Decode<ArcFile>();

        // Iterate through all files in the ARC file in deterministic order
        var texts = new Dictionary<string, List<string>>();
        foreach (FileInfo fileInfo in arcFile.ListFiles().OrderBy(fi => fi.Filename))
        {
            // Open the subfile. Decoding the file type with a hint from the filename is much faster.
            using IFile subFile = await arcFile.OpenFile(fileInfo.Filename).DecodeWithHint(fileInfo.Filename);
            if (subFile is not Ws2File ws2File)
            {
                // Only interested in WS2 files
                continue;
            }

            // Get the text from the script instructions
            texts[fileInfo.Filename] = ws2File.Ops
                // Filter DISPLAY_TEXT instructions
                .Where(op => op.Code == Opcode.WS2_DISPLAY_TEXT_14)
                // Get the text argument
                .Select(op => op.Arguments[2].MessageString.String)
                .ToList();
        }

        return texts;
    }

    public static async void SetText(string arcFilename, Dictionary<string, List<string>> newTexts)
    {
        // Load the ARC file and all the parent folders because we need to know
        // how to save the changes later. For this, we need a full path.
        string archivePath = Path.GetFullPath(arcFilename);
        using DisposingList<NamedFolder> folders = await FileTool.OpenFolderHierarchy(archivePath);
        if (folders[^1].Folder is not ArcFile arcFile)
            throw new Exception($"{archivePath} is not an ARC file.");

        // Iterate through all files in the ARC file in deterministic order
        // and build up a new ARC file with the modified text.
        using var newSubFiles = new DisposingDictionary<string, BinaryStream>();
        foreach (var fileInfo in arcFile.ListFiles().OrderBy(fi => fi.Filename))
        {
            // Open the subfile.
            // Decoding the file type with a hint from the filename
            // is much faster than decoding without a hint.
            using var subFile = await arcFile.OpenFile(fileInfo.Filename).DecodeWithHint(fileInfo.Filename);
            if (subFile is not Ws2File ws2File || newTexts.TryGetValue(fileInfo.Filename, out List<string>? newText))
            {
                // If not a WS2 file, add to ARC as is,
                // accounting for the new reference to the file's underlying stream.
                subFile.Stream.IncRef();
                newSubFiles[fileInfo.Filename] = subFile.Stream;
                continue;
            }

            // Build up a new list of modified instructions
            var newOps = new List<Op>();
            int textIndex = 0;
            foreach (Op op in ws2File.Ops)
            {
                // If not a DISPLAY_TEXT instruction, add to the new list as is.
                if (op.Code != Opcode.WS2_DISPLAY_TEXT_14)
                {
                    newOps.Add(op);
                    continue;
                }

                // Add a new DISPLAY_TEXT instruction with the new text.
                Argument newArg = Argument.NewMessageString(new MessageString(
                    newText![textIndex++],
                    op.Arguments[2].MessageString.Suffix
                ));
                newOps.Add(op.WithArgument(2, newArg));
            }

            // Create the new WS2 file.
            using var newWs2File = new Ws2File(newOps);
            // Add the new WS2 file's underlying stream to the new ARC file,
            // accounting for the new reference.
            newWs2File.Stream.IncRef();
            newSubFiles[fileInfo.Filename] = newWs2File.Stream;
        }

        // Create the new ARC file.
        using ArcFile newArc = ArcFile.Create(newSubFiles);

        // Write the new ARC file back to disk.
        // With folders[^1] changed, the changes are propagated to folders[^2],
        // whose changes are then propagated to folders[^3] and so on,
        // until a real directory on the filesystem is reached and the changes are written.
        // This makes it possible to save changes to nested archives.
        folders[^1] = folders[^1] with { Folder = newArc };
        await FileTool.PropagateModifications(folders);
    }
}
