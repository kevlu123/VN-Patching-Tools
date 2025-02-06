# ArchiveCreationException

Namespace: Ws2Explorer

Exception thrown when an error occurs while encoding an archive.

```csharp
public class ArchiveCreationException : System.Exception, System.Runtime.Serialization.ISerializable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [Exception](https://docs.microsoft.com/en-us/dotnet/api/system.exception) → [ArchiveCreationException](./ws2explorer.archivecreationexception.md)<br>
Implements [ISerializable](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.iserializable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **TargetSite**

```csharp
public MethodBase TargetSite { get; }
```

#### Property Value

[MethodBase](https://docs.microsoft.com/en-us/dotnet/api/system.reflection.methodbase)<br>

### **Message**

```csharp
public string Message { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Data**

```csharp
public IDictionary Data { get; }
```

#### Property Value

[IDictionary](https://docs.microsoft.com/en-us/dotnet/api/system.collections.idictionary)<br>

### **InnerException**

```csharp
public Exception InnerException { get; }
```

#### Property Value

[Exception](https://docs.microsoft.com/en-us/dotnet/api/system.exception)<br>

### **HelpLink**

```csharp
public string HelpLink { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Source**

```csharp
public string Source { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **HResult**

```csharp
public int HResult { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **StackTrace**

```csharp
public string StackTrace { get; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

## Constructors

### **ArchiveCreationException()**

Initializes a new instance of the [ArchiveCreationException](./ws2explorer.archivecreationexception.md) class.

```csharp
public ArchiveCreationException()
```

### **ArchiveCreationException(String)**

Initializes a new instance of the [ArchiveCreationException](./ws2explorer.archivecreationexception.md) class

```csharp
public ArchiveCreationException(string message)
```

#### Parameters

`message` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **ArchiveCreationException(String, Exception)**

Initializes a new instance of the [ArchiveCreationException](./ws2explorer.archivecreationexception.md) class

```csharp
public ArchiveCreationException(string message, Exception innerException)
```

#### Parameters

`message` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

`innerException` [Exception](https://docs.microsoft.com/en-us/dotnet/api/system.exception)<br>

## Events

### **SerializeObjectState**

#### Caution

BinaryFormatter serialization is obsolete and should not be used. See https://aka.ms/binaryformatter for more information.

---

```csharp
protected event EventHandler<SafeSerializationEventArgs> SerializeObjectState;
```
