namespace Ws2Explorer.HighLevel;

public record class NamedFolder : IDisposable
{
    private bool disposedValue;

    public required IFolder Folder { get; init; }
    public required string Name { get; init; }

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

    ~NamedFolder()
    {
        Dispose();
    }
}
