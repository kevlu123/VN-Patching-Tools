# TaskProgressInfo

Namespace: Ws2Explorer

Information about the progress of a task.

```csharp
public class TaskProgressInfo : System.IEquatable`1[[Ws2Explorer.TaskProgressInfo, Ws2Explorer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [TaskProgressInfo](./ws2explorer.taskprogressinfo.md)<br>
Implements [IEquatable&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iequatable-1)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **EqualityContract**

```csharp
protected Type EqualityContract { get; }
```

#### Property Value

[Type](https://docs.microsoft.com/en-us/dotnet/api/system.type)<br>

### **Id**

The unique identifier of the task.

```csharp
public int Id { get; set; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Description**

The description of the task.

```csharp
public string Description { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Value**

The progress of the task between 0 and 1.

```csharp
public float Value { get; set; }
```

#### Property Value

[Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>

## Constructors

### **TaskProgressInfo(TaskProgressInfo)**

```csharp
protected TaskProgressInfo(TaskProgressInfo original)
```

#### Parameters

`original` [TaskProgressInfo](./ws2explorer.taskprogressinfo.md)<br>

### **TaskProgressInfo()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public TaskProgressInfo()
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

### **Equals(TaskProgressInfo)**

```csharp
public bool Equals(TaskProgressInfo other)
```

#### Parameters

`other` [TaskProgressInfo](./ws2explorer.taskprogressinfo.md)<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **&lt;Clone&gt;$()**

```csharp
public TaskProgressInfo <Clone>$()
```

#### Returns

[TaskProgressInfo](./ws2explorer.taskprogressinfo.md)<br>
