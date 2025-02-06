# BinFile

Namespace: Ws2Explorer.FileTypes

A generic binary file.

```csharp
public sealed class BinFile : Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.BinFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile, System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [BinFile](./ws2explorer.filetypes.binfile.md)<br>
Implements [IFile&lt;BinFile&gt;](./ws2explorer.ifile-1.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **Empty**

An empty binary file.

```csharp
public static BinFile Empty;
```

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

## Constructors

### **BinFile(BinaryStream)**

Constructs a binary file from a binary stream.

```csharp
public BinFile(BinaryStream stream)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a binary file from a binary stream.
 This will always succeed with low confidence.

```csharp
public static BinFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[BinFile](./ws2explorer.filetypes.binfile.md)<br>

### **Dispose()**

Disposes the binary file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the binary file.

```csharp
protected void Finalize()
```
