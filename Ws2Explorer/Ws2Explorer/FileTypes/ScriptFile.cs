using System.Collections.Immutable;
using System.Text.Json.Nodes;
using Ws2Explorer.Compiler;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// Script text. This is either message text or choice text.
/// </summary>
public class ScriptText
{
    /// <summary>
    /// The text of the message or choice.
    /// </summary>
    public required string Text { get; init; }

    /// <summary>
    /// The name of the character speaking or an empty string if there is none.
    /// </summary>
    public required string Name { get; init; }

    /// <summary>
    /// Whether this text is for a choice or not.
    /// </summary>
    public required bool IsChoice { get; init; }

    internal JsonNode ToJson()
    {
        if (IsChoice)
        {
            return new JsonObject
            {
                ["choice"] = true,
                ["name"] = Name,
                ["text"] = Text,
            };
        }
        else
        {
            return new JsonObject
            {
                ["name"] = Name,
                ["text"] = Text,
            };
        }
    }

    internal static ScriptText FromJson(JsonNode json)
    {
        return new ScriptText
        {
            IsChoice = json["choice"]?.GetValue<bool>() ?? false,
            Name = json["name"]!.GetValue<string>(),
            Text = json["text"]!.GetValue<string>(),
        };
    }
}

/// <summary>
/// Base for Ws2File and WscFile.
/// </summary>
public abstract class ScriptFile : IArchive
{
    private bool disposedValue;

    /// <summary>
    /// The filename of the summary file.
    /// The summary file contains a human-readable summary of the script.
    /// </summary>
    public const string SUMMARY_FILENAME = "summary.txt";

    /// <summary>
    /// The filename of the text file.
    /// The text file contains the script's message and choice text in JSON format.
    /// </summary>
    public const string TEXT_FILENAME = "text.json";

    /// <summary>
    /// The filename of the new-text file.
    /// When creating a new script file, if the new-text file
    /// is present, it overwrites the script's message and choice text.
    /// This file is in the same format as the text file.
    /// A possible workflow is to take the text file, edit it,
    /// and reinsert it as the new-text file.
    /// </summary>
    public const string NEW_TEXT_FILENAME = "new_text.json";

    /// <summary>
    /// The filename of the ops file.
    /// The ops file contains the script instructions in JSON format.
    /// </summary>
    public const string OPS_FILENAME = "ops.json";

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public abstract BinaryStream Stream { get; }

    /// <summary>
    /// The ops of the script.
    /// </summary>
    public abstract ImmutableArray<Op> Ops { get; }

    /// <summary>
    /// Whether the script contains labels that do not point to a valid location.
    /// </summary>
    public abstract bool HasUnresolvedLabels { get; }

    /// <summary>
    /// The version of the script.
    /// </summary>
    public ScriptVersion Version => ScriptCompiler.GetScriptVersion(Ops);

    /// <summary>
    /// Get the message and choice text.
    /// </summary>
    public abstract ScriptText[] Text { get; }

    /// <summary>
    /// Get the list of unique speaker names in this script.
    /// </summary>
    public abstract string[] Names { get; }

    /// <summary>
    /// Create a new script file with the message and choice text replaced.
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public abstract ScriptFile WithText(IEnumerable<string> text);

    /// <summary>
    /// Create a new script file with the names replaced according to the given mapping.
    /// Names not in the mapping are left unchanged.
    /// </summary>
    /// <param name="mapping"></param>
    /// <returns></returns>
    public abstract ScriptFile WithNames(IDictionary<string, string> mapping);

    /// <summary>
    /// Constructs a script file from subfiles.
    /// Only <see cref="OPS_FILENAME"/> is required.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public abstract IArchive Create(IDictionary<string, BinaryStream> contents);

    /// <summary>
    /// Lists the virtual subfiles.
    /// </summary>
    /// <returns></returns>
    public List<FileInfo> ListFiles()
    {
        return [
            new FileInfo { Filename = SUMMARY_FILENAME, IsReadOnly = true },
            new FileInfo { Filename = TEXT_FILENAME, IsReadOnly = true },
            new FileInfo { Filename = OPS_FILENAME },
        ];
    }

    /// <summary>
    /// Opens a virtual subfile.
    /// The filename is case-insensitive and can be
    /// <see cref="SUMMARY_FILENAME"/>, <see cref="TEXT_FILENAME"/>, or <see cref="OPS_FILENAME"/>.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo>? progress = null, CancellationToken ct = default)
    {
        string data;
        var isWs2 = Version.IsWs2();
        switch (filename.ToLowerInvariant())
        {
            case SUMMARY_FILENAME:
                var texts = Text;
                var maxPrefixLen = Math.Max(
                    "Choice: ".Length,
                    texts.Length > 0 ? texts.Max(t => t.Name.Length + 2) : 0);
                var summary = texts.Select(t =>
                {
                    var prefix = "";
                    if (t.IsChoice)
                    {
                        prefix = "Choice: ";
                    }
                    else if (t.Name.Length > 0)
                    {
                        prefix = $"{t.Name}: ";
                    }
                    var pad = new string(' ', maxPrefixLen - prefix.Length);
                    var text = t.Text
                        .Replace("\\n", " ")
                        .Replace("\n", " ")
                        .Replace("\\d", "\"");
                    return pad + prefix + text;
                });
                data = string.Join('\n', summary);
                break;
            case TEXT_FILENAME:
                var text = Text.Select(t => t.ToJson().ToJsonString(JsonSerializer.OptionsIndented));
                data = "[\n" + string.Join(",\n", text) + "\n]";
                break;
            case OPS_FILENAME:
                data = ScriptCompiler.ToJson(Ops);
                break;
            default:
                throw new FileNotFoundException(filename);
        }
        return Task.FromResult(new BinaryStream(data));
    }

    /// <summary>
    /// Dispose the script file.
    /// </summary>
    public void Dispose()
    {
        if (!disposedValue)
        {
            Stream?.DecRef();
            disposedValue = true;
        }
        GC.SuppressFinalize(this);
    }

    /// <summary>
    /// Dispose the script file.
    /// </summary>
    ~ScriptFile()
    {
        Dispose();
    }
}
