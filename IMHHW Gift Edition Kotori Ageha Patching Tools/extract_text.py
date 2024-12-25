# Copyright (C) 2023 Kevin Lu

import json
import sys

# Like bytes.find, but with '*' as wildcard
def find(s: bytes, pattern: bytes, start=0):
    for i in range(start, len(s) - len(pattern) + 1):
        for j, c in enumerate(pattern):
            if s[i + j] != c and c != 42:
                break
        else:
            return i
    return -1

def extract(data: bytes):
    dialog = []
    end = 0
    while (very_start := find(data, b"\x00\x00**\x14", end)) != -1: # Find the start of the dialog
        very_start += 5

        # Find the end of the dialog part
        start = very_start
        end = data.find(b"\x00", start)
        text = data[start:end].decode("utf-8")
        size = end - start

        # The dialog may be split into multiple parts so
        # find these and append them to the text
        while find(data[end:end + 4], b"\x00\x1a*\x14") == 0:
            start = end + 4
            end = data.find(b"\x00", start)
            part = data[start:end].replace(b"\xE3\x80\x80", b"") # Remove special space character
            text += part.decode("utf-8")
            size += end - start + 4

        if not text:
            # Was not dialog
            continue
        
        # Scan backwards to find the speaker's name
        name_end = very_start - 23
        name_end_text = data[name_end - 3:name_end + 1]
        if name_end_text != b"\xE3\x80\x91\x00":
            # No speaker
            name = ""
            name_start = 0
            name_end = 0
        else:
            name_start = data.rfind(b"\xE3\x80\x90", 0, name_end + 1)
            name = data[name_start:name_end].decode("utf-8")

        # This line is special for some reason and gets cut off
        if text.startswith("今日はここ――トビウオ荘で"):
            text = text[:-4]
            text += b"\xE4\xBC\x91\xE6\x9A\x87\xE3\x82\x92\xE9\x81\x8E\xE3\x81\x94\xE3\x81\x99\xE4\xBA\x88\xE5\xAE\x9A\xE3\x81\xA0\xE3\x81\xA3\xE3\x81\x9F\xE3\x80\x82".decode("utf-8")
            size = 139

        dialog.append({
            "offset": very_start,
            "size": size,
            "name_offset": name_start,
            "name": name,
            "jp": text,
            "text": "",
        })
    return dialog

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python extract_text.py <input.script> <output.json>")
        exit()
    
    inp = sys.argv[1]
    outp = sys.argv[2]
    if not outp.endswith(".json"):
        outp += ".json"

    with open(inp, "rb") as f:
        data = f.read()

    dialog = extract(data)

    with open(outp, "w", encoding="utf-8") as f:
        json.dump(dialog, f, ensure_ascii=False, indent=4)
