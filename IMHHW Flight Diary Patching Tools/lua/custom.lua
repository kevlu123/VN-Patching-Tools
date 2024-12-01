-----------------------------------------
--                                     --
--          Fix choice buttons         --
--                                     --
-----------------------------------------

-- NOTE: Define some new global variables
choice_buttons = {}
hovering_choice_button_index = nil

oldMenuNew = Menu.new
function Menu.new(a)
  local r = oldMenuNew(a)
  
  function r.MenuMouseMove(r0_21, r1_21, r2_21, r3_21, r4_21, r5_21, r6_21)
    -- NOTE: Drive choice button events
    local cursor = cclass.lua_AutoCursor:new()
    local x, y = cursor:GetCursorPos(0, 0)
    cursor:delete()
    hovering_choice_button_index = nil
    for i, choice_button in ipairs(choice_buttons) do
      choice_button:bt_change(nil, 9999, x, y, i - 1)
    end
    
    -- line: [226, 235] id: 21
    if r6_21 == true then
      return 
    end
    if r0_21:GetMenuMouseEnable() then
      r0_21.MenuButton:mouseMove(r2_21, r3_21, r4_21, r5_21)
    end
  end
  
  
  function r.MenuLButtonUp(r0_23, r1_23, r2_23, r3_23, r4_23, r5_23, r6_23)
    -- NOTE: Trigger choice if clicked and was hovering
    if hovering_choice_button_index then
      cfunc.LegacyGame__lua_SelectItem(hovering_choice_button_index)
      g_MenuMsgWin:closeSelect(hovering_choice_button_index)
      hovering_choice_button_index = nil
    end
    
    -- line: [256, 269] id: 23
    local r7_23 = 0
    r0_23:MenuButtonJobPosRepeat(r7_23, "LU", r1_23, r2_23, r3_23, r4_23, r5_23)
    if r6_23 == true then
      return r7_23
    end
    if r0_23:GetMenuMouseEnable() then
      r7_23 = r0_23.MenuButton:mouseLup(r2_23, r3_23, r4_23, r5_23, r6_23)
    end
    r0_23:MenuButtonJobFocus(r7_23, "LU", r1_23, r2_23, r3_23, r4_23, r5_23)
    return r7_23
  end
  
  return r
end

oldButtonNew = Button.new
function Button.new(r0_1)
    local r = oldButtonNew(r0_1)
    function r.ButtonCreate(r0_2, r1_2, r2_2, r3_2, r4_2, r5_2, r6_2, r7_2, r8_2, r9_2, r10_2, r11_2, r12_2, r13_2)
      -- line: [26, 28] id: 2
      local b = r0_2:_ButtonCreate(-1, r1_2, r2_2, r3_2, r4_2, r5_2, r6_2, r7_2, r8_2, r9_2, r10_2, r11_2, r12_2, r13_2)
      function b.bt_change(r0_16, r1_16, r2_16, r3_16, r4_16, choice_button_index) -- NOTE: Add parameter choice_button_index
        -- line: [334, 429] id: 16
        local r5_16 = cclass.lua_Layers:create()
        local r6_16 = 0
        local r7_16 = r0_16.priority
        if r0_16.active == 0 or r0_16.active == 4 then
          local r8_16 = {
            def = false,
            on = false,
          }
          if r0_16.EVENT_TYPE == 0 then
            if r0_16.SubLayer.hit.no ~= -1 and r0_16.SubLayer.hit.no == r2_16 then
              
              r6_16 = 1
              if r0_16.focusflag == false then
                r0_16:bt_PlayAnim()
              end
              r0_16.focusflag = true
              
            else
              r0_16.focusflag = false
              r0_16:bt_StopAnim()
            end
          elseif r0_16.DRAW_POS.x <= r3_16 and r0_16.DRAW_POS.y <= r4_16 and r3_16 < r0_16.DRAW_POS.x + r0_16.EVENT_RECT.w and r4_16 < r0_16.DRAW_POS.y + r0_16.EVENT_RECT.h then
            r6_16 = 1
            if r0_16.focusflag == false then
              r0_16:bt_PlayAnim()
            end
            r0_16.focusflag = true
          else
            r0_16.focusflag = false
            r0_16:bt_StopAnim()
          end
          if r0_16.active == 0 then
            if r0_16.focusflag == true then
              if r0_16.SubLayer.def.no ~= -1 then
                r8_16.def = false
              end
              if r0_16.SubLayer.on.no ~= -1 then
                r8_16.on = true
              else
                r8_16.def = true
              end
              r0_16:bt_OnCursorEvent(r1_16, r2_16, r3_16, r4_16)
              
              -- NOTE: Save hovered button
              hovering_choice_button_index = choice_button_index
              
            else
              if r0_16.SubLayer.def.no ~= -1 then
                r8_16.def = true
              end
              if r0_16.SubLayer.on.no ~= -1 then
                r8_16.on = false
              else
                r8_16.def = true
              end
              r0_16:bt_OffCursorEvent(r1_16, r2_16, r3_16, r4_16)
            end
            if r8_16.def == true then
              r0_16:bt_SetEnableSubLayer(r0_16.SubLayer.on, r8_16.on)
              r0_16:bt_SetEnableSubLayer(r0_16.SubLayer.def, r8_16.def)
            else
              r0_16:bt_SetEnableSubLayer(r0_16.SubLayer.def, r8_16.def)
              r0_16:bt_SetEnableSubLayer(r0_16.SubLayer.on, r8_16.on)
            end
          end
        end
        return r6_16, r7_16
      end
      return b
    end
    return r
