# WscFile

Namespace: Ws2Explorer.FileTypes

A WSC script file.

```csharp
public sealed class WscFile : ScriptFile, Ws2Explorer.IArchive, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFolder, Ws2Explorer.IArchive`1[[Ws2Explorer.FileTypes.WscFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.WscFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ScriptFile](./ws2explorer.filetypes.scriptfile.md) → [WscFile](./ws2explorer.filetypes.wscfile.md)<br>
Implements [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), [IArchive&lt;WscFile&gt;](./ws2explorer.iarchive-1.md), [IFile&lt;WscFile&gt;](./ws2explorer.ifile-1.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **Ops**

The ops of the script.

```csharp
public ImmutableArray<Op> Ops { get; }
```

#### Property Value

ImmutableArray&lt;Op&gt;<br>

### **HasUnresolvedLabels**

Whether the script contains labels that do not point to a valid location.

```csharp
public bool HasUnresolvedLabels { get; }
```

#### Property Value

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **Text**

Get the message and choice text.

```csharp
public ScriptText[] Text { get; }
```

#### Property Value

[ScriptText[]](./ws2explorer.filetypes.scripttext.md)<br>

### **Version**

The version of the script.

```csharp
public ScriptVersion Version { get; }
```

#### Property Value

[ScriptVersion](./ws2explorer.compiler.scriptversion.md)<br>

## Constructors

### **WscFile(IEnumerable&lt;Op&gt;)**

Constructs a WSC file from a list of ops.

```csharp
public WscFile(IEnumerable<Op> ops)
```

#### Parameters

`ops` [IEnumerable&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

## Methods

### **WithText(String[])**

Create a new WSC file with the message and choice text replaced.

```csharp
public WscFile WithText(String[] text)
```

#### Parameters

`text` [String[]](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[WscFile](./ws2explorer.filetypes.wscfile.md)<br>

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a WSC file from a binary stream.

```csharp
public static WscFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[WscFile](./ws2explorer.filetypes.wscfile.md)<br>

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Constructs a WSC file from subfiles.
 Only [ScriptFile.OPS_FILENAME](./ws2explorer.filetypes.scriptfile.md#ops_filename) is required.
 If [ScriptFile.NEW_TEXT_FILENAME](./ws2explorer.filetypes.scriptfile.md#new_text_filename) is present,
 that file is used to overwrite the message and choice text.

```csharp
public IArchive Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>

#### Returns

[IArchive](./ws2explorer.iarchive.md)<br>
