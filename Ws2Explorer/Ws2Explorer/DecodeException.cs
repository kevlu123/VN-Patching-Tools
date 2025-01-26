namespace Ws2Explorer;

public class DecodeException : Exception
{
    public DecodeException() { }
    public DecodeException(string? message) : base(message) { }
    public DecodeException(string? message, Exception? innerException) : base(message, innerException) { }

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