end

function initSelect(r0_155)
  -- line: [5120, 5133] id: 155
  function g_MenuMsgWin.MakeSelectBut(r0_51)
    -- line: [2046, 2099] id: 51
    r0_51.ActiveSelect = {}
    if r0_51.SelectType == true then
      local r1_51 = getLocalSelectKey(0)
      for r5_51 = 1, 6, 1 do
        local r6_51 = 1 + r5_51 - 1
        local r8_51 = getLocalSelectKey(r5_51)
        r0_51:MenuButtonSet(r0_51.SelectButtonData, r8_51, 1, r1_51, r6_51, r6_51, 9 + r5_51 - 1, -1, -1, r5_51 + 100, 0, 0)
        r0_51.ActiveSelect[r8_51] = 0
      end
    else
      -- NOTE: Reset choice button list
      choice_buttons = {}
      
      for r4_51 = 1, r0_51.SelectCount, 1 do
        local r5_51 = getLocalSelectKey(r4_51)
        r0_51:MenuButtonSet(r0_51.SelectButtonData, r5_51, 1, r5_51, 1, 1, 0, -1, 2, r4_51 + 100, 0, 0)

        -- Note: Save choice buttons in a global variable
        choice_buttons[#choice_buttons + 1] = r0_51.SelectButtonData[r5_51]

        r0_51.ActiveSelect[r5_51] = 0
        local r6_51 = cclass.lua_Layers:create()
      end
    end
    r0_51.MenuButton:InitList()
    r0_51.MenuButton:SetList("SelectButtonData", r0_51.SelectButtonData)
    r0_51.MenuButton:InitButton()
    if r0_51.SelectType == true then
      r0_51:MapActive(0)
    end
    if r0_51.MenuButtonData ~= nil then
      r0_51.MenuButton:SetList("MenuButtonData", r0_51.MenuButtonData)
    end
    if r0_51.TipsButton ~= nil then
      r0_51.MenuButton:SetList("TipsButton", r0_51.TipsButton)
    end
  end
  g_MenuMsgWin.SelectCount = r0_155
  g_MenuMsgWin:MenuMakeSelectLayer()
  g_MenuMsgWin:MakeSelectBut()
  g_MenuMsgWin:SetSelectButPos()
  g_MenuMsgWin:startSelectMenu()
end

-- NOTE: Reset choice button list when choice menu closed
oldInitSystemScreen = initSystemScreen
function initSystemScreen()
  local r = oldInitSystemScreen()
  local oldCloseSelect = g_MenuMsgWin.closeSelect
  function g_MenuMsgWin.closeSelect(r0_53, r1_53)
    choice_buttons = {}
    oldCloseSelect(r0_53, r1_53)
  end
  return r
end

-----------------------------------------
--                                     --
--           Expand gallery            --
--                                     --
-----------------------------------------

oldGalleryCgMenu = GalleryCgMenu
GalleryCgMenu = function(r0_21)
  oldGalleryCgMenu(r0_21)
  
  r0_21.CgMenu.PageMax = 9 -- NOTE: Changed from 7 to 9

  -- NOTE: Reimplemented GetCgFlag
  function r0_21.GetCgFlag(self, page, index)
    local NEW = 62
    local jp_thumbnail_to_en_thumbnail = {
      -- AFT/BEF
      [0] = 0,
      [1] = 3,
      [2] = 4,
      [3] = 1,
      [4] = 5,
      [5] = 6,
      [6] = 8,
      [7] = 9,
      [8] = 10,
      [9] = NEW + 0,
      [10] = NEW + 1,
      [11] = NEW + 2,
      [12] = NEW + 3,
      [13] = NEW + 4,
      [14] = 11,
      [15] = 12,
      [16] = 14,
      [17] = 16,
      [18] = 17,
      [19] = NEW + 5,
      [20] = NEW + 6,
      [21] = NEW + 7,
      [22] = NEW + 8,

      -- HOT
      [23] = 18,
      [24] = 20,
      [25] = 19,
      [26] = 21,
      [27] = 23,
      [28] = 24,
      [29] = 22,
      [30] = NEW + 9,
      [31] = NEW + 10,
      [32] = NEW + 11,

      -- KAN
      [33] = 25,
      [34] = 26,
      [35] = 27,
      [36] = 33,
      [37] = 34,
      [38] = NEW + 12,
      [39] = NEW + 13,
      [40] = NEW + 14,
      [41] = NEW + 15,

      -- HUS
      [42] = 36,
      [43] = NEW + 16,
      [44] = NEW + 17,

      -- AGS
      [45] = NEW + 18,
      [46] = NEW + 19,
      [47] = NEW + 20,

      -- NOV
      [48] = 37,
      [49] = 38,
      [50] = 39,
      [51] = 40,
      [52] = 41,
      [53] = 42,
      [54] = 43,

      -- Misc?
      [55] = NEW + 21,
      [56] = 44,
      [57] = 45,
      [58] = 46,

      -- SD
      [59] = 47,
      [60] = 48,
      [61] = 49,
      [62] = 50,
      [63] = 51,
      [64] = 52,
      [65] = 53,
      [66] = 54,
      [67] = 55,
      [68] = 56,
      [69] = 57,
      [70] = 58,
      [71] = 59,
      [72] = 61,
      [73] = 60,
    }

    local en_flags = {
      AFT_01 = 1080,
      AFT_02 = 1081,
      AFT_03 = 1082,
      AFT_07 = 1083,
      AFT_08 = 1084,
      AFT_11 = 1085,
      AFT_12 = 1086,
      AFT_13 = 1087,
      AFT_14 = 1088,
      BEF_01 = 1089,
      BEF_02 = 1090,
      BEF_03 = 1091,
      BEF_05 = 1092,
      BEF_08 = 1093,
      BEF_09 = 1094,
      HOT_01 = 1095,
      HOT_02 = 1096,
      HOT_03 = 1097,
      HOT_04 = 1098,
      HOT_06 = 1099,
      HOT_09 = 1100,
      HOT_10 = 1101,
      KAN_01 = 1102,
      KAN_02 = 1103,
      KAN_03 = 1104,
      KAN_04 = 1105,
      KAN_09 = 1106,
      HUS_03 = 1107,
      NOV_01 = 1108,
      NOV_02 = 1109,
      COM_01 = 1110,
      KOT_00 = 1111,
      KOT_01 = 1112,
      KOT_11 = 1113,
      KOT_21 = 1114,
      AMA_01 = 1115,
      AMA_08 = 1116,
      HUT_22 = 1117,
      CSEV_14 = 1118,
      CSEV_15 = 1119,
      CSEV_16 = 1120,
      CSEV_17 = 1121,
      CSEV_18 = 1122,
      CSEV_19 = 1123,
      CSEV_20 = 1124,
      CSEV_21 = 1125,
      CSEV_29 = 1126,
      FDSDEV01 = 1127,
      FDSDEV02 = 1128,
      FDSDEV03 = 1129,
      FDSDEV04 = 1130,
      FDSDEV05 = 1131,
      FDSDEV06 = 1132,
      FDSDEV07 = 1133,
      FDSDEV08 = 1134,
      FDSDEV09 = 1135,
      FDSDEV10 = 1136,
      FDSDEV11 = 1137,
      FDSDEV12 = 1138,
      FDSDEV13 = 1139,
      FDSDEV14 = 1140,
      FDSDEV15 = 1141,
    }
    local en_thumbnail_to_en_flag = {
      [0] = en_flags.AFT_01,
      [1] = en_flags.AFT_03,
      [2] = en_flags.CSEV_14,
      [3] = en_flags.AFT_13,
      [4] = en_flags.AFT_02,
      [5] = en_flags.AFT_07,
      [6] = en_flags.AFT_08,
      [7] = en_flags.CSEV_15,
      [8] = en_flags.AFT_11,
      [9] = en_flags.AFT_12,
      [10] = en_flags.AFT_14,
      [11] = en_flags.BEF_01,
      [12] = en_flags.BEF_02,
      [13] = en_flags.BEF_03,
      [14] = en_flags.BEF_05,
      [15] = en_flags.CSEV_16,
      [16] = en_flags.BEF_08,
      [17] = en_flags.BEF_09,
      [18] = en_flags.HOT_01,
      [19] = en_flags.HOT_10,
      [20] = en_flags.HOT_02,
      [21] = en_flags.HOT_03,
      [22] = en_flags.HOT_04,
      [23] = en_flags.HOT_06,
      [24] = en_flags.HOT_09,
      [25] = en_flags.KAN_01,
      [26] = en_flags.KAN_02,
      [27] = en_flags.KAN_04,
      [28] = en_flags.CSEV_17,
      [29] = en_flags.CSEV_18,
      [30] = en_flags.CSEV_19,
      [31] = en_flags.CSEV_20,
      [32] = en_flags.CSEV_21,
      [33] = en_flags.KAN_03,
      [34] = en_flags.KAN_09,
      [35] = en_flags.CSEV_29,
      [36] = en_flags.HUS_03,
      [37] = en_flags.NOV_01,
      [38] = en_flags.NOV_02,
      [39] = en_flags.COM_01,
      [40] = en_flags.KOT_00,
      [41] = en_flags.KOT_01,
      [42] = en_flags.KOT_11,
      [43] = en_flags.KOT_21,
      [44] = en_flags.AMA_01,
      [45] = en_flags.AMA_08,
      [46] = en_flags.HUT_22,
      [47] = en_flags.FDSDEV01,
      [48] = en_flags.FDSDEV02,
      [49] = en_flags.FDSDEV03,
      [50] = en_flags.FDSDEV04,
      [51] = en_flags.FDSDEV05,
      [52] = en_flags.FDSDEV06,
      [53] = en_flags.FDSDEV07,
      [54] = en_flags.FDSDEV08,
      [55] = en_flags.FDSDEV09,
      [56] = en_flags.FDSDEV10,
      [57] = en_flags.FDSDEV11,
      [58] = en_flags.FDSDEV12,
      [59] = en_flags.FDSDEV13,
      [60] = en_flags.FDSDEV15,
      [61] = en_flags.FDSDEV14,
    }

    jp_thumbnail = (page - 1) * self.CgMenu.ThAllMax + index - 1
    if jp_thumbnail == 74 then
      return 1 -- Show EN-only CG unconditionaly
    elseif jp_thumbnail > 74 then
      return -1 -- Out of range
    end

    en_thumbnail = jp_thumbnail_to_en_thumbnail[jp_thumbnail]
    flag = en_thumbnail_to_en_flag[en_thumbnail] or (en_thumbnail + 1080)

    if cfunc.LegacyGame__lua_GetFlag(flag) then
      return 1 -- Unlocked
    else
      return 0 -- Locked
    end
  end
  --function r0_21.GetCgFlag(r0_33, r1_33, r2_33)
  --  -- line: [1429, 1556] id: 33
  --  local r3_33 = {
  --    AFT_01 = 1080,
  --    AFT_02 = 1081,
  --    AFT_03 = 1082,
  --    AFT_07 = 1083,
  --    AFT_08 = 1084,
  --    AFT_11 = 1085,
  --    AFT_12 = 1086,
  --    AFT_13 = 1087,
  --    AFT_14 = 1088,
  --    BEF_01 = 1089,
  --    BEF_02 = 1090,
  --    BEF_03 = 1091,
  --    BEF_05 = 1092,
  --    BEF_08 = 1093,
  --    BEF_09 = 1094,
  --    HOT_01 = 1095,
  --    HOT_02 = 1096,
  --    HOT_03 = 1097,
  --    HOT_04 = 1098,
  --    HOT_06 = 1099,
  --    HOT_09 = 1100,
  --    HOT_10 = 1101,
  --    KAN_01 = 1102,
  --    KAN_02 = 1103,
  --    KAN_03 = 1104,
  --    KAN_04 = 1105,
  --    KAN_09 = 1106,
  --    HUS_03 = 1107,
  --    NOV_01 = 1108,
  --    NOV_02 = 1109,
  --    COM_01 = 1110,
  --    KOT_00 = 1111,
  --    KOT_01 = 1112,
  --    KOT_11 = 1113,
  --    KOT_21 = 1114,
  --    AMA_01 = 1115,
  --    AMA_08 = 1116,
  --    HUT_22 = 1117,
  --    CSEV_14 = 1118,
  --    CSEV_15 = 1119,
  --    CSEV_16 = 1120,
  --    CSEV_17 = 1121,
  --    CSEV_18 = 1122,
  --    CSEV_19 = 1123,
  --    CSEV_20 = 1124,
  --    CSEV_21 = 1125,
  --    CSEV_29 = 1126,
  --    FDSDEV01 = 1127,
  --    FDSDEV02 = 1128,
  --    FDSDEV03 = 1129,
  --    FDSDEV04 = 1130,
  --    FDSDEV05 = 1131,
  --    FDSDEV06 = 1132,
  --    FDSDEV07 = 1133,
  --    FDSDEV08 = 1134,
  --    FDSDEV09 = 1135,
  --    FDSDEV10 = 1136,
  --    FDSDEV11 = 1137,
  --    FDSDEV12 = 1138,
  --    FDSDEV13 = 1139,
  --    FDSDEV14 = 1140,
  --    FDSDEV15 = 1141,
  --  }
  --  local r6_33 = ({
  --    r3_33.AFT_01,
  --    r3_33.AFT_03,
  --    r3_33.CSEV_14,
  --    r3_33.AFT_13,
  --    r3_33.AFT_02,
  --    r3_33.AFT_07,
  --    r3_33.AFT_08,
  --    r3_33.CSEV_15,
  --    r3_33.AFT_11,
  --    r3_33.AFT_12,
  --    r3_33.AFT_14,
  --    r3_33.BEF_01,
  --    r3_33.BEF_02,
  --    r3_33.BEF_03,
  --    r3_33.BEF_05,
  --    r3_33.CSEV_16,
  --    r3_33.BEF_08,
  --    r3_33.BEF_09,
  --    r3_33.HOT_01,
  --    r3_33.HOT_10,
  --    r3_33.HOT_02,
  --    r3_33.HOT_03,
  --    r3_33.HOT_04,
  --    r3_33.HOT_06,
  --    r3_33.HOT_09,
  --    r3_33.KAN_01,
  --    r3_33.KAN_02,
  --    r3_33.KAN_04,
  --    r3_33.CSEV_17,
  --    r3_33.CSEV_18,
  --    r3_33.CSEV_19,
  --    r3_33.CSEV_20,
  --    r3_33.CSEV_21,
  --    r3_33.KAN_03,
  --    r3_33.KAN_09,
  --    r3_33.CSEV_29,
  --    r3_33.HUS_03,
  --    r3_33.NOV_01,
  --    r3_33.NOV_02,
  --    r3_33.COM_01,
  --    r3_33.KOT_00,
  --    r3_33.KOT_01,
  --    r3_33.KOT_11,
  --    r3_33.KOT_21,
  --    r3_33.AMA_01,
  --    r3_33.AMA_08,
  --    r3_33.HUT_22,
  --    r3_33.FDSDEV01,
  --    r3_33.FDSDEV02,
  --    r3_33.FDSDEV03,
  --    r3_33.FDSDEV04,
  --    r3_33.FDSDEV05,
  --    r3_33.FDSDEV06,
  --    r3_33.FDSDEV07,
  --    r3_33.FDSDEV08,
  --    r3_33.FDSDEV09,
  --    r3_33.FDSDEV10,
  --    r3_33.FDSDEV11,
  --    r3_33.FDSDEV12,
  --    r3_33.FDSDEV13,
  --    r3_33.FDSDEV15,
  --    r3_33.FDSDEV14,
  --    nil,
  --    nil
  --  })[(r1_33 - 1) * r0_33.CgMenu.ThAllMax + r2_33]
  --  if r6_33 == nil then
  --    return -1
  --  end
  --  if cfunc.LegacyGame__lua_GetFlag(r6_33) then
  --    return 1
  --  else
  --    return 0
  --  end
  --end
end

-----------------------------------------
--                                     --
--       Add extra route button        --
--                                     --
-----------------------------------------

openStory = function(r0_262, r1_262)
  -- line: [8580, 8931] id: 262
  g_Menu.StoryMenu.ptr = Menu.new("StoryMenu")
  g_Menu.StoryMenu.ptr.MenuEffect = function(r0_263)
    -- line: [8586, 8595] id: 263
    local r1_263 = false
    r1_263 = r0_263:MenuEffectTransJob()
    if r0_263.MenuInf.effect == true and r1_263 == false then
      r0_263:MenuEffectEndJob()
      r0_263.MenuInf.effect = false
    end
    return r1_263
  end
  g_Menu.StoryMenu.ptr.MenuEffectEndJob = function(r0_264)
    -- line: [8598, 8625] id: 264
    local r1_264 = cclass.lua_Layers:create()
    if r0_264.MenuInf.enabled == true then
      local r2_264 = 0
      local r3_264 = 0
      local r4_264 = cclass.lua_AutoCursor:new()
      r2_264, r3_264 = r4_264:GetCursorPos(r2_264, r3_264)
      r4_264:delete()
      r0_264.MenuButton:changeButton(r0_264.MenuInf.SetName, r1_264:getCursorPos(r0_264.MenuInf.SetName, r2_264, r3_264, 0) - 1, r2_264, r3_264)
    else
      if g_menuExecute == false then
        r1_264:removeSnap("system")
      end
      r1_264:remove(r0_264.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_264.MenuInf.ButtonLayer = ""
      r0_264.MenuInf.ButtonPna = ""
    end
  end
  g_Menu.StoryMenu.ptr.MenuEffectTransJob = function(r0_265)
    -- line: [8628, 8637] id: 265
    local r1_265 = cclass.lua_Layers:create()
    if r0_265.MenuInf.enabled == true then
      return r1_265:isEffect(r0_265.MenuInf.SetName, "StoryDisp")
    else
      return r1_265:isTransition(r0_265.MenuInf.SetName)
    end
  end
  g_Menu.StoryMenu.ptr.MenuButtonJob = function(r0_266, r1_266, r2_266)
    -- line: [8640, 8679] id: 266
    local r3_266 = cclass.lua_Layers:create()
    if r1_266 ~= 0 and r2_266 == "LD" then
      if r1_266 == 99 then
        cfunc.LegacyGame__lua_SetVariable(98, 0)
        r0_266:MenuEffectToMenu(500)
        r0_266.MenuInf.enabled = false
        r0_266.MenuInf.effect = true
      else
        r3_266:removeSnap("system")
        cfunc.LegacyGame__lua_SetVariable(98, r1_266)
        g_menuExecute = false
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_266:MenuEffectEnd(0)
        r0_266.MenuInf.enabled = false
        r0_266.MenuInf.effect = true
        local r4_266 = cclass.lua_Sounds:new()
        r4_266:BgmStop("systembgm", 500)
        r4_266:delete()
      end
    end
    if r2_266 == "RU" then
      cfunc.LegacyGame__lua_SetVariable(98, 0)
      r0_266:MenuEffectToMenu(500)
      r0_266.MenuInf.enabled = false
      r0_266.MenuInf.effect = true
    end
    if r2_266 == "LD" then
      r0_266:CancelMenuEffect()
    end
  end
  g_Menu.StoryMenu.ptr.MenuEffectStart = function(r0_267, r1_267, r2_267)
    -- line: [8681, 8770] id: 267
    local r3_267 = cclass.lua_Layers:create()
    local r4_267 = cclass.lua_MeasureTime:new()
    local r5_267 = getEffectRate()
    local r6_267 = r2_267 * r4_267:diff()
    r4_267:delete()
    r0_267.EffectButtonKeyList = {}
    local r7_267 = 0
    local function r8_267(r0_268, r1_268, r2_268)
      -- line: [8690, 8697] id: 268
      local r3_268 = {
        key = r0_268,
        x = r1_268,
        y = r2_268,
      }
      r7_267 = r7_267 + 1
      r0_267.EffectButtonKeyList[r7_267] = r3_268
    end
    for r12_267 = 19, 25, 1 do -- NOTE: Changed 20 to 19
      r3_267:setSubLayerVisible("StoryMenu", "StoryBace", r12_267, 0)
    end
    local r9_267 = r6_267
    local r10_267 = r1_267
    r3_267:setSubLayerParam("StoryMenu", "StoryBace", 38, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_267:setSubLayerParam("StoryMenu", "StoryBace", 39, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_267:setSubLayerParam("StoryMenu", "StoryBace", 40, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_267:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 38, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, r10_267 * r5_267, 0, r9_267 * r5_267)
    r3_267:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 39, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, r10_267 * r5_267, 0, r9_267 * r5_267)
    r3_267:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 40, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, r10_267 * r5_267, 0, r9_267 * r5_267)
    r3_267:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 38, 0)
    r3_267:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 39, 0)
    r3_267:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 40, 0)
    for r14_267 = 28, 36, 1 do
      r3_267:setSubLayerVisible("StoryMenu", "StoryBace", r14_267, 1)
      r3_267:setSubLayerParam("StoryMenu", "StoryBace", r14_267, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r3_267:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r14_267, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, r10_267 * r5_267, 0, r9_267 * r5_267)
      r3_267:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r14_267, 0)
    end
    r9_267 = r9_267 + 100
    local r11_267 = 0
    local r12_267 = 0
    local r13_267 = 0
    local r14_267 = 0
    local r15_267 = -1
    local r16_267 = 0
    local r17_267 = r9_267
    local r18_267 = r1_267
    for r22_267 = 1, 7, 1 do -- NOTE: Changed 6 to 7
      r15_267 = r0_267.MenuButtonData["SC" .. tostring(r22_267)]:bt_getNowKey()
      r11_267, r12_267, r13_267, r14_267 = r3_267:getSubLayerParam("StoryMenu", "StoryBace", r15_267, LUA_PARAM_POS, r11_267, r12_267, r13_267, r14_267)
      r3_267:setSubLayerParam("StoryMenu", "StoryBace", r15_267, LUA_PARAM_POS, r11_267 - 100, r12_267 - 100, 0, 0)
      r3_267:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_267, LUA_EFFECT_POS, 100, 100, 0, 0, 2, r18_267 * r5_267, 0, r17_267 * r5_267)
      r3_267:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_267, 0)
      r8_267(r15_267, r11_267, r12_267)
      r17_267 = r17_267 + r16_267
    end
    r15_267 = r0_267.MenuButtonData.Return:bt_getNowKey()
    r11_267, r12_267, r13_267, r14_267 = r3_267:getSubLayerParam("StoryMenu", "StoryBace", r15_267, LUA_PARAM_POS, r11_267, r12_267, r13_267, r14_267)
    r3_267:setSubLayerParam("StoryMenu", "StoryBace", r15_267, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_267:setSubLayerParam("StoryMenu", "StoryBace", r15_267, LUA_PARAM_POS, r11_267 + 80, r12_267, 0, 0)
    r3_267:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_267, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, 100 * r5_267, 0, r9_267 * r5_267)
    r3_267:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_267, LUA_EFFECT_POS, -80, 0, 0, 0, 0, 100 * r5_267, 0, r9_267 * r5_267)
    r3_267:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_267, 0)
    r8_267(r15_267, r11_267, r12_267)
  end
  g_Menu.StoryMenu.ptr.CancelMenuEffect = function(r0_269)
    -- line: [8773, 8799] id: 269
    if r0_269.MenuInf.effect == true and r0_269.MenuInf.enabled == true then
      local r1_269 = cclass.lua_Layers:create()
      r1_269:cancelEffect("StoryMenu", "StoryBace", "StoryDisp")
      for r5_269, r6_269 in pairs(r0_269.EffectButtonKeyList) do
        r1_269:cancelSubLayerEffect("StoryMenu", "StoryBace", r6_269.key, "StoryDisp")
        r1_269:setSubLayerParam("StoryMenu", "StoryBace", r6_269.key, LUA_PARAM_POS, r6_269.x, r6_269.y, 1, 1)
        r1_269:setSubLayerParam("StoryMenu", "StoryBace", r6_269.key, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
      for r5_269 = 28, 36, 1 do
        r1_269:cancelSubLayerEffect("StoryMenu", "StoryBace", r5_269, "StoryDisp")
        r1_269:setSubLayerVisible("StoryMenu", "StoryBace", r5_269, 1)
        r1_269:setSubLayerParam("StoryMenu", "StoryBace", r5_269, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
  end
  g_Menu.StoryMenu.ptr.defaultMenuMouseMove = g_Menu.StoryMenu.ptr.MenuMouseMove
  g_Menu.StoryMenu.ptr.MenuMouseMove = function(r0_270, r1_270, r2_270, r3_270, r4_270, r5_270, r6_270)
    -- line: [8803, 8811] id: 270
    r0_270:defaultMenuMouseMove(r1_270, r2_270, r3_270, r4_270, r5_270, r6_270)
    local r7_270 = 0
    if r0_270.MenuButton.selCursor ~= -1 then
      r7_270 = r0_270.MenuButton.selListKey[r0_270.MenuButton.selCursor].bt_l
    end
    r0_270:StorySelCursor(r0_270.MenuButton.selCursor, r7_270, r4_270, r5_270)
  end
  g_Menu.StoryMenu.ptr.startStoryMenu = function(r0_271)
    -- line: [8816, 8826] id: 271
    local r1_271 = cclass.lua_Layers:create()
    if g_menuExecute == false then
      r1_271:setSnap("system", true)
    end
    r1_271:copySnap("StoryMenu", "system")
    r0_271:MenuEffectStart(800, 0)
    r0_271.MenuInf.enabled = true
    r0_271.MenuInf.effect = true
  end
  g_Menu.StoryMenu.ptr.StoryMenuInit = function(r0_272, r1_272, r2_272)
    -- line: [8829, 8873] id: 272
    local r3_272 = cclass.lua_Layers:create()
    r3_272:initSubLayer("StoryMenu", "StoryBace", 19, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 20, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 21, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 22, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 23, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 24, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 25, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 28, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 29, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 30, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 31, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 32, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 33, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 34, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 35, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 36, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 38, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 39, 1)
    r3_272:initSubLayer("StoryMenu", "StoryBace", 40, 1)
    local r4_272 = {
      101,
      102, -- NOTE: Added 102
      103,
      104,
      105,
      106,
      107
    }
    for r8_272 = 1, 7, 1 do -- NOTE: Changed 6 to 7
      local r10_272 = 4 + (r8_272 - 1) * 2 -- NOTE: Changed 6 to 4
      r0_272:MenuButtonSet(r0_272.MenuButtonData, "SC" .. tostring(r8_272), 0, "StoryBace", r10_272, r10_272, 3 + (r8_272 - 1) * 2, -1, -1, r4_272[r8_272], 0, 0)
    end
    r0_272:MenuButtonSet(r0_272.MenuButtonData, "Return", 0, "StoryBace", 2, 2, 1, -1, -1, 99, 0, 0)
    r0_272:MenuButtonInit()
  end
  g_Menu.StoryMenu.ptr.StorySelCursor = function(r0_273, r1_273, r2_273, r3_273, r4_273)
    -- line: [8876, 8902] id: 273
    local r5_273 = cclass.lua_Layers:create()
    for r9_273 = 19, 25, 1 do -- NOTE: Changed 20 to 19
      r5_273:setSubLayerVisible("StoryMenu", "StoryBace", r9_273, 0)
    end
    if 101 <= r2_273 and r2_273 <= 107 then
      -- NOTE: Removed this if statement
      -- if r2_273 >= 103 then
      --   r2_273 = r2_273 - 1
      -- end
      r5_273:setSubLayerVisible("StoryMenu", "StoryBace", 19 + r2_273 - 100 - 1, 1) -- NOTE: Changed 20 to 19
      for r9_273 = 28, 36, 1 do
        r5_273:setSubLayerVisible("StoryMenu", "StoryBace", r9_273, 0)
      end
    else
      for r9_273 = 28, 36, 1 do
        r5_273:setSubLayerVisible("StoryMenu", "StoryBace", r9_273, 1)
      end
    end
  end
  local r2_262 = getUItype()
  local r3_262 = "SYS_Story.pna"
  if r2_262 == 1 then
    r3_262 = "SYS_c_Story.pna"
  end
  local r4_262 = g_Menu.StoryMenu.ptr:MenuInit("StoryBace", r3_262)
  if res == false then
    return false
  end
  g_Menu.StoryMenu.ptr:StoryMenuInit()
  local r5_262 = cclass.lua_Layers:create()
  g_Menu.StoryMenu.ptr:startStoryMenu()
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end

g_exampleText0 = "Patched with\n"
  .. "https://github.com/kevlu123/VN-Patching-Tools\n"
  .. "Based on DarthFly's patch."
