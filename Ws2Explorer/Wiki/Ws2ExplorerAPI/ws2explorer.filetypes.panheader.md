# PanHeader

Namespace: Ws2Explorer.FileTypes

A PAN file header.

```csharp
public class PanHeader : System.IEquatable`1[[Ws2Explorer.FileTypes.PanHeader, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [PanHeader](./ws2explorer.filetypes.panheader.md)<br>
Implements [IEquatable&lt;PanHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **Signature**

The signature (PAN2).

```csharp
public int Signature { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **EntryCount**

The number of entries in the PAN file.

```csharp
public int EntryCount { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **PanHeader(PanHeader)**

```csharp
protected PanHeader(PanHeader original)
```

#### Parameters

`original` [PanHeader](./ws2explorer.filetypes.panheader.md)<br>

### **PanHeader()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public PanHeader()
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

### **Equals(PanHeader)**

```csharp
public bool Equals(PanHeader other)
```

#### Parameters

`other` [PanHeader](./ws2explorer.filetypes.panheader.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public PanHeader <Clone>$()
```

#### Returns

[PanHeader](./ws2explorer.filetypes.panheader.md)<br>
