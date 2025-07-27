# Opcode

Namespace: Ws2Explorer.Compiler

List of opcodes and pseudo-opcodes.
 Negative values are pseudo-opcodes used to signal special meaning to the compiler.
 These opcodes do not appear in the binary (but their arguments may).

```csharp
public static class Opcode
```

Inheritance [Object](https://docs.microsoft.com/en-us/dotnet/api/system.object) → [Opcode](./ws2explorer.compiler.opcode.md)

## Fields

### **VERSION**

```csharp
public static int VERSION;
```

### **LABEL**

```csharp
public static int LABEL;
```

### **WS2_NULL_00**

```csharp
public static byte WS2_NULL_00;
```

### **WS2_CONDITIONAL_JUMP_01**

```csharp
public static byte WS2_CONDITIONAL_JUMP_01;
```

### **WS2_JUMP_02**

```csharp
public static byte WS2_JUMP_02;
```

### **WS2_CALL_FILE_04**

```csharp
public static byte WS2_CALL_FILE_04;
```

### **WS2_JUMP_06**

```csharp
public static byte WS2_JUMP_06;
```

### **WS2_JUMP_FILE_07**

```csharp
public static byte WS2_JUMP_FILE_07;
```

### **WS2_MODIFY_VARIABLE_09**

```csharp
public static byte WS2_MODIFY_VARIABLE_09;
```

### **WS2_SET_FLAG_0B**

```csharp
public static byte WS2_SET_FLAG_0B;
```

### **WS2_SHOW_CHOICE_0F**

```csharp
public static byte WS2_SHOW_CHOICE_0F;
```

### **WS2_SET_TIMER_11**

```csharp
public static byte WS2_SET_TIMER_11;
```

### **WS2_START_TIMER_12**

```csharp
public static byte WS2_START_TIMER_12;
```

### **WS2_DISPLAY_TEXT_14**

```csharp
public static byte WS2_DISPLAY_TEXT_14;
```

### **WS2_DISPLAY_NAME_15**

```csharp
public static byte WS2_DISPLAY_NAME_15;
```

### **WS2_OPEN_TITLE_1A**

```csharp
public static byte WS2_OPEN_TITLE_1A;
```

### **WS2_CALL_LUA_1C**

```csharp
public static byte WS2_CALL_LUA_1C;
```

### **WS2_PLAY_MUSIC_1E**

```csharp
public static byte WS2_PLAY_MUSIC_1E;
```

### **WS2_STOP_MUSIC_1F**

```csharp
public static byte WS2_STOP_MUSIC_1F;
```

### **WS2_MUSIC_UNKNOWN_20**

```csharp
public static byte WS2_MUSIC_UNKNOWN_20;
```

### **WS2_PLAY_SOUND_28**

```csharp
public static byte WS2_PLAY_SOUND_28;
```

### **WS2_STOP_SOUND_29**

```csharp
public static byte WS2_STOP_SOUND_29;
```

### **WS2_SOUND_UNKNOWN_2A**

```csharp
public static byte WS2_SOUND_UNKNOWN_2A;
```

### **WS2_START_DISPLAY_TEXT_2E**

```csharp
public static byte WS2_START_DISPLAY_TEXT_2E;
```

### **WS2_SET_BACKGROUND_33**

```csharp
public static byte WS2_SET_BACKGROUND_33;
```

### **WS2_LOAD_PNA_34**

```csharp
public static byte WS2_LOAD_PNA_34;
```

### **WS2_PLAY_MOVIE_35**

```csharp
public static byte WS2_PLAY_MOVIE_35;
```

### **WS2_CLEAR_LAYER_37**

```csharp
public static byte WS2_CLEAR_LAYER_37;
```

### **WS2_VARIABLE_UNKNOWN_38**

```csharp
public static byte WS2_VARIABLE_UNKNOWN_38;
```

### **WS2_DISPLAY_PNA_39**

```csharp
public static byte WS2_DISPLAY_PNA_39;
```

### **WS2_BACKGROUND_UNKNOWN_3A**

```csharp
public static byte WS2_BACKGROUND_UNKNOWN_3A;
```

### **WS2_ORDER_LAYERS_3F**

```csharp
public static byte WS2_ORDER_LAYERS_3F;
```

### **WS2_SET_MASK_40**

```csharp
public static byte WS2_SET_MASK_40;
```

### **WS2_BACKGROUND_UNKNOWN_41**

```csharp
public static byte WS2_BACKGROUND_UNKNOWN_41;
```

### **WS2_GET_LAYER_PROPERTY_45**

```csharp
public static byte WS2_GET_LAYER_PROPERTY_45;
```

### **WS2_SET_LAYER_PROPERTY_46**

```csharp
public static byte WS2_SET_LAYER_PROPERTY_46;
```

### **WS2_EFFECT_47**

```csharp
public static byte WS2_EFFECT_47;
```

### **WS2_EFFECT_48**

```csharp
public static byte WS2_EFFECT_48;
```

### **WS2_LOAD_ANIMATION_FRAME_51**

```csharp
public static byte WS2_LOAD_ANIMATION_FRAME_51;
```

### **WS2_VARIABLE_UNKNOWN_52**

```csharp
public static byte WS2_VARIABLE_UNKNOWN_52;
```

### **WS2_VARIABLE_UNKNOWN_53**

```csharp
public static byte WS2_VARIABLE_UNKNOWN_53;
```

### **WS2_START_RAIN_56**

```csharp
public static byte WS2_START_RAIN_56;
```

### **WS2_BACKGROUND_UNKNOWN_57**

```csharp
public static byte WS2_BACKGROUND_UNKNOWN_57;
```

### **WS2_EFFECT_58**

```csharp
public static byte WS2_EFFECT_58;
```

### **WS2_STOP_RAIN_5C**

```csharp
public static byte WS2_STOP_RAIN_5C;
```

### **WS2_SHOW_EFFECT_MASK_66**

```csharp
public static byte WS2_SHOW_EFFECT_MASK_66;
```

### **WS2_SET_NAMED_VARIABLE_6E**

```csharp
public static byte WS2_SET_NAMED_VARIABLE_6E;
```

### **WS2_VARIABLE_UNKNOWN_6F**

```csharp
public static byte WS2_VARIABLE_UNKNOWN_6F;
```

### **WS2_SCREEN_UNKNOWN_F0**

```csharp
public static byte WS2_SCREEN_UNKNOWN_F0;
```

### **WS2_FILE_END_FF**

```csharp
public static byte WS2_FILE_END_FF;
```

### **WSC_CONDITIONAL_01**

```csharp
public static byte WSC_CONDITIONAL_01;
```

### **WSC_SHOW_CHOICE_02**

```csharp
public static byte WSC_SHOW_CHOICE_02;
```

### **WSC_CALCULATE_03**

```csharp
public static byte WSC_CALCULATE_03;
```

### **WSC_QUIT_04**

```csharp
public static byte WSC_QUIT_04;
```

### **WSC_WAIT_TIMER_05**

```csharp
public static byte WSC_WAIT_TIMER_05;
```

### **WSC_JUMP_06**

```csharp
public static byte WSC_JUMP_06;
```

### **WSC_JUMP_FILE_07**

```csharp
public static byte WSC_JUMP_FILE_07;
```

### **WSC_SET_TEXT_SIZE_08**

```csharp
public static byte WSC_SET_TEXT_SIZE_08;
```

### **WSC_CALL_FILE_09**

```csharp
public static byte WSC_CALL_FILE_09;
```

### **WSC_RETURN_0A**

```csharp
public static byte WSC_RETURN_0A;
```

### **WSC_SET_TIMER_0B**

```csharp
public static byte WSC_SET_TIMER_0B;
```

### **WSC_CHECK_TIMER_0C**

```csharp
public static byte WSC_CHECK_TIMER_0C;
```

### **WSC_PLAY_MUSIC_21**

```csharp
public static byte WSC_PLAY_MUSIC_21;
```

### **WSC_STOP_MUSIC_22**

```csharp
public static byte WSC_STOP_MUSIC_22;
```

### **WSC_PLAY_VOICE_23**

```csharp
public static byte WSC_PLAY_VOICE_23;
```

### **WSC_PLAY_SOUND_25**

```csharp
public static byte WSC_PLAY_SOUND_25;
```

### **WSC_STOP_SOUND_26**

```csharp
public static byte WSC_STOP_SOUND_26;
```

### **WSC_DISPLAY_TEXT_41**

```csharp
public static byte WSC_DISPLAY_TEXT_41;
```

### **WSC_DISPLAY_TEXT_AND_NAME_42**

```csharp
public static byte WSC_DISPLAY_TEXT_AND_NAME_42;
```

### **WSC_LOAD_ANIMATION_43**

```csharp
public static byte WSC_LOAD_ANIMATION_43;
```

### **WSC_ENABLE_ANIMATION_45**

```csharp
public static byte WSC_ENABLE_ANIMATION_45;
```

### **WSC_LOAD_BACKGROUND_46**

```csharp
public static byte WSC_LOAD_BACKGROUND_46;
```

### **WSC_SET_BACKGROUND_COLOUR_47**

```csharp
public static byte WSC_SET_BACKGROUND_COLOUR_47;
```

### **WSC_LOAD_CHARACTER_GRAPHICS_48**

```csharp
public static byte WSC_LOAD_CHARACTER_GRAPHICS_48;
```

### **WSC_CLEAR_CENTRE_OVERLAY_49**

```csharp
public static byte WSC_CLEAR_CENTRE_OVERLAY_49;
```

### **WSC_SET_TRANSITION_4A**

```csharp
public static byte WSC_SET_TRANSITION_4A;
```

### **WSC_ADD_ANIMATION_4B**

```csharp
public static byte WSC_ADD_ANIMATION_4B;
```

### **WSC_PLAY_ANIMATION_4C**

```csharp
public static byte WSC_PLAY_ANIMATION_4C;
```

### **WSC_LOAD_EFFECT_4D**

```csharp
public static byte WSC_LOAD_EFFECT_4D;
```

### **WSC_DISABLE_ANIMATION_4F**

```csharp
public static byte WSC_DISABLE_ANIMATION_4F;
```

### **WSC_LOAD_TABLE_50**

```csharp
public static byte WSC_LOAD_TABLE_50;
```

### **WSC_SELECT_TABLE_ITEM_51**

```csharp
public static byte WSC_SELECT_TABLE_ITEM_51;
```

### **WSC_DELAY_SOUND_52**

```csharp
public static byte WSC_DELAY_SOUND_52;
```

### **WSC_LOAD_TRANSPARENT_IMAGE_54**

```csharp
public static byte WSC_LOAD_TRANSPARENT_IMAGE_54;
```

### **WSC_PLAY_VIDEO_61**

```csharp
public static byte WSC_PLAY_VIDEO_61;
```

### **WSC_SHOW_CHARACTER_INFO_64**

```csharp
public static byte WSC_SHOW_CHARACTER_INFO_64;
```

### **WSC_SET_BACKGROUND_SIZE_AND_POSITION_68**

```csharp
public static byte WSC_SET_BACKGROUND_SIZE_AND_POSITION_68;
```

### **WSC_CGWAIT_72**

```csharp
public static byte WSC_CGWAIT_72;
```

### **WSC_ADD_OVERLAY_73**

```csharp
public static byte WSC_ADD_OVERLAY_73;
```

### **WSC_CLEAR_OVERLAY_74**

```csharp
public static byte WSC_CLEAR_OVERLAY_74;
```

### **WSC_DELAY_EXECUTION_82**

```csharp
public static byte WSC_DELAY_EXECUTION_82;
```

### **WSC_LOAD_GAME_83**

```csharp
public static byte WSC_LOAD_GAME_83;
```

### **WSC_NEW_GAME_84**

```csharp
public static byte WSC_NEW_GAME_84;
```

### **WSC_CONFIGURATION_SCREEN_8B**

```csharp
public static byte WSC_CONFIGURATION_SCREEN_8B;
```

### **WSC_CLEAR_RIGHT_OVERLAY_B8**

```csharp
public static byte WSC_CLEAR_RIGHT_OVERLAY_B8;
```

### **WSC_SCENE_TITLE_E0**

```csharp
public static byte WSC_SCENE_TITLE_E0;
```

### **WSC_QUICK_LOAD_E2**

```csharp
public static byte WSC_QUICK_LOAD_E2;
```

### **WSC_FILE_END_FF**

```csharp
public static byte WSC_FILE_END_FF;
```
