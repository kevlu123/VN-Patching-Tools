# PnaFile

Namespace: Ws2Explorer.FileTypes

A PNG array file.

```csharp
public sealed class PnaFile : ImageArchiveFile, Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.PnaFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.PnaFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ImageArchiveFile](./ws2explorer.filetypes.imagearchivefile.md) → [PnaFile](./ws2explorer.filetypes.pnafile.md)<br>
Implements [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IArchive&lt;PnaFile&gt;](./ws2explorer.iarchive-1.md), [IFile&lt;PnaFile&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **SIGNATURE**

The PNA file signature (PNAP).

```csharp
public static int SIGNATURE;
```

## Properties

### **Header**

The PNA file header.

```csharp
public PnaHeader Header { get; }
```

#### Property Value

[PnaHeader](./ws2explorer.filetypes.pnaheader.md)<br>

### **ImageMetadata**

The PNG image metadata.

```csharp
public ImmutableArray<PnaImageMetadata> ImageMetadata { get; }
```

#### Property Value

ImmutableArray&lt;PnaImageMetadata&gt;<br>

### **ImageCount**

The number of images in the PNA file including empty images.

```csharp
public int ImageCount { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ImageWidth**

The width of the space that the PNA image array takes up.

```csharp
public int ImageWidth { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ImageHeight**

The height of the space that the PNA image array takes up.

```csharp
public int ImageHeight { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a PNA file from a binary stream.

```csharp
public static PnaFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[PnaFile](./ws2explorer.filetypes.pnafile.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a PNA file from subfiles.

```csharp
public IArchive Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[IArchive](./ws2explorer.iarchive.md)<br>

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
