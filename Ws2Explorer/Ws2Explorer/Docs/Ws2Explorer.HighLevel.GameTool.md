# GameTool

Namespace: Ws2Explorer.HighLevel

Utilities for game operations.

```csharp
public static class GameTool
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [GameTool](./ws2explorer.highlevel.gametool.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [ExtensionAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.extensionattribute)

## Methods

### **FindGameFolder(IList&lt;NamedFolder&gt;)**

Finds the game folder given a hierarchy which is
 descended from the game folder.
 The game folder is found by looking for a file named "AdvHD.exe".
 The game folder must be a real directory.

```csharp
public static Directory FindGameFolder(IList<NamedFolder> hierarchy)
```

#### Parameters

`hierarchy` [IList&lt;NamedFolder&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ilist-1)<br>

#### Returns

[Directory](./ws2explorer.filetypes.directory.md)<br>
The game folder or null if it is not found.

### **FindReferences(Directory, String, StringComparison, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Finds all references to a string in the game's WS2 scripts
 Only string arguments of instructions are searched.
 Only archives containing "rio" and ending with ".arc" are considered.

```csharp
public static Task<Dictionary<string, int>> FindReferences(Directory gameFolder, string str, StringComparison comparisonType, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`gameFolder` [Directory](./ws2explorer.filetypes.directory.md)<br>

`str` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`comparisonType` [StringComparison](https://docs.microsoft.com/en-us/dotnet/api/system.stringcomparison)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;Dictionary&lt;String, Int32&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
The script filenames that contain the string and
 the number of occurrences in that script.

### **SetEntryPoint(Directory, Func&lt;String, IEnumerable&lt;String&gt;, String&gt;, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Sets the WS2 script entry point of the game.
 The first script loaded is always start.ws2.
 This operation will set the next file that start.ws2 jumps to.
 Only archives containing "rio" and ending with ".arc" are considered.

```csharp
public static Task SetEntryPoint(Directory gameFolder, Func<string, IEnumerable<string>, string> setEntryPrompt, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`gameFolder` [Directory](./ws2explorer.filetypes.directory.md)<br>

`setEntryPrompt` [Func&lt;String, IEnumerable&lt;String&gt;, String&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.func-3)<br>
A function to get the new entry point to be set.
 This first parameter of this function is the current entry point.
 The second parameter is the list of available entry points.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>

### **ConvertLuacToText(Directory, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Converts all compiled lua scripts to text form.
 This is done by storing the file as a byte array in lua
 and calling load on it. This does not decompile the script.
 Only the archive called "script.arc" is considered.

```csharp
public static Task ConvertLuacToText(Directory gameFolder, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`gameFolder` [Directory](./ws2explorer.filetypes.directory.md)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>

### **GetChoices(Directory, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Gets all choices in the game from the WS2 scripts.
 Only archives containing "rio" and ending with ".arc" are considered.

```csharp
public static Task<List<ChoiceInfo>> GetChoices(Directory gameFolder, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`gameFolder` [Directory](./ws2explorer.filetypes.directory.md)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;List&lt;ChoiceInfo&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
A list of choice group information.

### **GetFlowchart(Directory, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Gets the flow of the game's WS2 scripts.
 Not necessarily all the paths will be reachable and
 sometimes the scripts will reference non-existent scripts.

```csharp
public static Task<Dictionary<string, List<string>>> GetFlowchart(Directory gameFolder, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`gameFolder` [Directory](./ws2explorer.filetypes.directory.md)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;Dictionary&lt;String, List&lt;String&gt;&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
A map of where a script leads.
 The dictionary value is the list of scripts that the script leads to
 in order of appearance and may contain duplicates.

### **GetFlowchart(ArcFile, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Gets the flow of the WS2 scripts in an [ArcFile](./ws2explorer.filetypes.arcfile.md) .
 Not necessarily all the paths will be reachable and
 sometimes the scripts will reference non-existent scripts.

```csharp
public static Task<Dictionary<string, List<string>>> GetFlowchart(ArcFile arc, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`arc` [ArcFile](./ws2explorer.filetypes.arcfile.md)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;Dictionary&lt;String, List&lt;String&gt;&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
A map of where a script leads.
 The dictionary value is the list of scripts that the script leads to
 in order of appearance and may contain duplicates.

### **ModifyNames(Directory, Func&lt;IEnumerable&lt;String&gt;, Dictionary&lt;String, String&gt;&gt;, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Modifies the character names in the game.
 Only archives containing "rio" and ending with ".arc" are considered.

```csharp
public static Task ModifyNames(Directory gameFolder, Func<IEnumerable<string>, Dictionary<string, string>> modifyNamesPrompt, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`gameFolder` [Directory](./ws2explorer.filetypes.directory.md)<br>

`modifyNamesPrompt` [Func&lt;IEnumerable&lt;String&gt;, Dictionary&lt;String, String&gt;&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.func-2)<br>
A function to get the name change mapping. Names that do not appear
 in the mapping will not be changed.
 The parameter is the list of names that currently exist in the game.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>
