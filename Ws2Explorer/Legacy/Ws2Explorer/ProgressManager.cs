global using ITaskProgress = System.IProgress<(int id, string task, float value)>;

namespace Ws2Explorer;

class ProgressManager : IDisposable {
    private static int nextId;

    private readonly ITaskProgress? parent;
    private readonly int totalSteps;
    private int currentStep;
    private readonly int id;
    public string Task { get; }

    public ProgressManager(string task, ITaskProgress? parent, int totalSteps) {
        Task = task;
        this.parent = parent;
        this.totalSteps = totalSteps;
        currentStep = 0;
        id = nextId++;

        parent?.Report((id, Task, 0f));
    }

    public void Step() {
        parent?.Report((id, Task, (float)currentStep++ / totalSteps));
    }

    public void Dispose() {
        parent?.Report((id, Task, 1f));
    }
}
