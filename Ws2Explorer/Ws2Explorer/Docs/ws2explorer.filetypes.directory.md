# Directory

Namespace: Ws2Explorer.FileTypes

A real directory on the filesystem.

```csharp
public class Directory : Ws2Explorer.IFolder
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [Directory](./ws2explorer.filetypes.directory.md)<br>
Implements [IFolder](./ws2explorer.ifolder.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **IsRoot**

Whether the directory is the root directory.

```csharp
public bool IsRoot { get; }
```

#### Property Value

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **FullPath**

The full path of the directory.

```csharp
public string FullPath { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **DirectoryName**

The name of the directory.

```csharp
public string DirectoryName { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Constructors

### **Directory(String)**

Constructs a directory from a path.
 The directory must exist.

```csharp
public Directory(string path)
```

#### Parameters

`path` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Methods

### **ListFiles()**

Lists the files and directories in the directory.

```csharp
public List<FileInfo> ListFiles()
```

#### Returns

[List&lt;FileInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **OpenFile(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Opens a binary stream to the file with the given name.

```csharp
public Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`filename` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **OpenDirectory(String)**

Opens a directory with the given name.

```csharp
public IFolder OpenDirectory(string name)
```

#### Parameters

`name` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[IFolder](./ws2explorer.ifolder.md)<br>

### **OpenParentDirectory()**

Opens the parent directory.

```csharp
public Directory OpenParentDirectory()
```

#### Returns

[Directory](./ws2explorer.filetypes.directory.md)<br>

### **WriteFile(String, BinaryStream, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Writes a file to the directory.

```csharp
public Task WriteFile(string filename, BinaryStream stream, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`filename` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>
