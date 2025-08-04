/*
 * Example to edit the instructions inside a WS2 script file.
 * This example makes the WS2 file loop forever instead of jumping
 * to the next script by editing the file jump ops.
 * 
 * Usage: dotnet run -- path/to/your/Rio.arc/script.ws2 path/to/output.ws2
 */
using System.Collections.Immutable;
using Ws2Explorer;
using Ws2Explorer.Compiler;
using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;

if (args.Length != 2)
{
    Console.WriteLine("Specify a WS2 script file and output path.");
    return;
}
var inputPath = args[0];
var outputPath = args[1];

// Read and decode the WS2/WSC script file.
using IFile file = await FileTool.ReadFile(inputPath).Decode();
if (file is not Ws2File ws2File)
{
    Console.WriteLine("File is not a WS2 script file.");
    return;
}

// Edit all file jump ops to jump to the same file.
string jumpTarget = Path.GetFileNameWithoutExtension(inputPath);
var newOps = new List<Op>();
foreach (Op op in ws2File.Ops)
{
    if (op.Code == Opcode.WS2_JUMP_FILE_07)
    {
        // Create a new op with argument 0 replaced.
        // Argument 0 is the  target file name to jump to (see Instructions.md).
        Op newOp = op.WithArgument(0, Argument.NewString(jumpTarget));
        newOps.Add(newOp);
    }
    else if (op.Code == Opcode.WS2_SHOW_CHOICE_0F)
    {
        // Choice ops often contain a WS2_JUMP_FILE_07 nested inside.
        // Edit these too.
        ImmutableArray<Ws2Choice> choices = op.Arguments[0].Ws2ChoiceArray;
        var newChoices = choices.Select(choice =>
        {
            var newJump = choice.JumpOp.WithArgument(0, Argument.NewString(jumpTarget));
            return choice.WithJumpOp(newJump);
        });
        Op newOp = op.WithArgument(0, Argument.NewWs2ChoiceArray(newChoices));
        newOps.Add(newOp);
    }
    else
    {
        // For all other ops, keep them as they are.
        newOps.Add(op);
    }
}

// Construct a new WS2 file with the new ops.
using var newWs2File = new Ws2File(newOps);

// Write to disk
await using FileStream outputFile = File.Create(outputPath);
await newWs2File.Stream.CopyTo(outputFile);
