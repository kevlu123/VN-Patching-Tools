# PnaImageMetadata

Namespace: Ws2Explorer.FileTypes

Metadata in a PNA file for a single PNG.

```csharp
public class PnaImageMetadata : System.IEquatable`1[[Ws2Explorer.FileTypes.PnaImageMetadata, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [PnaImageMetadata](./ws2explorer.filetypes.pnaimagemetadata.md)<br>
Implements [IEquatable&lt;PnaImageMetadata&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
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
public int Unknown00 { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **FileId**

The 0-based index of the PNG file in the PNA file counted from the end.
 If the image is empty (0 bytes), this is -1.
 It seems like the engine doesn't really care about this value.

```csharp
public int FileId { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **OffsetX**

The X offset of this PNG image in the full PNA image space.

```csharp
public int OffsetX { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **OffsetY**

The Y offset of this PNG image in the full PNA image space.

```csharp
public int OffsetY { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Width**

The width of the PNG image in pixels.

```csharp
public int Width { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Height**

The height of the PNG image in pixels.

```csharp
public int Height { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Unknown24**

Unknown.

```csharp
public int Unknown24 { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Transparency**

The transparency of the PNG image between 0 and 1.
 It is strange that this is an unaligned 64-bit float.

```csharp
public double Transparency { get; set; }
```

#### Property Value

[Double](https://docs.microsoft.com/en-us/dotnet/api/system.double)<br>

### **DataLen**

The length of the PNG image data in bytes.

```csharp
public int DataLen { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **PnaImageMetadata(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Double, Int32)**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

Constructs PNG image metadata.

```csharp
public PnaImageMetadata(int unknown00, int fileId, int offsetX, int offsetY, int width, int height, int unknown24, double transparency, int dataLen)
```

#### Parameters

`unknown00` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`fileId` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`offsetX` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`offsetY` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`width` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`height` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`unknown24` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`transparency` [Double](https://docs.microsoft.com/en-us/dotnet/api/system.double)<br>

`dataLen` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **PnaImageMetadata()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

Constructs PNG image metadata.

```csharp
public PnaImageMetadata()
```

### **PnaImageMetadata(PnaImageMetadata)**

```csharp
protected PnaImageMetadata(PnaImageMetadata original)
```

#### Parameters

`original` [PnaImageMetadata](./ws2explorer.filetypes.pnaimagemetadata.md)<br>

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

### **Equals(PnaImageMetadata)**

```csharp
public bool Equals(PnaImageMetadata other)
```

#### Parameters

`other` [PnaImageMetadata](./ws2explorer.filetypes.pnaimagemetadata.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public PnaImageMetadata <Clone>$()
```

#### Returns

[PnaImageMetadata](./ws2explorer.filetypes.pnaimagemetadata.md)<br>
