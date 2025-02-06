# ProgressReporter

Namespace: Ws2Explorer

Reports the progress of a task to an [IProgress&lt;T&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1).

```csharp
public sealed class ProgressReporter : System.IDisposable
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ProgressReporter](./ws2explorer.progressreporter.md)<br>
Implements [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)

## Constructors

### **ProgressReporter(String, IProgress&lt;TaskProgressInfo&gt;, Int32)**

Initializes a new instance of the [ProgressReporter](./ws2explorer.progressreporter.md) class
 and reports the start of the task.

```csharp
public ProgressReporter(string description, IProgress<TaskProgressInfo> progress, int totalSteps)
```

#### Parameters

`description` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The task description.

`progress` [IProgress&lt;TaskProgressInfo&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1)<br>
The [IProgress&lt;T&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.iprogress-1) to report to.

`totalSteps` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>
The total number of steps of the task.

## Methods

### **Step()**

Increments and reports the progress of the task.

```csharp
public void Step()
```

### **Dispose()**

Reports the completion of the task.

```csharp
public void Dispose()
```
