# BinaryWriter

Namespace: Ws2Explorer

A class for writing binary data to a [BinaryStream](./ws2explorer.binarystream.md).
 All data is written in little-endian format.

```csharp
public class BinaryWriter
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [BinaryWriter](./ws2explorer.binarywriter.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **Position**

Gets or sets the current position in the stream.

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

### **BinaryWriter(BinaryStream)**

Initializes a new instance of the [BinaryWriter](./ws2explorer.binarywriter.md) class.
 The stream must be writable, otherwise an [InvalidOperationException](https://docs.microsoft.com/en-us/dotnet/api/system.invalidoperationexception) is thrown.

```csharp
public BinaryWriter(BinaryStream stream)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

## Methods

### **Seek(Int32)**

Seeks to the specified position in the stream.

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

### **WriteBytes(ReadOnlySpan&lt;Byte&gt;)**

Writes the specified bytes to the stream at the current position
 and advances the position.

```csharp
public void WriteBytes(ReadOnlySpan<byte> v)
```

#### Parameters

`v` [ReadOnlySpan&lt;Byte&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.readonlyspan-1)<br>

### **WriteInt8(SByte)**

Writes a int8 to the stream at the current position
 and advances the position.

```csharp
public void WriteInt8(sbyte v)
```

#### Parameters

`v` [SByte](https://docs.microsoft.com/en-us/dotnet/api/system.sbyte)<br>

### **WriteUInt8(Byte)**

Writes a uint8 to the stream at the current position
 and advances the position.

```csharp
public void WriteUInt8(byte v)
```

#### Parameters

`v` [Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **WriteInt16(Int16)**

Writes a int16 to the stream at the current position
 and advances the position.

```csharp
public void WriteInt16(short v)
```

#### Parameters

`v` [Int16](https://docs.microsoft.com/en-us/dotnet/api/system.int16)<br>

### **WriteUInt16(UInt16)**

Writes a uint16 to the stream at the current position
 and advances the position.

```csharp
public void WriteUInt16(ushort v)
```

#### Parameters

`v` [UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

### **WriteInt32(Int32)**

Writes a int32 to the stream at the current position
 and advances the position.

```csharp
public void WriteInt32(int v)
```

#### Parameters

`v` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **WriteUInt32(UInt32)**

Writes a uint32 to the stream at the current position
 and advances the position.

```csharp
public void WriteUInt32(uint v)
```

#### Parameters

`v` [UInt32](https://docs.microsoft.com/en-us/dotnet/api/system.uint32)<br>

### **WriteInt64(Int64)**

Writes a int64 to the stream at the current position
 and advances the position.

```csharp
public void WriteInt64(long v)
```

#### Parameters

`v` [Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64)<br>

### **WriteUInt64(UInt64)**

Writes a uint64 to the stream at the current position
 and advances the position.

```csharp
public void WriteUInt64(ulong v)
```

#### Parameters

`v` [UInt64](https://docs.microsoft.com/en-us/dotnet/api/system.uint64)<br>

### **WriteFloat32(Single)**

Writes a float32 to the stream at the current position
 and advances the position.

```csharp
public void WriteFloat32(float v)
```

#### Parameters

`v` [Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>

### **WriteFloat64(Double)**

Writes a float64 to the stream at the current position
 and advances the position.

```csharp
public void WriteFloat64(double v)
```

#### Parameters

`v` [Double](https://docs.microsoft.com/en-us/dotnet/api/system.double)<br>

### **WriteSjisString(String)**

Writes a null terminated Shift-JIS encoded string to the
 stream at the current position and advances the position.

```csharp
public void WriteSjisString(string v)
```

#### Parameters

`v` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **WriteUTF8String(String)**

Writes a null terminated UTF-8 encoded string to the
 stream at the current position and advances the position.

```csharp
public void WriteUTF8String(string v)
```

#### Parameters

`v` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **WriteUTF16String(String)**

Writes a null terminated UTF-16 encoded string to the
 stream at the current position and advances the position.

```csharp
public void WriteUTF16String(string v)
```

#### Parameters

`v` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **WriteInt8At(Int32, SByte)**

Writes a int8 at the specified position.

```csharp
public void WriteInt8At(int position, sbyte v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [SByte](https://docs.microsoft.com/en-us/dotnet/api/system.sbyte)<br>

### **WriteUInt8At(Int32, Byte)**

Writes a uint8 at the specified position.

```csharp
public void WriteUInt8At(int position, byte v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **WriteInt16At(Int32, Int16)**

Writes a int16 at the specified position.

```csharp
public void WriteInt16At(int position, short v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [Int16](https://docs.microsoft.com/en-us/dotnet/api/system.int16)<br>

### **WriteUInt16At(Int32, UInt16)**

Writes a uint16 at the specified position.

```csharp
public void WriteUInt16At(int position, ushort v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

### **WriteInt32At(Int32, Int32)**

Writes a int32 at the specified position.

```csharp
public void WriteInt32At(int position, int v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **WriteUInt32At(Int32, UInt32)**

Writes a uint32 at the specified position.

```csharp
public void WriteUInt32At(int position, uint v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [UInt32](https://docs.microsoft.com/en-us/dotnet/api/system.uint32)<br>

### **WriteInt64At(Int32, Int64)**

Writes a int64 at the specified position.

```csharp
public void WriteInt64At(int position, long v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64)<br>

### **WriteUInt64At(Int32, UInt64)**

Writes a uint64 at the specified position.

```csharp
public void WriteUInt64At(int position, ulong v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [UInt64](https://docs.microsoft.com/en-us/dotnet/api/system.uint64)<br>

### **WriteFloat32At(Int32, Single)**

Writes a float32 at the specified position.

```csharp
public void WriteFloat32At(int position, float v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>

### **WriteFloat64At(Int32, Double)**

Writes a float64 at the specified position.

```csharp
public void WriteFloat64At(int position, double v)
```

#### Parameters

`position` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`v` [Double](https://docs.microsoft.com/en-us/dotnet/api/system.double)<br>
