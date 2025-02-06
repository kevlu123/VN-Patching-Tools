# ArcSubHeader

Namespace: Ws2Explorer.FileTypes

An ARC file subheader describing a subfile.

```csharp
public class ArcSubHeader : System.IEquatable`1[[Ws2Explorer.FileTypes.ArcSubHeader, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ArcSubHeader](./ws2explorer.filetypes.arcsubheader.md)<br>
Implements [IEquatable&lt;ArcSubHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **DataLen**

The length of the subfile data in bytes.

```csharp
public int DataLen { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **DataOffset**

The offset of the subfile data in the ARC file
 relative to the end of the subheaders.

```csharp
public int DataOffset { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Filename**

The filename of the subfile.

```csharp
public string Filename { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Constructors

### **ArcSubHeader(ArcSubHeader)**

```csharp
protected ArcSubHeader(ArcSubHeader original)
```

#### Parameters

`original` [ArcSubHeader](./ws2explorer.filetypes.arcsubheader.md)<br>

### **ArcSubHeader()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public ArcSubHeader()
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

### **Equals(ArcSubHeader)**

```csharp
public bool Equals(ArcSubHeader other)
```

#### Parameters

`other` [ArcSubHeader](./ws2explorer.filetypes.arcsubheader.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public ArcSubHeader <Clone>$()
```

#### Returns

[ArcSubHeader](./ws2explorer.filetypes.arcsubheader.md)<br>
