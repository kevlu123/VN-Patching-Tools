using System.Drawing;
using System.Runtime.Versioning;

namespace Ws2Explorer;

public class ImageFile : BinaryFile {
    private static readonly byte[] MAGIC1 = new byte[] {
       0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
    };
    private static readonly byte[] MAGIC2 = new byte[] {
       0xFF, 0xD8, 0xFF, 0xE0, 0x00, 0x10, 0x4A, 0x46, 0x49, 0x46, 0x00, 0x01,
    };
    private static readonly byte[] MAGIC3 = new byte[] {
       0xFF, 0xD8, 0xFF, 0xEE,
    };
    private static readonly byte[] MAGIC4 = new byte[] {
       0xFF, 0xD8, 0xFF, 0xE1,
    };
    private static readonly byte[] MAGIC5 = new byte[] {
       0xFF, 0xD8, 0xFF, 0xE0,
    };

    private readonly Image? image = null;

    [SupportedOSPlatform("windows6.1")]
    public Image Image => image ?? throw new PlatformNotSupportedException();
    public string ImageType { get; }

    public ImageFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        var (data, start, _) = stream.RawBuffer;
        foreach (var magic in new[] { MAGIC1, MAGIC2, MAGIC3, MAGIC4, MAGIC5 }) {
            if (stream.Length < magic.Length) {
                continue;
            }

            var slice = data.Skip(start).Take(magic.Length);
            if (slice.SequenceEqual(magic)) {
                if (OperatingSystem.IsWindows() && OperatingSystem.IsWindowsVersionAtLeast(6, 1)) {
                    image = Image.FromStream(stream.MemoryStream);
                }
                ImageType = magic == MAGIC1 ? "PNG" : "JPEG";
                return;
            }
        }
        throw new InvalidDataException("Invalid header");
    }
}
