using System.Text;
using Ws2Explorer;

Console.OutputEncoding = Encoding.UTF8;

var folder = new Ws2Explorer.Directory(@"C:\Users\kevlu\Desktop\test");
using var arc = await folder.OpenFile("Rio.arc").ToDataFile<ArcFile>();
using var ws2 = await arc.OpenFile("yozora_com_402_E.ws2").ToDataFile<Ws2File>();
using var json = await ws2.OpenFile(Ws2File.OPS_FILENAME).ToDataFile<TextFile>();
Console.WriteLine(json.Text);
