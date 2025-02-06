# MessageString

Namespace: Ws2Explorer.Compiler

A string used by the engine for messages.
 The string may contain a special suffix.

```csharp
public struct MessageString
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [MessageString](./ws2explorer.compiler.messagestring.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [IsReadOnlyAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.isreadonlyattribute)

## Properties

### **FullString**

The full string, including the suffix.

```csharp
public string FullString { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **String**

The string without the suffix.

```csharp
public string String { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Suffix**

The suffix of the string.

```csharp
public string Suffix { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Constructors

### **MessageString(String)**

Creates a new MessageString with the given full string.

```csharp
MessageString(string fullString)
```

#### Parameters

`fullString` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **MessageString(String, String)**

Creates a new MessageString with the given string and suffix.

```csharp
MessageString(string str, string suffix)
```

#### Parameters

`str` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`suffix` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Methods

### **WithString(String)**

Creates a new MessageString from this MessageString
 with a different string, but the same suffix.

```csharp
MessageString WithString(string str)
```

#### Parameters

`str` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[MessageString](./ws2explorer.compiler.messagestring.md)<br>

### **WithSuffix(String)**

Creates a new MessageString from this MessageString
 with a different suffix, but the same string.

```csharp
MessageString WithSuffix(string suffix)
```

#### Parameters

`suffix` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[MessageString](./ws2explorer.compiler.messagestring.md)<br>
