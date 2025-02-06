using System.Text.Encodings.Web;
using System.Text.Json;
using System.Text.Json.Serialization.Metadata;

namespace Ws2Explorer;

internal static class JsonSerializer
{
    public static readonly JsonSerializerOptions OptionsIndented =
        new()
        {
            WriteIndented = true,
            AllowTrailingCommas = true,
            ReadCommentHandling = JsonCommentHandling.Skip,
            Encoder = JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
            TypeInfoResolver = new DefaultJsonTypeInfoResolver(),
        };

    public static readonly JsonSerializerOptions Options =
        new()
        {
            WriteIndented = false,
            AllowTrailingCommas = true,
            ReadCommentHandling = JsonCommentHandling.Skip,
            Encoder = JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
            TypeInfoResolver = new DefaultJsonTypeInfoResolver(),
        };

    public static T Deserialize<T>(string json)
    {
        return System.Text.Json.JsonSerializer.Deserialize<T>(json, OptionsIndented)
            ?? throw new JsonException($"Invalid JSON format ({typeof(T).Name}).");
    }

    public static T Deserialize<T>(ReadOnlySpan<byte> json)
    {
        return System.Text.Json.JsonSerializer.Deserialize<T>(json, OptionsIndented)
            ?? throw new JsonException($"Invalid JSON format ({typeof(T).Name}).");
    }

    public static string Serialize<T>(T value)
    {
        return System.Text.Json.JsonSerializer.Serialize(value, OptionsIndented);
    }

    public static byte[] SerializeToUtf8Bytes<T>(T value)
    {
        return System.Text.Json.JsonSerializer.SerializeToUtf8Bytes(value, OptionsIndented);
    }
}
