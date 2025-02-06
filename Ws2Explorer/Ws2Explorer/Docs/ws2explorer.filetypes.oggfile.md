# OggFile

Namespace: Ws2Explorer.FileTypes

An OGG audio file.

```csharp
public sealed class OggFile : Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.OggFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile, System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [OggFile](./ws2explorer.filetypes.oggfile.md)<br>
Implements [IFile&lt;OggFile&gt;](./ws2explorer.ifile-1.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **SampleRate**

The sample rate of the audio.

```csharp
public int SampleRate { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **SampleCount**

The number of samples in the audio.

```csharp
public long SampleCount { get; }
```

#### Property Value

[Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64)<br>

### **ChannelCount**

The number of channels in the audio.

```csharp
public int ChannelCount { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Duration**

The duration of the audio in seconds.

```csharp
public float Duration { get; }
```

#### Property Value

[Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes an OGG file from a binary stream.

```csharp
public static OggFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[OggFile](./ws2explorer.filetypes.oggfile.md)<br>

### **Dispose()**

Disposes the OGG file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the OGG file.

```csharp
protected void Finalize()
```
