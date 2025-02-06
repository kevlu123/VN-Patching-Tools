# PanFile

Namespace: Ws2Explorer.FileTypes

A PAN file. (audio panning?)

```csharp
public sealed class PanFile : Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.PanFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.PanFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [PanFile](./ws2explorer.filetypes.panfile.md)<br>
Implements [IArchive&lt;PanFile&gt;](./ws2explorer.iarchive-1.md), [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IFile&lt;PanFile&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **SIGNATURE**

The PAN file signature (PAN2).

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

The PAN file header.

```csharp
public PanHeader Header { get; }
```

#### Property Value

[PanHeader](./ws2explorer.filetypes.panheader.md)<br>

### **Entries**

The entries in the PAN file.

```csharp
public IReadOnlyList<PanEntry> Entries { get; }
```

#### Property Value

[IReadOnlyList&lt;PanEntry&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ireadonlylist-1)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a PAN file from a binary stream.

```csharp
public static PanFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[PanFile](./ws2explorer.filetypes.panfile.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a PAN file from subfiles.
 Only one file is allowed, containing the JSON form of the PAN file.

```csharp
public static PanFile Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[PanFile](./ws2explorer.filetypes.panfile.md)<br>

### **ListFiles()**

Lists the virtual subfiles.

```csharp
public List<FileInfo> ListFiles()
```

#### Returns

[List&lt;FileInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **OpenFile(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Opens the JSON view of the PAN file.
 The filename passed is not used and can be anything.

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

Disposes the PAN file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the PAN file.

```csharp
protected void Finalize()
```
