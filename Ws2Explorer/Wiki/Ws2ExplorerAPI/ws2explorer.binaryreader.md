# BinaryReader

Namespace: Ws2Explorer

Reads binary data from a [BinaryStream](./ws2explorer.binarystream.md).
 All data is read in little-endian byte order unless otherwise specified.

```csharp
public class BinaryReader
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [BinaryReader](./ws2explorer.binaryreader.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **Position**

Gets or sets the current position within the stream.

```csharp
public int Position { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Length**

Gets the length of the stream.

```csharp
public int Length { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **BinaryReader(BinaryStream)**

Initializes a new instance of the [BinaryReader](./ws2explorer.binaryreader.md) class.

```csharp
public BinaryReader(BinaryStream stream)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>
The stream to read from.

## Methods

### **Seek(Int32)**

Seeks to the specified position in the stream from the beginning.

```csharp
public void Seek(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Skip(Int32)**

Seeks forward by the specified number of bytes.

```csharp
public void Skip(int count)
```

#### Parameters

`count` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **PeekByte()**

Peeks at the next byte at the current position without advancing the position.

```csharp
public Nullable<byte> PeekByte()
```

#### Returns

[Nullable&lt;Byte&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.nullable-1)<br>
The next byte or null if there is none.

### **ReadBytes(Span&lt;Byte&gt;)**

Reads the specified number of bytes at the
 current position and advances the position.

```csharp
public void ReadBytes(Span<byte> v)
```

#### Parameters

`v` [Span&lt;Byte&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.span-1)<br>

### **ReadBytes(List&lt;Byte&gt;)**

Reads the specified number of bytes at the
 current position and advances the position.

```csharp
public void ReadBytes(List<byte> v)
```

#### Parameters

`v` [List&lt;Byte&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **ReadInt8()**

Reads a int8 at the current position and advances the position.

```csharp
public sbyte ReadInt8()
```

#### Returns

[SByte](https://docs.microsoft.com/en-us/dotnet/api/system.sbyte)<br>

### **ReadUInt8()**

Reads a uint8 at the current position and advances the position.

```csharp
public byte ReadUInt8()
```

#### Returns

[Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **ReadInt16()**

Reads a int16 at the current position and advances the position.

```csharp
public short ReadInt16()
```

#### Returns

[Int16](https://docs.microsoft.com/en-us/dotnet/api/system.int16)<br>

### **ReadUInt16()**

Reads a uint16 at the current position and advances the position.

```csharp
public ushort ReadUInt16()
```

#### Returns

[UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

### **ReadInt32()**

Reads a int32 at the current position and advances the position.

```csharp
public int ReadInt32()
```

#### Returns

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ReadUInt32()**

Reads a uint32 at the current position and advances the position.

```csharp
public uint ReadUInt32()
```

#### Returns

[UInt32](https://docs.microsoft.com/en-us/dotnet/api/system.uint32)<br>

### **ReadInt64()**

Reads a int64 and at the current position advances the position.

```csharp
public long ReadInt64()
```

#### Returns

[Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64)<br>

### **ReadUInt64()**

Reads a uint64 at the current position and advances the position.

```csharp
public ulong ReadUInt64()
```

#### Returns

[UInt64](https://docs.microsoft.com/en-us/dotnet/api/system.uint64)<br>

### **ReadFloat32()**

Reads a float32 at the current position and advances the position.

```csharp
public float ReadFloat32()
```

#### Returns

[Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>

### **ReadFloat64()**

Reads a float64 at the current position and advances the position.

```csharp
public double ReadFloat64()
```

#### Returns

[Double](https://docs.microsoft.com/en-us/dotnet/api/system.double)<br>

### **ReadSjisString()**

Reads a null terminated Shift-JIS encoded string at the
 current position and advances the position.

```csharp
public string ReadSjisString()
```

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **ReadUTF8String()**

Reads a null terminated UTF-8 encoded string at the
 current position and advances the position.

```csharp
public string ReadUTF8String()
```

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **ReadUTF16String()**

Reads a null terminated UTF-16 encoded string at the
 current position and advances the position.

```csharp
public string ReadUTF16String()
```

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **ReadInt8At(Int32)**

Reads a int8 at the specified position without advancing the position.

```csharp
public sbyte ReadInt8At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[SByte](https://docs.microsoft.com/en-us/dotnet/api/system.sbyte)<br>

### **ReadUInt8At(Int32)**

Reads a uint8 at the specified position without advancing the position.

```csharp
public byte ReadUInt8At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **ReadInt16At(Int32)**

Reads a int16 at the specified position without advancing the position.

```csharp
public short ReadInt16At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Int16](https://docs.microsoft.com/en-us/dotnet/api/system.int16)<br>

### **ReadUInt16At(Int32)**

Reads a uint16 at the specified position without advancing the position.

```csharp
public ushort ReadUInt16At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

### **ReadInt32At(Int32)**

Reads a int32 at the specified position without advancing the position.

```csharp
public int ReadInt32At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ReadUInt32At(Int32)**

Reads a uint32 at the specified position without advancing the position.

```csharp
public uint ReadUInt32At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[UInt32](https://docs.microsoft.com/en-us/dotnet/api/system.uint32)<br>

### **ReadInt64At(Int32)**

Reads a int64 at the specified position without advancing the position.

```csharp
public long ReadInt64At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64)<br>

### **ReadUInt64At(Int32)**

Reads a uint64 at the specified position without advancing the position.

```csharp
public ulong ReadUInt64At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[UInt64](https://docs.microsoft.com/en-us/dotnet/api/system.uint64)<br>

### **ReadFloat32At(Int32)**

Reads a float32 at the specified position without advancing the position.

```csharp
public float ReadFloat32At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>

### **ReadFloat64At(Int32)**

Reads a float64 at the specified position without advancing the position.

```csharp
public double ReadFloat64At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Double](https://docs.microsoft.com/en-us/dotnet/api/system.double)<br>

### **ReadNonnegativeInt32()**

Reads a int32 at the current position. If the value is negative,
 an exception is thrown. Otherwise, the position is advanced.

```csharp
public int ReadNonnegativeInt32()
```

#### Returns

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ReadNonnegativeInt64()**

Reads a int64 at the current position. If the value is negative,
 an exception is thrown. Otherwise, the position is advanced.

```csharp
public long ReadNonnegativeInt64()
```

#### Returns

[Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64)<br>

### **ReadNonnegativeInt32BE()**

Reads a big endian int32 at the current position. If the value is negative,
 an exception is thrown. Otherwise, the position is advanced.

```csharp
public int ReadNonnegativeInt32BE()
```

#### Returns

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ReadNonnegativeInt64BE()**

Reads a big endian int64 at the current position. If the value is negative,
 an exception is thrown. Otherwise, the position is advanced.

```csharp
public long ReadNonnegativeInt64BE()
```

#### Returns

[Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64)<br>

### **ReadNonnegativeInt32At(Int32)**

Reads a int32 at the specified position. If the value is negative,
 an exception is thrown.

```csharp
public int ReadNonnegativeInt32At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ReadNonnegativeInt64At(Int32)**

Reads a int64 at the specified position. If the value is negative,
 an exception is thrown.

```csharp
public long ReadNonnegativeInt64At(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64)<br>

### **ReadNonnegativeInt32BEAt(Int32)**

Reads a big endian int32 at the specified position. If the value is negative,
 an exception is thrown.

```csharp
public int ReadNonnegativeInt32BEAt(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ReadNonnegativeInt64BEAt(Int32)**

Reads a big endian int64 at the specified position. If the value is negative,
 an exception is thrown.

```csharp
public long ReadNonnegativeInt64BEAt(int position)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

#### Returns

[Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64)<br>
