# Ws2File

Namespace: Ws2Explorer.FileTypes

A WS2 script file.

```csharp
public sealed class Ws2File : Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.Ws2File, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.Ws2File, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [Ws2File](./ws2explorer.filetypes.ws2file.md)<br>
Implements [IArchive&lt;Ws2File&gt;](./ws2explorer.iarchive-1.md), [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IFile&lt;Ws2File&gt;](./ws2explorer.ifile-1.md)<br>
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

### **Ws2File(IEnumerable&lt;Op&gt;)**

Constructs a WS2 file from a list of ops.

```csharp
public Ws2File(IEnumerable<Op> ops)
```

#### Parameters

`ops` [IEnumerable&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a WS2 file from a binary stream.

```csharp
public static Ws2File Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[Ws2File](./ws2explorer.filetypes.ws2file.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a WS2 file from subfiles.
 Only [Ws2File.OPS_FILENAME](./ws2explorer.filetypes.ws2file.md#ops_filename) is required.

```csharp
public static Ws2File Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[Ws2File](./ws2explorer.filetypes.ws2file.md)<br>

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
 [Ws2File.SUMMARY_FILENAME](./ws2explorer.filetypes.ws2file.md#summary_filename) or [Ws2File.OPS_FILENAME](./ws2explorer.filetypes.ws2file.md#ops_filename).

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

Disposes the WS2 file.

```csharp
public void Dispose()
```
