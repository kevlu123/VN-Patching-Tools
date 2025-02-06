# DisposingList&lt;T&gt;

Namespace: Ws2Explorer

A list that disposes its elements when they are removed or replaced.

```csharp
public sealed class DisposingList<T> : , , , System.Collections.IEnumerable, System.IDisposable
```

#### Type Parameters

`T`<br>

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [DisposingList&lt;T&gt;](./ws2explorer.disposinglist-1.md)<br>
Implements IList&lt;T&gt;, ICollection&lt;T&gt;, IEnumerable&lt;T&gt;, [IEnumerable](https://docs.microsoft.com/en-us/dotnet/api/system.collections.ienumerable), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute), [DefaultMemberAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.reflection.defaultmemberattribute)

## Properties

### **Count**

Gets the number of elements contained in the list.

```csharp
public int Count { get; }
```

#### Property Value

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **IsReadOnly**

Gets a value indicating whether the list is read-only.

```csharp
public bool IsReadOnly { get; }
```

#### Property Value

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **Item**

```csharp
public T Item { get; set; }
```

#### Property Value

T<br>

## Constructors

### **DisposingList(Action&lt;T&gt;)**

Initializes a new instance of the [DisposingList&lt;T&gt;](./ws2explorer.disposinglist-1.md) class.

```csharp
public DisposingList(Action<T> dispose)
```

#### Parameters

`dispose` Action&lt;T&gt;<br>
The function to call when an element is removed or replaced.
 If not specified, the default behavior is to call [IDisposable.Dispose()](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose).

## Methods

### **Add(T)**

Adds an element to the end of the list.

```csharp
public void Add(T item)
```

#### Parameters

`item` T<br>

### **AddRange(IEnumerable&lt;T&gt;)**

Adds the elements of the specified collection to the end of the list.

```csharp
public void AddRange(IEnumerable<T> items)
```

#### Parameters

`items` IEnumerable&lt;T&gt;<br>

### **RemoveAt(Int32)**

Removes the element at the specified index of the list.

```csharp
public void RemoveAt(int index)
```

#### Parameters

`index` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Pop()**

Removes the last element of the list.

```csharp
public void Pop()
```

### **Clear()**

Removes all elements from the list.

```csharp
public void Clear()
```

### **IndexOf(T)**

Determines the index of a specific item in the list.

```csharp
public int IndexOf(T item)
```

#### Parameters

`item` T<br>

#### Returns

[Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Insert(Int32, T)**

Inserts an element into the list at the specified index.

```csharp
public void Insert(int index, T item)
```

#### Parameters

`index` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

`item` T<br>

### **Contains(T)**

Determines whether the list contains a specific value.

```csharp
public bool Contains(T item)
```

#### Parameters

`item` T<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **CopyTo(T[], Int32)**

Copies the elements of the list to an array.

```csharp
public void CopyTo(T[] array, int arrayIndex)
```

#### Parameters

`array` T[]<br>

`arrayIndex` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>

### **Remove(T)**

Removes the first occurrence of a specific object from the list.

```csharp
public bool Remove(T item)
```

#### Parameters

`item` T<br>

#### Returns

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

### **GetEnumerator()**

Returns an enumerator that iterates through the list.

```csharp
public IEnumerator<T> GetEnumerator()
```

#### Returns

IEnumerator&lt;T&gt;<br>

### **Dispose()**

Disposes all elements in the list.

```csharp
public void Dispose()
```
