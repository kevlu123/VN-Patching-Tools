# LegacyArcSubHeader

Namespace: Ws2Explorer.FileTypes

A legacy ARC subheader describing a subfile.

```csharp
public class LegacyArcSubHeader : System.IEquatable`1[[Ws2Explorer.FileTypes.LegacyArcSubHeader, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [LegacyArcSubHeader](./ws2explorer.filetypes.legacyarcsubheader.md)<br>
Implements [IEquatable&lt;LegacyArcSubHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **Filename**

The filename of the subfile excluding the dot and extension.
 This has a maximum length of 8 or 12 bytes depending on the archive version.

```csharp
public string Filename { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **DataLen**

The length of the subfile data in bytes.

```csharp
public int DataLen { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **DataOffset**

The offset from the beginning of the file
 of the subfile data.

```csharp
public int DataOffset { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **LegacyArcSubHeader(LegacyArcSubHeader)**

```csharp
protected LegacyArcSubHeader(LegacyArcSubHeader original)
```

#### Parameters

`original` [LegacyArcSubHeader](./ws2explorer.filetypes.legacyarcsubheader.md)<br>

### **LegacyArcSubHeader()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public LegacyArcSubHeader()
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

### **Equals(LegacyArcSubHeader)**

```csharp
public bool Equals(LegacyArcSubHeader other)
```

#### Parameters

`other` [LegacyArcSubHeader](./ws2explorer.filetypes.legacyarcsubheader.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public LegacyArcSubHeader <Clone>$()
```

#### Returns

[LegacyArcSubHeader](./ws2explorer.filetypes.legacyarcsubheader.md)<br>
