# LegacyArcGroupHeader

Namespace: Ws2Explorer.FileTypes

A legacy ARC group header.

```csharp
public class LegacyArcGroupHeader : System.IEquatable`1[[Ws2Explorer.FileTypes.LegacyArcGroupHeader, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [LegacyArcGroupHeader](./ws2explorer.filetypes.legacyarcgroupheader.md)<br>
Implements [IEquatable&lt;LegacyArcGroupHeader&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **GroupExtension**

The 3-byte file extension of the files in the group excluding the dot.

```csharp
public string GroupExtension { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **FileCount**

The number of files in the group.

```csharp
public int FileCount { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **DataOffset**

The offset from the beginning of the file
 of the file listing data of this group.

```csharp
public int DataOffset { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

## Constructors

### **LegacyArcGroupHeader(LegacyArcGroupHeader)**

```csharp
protected LegacyArcGroupHeader(LegacyArcGroupHeader original)
```

#### Parameters

`original` [LegacyArcGroupHeader](./ws2explorer.filetypes.legacyarcgroupheader.md)<br>

### **LegacyArcGroupHeader()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public LegacyArcGroupHeader()
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

### **Equals(LegacyArcGroupHeader)**

```csharp
public bool Equals(LegacyArcGroupHeader other)
```

#### Parameters

`other` [LegacyArcGroupHeader](./ws2explorer.filetypes.legacyarcgroupheader.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public LegacyArcGroupHeader <Clone>$()
```

#### Returns

[LegacyArcGroupHeader](./ws2explorer.filetypes.legacyarcgroupheader.md)<br>
