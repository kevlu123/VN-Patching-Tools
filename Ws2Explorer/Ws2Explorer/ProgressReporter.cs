namespace Ws2Explorer;

public record TaskProgressInfo
{
    public required int Id { get; init; }
    public required string Description { get; init; }
    public required float Value { get; init; }
}

public sealed class ProgressReporter : IDisposable
{
    private static int nextId;

    private readonly int id;
    private readonly string description;
    private readonly IProgress<TaskProgressInfo>? progress;
    private readonly int totalSteps;
    private int currentStep;

    public ProgressReporter(
        string description,
        IProgress<TaskProgressInfo>? progress,
        int totalSteps = 1)
    {
        id = Interlocked.Increment(ref nextId);
        this.description = description;
        this.progress = progress;
        this.totalSteps = Math.Max(totalSteps, 1);
        currentStep = 0;

        progress?.Report(new TaskProgressInfo
        {
            Id = id,
            Description = description,
            Value = 0f,
        });
    }

    public void Step()
    {
        progress?.Report(new TaskProgressInfo
        {
            Id = id,
            Description = description,
            Value = (float)++currentStep / totalSteps,
        });
    }

    public void Dispose()
    {
        if (currentStep < totalSteps)
        {
            currentStep = totalSteps;
            progress?.Report(new TaskProgressInfo
            {
                Id = id,
                Description = description,
                Value = 1f,
            });
        }
    }
}
