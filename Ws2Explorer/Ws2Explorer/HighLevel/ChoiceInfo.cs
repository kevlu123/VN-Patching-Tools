using System.Collections.Immutable;
using Ws2Explorer.Compiler;

namespace Ws2Explorer.HighLevel;

/// <summary>
/// Choice information returned by <see cref="GameTool.GetChoices(FileTypes.Directory, IProgress{Ws2Explorer.TaskProgressInfo}?, CancellationToken)"/>
/// </summary>
public class ChoiceInfo
{
    /// <summary>
    /// The WS2 script filename that contains the choices.
    /// </summary>
    public required string Filename { get; init; }

    /// <summary>
    /// The WS2 choice group.
    /// </summary>
    public required ImmutableArray<Ws2Choice> Ws2Choices { get; init; }

    /// <summary>
    /// The WSC choice group.
    /// </summary>
    public required ImmutableArray<WscChoice> WscChoices { get; init; }
}
