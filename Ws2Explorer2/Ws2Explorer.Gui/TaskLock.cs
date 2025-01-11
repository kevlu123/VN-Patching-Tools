namespace Ws2Explorer.Gui;

class TaskLock : IDisposable
{
    private static bool locked;
    private static CancellationTokenSource cts = new();
    private static bool interruptable;
    public bool Acquired { get; }

    public TaskLock(bool interruptable, out CancellationToken ct)
    {
        if (TaskLock.interruptable)
        {
            Cancel();
        }
        Acquired = !locked;
        locked = true;
        if (Acquired)
        {
            TaskLock.interruptable = interruptable;
            ct = cts.Token;
        }
        else
        {
            ct = CancellationToken.None;
        }
    }

    public void Dispose()
    {
        if (Acquired)
        {
            locked = false;
        }
    }

    public static void Cancel()
    {
        cts.Cancel();
        cts.Dispose();
        cts = new CancellationTokenSource();
        locked = false;
    }
}
