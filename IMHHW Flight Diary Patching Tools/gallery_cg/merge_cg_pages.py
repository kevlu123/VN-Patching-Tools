import pathlib
import os
import json
import cg_list

this_dir = pathlib.Path(__file__).parent
os.chdir(this_dir)

class CGFlag:
    def __init__(self, name: str, flag: int, page: int, index: int, variant: int):
        self.name = name
        self.flag = flag
        self.page = page # 0-indexed
        self.index = index # 0-indexed
        self.variant = variant # 0-indexed

def get_cg_flags(filename: str, page: int) -> dict[str, CGFlag]:
    with open(filename) as f:
        j = json.load(f)
    cgs = {}
    index = -1
    variant = 0
    for i, op in enumerate(j):
        if op["op"] == "Op01_ConditionalJump" and op["args"][1] == 105:
            index += 1
            variant = 0
        elif op["op"] == "Op1C_ExecuteFunction" and op["args"][0] == "openCgBrowser":
            cg = op["args"][1]
            flag = j[i - 1]["args"][1]
            cgs[cg] = CGFlag(cg, flag, page, index, variant)
            variant += 1
    return cgs

def parse_cg_flags() -> list[CGFlag]:
    en_cgs = {}
    for cg_page in range(7):
        en_cgs.update(get_cg_flags(f"cg_page_en/{cg_page + 1}.json", cg_page))
    jp_cgs = {}
    for cg_page in range(9):
        jp_cgs.update(get_cg_flags(f"cg_page_jp/{cg_page + 1}.json", cg_page))

    # Change flags to EN version
    for cg in jp_cgs.values():
        if cg.name in en_cgs:
            cg.flag = en_cgs[cg.name].flag
    
    # Add EN only CGs to the end
    variant = 0
    for cg in en_cgs.values():
        if cg.name.startswith("CSEV"):
            cg.page = 8
            cg.index = 2
            cg.variant = variant
            cg.flag = 0
            variant += 1
            jp_cgs[cg.name] = cg

    return list(jp_cgs.values())

def filter_page(cgs: list[CGFlag], page: int) -> list[list[CGFlag]]:
    page_cgs = [cg for cg in cgs if cg.page == page]
    result = []
    for index in range(9):
        index_cgs = [cg for cg in page_cgs if cg.index == index]
        if not index_cgs:
            break
        result.append(index_cgs)
    return result

def reconstruct(cgs: list[list[CGFlag]], page: int) -> str:
    label = 1
    result = []
    for index, index_cgs in enumerate(cgs):
        cg_number = page * 9 + index + 1
        # Check which CG to show
        result.append({"op":"Op01_ConditionalJump","args":[130,105,cg_number,0,index+1000]})

        for cg in index_cgs:
            if cg.name.lower() not in cg_list.FILES:
                continue
            # Add flag check
            if cg.flag:
                result.append({"op":"Op01_ConditionalJump","args":[2,cg.flag,1,0,label]})

            # Show CG
            result.append({"op":"Op1C_ExecuteFunction","args":["openCgBrowser",cg.name,0,0]})

            # Add right-click-to-close.
            # Looking at the original EN script, the last two arguments
            # should be 0,label but for some reason it only works when swapped. 
            result.append({"op":"Op01_ConditionalJump","args":[130,99,-1,label,0]})
            result.append({"op":"Op06_Jump2","args":[999999]})
            result.append({"op":"Label","args":[label]})

            label += 1
        result.append({"op":"Label","args":[index+1000]})

    result.append({"op":"Label","args":[999999]})
    result.append({"op":"Op05","args":[]})
    result.append({"op":"OpFF_FileEnd","args":[]})
    result.append({"op":"Epilogue","args":[0,0,0,0,0,0,0,0]})
    return "[\n" + ",\n".join(json.dumps(op) for op in result) + "\n]"

cgs = parse_cg_flags()
for page in range(9):
    page_cgs = filter_page(cgs, page)
    j = reconstruct(page_cgs, page)
    os.makedirs(f"../patch/Rio.arc/CG_PAGE0{page + 1}.ws2", exist_ok=True)
    with open(f"../patch/Rio.arc/CG_PAGE0{page + 1}.ws2/opcodes.json", "w") as f:
        f.write(j)
