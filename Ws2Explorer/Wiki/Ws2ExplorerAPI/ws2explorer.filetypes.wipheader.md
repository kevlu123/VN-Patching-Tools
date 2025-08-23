# WipHeader

Namespace: Ws2Explorer.FileTypes

A WIP file header.

```csharp
public class WipHeader : System.IEquatable`1[[Ws2Explorer.FileTypes.WipHeader, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [WipHeader](./ws2explorer.filetypes.wipheader.md)<br>
Implements [IEquatable&lt;WipHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **Signature**

The signature (WIPF).

```csharp
public int Signature { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **FileCount**

The number of images in the WIP file.

```csharp
public ushort FileCount { get; set; }
```

#### Property Value

[UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

### **BitsPerPixel**

The bits per pixel for the images in the WIP file.
 This can be 8, 24, or 32. If it is 8, a palette of 256 32-bit colours is used.

```csharp
public ushort BitsPerPixel { get; set; }
```

#### Property Value

[UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

## Constructors

### **WipHeader(Int32, UInt16, UInt16)**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

Constructs a WIP file header.

```csharp
public WipHeader(int signature, ushort fileCount, ushort bitsPerPixel)
```

#### Parameters

`signature` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`fileCount` [UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

`bitsPerPixel` [UInt16](https://docs.microsoft.com/en-us/dotnet/api/system.uint16)<br>

### **WipHeader()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

Constructs a WIP file header.

```csharp
public WipHeader()
```

### **WipHeader(WipHeader)**

```csharp
protected WipHeader(WipHeader original)
```

#### Parameters

`original` [WipHeader](./ws2explorer.filetypes.wipheader.md)<br>

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

### **Equals(WipHeader)**

```csharp
public bool Equals(WipHeader other)
```

#### Parameters

`other` [WipHeader](./ws2explorer.filetypes.wipheader.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public WipHeader <Clone>$()
```

#### Returns

[WipHeader](./ws2explorer.filetypes.wipheader.md)<br>
