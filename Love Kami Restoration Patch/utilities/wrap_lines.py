import textwrap
import sys
import glob
import json
import pathlib
import os

if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: python wrap_lines.py <max lines> <line width> <in folder> <out folder>")
        exit()

    max_lines = int(sys.argv[1])
    line_width = int(sys.argv[2])
    in_folder = sys.argv[3]
    out_folder = sys.argv[4]
    
    os.makedirs(out_folder, exist_ok=True)

    warning_count = 0
    for file in glob.glob(f"{in_folder}/*.ws2.json"):
        with open(file, encoding="utf-8") as f:
            lines = json.load(f)
        
        wrapped_lines = []
        for i, line in enumerate(lines):
            line = line.removesuffix("%K%P").replace("\\n", " ")
            wrapped = "\\n".join(textwrap.wrap(line, width=line_width))
            if wrapped.count("\\n") > max_lines - 1:
                print(f"{file} {i + 1}: {line}")
                warning_count += 1
            wrapped_lines.append(f"{wrapped}%K%P")
        
        out_file = f"{out_folder}/{pathlib.Path(file).name}"
        with open(out_file, "w", encoding="utf-8") as f:
            json.dump(wrapped_lines, f, ensure_ascii=False, indent=0)

    if warning_count > 0:
        print(f"{warning_count} lines too long.")