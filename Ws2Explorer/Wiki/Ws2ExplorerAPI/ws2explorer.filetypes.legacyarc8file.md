# LegacyArc8File

Namespace: Ws2Explorer.FileTypes

A game archive file used in older games.
 This archive version has a max length of 8 bytes for filenames
 excluding the dot and extension.

```csharp
public sealed class LegacyArc8File : Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.LegacyArc8File, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.LegacyArc8File, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [LegacyArc8File](./ws2explorer.filetypes.legacyarc8file.md)<br>
Implements [IArchive&lt;LegacyArc8File&gt;](./ws2explorer.iarchive-1.md), [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IFile&lt;LegacyArc8File&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **GroupCount**

The number of groups (different file extensions) in the legacy ARC file.

```csharp
public int GroupCount { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **GroupHeaders**

The list of group headers.

```csharp
public IReadOnlyList<LegacyArcGroupHeader> GroupHeaders { get; }
```

#### Property Value

[IReadOnlyList&lt;LegacyArcGroupHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ireadonlylist-1)<br>

### **SubHeaders**

The subheaders describing each subfile.
 The keys are the filenames with extensions.
 The keys are case-insensitive.

```csharp
public IReadOnlyDictionary<string, LegacyArcSubHeader> SubHeaders { get; }
```

#### Property Value

[IReadOnlyDictionary&lt;String, LegacyArcSubHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ireadonlydictionary-2)<br>

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a legacy ARC file from a binary stream.

```csharp
public static LegacyArc8File Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[LegacyArc8File](./ws2explorer.filetypes.legacyarc8file.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a legacy ARC file from subfiles.

```csharp
public static LegacyArc8File Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[LegacyArc8File](./ws2explorer.filetypes.legacyarc8file.md)<br>

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

Disposes the legacy ARC file.

```csharp
public void Dispose()
```
