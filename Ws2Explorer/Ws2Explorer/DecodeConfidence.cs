namespace Ws2Explorer;

/// <summary>
/// Represents the confidence level of a decoded file.
/// </summary>
public enum DecodeConfidence
{
    /// <summary>
    /// The file decoded successfully but possibly could also
    /// decode as a different file type.
    /// </summary>
    Low = 0,

    /// <summary>
    /// The file decoded successfully and is likely the single correct file type.
    /// </summary>
    High = 1,
}
