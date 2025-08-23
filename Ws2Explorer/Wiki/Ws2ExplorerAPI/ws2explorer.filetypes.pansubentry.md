# PanSubEntry

Namespace: Ws2Explorer.FileTypes

A PAN file sub-entry.

```csharp
public class PanSubEntry : System.IEquatable`1[[Ws2Explorer.FileTypes.PanSubEntry, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [PanSubEntry](./ws2explorer.filetypes.pansubentry.md)<br>
Implements [IEquatable&lt;PanSubEntry&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **Unknown00**

Unknown.

```csharp
public float Unknown00 { get; set; }
```

#### Property Value

[Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>

### **Unknown04**

Unknown.

```csharp
public byte Unknown04 { get; set; }
```

#### Property Value

[Byte](https://docs.microsoft.com/en-us/dotnet/api/system.byte)<br>

### **Filename**

The filename. The purpose is unknown.

```csharp
public string Filename { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Constructors

### **PanSubEntry(PanSubEntry)**

```csharp
protected PanSubEntry(PanSubEntry original)
```

#### Parameters

`original` [PanSubEntry](./ws2explorer.filetypes.pansubentry.md)<br>

### **PanSubEntry()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public PanSubEntry()
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

### **Equals(PanSubEntry)**

```csharp
public bool Equals(PanSubEntry other)
```

#### Parameters

`other` [PanSubEntry](./ws2explorer.filetypes.pansubentry.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public PanSubEntry <Clone>$()
```

#### Returns

[PanSubEntry](./ws2explorer.filetypes.pansubentry.md)<br>
