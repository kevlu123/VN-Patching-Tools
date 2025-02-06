using Ws2Explorer;
using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;

BinaryStream data = await FileTool.ReadFile("Example.arc");
using ArcFile arcFile = await data.Decode<ArcFile>();
// Or use the convenience extension method Task<BinaryStream>.Decode
// to await the BinaryStream and decrement its reference count in the Decode function.
//using ArcFile arcFile = await FileTool.ReadFile("Example.arc").Decode<ArcFile>();

foreach (Ws2Explorer.FileInfo fileInfo in arcFile.ListFiles())
{
    Console.WriteLine($"{fileInfo.Filename} is {fileInfo.FileSize} bytes");
}
