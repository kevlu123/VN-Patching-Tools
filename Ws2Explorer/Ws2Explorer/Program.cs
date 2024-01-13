namespace Ws2Explorer;

public class Program {
    private static async Task Main(string[] args) {
        var program = new Program();
        program.OnOutput += (_, text) => Console.WriteLine(text);
        await program.Run(args, CancellationToken.None);
    }

    public static bool CommandWillWrite(string command) {
        return new[] { "cp", "rm", "swap", "rename", "compile", "insert_text" }.Contains(command);
    }

    private static (string path, string name) ParseFolderAndFilename(string path) {
        path = path.Replace('\\', '/');
        var index = path.LastIndexOf('/');
        if (index == -1) {
            return (".", path);
        } else {
            return (path[..index], path[(index + 1)..]);
        }
    }

    public event EventHandler<string> OnOutput = delegate { };
    private readonly Progress<(int id, string task, float t)>? progress;

    public Program(bool useProgress = false) {
        if (useProgress) {
            progress = new Progress<(int id, string task, float t)>(p => {
                var (id, task, t) = p;
                WriteOutput("\r" + new string(' ', 50));
                WriteOutput($"\r{task}: {t * 100}%");
            });
        }
    }

    private void WriteOutput(string s) {
        OnOutput(this, s);
    }

    private bool ShowConfirmationPrompt(string message) {
        WriteOutput(message);
        WriteOutput("(y/N)?");
        return Console.ReadLine() == "y";
    }

    public async Task Run(string[] args, CancellationToken ct) {
        if (args.Length == 0) {
            PrintHelp();
            return;
        }

        try {
            var op = args[0];
            switch (op) {
                case "help": PrintHelp();  break;
                case "pwd": PrintWorkingDirectory(); break;
                case "cd": ChangeWorkingDirectory(args); break;
                case "ls": await ListFiles(args, ct); break;
                case "cp": await CopyFiles(args, ct); break;
                case "rm": await DeleteFile(args, ct); break;
                case "swap": await SwapFiles(args, ct); break;
                case "rename": await RenameFile(args, ct); break;
                case "decompile": await DecompileFile(args, ct); break;
                case "compile": await CompileFile(args, ct); break;
                case "extract_text": await ExtractText(args, ct); break;
                case "insert_text": await InsertText(args, ct); break;
                default: throw new ArgumentException($"Unknown command {op}.");
            }
        } catch (Exception ex) {
            WriteOutput(ex.ToString());
        }
    }

    private void PrintHelp() {
        WriteOutput("Usage:");
        WriteOutput("  help                                           Show this help text.");
        WriteOutput("  pwd                                            Print current working directory.");
        WriteOutput("  cd [path]                                      Change current working directory (GUI only).");
        WriteOutput("  ls [path]                                      List files in directory.");
        WriteOutput("");
        WriteOutput("  cp <src> <dst>                                 Copy files.");
        WriteOutput("  rm <path>                                      Delete files.");
        WriteOutput("  swap <folder> <file1> <file2>                  Swap the contents of two files in the same folder.");
        WriteOutput("  rename <path> <new_filename>                   Rename files.");
        WriteOutput("  edit <path> [program]                          Open an external program to edit a file in-place.");
        WriteOutput("");
        WriteOutput("  decompile <ws2_file> <output_path>             Decompile a ws2 file.");
        WriteOutput("  compile <code_file> <output_path>              Compile a ws2 file.");
        WriteOutput("  extract_text <ws2> <output_path>               Extract text from ws2 files.");
        WriteOutput("  insert_text <text> <output_path>               Insert extracted text back into existing ws2 files.");
        WriteOutput("");
        WriteOutput("To edit names and choices, decompilation along with find and replace using an external text editor is recommended.");
    }

    private void PrintWorkingDirectory() {
        WriteOutput(Environment.CurrentDirectory);
    }

    private void ChangeWorkingDirectory(string[] args) {
        if (args.Length < 2) {
            Environment.CurrentDirectory = Environment.GetFolderPath(Environment.SpecialFolder.UserProfile);
        } else {
            Environment.CurrentDirectory = args[1];
        }
        WriteOutput(Environment.CurrentDirectory);
    }

    private async Task ListFiles(string[] args, CancellationToken ct) {
        var path = args.Length < 2 ? "." : args[1];
        var folder = await Folder.GetFolder(path, ct, progress);

        var children = folder.ListChildren();
        var padLen = children.Max(c => c.Name.Length) + 4;
        var indexPadLen = children.Count.ToString().Length;
        WriteOutput($"{new string(' ', indexPadLen)}  Name{new string(' ', padLen - 4)}Size");
        for (int i = 0; i < children.Count; i++) {
            var child = children[i];
            WriteOutput($"{i.ToString().PadLeft(indexPadLen, '0')}: {child.Name.PadRight(padLen)}{child.Length}");
        }
    }

    private async Task CopyFiles(string[] args, CancellationToken ct) {
        var srcPath = args[1];
        var dstPath = args[2];
        var (dstFolder, dstName) = ParseFolderAndFilename(dstPath);
        var dst = await Folder.GetFolder(dstFolder, ct, progress);
        await dst.CopyFiles(new[] { srcPath }, new[] { dstName }, _ => true, ct, progress);
    }

    private async Task DeleteFile(string[] args, CancellationToken ct) {
        var path = args[1];
        var (folderName, name) = ParseFolderAndFilename(path);
        var folder = await Folder.GetFolder(folderName, ct, progress);
        await folder.DeleteChildren(new[] { name }, ct, progress);
    }

    private async Task SwapFiles(string[] args, CancellationToken ct) {
        var folderName = args[1];
        var file1 = args[2];
        var file2 = args[3];
        var folder = await Folder.GetFolder(folderName, ct, progress);
        await folder.SwapChildren(file1, file2, ct, progress);
    }

    private async Task RenameFile(string[] args, CancellationToken ct) {
        var src = args[1];
        var newName = args[2];
        var (folderName, name) = ParseFolderAndFilename(src);
        var folder = await Folder.GetFolder(folderName, ct, progress);
        await folder.RenameChild(name, newName, ct, progress);
    }
    
    private async Task DecompileFile(string[] args, CancellationToken ct) {
        var src = args[1];
        var dst = args[2];
        var (dstFolderName, dstName) = ParseFolderAndFilename(dst);
        var dstFolder = await Folder.GetFolder(dstFolderName, ct, progress);
        await dstFolder.CopyFiles(new[] { Path.Combine(src, "opcodes.json") }, new[] { dstName }, _ => true, ct, progress);
    }

    private async Task CompileFile(string[] args, CancellationToken ct) {
        var src = args[1];
        var dst = args[2];
        var dstFolder = await Folder.GetFolder(dst, ct, progress);
        await dstFolder.CopyFiles(new[] { src }, new[] { "opcodes.json" }, _ => true, ct, progress);
    }

    private async Task ExtractText(string[] args, CancellationToken ct) {
        var src = args[1];
        var dst = args[2];
        var (dstFolderName, dstName) = ParseFolderAndFilename(dst);
        var dstFolder = await Folder.GetFolder(dstFolderName, ct, progress);
        await dstFolder.CopyFiles(new[] { Path.Combine(src, "text.json") }, new[] { dstName }, _ => true, ct, progress);
    }

    private async Task InsertText(string[] args, CancellationToken ct) {
        var src = args[1];
        var dst = args[2];
        var dstFolder = await Folder.GetFolder(dst, ct, progress);
        await dstFolder.CopyFiles(new[] { src }, new[] { "text.json" }, _ => true, ct, progress);
    }
}
