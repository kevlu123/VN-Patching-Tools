# Choice

Namespace: Ws2Explorer.Compiler

A choice argument type.

```csharp
public struct Choice
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [Choice](./ws2explorer.compiler.choice.md)<br>
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
 Must be either [Opcode.JUMP_06](./ws2explorer.compiler.opcode.md#jump_06) or [Opcode.JUMP_FILE_07](./ws2explorer.compiler.opcode.md#jump_file_07).

```csharp
public Op JumpOp { get; set; }
```

#### Property Value

[Op](./ws2explorer.compiler.op.md)<br>
