# ArcFile

Namespace: Ws2Explorer.FileTypes

A game archive file.

```csharp
public sealed class ArcFile : Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.ArcFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.ArcFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ArcFile](./ws2explorer.filetypes.arcfile.md)<br>
Implements [IArchive&lt;ArcFile&gt;](./ws2explorer.iarchive-1.md), [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IFile&lt;ArcFile&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **Header**

The ARC file header.

```csharp
public ArcHeader Header { get; }
```

#### Property Value

[ArcHeader](./ws2explorer.filetypes.archeader.md)<br>

### **SubHeaders**

The ARC file subheaders.
 The keys are the filenames with extensions.
 The keys are case-insensitive.

```csharp
public IReadOnlyDictionary<string, ArcSubHeader> SubHeaders { get; }
```

#### Property Value

[IReadOnlyDictionary&lt;String, ArcSubHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ireadonlydictionary-2)<br>

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes an ARC file from a binary stream.

```csharp
public static ArcFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[ArcFile](./ws2explorer.filetypes.arcfile.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs an ARC file from subfiles.

```csharp
public static ArcFile Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[ArcFile](./ws2explorer.filetypes.arcfile.md)<br>

### **ListFiles()**

Lists the subfiles.

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

### **Dispose()**

Disposes the ARC file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the ARC file.

```csharp
protected void Finalize()
```
