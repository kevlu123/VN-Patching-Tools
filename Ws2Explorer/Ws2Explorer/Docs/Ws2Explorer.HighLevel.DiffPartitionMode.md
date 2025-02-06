# DiffPartitionMode

Namespace: Ws2Explorer.HighLevel

Flags used for [FileTool.Diff(IFolder, IFolder, DiffPartitionMode, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)](./ws2explorer.highlevel.filetool.md#diffifolder-ifolder-diffpartitionmode-iprogresstaskprogressinfo-cancellationtoken).
 and [FileTool.Diff(IFolder, IFolder, DiffPartitionMode, IProgress&lt;TaskProgressInfo&gt;, CancellationToken)](./ws2explorer.highlevel.filetool.md#diffifolder-ifolder-diffpartitionmode-iprogresstaskprogressinfo-cancellationtoken).

```csharp
public enum DiffPartitionMode
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [Enum](https://docs.microsoft.com/en-us/dotnet/api/system.enum) → [DiffPartitionMode](./ws2explorer.highlevel.diffpartitionmode.md)<br>
Implements [IComparable](https://docs.microsoft.com/en-us/dotnet/api/system.icomparable), [ISpanFormattable](https://docs.microsoft.com/en-us/dotnet/api/system.ispanformattable), [IFormattable](https://docs.microsoft.com/en-us/dotnet/api/system.iformattable), [IConvertible](https://docs.microsoft.com/en-us/dotnet/api/system.iconvertible)<br>
Attributes [FlagsAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.flagsattribute)

## Fields

| Name | Value | Description |
| --- | --: | --- |
| None | 0 | Match no files. |
| New | 1 | Match files only in the new folder. |
| Old | 2 | Match files only in the old folder. |
| Common | 4 | Match files that exist unchanged in both folders. |
| Changed | 8 | Match files that exist in both folders but have changed. |
