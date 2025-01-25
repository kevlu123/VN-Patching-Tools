namespace Ws2Explorer.Gui;

static class Program
{
    [STAThread]
    static void Main(string[] args)
    {
        var openPath = args.Length == 0 ? null : args[0];
        ApplicationConfiguration.Initialize();
        Application.Run(new MainWindow(openPath));
    }
}