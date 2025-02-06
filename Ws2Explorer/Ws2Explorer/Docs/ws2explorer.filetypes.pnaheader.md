# PnaHeader

Namespace: Ws2Explorer.FileTypes

A PNA file header.

```csharp
public class PnaHeader : System.IEquatable`1[[Ws2Explorer.FileTypes.PnaHeader, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [PnaHeader](./ws2explorer.filetypes.pnaheader.md)<br>
Implements [IEquatable&lt;PnaHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **Signature**

The signature (PNAP).

```csharp
public int Signature { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Unknown04**

Unknown.

```csharp
public int Unknown04 { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ImageWidth**

The width of the space that the PNA image array takes up.

```csharp
public int ImageWidth { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **ImageHeight**

The height of the space that the PNA image array takes up.

```csharp
public int ImageHeight { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **FileCount**

The number of images in the PNA image array.

```csharp
public int FileCount { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **PnaHeader(Int32, Int32, Int32, Int32, Int32)**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

Constructs a PNA header.

```csharp
public PnaHeader(int signature, int unknown04, int imageWidth, int imageHeight, int fileCount)
```

#### Parameters

`signature` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`unknown04` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`imageWidth` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`imageHeight` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`fileCount` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **PnaHeader()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

Constructs a PNA header.

```csharp
public PnaHeader()
```

### **PnaHeader(PnaHeader)**

```csharp
protected PnaHeader(PnaHeader original)
```

#### Parameters

`original` [PnaHeader](./ws2explorer.filetypes.pnaheader.md)<br>

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

### **Equals(PnaHeader)**

```csharp
public bool Equals(PnaHeader other)
```

#### Parameters

`other` [PnaHeader](./ws2explorer.filetypes.pnaheader.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public PnaHeader <Clone>$()
```

#### Returns

[PnaHeader](./ws2explorer.filetypes.pnaheader.md)<br>
