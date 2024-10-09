# Copyright (C) 2023 Kevin Lu

import sys
import json
import textwrap

MAX_LINE_LEN_BEFORE_WRAP = 56

# Adjust the offsets in the header to account for the size change
def adjust_header_offsets(data: bytearray, sections: list[int], original_offset: int, size_delta: int):
    for section in sections:
        if section <= original_offset:
            continue

        replace = section.to_bytes(4, "big")
        i = data.find(replace, 0, 0x4f0)
        if i == -1:
            print("Failed to adjust header (offset not found)")
            exit()
        elif data.find(replace, i + 4, 0x4f0) != -1:
            print("Failed to adjust header (multiple offsets found)")
            exit()
        data[i:i + 4] = (section + size_delta).to_bytes(4, "big")

def patch_file(data: bytearray, patch: dict, names: dict):
    # Get a list of section offsets. Each section starts with "SCRE"
    sections = []
    i = 0
    while (i := data.find(b"SCRE", i + 1)) != -1:
        sections.append(i)
    
    # Find the unique section corresponding to this patch
    candidates = []
    for n, section in enumerate(sections):
        end = sections[n + 1] if n + 1 < len(sections) else len(data)
        if data.find(patch[5]["jp"].encode("utf-8"), section, end) != -1:
            candidates.append(section)

    if len(candidates) != 1:
        print(f"Failed to determine which section to patch ({candidates} candidates)")
        exit()

    size_delta = 0
    offset = candidates[0]
    for entry in reversed(patch):
        # Perform line wrapping and check final text length
        new_text = textwrap.fill(entry["text"], MAX_LINE_LEN_BEFORE_WRAP)
        MAX_LEN = 3 * MAX_LINE_LEN_BEFORE_WRAP
        if len(new_text) > MAX_LEN:
            print(f"Warning! Line is {len(new_text)} characters long which is over the limit of {MAX_LEN} characters.")
            print(f"\t{entry['text']}")

        # Patch bytes and record size change
        new_text = new_text.encode("utf-8")
        start = offset + entry["offset"]
        end = start + entry["size"]
        data[start:end] = new_text
        size_delta += len(new_text) - entry["size"]

        # Patch name
        if entry["name"]:
            jp_name = entry["name"]
            if jp_name not in names:
                print(f"Name '{jp_name}' not found in names.json")
                exit()
            new_name = names[jp_name].encode("utf-8")
            start = offset + entry["name_offset"]
            end = start + len(jp_name.encode("utf-8"))
            data[start:end] = new_name
            size_delta += len(new_name) - len(jp_name.encode("utf-8"))
    
    # Patch header
    adjust_header_offsets(data, sections, offset, size_delta)

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python patch_text.py <original.arc> <output.arc> <names.json> [patch1.json] [patch2.json] ...")
        exit()
    
    original_arc = sys.argv[1]
    output_arc = sys.argv[2]
    names_file = sys.argv[3]
    patch_files = sys.argv[4:]
    if not output_arc.endswith(".arc"):
        output_arc += ".arc"

    with open(original_arc, "rb") as f:
        data = bytearray(f.read())
    
    with open(names_file, "r", encoding="utf-8") as f:
        names = json.load(f)
    
    for patch in patch_files:
        with open(patch, "r", encoding="utf-8") as f:
            patch_file(data, json.load(f), names)

    with open(output_arc, "wb") as f:
        f.write(data)
