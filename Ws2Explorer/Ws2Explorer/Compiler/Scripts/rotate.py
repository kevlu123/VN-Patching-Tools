import sys

rotate = int(sys.argv[1])
inp = sys.argv[2]
outp = inp + ".bin"

with open(inp, "rb") as f:
    data = f.read()

data = bytearray(
    ((x >> rotate) | (x << (8 - rotate))) & 0xFF
    for x in data
)

with open(outp, "wb") as f:
    f.write(data)
