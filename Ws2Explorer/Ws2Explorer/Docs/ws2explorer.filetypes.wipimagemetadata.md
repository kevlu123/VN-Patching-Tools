# WipImageMetadata

Namespace: Ws2Explorer.FileTypes

Metadata in a WIP file for a single image.

```csharp
public class WipImageMetadata : System.IEquatable`1[[Ws2Explorer.FileTypes.WipImageMetadata, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [WipImageMetadata](./ws2explorer.filetypes.wipimagemetadata.md)<br>
Implements [IEquatable&lt;WipImageMetadata&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **Width**

The width of the image in pixels.

```csharp
public int Width { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Height**

The height of the image in pixels.

```csharp
public int Height { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **OffsetX**

The X offset of this image in the full WIP image.

```csharp
public int OffsetX { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **OffsetY**

The Y offset of this image in the full WIP image.

```csharp
public int OffsetY { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Unknown10**

Unknown.

```csharp
public int Unknown10 { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **DataLen**

The length of the compressed image data in bytes.

```csharp
public int DataLen { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **WipImageMetadata(Int32, Int32, Int32, Int32, Int32, Int32)**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

Constructs metadata for a single WIP image.

```csharp
public WipImageMetadata(int width, int height, int offsetX, int offsetY, int unknown10, int dataLen)
```

#### Parameters

`width` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`height` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`offsetX` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`offsetY` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`unknown10` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`dataLen` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **WipImageMetadata()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

Constructs metadata for a single WIP image.

```csharp
public WipImageMetadata()
```

### **WipImageMetadata(WipImageMetadata)**

```csharp
protected WipImageMetadata(WipImageMetadata original)
```

#### Parameters

`original` [WipImageMetadata](./ws2explorer.filetypes.wipimagemetadata.md)<br>

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

### **Equals(WipImageMetadata)**

```csharp
public bool Equals(WipImageMetadata other)
```

#### Parameters

`other` [WipImageMetadata](./ws2explorer.filetypes.wipimagemetadata.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public WipImageMetadata <Clone>$()
```

#### Returns

[WipImageMetadata](./ws2explorer.filetypes.wipimagemetadata.md)<br>
