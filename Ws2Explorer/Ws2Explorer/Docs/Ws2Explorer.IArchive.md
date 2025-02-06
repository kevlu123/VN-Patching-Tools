# IArchive

Namespace: Ws2Explorer

An archive file backed by a binary stream
 and can contain subfiles.

```csharp
public interface IArchive : IFile, System.IDisposable, IFolder
```

Implements [IFile](./ws2explorer.ifile.md), [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable), [IFolder](./ws2explorer.ifolder.md)

## Methods

### **Create(IDictionary&lt;String, BinaryStream&gt;)**

Creates an archive from the given contents.
 The archive will have the same type as this instance.

```csharp
IArchive Create(IDictionary<string, BinaryStream> contents)
```

#### Parameters

`contents` [IDictionary&lt;String, BinaryStream&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.idictionary-2)<br>
The contents of the archive. The keys are the filenames
 and the values are the binary streams of the subfiles.

#### Returns

[IArchive](./ws2explorer.iarchive.md)<br>

#### Exceptions

[ArchiveCreationException](./ws2explorer.archivecreationexception.md)<br>
