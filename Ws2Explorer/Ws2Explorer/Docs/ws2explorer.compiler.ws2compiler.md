# Ws2Compiler

Namespace: Ws2Explorer.Compiler

WS2 compiler and decompiler.

```csharp
public static class Ws2Compiler
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [Ws2Compiler](./ws2explorer.compiler.ws2compiler.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Methods

### **Decompile(BinaryStream, Ws2Version&, Boolean&)**

Decompile a WS2 file to a list of ops.

```csharp
public static List<Op> Decompile(BinaryStream stream, Ws2Version& version, Boolean& hasUnresolvedLabels)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>
The input data.

`version` [Ws2Version&](./ws2explorer.compiler.ws2version&.md)<br>
The version that the script sucessfully decompiled as.

`hasUnresolvedLabels` [Boolean&](https://docs.microsoft.com/en-us/dotnet/api/system.boolean&)<br>
Whether decompilation finished with labels that do
 not point to a valid location.

#### Returns

[List&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **Decompile(BinaryStream, Ws2Version&, Boolean)**

Decompile a WS2 file to a list of ops.

```csharp
public static List<Op> Decompile(BinaryStream stream, Ws2Version& version, bool mustResolveLabels)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>
The input data.

`version` [Ws2Version&](./ws2explorer.compiler.ws2version&.md)<br>
The version that the script successfully decompiled as.

`mustResolveLabels` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>
Whether all labels must point to valid locations.

#### Returns

[List&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **Compile(IEnumerable&lt;Op&gt;, Boolean)**

Compile a list of ops to a binary stream.

```csharp
public static BinaryStream Compile(IEnumerable<Op> ops, bool mustResolveLabels)
```

#### Parameters

`ops` [IEnumerable&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>
The list of ops.

`mustResolveLabels` [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>
Whether all labels must point to valid locations.

#### Returns

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **Compile(IEnumerable&lt;Op&gt;, Boolean&)**

Compile a list of ops to a binary stream.

```csharp
public static BinaryStream Compile(IEnumerable<Op> ops, Boolean& hasUnresolvedLabels)
```

#### Parameters

`ops` [IEnumerable&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>
The list of ops.

`hasUnresolvedLabels` [Boolean&](https://docs.microsoft.com/en-us/dotnet/api/system.boolean&)<br>
Whether compilation finished with labels that do
 not point to a valid location.

#### Returns

[BinaryStream](./ws2explorer.binarystream.md)<br>

### **ToJson(IEnumerable&lt;Op&gt;)**

Serialize a list of ops to a JSON string.

```csharp
public static string ToJson(IEnumerable<Op> ops)
```

#### Parameters

`ops` [IEnumerable&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **FromJson(String)**

Deserialize a list of ops from a JSON string.

```csharp
public static List<Op> FromJson(string json)
```

#### Parameters

`json` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[List&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>
