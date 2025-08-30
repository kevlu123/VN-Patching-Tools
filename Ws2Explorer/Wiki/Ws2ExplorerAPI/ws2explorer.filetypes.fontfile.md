# FontFile

Namespace: Ws2Explorer.FileTypes

Base class for TtfFile and OtfFile.

```csharp
public abstract class FontFile : Ws2Explorer.IFile, System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [FontFile](./ws2explorer.filetypes.fontfile.md)<br>
Implements [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **FontMeasurer**

Gets a font measurer object.

```csharp
public FontMeasurer FontMeasurer { get; }
```

#### Property Value

[FontMeasurer](./ws2explorer.fontmeasurer.md)<br>

## Constructors

### **FontFile(BinaryStream, Int32, DecodeConfidence&)**

Initializes a new instance of the [FontFile](./ws2explorer.filetypes.fontfile.md) class.

```csharp
protected FontFile(BinaryStream stream, int signature, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>
The binary stream.

`signature` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>
The expected 4-byte little endian file signature.

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>
The decode confidence.

## Methods

### **Dispose()**

Disposes the font file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the font file.

```csharp
protected void Finalize()
```
