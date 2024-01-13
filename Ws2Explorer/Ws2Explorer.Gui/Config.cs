using System.Text.Json;
using System.Text.Json.Serialization;

namespace Ws2Explorer.Gui;

class Config {
    [JsonIgnore]
    public string SavePath = "";

    public string OpenFolder { get; set; } = "";
    public string TextEditorPath { get; set; } = "notepad.exe";
    public string ImageEditorPath { get; set; } = "mspaint.exe";
    public string HexEditorPath { get; set; } = "";
    public bool ShowEmptyPnaFiles { get; set; } = false;
    public bool ShowHexViewer { get; set; } = false;
    public bool ShowTerminal { get; set; } = false;
    public bool WordWrap { get; set; } = false;
    public bool WindowMaximized { get; set; } = false;
    public int PreviewerPanelHeight { get; set; } = 200;
    public int FilePanelWidth { get; set; } = 300;
    public int WindowWidth { get; set; } = 1000;
    public int WindowHeight { get; set; } = 600;
    public int? WindowX { get; set; } = null;
    public int? WindowY { get; set; } = null;

    public static Config Load(string path) {
        try {
            var text = File.ReadAllText(path);
            var config = JsonSerializer.Deserialize<Config>(text) ?? new Config();
            config.SavePath = path;
            return config;
        } catch {
            return new Config() { SavePath = path };
        }
    }

    public void Save() {
        if (SavePath.Length == 0) {
            return;
        }

        var options = new JsonSerializerOptions() {
            WriteIndented = true,
        };

        try {
            var text = JsonSerializer.Serialize(this, options);
            File.WriteAllText(SavePath, text);
        } catch { }
    }
}
