# ScriptFile

Namespace: Ws2Explorer.FileTypes

Base for Ws2File and WscFile.

```csharp
public abstract class ScriptFile : Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ScriptFile](./ws2explorer.filetypes.scriptfile.md)<br>
Implements [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **SUMMARY_FILENAME**

The filename of the summary file.
 The summary file contains a human-readable summary of the script.

```csharp
public static string SUMMARY_FILENAME;
```

### **TEXT_FILENAME**

The filename of the text file.
 The text file contains the script's message and choice text in JSON format.

```csharp
public static string TEXT_FILENAME;
```

### **NEW_TEXT_FILENAME**

The filename of the new-text file.
 When creating a new script file, if the new-text file
 is present, it overwrites the script's message and choice text.
 This file is in the same format as the text file.
 A possible workflow is to take the text file, edit it,
 and reinsert it as the new-text file.

```csharp
public static string NEW_TEXT_FILENAME;
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
public abstract BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **Ops**

The ops of the script.

```csharp
public abstract ImmutableArray<Op> Ops { get; }
```

#### Property Value

ImmutableArray&lt;Op&gt;<br>

### **HasUnresolvedLabels**

Whether the script contains labels that do not point to a valid location.

```csharp
public abstract bool HasUnresolvedLabels { get; }
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

### **Text**

Get the message and choice text.

```csharp
public abstract ScriptText[] Text { get; }
```

#### Property Value

[ScriptText[]](./ws2explorer.filetypes.scripttext.md)<br>

## Constructors

### **ScriptFile()**

```csharp
protected ScriptFile()
```

## Methods

### **WithText(String[])**

Create a new script file with the message and choice text replaced.

```csharp
public abstract ScriptFile WithText(String[] text)
```

#### Parameters

`text` [String[]](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[ScriptFile](./ws2explorer.filetypes.scriptfile.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a script file from subfiles.
 Only [ScriptFile.OPS_FILENAME](./ws2explorer.filetypes.scriptfile.md#ops_filename) is required.

```csharp
public abstract IArchive Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[IArchive](./ws2explorer.iarchive.md)<br>

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
 [ScriptFile.SUMMARY_FILENAME](./ws2explorer.filetypes.scriptfile.md#summary_filename), [ScriptFile.TEXT_FILENAME](./ws2explorer.filetypes.scriptfile.md#text_filename), or [ScriptFile.OPS_FILENAME](./ws2explorer.filetypes.scriptfile.md#ops_filename).

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

Dispose the script file.

```csharp
public void Dispose()
```

### **Finalize()**

Dispose the script file.

```csharp
protected void Finalize()
```
