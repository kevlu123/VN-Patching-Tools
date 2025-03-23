using Ws2Explorer;
using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;

using ArcFile arcFile = await FileTool.ReadFile("Example.arc").Decode<ArcFile>();
foreach (Ws2Explorer.FileInfo fileInfo in arcFile.ListFiles())
{
    Console.WriteLine($"{fileInfo.Filename} is {fileInfo.FileSize} bytes");
}