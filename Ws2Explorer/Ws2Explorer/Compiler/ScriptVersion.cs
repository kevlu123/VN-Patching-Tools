namespace Ws2Explorer.Compiler;

/// <summary>
/// Variant of Script format not in any particular order.
/// </summary>
public enum ScriptVersion
{
    /// <summary>
    /// WS2 version 1.
    /// </summary>
    WS2_V1,

    /// <summary>
    /// WS2 version 2.
    /// </summary>
    WS2_V2,

    /// <summary>
    /// WS2 version 3.
    /// </summary>
    WS2_V3,

    /// <summary>
    /// Tweaked version of version 3.
    /// </summary>
    WS2_V3_1,

    /// <summary>
    /// WSC script version 1.
    /// </summary>
    WSC_V1,

    /// <summary>
    /// WSC script version 2.
    /// </summary>
    WSC_V2,
}

/// <summary>
/// Extensions for ScriptVersion.
/// </summary>
public static class ScriptVersionExtensions
{
    /// <summary>
    /// Checks if the script version is WS2.
    /// </summary>
    public static bool IsWs2(this ScriptVersion version) => version < ScriptVersion.WSC_V1;

    /// <summary>
    /// Checks if the script version is WSC.
    /// </summary>
    public static bool IsWsc(this ScriptVersion version) => version >= ScriptVersion.WSC_V1;
}
