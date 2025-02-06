# OverwriteMode

Namespace: Ws2Explorer.HighLevel

The policy used when writing to a file that already exists.

```csharp
public enum OverwriteMode
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [Enum](https://docs.microsoft.com/en-us/dotnet/api/system.enum) → [OverwriteMode](./ws2explorer.highlevel.overwritemode.md)<br>
Implements [IComparable](https://docs.microsoft.com/en-us/dotnet/api/system.icomparable), [ISpanFormattable](https://docs.microsoft.com/en-us/dotnet/api/system.ispanformattable), [IFormattable](https://docs.microsoft.com/en-us/dotnet/api/system.iformattable), [IConvertible](https://docs.microsoft.com/en-us/dotnet/api/system.iconvertible)

## Fields

| Name | Value | Description |
| --- | --: | --- |
| Throw | 0 | Throw an exception if the file already exists. |
| Overwrite | 1 | Overwrite the file if it already exists. |
| Rename | 2 | Use an alternative name if it already exists. |
| Skip | 3 | Do not write to the file if it already exists. |
