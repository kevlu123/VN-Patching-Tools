# ChoiceInfo

Namespace: Ws2Explorer.HighLevel

Choice information returned by [GameTool.GetChoices(Directory, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)](./ws2explorer.highlevel.gametool.md#getchoicesdirectory-iprogresstaskprogressinfo-cancellationtoken)

```csharp
public class ChoiceInfo
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ChoiceInfo](./ws2explorer.highlevel.choiceinfo.md)<br>
Attributes [RequiredMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.requiredmemberattribute)

## Properties

### **Filename**

The WS2 script filename that contains the choices.

```csharp
public string Filename { get; set; }
```

#### Property Value

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Ws2Choices**

The WS2 choice group.

```csharp
public ImmutableArray<Ws2Choice> Ws2Choices { get; set; }
```

#### Property Value

ImmutableArray&lt;Ws2Choice&gt;<br>

### **WscChoices**

The WSC choice group.

```csharp
public ImmutableArray<WscChoice> WscChoices { get; set; }
```

#### Property Value

ImmutableArray&lt;WscChoice&gt;<br>

## Constructors

### **ChoiceInfo()**

#### Caution

Constructors of types with required members are not supported in this version of your compiler.

---

```csharp
public ChoiceInfo()
```
