# Copyright (C) 2023 Kevin Lu

import glob
import sys
import os

def obfuscate(data):
    # Rotate left 2 bits
    data = bytearray(data)
    for i in range(len(data)):
        data[i] = ((data[i] << 2) & 0xFF) | (data[i] >> 6)
    return data

if __name__ == "__main__":
    if len(sys.argv) not in (3, 4):
        print("Usage: python pack_arc.py <directory> <output arc> [-d|--dont-obfuscate]")
        exit()
    
    directory = sys.argv[1]
    output_arc = sys.argv[2]
    if len(sys.argv) == 4 and sys.argv[3] in ("-d", "--dont-obfuscate"):
        obfuscate = lambda x: x

    # Read files
    files = [
        (os.path.basename(filename), open(filename, "rb").read())
        for filename in sorted(glob.glob(directory + "/*"))
    ]

    # Build files header
    files_header = bytearray()
    offset = 0
    for filename, data in files:
        files_header += (
            len(data).to_bytes(4, "little") +
            offset.to_bytes(4, "little") +
            filename.encode("UTF-16LE") +
            b'\x00\x00'
        )
        offset += len(data)
    
    # Build main header
    header = (
        len(files).to_bytes(4, "little") +
        len(files_header).to_bytes(4, "little")
    )
    
    # Write arc
    with open(output_arc, "wb") as f:
        f.write(header)
        f.write(files_header)
        for _, data in files:
            f.write(obfuscate(data))