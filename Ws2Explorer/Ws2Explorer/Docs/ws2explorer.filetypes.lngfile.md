# LngFile

Namespace: Ws2Explorer.FileTypes

A language pack file.

```csharp
public sealed class LngFile : Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.LngFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.LngFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [LngFile](./ws2explorer.filetypes.lngfile.md)<br>
Implements [IArchive&lt;LngFile&gt;](./ws2explorer.iarchive-1.md), [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IFile&lt;LngFile&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **STRINGS_FILENAME**

The filename of the extracted string data.

```csharp
public static string STRINGS_FILENAME;
```

### **XOR_KEY_FILENAME**

The filename of the XOR key file.

```csharp
public static string XOR_KEY_FILENAME;
```

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **XorKey**

The XOR key used to obfuscate the data.
 This key is specific to different games but
 can be easily inferred.

```csharp
public byte XorKey { get; }
```

#### Property Value

[Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **Strings**

The extracted strings.

```csharp
public ReadOnlyCollection<AffixedString> Strings { get; }
```

#### Property Value

[ReadOnlyCollection&lt;AffixedString&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.objectmodel.readonlycollection-1)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a LNG file from a binary stream.

```csharp
public static LngFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[LngFile](./ws2explorer.filetypes.lngfile.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a LNG file from subfiles.
 Files [LngFile.STRINGS_FILENAME](./ws2explorer.filetypes.lngfile.md#strings_filename) and [LngFile.XOR_KEY_FILENAME](./ws2explorer.filetypes.lngfile.md#xor_key_filename) are required.
 The XOR key file must contain a single byte in hexadecimal format e.g. "0x1E".

```csharp
public static LngFile Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[LngFile](./ws2explorer.filetypes.lngfile.md)<br>

### **Create(IEnumerable&lt;AffixedString&gt;, Byte)**

Creates a LNG file from a binary stream and an XOR key.

```csharp
public static LngFile Create(IEnumerable<AffixedString> strings, byte xorKey)
```

#### Parameters

`strings` [IEnumerable&lt;AffixedString&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

`xorKey` [Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

#### Returns

[LngFile](./ws2explorer.filetypes.lngfile.md)<br>

### **ListFiles()**

Lists the virtual subfiles.

```csharp
public List<FileInfo> ListFiles()
```

#### Returns

[List&lt;FileInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **OpenFile(String, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)**

Opens a virtual subfile.
 The filename is case-insensitive.

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

Disposes the LNG file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the LNG file.

```csharp
protected void Finalize()
```
