# PanEntry

Namespace: Ws2Explorer.FileTypes

A PAN file entry.

```csharp
public class PanEntry : System.IEquatable`1[[Ws2Explorer.FileTypes.PanEntry, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [PanEntry](./ws2explorer.filetypes.panentry.md)<br>
Implements [IEquatable&lt;PanEntry&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **CharacterName**

The name of the character. The purpose is unknown.

```csharp
public string CharacterName { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **SubEntryCount**

The number of sub-entries.

```csharp
public int SubEntryCount { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **SubEntries**

The sub-entries.

```csharp
public ImmutableArray<PanSubEntry> SubEntries { get; set; }
```

#### Property Value

ImmutableArray&lt;PanSubEntry&gt;<br>

## Constructors

### **PanEntry(PanEntry)**

```csharp
protected PanEntry(PanEntry original)
```

#### Parameters

`original` [PanEntry](./ws2explorer.filetypes.panentry.md)<br>

### **PanEntry()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public PanEntry()
```

## Methods

### **ToString()**

```csharp
public string ToString()
```

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **PrintMembers(StringBuilder)**

```csharp
protected bool PrintMembers(StringBuilder builder)
```

#### Parameters

`builder` [StringBuilder](https://docs.microsoft.com/en-us/dotnet/api/system.text.stringbuilder)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **GetHashCode()**

```csharp
public int GetHashCode()
```

#### Returns

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Equals(Object)**

```csharp
public bool Equals(object obj)
```

#### Parameters

`obj` [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **Equals(PanEntry)**

```csharp
public bool Equals(PanEntry other)
```

#### Parameters

`other` [PanEntry](./ws2explorer.filetypes.panentry.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public PanEntry <Clone>$()
```

#### Returns

[PanEntry](./ws2explorer.filetypes.panentry.md)<br>
