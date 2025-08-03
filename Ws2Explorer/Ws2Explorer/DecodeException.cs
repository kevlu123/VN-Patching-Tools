namespace Ws2Explorer;

/// <summary>
/// Exception thrown when an error occurs while decoding a file.
/// </summary>
public class DecodeException : Exception
{
    /// <summary>
    /// Initializes a new instance of the <see cref="DecodeException"/> class.
    /// </summary>
    public DecodeException() { }

    /// <summary>
    /// Initializes a new instance of the <see cref="DecodeException"/> class
    /// </summary>
    /// <param name="message"></param>
    public DecodeException(string? message)
        : base(message) { }

    /// <summary>
    /// Initializes a new instance of the <see cref="DecodeException"/> class
    /// </summary>
    /// <param name="message"></param>
    /// <param name="innerException"></param>
    public DecodeException(string? message, Exception? innerException)
        : base(message, innerException) { }

    internal static T Wrap<T>(Func<T> fn)
    {
        try
        {
            return fn();
        }
        catch (DecodeException)
        {
            throw;
        }
        catch (IndexOutOfRangeException ex)
        {
            throw new DecodeException("File is too short.", ex);
        }
        catch (Exception ex)
        {
            throw new DecodeException("An error occurred while decoding the file.", ex);
        }
    }

    internal static T Wrap<T>(Func<(T, DecodeConfidence)> fn, out DecodeConfidence confidence)
    {
        try
        {
            var (ret, c) = fn();
            confidence = c;
            return ret;
        }
        catch (DecodeException)
        {
            throw;
        }
        catch (IndexOutOfRangeException ex)
        {
            throw new DecodeException("File is too short.", ex);
        }
        catch (Exception ex)
        {
            throw new DecodeException("An error occurred while decoding the file.", ex);
        }
    }
}
