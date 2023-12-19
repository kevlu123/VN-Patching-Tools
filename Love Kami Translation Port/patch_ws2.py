# Copyright (C) 2023 Kevin Lu

import os
import sys
import shutil
import glob
import json
import pathlib

temp_folder = "patching_temp"

def read_src(filename):
    with open(filename, "r", encoding="sjis") as f:
        src_lines = [x.removesuffix("\n") for x in f.readlines()]
    
    text_positions = []
    name_data = []
    choice_data = []

    for i, line in enumerate(src_lines):
        if line.startswith("SetDisplayName"):
            name = line[line.index("'")+1:-2]
            name = name[3:] if name.startswith("%") else name
            if name:
                name_data.append((line.replace(name, "{}"), name, i))
                
        elif line.startswith("DisplayMessage") and src_lines[i + 1] != "%P":
            text_positions.append(i + 1)
        
        elif line.startswith("ShowChoice"):
            j = 0
            while src_lines[i + j + 1] != ");":
                j += 2
                choice_data.append((src_lines[i + j], i + j))

    # src_lines: list[str]
    # text_positions: list[int]
    # name_data: list[Tuple(str fmt, str name, int line_number)]
    # choice_data: list[Tuple(str text, int line_number)]
    return src_lines, text_positions, name_data, choice_data

def get_patch_path(in_patch_folder, src_filename):
    stem = str(pathlib.Path(src_filename).name).removesuffix(".ws2.src")
    
    patch_path = os.path.join(in_patch_folder, stem + "_E.ws2.json")
    if os.path.isfile(patch_path):
        return patch_path

    patch_path = os.path.join(in_patch_folder, stem + ".ws2.json")
    if os.path.isfile(patch_path):
        return patch_path
    
    print_warning(f"Warning: {patch_path} not found")
    return None

def print_warning(message):
    print(f"\033[93m{message}\033[0m")

def print_error(message):
    print(f"\033[91m{message}\033[0m")

if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: patch_ws2.py <text patch folder> <names_choices.json> <in ws2 folder> <out ws2 folder>")
        exit()

    in_patch_folder = sys.argv[1]
    other_file = sys.argv[2]
    in_ws2_folder = sys.argv[3]
    out_ws2_folder = sys.argv[4]

    with open(other_file, "r", encoding="utf-8") as f:
        j = json.load(f)
    names = j["names"]
    choices = j["choices"]

    # Initialise folders
    shutil.rmtree(temp_folder, ignore_errors=True)
    os.makedirs(temp_folder, exist_ok=True)
    os.makedirs(out_ws2_folder, exist_ok=True)
    
    # Copy ws2 files to temp folder
    for file in glob.glob(in_ws2_folder + "/*.ws2"):
        shutil.copy(file, temp_folder)
    
    # Decompile ws2 files
    if os.system(f"php advhd_ws2_tools/ws2_decompile.php {temp_folder}"):
        print_error("Error: ws2 decompile failed")
        exit()

    for file in glob.glob(f"{temp_folder}/*.ws2.src"):
        # Read ws2 src file
        src, text_pos, name_data, choice_data = read_src(file)
        if not text_pos:
            continue

        # Read patch file
        patch_file = get_patch_path(in_patch_folder, file)
        if not patch_file:
            continue
        with open(patch_file, "r", encoding="utf-8") as f:
            patch_lines = json.load(f)

        if len(text_pos) != len(patch_lines):
            print_warning(f"Warning: {patch_file} has {len(patch_lines)} lines, but {file} has {len(text_pos)} lines")
            continue
        
        # Patch ws2 src file
        for i, line in enumerate(patch_lines):
            src[text_pos[i]] = line
        for fmt, name, line_number in name_data:
            if name not in names:
                print_warning(f"Warning: name {name} not found for {file}")
                continue
            src[line_number] = fmt.format(names[name])
        for text, line_number in choice_data:
            if text not in choices:
                print_warning(f"Warning: choice {text} not found for {file}")
                continue
            src[line_number] = choices[text]
        
        # Write ws2 src file
        try:
            new_src = "\n".join(src).encode("sjis")
        except UnicodeEncodeError as e:
            print_error(f"Warning: {file} contains invalid sjis characters at offset {e.start}")
            exit()
        else:
            with open(file, "wb") as f:
                f.write(new_src)
        #print(f"Patched {file} with {patch_file}")
    
    # Compile ws2 files
    if os.system(f"php advhd_ws2_tools/ws2_compile.php {temp_folder} 1.9 default"):
        print_error("Error: ws2 compile failed")
        exit()

    # Copy patched ws2 files to out folder
    for file in glob.glob(f"{temp_folder}/*.ws2.cmp"):
        out_file = os.path.join(out_ws2_folder, os.path.basename(file).removesuffix(".cmp"))
        shutil.copy(file, out_file)
