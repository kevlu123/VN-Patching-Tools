using System.Text;
using System.Text.Json;
using Ws2Explorer;

void PrintUsage() {
    Console.WriteLine("Usage:");
    Console.WriteLine($"    {args[0]} <arc_path> <repo_path> <h|ss|ph|tg|>");
    Console.WriteLine("    arc_path:   path to the arc file to patch");
    Console.WriteLine("    repo_path:  path to this repo (the folder containing names_choices.json)");
    Console.WriteLine("    h,ss,ph,tg: which ws2 files to patch");
    Console.WriteLine("                (h = h-scenes only, ss = Sweet Stars, ph = Pureness Harem, tg = Trouble Goddess)");
}

static string RemoveAffix(string s) {
    if (s.StartsWith("%LC") || s.StartsWith("%LF")) {
        return s[3..];
    } else if (s.EndsWith("%K%P")) {
        return s[..^4];
    }
    return s;
}

var H_FILES = new HashSet<string>() {
    "ss_text/kagu02_02",
    "ss_text/kagu05_02",
    "ss_text/kagu06_02",
    "ss_text/sar03_03",
    "ss_text/sar05_02",
    "ss_text/shu02_05",
    "ss_text/shu03_02",

    "tg_text/aka03_01_H",
    "tg_text/aka05b_01_H",
    "tg_text/ino03_01_H",
    "tg_text/ino05_01_H",
    "tg_text/mai03_01_H",
    "tg_text/mai05_01_H",
    
    "ph_text/kae03_01",
    "ph_text/kae06_01",
    "ph_text/sio02_01",
    "ph_text/sio06_01",
    "ph_text/yuk01_03",
    "ph_text/yuk02_03",
};

if (args.Length < 3) {
    PrintUsage();
    return;
}

var arcPath = args[0];
var repoPath = args[1];
var gameCode = args[2];

var patchPaths = (gameCode == "h"
    ? H_FILES.Select(x => $"{repoPath}/edited_text/{x}.ws2")
    : Directory.GetFiles($"{repoPath}edited_text/{gameCode}_text"))
    .Select(x => x.Replace('\\', '/').ToLower().Replace(".json", ""))
    .ToList();

var namesChoicesPath = Path.Combine(repoPath, "names_choices.json");
var namesChoicesData = await File.ReadAllTextAsync(namesChoicesPath, Encoding.UTF8);
var namesChoices = JsonSerializer.Deserialize<NamesChoicesStruct>(namesChoicesData)
    ?? throw new InvalidDataException("Failed to deserialize names choices");
var nameReplacements = namesChoices.names;
var choiceReplacements = namesChoices.choices;

var arc = await Folder.GetFolder(arcPath, CancellationToken.None, null);
foreach (var child in arc.ListChildren()) {
    var childName = child.Name.ToLower();
    if (!patchPaths.Exists(x => x.EndsWith(childName))) {
        continue;
    }
    var patchPath = patchPaths.First(x => x.EndsWith(childName));

    var file = await arc.GetChild(child.Name, CancellationToken.None, null);
    if (file is not Ws2File ws2) {
        continue;
    }

    Console.WriteLine($"Patching {arc.Name}/{child.Name}...");

    var textJson = await File.ReadAllTextAsync(patchPath + ".json", Encoding.UTF8);
    var text = JsonSerializer.Deserialize<string[]>(textJson)
        !.Select(RemoveAffix)
        .ToArray();
        
    ws2.ReplaceTextNamesChoices(text, nameReplacements, choiceReplacements, CancellationToken.None, null);
}

class NamesChoicesStruct {
    public Dictionary<string, string> names { get; set; } = new();
    public Dictionary<string, string> choices { get; set; } = new();
}
