# BinaryStream

Namespace: Ws2Explorer

A class holding binary data.
 The internal data is reference counted and a new
 instance of [BinaryStream](./ws2explorer.binarystream.md) has a reference count of 1.
 The data must be less than 2GB.

```csharp
public sealed class BinaryStream : System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [BinaryStream](./ws2explorer.binarystream.md)<br>
Implements [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **Empty**

An empty binary stream.

```csharp
public static BinaryStream Empty;
```

## Properties

### **Length**

Gets the length of the stream.

```csharp
public int Length { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Writable**

Gets a value indicating whether the stream is writable.

```csharp
public bool Writable { get; private set; }
```

#### Property Value

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **Span**

Gets the data as a Span.

```csharp
public Span<byte> Span { get; }
```

#### Property Value

[Span&lt;Byte&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.span-1)<br>

### **Memory**

Gets the data as a Memory.

```csharp
public Memory<byte> Memory { get; }
```

#### Property Value

[Memory&lt;Byte&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.memory-1)<br>

## Constructors

### **BinaryStream(String)**

Constructs a new binary stream from a non-null terminated UTF-8 string.

```csharp
public BinaryStream(string utf8Data)
```

#### Parameters

`utf8Data` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **BinaryStream(Byte[])**

Constructs a new binary stream from a byte array.

```csharp
public BinaryStream(Byte[] data)
```

#### Parameters

`data` [Byte[]](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **BinaryStream(Byte[], Int32, Int32)**

Constructs a new binary stream from part of a byte array.

```csharp
public BinaryStream(Byte[] data, int offset, int len)
```

#### Parameters

`data` [Byte[]](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

`offset` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`len` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **BinaryStream(Int32)**

Constructs a new binary stream from a new buffer of the specified length.

```csharp
public BinaryStream(int len)
```

#### Parameters

`len` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Methods

### **SubStream(Int32, Int32)**

Constructs a new binary stream from a part of another binary stream.

```csharp
public BinaryStream SubStream(int offset, int len)
```

#### Parameters

`offset` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`len` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **CopyFrom(Stream, String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Constructs a new binary stream from a [Stream](https://docs.microsoft.com/en-us/dotnet/api/system.io.stream).

```csharp
public static Task<BinaryStream> CopyFrom(Stream stream, string streamName, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`stream` [Stream](https://docs.microsoft.com/en-us/dotnet/api/system.io.stream)<br>
The stream to copy data from.

`streamName` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The name of the stream being copied from.
 This is used for progress reporting.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task&lt;BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **CopyTo(Stream, String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Writes the data to a [Stream](https://docs.microsoft.com/en-us/dotnet/api/system.io.stream).

```csharp
public Task CopyTo(Stream stream, string streamName, IProgress<TaskProgressInfo> progress, CancellationToken ct)
```

#### Parameters

`stream` [Stream](https://docs.microsoft.com/en-us/dotnet/api/system.io.stream)<br>
The stream to write to.

`streamName` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The name of the stream being copied to.
 This is used for progress reporting.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

#### Returns

[Task](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task)<br>

### **Decode&lt;T&gt;(Boolean)**

Decodes the binary stream into a file.

```csharp
public Task<T> Decode<T>(bool decRef)
```

#### Type Parameters

`T`<br>
The file type.

#### Parameters

`decRef` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>
Whether this stream's reference count should be decremented.
 The reference count will be decremented even if decoding fails.

#### Returns

Task&lt;T&gt;<br>

### **Decode(IProgress&lt;TaskProgressInfo&gt;, CancellationToken, Boolean)**

Decodes the binary stream into a file, guessing the file type.

```csharp
public Task<IFile> Decode(IProgress<TaskProgressInfo> progress, CancellationToken ct, bool decRef)
```

#### Parameters

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

`decRef` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>
Whether this stream's reference count should be decremented.
 The reference count will be decremented even if decoding fails.

#### Returns

[Task&lt;IFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **DecodeWithHint(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken, Boolean, DecodeConfidence)**

Decodes the binary stream into a file, guessing the file type
 with the filename as a hint for what to try first.

```csharp
public Task<IFile> DecodeWithHint(string filename, IProgress<TaskProgressInfo> progress, CancellationToken ct, bool decRef, DecodeConfidence requiredHintConfidence)
```

#### Parameters

`filename` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The hint.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

`decRef` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>
Whether this stream's reference count should be decremented.
 The reference count will be decremented even if decoding fails.

`requiredHintConfidence` [DecodeConfidence](./ws2explorer.decodeconfidence.md)<br>
The minimum confidence required to accept the hint.

#### Returns

[Task&lt;IFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **DecodeWithHint&lt;Hint&gt;(IProgress&lt;TaskProgressInfo&gt;, CancellationToken, Boolean, DecodeConfidence)**

Decodes the binary stream into a file, guessing the file type
 with a hint for what to try first.

```csharp
public Task<IFile> DecodeWithHint<Hint>(IProgress<TaskProgressInfo> progress, CancellationToken ct, bool decRef, DecodeConfidence requiredHintConfidence)
```

#### Type Parameters

`Hint`<br>
The file type to try first.

#### Parameters

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>

`ct` [CancellationToken](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken)<br>

`decRef` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>
Whether this stream's reference count should be decremented.
 The reference count will be decremented even if decoding fails.

`requiredHintConfidence` [DecodeConfidence](./ws2explorer.decodeconfidence.md)<br>
The minimum confidence required to accept the hint.

#### Returns

[Task&lt;IFile&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1)<br>

### **StreamEquals(BinaryStream, BinaryStream)**

Checks if the data in two streams is equal.

```csharp
public static bool StreamEquals(BinaryStream lhs, BinaryStream rhs)
```

#### Parameters

`lhs` [BinaryStream](./ws2explorer.binarystream.md)<br>

`rhs` [BinaryStream](./ws2explorer.binarystream.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **Freeze()**

Sets the stream to read-only.
 This disallows any new [BinaryWriter](./ws2explorer.binarywriter.md) instances from being created
 from this stream. This is irreversible.

```csharp
public void Freeze()
```

### **IncRef()**

Increments the reference count.

```csharp
public void IncRef()
```

### **DecRef()**

Decrements the reference count.

```csharp
public void DecRef()
```

### **Dispose()**

Disposes the stream.
 This should not be called if you have already called
 [BinaryStream.DecRef()](./ws2explorer.binarystream.md#decref) to trigger cleanup because disposing
 too will decrement the internal reference count twice.

```csharp
public void Dispose()
```
