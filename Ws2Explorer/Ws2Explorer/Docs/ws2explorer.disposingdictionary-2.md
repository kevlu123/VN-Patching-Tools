# DisposingDictionary&lt;K, V&gt;

Namespace: Ws2Explorer

A dictionary that disposes its values when they are removed or replaced.

```csharp
public sealed class DisposingDictionary<K, V> : , , , System.Collections.IEnumerable, System.IDisposable
```

#### Type Parameters

`K`<br>

`V`<br>

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [DisposingDictionary&lt;K, V&gt;](./ws2explorer.disposingdictionary-2.md)<br>
Implements IDictionary&lt;K, V&gt;, ICollection&lt;KeyValuePair&lt;K, V&gt;&gt;, IEnumerable&lt;KeyValuePair&lt;K, V&gt;&gt;, [IEnumerable](https://docs.microsoft.com/en-us/dotnet/api/system.collections.ienumerable), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [DefaultMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.reflection.defaultmemberattribute)

## Properties

### **Item**

```csharp
public V Item { get; set; }
```

#### Property Value

V<br>

### **Keys**

Gets a collection containing the keys in the dictionary.

```csharp
public ICollection<K> Keys { get; }
```

#### Property Value

ICollection&lt;K&gt;<br>

### **Values**

Gets a collection containing the values in the dictionary.

```csharp
public ICollection<V> Values { get; }
```

#### Property Value

ICollection&lt;V&gt;<br>

### **Count**

Gets the number of key/value pairs in the dictionary.

```csharp
public int Count { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **IsReadOnly**

Gets a value indicating whether the dictionary is read-only.

```csharp
public bool IsReadOnly { get; }
```

#### Property Value

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

## Constructors

### **DisposingDictionary(Action&lt;V&gt;)**

Initializes a new instance of the [DisposingDictionary&lt;K, V&gt;](./ws2explorer.disposingdictionary-2.md) class.

```csharp
public DisposingDictionary(Action<V> dispose)
```

#### Parameters

`dispose` Action&lt;V&gt;<br>
The function to call when a value is removed or replaced.
 If not specified, the default behavior is to call [IDisposable.Dispose()](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose).

## Methods

### **Add(K, V)**

Adds the specified key and value to the dictionary.

```csharp
public void Add(K key, V value)
```

#### Parameters

`key` K<br>

`value` V<br>

### **Add(KeyValuePair&lt;K, V&gt;)**

Adds the specified key and value to the dictionary.

```csharp
public void Add(KeyValuePair<K, V> item)
```

#### Parameters

`item` KeyValuePair&lt;K, V&gt;<br>

### **Clear()**

Removes all keys and values from the dictionary.

```csharp
public void Clear()
```

### **Contains(KeyValuePair&lt;K, V&gt;)**

Determines whether the dictionary contains the specified key/value pair.

```csharp
public bool Contains(KeyValuePair<K, V> item)
```

#### Parameters

`item` KeyValuePair&lt;K, V&gt;<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **ContainsKey(K)**

Determines whether the dictionary contains the specified key.

```csharp
public bool ContainsKey(K key)
```

#### Parameters

`key` K<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **CopyTo(KeyValuePair`2[], Int32)**

Copies the key/value pairs to an array.

```csharp
public void CopyTo(KeyValuePair`2[] array, int arrayIndex)
```

#### Parameters

`array` KeyValuePair`2[]<br>

`arrayIndex` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **GetEnumerator()**

Returns an enumerator that iterates through the dictionary.

```csharp
public IEnumerator<KeyValuePair<K, V>> GetEnumerator()
```

#### Returns

IEnumerator&lt;KeyValuePair&lt;K, V&gt;&gt;<br>

### **Remove(K)**

Removes the value with the specified key from the dictionary.

```csharp
public bool Remove(K key)
```

#### Parameters

`key` K<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **Remove(KeyValuePair&lt;K, V&gt;)**

Removes the specified key/value pair from the dictionary.

```csharp
public bool Remove(KeyValuePair<K, V> item)
```

#### Parameters

`item` KeyValuePair&lt;K, V&gt;<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **TryGetValue(K, V&)**

Gets the value associated with the specified key.

```csharp
public bool TryGetValue(K key, V& value)
```

#### Parameters

`key` K<br>

`value` V&<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **Dispose()**

Disposes the dictionary and all its values.

```csharp
public void Dispose()
```
