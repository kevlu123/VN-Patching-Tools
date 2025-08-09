# Opcode

Namespace: Ws2Explorer.Compiler

List of opcodes and pseudo-opcodes.
 Negative values are pseudo-opcodes used to signal special meaning to the compiler.
 These pseudo-opcodes do not appear in the binary (but their arguments may).

```csharp
public enum Opcode
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [ValueType](https://docs.microsoft.com/en-us/dotnet/api/system.valuetype) → [Enum](https://docs.microsoft.com/en-us/dotnet/api/system.enum) → [Opcode](./ws2explorer.compiler.opcode.md)<br>
Implements [IComparable](https://docs.microsoft.com/en-us/dotnet/api/system.icomparable), [ISpanFormattable](https://docs.microsoft.com/en-us/dotnet/api/system.ispanformattable), [IFormattable](https://docs.microsoft.com/en-us/dotnet/api/system.iformattable), [IConvertible](https://docs.microsoft.com/en-us/dotnet/api/system.iconvertible)

## Fields

| Name | Value | Description |
| --- | --: | --- |
| VERSION | -1 |  |
| LABEL | -2 |  |
| WS2_NULL_00 | 0 |  |
| WS2_CONDITIONAL_JUMP_01 | 1 |  |
| WS2_JUMP_02 | 2 |  |
| WS2_CALL_FILE_04 | 4 |  |
| WS2_JUMP_06 | 6 |  |
| WS2_JUMP_FILE_07 | 7 |  |
| WS2_MODIFY_VARIABLE_09 | 9 |  |
| WS2_SET_FLAG_0B | 11 |  |
| WS2_SHOW_CHOICE_0F | 15 |  |
| WS2_SET_TIMER_11 | 17 |  |
| WS2_START_TIMER_12 | 18 |  |
| WS2_DISPLAY_TEXT_14 | 20 |  |
| WS2_DISPLAY_NAME_15 | 21 |  |
| WS2_OPEN_TITLE_1A | 26 |  |
| WS2_CALL_LUA_1C | 28 |  |
| WS2_PLAY_MUSIC_1E | 30 |  |
| WS2_STOP_MUSIC_1F | 31 |  |
| WS2_MUSIC_UNKNOWN_20 | 32 |  |
| WS2_PLAY_SOUND_28 | 40 |  |
| WS2_STOP_SOUND_29 | 41 |  |
| WS2_SOUND_UNKNOWN_2A | 42 |  |
| WS2_START_DISPLAY_TEXT_2E | 46 |  |
| WS2_SET_BACKGROUND_33 | 51 |  |
| WS2_LOAD_PNA_34 | 52 |  |
| WS2_PLAY_MOVIE_35 | 53 |  |
| WS2_CLEAR_LAYER_37 | 55 |  |
| WS2_VARIABLE_UNKNOWN_38 | 56 |  |
| WS2_DISPLAY_PNA_39 | 57 |  |
| WS2_BACKGROUND_UNKNOWN_3A | 58 |  |
| WS2_ORDER_LAYERS_3F | 63 |  |
| WS2_SET_MASK_40 | 64 |  |
| WS2_BACKGROUND_UNKNOWN_41 | 65 |  |
| WS2_GET_LAYER_PROPERTY_45 | 69 |  |
| WS2_SET_LAYER_PROPERTY_46 | 70 |  |
| WS2_EFFECT_47 | 71 |  |
| WS2_EFFECT_48 | 72 |  |
| WS2_LOAD_ANIMATION_FRAME_51 | 81 |  |
| WS2_VARIABLE_UNKNOWN_52 | 82 |  |
| WS2_VARIABLE_UNKNOWN_53 | 83 |  |
| WS2_START_RAIN_56 | 86 |  |
| WS2_BACKGROUND_UNKNOWN_57 | 87 |  |
| WS2_EFFECT_58 | 88 |  |
| WS2_STOP_RAIN_5C | 92 |  |
| WS2_SHOW_EFFECT_MASK_66 | 102 |  |
| WS2_SET_NAMED_VARIABLE_6E | 110 |  |
| WS2_VARIABLE_UNKNOWN_6F | 111 |  |
| WS2_SCREEN_UNKNOWN_F0 | 240 |  |
| WS2_FILE_END_FF | 255 |  |
| WSC_CONDITIONAL_01 | 1 |  |
| WSC_SHOW_CHOICE_02 | 2 |  |
| WSC_CALCULATE_03 | 3 |  |
| WSC_QUIT_04 | 4 |  |
| WSC_WAIT_TIMER_05 | 5 |  |
| WSC_JUMP_06 | 6 |  |
| WSC_JUMP_FILE_07 | 7 |  |
| WSC_SET_TEXT_SIZE_08 | 8 |  |
| WSC_CALL_FILE_09 | 9 |  |
| WSC_RETURN_0A | 10 |  |
| WSC_SET_TIMER_0B | 11 |  |
| WSC_CHECK_TIMER_0C | 12 |  |
| WSC_PLAY_MUSIC_21 | 33 |  |
| WSC_STOP_MUSIC_22 | 34 |  |
| WSC_PLAY_VOICE_23 | 35 |  |
| WSC_PLAY_SOUND_25 | 37 |  |
| WSC_STOP_SOUND_26 | 38 |  |
| WSC_DISPLAY_TEXT_41 | 65 |  |
| WSC_DISPLAY_TEXT_AND_NAME_42 | 66 |  |
| WSC_LOAD_ANIMATION_43 | 67 |  |
| WSC_ENABLE_ANIMATION_45 | 69 |  |
| WSC_LOAD_BACKGROUND_46 | 70 |  |
| WSC_SET_BACKGROUND_COLOUR_47 | 71 |  |
| WSC_LOAD_CHARACTER_GRAPHICS_48 | 72 |  |
| WSC_CLEAR_CENTRE_OVERLAY_49 | 73 |  |
| WSC_SET_TRANSITION_4A | 74 |  |
| WSC_ADD_ANIMATION_4B | 75 |  |
| WSC_PLAY_ANIMATION_4C | 76 |  |
| WSC_LOAD_EFFECT_4D | 77 |  |
| WSC_DISABLE_ANIMATION_4F | 79 |  |
| WSC_LOAD_TABLE_50 | 80 |  |
| WSC_SELECT_TABLE_ITEM_51 | 81 |  |
| WSC_DELAY_SOUND_52 | 82 |  |
| WSC_LOAD_TRANSPARENT_IMAGE_54 | 84 |  |
| WSC_PLAY_VIDEO_61 | 97 |  |
| WSC_SHOW_CHARACTER_INFO_64 | 100 |  |
| WSC_SET_BACKGROUND_SIZE_AND_POSITION_68 | 104 |  |
| WSC_CGWAIT_72 | 114 |  |
| WSC_ADD_OVERLAY_73 | 115 |  |
| WSC_CLEAR_OVERLAY_74 | 116 |  |
| WSC_DELAY_EXECUTION_82 | 130 |  |
| WSC_LOAD_GAME_83 | 131 |  |
| WSC_NEW_GAME_84 | 132 |  |
| WSC_CONFIGURATION_SCREEN_8B | 139 |  |
| WSC_CLEAR_RIGHT_OVERLAY_B8 | 184 |  |
| WSC_SCENE_TITLE_E0 | 224 |  |
| WSC_QUICK_LOAD_E2 | 226 |  |
| WSC_FILE_END_FF | 255 |  |
