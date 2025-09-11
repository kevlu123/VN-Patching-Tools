import os
import pathlib
import argparse

this_dir = pathlib.Path(__file__).parent.resolve()

parser = argparse.ArgumentParser()
parser.add_argument("-g", "--ghidra", help="Path to Ghidra analyzeHeadless.bat", required=True)
parser.add_argument("-p", "--project", help="Path to Ghidra project directory", required=True)
parser.add_argument("-e", "--exe", help="Name of executable in project without the .exe extension", required=True)
args = parser.parse_args()

cmd = f'{args.ghidra} "{args.project}" "{args.exe}" -noanalysis -scriptPath "{this_dir}/lib" -postScript decompile.ghidrascript.py -process "{args.exe}.exe"'
print(cmd)
print()
os.system(cmd)
