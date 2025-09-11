import sys

rotate = int(sys.argv[2]) if 2 < len(sys.argv) else 2
inp = sys.argv[1]
outp = inp + ".bin"

with open(inp, "rb") as f:
    data = f.read()

data = bytearray(
    ((x >> rotate) | (x << (8 - rotate))) & 0xFF
    for x in data
)

with open(outp, "wb") as f:
    f.write(data)
