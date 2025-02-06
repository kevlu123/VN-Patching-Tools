# FileInfo

Namespace: Ws2Explorer

File information returned by the [IFolder.ListFiles()](./ws2explorer.ifolder.md#listfiles).

```csharp
public class FileInfo : System.IEquatable`1[[Ws2Explorer.FileInfo, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [FileInfo](./ws2explorer.fileinfo.md)<br>
Implements [IEquatable&lt;FileInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **Filename**

The name of the file or directory.

```csharp
public string Filename { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **FileSize**

The size of the file in bytes, or null if the size is not applicable or unknown.

```csharp
public Nullable<long> FileSize { get; set; }
```

#### Property Value

[Nullable&lt;Int64&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.nullable-1)<br>

### **IsDirectory**

Whether the file is a real directory.

```csharp
public bool IsDirectory { get; set; }
```

#### Property Value

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

## Constructors

### **FileInfo(FileInfo)**

```csharp
protected FileInfo(FileInfo original)
```

#### Parameters

`original` [FileInfo](./ws2explorer.fileinfo.md)<br>

### **FileInfo()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public FileInfo()
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

### **Equals(FileInfo)**

```csharp
public bool Equals(FileInfo other)
```

#### Parameters

`other` [FileInfo](./ws2explorer.fileinfo.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public FileInfo <Clone>$()
```

#### Returns

[FileInfo](./ws2explorer.fileinfo.md)<br>
