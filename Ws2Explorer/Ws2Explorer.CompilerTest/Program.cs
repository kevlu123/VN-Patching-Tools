using System.Reflection;
using System.Text.RegularExpressions;
using Ws2Explorer;
using Ws2Explorer.Compiler;

var pattern = args.Length > 0 ? args[0] : "";
var patternRegex = new Regex(pattern, RegexOptions.IgnoreCase | RegexOptions.Compiled);

var ws2Result = await TestDir("ws2", ".ws2", ScriptCompiler.DecompileWs2);
var wscResult = await TestDir("wsc", ".wsc", ScriptCompiler.DecompileWsc);
Console.WriteLine();
Console.WriteLine("================ Results ================");
Console.WriteLine();
foreach (var result in new[] { ws2Result, wscResult })
{
    foreach (var (filename, ex) in result.Failed)
    {
        Console.WriteLine($"{filename} failed!");
        Console.WriteLine();
        Console.WriteLine(ex);
        Console.WriteLine();
    }
}
Console.WriteLine($"WS2 {ws2Result.Tried - ws2Result.Failed.Count}/{ws2Result.Tried} succeeded.");
Console.WriteLine($"WSC {wscResult.Tried - wscResult.Failed.Count}/{wscResult.Tried} succeeded.");
Console.WriteLine();
Console.WriteLine("=========================================");
Console.WriteLine();

async Task<TestResult> TestDir(string dirName, string ext, DecompileFn decompile)
{
    var result = new TestResult();
    var exePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)!;
    var dir = new Ws2Explorer.FileTypes.Directory(Path.Combine(exePath, "Data", dirName));
    using var files = await dir.LoadAllFiles();
    foreach (var (filename, file) in files)
    {
        if (file is not IFolder archive)
        {
            continue;
        }
        foreach (var fileInfo in archive.ListFiles())
        {
            var path = $"{dirName}/{filename}/{fileInfo.Filename}";
            if (!fileInfo.Filename.EndsWith(ext, StringComparison.InvariantCultureIgnoreCase)
                || !patternRegex.IsMatch(path))
            {
                continue;
            }

            Console.Write(path);
            result.Tried++;
            try
            {
                using var stream = await archive.OpenFile(fileInfo.Filename);
                var ops = decompile(stream, out var version);
                Console.Write($" ({version})");
                using var recompiled = ScriptCompiler.Compile(ops);
                if (!BinaryStream.StreamEquals(stream, recompiled))
                {
                    throw new Exception("Recompilation does not match original.");
                }
            }
            catch (Exception ex)
            {
                result.Failed.Add((path, ex));
            }
            Console.WriteLine();
        }
    }
    return result;
}

delegate List<Op> DecompileFn(BinaryStream stream, out ScriptVersion version);

class TestResult
{
    public int Tried { get; set; }
    public int Succeeded { get; set; }
    public List<(string filename, Exception exception)> Failed { get; } = [];
}
