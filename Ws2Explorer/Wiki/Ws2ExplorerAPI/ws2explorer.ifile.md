# IFile

Namespace: Ws2Explorer

A file backed by a binary stream.

```csharp
public interface IFile : System.IDisposable
```

Implements [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute)

## Properties

### **Stream**

The binary stream backing the file.

```csharp
public abstract BinaryStream Stream { get; }
```

#### Property Value

[BinaryStream](./ws2explorer.binarystream.md)<br>
