import os
import pathlib

this_dir = pathlib.Path(__file__).parent
os.chdir(this_dir)

class Conversion:
    def __init__(self, jp_flag: int, cg_name: str, en_flag: int):
        self.jp_flag = jp_flag
        self.en_flag = en_flag

class Script:
    def __init__(self, name: str, *conversions: Conversion):
        self.name = name
        self.conversions = conversions

NEW = 1080 + 62
scripts = [
    Script("AFT_003_E",
        Conversion(1083, "AFT_03", 1082),
        Conversion(1089, "AFT_04", NEW + 0),
        Conversion(1090, "AFT_05", NEW + 1),
        Conversion(1091, "AFT_06", NEW + 2)),

    Script("AFT_007_3_E",
        Conversion(1092, "AFT_09", NEW + 3),
        Conversion(1093, "AFT_10", NEW + 4)),

    Script("AGS_001",
        Conversion(1125, "AGS_01", NEW + 18),
        Conversion(1126, "AGS_02", NEW + 19),
        Conversion(1127, "AGS_03", NEW + 20),
        Conversion(1135, "AGE_16", NEW + 21)),

    Script("BEF_003_E",
        Conversion(1099, "BEF_03", NEW + 5),
        Conversion(1100, "BEF_04", NEW + 6)),

    Script("BEF_004_E",
        Conversion(1101, "BEF_06", NEW + 7),
        Conversion(1102, "BEF_07", NEW + 8)),

    Script("HOT_002_E",
        Conversion(1109, "HOT_04", 1098),
        Conversion(1110, "HOT_05", NEW + 9)),

    Script("HOT_004_E",
        Conversion(1109, "HOT_04", 1098),
        Conversion(1111, "HOT_07", NEW + 10),
        Conversion(1112, "HOT_08", NEW + 11)),

    Script("HUS_001_E",
        Conversion(1123, "HUS_01", NEW + 16),
        Conversion(1124, "HUS_02", NEW + 17)),

    Script("KAN_3001_3_E",
        Conversion(1118, "KAN_05", NEW + 12),
        Conversion(1119, "KAN_06", NEW + 13)),

    Script("KAN_3001_4_E",
        Conversion(1113, "KAN_01", 1102),
        Conversion(1118, "KAN_05", NEW + 12),
        Conversion(1119, "KAN_06", NEW + 13)),

    Script("KAN_3002_2",
        Conversion(1120, "KAN_07", NEW + 14),
        Conversion(1121, "KAN_08", NEW + 15)),
]

for script in scripts:
    with open(f"thumbnail_flags/{script.name}.json", encoding="utf-8") as f:
        data = f.read()
    for conv in script.conversions:
        search = f'SetFlag",    "args":[{conv.jp_flag}'
        replace = f'SetFlag",    "args":[{conv.en_flag}'
        data = data.replace(search, replace)
    os.makedirs(f"../patch/Rio.arc/{script.name}.ws2", exist_ok=True)
    with open(f"../patch/Rio.arc/{script.name}.ws2/opcodes.json", "w", encoding="utf-8") as f:
        f.write(data)
