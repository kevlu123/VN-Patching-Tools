# LuacFile

Namespace: Ws2Explorer.FileTypes

A compiled Lua file.

```csharp
public sealed class LuacFile : Ws2Explorer.IFile`1[[Ws2Explorer.FileTypes.LuacFile, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]], Ws2Explorer.IFile, System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [LuacFile](./ws2explorer.filetypes.luacfile.md)<br>
Implements [IFile&lt;LuacFile&gt;](./ws2explorer.ifile-1.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **Stream**

The underlying binary stream.

```csharp
public BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **LuaVersion**

The version of Lua.
 The upper 4 bits are the major version, and the lower 4 bits are the minor version.
 e.g. 0x51 is Lua 5.1.

```csharp
public byte LuaVersion { get; }
```

#### Property Value

[Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decodes a Luac file from a binary stream.

```csharp
public static LuacFile Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>

#### Returns

[LuacFile](./ws2explorer.filetypes.luacfile.md)<br>

### **Dispose()**

Disposes the Luac file.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the Luac file.

```csharp
protected void Finalize()
```
