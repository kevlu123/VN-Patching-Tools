# WipFile

Namespace: Ws2Explorer.FileTypes

A legacy image array file.

```csharp
public sealed class WipFile : ImageArchiveFile, Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.WipFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.WipFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ImageArchiveFile](./ws2explorer.filetypes.imagearchivefile.md) → [WipFile](./ws2explorer.filetypes.wipfile.md)<br>
Implements [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IArchive&lt;WipFile&gt;](./ws2explorer.iarchive-1.md), [IFile&lt;WipFile&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **SIGNATURE**

WIP file signature as a little-endian 4-byte integer.

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

### **Header**

The WIP file header.

```csharp
public WipHeader Header { get; }
```

#### Property Value

[WipHeader](./ws2explorer.filetypes.wipheader.md)<br>

### **ImageMetadata**

The image metadata for each image in the WIP file.

```csharp
public ImmutableArray<WipImageMetadata> ImageMetadata { get; }
```

#### Property Value

ImmutableArray&lt;WipImageMetadata&gt;<br>

### **ImageCount**

The number of images in the WIP file including empty images.

```csharp
public int ImageCount { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ImageWidth**

The width of the space that the WIP image array takes up.

```csharp
public int ImageWidth { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ImageHeight**

The height of the space that the WIP image array takes up.

```csharp
public int ImageHeight { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a WIP file from a binary stream.

```csharp
public static WipFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[WipFile](./ws2explorer.filetypes.wipfile.md)<br>

### **ListFiles()**

Lists the (possibly virtual) subfiles.

```csharp
public List<FileInfo> ListFiles()
```

#### Returns

[List&lt;FileInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **OpenFile(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Opens a subfile.
 The filename is case-insensitive.

```csharp
public Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`filename` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a WIP file from subfiles.

```csharp
public IArchive Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[IArchive](./ws2explorer.iarchive.md)<br>
