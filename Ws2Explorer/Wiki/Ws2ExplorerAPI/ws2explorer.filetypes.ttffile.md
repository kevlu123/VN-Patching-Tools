# TtfFile

Namespace: Ws2Explorer.FileTypes

A true type font file.

```csharp
public sealed class TtfFile : FontFile, Ws2Explorer.IFile, System.IDisposable, Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.TtfFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [FontFile](./ws2explorer.filetypes.fontfile.md) → [TtfFile](./ws2explorer.filetypes.ttffile.md)<br>
Implements [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFile&lt;TtfFile&gt;](./ws2explorer.ifile-1.md)

## Fields

### **SIGNATURE**

TTF file signature as little-endian int.

```csharp
public static int SIGNATURE;
```

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **FontMeasurer**

Gets a font measurer object.

```csharp
public FontMeasurer FontMeasurer { get; }
```

#### Property Value

[FontMeasurer](./ws2explorer.fontmeasurer.md)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a TTF file from a binary stream.

```csharp
public static TtfFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[TtfFile](./ws2explorer.filetypes.ttffile.md)<br>
