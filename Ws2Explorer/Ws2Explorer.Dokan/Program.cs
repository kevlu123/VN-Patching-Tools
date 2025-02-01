#if DEBUG
#define DOKAN_DEBUG
#endif

using DokanNet;
using DokanNet.Logging;

namespace Ws2Explorer.Dokan;

static class Program
{
    const string DEFAULT_MOUNT_POINT = "W:";

    static async Task<int> Main()
    {
        var args = Environment.GetCommandLineArgs();
        if (args.Length < 2 || args.Length > 3)
        {
            Console.WriteLine($"Usage: {args[0]} <archive> [mountpoint]");
            Console.WriteLine();
            Console.WriteLine("Mount an archive at mountpoint");
            Console.WriteLine($"mountpoint defaults to {DEFAULT_MOUNT_POINT}");
            return 1;
        }

        try
        {
            var archivePath = args[1];
            var mountPoint = args.Length > 2 ? args[2] : "W:";

#if DOKAN_DEBUG
            using var dokanLogger = new ConsoleLogger("[Ws2Explorer.Dokan] ");
#else
            var dokanLogger = new NullLogger();
#endif
            using var dokan = new DokanNet.Dokan(dokanLogger);
            var dokanBuilder = new DokanInstanceBuilder(dokan)
                .ConfigureLogger(() => dokanLogger)
                .ConfigureOptions(options =>
                {
                    options.Options =
#if DOKAN_DEBUG
                        DokanOptions.DebugMode |
#endif
                        DokanOptions.EnableNotificationAPI;
                    options.MountPoint = mountPoint;
                });
            var fs = new FS(archivePath, dokanLogger);
            using var dokanInstance = dokanBuilder.Build(fs);
            Console.CancelKeyPress += (_, e) =>
            {
                e.Cancel = true;
                dokan.RemoveMountPoint(mountPoint);
            };
            await dokanInstance.WaitForFileSystemClosedAsync(uint.MaxValue);
            return 0;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
            return 2;
        }
    }
}
