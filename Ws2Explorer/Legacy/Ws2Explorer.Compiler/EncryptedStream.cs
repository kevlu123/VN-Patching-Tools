namespace Ws2Explorer.Compiler;

class EncryptedStream : RotationStream {
    public EncryptedStream(Stream stream) : base(stream, 2) { }
}
