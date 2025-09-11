# ScriptCompiler

Namespace: Ws2Explorer.Compiler

WS2/WSC compiler and decompiler.

```csharp
public static class ScriptCompiler
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ScriptCompiler](./ws2explorer.compiler.scriptcompiler.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Properties

### **Debug**

Enable to print debug information to stdout.

```csharp
public static bool Debug { get; set; }
```

#### Property Value

[Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean)<br>

## Methods

### **DecompileWs2(BinaryStream, ScriptVersion&, Boolean&)**

Decompile a WS2 file to a list of ops.

```csharp
public static List<Op> DecompileWs2(BinaryStream stream, ScriptVersion& version, Boolean& hasUnresolvedLabels)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>
The input data.

`version` [ScriptVersion&](./ws2explorer.compiler.scriptversion&.md)<br>
The version that the script sucessfully decompiled as.

`hasUnresolvedLabels` [Boolean&](https://docs.microsoft.com/en-us/dotnet/api/system.boolean&)<br>
Whether decompilation finished with labels that do
 not point to a valid location.

#### Returns

[List&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **DecompileWs2(BinaryStream, ScriptVersion&)**

Decompile a WS2 file to a list of ops. Requiring that all labels point to valid locations.

```csharp
public static List<Op> DecompileWs2(BinaryStream stream, ScriptVersion& version)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>
The input data.

`version` [ScriptVersion&](./ws2explorer.compiler.scriptversion&.md)<br>
The version that the script successfully decompiled as.

#### Returns

[List&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **DecompileWsc(BinaryStream, ScriptVersion&, Boolean&)**

Decompile a WSC file to a list of ops.

```csharp
public static List<Op> DecompileWsc(BinaryStream stream, ScriptVersion& version, Boolean& hasUnresolvedLabels)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>
The input data.

`version` [ScriptVersion&](./ws2explorer.compiler.scriptversion&.md)<br>
The version that the script sucessfully decompiled as.

`hasUnresolvedLabels` [Boolean&](https://docs.microsoft.com/en-us/dotnet/api/system.boolean&)<br>
Whether decompilation finished with labels that do
 not point to a valid location.

#### Returns

[List&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1)<br>

### **DecompileWsc(BinaryStream, ScriptVersion&)**

Decompile a WSC file to a list of ops. Requiring that all labels point to valid locations.

```csharp
public static List<Op> DecompileWsc(BinaryStream stream, ScriptVersion& version)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>
The input data.

`version` [ScriptVersion&](./ws2explorer.compiler.scriptversion&.md)<br>
The version that the script successfully decompiled as.

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

### **GetScriptVersion(IEnumerable&lt;Op&gt;)**

Gets the script version from the list of ops.
 The first op should be a VERSION op.

```csharp
public static ScriptVersion GetScriptVersion(IEnumerable<Op> ops)
```

#### Parameters

`ops` [IEnumerable&lt;Op&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1)<br>

#### Returns

[ScriptVersion](./ws2explorer.compiler.scriptversion.md)<br>

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
