namespace Ws2Explorer.HighLevel;

/// <summary>
/// A folder with a name wrapped in a disposable object.
/// This is useful for working with folder hierarchies
/// where changes need to be propagated to the parent folder
/// and the child name needs to be known.
/// </summary>
public record class NamedFolder : IDisposable
{
    private bool disposedValue;

    /// <summary>
    /// The folder.
    /// </summary>
    public required IFolder Folder { get; init; }

    /// <summary>
    /// The name of the folder.
    /// </summary>
    public required string Name { get; init; }

    /// <summary>
    /// Disposes the folder if it is disposable.
    /// </summary>
    public void Dispose()
    {
        if (!disposedValue)
        {
            if (Folder is IDisposable disposable)
            {
                disposable.Dispose();
            }
            disposedValue = true;
        }
        GC.SuppressFinalize(this);
    }

    /// <summary>
    /// Disposes the folder if it is disposable.
    /// </summary>
    ~NamedFolder()
    {
        Dispose();
    }
}
