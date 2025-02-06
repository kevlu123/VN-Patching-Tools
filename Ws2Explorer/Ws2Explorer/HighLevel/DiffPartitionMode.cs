namespace Ws2Explorer.HighLevel;

/// <summary>
/// Flags used for <see cref="FileTool.Diff(IEnumerable{IFolder}, IEnumerable{IFolder}, DiffPartitionMode, IProgress{Ws2Explorer.TaskProgressInfo}?, CancellationToken)" />.
/// and <see cref="FileTool.Diff(IFolder, IFolder, DiffPartitionMode, IProgress{Ws2Explorer.TaskProgressInfo}?, CancellationToken)" />.
/// </summary>
[Flags]
public enum DiffPartitionMode
{
    /// <summary>
    /// Match no files.
    /// </summary>
    None = 0,

    /// <summary>
    /// Match files only in the new folder.
    /// </summary>
    New = 1 << 0,

    /// <summary>
    /// Match files only in the old folder.
    /// </summary>
    Old = 1 << 1,

    /// <summary>
    /// Match files that exist unchanged in both folders.
    /// </summary>
    Common = 1 << 2,

    /// <summary>
    /// Match files that exist in both folders but have changed.
    /// </summary>
    Changed = 1 << 3,
}
