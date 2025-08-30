# FontMeasurer

Namespace: Ws2Explorer

Font measurement.

```csharp
public class FontMeasurer
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [FontMeasurer](./ws2explorer.fontmeasurer.md)

## Constructors

### **FontMeasurer(ReadOnlySpan&lt;Byte&gt;)**

Initializes a new instance of the [FontMeasurer](./ws2explorer.fontmeasurer.md) class.

```csharp
public FontMeasurer(ReadOnlySpan<byte> fontData)
```

#### Parameters

`fontData` [ReadOnlySpan&lt;Byte&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.readonlyspan-1)<br>
The font file data in TTF or OTF format.

## Methods

### **MeasureTextSize(String, Int32, FontStyle)**

Measures the pixel width of the specified text.

```csharp
public ValueTuple<float, float> MeasureTextSize(string text, int fontSize, FontStyle fontStyle)
```

#### Parameters

`text` [String](https://docs.microsoft.com/en-us/dotnet/api/system.string)<br>
The text to measure.

`fontSize` [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32)<br>
The font size to use for measuring text width.

`fontStyle` [FontStyle](./ws2explorer.fontmeasurer.fontstyle.md)<br>
The font style to use for measuring text width.

#### Returns

[ValueTuple&lt;Single, Single&gt;](https://docs.microsoft.com/en-us/dotnet/api/system.valuetuple-2)<br>
