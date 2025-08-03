# FileTool

Namespace: Ws2Explorer.HighLevel

Utilities for file operations.

```csharp
public static class FileTool
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [FileTool](./ws2explorer.highlevel.filetool.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Methods

### **OpenFolderHierarchy(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Opens a list of folders from a path.
 The path may point inside archives.
 The first folder is the root directory and
 the next folders are direct subfolders of the previous folder.
 This is useful for navigation, and for operations need to propagate
 changes back to the real filesystem (rather than staying in memory).

```csharp
public static Task<DisposingList<NamedFolder>> OpenFolderHierarchy(string path, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`path` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;DisposingList&lt;NamedFolder&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **PropagateModifications(IList&lt;NamedFolder&gt;, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Propagates modifications in the last folder to the parent folders,
 moving up the hierarchy until a real directory is reached
 (where the changes are written to the filesystem).

```csharp
public static Task PropagateModifications(IList<NamedFolder> hierarchy, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`hierarchy` [IList&lt;NamedFolder&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ilist-1)<br>
The input folder hierarchy.
 After the operation, this list is modified to contain the updated folders.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>

### **ReadFile(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Reads the data from a path.
 The path may point inside archives.

```csharp
public static Task<BinaryStream> ReadFile(string path, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`path` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **ReadFiles(IEnumerable&lt;String&gt;, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Batch reads data from multiple paths.
 The paths may point inside archives.

```csharp
public static Task<DisposingDictionary<string, BinaryStream>> ReadFiles(IEnumerable<string> paths, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`paths` [IEnumerable&lt;String&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;DisposingDictionary&lt;String, BinaryStream&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **WriteFile(String, BinaryStream, OverwriteMode, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Writes data to a path.
 The path may point inside archives.

```csharp
public static Task WriteFile(string path, BinaryStream stream, OverwriteMode overwriteMode, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`path` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`overwriteMode` [OverwriteMode](./ws2explorer.highlevel.overwritemode.md)<br>
The policy used when writing to a file that already exists.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>

### **ModifyFolder(IArchive, Action&lt;IDictionary&lt;String, BinaryStream&gt;&gt;, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Modifies an archive.

```csharp
public static Task<IArchive> ModifyFolder(IArchive archive, Action<IDictionary<string, BinaryStream>> modify, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`archive` [IArchive](./ws2explorer.iarchive.md)<br>
The archive to modify.

`modify` [Action&lt;IDictionary&lt;String, BinaryStream&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.action-1)<br>
The function to modify the contents of the archive.
 The dictionary parameter receives the subfiles in the
 archive. This dictionary is to be modified.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;IArchive&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The modified archive.

### **ModifyFolder(IArchive, Func&lt;IDictionary&lt;String, BinaryStream&gt;, Task&gt;, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Modifies an archive.

```csharp
public static Task<IArchive> ModifyFolder(IArchive archive, Func<IDictionary<string, BinaryStream>, Task> modify, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`archive` [IArchive](./ws2explorer.iarchive.md)<br>
The archive to modify.

`modify` [Func&lt;IDictionary&lt;String, BinaryStream&gt;, Task&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.func-2)<br>
The awaitable function to modify the contents of the archive.
 The dictionary parameter receives the subfiles in the
 archive. This dictionary is to be modified.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;IArchive&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The modified archive.

### **Rename(IArchive, String, String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Renames a subfile in an archive.

```csharp
public static Task<IArchive> Rename(IArchive archive, string oldName, string newName, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`archive` [IArchive](./ws2explorer.iarchive.md)<br>
The archive to modify.

`oldName` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The subfile to rename.

`newName` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The new name of the subfile.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;IArchive&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The modified archive.

### **Rename(IList&lt;NamedFolder&gt;, String, String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Renames a subfile in a folder and propagates the changes
 up the hierarchy.

```csharp
public static Task Rename(IList<NamedFolder> hierarchy, string oldName, string newName, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`hierarchy` [IList&lt;NamedFolder&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ilist-1)<br>
The hierarchy that the changes will propagate through.
 The last folder will have the file renamed.

`oldName` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The subfile to rename.

`newName` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The new name of the subfile.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>

### **Delete(IList&lt;NamedFolder&gt;, IEnumerable&lt;String&gt;, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Deletes subfiles from a folder and propagates the changes
 up the hierarchy.

```csharp
public static Task Delete(IList<NamedFolder> hierarchy, IEnumerable<string> names, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`hierarchy` [IList&lt;NamedFolder&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ilist-1)<br>
The hierarchy that the changes will propagate through.
 The last folder will have the subfiles deleted.

`names` [IEnumerable&lt;String&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>
The subfiles to delete.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>

### **Insert(IArchive, IDictionary&lt;String, BinaryStream&gt;, OverwriteMode, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Inserts subfiles into an archive.

```csharp
public static Task<IArchive> Insert(IArchive archive, IDictionary<string, BinaryStream> streams, OverwriteMode overwriteMode, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`archive` [IArchive](./ws2explorer.iarchive.md)<br>
The archive to modify/

`streams` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>
A map of the new files to insert.

`overwriteMode` [OverwriteMode](./ws2explorer.highlevel.overwritemode.md)<br>
The policy used when writing to a file that already exists.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;IArchive&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The modified archive.

### **Insert(IList&lt;NamedFolder&gt;, IDictionary&lt;String, BinaryStream&gt;, OverwriteMode, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Inserts subfiles into a folder and propagates the changes
 up the hierarchy.

```csharp
public static Task Insert(IList<NamedFolder> hierarchy, IDictionary<string, BinaryStream> streams, OverwriteMode overwriteMode, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`hierarchy` [IList&lt;NamedFolder&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ilist-1)<br>
The hierarchy that the changes will propagate through.

`streams` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>
A map of the new files to insert.

`overwriteMode` [OverwriteMode](./ws2explorer.highlevel.overwritemode.md)<br>
The policy used when writing to a file that already exists.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>

### **Copy(String, String, OverwriteMode, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Copies a file from a source path to a destination path.
 The paths may point inside archives.

```csharp
public static Task Copy(string src, string dst, OverwriteMode overwriteMode, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`src` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`dst` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`overwriteMode` [OverwriteMode](./ws2explorer.highlevel.overwritemode.md)<br>
The policy used when writing to a file that already exists.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>

### **RecursiveExtract(IFolder, String, Regex, OverwriteMode, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Recursively extracts all files matching a pattern from a folder
 to a destination path.
 The path may point inside archives.

```csharp
public static Task<HashSet<string>> RecursiveExtract(IFolder folder, string dst, Regex pattern, OverwriteMode overwriteMode, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`folder` [IFolder](./ws2explorer.ifolder.md)<br>

`dst` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`pattern` Regex<br>
The pattern to match.

`overwriteMode` [OverwriteMode](./ws2explorer.highlevel.overwritemode.md)<br>
The policy used when writing to a file that already exists.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;HashSet&lt;String&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The paths of the extracted files relative to the source folder.

### **Diff(IFolder, IFolder, DiffPartitionMode, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Compares the subfiles in two archives.

```csharp
public static Task<DisposingDictionary<string, BinaryStream>> Diff(IFolder oldArchive, IFolder newArchive, DiffPartitionMode partitionMode, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`oldArchive` [IFolder](./ws2explorer.ifolder.md)<br>

`newArchive` [IFolder](./ws2explorer.ifolder.md)<br>

`partitionMode` [DiffPartitionMode](./ws2explorer.highlevel.diffpartitionmode.md)<br>
Flags listing the category of files to be returned.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;DisposingDictionary&lt;String, BinaryStream&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **Diff(IEnumerable&lt;IFolder&gt;, IEnumerable&lt;IFolder&gt;, DiffPartitionMode, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Compares the subfiles in two sets of archives.
 If a subfile appears twice in the same set, the result is unspecified.

```csharp
public static Task<DisposingDictionary<string, BinaryStream>> Diff(IEnumerable<IFolder> oldArchives, IEnumerable<IFolder> newArchives, DiffPartitionMode partitionMode, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`oldArchives` [IEnumerable&lt;IFolder&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

`newArchives` [IEnumerable&lt;IFolder&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

`partitionMode` [DiffPartitionMode](./ws2explorer.highlevel.diffpartitionmode.md)<br>
Flags listing the category of files to be returned.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;DisposingDictionary&lt;String, BinaryStream&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **SplitPath(String)**

Splits a path into its parts.

```csharp
public static List<string> SplitPath(string path)
```

#### Parameters

`path` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[List&lt;String&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **AlternativeName(String, IEnumerable&lt;String&gt;)**

Generates an alternative name for a file that does not conflict with existing names.

```csharp
public static string AlternativeName(string name, IEnumerable<string> existingNames)
```

#### Parameters

`name` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`existingNames` [IEnumerable&lt;String&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
