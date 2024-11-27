# If My Heart Had Wings Flight Diary Patching Tools

## Goals

- [x] Restore the Ageha/Hotaru button on the story select screen.
- [ ] Restore the gallery.
- [ ] Fix broken choice.
- [ ] Fix crash.
- Add Akari route if someone has a copy.
- Any other suggestions.

## Applying the Patch

This patch is intended for other patch developers to build off from.

Apply [DarthFly's patch](https://www.reddit.com/r/IMHHW/comments/10ul2nc/if_my_heart_had_wings_flight_diary_restoration/) to the [Steam version](https://vndb.org/r58996).

See the `patch` folder for the patch files and use [Ws2Explorer](../Ws2Explorer) or any other tool to edit the .arc files.

- Replace each lua file in `Script.arc`.
- Replace `SYS_Story.pna` in `SysGraphic.arc`.

## Lua Hacking

The compiled Lua files can be decompiled with <https://luadec.metaworm.site/>. Some files will not decompile correctly (see <https://github.com/metaworm/luac-parser-rs/issues/36>) so you can't edit them directly but they are still useful to look through.

Since the Lua interpreter interprets both source and bytecode indiscriminately, we don't have to recompile any code before inserting it back into `Script.arc`. **We can insert the Lua source file as is in text form**. If you do want to recompile for whatever reason, you will need a 32-bit version of luac 5.3.

On start, the game checks for the existence of each file in `LegacyGame.inc` but does not immediately load all the scripts into the interpreter. To get around the complexities of load order and time, we can bundle all the scripts together into the first Lua file that gets loaded (`GameInfo.lua`). To do this, we can store the compiled Lua files as byte arrays and call `load(MyByteArray)()` on each byte array to execute them. From here, we can append any custom code with full guarantee that our code will run last so we don't have to worry about our code being overridden later.

I have decided to put custom code in `ArcFileName.lua` so that it is easier to make and view changes. This Lua file gets loaded immediately after `GameInfo.lua` so it works just as well. You can add customisations to `custom.lua` and run `python3 aggregate.py` to generate the new Lua files to be inserted.

### Restoring the Ageha/Hotaru Button

The code for managing the story screen is in the `openStory` function. We can override a few index ranges to add the new button in.

Inside `SysGraphic.arc/SYS_Story.pna`, there are some empty slots where we can insert new images for the new button. At this time, [Ws2Explorer](../Ws2Explorer) doesn't support adding new images to slots that didn't exist before. It half works but the metadata for that image isn't fully updated so I used a hex editor to fix the metadata manually.

See the end of `patch/menu_base.lua` for the modifications to the Lua code. After adding the button, I found that the stories got magically linked to the correct button. Pretty nice.
