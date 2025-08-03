namespace Ws2Explorer;

/// <summary>
/// Exception thrown when an error occurs while encoding an archive.
/// </summary>
public class ArchiveCreationException : Exception
{
    /// <summary>
    /// Initializes a new instance of the <see cref="ArchiveCreationException"/> class.
    /// </summary>
    public ArchiveCreationException() { }

    /// <summary>
    /// Initializes a new instance of the <see cref="ArchiveCreationException"/> class
    /// </summary>
    /// <param name="message"></param>
    public ArchiveCreationException(string? message)
        : base(message) { }

    /// <summary>
    /// Initializes a new instance of the <see cref="ArchiveCreationException"/> class
    /// </summary>
    /// <param name="message"></param>
    /// <param name="innerException"></param>
    public ArchiveCreationException(string? message, Exception? innerException)
        : base(message, innerException) { }

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

    internal static void Wrap(Action fn)
    {
        try
        {
            fn();
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
