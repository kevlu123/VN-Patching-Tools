# LZ77

Namespace: Ws2Explorer

LZ77 compression and decompression methods used by the game.

```csharp
public static class LZ77
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [LZ77](./ws2explorer.lz77.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Methods

### **Decompress(BinaryStream)**

Decompress a stream.

```csharp
public static BinaryStream Decompress(BinaryStream stream)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

#### Returns

[BinaryStream](./ws2explorer.binarystream.md)<br>

#### Exceptions

[InvalidDataException](https://docs.microsoft.com/en-us/dotnet/api/system.io.invaliddataexception)<br>

### **Compress(BinaryStream)**

Compress a stream.

```csharp
public static BinaryStream Compress(BinaryStream stream)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

#### Returns

[BinaryStream](./ws2explorer.binarystream.md)<br>
