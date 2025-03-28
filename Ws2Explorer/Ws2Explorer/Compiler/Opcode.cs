﻿namespace Ws2Explorer.Compiler;

/// <summary>
/// List of opcodes and pseudo-opcodes.
/// Negative values are pseudo-opcodes used to signal special meaning to the compiler.
/// These opcodes do not appear in the binary (but their arguments may).
/// </summary>
public static class Opcode
{
#pragma warning disable CS1591 // Missing XML comment for publicly visible type or member
    public const int EPILOGUE = -1;
    public const int LABEL = -2;
    public const int VERSION = -3;

    public const byte NULL_00 = 0;
    public const byte CONDITIONAL_JUMP_01 = 1;
    public const byte JUMP_02 = 2;
    public const byte CALL_FILE_04 = 4;
    public const byte JUMP_06 = 6;
    public const byte JUMP_FILE_07 = 7;
    public const byte MODIFY_VARIABLE_09 = 9;
    public const byte SET_FLAG_0B = 11;
    public const byte SHOW_CHOICE_0F = 15;
    public const byte SET_TIMER_11 = 17;
    public const byte START_TIMER_12 = 18;
    public const byte DISPLAY_TEXT_14 = 20;
    public const byte DISPLAY_NAME_15 = 21;
    public const byte OPEN_TITLE_1A = 26;
    public const byte CALL_LUA_1C = 28;
    public const byte PLAY_MUSIC_1E = 30;
    public const byte STOP_MUSIC_1F = 31;
    public const byte MUSIC_UNKNOWN_20 = 32;
    public const byte PLAY_SOUND_28 = 40;
    public const byte STOP_SOUND_29 = 41;
    public const byte SOUND_UNKNOWN_2A = 42;
    public const byte START_DISPLAY_TEXT_2E = 46;
    public const byte SET_BACKGROUND_33 = 51;
    public const byte LOAD_PNA_34 = 52;
    public const byte PLAY_MOVIE_35 = 53;
    public const byte CLEAR_LAYER_37 = 55;
    public const byte VARIABLE_UNKNOWN_38 = 56;
    public const byte DISPLAY_PNA_39 = 57;
    public const byte BACKGROUND_UNKNOWN_3A = 58;
    public const byte ORDER_LAYERS_3F = 63;
    public const byte SET_MASK_40 = 64;
    public const byte BACKGROUND_UNKNOWN_41 = 65;
    public const byte GET_LAYER_PROPERTY_45 = 69;
    public const byte SET_LAYER_PROPERTY_46 = 70;
    public const byte EFFECT_47 = 71;
    public const byte EFFECT_48 = 72;
    public const byte LOAD_ANIMATION_FRAME_51 = 81;
    public const byte VARIABLE_UNKNOWN_52 = 82;
    public const byte VARIABLE_UNKNOWN_53 = 83;
    public const byte START_RAIN_56 = 86;
    public const byte BACKGROUND_UNKNOWN_57 = 87;
    public const byte EFFECT_58 = 88;
    public const byte STOP_RAIN_5C = 92;
    public const byte SHOW_EFFECT_MASK_66 = 102;
    public const byte SET_NAMED_VARIABLE_6E = 110;
    public const byte VARIABLE_UNKNOWN_6F = 111;
    public const byte SCREEN_UNKNOWN_F0 = 240;
    public const byte FILE_END_FF = 255;
#pragma warning restore CS1591 // Missing XML comment for publicly visible type or member
}
