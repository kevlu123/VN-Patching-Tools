# BinaryStreamExtensions

Namespace: Ws2Explorer

Extension methods for [Task&lt;TResult&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1).

```csharp
public static class BinaryStreamExtensions
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [BinaryStreamExtensions](./ws2explorer.binarystreamextensions.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [ExtensionAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.extensionattribute)

## Methods

### **Decode&lt;T&gt;(Task&lt;BinaryStream&gt;, Boolean)**

Decodes the binary stream into a file.
 See [BinaryStream.Decode&lt;T&gt;(Boolean)](./ws2explorer.binarystream.md#decodetboolean).

```csharp
public static Task<T> Decode<T>(Task<BinaryStream> self, bool decRef)
```

#### Type Parameters

`T`<br>

#### Parameters

`self` [Task&lt;BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

`decRef` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

#### Returns

Task&lt;T&gt;<br>

### **Decode(Task&lt;BinaryStream&gt;, IProgress&lt;TaskProgressInfo&gt;, CancellationToken, Boolean)**

Decodes the binary stream into a file.
 See [BinaryStream.Decode(IProgress&lt;TaskProgressInfo&gt;, CancellationToken, Boolean)](./ws2explorer.binarystream.md#decodeiprogresstaskprogressinfo-cancellationtoken-boolean).

```csharp
public static Task<IFile> Decode(Task<BinaryStream> self, IProgress<TaskProgressInfo> progress, CancellationToken ct, bool decRef)
```

#### Parameters

`self` [Task&lt;BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

`decRef` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

#### Returns

[Task&lt;IFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **DecodeWithHint&lt;Hint&gt;(Task&lt;BinaryStream&gt;, IProgress&lt;TaskProgressInfo&gt;, CancellationToken, Boolean, DecodeConfidence)**

Decodes the binary stream into a file.
 See [BinaryStream.DecodeWithHint&lt;Hint&gt;(IProgress&lt;TaskProgressInfo&gt;, CancellationToken, Boolean, DecodeConfidence)](./ws2explorer.binarystream.md#decodewithhinthintiprogresstaskprogressinfo-cancellationtoken-boolean-decodeconfidence).

```csharp
public static Task<IFile> DecodeWithHint<Hint>(Task<BinaryStream> self, IProgress<TaskProgressInfo> progress, CancellationToken ct, bool decRef, DecodeConfidence requiredHintConfidence)
```

#### Type Parameters

`Hint`<br>

#### Parameters

`self` [Task&lt;BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

`decRef` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

`requiredHintConfidence` [DecodeConfidence](./ws2explorer.decodeconfidence.md)<br>

#### Returns

[Task&lt;IFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **DecodeWithHint(Task&lt;BinaryStream&gt;, String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken, Boolean, DecodeConfidence)**

Decodes the binary stream into a file.
 See [BinaryStream.DecodeWithHint(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken, Boolean, DecodeConfidence)](./ws2explorer.binarystream.md#decodewithhintstring-iprogresstaskprogressinfo-cancellationtoken-boolean-decodeconfidence).

```csharp
public static Task<IFile> DecodeWithHint(Task<BinaryStream> self, string filename, IProgress<TaskProgressInfo> progress, CancellationToken ct, bool decRef, DecodeConfidence requiredHintConfidence)
```

#### Parameters

`self` [Task&lt;BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

`filename` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

`decRef` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

`requiredHintConfidence` [DecodeConfidence](./ws2explorer.decodeconfidence.md)<br>

#### Returns

[Task&lt;IFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>
