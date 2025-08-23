# PtfFile

Namespace: Ws2Explorer.FileTypes

A compressed font file.

```csharp
public sealed class PtfFile : Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.PtfFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.PtfFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [PtfFile](./ws2explorer.filetypes.ptffile.md)<br>
Implements [IArchive&lt;PtfFile&gt;](./ws2explorer.iarchive-1.md), [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IFile&lt;PtfFile&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Fields

### **FONT_FILENAME**

The filename of the decompressed font file.

```csharp
public static string FONT_FILENAME;
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

### **FontType**

The type of font file.

```csharp
public FontType FontType { get; }
```

#### Property Value

[FontType](./ws2explorer.filetypes.fonttype.md)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a PTF file from a binary stream.

```csharp
public static PtfFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[PtfFile](./ws2explorer.filetypes.ptffile.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a PTF file from subfiles.
 Files [PtfFile.FONT_FILENAME](./ws2explorer.filetypes.ptffile.md#font_filename) and [PtfFile.XOR_KEY_FILENAME](./ws2explorer.filetypes.ptffile.md#xor_key_filename) are required.
 The font file may have the extension ".ttf" or ".otf".
 The XOR key file must contain a single byte in hexadecimal format e.g. "0x1E".

```csharp
public static PtfFile Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[PtfFile](./ws2explorer.filetypes.ptffile.md)<br>

### **Create(BinaryStream, Byte)**

Creates a PTF file from the font file data and an XOR key.

```csharp
public static PtfFile Create(BinaryStream data, byte xorKey)
```

#### Parameters

`data` [BinaryStream](./ws2explorer.binarystream.md)<br>

`xorKey` [Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

#### Returns

[PtfFile](./ws2explorer.filetypes.ptffile.md)<br>

#### Exceptions

[ArchiveCreationException](./ws2explorer.archivecreationexception.md)<br>

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

### **GetFontType(ReadOnlySpan&lt;Byte&gt;)**

Gets the font type from the font file data.

```csharp
public static Nullable<FontType> GetFontType(ReadOnlySpan<byte> data)
```

#### Parameters

`data` [ReadOnlySpan&lt;Byte&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.readonlyspan-1)<br>

#### Returns

[Nullable&lt;FontType&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.nullable-1)<br>

### **Decompress(BinaryStream, Byte&, FontType&)**

Decompresses a PTF file.

```csharp
public static BinaryStream Decompress(BinaryStream stream, Byte& xorKey, FontType& fontType)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`xorKey` [Byte&](https://docs.microsoft.com/en-us/dotnet/api/system.byte&)<br>
The inferred XOR key used to obfuscate the data.

`fontType` [FontType&](./ws2explorer.filetypes.fonttype&.md)<br>

#### Returns

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **Compress(BinaryStream, Byte)**

Compresses to a PTF file.

```csharp
public static BinaryStream Compress(BinaryStream data, byte xorKey)
```

#### Parameters

`data` [BinaryStream](./ws2explorer.binarystream.md)<br>

`xorKey` [Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>
The XOR key to obfuscate the data.

#### Returns

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **Dispose()**

Disposes the PTF file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the PTF file.

```csharp
protected void Finalize()
```
