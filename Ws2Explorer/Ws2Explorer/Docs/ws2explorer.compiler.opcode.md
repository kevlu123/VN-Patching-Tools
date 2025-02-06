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

### **EPILOGUE**

```csharp
public static int EPILOGUE;
```

### **LABEL**

```csharp
public static int LABEL;
```

### **VERSION**

```csharp
public static int VERSION;
```

### **NULL_00**

```csharp
public static byte NULL_00;
```

### **CONDITIONAL_JUMP_01**

```csharp
public static byte CONDITIONAL_JUMP_01;
```

### **JUMP_02**

```csharp
public static byte JUMP_02;
```

### **CALL_FILE_04**

```csharp
public static byte CALL_FILE_04;
```

### **JUMP_06**

```csharp
public static byte JUMP_06;
```

### **JUMP_FILE_07**

```csharp
public static byte JUMP_FILE_07;
```

### **MODIFY_VARIABLE_09**

```csharp
public static byte MODIFY_VARIABLE_09;
```

### **SET_FLAG_0B**

```csharp
public static byte SET_FLAG_0B;
```

### **SHOW_CHOICE_0F**

```csharp
public static byte SHOW_CHOICE_0F;
```

### **SET_TIMER_11**

```csharp
public static byte SET_TIMER_11;
```

### **START_TIMER_12**

```csharp
public static byte START_TIMER_12;
```

### **DISPLAY_TEXT_14**

```csharp
public static byte DISPLAY_TEXT_14;
```

### **DISPLAY_NAME_15**

```csharp
public static byte DISPLAY_NAME_15;
```

### **OPEN_TITLE_1A**

```csharp
public static byte OPEN_TITLE_1A;
```

### **CALL_LUA_1C**

```csharp
public static byte CALL_LUA_1C;
```

### **PLAY_MUSIC_1E**

```csharp
public static byte PLAY_MUSIC_1E;
```

### **STOP_MUSIC_1F**

```csharp
public static byte STOP_MUSIC_1F;
```

### **MUSIC_UNKNOWN_20**

```csharp
public static byte MUSIC_UNKNOWN_20;
```

### **PLAY_SOUND_28**

```csharp
public static byte PLAY_SOUND_28;
```

### **STOP_SOUND_29**

```csharp
public static byte STOP_SOUND_29;
```

### **SOUND_UNKNOWN_2A**

```csharp
public static byte SOUND_UNKNOWN_2A;
```

### **START_DISPLAY_TEXT_2E**

```csharp
public static byte START_DISPLAY_TEXT_2E;
```

### **SET_BACKGROUND_33**

```csharp
public static byte SET_BACKGROUND_33;
```

### **LOAD_PNA_34**

```csharp
public static byte LOAD_PNA_34;
```

### **PLAY_MOVIE_35**

```csharp
public static byte PLAY_MOVIE_35;
```

### **CLEAR_LAYER_37**

```csharp
public static byte CLEAR_LAYER_37;
```

### **VARIABLE_UNKNOWN_38**

```csharp
public static byte VARIABLE_UNKNOWN_38;
```

### **DISPLAY_PNA_39**

```csharp
public static byte DISPLAY_PNA_39;
```

### **BACKGROUND_UNKNOWN_3A**

```csharp
public static byte BACKGROUND_UNKNOWN_3A;
```

### **ORDER_LAYERS_3F**

```csharp
public static byte ORDER_LAYERS_3F;
```

### **SET_MASK_40**

```csharp
public static byte SET_MASK_40;
```

### **BACKGROUND_UNKNOWN_41**

```csharp
public static byte BACKGROUND_UNKNOWN_41;
```

### **GET_LAYER_PROPERTY_45**

```csharp
public static byte GET_LAYER_PROPERTY_45;
```

### **SET_LAYER_PROPERTY_46**

```csharp
public static byte SET_LAYER_PROPERTY_46;
```

### **EFFECT_47**

```csharp
public static byte EFFECT_47;
```

### **EFFECT_48**

```csharp
public static byte EFFECT_48;
```

### **LOAD_ANIMATION_FRAME_51**

```csharp
public static byte LOAD_ANIMATION_FRAME_51;
```

### **VARIABLE_UNKNOWN_52**

```csharp
public static byte VARIABLE_UNKNOWN_52;
```

### **VARIABLE_UNKNOWN_53**

```csharp
public static byte VARIABLE_UNKNOWN_53;
```

### **START_RAIN_56**

```csharp
public static byte START_RAIN_56;
```

### **BACKGROUND_UNKNOWN_57**

```csharp
public static byte BACKGROUND_UNKNOWN_57;
```

### **EFFECT_58**

```csharp
public static byte EFFECT_58;
```

### **STOP_RAIN_5C**

```csharp
public static byte STOP_RAIN_5C;
```

### **SHOW_EFFECT_MASK_66**

```csharp
public static byte SHOW_EFFECT_MASK_66;
```

### **SET_NAMED_VARIABLE_6E**

```csharp
public static byte SET_NAMED_VARIABLE_6E;
```

### **VARIABLE_UNKNOWN_6F**

```csharp
public static byte VARIABLE_UNKNOWN_6F;
```

### **SCREEN_UNKNOWN_F0**

```csharp
public static byte SCREEN_UNKNOWN_F0;
```

### **FILE_END_FF**

```csharp
public static byte FILE_END_FF;
```
