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

- Replace `menu_base.lua` in `Script.arc`.
- Replace `SYS_Story.pna` in `SysGraphic.arc`.

## Lua Hacking

- The compiled Lua files can be decompiled with <https://luadec.metaworm.site/>. Some files will not decompile correctly (see <https://github.com/metaworm/luac-parser-rs/issues/36>) so you can't edit them directly but they are still useful to look through. Those files are

| File | Error |
|------|-------|
| LegacyGame.lua   | LegacyGame.lua:731: no visible label 'label_83' for <goto> at line 500  |
| menu_config.lua  | menu_config.lua:40: no visible label 'label_9' for <goto> at line 35    |
| menu_gallery.lua | menu_gallery.lua:111: no visible label 'label_43' for <goto> at line 65 |
| ui_scrollbar.lua | ui_scrollbar.lua:99: no visible label 'label_18' for <goto> at line 23  |

- Since the Lua interpreter interprets both source and bytecode indiscriminately, we don't have to recompile any code before inserting it back into `Script.arc`. **We can insert the Lua source file as is in text form**. If you do want to recompile for whatever reason, you will need a 32-bit version of luac 5.3.

- On start, the game checks for the existence of each file in `LegacyGame.inc` but does not immediately load all the scripts into the interpreter. If you want some code to run, then make sure to put that code in a script that does run immediately or early enough. e.g. I haven't seen `VersionInfo.lua` run at all so there's no point in adding code there. To test when a script loads, insert an infinite loop in the script and watch the program hang.

### Restoring the Ageha/Hotaru Button

The code for managing the story screen is in `openStory` in `LegacyGame.lua`. This isn't a file we can modify since it doesn't decompile correctly but we can add code to `menu_base.lua` instead to override the `openStory` function since this file gets loaded after `LegacyGame.lua`.

Inside `SysGraphic.arc/SYS_Story.pna`, there are some empty slots where we can insert new images for the new button. At this time, [Ws2Explorer](../Ws2Explorer) doesn't support adding new images to slots that didn't exist before. It half works but the metadata for that image isn't fully updated so I used a hex editor to fix the metadata manually.

See the end of `patch/menu_base.lua` for the modifications to the Lua code. After adding the button, I found that the stories got magically linked to the correct button. Pretty nice.
