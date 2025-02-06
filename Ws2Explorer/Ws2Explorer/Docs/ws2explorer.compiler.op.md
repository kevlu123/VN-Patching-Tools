# Op

Namespace: Ws2Explorer.Compiler

An instruction in a WS2 script.

```csharp
public struct Op
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [Op](./ws2explorer.compiler.op.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [IsReadOnlyAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.isreadonlyattribute)

## Properties

### **Code**

The opcode.
 See [Opcode](./ws2explorer.compiler.opcode.md).

```csharp
public int Code { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Description**

The description of the opcode if it is known.

```csharp
public string Description { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Arguments**

The arguments of the op.

```csharp
public ImmutableArray<Argument> Arguments { get; set; }
```

#### Property Value

ImmutableArray&lt;Argument&gt;<br>

### **Labels**

The labels that this op references.

```csharp
public IEnumerable<int> Labels { get; }
```

#### Property Value

[IEnumerable&lt;Int32&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

### **Size**

The size of the op in bytes.

```csharp
public int Size { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Methods

### **WithArgument(Int32, Argument)**

Creates a new op from this with the given argument
 replacing the argument at the given index.

```csharp
Op WithArgument(int index, Argument arg)
```

#### Parameters

`index` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`arg` [Argument](./ws2explorer.compiler.argument.md)<br>

#### Returns

[Op](./ws2explorer.compiler.op.md)<br>
