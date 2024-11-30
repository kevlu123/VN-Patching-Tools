import base64
import pathlib
import os

this_dir = pathlib.Path(__file__).parent
os.chdir(this_dir)

# This is the first file loaded. Put all the precompiled code here.
LUA_FIRST = "GameInfo"
# This is the second file loaded. Put all the custom code here.
LUA_SECOND = "ArcFileName"

LUA_FILES = [
    "ArcFileName",
    "GameInfo",
    "LegacyGame",
    "LegacyGame_utf8",
    "VariableSize",
    "VersionInfo",
    "menu_base",
    "menu_config",
    "menu_gallery",
    "ui_GaugeBar",
    "ui_button",
    "ui_language",
    "ui_scrollbar",
]

os.makedirs("../patch/Script.arc", exist_ok=True)
open(f"../patch/Script.arc/{LUA_FIRST}.lua", "w")
open(f"../patch/Script.arc/{LUA_SECOND}.lua", "w")

precompiled = ["-- All precompiled code aggregated together:\n"]
for lua in LUA_FILES:
    with open(f"extracted/{lua}.lua", "rb") as f:
        data = f.read()
        encoded = base64.b64encode(data).decode("utf-8")
        precompiled.append(f"-- {lua}.lua")
        precompiled.append(f"{lua} = '{encoded}'")
with open("base64.lua") as f:
    precompiled.append(f.read())
for lua in LUA_FILES:
    precompiled.append(f"load(base64.decode({lua}))()")

for lua in LUA_FILES:
    with open(f"../patch/Script.arc/{lua}.lua", "w") as f:
        f.write(f"-- This code has been moved to {LUA_FIRST}.lua.")
with open(f"../patch/Script.arc/{LUA_FIRST}.lua", "w") as f:
    f.write("\n".join(precompiled))

with open(f"custom.lua", "r") as f:
    with open(f"../patch/Script.arc/{LUA_SECOND}.lua", "w") as f2:
        f2.write(f.read())
