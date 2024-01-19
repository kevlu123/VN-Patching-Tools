# Copyright (C) 2023 Kevin Lu

import advhd_ws2
import glob
import pathlib
import os
import sys
import json
advhd_ws2.print = lambda *args, **kwargs: None

def extract(input_folder, output_folder):
    line_count = 0
    os.makedirs(output_folder, exist_ok=True)
    files = glob.glob(input_folder + "/*.ws2")
    for file in files:
        name = pathlib.Path(file).name
        outfile = os.path.join(output_folder, name + ".json")
        text = [x["text"] for x in advhd_ws2.export_ws2(file, "")]
        if text:
            line_count += len(text)
            with open(outfile, "w", encoding="utf-8") as f:
                json.dump(text, f, ensure_ascii=False, indent=0)
    print(f"Extracted {line_count} lines")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python extract_text.py <ws2_folder> <out_folder>")
        exit()
    
    extract(sys.argv[1], sys.argv[2])
