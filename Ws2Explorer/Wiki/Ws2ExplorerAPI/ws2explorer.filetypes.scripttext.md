# ScriptText

Namespace: Ws2Explorer.FileTypes

Script text. This is either message text or choice text.

```csharp
public class ScriptText
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ScriptText](./ws2explorer.filetypes.scripttext.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **Text**

The text of the message or choice.

```csharp
public string Text { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Name**

The name of the character speaking or an empty string if there is none.

```csharp
public string Name { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **IsChoice**

Whether this text is for a choice or not.

```csharp
public bool IsChoice { get; set; }
```

#### Property Value

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

## Constructors

### **ScriptText()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public ScriptText()
```
