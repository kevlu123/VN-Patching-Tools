
# Instructions

- [Instructions](#instructions)
  - [CONDITIONAL\_JUMP\_01](#conditional_jump_01)
  - [JUMP\_02](#jump_02)
  - [CALL\_FILE\_04](#call_file_04)
  - [JUMP\_06](#jump_06)
  - [JUMP\_FILE\_07](#jump_file_07)
  - [MODIFY\_VARIABLE\_09](#modify_variable_09)
  - [SET\_FLAG\_0B](#set_flag_0b)
  - [SHOW\_CHOICE\_0F](#show_choice_0f)
  - [SET\_TIMER\_11](#set_timer_11)
    - [Version \<= V2](#version--v2)
    - [Version \>= V3](#version--v3)
  - [START\_TIMER\_12](#start_timer_12)
  - [DISPLAY\_TEXT\_14](#display_text_14)
    - [Version \<= V2](#version--v2-1)
    - [Version \>= V3](#version--v3-1)
  - [DISPLAY\_NAME\_15](#display_name_15)
    - [Version \<= V2](#version--v2-2)
    - [Version \>= V3](#version--v3-2)
  - [OPEN\_TITLE\_1A](#open_title_1a)
  - [CALL\_LUA\_1C](#call_lua_1c)
    - [Version \<= V1](#version--v1)
    - [Version \>= V2](#version--v2-3)
  - [PLAY\_MUSIC\_1E](#play_music_1e)
    - [Version \<= V2](#version--v2-4)
    - [Version \>= V3](#version--v3-3)
  - [STOP\_MUSIC\_1F](#stop_music_1f)
  - [PLAY\_SOUND\_28](#play_sound_28)
    - [Version \<= V2](#version--v2-5)
    - [Version \>= V3](#version--v3-4)
  - [STOP\_SOUND\_29](#stop_sound_29)
  - [START\_DISPLAY\_TEXT\_2E](#start_display_text_2e)
  - [SET\_BACKGROUND\_33](#set_background_33)
  - [LOAD\_PNA\_34](#load_pna_34)
  - [PLAY\_MOVIE\_35](#play_movie_35)
  - [CLEAR\_LAYER\_37](#clear_layer_37)
  - [DISPLAY\_PNA\_39](#display_pna_39)
  - [ORDER\_LAYERS\_3F](#order_layers_3f)
  - [GET\_LAYER\_PROPERTY\_45](#get_layer_property_45)
  - [SET\_LAYER\_PROPERTY\_46](#set_layer_property_46)
  - [EFFECT\_47](#effect_47)
  - [LOAD\_ANIMATION\_FRAME\_51](#load_animation_frame_51)
  - [SET\_NAMED\_VARIABLE\_6E](#set_named_variable_6e)
  - [FILE\_END\_FF](#file_end_ff)
- [Renderering](#renderering)

See [OpFormat.cs](Ws2Explorer/Compiler/OpFormat.cs) for the full list of instructions.

Notes
- All types are little endian.
- All strings are null terminated Shift-JIS encoded.
- All filenames are not case-sensitive.
- Arrays start with a byte indicating the array length. The data follows sequentially.
- Not all information here may be fully accurate.

## CONDITIONAL_JUMP_01

Compares a variable with a constant and conditionally jumps to a location within the same script.

| Type          | Name      | Description |
|---------------|-----------|-------------|
| int8          |           | |
| int16         | Variable  | The variable to compare. |
| float32       | Value     | The constant to compare. |
| int32 (label) | TrueJump  | The byte offset to jump to if compared equal or 0 for no jump. |
| int32 (label) | FalseJump | The byte offset to jump to if compared not equal or 0 for no jump. |

## JUMP_02

Unconditionally jumps to a location within the same script.

| Type          | Name | Description |
|---------------|------|-------------|
| int32 (label) | Jump | The byte offset to jump to. |

## CALL_FILE_04

Run another WS2 script and return back to this script when finished (like a function call).

| Type   | Name    | Description |
|--------|---------|-------------|
| string | Filename| The name of the script to call without the extension. |

## JUMP_06

Same as [JUMP_02](#jump_02).

## JUMP_FILE_07

Jump to another WS2 script (like a goto).

| Type   | Name     | Description |
|--------|----------|-------------|
| string | Filename | The name of the script to jump to without the extension. |

## MODIFY_VARIABLE_09

Modify a variable.

If Mode is 0x00:
- Set Variable to Value.

If Mode is 0x82:
- Subtract Value from Variable.

| Type    | Name     |
|---------|----------|
| int8    | Mode     |
| int16   | Variable |
| float32 | Value    |

## SET_FLAG_0B

Set a flag (boolean variable).

| Type  | Name  | Description |
|-------|-------|-------------|
| int16 | Flag  | The flag to set. |
| int8  | Value | The value to set the flag as. |

## SHOW_CHOICE_0F

Show the choice dialog.

| Type         | Name    | Description |
|--------------|---------|-------------|
| choice array | Choices | See [Choice](FileFormats.md#choice). |

## SET_TIMER_11

Initialise a timer with a duration.

### Version <= V2

| Type    | Name     | Description |
|---------|----------|-------------|
| string  | Timer    | The timer to initialise. |
| float32 | Duration | The duration to set in seconds. |

### Version >= V3

| Type    | Name     | Description |
|---------|----------|-------------|
| string  | Timer    | The timer to initialise. |
| int8    |          | |
| float32 | Duration | The duration to set in seconds. |

## START_TIMER_12

Start a timer. This gives a pause in the script e.g. giving time for animations to show.

| Type   | Name  | Description |
|--------|-------|-------------|
| string | Timer | The timer to start. |
| int8   |       | |
| string |       | |

## DISPLAY_TEXT_14

Display text.

In Ws2Explorer, the Text field is of type MessageString rather than string.
The MessageString API automatically separates the suffix from the displayed text.

### Version <= V2

| Type   | Name   | Description |
|--------|--------|-------------|
| int32  | TextId | Text ID unique to this script used for checking seen text? |
| string |        | Always "char"? |
| string | Text   | The text to display. This may contain a special nondisplayed suffix e.g. "%K%P". |

### Version >= V3

| Type   | Name   | Description |
|--------|--------|-------------|
| int32  | TextId | Text ID unique to this script used for checking seen text? |
| string |        | Always "char"? |
| string | Text   | The text to display. This may contain a special nondisplayed suffix e.g. "%K%P". |
| int8   |        | |

## DISPLAY_NAME_15

Set the currently displayed character name.

In Ws2Explorer, the Text field is of type NameString rather than string.
The NameString API automatically separates the prefix from the displayed text.

### Version <= V2

| Type   | Name   | Description |
|--------|--------|-------------|
| string | Text   | The name to display or an empty string for none. This may contain a special nondisplayed prefix e.g. "%LF". |

### Version >= V3

| Type   | Name   | Description |
|--------|--------|-------------|
| string | Text   | The name to display or an empty string for none. This may contain a special nondisplayed prefix e.g. "%LF". |
| int8   |        | |

## OPEN_TITLE_1A

Open the title screen and calls the Lua function "openTitle".

| Type   | Name   | Description |
|--------|--------|-------------|
| string |        | Always "openTitle"? |

## CALL_LUA_1C

Call a Lua function.

### Version <= V1

| Type   | Name      | Description |
|--------|-----------|-------------|
| string | Function  | The global Lua function to call. |
| string | StringArg | The string passed as the first argument to the function. |
| int16  | IntArg    | The integer passed as the second argument to the function. |

### Version >= V2

| Type   | Name      | Description |
|--------|-----------|-------------|
| string | Function  | The global Lua function to call. |
| string | StringArg | The string passed as the first argument to the function. |
| int16  | IntArg    | The integer passed as the second argument to the function. |
| int8   |           | |

## PLAY_MUSIC_1E

Play looped audio on a channel. Typically used for background music.

### Version <= V2

| Type    | Name     | Description |
|---------|----------|-------------|
| string  | Channel  | The channel to play the audio on. |
| string  | Filename | The audio file to play. |
| float32 |          | |
| float32 |          | |
| int16   |          | |
| int16   |          | |
| int8    |          | |

### Version >= V3

| Type    | Name     | Description |
|---------|----------|-------------|
| string  | Channel  | The channel to play the audio on. |
| string  | Filename | The audio file to play. |
| float32 |          | |
| float32 |          | |
| int16   |          | |
| int16   |          | |
| int8    |          | |
| float32 |          | |

## STOP_MUSIC_1F

Stop an audio channel.

| Type    | Name         | Description |
|---------|--------------|-------------|
| string  | Channel      | The channel to stop playing audio on or "*" for all channels. |
| float32 | FadeDuration | The time in seconds to fade to silence. |

## PLAY_SOUND_28

Play audio on a channel. Typically used for voice lines and sound effects.

### Version <= V2

| Type    | Name     | Description |
|---------|----------|-------------|
| string  | Channel  | The channel to play the audio on. |
| string  | Filename | The audio file to play. |
| float32 |          | |
| float32 |          | |
| int16   | Loop     | Nonzero if audio should loop? |
| int16   |          | |
| int8    |          | |
| int16   |          | |
| int16   |          | |
| int8    |          | |

### Version >= V3

| Type    | Name     | Description |
|---------|----------|-------------|
| string  | Channel  | The channel to play the audio on. |
| string  | Filename | The audio file to play. |
| float32 |          | |
| float32 |          | |
| int16   | Loop     | Nonzero if audio should loop? |
| int16   |          | |
| int8    |          | |
| int16   |          | |
| int16   |          | |
| float32 |          | |

## STOP_SOUND_29

Stop an audio channel.

| Type    | Name         | Description |
|---------|--------------|-------------|
| string  | Channel      | The channel to stop playing audio on. |
| float32 | FadeDuration | The time in second to fade to silence. |

## START_DISPLAY_TEXT_2E

Instruction found before [DISPLAY_TEXT_14](#display_text_14) in some versions.

This instruction has no parameters.

## SET_BACKGROUND_33

Show a PNG file. Typically used for backgrounds.

The properties of the image (position, size, colour etc.)
are usually configured shortly after.

| Type   | Name     | Description |
|--------|----------|-------------|
| string | Layer    | The layer to display the image on. |
| string | Filename | The image to load. |
| int8   |          | |
| int8   |          | |

## LOAD_PNA_34

Load a PNA file and associate it with a layer.

After this instruction has run, [DISPLAY_PNA](#display_pna_39)
needs to be run before anything is displayed.

| Type   | Name     | Description |
|--------|----------|-------------|
| string | Layer    | The layer that the PNA image will be displayed on. This parameter may be a named variable instead of an immediate value. |
| string | Filename | The PNA file to load. |
| int8   |          | |
| int8   |          | |

## PLAY_MOVIE_35

Play a movie.

Movies are WMV files with a .dat extension found in the top-level directory of the game.

| Type   | Name     | Description |
|--------|----------|-------------|
| string | Layer    | The layer to display the movie on. |
| string | Filename | The movie to load. |
| int8   |          | |
| int8   |          | |
| int8   |          | |

## CLEAR_LAYER_37

Clear a layer.

| Type   | Name  | Description |
|--------|-------|-------------|
| string | Layer | The layer to clear or "*" to clear all layers. |

## DISPLAY_PNA_39

Display images from a PNA file loaded with [LOAD_PNA_34](#load_pna_34).

| Type        | Name         | Description |
|-------------|--------------|-------------|
| string      | Layer        | The layer with a loaded PNA file. |
| int8        |              | |
| int8        |              | |
| int16 array | ImageIndices | The indices of the images in the PNA file to display. Larger indices are displayed behind. |

## ORDER_LAYERS_3F

Set the display order of the layers.

| Type         | Name   | Description |
|--------------|--------|-------------|
| string array | Layers | The layers in order from back to front. |

## GET_LAYER_PROPERTY_45

Get layer properties.

If Mode is 0x00:
- Set Variable1 to the layer X position.
- Set Variable2 to the layer Y position.

If Mode is 0x02:
- Set Variable1 to the layer X scale.
- Set Variable2 to the layer Y scale.

If Mode is 0x06:
- Set Variable1 to the layer red colour channel.
- Set Variable2 to the layer green colour channel.
- Set Variable3 to the layer blue colour channel.
- Set Variable4 to the layer alpha colour channel.
- Colours are floats between 0 and 1.


| Type    | Name      |
|---------|-----------|
| string  | Layer     |
| int16   | Mode      |
| float32 | Variable1 |
| float32 | Variable2 |
| float32 | Variable3 |
| float32 | Variable3 |

## SET_LAYER_PROPERTY_46

Set layer properties.

If Mode is 0x00:
- Set the layer X position to Variable1.
- Set the layer Y position to Variable2.

If Mode is 0x01:
- Set the layer rotation to Variable3 in degrees anti-clockwise.

If Mode is 0x02:
- Set the layer X scale to Variable1.
- Set the layer Y scale to Variable2.

If Mode is 0x06:
- Set the layer red colour channel to Variable1.
- Set the layer green colour channel to Variable2.
- Set the layer blue colour channel to Variable3.
- Set the layer alpha colour channel to Variable4.
- Colours are floats between 0 and 1.
- If SubMode is not 0xF0, the properties are set to immediate values rather than variables.

| Type    | Name      |
|---------|-----------|
| string  | Layer     |
| int16   | Mode      |
| int8    | SubMode   |
| float32 | Variable1 |
| float32 | Variable2 |
| float32 | Variable3 |
| float32 | Variable4 |

## EFFECT_47

Interpolate the properties of a layer over time.

If Mode is 0x00:
- Change the layer red colour channel by Variable1?
- Change the layer green colour channel by Variable2?
- Change the layer blue colour channel by Variable3?
- Change the layer alpha colour channel by Variable4.
- Colours are floats between 0 and 1.
- Following these rules, the RGB channels seem to exceed 1 sometimes.

If Mode is 0x01:
- Change the layer X position by Variable1.
- Change the layer Y position by Variable2.

If Mode is 0x02:
- Change the layer X scale by Variable1.
- Change the layer Y scale by Variable2.

The changes are applied gradually over Duration seconds.

| Type    | Name      |
|---------|-----------|
| string  | Layer     |
| string  |           |
| int16   | Mode      |
| int8    |           |
| int8    |           |
| float32 | Variable1 |
| float32 | Variable2 |
| float32 | Variable3 |
| float32 | Variable4 |
| float32 | Duration  |
| int16   |           |
| float32 |           |

## LOAD_ANIMATION_FRAME_51

Load a PNA image to be displayed as part of a 'slideshow' PNA movie.

The movie plays immediately.

The method to get the PNA movie duration is unknown.

| Type    | Name        | Description |
|---------|-------------|-------------|
| string  | Layer       | The layer to display the movie on. This parameter may be a named variable instead of an immediate value. |
| string  | FrameNumber | The sequence number of this frame. |
| int16   | ImageIndex  | The index of the image in the PNA file to load. |
| float32 | Time        | The time point of the frame as a normalised float between 0 and 1. |
| int8    |             | |

## SET_NAMED_VARIABLE_6E

Set a named variable.

Unlike normal variables, named variables are identified
by a string rather than a int16 and store strings instead of floats.

| Type   | Name     | Description |
|--------|----------|-------------|
| string | Variable | The named variable to set. |
| string | Value    | The string value to set the variable as. |

## FILE_END_FF

Instruction found near the end of the script.

This instruction has no parameters.

# Renderering

All layers have the following properties:
- XY position
- XY scale
- Rotation (degrees anti-clockwise)
- RGBA colour (values between 0 and 1)

The screen coordinate rect of the layer is calculated as:

| Rect Field | Value |
|------------|-------|
| Left       | `pos.x - img_size.x * (scale.x - 1) / 2` |
| Top        | `pos.y - img_size.y * (scale.y - 1) / 2` |
| Width      | `img_size.x * scale.x` |
| Height     | `img_size.y * scale.y` |

After which rotation is applied with the pivot at the centre of the rect.

The colour property is usually multiplied with the texture before being displayed.
However, there are many different shaders (compiled HLSL .fx files in `Effect.arc`) and very little is known about how they
work and when they apply.
