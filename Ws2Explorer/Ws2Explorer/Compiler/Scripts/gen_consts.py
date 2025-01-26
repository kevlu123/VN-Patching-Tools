from op_list import *

def pascal_to_caps(code, desc):
    return "".join(
        c if c.islower() or not i else f"_{c}"
        for i, c in enumerate(desc)
    ).upper() + f"_{code:02X}"

for code, desc in descriptions.items():
    print(f"public const byte {pascal_to_caps(code, desc)} = {code};")
