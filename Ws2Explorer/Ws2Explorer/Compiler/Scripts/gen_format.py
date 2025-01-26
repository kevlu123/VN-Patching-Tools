from op_list import *

versions = [t1, t2, t3, t4]
s = ["ImmutableArray<OpFormat> Formats = [\n"]
for op in range(256):
    if op in descriptions:
        description = f"\"{descriptions[op]}\""
    else:
        description = "null"
    s.append(f"    /* {op:02X} */ new({description:21}")
    for i, v in enumerate(versions):
        if op in v:
            fmt = f"\"{v[op]}\""
        else:
            fmt = "null"
        s.append(f", {fmt:29}")
        if i == len(versions) - 1:
            s.append("),\n")
s.append("];")
print("".join(s))
