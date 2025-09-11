# WordWrap

Namespace: Ws2Explorer

Word wrapping utilities.

```csharp
public static class WordWrap
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [WordWrap](./ws2explorer.wordwrap.md)<br>
Attributes [NullableContextAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullablecontextattribute), [NullableAttribute](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.compilerservices.nullableattribute)

## Methods

### **RemoveNewlines(String)**

Remove all variations of newlines from a string.
 
 This removes "\r\n", "\n", "\r", and "\\n".

```csharp
public static string RemoveNewlines(string str)
```

#### Parameters

`str` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **Wrap(String, Predicate&lt;String&gt;, List`1&)**

Wrap text given a predicate.
 
 Single words that are too long to fit in a line will be automatically wrapped by the engine.
 This function will NOT insert a newline in this case, though the parameter `lines` will
 account for this and have multiple entries for single words that are too long.

```csharp
public static string Wrap(string text, Predicate<string> tooLong, List`1& lines)
```

#### Parameters

`text` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The text to wrap.

`tooLong` [Predicate&lt;String&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.predicate-1)<br>
A predicate to determine if a line is too long.

`lines` [List`1&](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1&)<br>
The list of lines.

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **WrapByCharCount(String, Int32, List`1&)**

Wrap text by a maximum character count.
 
 Single words that are too long to fit in a line will be automatically wrapped by the engine.
 This function will NOT insert a newline in this case, though the parameter `lines` will
 account for this and have multiple entries for single words that are too long.

```csharp
public static string WrapByCharCount(string text, int charCount, List`1& lines)
```

#### Parameters

`text` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The text to wrap.

`charCount` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>
The maximum allowed character count for a line.

`lines` [List`1&](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1&)<br>
The list of lines.

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>

### **WrapByPixelWidth(String, Single, FontMeasurer, Int32, FontStyle, List`1&)**

Wrap text by a maximum pixel width.
 
 Single words that are too long to fit in a line will be automatically wrapped by the engine.
 This function will NOT insert a newline in this case, though the parameter `lines` will
 account for this and have multiple entries for single words that are too long.

```csharp
public static string WrapByPixelWidth(string text, float pixelWidth, FontMeasurer fontMeasurer, int fontSize, FontStyle fontStyle, List`1& lines)
```

#### Parameters

`text` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The text to wrap.

`pixelWidth` [Single](https://docs.microsoft.com/en-us/dotnet/api/system.single)<br>
The maximum allowed pixel width for a line.

`fontMeasurer` [FontMeasurer](./ws2explorer.fontmeasurer.md)<br>
The font to use for measuring text width.

`fontSize` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>
The font size to use for measuring text width.

`fontStyle` [FontStyle](./ws2explorer.fontmeasurer.fontstyle.md)<br>
The font style to use for measuring text width.

`lines` [List`1&](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1&)<br>
The list of lines.

#### Returns

[String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
