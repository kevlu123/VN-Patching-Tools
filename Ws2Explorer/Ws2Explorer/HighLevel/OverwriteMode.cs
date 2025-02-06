namespace Ws2Explorer.HighLevel;

/// <summary>
/// The policy used when writing to a file that already exists.
/// </summary>
public enum OverwriteMode
{
    /// <summary>
    /// Throw an exception if the file already exists.
    /// </summary>
    Throw,

    /// <summary>
    /// Overwrite the file if it already exists.
    /// </summary>
    Overwrite,

    /// <summary>
    /// Use an alternative name if it already exists.
    /// </summary>
    Rename,

    /// <summary>
    /// Do not write to the file if it already exists.
    /// </summary>
    Skip,
}
