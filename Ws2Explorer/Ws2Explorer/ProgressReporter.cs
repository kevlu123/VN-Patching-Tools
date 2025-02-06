namespace Ws2Explorer;

/// <summary>
/// Information about the progress of a task.
/// </summary>
public record TaskProgressInfo
{
    /// <summary>
    /// The unique identifier of the task.
    /// </summary>
    public required int Id { get; init; }

    /// <summary>
    /// The description of the task.
    /// </summary>
    public required string Description { get; init; }

    /// <summary>
    /// The progress of the task between 0 and 1.
    /// </summary>'
    public required float Value { get; init; }
}

/// <summary>
/// Reports the progress of a task to an <see cref="IProgress{TaskProgressInfo}"/>.
/// </summary>
public sealed class ProgressReporter : IDisposable
{
    private static int nextId;

    private readonly int id;
    private readonly string description;
    private readonly IProgress<TaskProgressInfo>? progress;
    private readonly int totalSteps;
    private int currentStep;

    /// <summary>
    /// Initializes a new instance of the <see cref="ProgressReporter"/> class
    /// and reports the start of the task.
    /// </summary>
    /// <param name="description">The task description.</param>
    /// <param name="progress">The <see cref="IProgress{TaskProgressInfo}" /> to report to.</param>
    /// <param name="totalSteps">The total number of steps of the task.</param>
    public ProgressReporter(
        string description,
        IProgress<TaskProgressInfo>? progress,
        int totalSteps = 1
    )
    {
        id = Interlocked.Increment(ref nextId);
        this.description = description;
        this.progress = progress;
        this.totalSteps = Math.Max(totalSteps, 1);
        currentStep = 0;

        progress?.Report(
            new TaskProgressInfo
            {
                Id = id,
                Description = description,
                Value = 0f,
            }
        );
    }

    /// <summary>
    /// Increments and reports the progress of the task.
    /// </summary>
    public void Step()
    {
        progress?.Report(
            new TaskProgressInfo
            {
                Id = id,
                Description = description,
                Value = (float)++currentStep / totalSteps,
            }
        );
    }

    /// <summary>
    /// Reports the completion of the task.
    /// </summary>
    public void Dispose()
    {
        if (currentStep < totalSteps)
        {
            currentStep = totalSteps;
            progress?.Report(
                new TaskProgressInfo
                {
                    Id = id,
                    Description = description,
                    Value = 1f,
                }
            );
        }
    }
}
