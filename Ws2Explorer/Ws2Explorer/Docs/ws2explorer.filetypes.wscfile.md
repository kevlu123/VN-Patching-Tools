# WscFile

Namespace: Ws2Explorer.FileTypes

A WSC script file.

```csharp
public sealed class WscFile : Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.WscFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.WscFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [WscFile](./ws2explorer.filetypes.wscfile.md)<br>
Implements [IArchive&lt;WscFile&gt;](./ws2explorer.iarchive-1.md), [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IFile&lt;WscFile&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **SUMMARY_FILENAME**

The filename of the summary file.
 The summary file contains a human-readable summary of the script.

```csharp
public static string SUMMARY_FILENAME;
```

### **OPS_FILENAME**

The filename of the ops file.
 The ops file contains the script instructions in JSON format.

```csharp
public static string OPS_FILENAME;
```

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **Ops**

The ops of the script.

```csharp
public ImmutableArray<Op> Ops { get; }
```

#### Property Value

ImmutableArray&lt;Op&gt;<br>

### **HasUnresolvedLabels**

Whether the script contains labels that do not point to a valid location.

```csharp
public bool HasUnresolvedLabels { get; }
```

#### Property Value

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **Version**

The version of the script.

```csharp
public ScriptVersion Version { get; }
```

#### Property Value

[ScriptVersion](./ws2explorer.compiler.scriptversion.md)<br>

## Constructors

### **WscFile(IEnumerable&lt;Op&gt;)**

Constructs a WSC file from a list of ops.

```csharp
public WscFile(IEnumerable<Op> ops)
```

#### Parameters

`ops` [IEnumerable&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a WSC file from a binary stream.

```csharp
public static WscFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[WscFile](./ws2explorer.filetypes.wscfile.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a WSC file from subfiles.
 Only [WscFile.OPS_FILENAME](./ws2explorer.filetypes.wscfile.md#ops_filename) is required.

```csharp
public static WscFile Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[WscFile](./ws2explorer.filetypes.wscfile.md)<br>

### **ListFiles()**

Lists the virtual subfiles.

```csharp
public List<FileInfo> ListFiles()
```

#### Returns

[List&lt;FileInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **OpenFile(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Opens a virtual subfile.
 The filename is case-insensitive and can be
 [WscFile.SUMMARY_FILENAME](./ws2explorer.filetypes.wscfile.md#summary_filename) or [WscFile.OPS_FILENAME](./ws2explorer.filetypes.wscfile.md#ops_filename).

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

Disposes the WSC file.

```csharp
public void Dispose()
```
