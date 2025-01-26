namespace Ws2Explorer.Compiler;

class DecryptedStream : RotationStream {
    public DecryptedStream(Stream stream) : base(stream, 6) { }
}
