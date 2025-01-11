namespace Ws2Explorer;

public class ArchiveCreationException : Exception
{
    public ArchiveCreationException() { }
    public ArchiveCreationException(string? message) : base(message) { }
    public ArchiveCreationException(string? message, Exception? innerException) : base(message, innerException) { }

    internal static T Wrap<T>(Func<T> fn)
    {
        try
        {
            return fn();
        }
        catch (ArchiveCreationException)
        {
            throw;
        }
        catch (Exception ex)
        {
            throw new ArchiveCreationException("An error occurred while creating the archive.", ex);
        }
    }
}
