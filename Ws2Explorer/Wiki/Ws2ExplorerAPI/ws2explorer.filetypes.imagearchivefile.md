# ImageArchiveFile

Namespace: Ws2Explorer.FileTypes

Image archive file.
 Base for PnaFile and WipFile.

```csharp
public abstract class ImageArchiveFile : Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ImageArchiveFile](./ws2explorer.filetypes.imagearchivefile.md)<br>
Implements [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **HEADER_FILENAME**

The header file filename.

```csharp
public static string HEADER_FILENAME;
```

## Properties

### **Stream**

The underlying binary stream.

```csharp
public abstract BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **ImageCount**

The number of images in the image archive including empty images.

```csharp
public abstract int ImageCount { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ImageWidth**

The width of the space that the image archive image array takes up.

```csharp
public abstract int ImageWidth { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ImageHeight**

The height of the space that the image archive image array takes up.

```csharp
public abstract int ImageHeight { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **ImageArchiveFile()**

```csharp
protected ImageArchiveFile()
```

## Methods

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a new image archive file from subfiles.

```csharp
public abstract IArchive Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[IArchive](./ws2explorer.iarchive.md)<br>

### **ListFiles()**

Lists the (possibly virtual) subfiles.

```csharp
public abstract List<FileInfo> ListFiles()
```

#### Returns

[List&lt;FileInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **OpenFile(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Opens a subfile.
 The filename is case-insensitive.

```csharp
public abstract Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`filename` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **AddEntry(IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Adds a dummy PNG image and metadata to the image archive file,
 increasing the file count by 1.

```csharp
public Task<ImageArchiveFile> AddEntry(IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;ImageArchiveFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The new image archive file.

### **SwapEntry(String, String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Swaps the index of two (possibly empty) PNG images and their metadata.

```csharp
public Task<ImageArchiveFile> SwapEntry(string filename1, string filename2, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`filename1` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The PNG filename or PNG metadata filename of the image to swap.

`filename2` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The PNG filename or PNG metadata filename of the image to swap.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;ImageArchiveFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The new image archive file.

### **SwapEntry(Int32, Int32, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Swaps the index of two (possibly empty) PNG images and their metadata.

```csharp
public Task<ImageArchiveFile> SwapEntry(int index1, int index2, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`index1` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`index2` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;ImageArchiveFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The new image archive file.

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

Dispose the image archive file.

```csharp
public void Dispose()
```

### **Finalize()**

Dispose the image archive file.

```csharp
protected void Finalize()
```
