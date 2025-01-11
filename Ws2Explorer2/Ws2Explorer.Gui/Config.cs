using System.Text.Encodings.Web;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Text.Json.Serialization.Metadata;

namespace Ws2Explorer.Gui;

class Config
{
    private static readonly JsonSerializerOptions jsonOptions = new()
    {
        WriteIndented = true,
        AllowTrailingCommas = true,
        ReadCommentHandling = JsonCommentHandling.Skip,
        Encoder = JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
        TypeInfoResolver = new DefaultJsonTypeInfoResolver(),
    };

    [JsonIgnore]
    public string SavePath { get; set; } = "";

    public string OpenFolder { get; set; } = "";
    public string TextEditorPath { get; set; } = "C:\\Program Files\\Notepad++\\notepad++.exe";
    public string TextEditorArgs { get; set; } = "-multiInst -nosession";
    public string ImageEditorPath { get; set; } = "mspaint.exe";
    public string ImageEditorArgs { get; set; } = "";
    public string HexEditorPath { get; set; } = "C:\\Program Files\\HxD\\HxD.exe";
    public string HexEditorArgs { get; set; } = "";
    public bool ShowEmptyPnaFiles { get; set; } = false;
    public bool WordWrap { get; set; } = false;
    public bool WindowMaximized { get; set; } = false;
    public int FileListPanelWidth { get; set; } = 300;
    public int WindowWidth { get; set; } = 1000;
    public int WindowHeight { get; set; } = 600;
    public int? WindowX { get; set; } = null;
    public int? WindowY { get; set; } = null;

    public static Config Load(string path)
    {
        try
        {
            var text = File.ReadAllText(path);
            var config = JsonSerializer.Deserialize<Config>(text) ?? new Config();
            config.SavePath = path;
            return config;
        }
        catch
        {
            return new Config() { SavePath = path };
        }
    }

    public void Save()
    {
        if (SavePath.Length > 0)
        {
            try
            {
                var text = JsonSerializer.Serialize(this, jsonOptions);
                File.WriteAllText(SavePath, text);
            }
            catch { }
        }
    }
}
