# OtfFile

Namespace: Ws2Explorer.FileTypes

An open type font file.

```csharp
public sealed class OtfFile : Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.OtfFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile, System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [OtfFile](./ws2explorer.filetypes.otffile.md)<br>
Implements [IFile&lt;OtfFile&gt;](./ws2explorer.ifile-1.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **SIGNATURE**

OTF file signature as little-endian int.

```csharp
public static int SIGNATURE;
```

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes an OTF file from a binary stream.

```csharp
public static OtfFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[OtfFile](./ws2explorer.filetypes.otffile.md)<br>

### **Dispose()**

Disposes the OTF file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the OTF file.

```csharp
protected void Finalize()
```
