# IArchive&lt;T&gt;

Namespace: Ws2Explorer

Stronger typed version of [IArchive](./ws2explorer.iarchive.md) used for generics.

```csharp
public interface IArchive<T> : IArchive, IFile, System.IDisposable, IFolder, IFile`1
```

#### Type Parameters

`T`<br>

Implements [IArchive](./ws2explorer.iarchive.md), [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md), IFile&lt;T&gt;

## Methods

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Creates an archive from the given contents.

```csharp
T Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>
The contents of the archive. The keys are the filenames
 and the values are the binary streams of the subfiles.

#### Returns

T<br>

#### Exceptions

[ArchiveCreationException](./ws2explorer.archivecreationexception.md)<br>
