# NamedFolder

Namespace: Ws2Explorer.HighLevel

A folder with a name wrapped in a disposable object.
 This is useful for working with folder hierarchies
 where changes need to be propagated to the parent folder
 and the child name needs to be known.

```csharp
public class NamedFolder : System.IDisposable, System.IEquatable`1[[Ws2Explorer.HighLevel.NamedFolder, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [NamedFolder](./ws2explorer.highlevel.namedfolder.md)<br>
Implements [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IEquatable&lt;NamedFolder&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **Folder**

The folder.

```csharp
public IFolder Folder { get; set; }
```

#### Property Value

[IFolder](./ws2explorer.ifolder.md)<br>

### **Name**

The name of the folder.

```csharp
public string Name { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Constructors

### **NamedFolder(NamedFolder)**

```csharp
protected NamedFolder(NamedFolder original)
```

#### Parameters

`original` [NamedFolder](./ws2explorer.highlevel.namedfolder.md)<br>

### **NamedFolder()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public NamedFolder()
```

## Methods

### **Dispose()**

Disposes the folder if it is disposable.

```csharp
public void Dispose()
```

### **Finalize()**

Disposes the folder if it is disposable.

```csharp
protected void Finalize()
```

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

### **Equals(NamedFolder)**

```csharp
public bool Equals(NamedFolder other)
```

#### Parameters

`other` [NamedFolder](./ws2explorer.highlevel.namedfolder.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public NamedFolder <Clone>$()
```

#### Returns

[NamedFolder](./ws2explorer.highlevel.namedfolder.md)<br>
