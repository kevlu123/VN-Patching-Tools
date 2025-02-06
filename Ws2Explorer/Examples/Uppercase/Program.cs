using Ws2Explorer;
using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;
using Ws2Explorer.Compiler;

// Load ARC file
string archivePath = Path.GetFullPath("Rio.arc");
using DisposingList<NamedFolder> folders = await FileTool.OpenFolderHierarchy(archivePath);
if (folders[^1].Folder is not ArcFile arcFile)
    throw new Exception($"{archivePath} is not an ARC file.");

// Modify ARC file
IArchive newArc = await FileTool.ModifyFolder(arcFile, async fileData =>
{
    // Iterate over each file in the ARC file
    foreach (var (name, data) in fileData.ToList())
    {
        // Decode the data without taking ownership of it
        using IFile file = await data.Decode(decRef: false);

        // Only modify if it is a WS2 file
        if (file is not Ws2File ws2File)
            continue;

        // Iterate over each instruction
        var newOps = new List<Op>();
        foreach (Op op in ws2File.Ops)
        {
            // If the opcode is DISPLAY_TEXT then change the message string
            if (op.Code == Opcode.DISPLAY_TEXT_14)
            {
                var newArg = Argument.NewMessageString(new MessageString(
                    op.Arguments[2].MessageString.String.ToUpper(),
                    op.Arguments[2].MessageString.Suffix
                ));
                newOps.Add(op.WithArgument(2, newArg));
            }
            else
            {
                newOps.Add(op);
            }
        }

        // Construct the new WS2 file and insert its stream
        // into the archive. The stream needs to have its reference
        // count incremented. 
        using var newFile = new Ws2File(newOps);
        newFile.Stream.IncRef();
        fileData[name] = newFile.Stream;
    }
});

// Write changes to filesystem
folders[^1] = folders[^1] with { Folder = newArc };
await FileTool.PropagateModifications(folders);
