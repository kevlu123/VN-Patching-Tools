try:
    from ghidra.ghidra_builtins import *
    from ghidra.program.model.listing import *
except:
    pass

from ghidra.app.decompiler import DecompInterface
from ghidra.util.task import ConsoleTaskMonitor
import time

TIMEOUT_SECS = 120

out = open("out.c", "w")

def main():
    start = time.time()
    monitor = ConsoleTaskMonitor()

    decompiler = DecompInterface()
    decompiler.openProgram(getCurrentProgram())
    queue = [getFunction("entry")]

    count = 0
    while count < len(queue):
        count += 1
        print("Processing " + str(count) + "/" + str(len(queue)) + " (" + str(round(time.time() - start, 2)) + "s)")

        fn = queue[count - 1]
        results = decompiler.decompileFunction(fn, TIMEOUT_SECS, monitor)
        if results.decompileCompleted():
            code = results.getDecompiledFunction().getC()
            out.write("\n//========================================================\n")
            out.write(code.replace("\r\n", "\n"))
            out.flush()

        called = fn.getCalledFunctions(monitor)
        for c in called:
            if c not in queue:
                queue.append(c)

    print("Done!")

main()
