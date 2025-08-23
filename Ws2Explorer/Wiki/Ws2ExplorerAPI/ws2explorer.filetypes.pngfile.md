# PngFile

Namespace: Ws2Explorer.FileTypes

A PNG image file.

```csharp
public sealed class PngFile : Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.PngFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile, System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [PngFile](./ws2explorer.filetypes.pngfile.md)<br>
Implements [IFile&lt;PngFile&gt;](./ws2explorer.ifile-1.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **SIGNATURE**

The PNG signature.

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

### **ImageWidth**

The width of the image.

```csharp
public int ImageWidth { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ImageHeight**

The height of the image.

```csharp
public int ImageHeight { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a PNG file from a binary stream.

```csharp
public static PngFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[PngFile](./ws2explorer.filetypes.pngfile.md)<br>

### **Dispose()**

Disposes the PNG file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the PNG file.

```csharp
protected void Finalize()
```
