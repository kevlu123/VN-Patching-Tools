# AffixedString

Namespace: Ws2Explorer.Compiler

A string used by the engine for names and messages.
 The string may contain a special prefix or suffix.

```csharp
public struct AffixedString
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [AffixedString](./ws2explorer.compiler.affixedstring.md)<br>
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

The string without the prefix or suffix.

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

### **AffixedString(String)**

Creates a new AffixedString with the given
 full string including prefix and suffix.

```csharp
AffixedString(string fullString)
```

#### Parameters

`fullString` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **AffixedString(String, String, String)**

Creates a new AffixedString with the given prefix, string, and suffix.

```csharp
AffixedString(string prefix, string str, string suffix)
```

#### Parameters

`prefix` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`str` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`suffix` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Methods

### **WithPrefix(String)**

Creates a new AffixedString from this AffixedString
 with a different prefix, but the same string and suffix.

```csharp
AffixedString WithPrefix(string prefix)
```

#### Parameters

`prefix` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[AffixedString](./ws2explorer.compiler.affixedstring.md)<br>

### **WithString(String)**

Creates a new AffixedString from this AffixedString
 with a different string, but the same prefix and suffix.

```csharp
AffixedString WithString(string str)
```

#### Parameters

`str` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[AffixedString](./ws2explorer.compiler.affixedstring.md)<br>

### **WithSuffix(String)**

Creates a new AffixedString from this AffixedString
 with a different suffix, but the same prefix and string.

```csharp
AffixedString WithSuffix(string suffix)
```

#### Parameters

`suffix` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[AffixedString](./ws2explorer.compiler.affixedstring.md)<br>
