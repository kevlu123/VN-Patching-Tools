# WscChoice

Namespace: Ws2Explorer.Compiler

A WSC choice argument type.

```csharp
public struct WscChoice
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [WscChoice](./ws2explorer.compiler.wscchoice.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [IsReadOnlyAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.isreadonlyattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **Id**

The ID of the choice.

```csharp
public ushort Id { get; set; }
```

#### Property Value

[UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

### **Text**

The text of the choice.

```csharp
public string Text { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Arg3**

Unknown byte.

```csharp
public byte Arg3 { get; set; }
```

#### Property Value

[Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **Arg4**

Unknown byte.

```csharp
public byte Arg4 { get; set; }
```

#### Property Value

[Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **Arg5**

Unknown byte.

```csharp
public byte Arg5 { get; set; }
```

#### Property Value

[Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **JumpOp**

The instruction to run when this choice is selected.
 Must be either [Opcode.WSC_JUMP_06](./ws2explorer.compiler.opcode.md#wsc_jump_06) or [Opcode.WSC_JUMP_FILE_07](./ws2explorer.compiler.opcode.md#wsc_jump_file_07).

```csharp
public Op JumpOp { get; set; }
```

#### Property Value

[Op](./ws2explorer.compiler.op.md)<br>

## Methods

### **WithText(String)**

Create a new WscChoice from this WscChoice but with different text.

```csharp
WscChoice WithText(string text)
```

#### Parameters

`text` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[WscChoice](./ws2explorer.compiler.wscchoice.md)<br>

### **WithJumpOp(Op)**

Create a new WscChoice from this WscChoice but with a different jump op.

```csharp
WscChoice WithJumpOp(Op jumpOp)
```

#### Parameters

`jumpOp` [Op](./ws2explorer.compiler.op.md)<br>

#### Returns

[WscChoice](./ws2explorer.compiler.wscchoice.md)<br>
