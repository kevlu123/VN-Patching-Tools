# ArcHeader

Namespace: Ws2Explorer.FileTypes

An ARC file header.

```csharp
public class ArcHeader : System.IEquatable`1[[Ws2Explorer.FileTypes.ArcHeader, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ArcHeader](./ws2explorer.filetypes.archeader.md)<br>
Implements [IEquatable&lt;ArcHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **FileCount**

The number of files in the ARC file.

```csharp
public int FileCount { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **SubHeaderLen**

The total length of the all the subheaders in bytes.

```csharp
public int SubHeaderLen { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **ArcHeader(ArcHeader)**

```csharp
protected ArcHeader(ArcHeader original)
```

#### Parameters

`original` [ArcHeader](./ws2explorer.filetypes.archeader.md)<br>

### **ArcHeader()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public ArcHeader()
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

### **Equals(ArcHeader)**

```csharp
public bool Equals(ArcHeader other)
```

#### Parameters

`other` [ArcHeader](./ws2explorer.filetypes.archeader.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public ArcHeader <Clone>$()
```

#### Returns

[ArcHeader](./ws2explorer.filetypes.archeader.md)<br>
