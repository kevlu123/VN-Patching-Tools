# NameString

Namespace: Ws2Explorer.Compiler

A string used by the engine for names.
 The string may contain a special prefix.

```csharp
public struct NameString
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [NameString](./ws2explorer.compiler.namestring.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [IsReadOnlyAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.isreadonlyattribute)

## Properties

### **FullString**

The full string, including the prefix.

```csharp
public string FullString { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Prefix**

The prefix of the string.

```csharp
public string Prefix { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **String**

The string without the prefix.

```csharp
public string String { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Constructors

### **NameString(String)**

Creates a new NameString with the given full string.

```csharp
NameString(string fullString)
```

#### Parameters

`fullString` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **NameString(String, String)**

Creates a new NameString with the given prefix and string.

```csharp
NameString(string prefix, string str)
```

#### Parameters

`prefix` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`str` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Methods

### **WithPrefix(String)**

Creates a new NameString from this NameString
 with a different prefix, but the same string.

```csharp
NameString WithPrefix(string prefix)
```

#### Parameters

`prefix` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[NameString](./ws2explorer.compiler.namestring.md)<br>

### **WithString(String)**

Creates a new NameString from this NameString
 with a different string, but the same prefix.

```csharp
NameString WithString(string str)
```

#### Parameters

`str` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[NameString](./ws2explorer.compiler.namestring.md)<br>
