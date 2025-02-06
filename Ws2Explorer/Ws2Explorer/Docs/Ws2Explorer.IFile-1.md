# IFile&lt;T&gt;

Namespace: Ws2Explorer

Stronger typed version of [IFile](./ws2explorer.ifile.md) used for generics.

```csharp
public interface IFile<T> : IFile, System.IDisposable
```

#### Type Parameters

`T`<br>

Implements [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute)

## Methods

### **Decode(BinaryStream, DecodeConfidence&)**

Decode a binary stream to this file type.

```csharp
T Decode(BinaryStream stream, DecodeConfidence& confidence)
```

#### Parameters

`stream` [BinaryStream](./ws2explorer.binarystream.md)<br>

`confidence` [DecodeConfidence&](./ws2explorer.decodeconfidence&.md)<br>
The confidence that the binary stream decodes
 uniquely to file type.

#### Returns

T<br>

#### Exceptions

[DecodeException](./ws2explorer.decodeexception.md)<br>
