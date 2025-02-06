# VideoFile

Namespace: Ws2Explorer.FileTypes

A WMV video file.

```csharp
public sealed class VideoFile : Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.VideoFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile, System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [VideoFile](./ws2explorer.filetypes.videofile.md)<br>
Implements [IFile&lt;VideoFile&gt;](./ws2explorer.ifile-1.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

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

Decodes a video file from a binary stream.

```csharp
public static VideoFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[VideoFile](./ws2explorer.filetypes.videofile.md)<br>

### **Dispose()**

Disposes the video file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the video file.

```csharp
protected void Finalize()
```
