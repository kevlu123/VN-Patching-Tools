# If My Heart Had Wings Flight Diary Patching Tools

This patch is based on [DarthFly's Patch](https://www.reddit.com/r/IMHHW/comments/10ul2nc/if_my_heart_had_wings_flight_diary_restoration/) which restores the JP content to the EN Steam version but fixes several features as listed under [Goals](#goals).

**The new text is not translated**, but game is in a presentable state and the translation is the only thing that needs to be done.

## Goals

- [x] Restore the Ageha/Hotaru button on the story select screen.
- [x] Restore the CG gallery.
- [x] Restore the scene-replay gallery. 
- [x] Fix broken choice.
- [ ] Fix crash.
- Any other suggestions.

## Applying the Patch

- Start with a copy of the [Steam version](https://vndb.org/r58996).
- Download and unzip the two zip files and replace the game files.
  - <https://github.com/kevlu123/VN-Patching-Tools/releases/download/IMHHW-Flight-Diary-v1.1/IMHHW-Flight-Diary-v1.1-Part1.zip>
  - <https://github.com/kevlu123/VN-Patching-Tools/releases/download/IMHHW-Flight-Diary-v1.1/IMHHW-Flight-Diary-v1.1-Part2.zip>

Note that this patch hasn't been well tested. Please let me know of any issues.

## Developers

Everything below is intended for developers.

To derive the patch:
- Start with a copy of the [Steam version](https://vndb.org/r58996).
- Apply [DarthFly's patch](https://www.reddit.com/r/IMHHW/comments/10ul2nc/if_my_heart_had_wings_flight_diary_restoration/).
- Use [Ws2Explorer](../Ws2Explorer) to edit the .arc and .ws2 files and replace the corresponding content in the `patch` folder.

## Lua Hacking

The compiled Lua files can be decompiled with <https://luadec.metaworm.site/>. Some files will not decompile correctly (see <https://github.com/metaworm/luac-parser-rs/issues/36>) so you can't edit them directly but they are still useful to look through.

Since the Lua interpreter interprets both source and bytecode indiscriminately, we don't have to recompile any code before inserting it back into `Script.arc`. **We can insert the Lua source file as is in text form**. If you do want to recompile for whatever reason, you will need a 32-bit version of luac 5.3.

On start, the game checks for the existence of each file in `LegacyGame.inc` but does not immediately load all the scripts into the interpreter. To get around the complexities of load order and time, we can bundle all the scripts together into the first Lua file that gets loaded (`GameInfo.lua`). To do this, we can store the compiled Lua files as byte arrays and call `load(MyByteArray)()` on each byte array to execute them. From here, we can append any custom code and guarantee that our code will run last, meaning we can override the functions we want to customise.

The script `ArcFileName.lua` gets loaded immediately after `GameInfo.lua` on start so I used this as an opportunity to separate custom code into this file while the precompiled code stays in `GameInfo.lua`.

To generate the new Lua scripts to be inserted, run `python3 lua/aggregate_lua.py`.

## Adding New Images to PNA files

Currently, [Ws2Explorer](../Ws2Explorer) doesn't support adding new images to PNA files. It only allows modifying existing images. Fortunately, the PNA format is very simple and can be edited with a hex editor. Some of the header fields are still unknown but it seems like AdvHD doesn't care too much about some of the fields being garbage.

## Restoring the Ageha/Hotaru Button

The code for managing the story screen is in the `openStory()` function of `LegacyGame.lua`. We can override a few index ranges to add the new button in. After adding the button, the stories got magically linked to the correct button without any extra effort.

## Restoring the CG gallery

The code for the gallery is in the `GalleryCgMenu()` function of `menu_gallery.lua` and the code for viewing the actual CG is in `Rio.arc/CG_PAGEXX.ws2`. The process to change the CG gallery to look and behave like the JP version is quite complex. The order of the CGs displayed and when they unlock need to be changed.

There are a set of CGs only present in the EN version which were made to replaced the H-scenes. I have added an extra entry to the end of the gallery to view these CGs. Since they aren't normally encountered, I have made them viewable without needing to unlock them.

### CG Flags

Each CG has a flag to store whether the CG has been unlocked. The flags for the EN version do not overlap and conflict with the flags for the JP version so the process for merging is simple enough:
- If CG is EN only, then associate the CG with the EN flag.
- If CG is JP only, then associate the CG with the JP flag.
- If CG is present in both, then associate the CG with the EN flag.

To generate the `CG_PAGEXX.ws2` opcode files with the corrected flag check, run `python3 gallery_cg/merge_cg_pages.py`

### Thumbnail Flags

Each CG thumbnail in the gallery also has their own flag to store whether the thumbnail is shown and clickable. Unfortunately, these do conflict between versions so unlocking a thumbnail may also unlock unrelated thumbnails. To fix this, we need to assign a new set of flags to the JP only thumbnails. I used flags in the range [1142, 1163].

The first thing to do is to modify the Lua code to map the JP thumbnail index to the correct EN thumbnail flag when it performs the unlock check since almost all the .ws2 scripts assume EN thumbnail flags. The mapping needs to be done by hand. Some thumbnail indices do not have a corresponding EN thumbnail flag since they were removed from the EN version. For these, we need to map the thumbnail index to the new set of flags we created.

There are about 1000 occurrences to replace so the script `python3 gallery_thumbnail/convert_thumbnail_flags.py` does the work. Some manual work was required to isolate the JP parts.

## Fixing Broken Choices

It seems like the choice buttons aren't registered to receive any mouse events so you can't interact with them except for the first frame that they appear. Luckily, the choice functionality still exists in the code so we just need to invoke the right functions at the right time.

We need to detect when the cursor hovers over the choice buttons and when a click occurs. To do this, we can intercept the `MenuMouseMove()` and `MenuLButtonUp()` functions in `menu_base.lua`. To identify the choice buttons we can intercept the choice button creation and cleanup functions `g_MenuMsgWin.MakeSelectBut()` and `g_MenuMsgWin.closeSelect()` in `LegacyGame.lua` to keep track of the buttons that currently exist. To find out which button is currently hovered, we can intercept the buttons' `bt_change()` method in `ui_button.lua` which contains the hit testing.

Once a choice button is hovered over and clicked, we can call
```lua
cfunc.LegacyGame__lua_SelectItem(hovering_choice_button_index)
g_MenuMsgWin:closeSelect(hovering_choice_button_index)
```

## Fixing Crash

The game sometimes crashes when skipping through the entire Asa/Yoru route. The crash happens near the end but not in a consistent place. This has not been resolved but is unlikely to be encountered during a normal playthrough.

Notes:
- Using a debugger, I can see that the process exits cleanly i.e. it is not a null dereference etc.
- Replacing `lua5.3.dll` with newly built one from <https://github.com/lua/lua/tree/v5.3.6> does not fix it.
- Splitting the route into two .ws2 files instead of one does not fix it.
- If I only patch `HUS_001_E.ws2`, the crash still occurs although I haven't been able to reproduce the crash after the first time.
- If I loop the original `HUS_001_E.ws2`, the crash does not occur or I got lucky.
