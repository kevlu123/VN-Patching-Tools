# Copyright (C) 2023 Kevin Lu

class Patch:
    def __init__(self, name: str, unpatched_sha256: str, patched_sha256: str,
                changes: list[tuple[int, int, int]], # (offset, unpatched byte, patched byte)
                is_reverse: bool = False):
        self.name = name
        self.unpatched_sha256 = unpatched_sha256
        self.patched_sha256 = patched_sha256
        self.changes = changes
        self.is_reverse = is_reverse

    def __str__(self):
        return f"<Patch {self.name}>"

PATCHES = [
    # Moshi Ashita Ga Hare Naraba - NoDVD Patch
    #
    # offset  bytes           x86 assembly
    # ------------------------------------
    # 1355    83 F8 01        cmp eax, 0x1
    # 1358    75 01           jne 0x135A
    # ------------------------------------
    #                  |
    #                  v
    # ------------------------------------
    # 1355    B8 01 00 00 00  mov eax, 0x1
    # ------------------------------------
    Patch(
        "もしも明日が晴れならば/Moshi Ashita Ga Hare Naraba - NoDVD Patch",
        "57ef8eb5101dbc09022cd07858d964f1a04fedbb34d57672d795ce52885d48b9",
        "dfa741e29f1a6e7f7d6bf8074206768fa4f9792c85a23aa8cf226c18c1225091",
        [
            (0x1355, 0x83, 0xB8),
            (0x1356, 0xF8, 0x01),
            (0x1357, 0x01, 0x00),
            (0x1358, 0x75, 0x00),
            (0x1359, 0x01, 0x00),
        ]),

    # Sakura Strasse - NoDVD Patch
    #
    # offset  bytes           x86 assembly
    # ------------------------------------
    # 1F4F5   83 F8 01        cmp eax, 0x1
    # 1F4F8   75 01           jne 0x1F4FA
    # ------------------------------------
    #                  |
    #                  v
    # ------------------------------------
    # 1F4F5   B8 01 00 00 00  mov eax, 0x1
    # ------------------------------------
    Patch(
        "さくらシュトラッセ/Sakura Strasse",
        "d9b8948f79ecd74b51c8654c2f5a4894cff3d82359cbfd9c17b8862fd303a055",
        "51e86bc5755fe4092aeefa1542e429cf6002ce160df23ff5ecabb4faa01d30b3",
        [
            (0x1F4F5, 0x83, 0xB8),
            (0x1F4F6, 0xF8, 0x01),
            (0x1F4F7, 0x01, 0x00),
            (0x1F4F8, 0x75, 0x00),
            (0x1F4F9, 0x01, 0x00),
        ]),

    # Yume Miru Kusuri - NoDVD Patch
    #
    # offset  bytes           x86 assembly
    # ------------------------------------
    # 2D4CF   75 2F           jne 0x2D500
    # ------------------------------------
    #                  |
    #                  v
    # ------------------------------------
    # 2D4CF   EB 2F           jmp 0x2D500
    # ------------------------------------
    Patch(
        "Yume Miru Kusuri",
        "c66b6c49b409656b3d723cd8d296eca274e0903785a36285e81c72395d983917",
        "00058c1d4173ae675eb04f7d1d4a9775fdbfec977e1ffe79ca4229835fd4bbc9",
        [
            (0x2D4CF, 0x75, 0xEB),
        ]),
]

import sys
import hashlib

def reverse_patch(patch):
    return Patch(
        patch.name + " (Undo Patch)",
        patch.patched_sha256,
        patch.unpatched_sha256,
        [(offset, patched, unpatched) for offset, unpatched, patched in patch.changes],
        not patch.is_reverse
    )

def do_patch(in_file):
    # Read file and get SHA256 hash
    in_file_no_ext = in_file[:in_file.rfind(".")]
    with open(in_file, "rb") as f:
        data = bytearray(f.read())
    sha256 = hashlib.sha256(data).hexdigest()

    # Recognise file
    patches = {}
    for patch in PATCHES:
        patches[patch.unpatched_sha256] = patch
        patches[patch.patched_sha256] = reverse_patch(patch)
    if sha256 not in patches:
        print(f"{in_file} is unrecognised.\nNot patching.")
        exit()

    # Apply patch
    patch = patches[sha256]
    print(f"Applying {patch.name}")
    for offset, _, patched in patch.changes:
        data[offset] = patched

    # Check SHA256 hash
    new_sha256 = hashlib.sha256(data).hexdigest()
    if new_sha256 != patch.patched_sha256:
        print(f"Error: Final SHA256 hash is {new_sha256}, expected {patch.patched_sha256}.\nNot patching.")
        exit()

    # Write file
    if patch.is_reverse:
        out_file = in_file_no_ext + "_original.exe"
    else:
        out_file = in_file_no_ext + "_nodvd.exe"
    with open(out_file, "wb") as f:
        f.write(data)
    print(f"Saved to {out_file}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python patch.py <game exe file>")
        exit()
    do_patch(sys.argv[1])
