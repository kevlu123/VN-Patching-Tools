# PnaFile

Namespace: Ws2Explorer.FileTypes

A PNG array file.

```csharp
public sealed class PnaFile : Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.PnaFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.PnaFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [PnaFile](./ws2explorer.filetypes.pnafile.md)<br>
Implements [IArchive&lt;PnaFile&gt;](./ws2explorer.iarchive-1.md), [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IFile&lt;PnaFile&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **SIGNATURE**

The PNA file signature (PNAP).

```csharp
public static int SIGNATURE;
```

### **HEADER_FILENAME**

The header file filename.

```csharp
public static string HEADER_FILENAME;
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
public static PnaFile Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[PnaFile](./ws2explorer.filetypes.pnafile.md)<br>

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

### **AddEntry(IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Adds a dummy PNG image and metadata to the PNA file,
 increasing the file count by 1.

```csharp
public Task<PnaFile> AddEntry(IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;PnaFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The new PNA file.

### **SwapEntry(String, String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Swaps the index of two (possibly empty) PNG images and their metadata.

```csharp
public Task<PnaFile> SwapEntry(string filename1, string filename2, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`filename1` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The PNG filename or PNG metadata filename of the image to swap.

`filename2` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The PNG filename or PNG metadata filename of the image to swap.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;PnaFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The new PNA file.

### **SwapEntry(Int32, Int32, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Swaps the index of two (possibly empty) PNG images and their metadata.

```csharp
public Task<PnaFile> SwapEntry(int index1, int index2, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`index1` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`index2` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;PnaFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The new PNA file.

### **ImageName(Int32)**

Gets the PNG filename from the index.

```csharp
public static string ImageName(int index)
```

#### Parameters

`index` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **MetaName(Int32)**

Gets the PNG metadata filename from the index.

```csharp
public static string MetaName(int index)
```

#### Parameters

`index` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **ImageIndex(String)**

Gets the index of the PNG file from the filename.
 e.g. "img21.png" -&gt; 21

```csharp
public static Nullable<int> ImageIndex(string name)
```

#### Parameters

`name` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[Nullable&lt;Int32&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.nullable-1)<br>

### **MetaIndex(String)**

Gets the index of the corresponding PNG file from a PNG metadata filename.
 e.g. "meta21.json" -&gt; 21

```csharp
public static Nullable<int> MetaIndex(string name)
```

#### Parameters

`name` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[Nullable&lt;Int32&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.nullable-1)<br>

### **Dispose()**

Disposes the PNA file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the PNA file.

```csharp
protected void Finalize()
```
