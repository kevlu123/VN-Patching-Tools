# TextFile

Namespace: Ws2Explorer.FileTypes

A text file.

```csharp
public sealed class TextFile : Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.TextFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile, System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [TextFile](./ws2explorer.filetypes.textfile.md)<br>
Implements [IFile&lt;TextFile&gt;](./ws2explorer.ifile-1.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **Text**

The text of the file.

```csharp
public string Text { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Encoding**

The encoding of the file.

```csharp
public Encoding Encoding { get; }
```

#### Property Value

[Encoding](https://docs.microsoft.com/en-us/dotnet/api/system.text.encoding)<br>

## Constructors

### **TextFile(String)**

Constructs a text file from a UTF-8 string.

```csharp
public TextFile(string text)
```

#### Parameters

`text` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **TextFile(BinaryStream, Encoding)**

Constructs a text file from a binary stream and an encoding.

```csharp
public TextFile(BinaryStream stream, Encoding encoding)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`encoding` [Encoding](https://docs.microsoft.com/en-us/dotnet/api/system.text.encoding)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a text file from a binary stream.
 If this succeeds, the confidence is always low.

```csharp
public static TextFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[TextFile](./ws2explorer.filetypes.textfile.md)<br>

### **Dispose()**

Disposes the text file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the text file.

```csharp
protected void Finalize()
```
