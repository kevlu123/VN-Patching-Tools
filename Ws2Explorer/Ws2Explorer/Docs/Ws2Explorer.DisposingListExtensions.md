# DisposingListExtensions

Namespace: Ws2Explorer

Extension methods for [DisposingList&lt;T&gt;](./ws2explorer.disposinglist-1.md).

```csharp
public static class DisposingListExtensions
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [DisposingListExtensions](./ws2explorer.disposinglistextensions.md)<br>
Attributes [ExtensionAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.extensionattribute)

## Methods

### **ToDisposingList&lt;T&gt;(IEnumerable&lt;T&gt;, Action&lt;T&gt;)**

Creates a new [DisposingList&lt;T&gt;](./ws2explorer.disposinglist-1.md) from the specified collection.

```csharp
public static DisposingList<T> ToDisposingList<T>(IEnumerable<T> source, Action<T> dispose)
```

#### Type Parameters

`T`<br>

#### Parameters

`source` IEnumerable&lt;T&gt;<br>

`dispose` Action&lt;T&gt;<br>

#### Returns

DisposingList&lt;T&gt;<br>
