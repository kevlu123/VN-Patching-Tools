"""
Moshi Ashita Ga Hare Naraba (If Tomorrow's Weather is Fine) - NoDVD Patch

Japanese locale is still required to run the game.

This patch changes 5 bytes at offset 0x1355
to cause the validation function to return true (1).

-----------------------------
83 F8 01        cmp eax, 0x1
75 01           jne 0x135A
-----------------------------
             |
             v
-----------------------------
08 01 00 00 00  mov eax, 0x1
-----------------------------
"""

import sys
import hashlib

PATCHED_SHA256 = "dfa741e29f1a6e7f7d6bf8074206768fa4f9792c85a23aa8cf226c18c1225091"
UNPATCHED_SHA256 = "57ef8eb5101dbc09022cd07858d964f1a04fedbb34d57672d795ce52885d48b9"

# Get input filename (default to sysadv.exe)
if len(sys.argv) > 1:
    in_file = sys.argv[1]
else:
    in_file = "sysadv.exe"
in_file_no_ext = in_file[0:in_file.rfind('.')]

# Read file and get SHA256 hash
with open(in_file, "rb") as f:
    data = bytearray(f.read())
sha256 = hashlib.sha256(data).hexdigest()

# Patch or unpatch data
if sha256 == UNPATCHED_SHA256:
    print(f"{in_file} is unpatched.\nPatching...")
    data[0x1355:0x135A] = b"\xb8\x01\x00\x00\x00"
    out_file = in_file_no_ext + "_nodvd.exe"
elif sha256 == PATCHED_SHA256:
    print(f"{in_file} is patched.\nUnpatching...")
    data[0x1355:0x135A] = b"\x83\xf8\x01\x75\x01"
    out_file = in_file_no_ext + "_original.exe"
else:
    print(f"{in_file} is unrecognised.\nNot patching.")
    exit()

# Write file
with open(out_file, "wb") as f:
    f.write(data)
print(f"Saved to {out_file}")
