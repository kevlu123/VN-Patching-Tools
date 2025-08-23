# RelativeLabel

Namespace: Ws2Explorer.Compiler

A relative address.

```csharp
public struct RelativeLabel
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [RelativeLabel](./ws2explorer.compiler.relativelabel.md)<br>
Attributes [IsReadOnlyAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.isreadonlyattribute)

## Properties

### **RelativeAddress**

The relative address as bytes from the end of the current op.

```csharp
public int RelativeAddress { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ComputedAbsoluteAddress**

The computed absolute address as bytes from the beginning of the script.
 This value does not appear in the compiled script and is only used by the compiler.

```csharp
public int ComputedAbsoluteAddress { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **RelativeLabel(Int32, Int32)**

A relative address.

```csharp
RelativeLabel(int relativeAddress, int computedAbsAddress)
```

#### Parameters

`relativeAddress` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`computedAbsAddress` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>
