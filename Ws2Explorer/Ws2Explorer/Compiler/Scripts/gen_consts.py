from op_list import *

def pascal_to_caps(code, desc):
    return "".join(
        c if c.islower() or not i else f"_{c}"
        for i, c in enumerate(desc)
    ).upper() + f"_{code:02X}"
    
print("public const int EPILOGUE = -1;")
print("public const int LABEL = -2;")
print("public const int VERSION = -3;")
for code, desc in descriptions.items():
    print(f"public const byte {pascal_to_caps(code, desc)} = {code};")
