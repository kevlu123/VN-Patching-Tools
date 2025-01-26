using System.Collections.Immutable;
using Ws2Explorer.Compiler;

namespace Ws2Explorer.HighLevel;

public class ChoiceInfo
{
    public required string Filename { get; init; }
    public required ImmutableArray<Choice> Choices { get; init; }
}
