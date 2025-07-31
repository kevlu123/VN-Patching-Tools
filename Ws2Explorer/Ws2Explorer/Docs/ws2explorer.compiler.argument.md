# Argument

Namespace: Ws2Explorer.Compiler

An argument for an opcode.

```csharp
public struct Argument
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [Argument](./ws2explorer.compiler.argument.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [IsReadOnlyAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.isreadonlyattribute)

## Properties

### **Value**

The value of the argument as an object.

```csharp
public object Value { get; private set; }
```

#### Property Value

[Object](https://docs.microsoft.com/en-us/dotnet/api/system.object)<br>

### **Label**

The label value.

```csharp
public Label Label { get; }
```

#### Property Value

[Label](./ws2explorer.compiler.label.md)<br>

### **RelativeLabel**

The relative label value.

```csharp
public RelativeLabel RelativeLabel { get; }
```

#### Property Value

[RelativeLabel](./ws2explorer.compiler.relativelabel.md)<br>

### **UInt8**

The uint8 value.

```csharp
public byte UInt8 { get; }
```

#### Property Value

[Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **UInt16**

The uint16 value.

```csharp
public ushort UInt16 { get; }
```

#### Property Value

[UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

### **UInt32**

The uint32 value.

```csharp
public uint UInt32 { get; }
```

#### Property Value

[UInt32](https://docs.microsoft.com/en-us/dotnet/api/system.uint32)<br>

### **Float32**

The float32 value.

```csharp
public float Float32 { get; }
```

#### Property Value

[Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>

### **String**

The string value.

```csharp
public string String { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **AffixedString**

The AffixedString value.

```csharp
public AffixedString AffixedString { get; }
```

#### Property Value

[AffixedString](./ws2explorer.compiler.affixedstring.md)<br>

### **UInt16Array**

The uint16 array value.

```csharp
public ImmutableArray<ushort> UInt16Array { get; }
```

#### Property Value

ImmutableArray&lt;UInt16&gt;<br>

### **StringArray**

The string array value.

```csharp
public ImmutableArray<string> StringArray { get; }
```

#### Property Value

ImmutableArray&lt;String&gt;<br>

### **Ws2ChoiceArray**

The WS2 choice array value.

```csharp
public ImmutableArray<Ws2Choice> Ws2ChoiceArray { get; }
```

#### Property Value

ImmutableArray&lt;Ws2Choice&gt;<br>

### **WscChoiceArray**

The WSC choice array value.

```csharp
public ImmutableArray<WscChoice> WscChoiceArray { get; }
```

#### Property Value

ImmutableArray&lt;WscChoice&gt;<br>

### **Size**

The size of the argument in bytes.

```csharp
public int Size { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Methods

### **NewLabel(Label)**

Creates a label argument.

```csharp
Argument NewLabel(Label v)
```

#### Parameters

`v` [Label](./ws2explorer.compiler.label.md)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewRelativeLabel(RelativeLabel)**

Creates a relative label argument.

```csharp
Argument NewRelativeLabel(RelativeLabel v)
```

#### Parameters

`v` [RelativeLabel](./ws2explorer.compiler.relativelabel.md)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewUInt8(Byte)**

Creates a uint8 argument.

```csharp
Argument NewUInt8(byte v)
```

#### Parameters

`v` [Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewUInt16(UInt16)**

Creates a uint16 argument.

```csharp
Argument NewUInt16(ushort v)
```

#### Parameters

`v` [UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewUInt32(UInt32)**

Creates a uint32 argument.

```csharp
Argument NewUInt32(uint v)
```

#### Parameters

`v` [UInt32](https://docs.microsoft.com/en-us/dotnet/api/system.uint32)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewFloat32(Single)**

Creates a float32 argument.

```csharp
Argument NewFloat32(float v)
```

#### Parameters

`v` [Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewString(String)**

Creates a string argument.

```csharp
Argument NewString(string v)
```

#### Parameters

`v` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewAffixedString(AffixedString)**

Creates an AffixedString argument.

```csharp
Argument NewAffixedString(AffixedString v)
```

#### Parameters

`v` [AffixedString](./ws2explorer.compiler.affixedstring.md)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewUInt16Array(IEnumerable&lt;UInt16&gt;)**

Creates a uint16 array argument.

```csharp
Argument NewUInt16Array(IEnumerable<ushort> v)
```

#### Parameters

`v` [IEnumerable&lt;UInt16&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewStringArray(IEnumerable&lt;String&gt;)**

Creates a string array argument.

```csharp
Argument NewStringArray(IEnumerable<string> v)
```

#### Parameters

`v` [IEnumerable&lt;String&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewWs2ChoiceArray(IEnumerable&lt;Ws2Choice&gt;)**

Creates a WS2 choice array argument.

```csharp
Argument NewWs2ChoiceArray(IEnumerable<Ws2Choice> v)
```

#### Parameters

`v` [IEnumerable&lt;Ws2Choice&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>

### **NewWscChoiceArray(IEnumerable&lt;WscChoice&gt;)**

Creates a WSC choice array argument.

```csharp
Argument NewWscChoiceArray(IEnumerable<WscChoice> v)
```

#### Parameters

`v` [IEnumerable&lt;WscChoice&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

#### Returns

[Argument](./ws2explorer.compiler.argument.md)<br>
