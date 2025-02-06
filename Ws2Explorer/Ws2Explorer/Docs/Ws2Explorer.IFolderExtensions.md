# IFolderExtensions

Namespace: Ws2Explorer

Extension methods for [IFolder](./ws2explorer.ifolder.md).

```csharp
public static class IFolderExtensions
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [IFolderExtensions](./ws2explorer.ifolderextensions.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [ExtensionAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.extensionattribute)

## Methods

### **LoadAllStreams(IFolder, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Loads all subfiles of the folder as binary streams.

```csharp
public static Task<DisposingDictionary<string, BinaryStream>> LoadAllStreams(IFolder self, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`self` [IFolder](./ws2explorer.ifolder.md)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;DisposingDictionary&lt;String, BinaryStream&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **LoadAllFiles(IFolder, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Loads all subfiles of the folder and decodes them.

```csharp
public static Task<DisposingDictionary<string, IFile>> LoadAllFiles(IFolder self, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`self` [IFolder](./ws2explorer.ifolder.md)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;DisposingDictionary&lt;String, IFile&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **LoadAllFilesOfType&lt;T&gt;(IFolder, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Loads all subfiles of the folder, decodes them, and
 returns the files that decoded as the specified type.

```csharp
public static Task<DisposingDictionary<string, T>> LoadAllFilesOfType<T>(IFolder self, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Type Parameters

`T`<br>

#### Parameters

`self` [IFolder](./ws2explorer.ifolder.md)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

Task&lt;DisposingDictionary&lt;String, T&gt;&gt;<br>
