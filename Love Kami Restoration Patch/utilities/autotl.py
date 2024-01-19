# Copyright (C) 2023 Kevin Lu

import textwrap
import deepl
import json
import sys
import os
import pathlib

this_dir = pathlib.Path(__file__).parent.absolute()
os.chdir(this_dir.parent)

LINE_WIDTH = 48

def print_warning(message):
    print(f"\033[93m{message}\033[0m")

def pre_process(s):
    return (s
        .removesuffix("%K%P")
        .replace("\\n", "")
        .replace("\u3000", " ")
        .replace("おち○", "おちん")
        .replace("おま○", "おまん")
    )

def post_process(s):
    s = (s
        .replace("the cagoulees", "Kagura")
        .replace("a cagouleur", "Kagura")
        .replace("the cagouleur", "Kagura")
        .replace("the cagula", "Kagura")
        .replace("cagula", "Kagura")
        .replace("a cagra", "Kagura")
        .replace("the cagra", "Kagura")
        .replace("cagra", "Kagura")
        .replace("CAGRA", "Kagura")
        .replace("a cagoule", "Kagura")
        .replace("the cagoule", "Kagura")
        .replace("his cagoule", "Kagura")
        .replace("cagoule", "Kagura")
        .replace("Cagla", "Kagura")
        .replace("Cagrà", "Kagura")
        .replace("cagrà", "Kagura")
        .replace("Kaguraur", "Kagura")
        .replace("Sarah", "Sara")
        .replace("っCOPY00っ", "Ug")
        .replace("Suri", "Shuri")

        .replace("general", "Sho")
        .replace("General", "Sho")
        .replace("Shogun", "Sho")
        .replace("Mr. Inori", "Inori")

        .replace("Akki", "Aki")
        .replace("Zion", "Shion")
        .replace("Mr. Kaede", "Kaede")
    )
    if s.endswith('"') and not s.startswith('"'):
        s = '"' + s
    s = s.replace('"', "'")
    return s

def process(code, line_rows, files):
    for file in files:
        with open(f"text/{code}_text/{file}.ws2.json", encoding="utf-8") as f:
            jp_lines = [pre_process(x) for x in json.load(f)]

        lines = []
        for i, jp_line in enumerate(jp_lines):
            from_cache = False
            if tl := deepl.get_from_cache(jp_line):
                from_cache = True
            elif jp_line.startswith("「") and (tl := deepl.get_from_cache(jp_line[1:-1])):
                tl = f'"{tl}"'
                from_cache = True
            elif tl := deepl.translate(jp_line):
                pass
            elif jp_line.startswith("「") and (tl := deepl.translate(jp_line[1:-1])):
                tl = f'"{tl}"'
            else:
                print_warning(f"Failed to translate {jp_line}")
                lines.append("")
                continue

            tl = post_process(tl)
            if not from_cache:
                print(f"{file} {i + 1}: {jp_line} -> {tl}")

            wrapped = textwrap.wrap(tl.strip(), width=LINE_WIDTH)
            final = "\\n".join(wrapped) + "%K%P"
            if len(wrapped) > line_rows:
                print_warning(f"Line {i + 1} in {file} has more than {line_rows} lines.")
                print_warning("  " + final)
            lines.append(final)

        with open(f"edited_text/{code}_text/{file}.ws2.json", "w", encoding="utf-8") as f:
            json.dump(lines, f, ensure_ascii=False, indent=0)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python autotl.py <ss|tg|ph>")
        exit()
    
    code = sys.argv[1]
    if code == "ss":
        process("ss", 4, [
            "kagu02_02",
            "kagu05_02",
            "kagu06_02",
            "sar03_03",
            "sar05_02",
            "shu02_05",
            "shu03_02",
        ])
    elif code == "tg":
        process("tg", 3, [
            "aka03_01_H",
            "aka05b_01_H",
            "ino03_01_H",
            "ino05_01_H",
            "mai03_01_H",
            "mai05_01_H",
        ])
    elif code == "ph":
        process("ph", 3, [
            "kae03_01",
            "kae06_01",
            "sio02_01",
            "sio06_01",
            "yuk01_03",
            "yuk02_03",
        ])
    else:
        print("Invalid code")
        exit()
