# DisposingDictionaryExtensions

Namespace: Ws2Explorer

Extension methods for [DisposingDictionary&lt;K, V&gt;](./ws2explorer.disposingdictionary-2.md).

```csharp
public static class DisposingDictionaryExtensions
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [DisposingDictionaryExtensions](./ws2explorer.disposingdictionaryextensions.md)<br>
Attributes [ExtensionAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.extensionattribute)

## Methods

### **ToDisposingDictionary&lt;K, V&gt;(IEnumerable&lt;KeyValuePair&lt;K, V&gt;&gt;, Action&lt;V&gt;)**

Converts the specified collection of key/value pairs to a [DisposingDictionary&lt;K, V&gt;](./ws2explorer.disposingdictionary-2.md).

```csharp
public static DisposingDictionary<K, V> ToDisposingDictionary<K, V>(IEnumerable<KeyValuePair<K, V>> source, Action<V> dispose)
```

#### Type Parameters

`K`<br>

`V`<br>

#### Parameters

`source` IEnumerable&lt;KeyValuePair&lt;K, V&gt;&gt;<br>

`dispose` Action&lt;V&gt;<br>

#### Returns

DisposingDictionary&lt;K, V&gt;<br>
