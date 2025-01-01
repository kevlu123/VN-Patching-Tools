-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
function ConfigGetPageFileName(r0_1)
  -- line: [17, 37] id: 1
  if r0_1 == 5 then
    r0_1 = 4
  end
  local r1_1 = getUItype()
  local r2_1 = "sys_config_P" .. tostring(r0_1) .. ".pna"
  if r1_1 == 0 then
    r2_1 = "sys_config_P" .. tostring(r0_1) .. ".pna"
  end
  if r1_1 == 1 then
    r2_1 = "sys_config_P" .. tostring(r0_1) .. ".pna"
  end
  if r1_1 == 2 then
  end
  return r2_1
end
function ConfigGetPageKeyName(r0_2)
  -- line: [45, 49] id: 2
  return string.format("ConfigPage%03d", r0_2)
end
function getConfigText()
  -- line: [53, 55] id: 3
  return "ConfigText2", "ConfigTextName"
end
function getSaveThumbKey(r0_4, r1_4)
  -- line: [57, 63] id: 4
  local r2_4 = cclass.lua_Layers:create()
  local r3_4 = nil	-- notice: implicit variable refs by block#[3]
  if r0_4 == true then
    r3_4 = "Save"
    if not r3_4 then
      ::label_9::
      r3_4 = "Load"
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  r3_4 = string.format("%sThumbnail%03d", r3_4, r1_4)
  return r3_4
end
function getSaveThumbTxt(r0_5, r1_5)
  -- line: [65, 70] id: 5
  local r2_5 = cclass.lua_Layers:create()
  local r3_5 = nil	-- notice: implicit variable refs by block#[3]
  if r0_5 == true then
    r3_5 = "Save"
    if not r3_5 then
      ::label_9::
      r3_5 = "Load"
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  r3_5 = string.format("%sText%03d", r3_5, r1_5)
  return r3_5
end
function getSaveThumbTimeTxt(r0_6, r1_6)
  -- line: [73, 78] id: 6
  local r2_6 = cclass.lua_Layers:create()
  local r3_6 = nil	-- notice: implicit variable refs by block#[3]
  if r0_6 == true then
    r3_6 = "Save"
    if not r3_6 then
      ::label_9::
      r3_6 = "Load"
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  r3_6 = string.format("%sTimeText%03d", r3_6, r1_6)
  return r3_6
end
g_UseSaveNoTxt = true
function getSaveThumbNoTxt(r0_7, r1_7)
  -- line: [81, 86] id: 7
  local r2_7 = cclass.lua_Layers:create()
  local r3_7 = nil	-- notice: implicit variable refs by block#[3]
  if r0_7 == true then
    r3_7 = "Save"
    if not r3_7 then
      ::label_9::
      r3_7 = "Load"
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  r3_7 = string.format("%sNoText%03d", r3_7, r1_7)
  return r3_7
end
function openConfig(r0_8, r1_8)
  -- line: [89, 6530] id: 8
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
    return false
  end
  if g_Menu.Config.ptr ~= nil and (g_Menu.Config.ptr.MenuInf.enabled == true or g_Menu.Config.ptr.MenuInf.effect == true) then
    return false
  end
  g_Menu.Config.ptr = Menu.new("configBase")
  g_Menu.Config.ptr.toSysMenu = false
  g_Menu.Config.ptr.MenuInf.pageEffect = false
  g_Menu.Config.ptr.MenuInf.beforePage = -1
  g_Menu.Config.ptr.NMSAcitve = cfunc.LegacyGame__lua_GetFlag(140)
  if g_Menu.Config.ptr.NMSAcitve == true and r0_8 == 0 then
    r0_8 = 8
  elseif r0_8 == 0 then
    if g_configPage < 1 or g_configPage == 4 or g_configPage == 5 then
      r0_8 = 1
    else
      r0_8 = g_configPage
    end
  end
  g_Menu.Config.ptr.ButtonP1 = {}
  g_Menu.Config.ptr.ButtonP2 = {}
  g_Menu.Config.ptr.ButtonP3 = {}
  g_Menu.Config.ptr.ButtonP45 = {}
  g_Menu.Config.ptr.ButtonP7 = {}
  g_Menu.Config.ptr.ButtonDropP7 = {}
  g_Menu.Config.ptr.ButtonP8 = {}
  g_Menu.Config.ptr.ButtonP8Slide = {}
  g_Menu.Config.ptr.ButtonP9 = {}
  g_Menu.Config.ptr.DropParam = {
    DropNo = -1,
    Before = -1,
    DRAGST_X = 0,
    DRAGST_Y = 0,
  }
  g_Menu.Config.ptr.DropP7 = {}
  g_Menu.Config.ptr.ItemP1 = {}
  g_Menu.Config.ptr.ItemP2 = {}
  g_Menu.Config.ptr.ItemP3 = {}
  g_Menu.Config.ptr.ItemP7 = {}
  g_Menu.Config.ptr.SliderMoveNo = -1
  g_Menu.Config.ptr.autoModeTimer = nil
  g_Menu.Config.ptr.TestVoicePlayFlag = false
  g_Menu.Config.ptr.TestVoiceRestVol = 0
  function g_Menu.Config.ptr.GetMenuMouseEnable(r0_9)
    -- line: [165, 174] id: 9
    local r1_9 = false
    if r0_9.MenuInf.enabled == true and r0_9.MenuInf.effect == false and r0_9.MenuInf.pageEffect == false and r0_9.MenuButton ~= nil then
      r1_9 = true
    end
    return r1_9
  end
  function g_Menu.Config.ptr.MenuEffect(r0_10)
    -- line: [177, 252] id: 10
    r0_10:CheckTestVoicePlaying()
    local r1_10 = false
    if r0_10.MenuInf.effect == true then
      r1_10 = r0_10:MenuEffectTransJob()
      if r1_10 == false then
        r0_10:MenuEffectEndJob()
        r0_10.MenuInf.effect = false
      end
    end
    if r0_10.MenuInf.pageEffect == true then
      local r2_10 = cclass.lua_Layers:create()
      if r2_10:isEffect("configBase", "ConfigPage") == false then
        if r0_10.MenuInf.beforePage ~= -1 then
          r2_10:removeLayer("configBase", ConfigGetPageKeyName(r0_10.MenuInf.beforePage))
          if r0_10.MenuInf.beforePage == 1 then
            for r7_10, r8_10 in pairs(r0_10.PreviewList) do
              if r8_10 ~= nil then
                r2_10:removeLayer("configBase", r8_10)
              end
            end
          end
          if r0_10.MenuInf.beforePage == 2 then
            r0_10:deleteP2key()
          end
          if r0_10.MenuInf.beforePage == 4 then
            r0_10:deleteThumbnail(true)
          end
          if r0_10.MenuInf.beforePage == 5 then
            r0_10:deleteThumbnail(false)
          end
          if r0_10.MenuInf.beforePage == 7 then
            r0_10:deleteIcon()
          end
          if r0_10.MenuInf.beforePage == 8 and r0_10.deleteP8Th ~= nil then
            r0_10:deleteP8Th()
          end
          if r0_10.MenuInf.beforePage == 9 and r0_10.deleteP9Th ~= nil then
            r0_10:deleteP9Th()
          end
          r0_10.MenuInf.beforePage = -1
        end
        if g_configPage == 2 then
          startCfg2Preview()
        end
        r0_10:UpButtonMoveEnd(g_configPage)
        r0_10:updateConfigCursorPos()
        r0_10.MenuInf.pageEffect = false
      end
    end
    return r1_10
  end
  function g_Menu.Config.ptr.MenuEffectEndJob(r0_11)
    -- line: [255, 293] id: 11
    local r1_11 = cclass.lua_Layers:create()
    if r0_11.MenuInf.enabled == true then
      r0_11:updateConfigCursorPos()
      if g_configPage == 2 then
        startCfg2Preview()
      end
      if r0_11.toSysMenu == true then
        r1_11:removeSnap("system")
        r1_11:setSnap("system", true)
      end
    else
      if g_menuExecute == false then
        r1_11:removeSnap("system")
      end
      r1_11:remove("configBase")
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
      setButtonState()
      r0_11.MenuInf.ButtonLayer = ""
      r0_11.MenuInf.ButtonPna = ""
      r0_11:StopTestVoice()
      r0_11:StopTestSe()
      r0_11:StopTestSystemVoice()
    end
  end
  function g_Menu.Config.ptr.updateConfigCursorPos(r0_12)
    -- line: [296, 306] id: 12
    local r1_12 = cclass.lua_Layers:create()
    local r2_12 = 0
    local r3_12 = 0
    local r4_12 = cclass.lua_AutoCursor:new()
    r2_12, r3_12 = r4_12:GetCursorPos(r2_12, r3_12)
    r4_12:delete()
    r0_12.MenuButton:changeButton("configBase", r1_12:getCursorPos("configBase", r2_12, r3_12, 0) - 1, r2_12, r3_12)
  end
  g_Menu.Config.ptr.defaultMenuMouseMove = g_Menu.Config.ptr.MenuMouseMove
  function g_Menu.Config.ptr.MenuMouseMove(r0_13, r1_13, r2_13, r3_13, r4_13, r5_13, r6_13)
    -- line: [311, 359] id: 13
    r0_13:defaultMenuMouseMove(r1_13, r2_13, r3_13, r4_13, r5_13, r6_13)
    if g_configPage == 1 then
      r0_13:SelCursorP1(r0_13.MenuButton.selCursor, r4_13, r5_13)
    end
    if g_configPage == 2 then
      r0_13:SelCursorP2(r0_13.MenuButton.selCursor, r1_13, r2_13, r3_13, r4_13, r5_13)
    end
    if g_configPage == 3 then
      r0_13:SelCursorP3(r0_13.MenuButton.selCursor, r4_13, r5_13)
      r0_13:SelCursorP3(r0_13.MenuButton.selCursor, r1_13, r2_13, r3_13, r4_13, r5_13)
    end
    if g_configPage == 4 then
      r0_13:SelCursorP4(r0_13.MenuButton.selCursor, r4_13, r5_13)
    end
    if g_configPage == 5 then
      r0_13:SelCursorP5(r0_13.MenuButton.selCursor, r4_13, r5_13)
    end
    if g_configPage == 7 then
      r0_13:SelCursorP7(r0_13.MenuButton.selDownCursor, r0_13.MenuButton.selCursor, r4_13, r5_13)
    end
    if g_configPage == 8 and r0_13.SelCursorP8 ~= nil then
      r0_13:SelCursorP8(r0_13.MenuButton.selCursor, r4_13, r5_13)
    end
    if g_configPage == 9 and r0_13.SelCursorP9 ~= nil then
      r0_13:SelCursorP9(r0_13.MenuButton.selCursor, r4_13, r5_13)
    end
  end
  function g_Menu.Config.ptr.MenuButtonJobPosRepeat(r0_14, r1_14, r2_14, r3_14, r4_14, r5_14, r6_14, r7_14)
    -- line: [362, 373] id: 14
    if r2_14 == "LD" then
      if g_configPage == 2 then
        r0_14:P2_ButtonRepeatLD(r1_14, r2_14, r3_14, r4_14, r5_14, r6_14, r7_14)
      end
      if g_configPage == 3 then
        r0_14:P3_ButtonRepeatLD(r1_14, r2_14, r3_14, r4_14, r5_14, r6_14, r7_14)
      end
    end
    if r2_14 == "LP" then
    end
  end
  function g_Menu.Config.ptr.MenuButtonJobPos(r0_15, r1_15, r2_15, r3_15, r4_15)
    -- line: [376, 482] id: 15
    if g_SavedDataUpdateWeight then
      return 
    end
    if r2_15 == "LD" then
      r0_15:P1_ButtonJobLD(r1_15, r2_15, r3_15, r4_15)
      r0_15:P2_ButtonJobLD(r1_15, r2_15, r3_15, r4_15)
      r0_15:P3_ButtonJobLD(r1_15, r2_15, r3_15, r4_15)
      r0_15:DataPage_ButtonJobLD(r1_15, r2_15, r3_15, r4_15)
      if r0_15.P7_ButtonJobLD ~= nil then
        r0_15:P7_ButtonJobLD(r1_15, r2_15, r3_15, r4_15)
      end
      if r0_15.P9_ButtonJobLD ~= nil then
        r0_15:P9_ButtonJobLD(r1_15, r2_15, r3_15, r4_15)
      end
    end
    if r2_15 == "LU" then
      if r1_15 == 1 then
        r0_15:initConfigPage(1, false)
      end
      if r1_15 == 2 then
        r0_15:initConfigPage(2, false)
      end
      if r1_15 == 3 then
        r0_15:initConfigPage(3, false)
      end
      if r1_15 == 4 then
        r0_15:initConfigPage(4, false)
      end
      if r1_15 == 5 then
        r0_15:initConfigPage(5, false)
      end
      if r1_15 == 6 then
        r0_15:initConfigPage(6, false)
      end
      if r1_15 == 7 then
        r0_15:initConfigPage(7, false)
      end
      if r1_15 == 8 then
        r0_15:initConfigPage(8, false)
      end
      if r1_15 == 9 then
        r0_15:initConfigPage(9, false)
      end
      if r1_15 == 10 then
        openConfirm(LUA_CONFIRM_DEFAULT)
      end
      if r1_15 == 11 then
        if r0_15.NMSAcitve == true then
          if g_menuExecute == false and r0_15.P8ChangeSceneNo ~= g_NmsPlay.Act then
            openConfirm(LUA_CONFIRM_CHANGESCN)
          else
            closeConfig()
          end
        else
          closeConfig()
        end
      end
      if r1_15 == 12 then
        if g_menuExecute == true then
          closeConfig()
        else
          openConfirm(LUA_CONFIRM_TITLE)
        end
      end
      if r1_15 == 13 then
        openConfirm(LUA_CONFIRM_QUIT)
      end
      r0_15:P1_ButtonJobLU(r1_15, r2_15, r3_15, r4_15)
      r0_15:P2_ButtonJobLU(r1_15, r2_15, r3_15, r4_15)
      r0_15:P3_ButtonJobLU(r1_15, r2_15, r3_15, r4_15)
      r0_15:DataPage_ButtonJobLU(r1_15, r2_15, r3_15, r4_15)
      r0_15:P7_ButtonJobLU(r1_15, r2_15, r3_15, r4_15)
      if r0_15.P8_ButtonJobLU then
        r0_15:P8_ButtonJobLU(r1_15, r2_15, r3_15, r4_15)
      end
      if r0_15.P9_ButtonJobLU ~= nil then
        r0_15:P9_ButtonJobLU(r1_15, r2_15, r3_15, r4_15)
      end
    end
    if r2_15 == "RU" and r0_15:GetMenuMouseEnable() then
      if r0_15.NMSAcitve == true then
        if g_menuExecute == false and r0_15.P8ChangeSceneNo ~= g_NmsPlay.Act then
          openConfirm(LUA_CONFIRM_CHANGESCN)
        else
          closeConfig()
        end
      else
        r0_15:SystemSePlay(g_SysSEName.cancel)
        closeConfig()
      end
    end
  end
  function g_Menu.Config.ptr.MenuKeyDown(r0_16, r1_16, r2_16, r3_16, r4_16)
    -- line: [484, 485] id: 16
  end
  function g_Menu.Config.ptr.MenuMouseWheel(r0_17, r1_17, r2_17, r3_17)
    -- line: [488, 496] id: 17
    if r0_17:GetMenuMouseEnable() and g_configPage == 8 and r0_17.MenuMouseWheelP8 ~= nil then
      r0_17:MenuMouseWheelP8(r1_17, r2_17, r3_17)
    end
  end
  function g_Menu.Config.ptr.startConfigMenu(r0_18, r1_18)
    -- line: [502, 521] id: 18
    local r2_18 = cclass.lua_Layers:create()
    if g_menuExecute == false and r1_18 == false then
      r2_18:setSnap("system", true)
    end
    r2_18:copySnap("configBase", "system")
    r2_18:startTransition("configBase", 0, 1, 500 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_18.MenuInf.enabled = true
    r0_18.MenuInf.effect = true
    if r1_18 == false then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
    end
  end
  g_Menu.Config.ptr.LogoMainPos = {}
  g_Menu.Config.ptr.LogoSubPos = {}
  function g_Menu.Config.ptr.initConfigButton(r0_19)
    -- line: [528, 594] id: 19
    local r1_19 = cclass.lua_Layers:create()
    for r5_19 = 0, 6, 1 do
      local r6_19 = 79 + r5_19
      local r7_19 = 88 + r5_19
      r1_19:initSubLayer("configBase", "configBase01", r6_19, 1)
      r1_19:initSubLayer("configBase", "configBase01", r7_19, 1)
      local r8_19 = 0
      local r9_19 = 0
      r8_19, r9_19, r10_19, r11_19 = r1_19:getSubLayerParam("configBase", "configBase01", r6_19, LUA_PARAM_POS, r8_19, r9_19, 0, 0)
      r0_19.LogoMainPos[r5_19 + 1] = {
        posx = r8_19,
        posy = r9_19,
      }
      local r12_19 = 0
      local r13_19 = 0
      r12_19, r13_19, r14_19, r15_19 = r1_19:getSubLayerParam("configBase", "configBase01", r7_19, LUA_PARAM_POS, r12_19, r13_19, 0, 0)
      r0_19.LogoSubPos[r5_19 + 1] = {
        posx = r12_19,
        posy = r13_19,
      }
      r1_19:setSubLayerParam("configBase", "configBase01", r6_19, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_19:setSubLayerParam("configBase", "configBase01", r7_19, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_19:initSubLayer("configBase", "configBase01", 68 + r5_19, 0)
    end
    r1_19:initSubLayer("configBase", "configBase01", 76, 1)
    r1_19:initSubLayer("configBase", "configBase01", 101, 1)
    r1_19:initSubLayer("configBase", "configBase01", 104, 1)
    r1_19:initSubLayer("configBase", "configBase01", 102, 1)
    r0_19.MenuButtonData = {}
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "System", 1, "configBase01", 23, 32, 50, 41, 59, 1, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Text", 1, "configBase01", 24, 33, 51, 42, 60, 2, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Sound", 1, "configBase01", 25, 34, 52, 43, 61, 3, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Save", 1, "configBase01", 26, 35, 53, 44, 62, 4, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Load", 1, "configBase01", 27, 36, 54, 45, 63, 5, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Shortcut", 1, "configBase01", 28, 37, 55, 46, 64, 6, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Gesture", 1, "configBase01", 29, 38, 56, 47, 65, 7, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "default", 1, "configBase01", 8, 8, 2, -1, 14, 10, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "back", 1, "configBase01", 9, 9, 3, -1, 15, 11, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "rereplay", 1, "configBase01", 98, 98, 97, -1, 99, 12, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "title", 1, "configBase01", 10, 10, 4, -1, 16, 12, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "quit", 1, "configBase01", 11, 11, 5, -1, 17, 13, 0, 0)
    r0_19:MenuButtonInit()
  end
  function g_Menu.Config.ptr.DashboardMove(r0_20, r1_20, r2_20)
    -- line: [597, 621] id: 20
    return 
    local r3_20 = cclass.lua_Layers:create()
    local r4_20 = getEffectRate()
    for r8_20 = 1, 6, 1 do
      local r9_20 = 0
      local r10_20 = 0
      local r11_20 = 0
      local r12_20 = 0
      local r13_20 = 100 - (r1_20 - 1) * 8 - r8_20 - 1
      r3_20:initSubLayer("configBase", "configBase01", r13_20, 0)
      r9_20, r10_20, r11_20, r12_20 = r3_20:getSubLayerParam("configBase", "configBase01", r13_20, LUA_PARAM_POS, r9_20, r10_20, r11_20, r12_20)
      local r14_20 = 7 - r8_20 - 1
      if r2_20 > 0 then
        local r15_20 = 0
        local r16_20 = 0
        r15_20, r16_20, r17_20, r18_20 = r3_20:getSubLayerParam("configBase", "configBase01", r14_20, LUA_PARAM_POS, r15_20, r16_20, 0, 0)
        r3_20:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r14_20, LUA_EFFECT_POS, r9_20 - r15_20, r10_20 - r16_20, 0, 0, 0, r2_20 * r4_20, 0, 0)
        r3_20:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r14_20, 0)
      else
        r3_20:setSubLayerParam("configBase", "configBase01", r14_20, LUA_PARAM_POS, r9_20, r10_20, 0, 0)
      end
    end
  end
  function g_Menu.Config.ptr.UpButtonMove(r0_21, r1_21, r2_21)
    -- line: [624, 671] id: 21
    return 
    local r3_21 = cclass.lua_Layers:create()
    local r4_21 = getEffectRate()
    local r5_21 = {
      "System",
      "Text",
      "Sound",
      "Save",
      "Load",
      "Shortcut",
      "Gesture"
    }
    for r9_21 = 1, 7, 1 do
      local r10_21 = 16 - r9_21 - 1
      if r9_21 == r1_21 then
        r3_21:initSubLayer("configBase", "configBase01", r10_21, 1)
        r3_21:setSubLayerVisible("configBase", "configBase01", r10_21, 1)
        if r2_21 > 0 then
          r3_21:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r10_21, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 150 * r4_21, 0, 0)
          r3_21:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r10_21, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 80 * r4_21, 0, 0)
          r3_21:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r10_21, 0)
        end
      else
        r3_21:setSubLayerVisible("configBase", "configBase01", r10_21, 0)
      end
      if r2_21 > 0 then
        local r11_21 = 0
        local r12_21 = 0
        local r13_21 = 0
        local r14_21 = 0
        pos_lay = 163 - (r1_21 - 1) * 9 - r9_21 - 1
        r3_21:initSubLayer("configBase", "configBase01", pos_lay, 0)
        r11_21, r12_21, r13_21, r14_21 = r3_21:getSubLayerParam("configBase", "configBase01", pos_lay, LUA_PARAM_POS, r11_21, r12_21, r13_21, r14_21)
        local r15_21 = 0
        local r16_21 = 0
        r15_21, r16_21, r17_21, r18_21 = r3_21:getSubLayerParam("configBase", "configBase01", r0_21.MenuButtonData[r5_21[r9_21]].SubLayer.hit.no, LUA_PARAM_POS, r15_21, r16_21, 0, 0)
        local r20_21 = r11_21 - r15_21
        local r21_21 = r12_21 - r16_21
        for r26_21, r27_21 in pairs({
          "on",
          "def",
          "dis"
        }) do
          local r28_21 = r0_21.MenuButtonData[r5_21[r9_21]].SubLayer[r27_21].no
          r3_21:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r28_21, LUA_EFFECT_POS, r20_21, r21_21, 0, 0, 0, r2_21 * r4_21, 0, 0)
          r3_21:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r28_21, 0)
        end
      else
        r0_21:UpButtonMoveEnd(r1_21)
      end
    end
  end
  function g_Menu.Config.ptr.UpButtonMoveEnd(r0_22, r1_22)
    -- line: [673, 688] id: 22
    return 
    local r2_22 = cclass.lua_Layers:create()
    local r3_22 = {
      "System",
      "Text",
      "Sound",
      "Save",
      "Load",
      "Shortcut",
      "Gesture"
    }
    for r7_22 = 1, 7, 1 do
      local r8_22 = 0
      local r9_22 = 0
      local r10_22 = 0
      local r11_22 = 0
      pos_lay = 163 - (r1_22 - 1) * 9 - r7_22 - 1
      r2_22:initSubLayer("configBase", "configBase01", pos_lay, 0)
      r8_22, r9_22, r10_22, r11_22 = r2_22:getSubLayerParam("configBase", "configBase01", pos_lay, LUA_PARAM_POS, r8_22, r9_22, r10_22, r11_22)
      r0_22.MenuButtonData[r3_22[r7_22]]:bt_SetPos(r8_22, r9_22)
    end
  end
  function g_Menu.Config.ptr.SetConfigButtonActive(r0_23, r1_23)
    -- line: [692, 781] id: 23
    local r2_23 = {
      "System",
      "Text",
      "Sound",
      "Save",
      "Load",
      "Shortcut",
      "Gesture",
      "NMSMenu",
      "Tips"
    }
    local r3_23 = cclass.lua_Layers:create()
    for r7_23, r8_23 in pairs(r2_23) do
      local r9_23 = r0_23.MenuButtonData[r8_23]
      if r9_23 ~= nil then
        if r7_23 == r1_23 then
          r0_23.MenuButtonData[r8_23]:bt_SetActive(1)
          r3_23:setSubLayerVisible("configBase", "configBase01", 68 + r7_23 - 1, 1)
        else
          r0_23.MenuButtonData[r8_23]:bt_SetActive(0)
          r9_23 = r0_23.MenuButton.selCursor
          if r8_23 == r9_23 then
            r3_23:setSubLayerVisible("configBase", "configBase01", 68 + r7_23 - 1, 1)
          else
            r3_23:setSubLayerVisible("configBase", "configBase01", 68 + r7_23 - 1, 0)
          end
        end
      end
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
      r0_23.MenuButtonData.Save:bt_SetActive(2)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
      r0_23.MenuButtonData.Load:bt_SetActive(2)
    end
    if r1_23 == 4 or r1_23 == 5 or r1_23 == 8 then
      r0_23.MenuButtonData.default:bt_SetActive(3)
    else
      r0_23.MenuButtonData.default:bt_SetActive(0)
    end
    if g_menuExecute == true then
      r0_23.MenuButtonData.Save:bt_SetActive(2)
    end
    if r0_23.MenuButtonData.rereplay ~= nil then
      r0_23.MenuButtonData.rereplay:bt_SetActive(3)
    end
    if r0_23.MenuButtonData.renms ~= nil then
      r0_23.MenuButtonData.renms:bt_SetActive(3)
    end
    r0_23.MenuButtonData.title:bt_SetActive(0)
    local r4_23 = cfunc.LegacyGame__lua_GetFlag(140)
    local r5_23 = cfunc.LegacyGame__lua_GetFlag(127)
    local r6_23 = false
    if r5_23 then
      if r0_23.MenuButtonData.rereplay ~= nil then
        r0_23.MenuButtonData.rereplay:bt_SetActive(0)
        r6_23 = true
      end
      if r0_23.MenuButtonData.renms ~= nil then
        r0_23.MenuButtonData.renms:bt_SetActive(3)
      end
      if r6_23 then
        r0_23.MenuButtonData.title:bt_SetActive(3)
      end
    end
    if r4_23 then
      if r0_23.MenuButtonData.rereplay ~= nil then
        r0_23.MenuButtonData.rereplay:bt_SetActive(3)
      end
      if r0_23.MenuButtonData.renms ~= nil then
        r0_23.MenuButtonData.renms:bt_SetActive(0)
        r6_23 = true
      end
      if r6_23 then
        r0_23.MenuButtonData.title:bt_SetActive(3)
      end
    end
    if g_Menu.Config.ptr.NMSAcitve == false and r0_23.MenuButtonData.NMSMenu ~= nil then
      r0_23.MenuButtonData.NMSMenu:bt_SetActive(2)
    end
  end
  g_Menu.Config.ptr.PageSlide = true
  function g_Menu.Config.ptr.initConfigPage(r0_24, r1_24, r2_24)
    -- line: [786, 970] id: 24
    -- notice: unreachable block#41
    -- notice: unreachable block#62
    r0_24.SliderMoveNo = -1
    if r2_24 == false and g_configPage == r1_24 then
      return 
    end
    local r3_24 = getEffectRate()
    local r4_24 = 300 * r3_24
    local r5_24 = cclass.lua_Layers:create()
    local r6_24 = ConfigGetPageFileName(r1_24)
    local r7_24 = ConfigGetPageKeyName(r1_24)
    r0_24:MenuLoadLayer(r7_24, r6_24)
    if r1_24 == 1 then
      r0_24:initConfigP1(r7_24, true)
    elseif r1_24 == 2 then
      r0_24:initConfigP2(r7_24, true)
    elseif r1_24 == 3 then
      r0_24:initConfigP3(r7_24, true)
    elseif r1_24 == 4 then
      r0_24:initDataPage(r7_24, true, true)
    elseif r1_24 == 5 then
      r0_24:initDataPage(r7_24, false, true)
    elseif r1_24 == 6 then
      r0_24.MenuButton:InitList()
      r5_24:initSubLayer("configBase", r7_24, 0, 1)
    elseif r1_24 == 7 then
      r0_24:initConfigP7(r7_24, true)
    elseif r1_24 == 8 then
      r0_24:initConfigP8(r7_24, true)
    elseif r1_24 == 9 then
      r0_24:initConfigP9(r7_24, true)
    end
    r0_24.MenuButton:SetList("MenuButtonData", r0_24.MenuButtonData)
    r0_24:SetConfigButtonActive(r1_24)
    if r2_24 == false then
      local r8_24 = 0
      local r9_24 = ConfigGetPageKeyName(g_configPage)
      r5_24:clearHitTestAll("configBase", r9_24)
      local r10_24 = g_configPage
      if r1_24 < r10_24 then
        r10_24 = APP_INTERNAL_WIDTH or -1 * APP_INTERNAL_WIDTH
      else
        goto label_117	-- block#24 is visited secondly
      end
      if r1_24 >= g_configPage or not 90 then
        local r11_24 = -90
      end
      if r1_24 == 6 then
        r10_24 = -1 * APP_INTERNAL_WIDTH
        local r11_24 = -90
      end
      if g_configPage == 6 then
        r10_24 = APP_INTERNAL_WIDTH
        local r11_24 = 90
      end
      if g_configPage == 1 then
        r0_24:effectCfg1Preview(r2_24, r10_24, r4_24, true, r8_24)
      elseif g_configPage == 2 then
        r0_24:effectCfg2Text(r2_24, r10_24, r4_24, true, r8_24)
      elseif g_configPage == 4 or g_configPage == 5 then
        local r12_24 = g_configPage
        if r12_24 == 4 then
          r12_24 = true
        else
          r12_24 = false
        end
        r0_24:effectThumbnail(r12_24, r2_24, g_dataInfo.page, r10_24, r4_24, true, r8_24)
      elseif g_configPage == 7 then
        r0_24:effectP7(r2_24, r10_24, r4_24, true, r8_24)
      elseif g_configPage == 8 then
        r0_24:effectP8Th(r2_24, r10_24, r4_24, true, r8_24)
      elseif g_configPage == 9 then
        r0_24:effectP9Th(r2_24, r10_24, r4_24, true, r8_24)
      end
      local r12_24 = r0_24.PageSlide
      if r12_24 then
        r5_24:setParam("configBase", r9_24, LUA_PARAM_POS, 0, 0, 0, 0)
        r5_24:setEffect("configBase", r9_24, "ConfigPage", LUA_EFFECT_POS, r10_24, 0, 0, 0, 2, r4_24, 0, r8_24)
        r5_24:startEffect("configBase", r9_24, "ConfigPage", 0)
        r5_24:setParam("configBase", r7_24, LUA_PARAM_POS, -r10_24, 0, 0, 0)
        r5_24:setEffect("configBase", r7_24, "ConfigPage", LUA_EFFECT_POS, r10_24, 0, 0, 0, 2, r4_24, 0, r8_24)
      else
        r5_24:setParam("configBase", r9_24, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_24:setEffect("configBase", r9_24, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r4_24, 0, r8_24)
        r5_24:startEffect("configBase", r9_24, "ConfigPage", 0)
        r5_24:setParam("configBase", r7_24, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r5_24:setEffect("configBase", r7_24, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r4_24, 0, r8_24)
      end
      r5_24:startEffect("configBase", r7_24, "ConfigPage", 0)
      if r1_24 == 1 then
        r0_24:effectCfg1Preview(r2_24, r10_24, r4_24, false, r8_24)
      elseif r1_24 == 2 then
        r0_24:effectCfg2Text(r2_24, r10_24, r4_24, false, r8_24)
      elseif r1_24 == 4 or r1_24 == 5 then
        if r1_24 == 4 then
          r12_24 = true
        else
          r12_24 = false
        end
        r0_24:effectThumbnail(r12_24, r2_24, g_dataInfo.page, r10_24, r4_24, false, r8_24)
      elseif r1_24 == 7 then
        r0_24:effectP7(r2_24, r10_24, r4_24, false, r8_24)
      elseif r1_24 == 8 then
        r0_24:effectP8Th(r2_24, r10_24, r4_24, false, r8_24)
      elseif r1_24 == 9 then
        r0_24:effectP9Th(r2_24, r10_24, r4_24, false, r8_24)
      end
      r0_24:ConfigLogo(r1_24, g_configPage, r4_24, r3_24)
      r0_24:DashboardMove(r1_24, r4_24)
      r0_24:UpButtonMove(r1_24, r4_24)
      r0_24.MenuInf.pageEffect = true
    else
      r0_24:ConfigLogo(r1_24, g_configPage, 0, 0)
      r0_24:DashboardMove(r1_24, 0)
      r0_24:UpButtonMove(r1_24, 0)
    end
    r0_24.MenuInf.beforePage = g_configPage
    g_configPage = r1_24
  end
  function g_Menu.Config.ptr.ConfigLogo(r0_25, r1_25, r2_25, r3_25, r4_25)
    -- line: [973, 1129] id: 25
    -- notice: unreachable block#42
    -- notice: unreachable block#45
    -- notice: unreachable block#37
    -- notice: unreachable block#38
    -- notice: unreachable block#32
    -- notice: unreachable block#26
    -- notice: unreachable block#43
    -- notice: unreachable block#29
    -- notice: unreachable block#44
    -- notice: unreachable block#31
    -- notice: unreachable block#34
    -- notice: unreachable block#28
    -- notice: unreachable block#33
    -- notice: unreachable block#27
    -- notice: unreachable block#35
    -- notice: unreachable block#40
    -- notice: unreachable block#30
    -- notice: unreachable block#39
    -- notice: unreachable block#41
    -- notice: unreachable block#36
    local r5_25 = cclass.lua_Layers:create()
    local r6_25 = 0
    local r7_25 = 79 + r1_25 - 1
    local r8_25 = 88 + r1_25 - 1
    local r9_25 = 79 + r2_25 - 1
    local r10_25 = 88 + r2_25 - 1
    local r11_25 = 0
    if r3_25 > 0 then
      r11_25 = 553
      if r2_25 >= 1 then
        r5_25:setSubLayerParam("configBase", "configBase01", r9_25, LUA_PARAM_POS, r0_25.LogoMainPos[r2_25].posx, r0_25.LogoMainPos[r2_25].posy, 0, 0)
        r5_25:setSubLayerParam("configBase", "configBase01", r10_25, LUA_PARAM_POS, r0_25.LogoSubPos[r2_25].posx, r0_25.LogoSubPos[r2_25].posy, 0, 0)
        r5_25:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r9_25, LUA_EFFECT_POS, -500, 0, 0, 0, 0, r3_25 / 2, 0, r6_25)
        r5_25:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r10_25, LUA_EFFECT_POS, 250, 0, 0, 0, 0, r3_25 / 2, 0, r6_25)
        r5_25:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r9_25, 0)
        r5_25:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r10_25, 0)
        r6_25 = r3_25 / 2
        if r2_25 == 1 or r2_25 == 2 or r2_25 == 3 then
          r11_25 = 553
        else
          r11_25 = 626
        end
      end
      local r12_25 = r11_25
      if r1_25 >= 1 then
        r5_25:setSubLayerParam("configBase", "configBase01", r7_25, LUA_PARAM_POS, r0_25.LogoMainPos[r1_25].posx - 500, r0_25.LogoMainPos[r1_25].posy, 0, 0)
        r5_25:setSubLayerParam("configBase", "configBase01", r8_25, LUA_PARAM_POS, r0_25.LogoSubPos[r1_25].posx + 250, r0_25.LogoSubPos[r1_25].posy, 0, 0)
        r5_25:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r7_25, LUA_EFFECT_POS, 500, 0, 0, 0, 0, r3_25 / 2, 0, r6_25)
        r5_25:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r8_25, LUA_EFFECT_POS, -250, 0, 0, 0, 0, r3_25 / 2, 0, r6_25)
        r5_25:setSubLayerParam("configBase", "configBase01", r7_25, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_25:setSubLayerParam("configBase", "configBase01", r8_25, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_25:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r7_25, 0)
        r5_25:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r8_25, 0)
        local r13_25 = 0
        if r1_25 == 1 or r1_25 == 2 or r1_25 == 3 then
          r13_25 = 553
        else
          r13_25 = 626
        end
        r12_25 = r13_25 - r12_25
      end
      r5_25:setSubLayerParam("configBase", "configBase01", 102, LUA_PARAM_POS, 0, r11_25, 0, 0)
      if r12_25 ~= 0 then
        r5_25:setSubLayerEffect("configBase", "configBase01", "ConfigPage", 102, LUA_EFFECT_POS, 0, r12_25, 0, 0, 0, r3_25, 0, 0)
        r5_25:startSubLayerEffect("configBase", "configBase01", "ConfigPage", 102, 0)
      end
    else
      if r2_25 >= 1 then
        r5_25:setSubLayerParam("configBase", "configBase01", r9_25, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r5_25:setSubLayerParam("configBase", "configBase01", r10_25, LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
      if r1_25 >= 1 then
        r5_25:setSubLayerParam("configBase", "configBase01", r7_25, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_25:setSubLayerParam("configBase", "configBase01", r8_25, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
      if r1_25 == 1 or r1_25 == 2 or r1_25 == 3 then
        r11_25 = 553
      else
        r11_25 = 626
      end
      r5_25:setSubLayerParam("configBase", "configBase01", 102, LUA_PARAM_POS, 0, r11_25, 0, 0)
    end
  end
  function g_Menu.Config.ptr.ItemSetInit(r0_26)
    -- line: [1133, 1142] id: 26
    local r1_26 = {
      selCursor_selName = -1,
      selCursor_Item = {},
    }
    r1_26.selCursor_Item[1] = -1
    r1_26.selCursor_Item[2] = -1
    r1_26.selCursor_Item[3] = -1
    r1_26.selCursor_Conf = -1
    return r1_26
  end
  function g_Menu.Config.ptr.ItemSet(r0_27, r1_27, r2_27, r3_27, r4_27, r5_27, r6_27)
    -- line: [1145, 1185] id: 27
    r1_27.selCursor_selName = r2_27
    if r1_27.selCursor_Item[1] ~= -1 then
      r1_27.selCursor_Item[1]:SetAct("def")
      r1_27.selCursor_Item[1] = -1
    end
    if r1_27.selCursor_Item[2] ~= -1 then
      r1_27.selCursor_Item[2]:SetAct("def")
      r1_27.selCursor_Item[2] = -1
    end
    if r1_27.selCursor_Item[3] ~= -1 then
      r1_27.selCursor_Item[3]:SetAct("def")
      r1_27.selCursor_Item[3] = -1
    end
    if r1_27.selCursor_Conf ~= -1 then
      r1_27.selCursor_Conf:SetAct("def")
      r1_27.selCursor_Conf = -1
    end
    if r3_27 ~= -1 then
      r1_27.selCursor_Item[1] = r1_27[r3_27]
      r1_27.selCursor_Item[1]:SetAct("on")
    end
    if r4_27 ~= -1 then
      r1_27.selCursor_Item[2] = r1_27[r4_27]
      r1_27.selCursor_Item[2]:SetAct("on")
    end
    if r5_27 ~= -1 then
      r1_27.selCursor_Item[3] = r1_27[r5_27]
      r1_27.selCursor_Item[3]:SetAct("on")
    end
    if r6_27 ~= -1 then
      r1_27.selCursor_Conf = r1_27[r6_27]
      r1_27.selCursor_Conf:SetAct("on")
    end
  end
  function g_Menu.Config.ptr.CheckItemNew(r0_28, r1_28, r2_28, r3_28, r4_28, r5_28)
    -- line: [1189, 1198] id: 28
    local r6_28 = MenuItem.new("configBase", r1_28, r2_28, r3_28)
    r6_28:addLayer("Actdef", r4_28)
    r6_28:addLayer("Acton", r5_28)
    r6_28:ReSet()
    r6_28:SetAct("def")
    r6_28.ActiveFlag = 0
    return r6_28
  end
  function g_Menu.Config.ptr.CheckItemAct(r0_29, r1_29, r2_29, r3_29)
    -- line: [1200, 1209] id: 29
    if r1_29 == nil then
      return 
    end
    if r1_29[r2_29] == nil then
      return 
    end
    r1_29[r2_29].ActiveFlag = r3_29
  end
  function g_Menu.Config.ptr.CheckItemOnCursor(r0_30, r1_30, r2_30, r3_30)
    -- line: [1212, 1233] id: 30
    if r1_30 == nil then
      return 
    end
    if r1_30[r2_30] == nil then
      return 
    end
    if r1_30[r2_30].ActiveFlag == 0 then
      if r3_30 == 0 then
        r1_30[r2_30]:SetAct("def")
      else
        r1_30[r2_30]:SetAct("on")
      end
    elseif r3_30 == 0 then
      r1_30[r2_30]:SetAct("Actdef")
    else
      r1_30[r2_30]:SetAct("Acton")
    end
  end
  function g_Menu.Config.ptr.SetSliderParam(r0_31, r1_31, r2_31, r3_31, r4_31, r5_31, r6_31)
    -- line: [1239, 1256] id: 31
    r1_31:bt_SetMoveRangeRectLayer(r2_31)
    r1_31:bt_SetEventRangeRectLayer(r3_31)
    r1_31:bt_SetMovableInit(true, r4_31, 0, r5_31, 0, 0, 0)
    r1_31.initpos.x = r1_31.MOVERANGE.x
    r1_31.initpos.y = r1_31.MOVERANGE.y
    r1_31.initrect.x = r1_31.MOVERANGE.x
    r1_31.initrect.y = r1_31.MOVERANGE.y
    r1_31.initrect.w = r1_31.EVENT_RECT.w
    r1_31.initrect.h = r1_31.EVENT_RECT.h
    r1_31:bt_SetParamX(r6_31)
  end
  function g_Menu.Config.ptr.MoveSliderBack(r0_32, r1_32, r2_32, r3_32)
    -- line: [1258, 1272] id: 32
    local r4_32 = 0
    local r5_32 = r2_32.EVENT_RECT.w / (r1_32.MOVABLE.PAR_MAX_X + 1 - r1_32.MOVABLE.PSIZE_X)
    local r6_32 = r3_32 - r2_32.DRAW_POS.x
    if r6_32 < 0 then
      r6_32 = 0
    end
    r4_32 = math.floor(r6_32 / r5_32)
    r1_32:bt_SetParamX(r4_32)
    return r4_32
  end
  g_Menu.Config.ptr.GaugeBarP2 = {}
  g_Menu.Config.ptr.GaugeBarP3 = {}
  function g_Menu.Config.ptr.GaugeBarCreate(r0_33, r1_33, r2_33, r3_33, r4_33, r5_33, r6_33)
    -- line: [1277, 1360] id: 33
    return {
      set = r1_33,
      key = r2_33,
      hit = r3_33,
      lay = r4_33,
      max = r5_33,
      ret = r6_33,
      param = -1,
      OnMouse = false,
      GaugeInit = function(r0_34)
        -- line: [1289, 1306] id: 34
        local r1_34 = cclass.lua_Layers:create()
        r1_34:initSubLayer(r0_34.set, r0_34.key, r0_34.hit, 1)
        r1_34:initSubLayer(r0_34.set, r0_34.key, r0_34.lay, 1)
        r1_34:setSubLayerParam(r0_34.set, r0_34.key, r0_34.hit, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_34:setSubLayerHitTest(r0_34.set, r0_34.key, r0_34.hit, 1, 0.01)
        local r2_34 = 0
        local r3_34 = 0
        local r4_34 = 0
        local r5_34 = 0
        r2_34, r3_34, r4_34, r5_34 = r1_34:getSubLayerParam(r0_34.set, r0_34.key, r0_34.lay, LUA_PARAM_POS, r2_34, r3_34, r4_34, r5_34)
        r0_34.Pos_x = r2_34
        r0_34.Pos_y = r3_34
        r2_34, r3_34, r4_34, r5_34 = r1_34:getSubLayerParam(r0_34.set, r0_34.key, r0_34.lay, LUA_PARAM_SIZE, r2_34, r3_34, r4_34, r5_34)
        r0_34.Size_w = r2_34
        r0_34.Size_h = r3_34
      end,
      GaugeSetParam = function(r0_35, r1_35)
        -- line: [1309, 1325] id: 35
        local r2_35 = false
        if r0_35.param ~= r1_35 then
          r2_35 = true
        end
        r0_35.param = r1_35
        local r3_35 = cclass.lua_Layers:create()
        if r0_35.param <= 0 then
          r3_35:setSubLayerParam(r0_35.set, r0_35.key, r0_35.lay, LUA_PARAM_COLOR, 1, 1, 1, 0)
        else
          r3_35:setSubLayerParam(r0_35.set, r0_35.key, r0_35.lay, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r3_35:setSubLayerParam(r0_35.set, r0_35.key, r0_35.lay, LUA_PARAM_RECT, 0, 0, r0_35.Size_w * r0_35.param / r0_35.max, r0_35.Size_h)
        end
        return r2_35
      end,
      GaugeMove = function(r0_36, r1_36, r2_36, r3_36, r4_36, r5_36)
        -- line: [1328, 1348] id: 36
        if r0_36.set == r1_36 and r2_36 == r0_36.key and r3_36 == r0_36.hit then
          local r6_36 = r4_36 - r0_36.Pos_x
          local r7_36 = r0_36.param
          if 0 <= r6_36 and r6_36 < r0_36.Size_w then
            r7_36 = r6_36 * r0_36.max / r0_36.Size_w
          elseif r6_36 < 0 then
            r7_36 = 0
          else
            r7_36 = r0_36.max
          end
          if r0_36:GaugeSetParam(r7_36) then
            return r0_36.ret
          else
            return -1
          end
        end
      end,
      GaugeOnCursor = function(r0_37, r1_37, r2_37, r3_37, r4_37, r5_37)
        -- line: [1351, 1357] id: 37
        if r0_37.set == r1_37 and r2_37 == r0_37.key and r3_37 == r0_37.hit then
          r0_37.OnMouse = true
        else
          r0_37.OnMouse = false
        end
      end,
    }
  end
  function g_Menu.Config.ptr.Page1_SetActive(r0_38)
    -- line: [1367, 1585] id: 38
    -- notice: unreachable block#68
    -- notice: unreachable block#66
    -- notice: unreachable block#67
    if g_screenMode == 0 then
      r0_38.ButtonP1.Window:bt_SetActive(0)
      r0_38.ButtonP1.FullScreen:bt_SetActive(4)
    else
      r0_38.ButtonP1.Window:bt_SetActive(4)
      r0_38.ButtonP1.FullScreen:bt_SetActive(0)
    end
    if g_zoomMode == 0 then
      r0_38.ButtonP1.LetterBox:bt_SetActive(4)
      r0_38.ButtonP1.FullSize:bt_SetActive(0)
      r0_38.ButtonP1.SideCut:bt_SetActive(0)
      r0_38.ButtonP1.Without:bt_SetActive(0)
    elseif g_zoomMode == 1 then
      r0_38.ButtonP1.LetterBox:bt_SetActive(0)
      r0_38.ButtonP1.FullSize:bt_SetActive(4)
      r0_38.ButtonP1.SideCut:bt_SetActive(0)
      r0_38.ButtonP1.Without:bt_SetActive(0)
    elseif g_zoomMode == 2 then
      r0_38.ButtonP1.LetterBox:bt_SetActive(0)
      r0_38.ButtonP1.FullSize:bt_SetActive(0)
      r0_38.ButtonP1.SideCut:bt_SetActive(4)
      r0_38.ButtonP1.Without:bt_SetActive(0)
    elseif g_zoomMode == 3 then
      r0_38.ButtonP1.LetterBox:bt_SetActive(0)
      r0_38.ButtonP1.FullSize:bt_SetActive(0)
      r0_38.ButtonP1.SideCut:bt_SetActive(0)
      r0_38.ButtonP1.Without:bt_SetActive(4)
    end
    if g_effectSpeed == 0 then
      r0_38.ButtonP1.EFF_Normal:bt_SetActive(4)
      r0_38.ButtonP1.EFF_Fast:bt_SetActive(0)
      r0_38.ButtonP1.EFF_None:bt_SetActive(0)
    elseif g_effectSpeed == 1 then
      r0_38.ButtonP1.EFF_Normal:bt_SetActive(0)
      r0_38.ButtonP1.EFF_Fast:bt_SetActive(4)
      r0_38.ButtonP1.EFF_None:bt_SetActive(0)
    elseif g_effectSpeed == 2 then
      r0_38.ButtonP1.EFF_Normal:bt_SetActive(0)
      r0_38.ButtonP1.EFF_Fast:bt_SetActive(0)
      r0_38.ButtonP1.EFF_None:bt_SetActive(4)
    end
    if g_mouseAutoMove == true then
      r0_38.ButtonP1.AutoCurOn:bt_SetActive(4)
      r0_38.ButtonP1.AutoCurOff:bt_SetActive(0)
    else
      r0_38.ButtonP1.AutoCurOn:bt_SetActive(0)
      r0_38.ButtonP1.AutoCurOff:bt_SetActive(4)
    end
    local r1_38 = cclass.lua_Layers:create()
    local r2_38 = ConfigGetPageKeyName(1)
    if g_hideCursor == 0 then
      r0_38.ButtonP1.EraseCur5:bt_SetActive(4)
      r0_38.ButtonP1.EraseCur30:bt_SetActive(0)
      if r0_38.ButtonP1.EraseCurOn == nil then
        r0_38.ButtonP1.EraseCurOff:bt_SetActive(0)
      end
    elseif g_hideCursor == 1 then
      r0_38.ButtonP1.EraseCur5:bt_SetActive(0)
      r0_38.ButtonP1.EraseCur30:bt_SetActive(4)
      if r0_38.ButtonP1.EraseCurOn == nil then
        r0_38.ButtonP1.EraseCurOff:bt_SetActive(0)
      end
    end
    if g_hideCursorOn == false then
      r0_38.ButtonP1.EraseCur5:bt_SetActive(0)
      r0_38.ButtonP1.EraseCur30:bt_SetActive(0)
      r0_38.ButtonP1.EraseCurOff:bt_SetActive(4)
    end
    if r0_38.ButtonP1.EraseCurOn ~= nil then
      if g_hideCursorOn == true then
        r0_38.ButtonP1.EraseCurOn:bt_SetActive(4)
        r0_38.ButtonP1.EraseCurOff:bt_SetActive(0)
      else
        r0_38.ButtonP1.EraseCurOn:bt_SetActive(0)
        r0_38.ButtonP1.EraseCurOff:bt_SetActive(4)
      end
    end
    if g_drawSkipIcon == true then
      r0_38.ButtonP1.SkipIconOn:bt_SetActive(4)
      r0_38.ButtonP1.SkipIconOff:bt_SetActive(0)
    else
      r0_38.ButtonP1.SkipIconOn:bt_SetActive(0)
      r0_38.ButtonP1.SkipIconOff:bt_SetActive(4)
    end
    if g_skipConfirm == false then
      r0_38.ButtonP1.ConfMsgOn:bt_SetActive(4)
      r0_38.ButtonP1.ConfMsgOff:bt_SetActive(0)
    else
      r0_38.ButtonP1.ConfMsgOn:bt_SetActive(0)
      r0_38.ButtonP1.ConfMsgOff:bt_SetActive(4)
    end
    if g_deactiveMode == true then
      r0_38.ButtonP1.DeactiveOn:bt_SetActive(4)
      r0_38.ButtonP1.DeactiveOff:bt_SetActive(0)
    else
      r0_38.ButtonP1.DeactiveOn:bt_SetActive(0)
      r0_38.ButtonP1.DeactiveOff:bt_SetActive(4)
    end
    if r0_38.ButtonP1.MouseRClose ~= nil then
      if g_MouseRButton == 0 then
        r0_38.ButtonP1.MouseRClose:bt_SetActive(4)
        r0_38.ButtonP1.MouseRConfig:bt_SetActive(0)
        r0_38.ButtonP1.MouseRSave:bt_SetActive(0)
        r0_38.ButtonP1.MouseRLoad:bt_SetActive(0)
      elseif g_MouseRButton == 1 then
        r0_38.ButtonP1.MouseRClose:bt_SetActive(0)
        r0_38.ButtonP1.MouseRConfig:bt_SetActive(4)
        r0_38.ButtonP1.MouseRSave:bt_SetActive(0)
        r0_38.ButtonP1.MouseRLoad:bt_SetActive(0)
      elseif g_MouseRButton == 2 then
        r0_38.ButtonP1.MouseRClose:bt_SetActive(0)
        r0_38.ButtonP1.MouseRConfig:bt_SetActive(0)
        r0_38.ButtonP1.MouseRSave:bt_SetActive(4)
        r0_38.ButtonP1.MouseRLoad:bt_SetActive(0)
      elseif g_MouseRButton == 3 then
        r0_38.ButtonP1.MouseRClose:bt_SetActive(0)
        r0_38.ButtonP1.MouseRConfig:bt_SetActive(0)
        r0_38.ButtonP1.MouseRSave:bt_SetActive(0)
        r0_38.ButtonP1.MouseRLoad:bt_SetActive(4)
      end
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
        r0_38.ButtonP1.MouseRLoad:bt_SetActive(2)
      end
    end
    if g_CASTOFF then
      local r3_38 = cfunc.LegacyGame__lua_GetVariable(200)
      if r3_38 == 0 then
        r0_38.ButtonP1.CastOn:bt_SetActive(4)
        r0_38.ButtonP1.CastOff:bt_SetActive(0)
        r0_38.ButtonP1.CastOffEx:bt_SetActive(0)
      end
      if r3_38 == 1 then
        r0_38.ButtonP1.CastOn:bt_SetActive(0)
        r0_38.ButtonP1.CastOff:bt_SetActive(4)
        r0_38.ButtonP1.CastOffEx:bt_SetActive(0)
      end
      if r3_38 == 2 then
        r0_38.ButtonP1.CastOn:bt_SetActive(0)
        r0_38.ButtonP1.CastOff:bt_SetActive(0)
        r0_38.ButtonP1.CastOffEx:bt_SetActive(4)
      end
    end
    if r0_38.ButtonP1.MswNormal ~= nil then
      if g_messageWindowType == 0 then
        r0_38.ButtonP1.MswNormal:bt_SetActive(4)
        r0_38.ButtonP1.MswSimple:bt_SetActive(0)
      else
        r0_38.ButtonP1.MswNormal:bt_SetActive(0)
        r0_38.ButtonP1.MswSimple:bt_SetActive(4)
      end
    end
    if getLangPatchFlag() then
    end
    r0_38:ActiveCheckItemP1()
  end
  function g_Menu.Config.ptr.P1_ButtonJobLD(r0_39, r1_39, r2_39, r3_39, r4_39)
    -- line: [1588, 1589] id: 39
  end
  function g_Menu.Config.ptr.P1_ButtonJobLU(r0_40, r1_40, r2_40, r3_40, r4_40)
    -- line: [1590, 1769] id: 40
    if r1_40 == 101 and g_screenMode == 0 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SCREENMODE, 0)
    elseif r1_40 == 102 and g_screenMode == 1 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SCREENMODE, 0)
    end
    if r1_40 == 103 then
      g_zoomMode = 1
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, g_zoomMode)
    elseif r1_40 == 104 then
      g_zoomMode = 0
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, g_zoomMode)
    elseif r1_40 == 105 then
      g_zoomMode = 2
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, g_zoomMode)
    elseif r1_40 == 106 then
      g_zoomMode = 3
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, g_zoomMode)
    end
    if r1_40 == 109 then
      g_effectSpeed = 0
    elseif r1_40 == 110 then
      g_effectSpeed = 1
    elseif r1_40 == 111 then
      g_effectSpeed = 2
    end
    if r1_40 == 112 then
      g_mouseAutoMove = true
    elseif r1_40 == 113 then
      g_mouseAutoMove = false
    end
    if r1_40 == 127 then
      g_hideCursor = 0
      if r0_40.ButtonP1.EraseCurOn == nil then
        g_hideCursorOn = true
      end
    elseif r1_40 == 128 then
      g_hideCursor = 1
      if r0_40.ButtonP1.EraseCurOn == nil then
        g_hideCursorOn = true
      end
    elseif r1_40 == 129 then
      g_hideCursor = 2
      if r0_40.ButtonP1.EraseCurOn == nil then
        g_hideCursorOn = false
      end
    end
    if r1_40 == 115 then
      g_hideCursorOn = true
    elseif r1_40 == 116 then
      g_hideCursorOn = false
    end
    if r1_40 == 117 then
      g_drawSkipIcon = true
    elseif r1_40 == 118 then
      g_drawSkipIcon = false
    end
    if r1_40 == 119 then
      g_skipConfirm = false
    elseif r1_40 == 120 then
      g_skipConfirm = true
    end
    if r1_40 == 121 then
      g_deactiveMode = true
    elseif r1_40 == 122 then
      g_deactiveMode = false
    end
    if getLangPatchFlag() then
      if r1_40 == 133 and g_altLanguage == true then
        g_altLanguage = false
        changeLanguage()
      end
      if r1_40 == 134 and g_altLanguage == false then
        g_altLanguage = true
        changeLanguage()
      end
    end
    if r1_40 == 123 then
      g_MouseRButton = 0
    elseif r1_40 == 124 then
      g_MouseRButton = 1
    elseif r1_40 == 125 then
      g_MouseRButton = 2
    elseif r1_40 == 126 then
      g_MouseRButton = 3
    end
    if r1_40 == 130 then
      cfunc.LegacyGame__lua_SetVariable(200, 0)
      if g_menuExecute == false then
        local r5_40 = cclass.lua_Layers:create()
        cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        r5_40:setForceBG(true)
        g_P1Renew = 3
      end
    end
    if r1_40 == 131 then
      cfunc.LegacyGame__lua_SetVariable(200, 1)
      if g_menuExecute == false then
        local r5_40 = cclass.lua_Layers:create()
        cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        r5_40:setForceBG(true)
        g_P1Renew = 3
      end
    end
    if r1_40 == 132 then
      cfunc.LegacyGame__lua_SetVariable(200, 2)
      if g_menuExecute == false then
        local r5_40 = cclass.lua_Layers:create()
        cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        r5_40:setForceBG(true)
        g_P1Renew = 3
      end
    end
    if r1_40 == 140 then
      g_messageWindowType = 0
      changeMessageWindow(-1, true)
      if g_menuExecute == false then
        local r5_40 = cclass.lua_Layers:create()
        if g_CASTOFF then
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        end
        r5_40:setForceBG(true)
        g_P1Renew = 3
      end
    elseif r1_40 == 141 then
      g_messageWindowType = 1
      changeMessageWindow(-1, true)
      if g_menuExecute == false then
        local r5_40 = cclass.lua_Layers:create()
        if g_CASTOFF then
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        end
        r5_40:setForceBG(true)
        g_P1Renew = 3
      end
    end
    if 101 <= r1_40 and r1_40 <= 200 then
      r0_40:updatePreviewSize(ConfigGetPageKeyName(g_configPage))
      r0_40:Page1_SetActive()
    end
  end
  function g_Menu.Config.ptr.InitPreview(r0_41, r1_41)
    -- line: [1772, 1910] id: 41
    -- notice: unreachable block#23
    -- notice: unreachable block#32
    -- notice: unreachable block#17
    -- notice: unreachable block#16
    -- notice: unreachable block#18
    -- notice: unreachable block#26
    -- notice: unreachable block#41
    -- notice: unreachable block#19
    -- notice: unreachable block#34
    -- notice: unreachable block#35
    -- notice: unreachable block#36
    -- notice: unreachable block#22
    -- notice: unreachable block#37
    -- notice: unreachable block#15
    -- notice: unreachable block#11
    -- notice: unreachable block#30
    -- notice: unreachable block#31
    -- notice: unreachable block#12
    -- notice: unreachable block#20
    -- notice: unreachable block#38
    -- notice: unreachable block#14
    -- notice: unreachable block#28
    -- notice: unreachable block#39
    -- notice: unreachable block#25
    -- notice: unreachable block#27
    -- notice: unreachable block#13
    -- notice: unreachable block#40
    -- notice: unreachable block#24
    -- notice: unreachable block#21
    -- notice: unreachable block#29
    -- notice: unreachable block#33
    local r2_41 = cclass.lua_Layers:create()
    r2_41:initSubLayer("configBase", r1_41, r0_41.initConfigP1_BBase, 1)
    local r3_41 = 0
    local r4_41 = 0
    r3_41, r4_41, r5_41, r6_41 = r2_41:getScreenAspect(r3_41, r4_41, 0, 0)
    local r7_41 = 0
    local r8_41 = 0
    r7_41, r8_41, r9_41, r10_41 = r2_41:getSubLayerParam("configBase", r1_41, r0_41.initConfigP1_BBase, LUA_PARAM_SIZE, r7_41, r8_41, 0, 0)
    if r3_41 ~= 16 or r4_41 ~= 9 then
      r2_41:setSubLayerParam("configBase", r1_41, r0_41.initConfigP1_BBase, LUA_PARAM_SCALE, 1, r7_41 / r3_41 * r4_41 / r8_41, 1, 0)
    end
    r0_41.PreviewList = {}
    if g_menuExecute == false then
      r2_41:insertPreviewLayer("configBase", "preview1", r7_41, r8_41, 1)
      r0_41.PreviewList[1] = "preview1"
    else
      if g_TrialFlag == 0 then
        if r0_41.CompFlag == false then
          r2_41:insertPNARefLayer("configBase", "preview1", r1_41, 2, 1)
          r0_41.PreviewList[1] = "preview1"
        else
          r2_41:insertPNARefLayer("configBase", "preview1", r1_41, 4, 1)
          r0_41.PreviewList[1] = "preview1"
        end
      end
      if g_TrialFlag == 1 then
        r2_41:insertPNARefLayer("configBase", "preview1", r1_41, 3, 1)
        r0_41.PreviewList[1] = "preview1"
      end
    end
    local r11_41 = 0
    local r12_41 = 0
    local r13_41 = 0
    local r14_41 = 0
    r11_41, r12_41, r13_41, r14_41 = r2_41:getSubLayerParam("configBase", r1_41, r0_41.initConfigP1_BBase, LUA_PARAM_POS, r11_41, r12_41, r13_41, r14_41)
    for r18_41, r19_41 in pairs(r0_41.PreviewList) do
      r2_41:setParam("configBase", r19_41, LUA_PARAM_POS, r11_41, r12_41, r13_41, r14_41)
    end
  end
  function g_Menu.Config.ptr.P1MenuInit(r0_42, r1_42)
    -- line: [1913, 2131] id: 42
    local r2_42 = cclass.lua_Layers:create()
    r2_42:initSubLayer("configBase", r1_42, 143, 1)
    r2_42:initSubLayer("configBase", r1_42, 2, 0)
    r2_42:initSubLayer("configBase", r1_42, 3, 0)
    r2_42:initSubLayer("configBase", r1_42, 4, 0)
    r2_42:initSubLayer("configBase", r1_42, r0_42.initConfigP1_BBase, 1)
    if g_CASTOFF then
    end
    r0_42.ButtonP1 = {}
    r0_42:MenuButtonSet(r0_42.ButtonP1, "Window", 1, r1_42, 35, 35, 63, 91, -1, 101, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "FullScreen", 1, r1_42, 36, 36, 64, 92, -1, 102, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "FullSize", 1, r1_42, 37, 37, 65, 93, -1, 103, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "LetterBox", 1, r1_42, 38, 38, 66, 94, -1, 104, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "SideCut", 1, r1_42, 39, 39, 67, 95, -1, 105, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "Without", 1, r1_42, 40, 40, 68, 96, -1, 106, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "MswNormal", 1, r1_42, 41, 41, 69, 97, -1, 140, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "MswSimple", 1, r1_42, 42, 42, 70, 98, -1, 141, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "EFF_Normal", 1, r1_42, 43, 43, 71, 99, -1, 109, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "EFF_Fast", 1, r1_42, 44, 44, 72, 100, -1, 110, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "EFF_None", 1, r1_42, 45, 45, 73, 101, -1, 111, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "SkipIconOn", 1, r1_42, 46, 46, 74, 102, -1, 117, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "SkipIconOff", 1, r1_42, 47, 47, 75, 103, -1, 118, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "AutoCurOn", 1, r1_42, 48, 48, 76, 104, -1, 112, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "AutoCurOff", 1, r1_42, 49, 49, 77, 105, -1, 113, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "ConfMsgOn", 1, r1_42, 50, 50, 78, 106, -1, 119, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "ConfMsgOff", 1, r1_42, 51, 51, 79, 107, -1, 120, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "EraseCur5", 1, r1_42, 52, 52, 80, 108, -1, 127, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "EraseCur30", 1, r1_42, 53, 53, 81, 109, -1, 128, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "EraseCurOff", 1, r1_42, 54, 54, 82, 110, -1, 116, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "DeactiveOn", 1, r1_42, 55, 55, 83, 111, -1, 121, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "DeactiveOff", 1, r1_42, 56, 56, 84, 112, -1, 122, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "MouseRConfig", 1, r1_42, 57, 57, 85, 113, -1, 124, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "MouseRSave", 1, r1_42, 58, 58, 86, 114, -1, 125, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "MouseRLoad", 1, r1_42, 59, 59, 87, 115, 119, 126, 0, 0)
    r0_42:MenuButtonSet(r0_42.ButtonP1, "MouseRClose", 1, r1_42, 60, 60, 88, 116, -1, 123, 0, 0)
    if g_CASTOFF then
      r0_42:MenuButtonSet(r0_42.ButtonP1, "CastOn", 1, r1_42, 15, 15, 10, 5, -1, 130, 0, 0)
      r0_42:MenuButtonSet(r0_42.ButtonP1, "CastOffEx", 1, r1_42, 14, 14, 9, 4, -1, 132, 0, 0)
      r0_42:MenuButtonSet(r0_42.ButtonP1, "CastOff", 1, r1_42, 13, 13, 8, 3, -1, 131, 0, 0)
    end
    if getLangPatchFlag() then
    end
    r0_42.MenuButton:InitList()
    r0_42.MenuButton:SetList("ButtonP1", r0_42.ButtonP1)
    r0_42.MenuButton:InitButton()
    r0_42.ItemP1 = r0_42:ItemSetInit()
    r0_42.ItemP1.WindowMode = MenuItem.new("configBase", r1_42, 9, 21)
    r0_42.ItemP1.WideScreen = MenuItem.new("configBase", r1_42, 10, 22)
    r0_42.ItemP1.MswType = MenuItem.new("configBase", r1_42, 11, 23)
    r0_42.ItemP1.Effect = MenuItem.new("configBase", r1_42, 12, 24)
    r0_42.ItemP1.SkipIcon = MenuItem.new("configBase", r1_42, 13, 25)
    r0_42.ItemP1.AutoCursor = MenuItem.new("configBase", r1_42, 14, 26)
    r0_42.ItemP1.ConfMsg = MenuItem.new("configBase", r1_42, 15, 27)
    r0_42.ItemP1.EraseCursor = MenuItem.new("configBase", r1_42, 16, 28)
    r0_42.ItemP1.Deactive = MenuItem.new("configBase", r1_42, 17, 29)
    r0_42.ItemP1.RClick = MenuItem.new("configBase", r1_42, 18, 30)
    r0_42.ItemP1.Headline_WindowMode = "WindowMode"
    r0_42.ItemP1.Headline_WideScreen = "WideScreen"
    r0_42.ItemP1.Headline_MswType = "MswType"
    r0_42.ItemP1.Headline_Effect = "Effect"
    r0_42.ItemP1.Headline_AutoCursor = "AutoCursor"
    r0_42.ItemP1.Headline_EraseCursor = "EraseCursor"
    r0_42.ItemP1.Headline_RClick = "RClick"
    r0_42.ItemP1.Headline_SkipIcon = "SkipIcon"
    r0_42.ItemP1.Headline_ConfMsg = "ConfMsg"
    r0_42.ItemP1.Headline_Deactive = "Deactive"
    r0_42.ItemP1.Headline_CastOff = -1
    r0_42.ItemP1.expWindowModeWin = MenuItem.new("configBase", r1_42, -1, 140)
    r0_42.ItemP1.expWindowModeFull = MenuItem.new("configBase", r1_42, -1, 139)
    r0_42.ItemP1.expWideScreenFull = MenuItem.new("configBase", r1_42, -1, 138)
    r0_42.ItemP1.expWideScreenLett = MenuItem.new("configBase", r1_42, -1, 137)
    r0_42.ItemP1.expWideScreenSCut = MenuItem.new("configBase", r1_42, -1, 136)
    r0_42.ItemP1.expWideScreenNone = MenuItem.new("configBase", r1_42, -1, 135)
    r0_42.ItemP1.expMswNormal = MenuItem.new("configBase", r1_42, -1, 134)
    r0_42.ItemP1.expMswSimple = MenuItem.new("configBase", r1_42, -1, 133)
    r0_42.ItemP1.expEffectNomal = MenuItem.new("configBase", r1_42, -1, 132)
    r0_42.ItemP1.expEffectQuick = MenuItem.new("configBase", r1_42, -1, 131)
    r0_42.ItemP1.expEffectOff = MenuItem.new("configBase", r1_42, -1, 130)
    r0_42.ItemP1.expSkipIconOn = MenuItem.new("configBase", r1_42, -1, 129)
    r0_42.ItemP1.expAutoCursorOn = MenuItem.new("configBase", r1_42, -1, 128)
    r0_42.ItemP1.expConfMsgOn = MenuItem.new("configBase", r1_42, -1, 127)
    r0_42.ItemP1.expEraseCursor = MenuItem.new("configBase", r1_42, -1, 126)
    r0_42.ItemP1.expDeactive = -1
    r0_42.ItemP1.expDeactiveOn = MenuItem.new("configBase", r1_42, -1, 125)
    r0_42.ItemP1.expDeactiveOff = MenuItem.new("configBase", r1_42, -1, 124)
    r0_42.ItemP1.expMouseR = MenuItem.new("configBase", r1_42, -1, 123)
    if g_CASTOFF then
      r0_42.ItemP1.expCastOff = MenuItem.new("configBase", r1_42, -1, 3)
      r0_42.ItemP1.expCastOn = MenuItem.new("configBase", r1_42, -1, 4)
    end
  end
  g_Menu.Config.ptr.initConfigP1_BBase = 5
  g_Menu.Config.ptr.hiyakeflag = true
  g_Menu.Config.ptr.PreviewList = {}
  function g_Menu.Config.ptr.initConfigP1(r0_43, r1_43, r2_43)
    -- line: [2136, 2146] id: 43
    local r3_43 = cclass.lua_Layers:create()
    if r2_43 == true then
      r0_43:P1MenuInit(r1_43)
      r0_43:InitPreview(r1_43)
    end
    r0_43:updatePreviewSize(r1_43)
    r0_43:Page1_SetActive()
  end
  function g_Menu.Config.ptr.OnCursorCheckItemP1(r0_44, r1_44)
    -- line: [2150, 2151] id: 44
  end
  function g_Menu.Config.ptr.ActiveCheckItemP1(r0_45)
    -- line: [2154, 2157] id: 45
    r0_45:OnCursorCheckItemP1(-1)
  end
  function g_Menu.Config.ptr.SelCursorP1(r0_46, r1_46, r2_46, r3_46)
    -- line: [2161, 2325] id: 46
    if r1_46 == -1 or r0_46.ItemP1.selCursor_selName ~= r1_46 then
      r0_46:ItemSet(r0_46.ItemP1, -1, -1, -1, -1, -1)
    end
    if r1_46 == "Window" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_WindowMode, -1, -1, "expWindowModeWin")
    end
    if r1_46 == "FullScreen" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_WindowMode, -1, -1, "expWindowModeFull")
    end
    if r1_46 == "FullSize" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_WideScreen, -1, -1, "expWideScreenFull")
    end
    if r1_46 == "LetterBox" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_WideScreen, -1, -1, "expWideScreenLett")
    end
    if r1_46 == "SideCut" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_WideScreen, -1, -1, "expWideScreenSCut")
    end
    if r1_46 == "Without" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_WideScreen, -1, -1, "expWideScreenNone")
    end
    if r1_46 == "MswNormal" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_MswType, -1, -1, "expMswNormal")
    end
    if r1_46 == "MswSimple" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_MswType, -1, -1, "expMswSimple")
    end
    if r1_46 == "EFF_Normal" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_Effect, -1, -1, "expEffectNomal")
    end
    if r1_46 == "EFF_Fast" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_Effect, -1, -1, "expEffectQuick")
    end
    if r1_46 == "EFF_None" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_Effect, -1, -1, "expEffectOff")
    end
    if "AutoCurOn" == r1_46 or "AutoCurOff" == r1_46 then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_AutoCursor, -1, -1, "expAutoCursorOn")
    end
    if r0_46.ItemP1.expEraseCursorTime ~= nil and r0_46.ItemP1.expEraseCursorTime ~= -1 then
      if "EraseCur5" == r1_46 or "EraseCur30" == r1_46 or "EraseCur5Off" == r1_46 or "EraseCur30Off" == r1_46 then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_EraseCursor, -1, -1, "expEraseCursorTime")
      end
      if "EraseCurOn" == r1_46 or "EraseCurOff" == r1_46 then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_EraseCursor, -1, -1, "expEraseCursor")
      end
    elseif "EraseCur5" == r1_46 or "EraseCur30" == r1_46 or "EraseCurOn" == r1_46 or "EraseCurOff" == r1_46 or "EraseCur5Off" == r1_46 or "EraseCur30Off" == r1_46 then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_EraseCursor, -1, -1, "expEraseCursor")
    end
    if "SkipIconOn" == r1_46 or "SkipIconOff" == r1_46 then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_SkipIcon, -1, -1, "expSkipIconOn")
    end
    if "ConfMsgOn" == r1_46 or "ConfMsgOff" == r1_46 then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_ConfMsg, -1, -1, "expConfMsgOn")
    end
    if r1_46 == "DeactiveOn" then
      if r0_46.ItemP1.expDeactiveOn == -1 then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_Deactive, -1, -1, "expDeactive")
      else
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_Deactive, -1, -1, "expDeactiveOn")
      end
    end
    if r1_46 == "DeactiveOff" then
      if r0_46.ItemP1.expDeactiveOff == -1 then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_Deactive, -1, -1, "expDeactive")
      else
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_Deactive, -1, -1, "expDeactiveOff")
      end
    end
    if r1_46 == "MouseRClose" then
      if r0_46.ItemP1.expMouseR == -1 then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseRClose")
      else
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseR")
      end
    end
    if r1_46 == "MouseRConfig" then
      if r0_46.ItemP1.expMouseR == -1 then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseRConfig")
      else
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseR")
      end
    end
    if r1_46 == "MouseRSave" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseR")
    end
    if r1_46 == "MouseRLoad" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseR")
    end
    if r1_46 == "MouseRBLog" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseR")
    end
    if r1_46 == "MouseRMin" then
      r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseR")
    end
    if r0_46.ItemP1.expCastOffJob ~= nil and r0_46.ItemP1.expCastOffJob ~= -1 then
      if "CastOn" == r1_46 or "CastOff" == r1_46 or "CastOffEx" == r1_46 then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_CastOff, -1, -1, "expCastOffJob")
      end
    else
      if r1_46 == "CastOn" then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_CastOff, -1, -1, "expCastOn")
      end
      if r1_46 == "CastOff" then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_CastOff, -1, -1, "expCastOff")
      end
      if r1_46 == "CastOffEx" then
        r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_CastOff, -1, -1, "expCastOffEx")
      end
    end
    r0_46:OnCursorCheckItemP1(r1_46)
    -- warn: not visited block [71, 77, 83, 89]
    -- block#71:
    -- r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseRSave")
    -- goto label_367
    -- block#77:
    -- r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseRLoad")
    -- goto label_400
    -- block#83:
    -- r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseRBLog")
    -- goto label_433
    -- block#89:
    -- r0_46:ItemSet(r0_46.ItemP1, r1_46, r0_46.ItemP1.Headline_RClick, -1, -1, "expMouseRMin")
    -- goto label_466
  end
  function g_Menu.Config.ptr.effectCfg1Preview(r0_47, r1_47, r2_47, r3_47, r4_47, r5_47)
    -- line: [2328, 2363] id: 47
    local r6_47 = cclass.lua_Layers:create()
    local r7_47 = getEffectRate()
    for r11_47, r12_47 in pairs(r0_47.PreviewList) do
      if r12_47 ~= nil and r1_47 ~= true then
        if r0_47.PageSlide then
          if r4_47 == false then
            local r13_47 = 0
            local r14_47 = 0
            local r15_47 = 0
            local r16_47 = 0
            r13_47, r14_47, r15_47, r16_47 = r6_47:getParam("configBase", r12_47, LUA_PARAM_POS, r13_47, r14_47, r15_47, r16_47)
            r6_47:setParam("configBase", r12_47, LUA_PARAM_POS, r13_47 - r2_47, r14_47, r15_47, r16_47)
            r6_47:setParam("configBase", r12_47, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r6_47:setEffect("configBase", r12_47, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_47, 0, r5_47)
          else
            r6_47:setEffect("configBase", r12_47, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_47, 0, r5_47)
          end
          r6_47:setEffect("configBase", r12_47, "ConfigPage", LUA_EFFECT_POS, r2_47, 0, 0, 0, 2, r3_47, 0, r5_47)
        elseif r4_47 == false then
          r6_47:setParam("configBase", r12_47, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_47:setEffect("configBase", r12_47, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_47, 0, r5_47)
        else
          r6_47:setEffect("configBase", r12_47, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_47, 0, r5_47)
        end
        r6_47:startEffect("configBase", r12_47, "ConfigPage", 0)
      end
    end
  end
  function g_Menu.Config.ptr.updatePreviewSize(r0_48, r1_48)
    -- line: [2366, 2409] id: 48
    local r2_48 = cclass.lua_Layers:create()
    local r3_48 = 0
    local r4_48 = 0
    local r5_48 = 0
    r3_48, r4_48, r5_48, r6_48 = r2_48:getScreenAspect(r3_48, r4_48, r5_48, 0)
    local r7_48 = 0
    local r8_48 = 0
    r7_48, r8_48, r9_48, r10_48 = r2_48:getSubLayerParam("configBase", r1_48, r0_48.initConfigP1_BBase, LUA_PARAM_SIZE, r7_48, r8_48, 0, 0)
    for r14_48, r15_48 in pairs(r0_48.PreviewList) do
      if r15_48 ~= nil then
        if g_zoomMode == 3 then
          local r16_48 = APP_INTERNAL_WIDTH / r5_48
          r2_48:setParam("configBase", r15_48, LUA_PARAM_SCALE, r16_48, r16_48, 1, 0)
          r2_48:setParam("configBase", r15_48, LUA_PARAM_RECT, 0, 0, r7_48, r8_48)
        elseif r3_48 ~= 16 or r4_48 ~= 9 then
          if g_zoomMode == 0 then
            r2_48:setParam("configBase", r15_48, LUA_PARAM_SCALE, 1, 1, 1, 0)
            r2_48:setParam("configBase", r15_48, LUA_PARAM_RECT, 0, 0, r7_48, r8_48)
          elseif g_zoomMode == 1 then
            r2_48:setParam("configBase", r15_48, LUA_PARAM_SCALE, 1, r7_48 / r3_48 * r4_48 / r8_48, 1, 0)
            r2_48:setParam("configBase", r15_48, LUA_PARAM_RECT, 0, 0, r7_48, r8_48)
          elseif g_zoomMode == 2 then
            local r16_48 = r7_48 / r3_48 * r4_48 / r8_48
            r2_48:setParam("configBase", r15_48, LUA_PARAM_SCALE, r16_48, r16_48, 1, 0)
            local r17_48 = (r7_48 * r16_48 - r7_48) * 1 / r16_48
            r2_48:setParam("configBase", r15_48, LUA_PARAM_RECT, r17_48 / 2, 0, r7_48 - r17_48, r8_48)
          end
        else
          r2_48:setParam("configBase", r15_48, LUA_PARAM_SCALE, 1, 1, 1, 0)
          r2_48:setParam("configBase", r15_48, LUA_PARAM_RECT, 0, 0, r7_48, r8_48)
        end
      end
    end
  end
  function g_Menu.Config.ptr.Page2_SetActive(r0_49)
    -- line: [2415, 2479] id: 49
    if g_allskip == false then
      r0_49.ButtonP2.SkipRead:bt_SetActive(4)
      r0_49.ButtonP2.SkipAll:bt_SetActive(0)
    else
      r0_49.ButtonP2.SkipRead:bt_SetActive(0)
      r0_49.ButtonP2.SkipAll:bt_SetActive(4)
    end
    local r1_49 = cclass.lua_Layers:create()
    local r2_49 = ConfigGetPageKeyName(2)
    if g_selectReleaseSkip == true then
      r0_49.ButtonP2.SkipOptOn:bt_SetActive(4)
      if r0_49.ButtonP2.SkipOptOff ~= nil then
        r0_49.ButtonP2.SkipOptOff:bt_SetActive(0)
      end
    else
      r0_49.ButtonP2.SkipOptOn:bt_SetActive(0)
      if r0_49.ButtonP2.SkipOptOff ~= nil then
        r0_49.ButtonP2.SkipOptOff:bt_SetActive(4)
      end
    end
    if g_selectReleaseAuto == true then
      r0_49.ButtonP2.AutoOptOn:bt_SetActive(4)
      if r0_49.ButtonP2.AutoOptOff ~= nil then
        r0_49.ButtonP2.AutoOptOff:bt_SetActive(0)
      end
    else
      r0_49.ButtonP2.AutoOptOn:bt_SetActive(0)
      if r0_49.ButtonP2.AutoOptOff ~= nil then
        r0_49.ButtonP2.AutoOptOff:bt_SetActive(4)
      end
    end
    if r0_49.ButtonP2.ReadColorOn ~= nil then
      if g_ReadColorChange == true then
        r0_49.ButtonP2.ReadColorOn:bt_SetActive(4)
        r0_49.ButtonP2.ReadColorOff:bt_SetActive(0)
      else
        r0_49.ButtonP2.ReadColorOn:bt_SetActive(0)
        r0_49.ButtonP2.ReadColorOff:bt_SetActive(4)
      end
    end
    r0_49.ButtonP2.SL_MsgSpeed:bt_SetParamX(g_msgspeed)
    r0_49.ButtonP2.SL_OpaWin:bt_SetParamX(g_messagealpha)
    r0_49.ButtonP2.SL_AutoSpeed:bt_SetParamX(g_autospeed)
    r0_49:SetSlideActP2(r0_49.MenuButton.selCursor)
  end
  function g_Menu.Config.ptr.P2_GaugeJob(r0_50, r1_50, r2_50, r3_50, r4_50, r5_50)
    -- line: [2482, 2510] id: 50
    for r9_50, r10_50 in pairs(r0_50.GaugeBarP2) do
      local r11_50 = r10_50:GaugeMove(r1_50, r2_50, r3_50, r4_50, r5_50)
      if r11_50 == 1 then
        g_msgspeed = r0_50.GaugeBarP2.SL_MsgSpeed.param
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEMSGSPEED, 0)
        startCfg2Preview()
      end
      if r11_50 == 2 then
        g_messagealpha = r0_50.GaugeBarP2.SL_OpaWin.param
        r0_50:setCfg2WindowAlpa()
        if g_MenuMsgWin ~= nil then
          g_MenuMsgWin:changeMessageWindowOpacity()
        end
        if g_menuExecute == false then
          local r12_50 = cclass.lua_Layers:create()
          if g_CASTOFF then
            cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
          end
          r12_50:setForceBG(true)
          g_P1Renew = 3
        end
      end
      if r11_50 == 3 then
        g_autospeed = r0_50.GaugeBarP2.SL_AutoSpeed.param
      end
    end
  end
  function g_Menu.Config.ptr.P2_ButtonRepeatLD(r0_51, r1_51, r2_51, r3_51, r4_51, r5_51, r6_51, r7_51)
    -- line: [2513, 2516] id: 51
    r0_51:P2_GaugeJob(r3_51, r4_51, r5_51, r6_51, r7_51)
  end
  function g_Menu.Config.ptr.P2_ButtonJobLD(r0_52, r1_52, r2_52, r3_52, r4_52)
    -- line: [2519, 2536] id: 52
    -- notice: unreachable block#4
    -- notice: unreachable block#5
    -- notice: unreachable block#2
    -- notice: unreachable block#3
    -- notice: unreachable block#6
    -- notice: unreachable block#7
    if g_configPage == 2 then
      r0_52.SliderMoveNo = 299
    end
  end
  function g_Menu.Config.ptr.P2_ButtonJobLU(r0_53, r1_53, r2_53, r3_53, r4_53)
    -- line: [2537, 2660] id: 53
    if r0_53.SliderMoveNo == 207 then
      g_msgspeed = r0_53.ButtonP2.SL_MsgSpeed:bt_GetParamX()
      if g_msgspeed > 100 then
        g_msgspeed = 100
      end
      r0_53.ButtonP2.SL_MsgSpeed:bt_SetParamX(g_msgspeed)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEMSGSPEED, 0)
      startCfg2Preview()
    end
    if r0_53.SliderMoveNo == 209 then
      g_messagealpha = r0_53.ButtonP2.SL_OpaWin:bt_GetParamX()
      r0_53.ButtonP2.SL_OpaWin:bt_SetParamX(g_messagealpha)
      r0_53:setCfg2WindowAlpa()
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin:changeMessageWindowOpacity()
      end
      if g_menuExecute == false then
        local r5_53 = cclass.lua_Layers:create()
        if g_CASTOFF then
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        end
        r5_53:setForceBG(true)
        g_P1Renew = 3
      end
    end
    if r0_53.SliderMoveNo == 211 then
      g_autospeed = r0_53.ButtonP2.SL_AutoSpeed:bt_GetParamX()
      r0_53.ButtonP2.SL_AutoSpeed:bt_SetParamX(g_autospeed)
    end
    if r1_53 == 201 then
      g_allskip = false
    end
    if r1_53 == 202 then
      g_allskip = true
    end
    if r1_53 == 203 then
      if r0_53.ButtonP2.SkipOptOff == nil then
        local r5_53 = g_selectReleaseSkip ~= true
      else
        g_selectReleaseSkip = true
      end
    end
    if r1_53 == 204 and r0_53.ButtonP2.SkipOptOff ~= nil then
      g_selectReleaseSkip = false
    end
    if r1_53 == 205 then
      if r0_53.ButtonP2.AutoOptOff == nil then
        local r5_53 = g_selectReleaseAuto ~= true
      else
        g_selectReleaseAuto = true
      end
    end
    if r1_53 == 206 and r0_53.ButtonP2.AutoOptOff ~= nil then
      g_selectReleaseAuto = false
    end
    if r1_53 == 213 then
      g_ReadColorChange = true
    end
    if r1_53 == 214 then
      g_ReadColorChange = false
    end
    if 201 <= r1_53 and r1_53 <= 300 or 201 <= r0_53.SliderMoveNo and r0_53.SliderMoveNo <= 300 then
      r0_53:Page2_SetActive()
      r0_53.SliderMoveNo = -1
      r0_53:DeleteConfigNo()
    end
    if r1_53 == 208 then
      local r5_53 = r0_53:MoveSliderBack(r0_53.ButtonP2.SL_MsgSpeed, r0_53.ButtonP2.SL_MsgSpeedBk, r3_53)
      g_msgspeed = r0_53.ButtonP2.SL_MsgSpeed:bt_GetParamX()
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEMSGSPEED, 0)
      startCfg2Preview()
    end
    if r1_53 == 210 then
      local r5_53 = r0_53:MoveSliderBack(r0_53.ButtonP2.SL_OpaWin, r0_53.ButtonP2.SL_OpaWinBk, r3_53)
      g_messagealpha = r0_53.ButtonP2.SL_OpaWin:bt_GetParamX()
      r0_53:setCfg2WindowAlpa()
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin:changeMessageWindowOpacity()
      end
      if g_menuExecute == false then
        local r6_53 = cclass.lua_Layers:create()
        if g_CASTOFF then
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        end
        r6_53:setForceBG(true)
        g_P1Renew = 3
      end
    end
    if r1_53 == 212 then
      local r5_53 = r0_53:MoveSliderBack(r0_53.ButtonP2.SL_AutoSpeed, r0_53.ButtonP2.SL_AutoSpeedBk, r3_53)
      g_autospeed = r0_53.ButtonP2.SL_AutoSpeed:bt_GetParamX()
    end
  end
  function g_Menu.Config.ptr.MakeClkWait(r0_54, r1_54)
    -- line: [2663, 2679] id: 54
    -- notice: unreachable block#6
    if r0_54.P2IconKey ~= -1 then
      r1_54 = r0_54.P2IconKey
    end
    local r2_54 = cclass.lua_Layers:create()
    for r6_54 = 0, 65, 1 do
      r2_54:setAnimation("configBase", r1_54, "ClkWait", r6_54, 0.015151515151515152 * r6_54, 0)
    end
  end
  function g_Menu.Config.ptr.StartClkWait(r0_55)
    -- line: [2682, 2706] id: 55
    -- notice: unreachable block#3
    local r1_55 = cclass.lua_Layers:create()
    local r2_55 = ConfigGetPageKeyName(2)
    if r0_55.P2IconKey ~= -1 then
      r2_55 = r0_55.P2IconKey
    end
    r1_55:startAnimation("configBase", r2_55, "ClkWait", 2600, -1, 0)
  end
  function g_Menu.Config.ptr.StopClkWait(r0_56)
    -- line: [2709, 2725] id: 56
    -- notice: unreachable block#3
    local r1_56 = cclass.lua_Layers:create()
    local r2_56 = ConfigGetPageKeyName(2)
    if r0_56.P2IconKey ~= -1 then
      r2_56 = r0_56.P2IconKey
    end
    r1_56:stopAnimation("configBase", r2_56, "ClkWait")
  end
  g_Menu.Config.ptr.P2SlideBar = {}
  g_Menu.Config.ptr.P2IconKey = -1
  function g_Menu.Config.ptr.initConfigP2(r0_57, r1_57, r2_57)
    -- line: [2730, 2885] id: 57
    if r2_57 == true then
      local r3_57 = cclass.lua_Layers:create()
      r0_57.P2IconKey = "P2Icon"
      r0_57:MenuLoadLayer(r0_57.P2IconKey, "Sys_ClickWait.pna")
      r3_57:setParam("configBase", r0_57.P2IconKey, LUA_PARAM_POS, 1000, 480, 0, 0)
      r3_57:initSubLayer("configBase", r1_57, 2, 1)
      r3_57:initSubLayer("configBase", r1_57, 113, 1)
      r0_57:setCfg2WindowAlpa()
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) == false then
        changeMessageWindow(-1, true)
      end
      local r4_57 = 0
      local r5_57 = 0
      local r6_57 = 0
      local r7_57 = 0
      local r8_57 = nil
      local r9_57 = nil
      r8_57, r9_57 = getConfigText()
      r3_57:insertTextLayer("configBase", r8_57, 960, 130, 100, 5, 100, 5, 0, 1)
      r3_57:insertTextLayer("configBase", r9_57, 550, 40, 100, 5, 100, 5, 0, 1)
      r3_57:setParam("configBase", r8_57, LUA_PARAM_POS, 170, 415, 0, 0)
      r3_57:setParam("configBase", r9_57, LUA_PARAM_POS, 170, 385, 0, 0)
      r0_57:MakeClkWait(r1_57)
      r0_57.ButtonP2 = {}
      r0_57:MenuButtonSet(r0_57.ButtonP2, "SkipRead", 1, r1_57, 55, 55, 63, 71, -1, 201, 0, 0)
      r0_57:MenuButtonSet(r0_57.ButtonP2, "SkipAll", 1, r1_57, 56, 56, 64, 72, -1, 202, 0, 0)
      r0_57:MenuButtonSet(r0_57.ButtonP2, "SkipOptOn", 1, r1_57, 57, 57, 65, 73, -1, 203, 0, 0)
      r0_57:MenuButtonSet(r0_57.ButtonP2, "SkipOptOff", 1, r1_57, 58, 58, 66, 74, -1, 204, 0, 0)
      r0_57:MenuButtonSet(r0_57.ButtonP2, "AutoOptOn", 1, r1_57, 59, 59, 67, 75, -1, 205, 0, 0)
      r0_57:MenuButtonSet(r0_57.ButtonP2, "AutoOptOff", 1, r1_57, 60, 60, 68, 76, -1, 206, 0, 0)
      r0_57:MenuButtonSet(r0_57.ButtonP2, "ReadColorOn", 1, r1_57, 103, 103, 95, 99, -1, 213, 0, 0)
      r0_57:MenuButtonSet(r0_57.ButtonP2, "ReadColorOff", 1, r1_57, 104, 104, 96, 100, -1, 214, 0, 0)
      r0_57:MenuMoveButtonSet(r0_57.ButtonP2, "SL_MsgSpeed", 1, r1_57, 23, 23, 34, -1, -1, 207, 0, 0)
      r0_57:MenuMoveButtonSet(r0_57.ButtonP2, "SL_OpaWin", 1, r1_57, 26, 26, 37, -1, -1, 209, 0, 0)
      r0_57:MenuMoveButtonSet(r0_57.ButtonP2, "SL_AutoSpeed", 1, r1_57, 29, 29, 40, -1, -1, 211, 0, 0)
      r0_57.ButtonP2.SL_MsgSpeed.se_click = -1
      r0_57.ButtonP2.SL_OpaWin.se_click = -1
      r0_57.ButtonP2.SL_AutoSpeed.se_click = -1
      r0_57:MenuButtonSet(r0_57.ButtonP2, "SL_MsgSpeedBk", 1, r1_57, 46, -1, -1, -1, -1, 208, 0, -1)
      r0_57:MenuButtonSet(r0_57.ButtonP2, "SL_OpaWinBk", 1, r1_57, 48, -1, -1, -1, -1, 210, 0, -1)
      r0_57:MenuButtonSet(r0_57.ButtonP2, "SL_AutoSpeedBk", 1, r1_57, 50, -1, -1, -1, -1, 212, 0, -1)
      r0_57.ButtonP2.SL_MsgSpeedBk.se_click = -1
      r0_57.ButtonP2.SL_OpaWinBk.se_click = -1
      r0_57.ButtonP2.SL_AutoSpeedBk.se_click = -1
      r0_57.MenuButton:InitList()
      r0_57.MenuButton:SetList("ButtonP2", r0_57.ButtonP2)
      r0_57.MenuButton:InitButton()
      r0_57:SetSliderParam(r0_57.ButtonP2.SL_MsgSpeed, 46, 45, 100, 0, g_msgspeed)
      r0_57:SetSliderParam(r0_57.ButtonP2.SL_OpaWin, 48, 47, 100, 0, g_messagealpha)
      r0_57:SetSliderParam(r0_57.ButtonP2.SL_AutoSpeed, 50, 49, 100, 0, g_autospeed)
      r0_57.P2SlideBar = {}
      r0_57.P2SlideBar.SL_MsgSpeed = {
        def = 24,
        on = 35,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      r0_57.P2SlideBar.SL_OpaWin = {
        def = 27,
        on = 38,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      r0_57.P2SlideBar.SL_AutoSpeed = {
        def = 30,
        on = 41,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      for r13_57, r14_57 in pairs(r0_57.P2SlideBar) do
        if r14_57.def ~= -1 then
          r3_57:initSubLayer("configBase", r1_57, r14_57.def, 1)
        end
        if r14_57.on ~= -1 then
          r3_57:initSubLayer("configBase", r1_57, r14_57.on, 1)
        end
      end
      r0_57.ItemP2 = r0_57:ItemSetInit()
      r0_57.ItemP2.MsgSpeed = MenuItem.new("configBase", r1_57, 5, 13)
      r0_57.ItemP2.OpaWindow = MenuItem.new("configBase", r1_57, 6, 14)
      r0_57.ItemP2.SkipMsg = MenuItem.new("configBase", r1_57, 7, 15)
      r0_57.ItemP2.SkipOption = MenuItem.new("configBase", r1_57, 8, 16)
      r0_57.ItemP2.AutoPlay = MenuItem.new("configBase", r1_57, 9, 17)
      r0_57.ItemP2.AutoOption = MenuItem.new("configBase", r1_57, 10, 18)
      r0_57.ItemP2.ReadColor = MenuItem.new("configBase", r1_57, 91, 90)
      r0_57.ItemP2.Headline_MsgSpeed = "MsgSpeed"
      r0_57.ItemP2.Headline_OpaWindow = "OpaWindow"
      r0_57.ItemP2.Headline_SkipMsg = "SkipMsg"
      r0_57.ItemP2.Headline_SkipOption = "SkipOption"
      r0_57.ItemP2.Headline_AutoPlay = "AutoPlay"
      r0_57.ItemP2.Headline_AutoOption = "AutoOption"
      r0_57.ItemP2.Headline_ReadColor = "ReadColor"
      r0_57.ItemP2.MsgSpeedBar = MenuItem.new("configBase", r1_57, 24, 35)
      r0_57.ItemP2.OpaWindowBar = MenuItem.new("configBase", r1_57, 27, 38)
      r0_57.ItemP2.AutoPlayBar = MenuItem.new("configBase", r1_57, 30, 41)
      r0_57.ItemP2.Headline_MsgSpeedBar = "MsgSpeedBar"
      r0_57.ItemP2.Headline_OpaWindowBar = "OpaWindowBar"
      r0_57.ItemP2.Headline_AutoPlayBar = "AutoPlayBar"
      r0_57.ItemP2.MsgSpeedBarB = MenuItem.new("configBase", r1_57, 25, 36)
      r0_57.ItemP2.OpaWindowBarB = MenuItem.new("configBase", r1_57, 28, 39)
      r0_57.ItemP2.AutoPlayBarB = MenuItem.new("configBase", r1_57, 31, 42)
      r0_57.ItemP2.Headline_MsgSpeedBarB = "MsgSpeedBarB"
      r0_57.ItemP2.Headline_OpaWindowBarB = "OpaWindowBarB"
      r0_57.ItemP2.Headline_AutoPlayBarB = "AutoPlayBarB"
      r0_57.ItemP2.expMsgSpeed = MenuItem.new("configBase", r1_57, -1, 86)
      r0_57.ItemP2.expOpaWindow = MenuItem.new("configBase", r1_57, -1, 85)
      r0_57.ItemP2.expSkipMsg = -1
      r0_57.ItemP2.expSkipMsgRead = MenuItem.new("configBase", r1_57, -1, 84)
      r0_57.ItemP2.expSkipMsgAll = MenuItem.new("configBase", r1_57, -1, 83)
      r0_57.ItemP2.expSkipOption = MenuItem.new("configBase", r1_57, -1, 82)
      r0_57.ItemP2.expAutoPlay = MenuItem.new("configBase", r1_57, -1, 81)
      r0_57.ItemP2.expAutoOption = MenuItem.new("configBase", r1_57, -1, 80)
      r0_57.ItemP2.expReadColor = MenuItem.new("configBase", r1_57, -1, 111)
      r0_57.autoModeTimer = AutoModeTimer.new()
      r0_57.autoModeTimer:reset()
      r0_57:Page2_SetActive()
    else
      r0_57:Page2_SetActive()
    end
  end
  function g_Menu.Config.ptr.deleteP2key(r0_58)
    -- line: [2888, 2899] id: 58
    local r1_58 = cclass.lua_Layers:create()
    local r2_58 = nil
    local r3_58 = nil
    r2_58, r3_58 = getConfigText()
    r1_58:removeLayer("configBase", r2_58)
    r1_58:removeLayer("configBase", r3_58)
    if r0_58.P2IconKey ~= -1 then
      r1_58:removeLayer("configBase", r0_58.P2IconKey)
    end
  end
  function g_Menu.Config.ptr.SetSlideActP2(r0_59, r1_59)
    -- line: [2902, 2917] id: 59
    local r2_59 = cclass.lua_Layers:create()
    local r3_59 = ConfigGetPageKeyName(2)
    for r7_59, r8_59 in pairs(r0_59.P2SlideBar) do
      local r10_59 = (r8_59.w - r8_59.icon_x) * r0_59.ButtonP2[r7_59]:bt_GetParamX() / 100 + r8_59.icon_x / 2
      if r8_59.def ~= -1 then
        r2_59:setSubLayerParam("configBase", r3_59, r8_59.def, LUA_PARAM_RECT, 0, 0, r10_59, r8_59.h)
      end
      if r8_59.on ~= -1 then
        r2_59:setSubLayerParam("configBase", r3_59, r8_59.on, LUA_PARAM_RECT, 0, 0, r10_59, r8_59.h)
      end
    end
  end
  function g_Menu.Config.ptr.SelCursorP2(r0_60, r1_60, r2_60, r3_60, r4_60, r5_60, r6_60)
    -- line: [2921, 2988] id: 60
    r0_60:SetSlideActP2(r1_60)
    if r1_60 == -1 or r0_60.ItemP2.selCursor_selName ~= r1_60 then
      r0_60:ItemSet(r0_60.ItemP2, -1, -1, -1, -1, -1)
    end
    if r1_60 == "SkipRead" then
      if r0_60.ItemP2.expSkipMsg ~= -1 then
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_SkipMsg, -1, -1, "expSkipMsg")
      else
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_SkipMsg, -1, -1, "expSkipMsgRead")
        r0_60.ItemP2.expSkipMsgRead:SetAct("on")
        r0_60.ItemP2.selCursor_Conf = r0_60.ItemP2.expSkipMsgRead
      end
    end
    if r1_60 == "SkipAll" then
      if r0_60.ItemP2.expSkipMsg ~= -1 then
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_SkipMsg, -1, -1, "expSkipMsg")
      else
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_SkipMsg, -1, -1, "expSkipMsgAll")
        r0_60.ItemP2.expSkipMsgAll:SetAct("on")
        r0_60.ItemP2.selCursor_Conf = r0_60.ItemP2.expSkipMsgAll
      end
    end
    if "SkipOptOn" == r1_60 or "SkipOptOff" == r1_60 then
      if r0_60.ItemP2.expSkipOption == nil or r0_60.ItemP2.expSkipOption == -1 then
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_SkipMsg, r0_60.ItemP2.Headline_SkipOption, -1, "expSkipMsg")
      else
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_SkipMsg, r0_60.ItemP2.Headline_SkipOption, -1, "expSkipOption")
      end
    end
    if r1_60 == "AutoOptOn" then
      if r0_60.ItemP2.expAutoOption == nil or r0_60.ItemP2.expAutoOption == -1 then
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_AutoPlay, r0_60.ItemP2.Headline_AutoOption, -1, "expAutoPlay")
      else
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_AutoPlay, r0_60.ItemP2.Headline_AutoOption, -1, "expAutoOption")
      end
    end
    if r1_60 == "AutoOptOff" then
      if r0_60.ItemP2.expAutoOption == nil or r0_60.ItemP2.expAutoOption == -1 then
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_AutoPlay, r0_60.ItemP2.Headline_AutoOption, -1, "expAutoPlay")
      else
        r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_AutoPlay, r0_60.ItemP2.Headline_AutoOption, -1, "expAutoOption")
      end
    end
    if "SL_MsgSpeed" == r1_60 or "SL_MsgSpeedBk" == r1_60 then
      r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_MsgSpeed, r0_60.ItemP2.Headline_MsgSpeedBar, r0_60.ItemP2.Headline_MsgSpeedBarB, "expMsgSpeed")
    end
    if "SL_OpaWin" == r1_60 or "SL_OpaWinBk" == r1_60 then
      r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_OpaWindow, r0_60.ItemP2.Headline_OpaWindowBar, r0_60.ItemP2.Headline_OpaWindowBarB, "expOpaWindow")
    end
    if "SL_AutoSpeed" == r1_60 or "SL_AutoSpeedBk" == r1_60 then
      r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_AutoPlay, r0_60.ItemP2.Headline_AutoPlayBar, r0_60.ItemP2.Headline_AutoPlayBarB, "expAutoPlay")
    end
    if r1_60 == "ReadColorOn" then
      r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_ReadColor, -1, -1, "expReadColor")
    end
    if r1_60 == "ReadColorOff" then
      r0_60:ItemSet(r0_60.ItemP2, r1_60, r0_60.ItemP2.Headline_ReadColor, -1, -1, "expReadColor")
    end
  end
  function g_Menu.Config.ptr.setCfg2WindowAlpa(r0_61)
    -- line: [2991, 2996] id: 61
    cclass.lua_Layers:create():setSubLayerParam("configBase", ConfigGetPageKeyName(2), 2, LUA_PARAM_COLOR, 1, 1, 1, g_messagealpha / 100)
  end
  function g_Menu.Config.ptr.effectCfg2Text(r0_62, r1_62, r2_62, r3_62, r4_62, r5_62)
    -- line: [3001, 3058] id: 62
    local r6_62 = cclass.lua_Layers:create()
    local r7_62 = getEffectRate()
    local r8_62 = nil
    local r9_62 = nil
    r8_62, r9_62 = getConfigText()
    if r1_62 ~= true then
      if r0_62.PageSlide then
        if r4_62 == false then
          local r10_62 = 0
          local r11_62 = 0
          local r12_62 = 0
          local r13_62 = 0
          r10_62, r11_62, r12_62, r13_62 = r6_62:getParam("configBase", r8_62, LUA_PARAM_POS, r10_62, r11_62, r12_62, r13_62)
          r6_62:setParam("configBase", r8_62, LUA_PARAM_POS, r10_62 - r2_62, r11_62, r12_62, r13_62)
          r6_62:setParam("configBase", r8_62, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_62:setEffect("configBase", r8_62, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_62, 0, r5_62)
          r10_62, r11_62, r12_62, r13_62 = r6_62:getParam("configBase", r9_62, LUA_PARAM_POS, r10_62, r11_62, r12_62, r13_62)
          r6_62:setParam("configBase", r9_62, LUA_PARAM_POS, r10_62 - r2_62, r11_62, r12_62, r13_62)
          r6_62:setParam("configBase", r9_62, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_62:setEffect("configBase", r9_62, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_62, 0, r5_62)
        else
          r6_62:setEffect("configBase", r8_62, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_62, 0, r5_62)
          r6_62:setEffect("configBase", r9_62, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_62, 0, r5_62)
        end
        r6_62:setEffect("configBase", r8_62, "ConfigPage", LUA_EFFECT_POS, r2_62, 0, 0, 0, 2, r3_62, 0, r5_62)
        r6_62:setEffect("configBase", r9_62, "ConfigPage", LUA_EFFECT_POS, r2_62, 0, 0, 0, 2, r3_62, 0, r5_62)
      elseif r4_62 ~= false then
        r6_62:setEffect("configBase", r8_62, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_62, 0, r5_62)
        r6_62:setEffect("configBase", r9_62, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_62, 0, r5_62)
      end
      r6_62:startEffect("configBase", r8_62, "ConfigPage", 0)
      r6_62:startEffect("configBase", r9_62, "ConfigPage", 0)
      if r0_62.P2IconKey ~= -1 then
        if r4_62 == false then
          r6_62:setParam("configBase", r0_62.P2IconKey, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_62:setEffect("configBase", r0_62.P2IconKey, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_62, 0, r5_62)
        else
          r6_62:setParam("configBase", r0_62.P2IconKey, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r6_62:setEffect("configBase", r0_62.P2IconKey, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_62, 0, r5_62)
        end
        r6_62:startEffect("configBase", r0_62.P2IconKey, "ConfigPage", 0)
      end
    end
  end
  g_Menu.Config.ptr.selChar = 1
  function g_Menu.Config.ptr.Page3_SetActive(r0_63, r1_63)
    -- line: [3065, 3160] id: 63
    local r2_63 = cclass.lua_Layers:create()
    if g_clickVoice == true then
      r0_63.ButtonP3.VoiceSkipOn:bt_SetActive(4)
      r0_63.ButtonP3.VoiceSkipOff:bt_SetActive(0)
    else
      r0_63.ButtonP3.VoiceSkipOn:bt_SetActive(0)
      r0_63.ButtonP3.VoiceSkipOff:bt_SetActive(4)
    end
    if g_enablePan == true then
      r0_63.ButtonP3.VoiceRLOn:bt_SetActive(4)
      r0_63.ButtonP3.VoiceRLOff:bt_SetActive(0)
    else
      r0_63.ButtonP3.VoiceRLOn:bt_SetActive(0)
      r0_63.ButtonP3.VoiceRLOff:bt_SetActive(4)
    end
    if r0_63.ButtonP3.BgvStopOn ~= nil then
      if g_bgvVoiceMute == true then
        r0_63.ButtonP3.BgvStopOn:bt_SetActive(4)
        r0_63.ButtonP3.BgvStopOff:bt_SetActive(0)
      else
        r0_63.ButtonP3.BgvStopOn:bt_SetActive(0)
        r0_63.ButtonP3.BgvStopOff:bt_SetActive(4)
      end
    end
    if r0_63.CharAllDisable == true then
      r0_63.ButtonP3.SysVoiceEx:bt_SetActive(2)
      r0_63.ButtonP3.SysVoiceRa:bt_SetActive(2)
    else
      if r0_63.ButtonP3.SysVoiceRa ~= nil then
        if g_sysVoiceChar == 999 then
          r0_63.ButtonP3.SysVoiceRa:bt_SetActive(4)
        else
          r0_63.ButtonP3.SysVoiceRa:bt_SetActive(0)
        end
      end
      if g_TrialFlag == 0 then
        if r0_63.selChar <= r0_63.selCharMax - 2 then
          if r0_63.selChar == g_sysVoiceChar then
            r0_63.ButtonP3.SysVoiceEx:bt_SetActive(4)
          else
            r0_63.ButtonP3.SysVoiceEx:bt_SetActive(0)
          end
        else
          r0_63.ButtonP3.SysVoiceEx:bt_SetActive(2)
        end
      elseif r0_63.selChar <= 7 then
        if r0_63.selChar == g_sysVoiceChar then
          r0_63.ButtonP3.SysVoiceEx:bt_SetActive(4)
        else
          r0_63.ButtonP3.SysVoiceEx:bt_SetActive(0)
        end
      else
        r0_63.ButtonP3.SysVoiceEx:bt_SetActive(2)
      end
    end
    r0_63:SetCharBaseActP3(r1_63)
    r0_63.ButtonP3.SL_MasterVol:bt_SetParamX(g_mixer:getMasterVolume())
    r0_63.ButtonP3.SL_BgmVol:bt_SetParamX(g_volume[getSoundIndex("bgm")].vol / 10)
    r0_63.ButtonP3.SL_SeVol:bt_SetParamX(g_volume[getSoundIndex("se")].vol / 10)
    r0_63.ButtonP3.SL_MovieVol:bt_SetParamX(g_volume[getSoundIndex("movie")].vol / 10)
    r0_63.ButtonP3.SL_VoiceVol:bt_SetParamX(g_volume[getSoundIndex("char")].vol / 10)
    r0_63.ButtonP3.SL_VoiceBgmVol:bt_SetParamX(g_bgmCutPer)
    if r0_63.ButtonP3.SL_BgvVol ~= nil then
      r0_63.ButtonP3.SL_BgvVol:bt_SetParamX(g_volume[getSoundIndex("bgv")].vol / 10)
    end
    if r0_63.CharAllDisable == false then
      r0_63.ButtonP3.SL_CharVol:bt_SetParamX(g_volume[r0_63:getPersonalIndex()].vol / 10)
    end
    r0_63.ButtonP3.SL_SysSeVol:bt_SetParamX(g_volume[getSoundIndex("systemse")].vol / 10)
    r0_63:SetSlideActP3(r0_63.MenuButton.selCursor)
  end
  function g_Menu.Config.ptr.P3_GaugeJob(r0_64, r1_64, r2_64, r3_64, r4_64, r5_64)
    -- line: [3162, 3163] id: 64
  end
  function g_Menu.Config.ptr.P3_ButtonRepeatLD(r0_65, r1_65, r2_65, r3_65, r4_65, r5_65, r6_65, r7_65)
    -- line: [3166, 3169] id: 65
    r0_65:P3_GaugeJob(r3_65, r4_65, r5_65, r6_65, r7_65)
  end
  function g_Menu.Config.ptr.P3_ButtonJobLD(r0_66, r1_66, r2_66, r3_66, r4_66)
    -- line: [3172, 3209] id: 66
    if r1_66 == 308 then
      r0_66.SliderMoveNo = r1_66
    end
    if r1_66 == 310 then
      r0_66.SliderMoveNo = r1_66
    end
    if r1_66 == 312 then
      r0_66.SliderMoveNo = r1_66
    end
    if r1_66 == 314 then
      r0_66.SliderMoveNo = r1_66
    end
    if r1_66 == 316 then
      r0_66.SliderMoveNo = r1_66
    end
    if r1_66 == 318 then
      r0_66.SliderMoveNo = r1_66
    end
    if r1_66 == 322 then
      r0_66.SliderMoveNo = r1_66
    end
    if r1_66 == 320 then
      r0_66.SliderMoveNo = r1_66
    end
    if r1_66 == 324 then
      r0_66.SliderMoveNo = r1_66
    end
    if r1_66 == 326 then
      r0_66.SliderMoveNo = r1_66
    end
  end
  function g_Menu.Config.ptr.P3_ButtonJobLU(r0_67, r1_67, r2_67, r3_67, r4_67)
    -- line: [3212, 3592] id: 67
    if r0_67.SliderMoveNo == 308 then
      local r5_67 = r0_67.ButtonP3.SL_MasterVol:bt_GetParamX()
      r0_67.ButtonP3.SL_MasterVol:bt_SetParamX(r5_67)
      if g_mixer:getMasterMute() == true then
        g_mixer:setMasterMute(false)
      end
      g_mixer:setMasterVolume(r5_67)
    end
    if r0_67.SliderMoveNo == 310 then
      local r5_67 = r0_67.ButtonP3.SL_BgmVol:bt_GetParamX()
      r0_67.ButtonP3.SL_BgmVol:bt_SetParamX(r5_67)
      g_volume[getSoundIndex("bgm")].vol = r5_67 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgm")
    end
    if r0_67.SliderMoveNo == 312 then
      local r5_67 = r0_67.ButtonP3.SL_SeVol:bt_GetParamX()
      r0_67.ButtonP3.SL_SeVol:bt_SetParamX(r5_67)
      g_volume[getSoundIndex("se")].vol = r5_67 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("se")
      r0_67:SetTestSeVol(g_volume[getSoundIndex("se")].vol)
    end
    if r0_67.SliderMoveNo == 324 then
      local r5_67 = r0_67.ButtonP3.SL_SysSeVol:bt_GetParamX()
      r0_67.ButtonP3.SL_SysSeVol:bt_SetParamX(r5_67)
      g_volume[getSoundIndex("systemse")].vol = r5_67 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
    end
    if r0_67.SliderMoveNo == 314 then
      local r5_67 = r0_67.ButtonP3.SL_MovieVol:bt_GetParamX()
      r0_67.ButtonP3.SL_MovieVol:bt_SetParamX(r5_67)
      g_volume[getSoundIndex("movie")].vol = r5_67 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("movie")
    end
    if r0_67.SliderMoveNo == 316 then
      local r5_67 = r0_67.ButtonP3.SL_VoiceVol:bt_GetParamX()
      r0_67.ButtonP3.SL_VoiceVol:bt_SetParamX(r5_67)
      g_volume[getSoundIndex("char")].vol = r5_67 * 10
      for r9_67 = getSoundIndex("char") + 1, #g_volume, 1 do
        g_volume[r9_67].vol = r5_67 * 10
      end
      cfunc.LegacyGame__lua_NeedVolumeUpdate("char")
      for r9_67, r10_67 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_67)
      end
      r0_67:SetTestVoiceVol(g_volume[getSoundIndex("char")].vol)
      g_volume[getSoundIndex("systemVoice")].vol = g_volume[getSoundIndex("char")].vol
      r0_67:PlayTestVoice(999, getSoundVolume("char"))
    end
    if r0_67.SliderMoveNo == 326 then
      local r5_67 = r0_67.ButtonP3.SL_SysVoiceVol:bt_GetParamX()
      r0_67.ButtonP3.SL_SysVoiceVol:bt_SetParamX(r5_67)
      g_volume[getSoundIndex("systemVoice")].vol = r5_67 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
    end
    if r0_67.SliderMoveNo == 322 then
      local r5_67 = r0_67.ButtonP3.SL_BgvVol:bt_GetParamX()
      r0_67.ButtonP3.SL_BgvVol:bt_SetParamX(r5_67)
      g_volume[getSoundIndex("bgv")].vol = r5_67 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgv")
      for r9_67, r10_67 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_67)
      end
    end
    if r0_67.SliderMoveNo == 318 then
      local r5_67 = r0_67.ButtonP3.SL_VoiceBgmVol:bt_GetParamX()
      r0_67.ButtonP3.SL_VoiceBgmVol:bt_SetParamX(r5_67)
      g_bgmCutPer = r5_67
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
    end
    if r0_67.SliderMoveNo == 320 then
      local r5_67 = r0_67.ButtonP3.SL_CharVol:bt_GetParamX()
      r0_67.ButtonP3.SL_CharVol:bt_SetParamX(r5_67)
      g_volume[r0_67:getPersonalIndex()].vol = r5_67 * 10
      r0_67:SetTestVoiceVol(g_volume[r0_67:getPersonalIndex()].vol)
      local r6_67 = nil
      local r7_67 = nil
      local r8_67 = 0
      r6_67, r7_67 = string.find(g_volume[r0_67:getPersonalIndex()].name, "charOtherM")
      if r6_67 ~= nil then
        r8_67 = 1
      end
      r6_67, r7_67 = string.find(g_volume[r0_67:getPersonalIndex()].name, "charOtherF")
      if r6_67 ~= nil then
        r8_67 = 2
      end
      r6_67, r7_67 = string.find(g_volume[r0_67:getPersonalIndex()].name, "charMAN")
      if r6_67 ~= nil then
        r8_67 = 3
      end
      r6_67, r7_67 = string.find(g_volume[r0_67:getPersonalIndex()].name, "charWOMAN")
      if r6_67 ~= nil then
        r8_67 = 4
      end
      if r8_67 == 0 then
        cfunc.LegacyGame__lua_NeedVolumeUpdate(g_volume[r0_67:getPersonalIndex()].name)
      elseif r8_67 == 1 then
        for r12_67 = 1, #g_charKeysOtherM, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r12_67])
        end
      elseif r8_67 == 2 then
        for r12_67 = 1, #g_charKeysOtherF, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r12_67])
        end
      elseif r8_67 == 3 then
        for r12_67 = 1, #g_volumeID_MAN, 1 do
          g_volume[getSoundIndex("char") + g_volumeID_MAN[r12_67]].vol = g_volume[r0_67:getPersonalIndex()].vol
        end
        for r12_67 = 1, #g_charKeysOtherMAN, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherMAN[r12_67])
        end
        for r12_67 = 1, #g_charKeysOtherM, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r12_67])
        end
      elseif r8_67 == 4 then
        for r12_67 = 1, #g_volumeID_WOMAN, 1 do
          g_volume[getSoundIndex("char") + g_volumeID_WOMAN[r12_67]].vol = g_volume[r0_67:getPersonalIndex()].vol
        end
        for r12_67 = 1, #g_charKeysOtherWOMAN, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherWOMAN[r12_67])
        end
        for r12_67 = 1, #g_charKeysOtherF, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r12_67])
        end
      end
      for r12_67, r13_67 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r12_67)
      end
      r0_67:PlayTestVoice(r0_67.selChar, g_volume[r0_67:getPersonalIndex()].vol)
    end
    if r1_67 == 301 then
      g_clickVoice = true
    end
    if r1_67 == 302 then
      g_clickVoice = false
    end
    if r1_67 == 303 then
      g_enablePan = true
    end
    if r1_67 == 304 then
      g_enablePan = false
    end
    if r1_67 == 305 then
      g_bgvVoiceMute = true
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGV, 0)
    end
    if r1_67 == 306 then
      g_bgvVoiceMute = false
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGV, 0)
    end
    if 330 <= r1_67 and r1_67 <= 330 + r0_67.selCharMax then
      r0_67.selChar = r1_67 - 330 + 1
      r0_67:StopTestVoice()
    end
    if r1_67 == 309 then
      local r5_67 = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_MasterVol, r0_67.ButtonP3.SL_MasterVolBk, r3_67)
      if g_mixer:getMasterMute() == true then
        g_mixer:setMasterMute(false)
      end
      g_mixer:setMasterVolume(r5_67)
    end
    if r1_67 == 311 then
      g_volume[getSoundIndex("bgm")].vol = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_BgmVol, r0_67.ButtonP3.SL_BgmVolBk, r3_67) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgm")
    end
    if r1_67 == 313 then
      g_volume[getSoundIndex("se")].vol = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_SeVol, r0_67.ButtonP3.SL_SeVolBk, r3_67) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("se")
      r0_67:SetTestSeVol(g_volume[getSoundIndex("se")].vol)
    end
    if r1_67 == 315 then
      g_volume[getSoundIndex("movie")].vol = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_MovieVol, r0_67.ButtonP3.SL_MovieVolBk, r3_67) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("movie")
    end
    if r1_67 == 317 then
      local r5_67 = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_VoiceVol, r0_67.ButtonP3.SL_VoiceVolBk, r3_67)
      g_volume[getSoundIndex("char")].vol = r5_67 * 10
      for r9_67 = getSoundIndex("char") + 1, #g_volume, 1 do
        g_volume[r9_67].vol = r5_67 * 10
      end
      cfunc.LegacyGame__lua_NeedVolumeUpdate("char")
      for r9_67, r10_67 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_67)
      end
      r0_67:SetTestVoiceVol(g_volume[getSoundIndex("char")].vol)
      g_volume[getSoundIndex("systemVoice")].vol = g_volume[getSoundIndex("char")].vol
      r0_67:PlayTestVoice(999, getSoundVolume("char"))
    end
    if r1_67 == 323 then
      g_volume[getSoundIndex("bgv")].vol = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_BgvVol, r0_67.ButtonP3.SL_BgvVolBk, r3_67) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgv")
      for r9_67, r10_67 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_67)
      end
    end
    if r1_67 == 319 then
      g_bgmCutPer = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_VoiceBgmVol, r0_67.ButtonP3.SL_VoiceBgmVolBk, r3_67)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
    end
    if r1_67 == 321 then
      g_volume[r0_67:getPersonalIndex()].vol = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_CharVol, r0_67.ButtonP3.SL_CharVolBk, r3_67) * 10
      local r6_67 = nil
      local r7_67 = nil
      local r8_67 = 0
      r6_67, r7_67 = string.find(g_volume[r0_67:getPersonalIndex()].name, "charOtherM")
      if r6_67 ~= nil then
        r8_67 = 1
      end
      r6_67, r7_67 = string.find(g_volume[r0_67:getPersonalIndex()].name, "charOtherF")
      if r6_67 ~= nil then
        r8_67 = 2
      end
      if r8_67 == 0 then
        cfunc.LegacyGame__lua_NeedVolumeUpdate(g_volume[r0_67:getPersonalIndex()].name)
      elseif r8_67 == 1 then
        for r12_67 = 1, #g_charKeysOtherM, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r12_67])
        end
      else
        for r12_67 = 1, #g_charKeysOtherF, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r12_67])
        end
      end
      for r12_67, r13_67 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r12_67)
      end
      r0_67:SetTestVoiceVol(g_volume[r0_67:getPersonalIndex()].vol)
    end
    if r1_67 == 324 then
      local r5_67 = r0_67.ButtonP3.SL_SysSeVol:bt_GetParamX()
      r0_67.ButtonP3.SL_SysSeVol:bt_SetParamX(r5_67)
      g_volume[getSoundIndex("systemse")].vol = r5_67 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
    end
    if r1_67 == 325 then
      g_volume[getSoundIndex("systemse")].vol = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_SysSeVol, r0_67.ButtonP3.SL_SysSeVolBk, r3_67) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
    end
    if r1_67 == 326 then
      local r5_67 = r0_67.ButtonP3.SL_SysVoiceVol:bt_GetParamX()
      r0_67.ButtonP3.SL_SysVoiceVol:bt_SetParamX(r5_67)
      g_volume[getSoundIndex("systemVoice")].vol = r5_67 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
    end
    if r1_67 == 327 then
      g_volume[getSoundIndex("systemVoice")].vol = r0_67:MoveSliderBack(r0_67.ButtonP3.SL_SysVoiceVol, r0_67.ButtonP3.SL_SysVoiceVolBk, r3_67) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
    end
    if r1_67 == 350 then
      r0_67:PlayTestSe(getSoundVolume("se"))
    end
    if r1_67 == 351 then
      r0_67:PlayTestVoice(g_sysVoiceChar, getSoundVolume("char"))
    end
    if r1_67 == 352 then
      r0_67:PlayTestVoice(r0_67.selChar, g_volume[r0_67:getPersonalIndex()].vol)
    end
    if r1_67 == 353 then
      r0_67:PlayTestSe(getSoundVolume("systemse"))
    end
    if r1_67 == 354 then
      r0_67:PlayTestVoice(g_sysVoiceChar, getSoundVolume("systemVoice"))
    end
    if r1_67 == 360 then
      g_sysVoiceChar = r0_67.selChar
    end
    if r1_67 == 361 then
      g_sysVoiceChar = 999
    end
    if 301 <= r1_67 and r1_67 <= 400 or 301 <= r0_67.SliderMoveNo and r0_67.SliderMoveNo <= 400 then
      r0_67:Page3_SetActive(ConfigGetPageKeyName(3))
      r0_67.SliderMoveNo = -1
      r0_67:DeleteConfigNo()
    end
  end
  g_Menu.Config.ptr.P3_Voice = {}
  function g_Menu.Config.ptr.PlayTestVoice(r0_68, r1_68, r2_68)
    -- line: [3598, 3687] id: 68
    if r1_68 <= 0 then
      return 
    end
    if r0_68.CharAllDisable == true then
      return 
    end
    local r4_68 = -1
    r4_68 = {
      {
        "HIKA_INF_0197.ogg"
      },
      {
        "C_HIKA_INF_0210.ogg"
      },
      {
        "SAYA_INF_0184.ogg"
      },
      {
        "C_SAYA_INF_0197.ogg"
      },
      {
        "ORI_INF_0145.ogg"
      },
      {
        "KORO_INF_0153.ogg"
      },
      {
        "C_KORO_INF_0166.ogg"
      },
      {
        "MIHA_INF_0056.ogg"
      },
      {
        "TAKE_INF_0034.ogg"
      },
      {
        "C_TAKE_INF_0013.ogg"
      },
      {
        "YOSHI_INF_0030.ogg"
      },
      {
        "KANO_INF_0029.ogg"
      },
      {
        "JINNO_INF_0032.ogg"
      },
      {
        "TAJI_INF_0019.ogg"
      },
      {
        "CHAMP_INF_0013.ogg"
      },
      {
        "KOTA_INF_0038.ogg"
      },
      {
        "HINA_INF_0022.ogg"
      },
      {
        "TOYO_INF_0013.ogg"
      },
      {
        "KAWA_INF_0013.ogg"
      },
      {
        "MORI_INF_0013.ogg"
      }
    }
    if r1_68 == 999 then
      local r5_68 = 0
      for r9_68, r10_68 in pairs(r0_68.CharEnableList) do
        if r10_68 == true then
          r5_68 = r5_68 + 1
        end
      end
      if r5_68 <= 0 then
        return 
      end
      local r6_68 = math.random(1, r5_68)
      r5_68 = 1
      for r10_68, r11_68 in pairs(r0_68.CharEnableList) do
        if r11_68 == true then
          if r5_68 == r6_68 then
            r1_68 = r10_68
            break
          else
            r5_68 = r5_68 + 1
          end
        end
      end
    end
    if #g_charKeys < r1_68 then
      return 
    end
    local r3_68 = r4_68[r1_68][1]
    if r3_68 ~= nil then
      r0_68:SetTestVoiceVol(r2_68)
      local r6_68 = cclass.lua_Sounds:new()
      r6_68:SndStop("ConfTestVoice")
      r6_68:SndPlay("ConfTestVoice", getSoundArcFileName("systemVoice", r3_68), r3_68, r2_68)
      r0_68.TestVoiceRestVol = g_volume[getSoundIndex("bgm")].vol
      r0_68.TestVoicePlayFlag = true
      r6_68:delete()
    end
  end
  function g_Menu.Config.ptr.StopTestVoice(r0_69)
    -- line: [3690, 3696] id: 69
    local r1_69 = cclass.lua_Sounds:new()
    r1_69:SndStop("ConfTestVoice")
    r0_69.TestVoicePlayFlag = false
    r1_69:delete()
  end
  function g_Menu.Config.ptr.SetTestVoiceVol(r0_70, r1_70)
    -- line: [3699, 3702] id: 70
    g_ConfigVoiceVolume = r1_70
    cfunc.LegacyGame__lua_NeedVolumeUpdate("ConfTestVoice")
  end
  function g_Menu.Config.ptr.CheckTestVoicePlaying(r0_71)
    -- line: [3705, 3717] id: 71
    local r1_71 = cclass.lua_Sounds:new()
    if not r1_71:IsPlaying("ConfTestVoice", "ConfTestVoice") and r0_71.TestVoicePlayFlag then
      r0_71:RestBGMVolume()
    end
    r1_71:delete()
  end
  function g_Menu.Config.ptr.RestBGMVolume(r0_72)
    -- line: [3720, 3726] id: 72
    if r0_72.TestVoicePlayFlag then
      r0_72.TestVoicePlayFlag = false
    end
  end
  function g_Menu.Config.ptr.PlayTestSe(r0_73, r1_73)
    -- line: [3730, 3737] id: 73
    local r2_73 = "SE_04a_011.ogg"
    r0_73:SetTestSeVol(r1_73)
    local r3_73 = cclass.lua_Sounds:new()
    r3_73:SndStop("ConfTestSE")
    r3_73:SndPlay("ConfTestSE", getSoundArcFileName("se", r2_73), r2_73, r1_73)
    r3_73:delete()
  end
  function g_Menu.Config.ptr.StopTestSe(r0_74)
    -- line: [3739, 3743] id: 74
    local r1_74 = cclass.lua_Sounds:new()
    r1_74:SndStop("ConfTestSE")
    r1_74:delete()
  end
  function g_Menu.Config.ptr.SetTestSeVol(r0_75, r1_75)
    -- line: [3746, 3749] id: 75
    g_ConfigSeVolume = r1_75
    cfunc.LegacyGame__lua_NeedVolumeUpdate("ConfTestSE")
  end
  function g_Menu.Config.ptr.PlayTestSystemVoice(r0_76, r1_76)
    -- line: [3753, 3759] id: 76
  end
  function g_Menu.Config.ptr.StopTestSystemVoice(r0_77)
    -- line: [3762, 3766] id: 77
  end
  function g_Menu.Config.ptr.getPersonalIndex(r0_78)
    -- line: [3771, 3773] id: 78
    return getSoundIndex("char") + r0_78.selChar
  end
  function g_Menu.Config.ptr.SetCharBaseActP3(r0_79, r1_79)
    -- line: [3776, 3825] id: 79
    local r2_79 = cclass.lua_Layers:create()
    for r6_79 = 0, r0_79.selCharMax - 1, 1 do
      local r7_79 = -1
      local r8_79 = -1
      r7_79, r8_79 = r0_79:GetCharBaseLayerP3(r6_79)
      local r9_79 = string.format("VoiceChar%03d", r6_79 + 1)
      if r0_79.CharEnableList[r6_79 + 1] == true then
        if r0_79.selChar == r6_79 + 1 then
          r0_79.ButtonP3[r9_79]:bt_SetActive(4)
          if r7_79 ~= -1 then
            r2_79:setSubLayerVisible("configBase", r1_79, r7_79, 1)
          end
          if r8_79 ~= -1 then
            r2_79:setSubLayerVisible("configBase", r1_79, r8_79, 1)
          end
        else
          r0_79.ButtonP3[r9_79]:bt_SetActive(0)
          if r7_79 ~= -1 then
            r2_79:setSubLayerVisible("configBase", r1_79, r7_79, 0)
          end
          if r8_79 ~= -1 then
            r2_79:setSubLayerVisible("configBase", r1_79, r8_79, 0)
          end
        end
      else
        r0_79.ButtonP3[r9_79]:bt_SetActive(2)
        if r7_79 ~= -1 then
          r2_79:setSubLayerVisible("configBase", r1_79, r7_79, 0)
        end
        if r8_79 ~= -1 then
          r2_79:setSubLayerVisible("configBase", r1_79, r8_79, 0)
        end
      end
    end
    if r0_79.CharAllDisable == true then
      r2_79:setSubLayerVisible("configBase", r1_79, 281, 1)
    else
      r2_79:setSubLayerVisible("configBase", r1_79, 281, 0)
    end
  end
  function g_Menu.Config.ptr.GetCharBaseLayerP3(r0_80, r1_80)
    -- line: [3828, 3834] id: 80
    return 327 - r1_80, 303 - r1_80
  end
  g_Menu.Config.ptr.CharAllDisable = true
  g_Menu.Config.ptr.CharEnableList = {}
  g_Menu.Config.ptr.sampleVoiceNo = 1
  g_Menu.Config.ptr.selCharMax = 22
  g_Menu.Config.ptr.sampleVoiceNoChar = {
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    nil
  }
  g_Menu.Config.ptr.P3SlideBar = {}
  function g_Menu.Config.ptr.initConfigP3(r0_81, r1_81, r2_81)
    -- line: [3843, 4172] id: 81
    if r2_81 == true then
      local r3_81 = cclass.lua_Layers:create()
      r3_81:initSubLayer("configBase", r1_81, 161, 1)
      r3_81:initSubLayer("configBase", r1_81, 329, 1)
      r3_81:initSubLayer("configBase", r1_81, 346, 1)
      r0_81.ButtonP3 = {}
      r0_81:MenuButtonSet(r0_81.ButtonP3, "VoiceSkipOn", 1, r1_81, 157, 157, 173, 165, -1, 301, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "VoiceSkipOff", 1, r1_81, 158, 158, 174, 166, -1, 302, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "VoiceRLOn", 1, r1_81, 159, 159, 175, 167, -1, 303, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "VoiceRLOff", 1, r1_81, 160, 160, 176, 168, -1, 304, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "SysVoiceEx", 1, r1_81, 161, 161, 177, 169, 355, 360, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "SysVoiceRa", 1, r1_81, 162, 162, 178, 170, 356, 361, 0, 0)
      r0_81.CharAllDisable = true
      r0_81.selChar = 1
      for r7_81 = 0, r0_81.selCharMax - 1, 1 do
        r0_81.CharEnableList[r7_81 + 1] = cfunc.LegacyGame__lua_GetFlag(1010 + r7_81)
        if r0_81.CharEnableList[r7_81 + 1] == true then
          r0_81.CharAllDisable = false
        end
        local r9_81 = -1
        local r10_81 = -1
        r9_81, r10_81 = r0_81:GetCharBaseLayerP3(r7_81)
        if r9_81 ~= -1 then
          r3_81:initSubLayer("configBase", r1_81, r9_81, 1)
        end
        if r10_81 ~= -1 then
          r3_81:initSubLayer("configBase", r1_81, r10_81, 1)
        end
        r0_81:MenuButtonSet(r0_81.ButtonP3, string.format("VoiceChar%03d", r7_81 + 1), 1, r1_81, 359 + r7_81, 183 + r7_81, 231 + r7_81, 207 + r7_81, 255 + r7_81, 330 + r7_81, 0, 0)
      end
      r3_81:initSubLayer("configBase", r1_81, 281, 0)
      r0_81:MenuMoveButtonSet(r0_81.ButtonP3, "SL_MasterVol", 1, r1_81, 4, 4, 9, -1, -1, 308, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "SL_MasterVolBk", 1, r1_81, 14, -1, -1, -1, -1, 309, 0, -1)
      r0_81.ButtonP3.SL_MasterVol.se_click = -1
      r0_81.ButtonP3.SL_MasterVolBk.se_click = -1
      r0_81:MenuMoveButtonSet(r0_81.ButtonP3, "SL_SysSeVol", 1, r1_81, 20, 20, 25, -1, -1, 324, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "SL_SysSeVolBk", 1, r1_81, 30, -1, -1, -1, -1, 325, 0, -1)
      r0_81.ButtonP3.SL_SysSeVol.se_click = -1
      r0_81.ButtonP3.SL_SysSeVolBk.se_click = -1
      r0_81:MenuMoveButtonSet(r0_81.ButtonP3, "SL_BgmVol", 1, r1_81, 36, 36, 41, -1, -1, 310, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "SL_BgmVolBk", 1, r1_81, 46, -1, -1, -1, -1, 311, 0, -1)
      r0_81.ButtonP3.SL_BgmVol.se_click = -1
      r0_81.ButtonP3.SL_BgmVolBk.se_click = -1
      r0_81:MenuMoveButtonSet(r0_81.ButtonP3, "SL_SeVol", 1, r1_81, 52, 52, 57, -1, -1, 312, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "SL_SeVolBk", 1, r1_81, 62, -1, -1, -1, -1, 313, 0, -1)
      r0_81.ButtonP3.SL_SeVol.se_click = -1
      r0_81.ButtonP3.SL_SeVolBk.se_click = -1
      r0_81:MenuMoveButtonSet(r0_81.ButtonP3, "SL_MovieVol", 1, r1_81, 68, 68, 73, -1, -1, 314, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "SL_MovieVolBk", 1, r1_81, 78, -1, -1, -1, -1, 315, 0, -1)
      r0_81.ButtonP3.SL_MovieVol.se_click = -1
      r0_81.ButtonP3.SL_MovieVolBk.se_click = -1
      r0_81:MenuMoveButtonSet(r0_81.ButtonP3, "SL_VoiceVol", 1, r1_81, 84, 84, 89, -1, -1, 316, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "SL_VoiceVolBk", 1, r1_81, 94, -1, -1, -1, -1, 317, 0, -1)
      r0_81.ButtonP3.SL_VoiceVol.se_click = -1
      r0_81.ButtonP3.SL_VoiceVolBk.se_click = -1
      r0_81:MenuMoveButtonSet(r0_81.ButtonP3, "SL_VoiceBgmVol", 1, r1_81, 100, 100, 105, -1, -1, 318, 0, 0)
      r0_81:MenuButtonSet(r0_81.ButtonP3, "SL_VoiceBgmVolBk", 1, r1_81, 110, -1, -1, -1, -1, 319, 0, -1)
      r0_81.ButtonP3.SL_VoiceBgmVol.se_click = -1
      r0_81.ButtonP3.SL_VoiceBgmVolBk.se_click = -1
      if r0_81.CharAllDisable == false then
        r0_81:MenuMoveButtonSet(r0_81.ButtonP3, "SL_CharVol", 1, r1_81, 116, 116, 121, -1, -1, 320, 0, 0)
        r0_81:MenuButtonSet(r0_81.ButtonP3, "SL_CharVolBk", 1, r1_81, 126, -1, -1, -1, -1, 321, 0, -1)
        r0_81.ButtonP3.SL_CharVol.se_click = -1
        r0_81.ButtonP3.SL_CharVolBk.se_click = -1
      end
      r0_81.MenuButton:InitList()
      r0_81.MenuButton:SetList("ButtonP3", r0_81.ButtonP3)
      r0_81.MenuButton:InitButton()
      local r4_81 = g_mixer:getMasterVolume()
      if g_mixer:getMasterMute() ~= false or not r4_81 then
        r4_81 = 0
      end
      r0_81:SetSliderParam(r0_81.ButtonP3.SL_MasterVol, 14, 15, 100, 0, r4_81)
      r0_81:SetSliderParam(r0_81.ButtonP3.SL_SysSeVol, 30, 31, 100, 0, g_volume[getSoundIndex("systemse")].vol / 10)
      r0_81:SetSliderParam(r0_81.ButtonP3.SL_BgmVol, 46, 47, 100, 0, g_volume[getSoundIndex("bgm")].vol / 10)
      r0_81:SetSliderParam(r0_81.ButtonP3.SL_SeVol, 62, 63, 100, 0, g_volume[getSoundIndex("se")].vol / 10)
      r0_81:SetSliderParam(r0_81.ButtonP3.SL_MovieVol, 78, 79, 100, 0, g_volume[getSoundIndex("movie")].vol / 10)
      r0_81:SetSliderParam(r0_81.ButtonP3.SL_VoiceVol, 94, 95, 100, 0, g_volume[getSoundIndex("char")].vol / 10)
      r0_81:SetSliderParam(r0_81.ButtonP3.SL_VoiceBgmVol, 110, 111, 100, 0, g_bgmCutPer)
      if r0_81.CharAllDisable == false then
        r0_81:SetSliderParam(r0_81.ButtonP3.SL_CharVol, 126, 127, 100, 0, g_volume[(getSoundIndex("char") + r0_81.selChar)].vol / 10)
      end
      r0_81.P3SlideBar = {}
      r0_81.P3SlideBar.SL_MasterVol = {
        def = 5,
        on = 10,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      r0_81.P3SlideBar.SL_SysSeVol = {
        def = 21,
        on = 26,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      r0_81.P3SlideBar.SL_BgmVol = {
        def = 37,
        on = 42,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      r0_81.P3SlideBar.SL_SeVol = {
        def = 53,
        on = 58,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      r0_81.P3SlideBar.SL_MovieVol = {
        def = 69,
        on = 74,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      r0_81.P3SlideBar.SL_VoiceVol = {
        def = 85,
        on = 90,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      r0_81.P3SlideBar.SL_VoiceBgmVol = {
        def = 101,
        on = 106,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      r0_81.P3SlideBar.SL_CharVol = {
        def = 117,
        on = 122,
        w = 203,
        h = 13,
        icon_x = 13,
      }
      for r8_81, r9_81 in pairs(r0_81.P3SlideBar) do
        if r9_81.def ~= -1 then
          r3_81:initSubLayer("configBase", r1_81, r9_81.def, 1)
        end
        if r9_81.on ~= -1 then
          r3_81:initSubLayer("configBase", r1_81, r9_81.on, 1)
        end
      end
      r0_81.ItemP3 = r0_81:ItemSetInit()
      r0_81.ItemP3.MasterVol = MenuItem.new("configBase", r1_81, 144, 133)
      r0_81.ItemP3.SysSeVol = MenuItem.new("configBase", r1_81, 145, 134)
      r0_81.ItemP3.BgmVol = MenuItem.new("configBase", r1_81, 146, 135)
      r0_81.ItemP3.SeVol = MenuItem.new("configBase", r1_81, 147, 136)
      r0_81.ItemP3.MovieVol = MenuItem.new("configBase", r1_81, 148, 137)
      r0_81.ItemP3.VoiceVol = MenuItem.new("configBase", r1_81, 149, 138)
      r0_81.ItemP3.VoiceBgmVol = MenuItem.new("configBase", r1_81, 150, 139)
      r0_81.ItemP3.VoiceSkip = MenuItem.new("configBase", r1_81, 151, 140)
      r0_81.ItemP3.VoiceRL = MenuItem.new("configBase", r1_81, 152, 141)
      r0_81.ItemP3.barMasterVol = MenuItem.new("configBase", r1_81, 5, 10)
      r0_81.ItemP3.barSysSeVol = MenuItem.new("configBase", r1_81, 21, 26)
      r0_81.ItemP3.barBgmVol = MenuItem.new("configBase", r1_81, 37, 42)
      r0_81.ItemP3.barSeVol = MenuItem.new("configBase", r1_81, 53, 58)
      r0_81.ItemP3.barMovieVol = MenuItem.new("configBase", r1_81, 69, 74)
      r0_81.ItemP3.barVoiceVol = MenuItem.new("configBase", r1_81, 85, 90)
      r0_81.ItemP3.barVoiceBgmVol = MenuItem.new("configBase", r1_81, 101, 106)
      r0_81.ItemP3.barCharVol = MenuItem.new("configBase", r1_81, 117, 122)
      r0_81.ItemP3.barMasterVolB = MenuItem.new("configBase", r1_81, 6, 11)
      r0_81.ItemP3.barSysSeVolB = MenuItem.new("configBase", r1_81, 22, 27)
      r0_81.ItemP3.barBgmVolB = MenuItem.new("configBase", r1_81, 38, 43)
      r0_81.ItemP3.barSeVolB = MenuItem.new("configBase", r1_81, 54, 59)
      r0_81.ItemP3.barMovieVolB = MenuItem.new("configBase", r1_81, 70, 75)
      r0_81.ItemP3.barVoiceVolB = MenuItem.new("configBase", r1_81, 86, 91)
      r0_81.ItemP3.barVoiceBgmVolB = MenuItem.new("configBase", r1_81, 102, 107)
      r0_81.ItemP3.barCharVolB = MenuItem.new("configBase", r1_81, 118, 123)
      r0_81.ItemP3.expMasterVol = MenuItem.new("configBase", r1_81, -1, 343)
      r0_81.ItemP3.expSysSeVol = MenuItem.new("configBase", r1_81, -1, 342)
      r0_81.ItemP3.expBgmVol = MenuItem.new("configBase", r1_81, -1, 341)
      r0_81.ItemP3.expSeVol = MenuItem.new("configBase", r1_81, -1, 340)
      r0_81.ItemP3.expMovieVol = MenuItem.new("configBase", r1_81, -1, 339)
      r0_81.ItemP3.expVoiceVol = MenuItem.new("configBase", r1_81, -1, 338)
      r0_81.ItemP3.expVoiceSkip = MenuItem.new("configBase", r1_81, -1, 337)
      r0_81.ItemP3.expVoiceRL = MenuItem.new("configBase", r1_81, -1, 336)
      r0_81.ItemP3.expVoiceBgmVol = MenuItem.new("configBase", r1_81, -1, 335)
      r0_81.ItemP3.expCharVol = MenuItem.new("configBase", r1_81, -1, 334)
      r0_81.ItemP3.expSysVoiceEx = MenuItem.new("configBase", r1_81, -1, 333)
      r0_81.ItemP3.expSysVoiceRa = MenuItem.new("configBase", r1_81, -1, 332)
      r0_81.ItemP3.Headline_MasterVol = "MasterVol"
      r0_81.ItemP3.Headline_BgmVol = "BgmVol"
      r0_81.ItemP3.Headline_SeVol = "SeVol"
      r0_81.ItemP3.Headline_SysSeVol = "SysSeVol"
      r0_81.ItemP3.Headline_MovieVol = "MovieVol"
      r0_81.ItemP3.Headline_VoiceVol = "VoiceVol"
      r0_81.ItemP3.Headline_SysVoiceVol = -1
      r0_81.ItemP3.Headline_BgvVol = -1
      r0_81.ItemP3.Headline_BgvStop = -1
      r0_81.ItemP3.Headline_CharVoice = -1
      r0_81.ItemP3.Headline_VoiceBgmVol = "VoiceBgmVol"
      r0_81.ItemP3.Headline_VoiceSkip = "VoiceSkip"
      r0_81.ItemP3.Headline_VoiceRL = "VoiceRL"
      r0_81.ItemP3.Headline_CharVol = -1
      r0_81.ItemP3.Headline_BgvVol = -1
      r0_81.ItemP3.Headline_BgvStop = -1
      r0_81.ItemP3.Headline_barMasterVol = "barMasterVol"
      r0_81.ItemP3.Headline_barBgmVol = "barBgmVol"
      r0_81.ItemP3.Headline_barSeVol = "barSeVol"
      r0_81.ItemP3.Headline_barSysSeVol = "barSysSeVol"
      r0_81.ItemP3.Headline_barMovieVol = "barMovieVol"
      r0_81.ItemP3.Headline_barVoiceVol = "barVoiceVol"
      r0_81.ItemP3.Headline_barVoiceBgmVol = "barVoiceBgmVol"
      r0_81.ItemP3.Headline_barMasterVolB = "barMasterVolB"
      r0_81.ItemP3.Headline_barBgmVolB = "barBgmVolB"
      r0_81.ItemP3.Headline_barSeVolB = "barSeVolB"
      r0_81.ItemP3.Headline_barSysSeVolB = "barSysSeVolB"
      r0_81.ItemP3.Headline_barMovieVolB = "barMovieVolB"
      r0_81.ItemP3.Headline_barVoiceVolB = "barVoiceVolB"
      r0_81.ItemP3.Headline_barVoiceBgmVolB = "barVoiceBgmVolB"
      if r0_81.CharAllDisable == false then
        r0_81.ItemP3.Headline_barCharVol = "barCharVol"
        r0_81.ItemP3.Headline_barCharVolB = "barCharVolB"
      else
        r0_81.ItemP3.Headline_barCharVol = -1
        r0_81.ItemP3.Headline_barCharVolB = -1
        r3_81:initSubLayer("configBase", r1_81, 352, 1)
      end
      local r7_81 = "Page3_SetActive"
      r7_81 = r1_81
      r0_81:[r7_81](r7_81)
    else
      local r5_81 = "Page3_SetActive"
      r5_81 = r1_81
      r0_81:[r5_81](r5_81)
    end
  end
  function g_Menu.Config.ptr.SetSlideActP3(r0_82, r1_82)
    -- line: [4175, 4192] id: 82
    local r2_82 = cclass.lua_Layers:create()
    local r3_82 = ConfigGetPageKeyName(3)
    for r7_82, r8_82 in pairs(r0_82.P3SlideBar) do
      if r0_82.ButtonP3[r7_82] ~= nil then
        local r10_82 = (r8_82.w - r8_82.icon_x) * r0_82.ButtonP3[r7_82]:bt_GetParamX() / 100 + r8_82.icon_x / 2
        if r8_82.def ~= -1 then
          r2_82:setSubLayerParam("configBase", r3_82, r8_82.def, LUA_PARAM_RECT, 0, 0, r10_82, r8_82.h)
        end
        if r8_82.on ~= -1 then
          r2_82:setSubLayerParam("configBase", r3_82, r8_82.on, LUA_PARAM_RECT, 0, 0, r10_82, r8_82.h)
        end
      end
    end
  end
  function g_Menu.Config.ptr.SelCursorP3(r0_83, r1_83, r2_83, r3_83, r4_83, r5_83, r6_83)
    -- line: [4196, 4392] id: 83
    if r0_83.SliderMoveNo == 308 then
      local r7_83 = r0_83.ButtonP3.SL_MasterVol
      r0_83:DrawConfigNo(r7_83:bt_GetParamX(), r7_83.DRAW_POS.x + r7_83.EVENT_RECT.w / 2, r7_83.DRAW_POS.y - 20)
    end
    if r0_83.SliderMoveNo == 310 then
      local r7_83 = r0_83.ButtonP3.SL_BgmVol
      r0_83:DrawConfigNo(r7_83:bt_GetParamX(), r7_83.DRAW_POS.x + r7_83.EVENT_RECT.w / 2, r7_83.DRAW_POS.y - 20)
    end
    if r0_83.SliderMoveNo == 312 then
      local r7_83 = r0_83.ButtonP3.SL_SeVol
      local r8_83 = r7_83:bt_GetParamX()
      r0_83:SetTestSeVol(r8_83 * 10)
      r0_83:DrawConfigNo(r8_83, r7_83.DRAW_POS.x + r7_83.EVENT_RECT.w / 2, r7_83.DRAW_POS.y - 20)
    end
    if r0_83.SliderMoveNo == 324 then
      local r7_83 = r0_83.ButtonP3.SL_SysSeVol
      local r8_83 = r7_83:bt_GetParamX()
      r0_83:SetTestSeVol(r8_83 * 10)
      r0_83:DrawConfigNo(r8_83, r7_83.DRAW_POS.x + r7_83.EVENT_RECT.w / 2, r7_83.DRAW_POS.y - 20)
    end
    if r0_83.SliderMoveNo == 314 then
      local r7_83 = r0_83.ButtonP3.SL_MovieVol
      r0_83:DrawConfigNo(r7_83:bt_GetParamX(), r7_83.DRAW_POS.x + r7_83.EVENT_RECT.w / 2, r7_83.DRAW_POS.y - 20)
    end
    if r0_83.SliderMoveNo == 316 then
      local r7_83 = r0_83.ButtonP3.SL_VoiceVol:bt_GetParamX()
      if r0_83.CharAllDisable == false then
        r0_83.ButtonP3.SL_CharVol:bt_SetParamX(r7_83)
      end
      g_volume[r0_83:getPersonalIndex()].vol = r7_83 * 10
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
      r0_83:SetTestVoiceVol(r7_83 * 10)
      local r8_83 = r0_83.ButtonP3.SL_VoiceVol
      r0_83:DrawConfigNo(r8_83:bt_GetParamX(), r8_83.DRAW_POS.x + r8_83.EVENT_RECT.w / 2, r8_83.DRAW_POS.y - 20)
    end
    if r0_83.SliderMoveNo == 326 then
      local r7_83 = r0_83.ButtonP3.SL_SysVoiceVol:bt_GetParamX()
      r0_83.ButtonP3.SL_SysVoiceVol:bt_SetParamX(r7_83)
      g_volume[getSoundIndex("systemVoice")].vol = r7_83 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
      local r8_83 = r0_83.ButtonP3.SL_SysVoiceVol
      r0_83:DrawConfigNo(r8_83:bt_GetParamX(), r8_83.DRAW_POS.x + r8_83.EVENT_RECT.w / 2, r8_83.DRAW_POS.y - 20)
    end
    if r0_83.SliderMoveNo == 322 then
      local r7_83 = r0_83.ButtonP3.SL_BgvVol
      r0_83:DrawConfigNo(r7_83:bt_GetParamX(), r7_83.DRAW_POS.x + r7_83.EVENT_RECT.w / 2, r7_83.DRAW_POS.y - 20)
    end
    if r0_83.SliderMoveNo == 318 then
      local r7_83 = r0_83.ButtonP3.SL_VoiceBgmVol
      r0_83:DrawConfigNo(r7_83:bt_GetParamX(), r7_83.DRAW_POS.x + r7_83.EVENT_RECT.w / 2, r7_83.DRAW_POS.y - 20)
    end
    if r0_83.SliderMoveNo == 320 then
      local r7_83 = r0_83.ButtonP3.SL_CharVol
      local r8_83 = r7_83:bt_GetParamX()
      r0_83:DrawConfigNo(r8_83, r7_83.DRAW_POS.x + r7_83.EVENT_RECT.w / 2, r7_83.DRAW_POS.y + 25)
      r0_83:SetTestVoiceVol(r8_83 * 10)
    end
    r0_83:SetSlideActP3(r1_83)
    if r1_83 == -1 or r0_83.ItemP3.selCursor_selName ~= r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, -1, -1, -1, -1, -1)
    end
    if "VoiceSkipOn" == r1_83 or "VoiceSkipOff" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_VoiceSkip, -1, -1, "expVoiceSkip")
    end
    if "VoiceRLOn" == r1_83 or "VoiceRLOff" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_VoiceRL, -1, -1, "expVoiceRL")
    end
    if "BgvStopOn" == r1_83 or "BgvStopOff" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_BgvStop, -1, -1, "expBgvStop")
    end
    for r10_83 = 0, r0_83.selCharMax - 1, 1 do
      if string.format("VoiceChar%03d", r10_83 + 1) == r1_83 then
        r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_CharVol, -1, -1, "expCharVol")
      end
    end
    if "SL_MasterVol" == r1_83 or "SL_MasterVolBk" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_MasterVol, r0_83.ItemP3.Headline_barMasterVol, r0_83.ItemP3.Headline_barMasterVolB, "expMasterVol")
    end
    if "SL_BgmVol" == r1_83 or "SL_BgmVolBk" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_BgmVol, r0_83.ItemP3.Headline_barBgmVol, r0_83.ItemP3.Headline_barBgmVolB, "expBgmVol")
    end
    if "SL_SeVol" == r1_83 or "SL_SeVolBk" == r1_83 or "SeTest" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_SeVol, r0_83.ItemP3.Headline_barSeVol, r0_83.ItemP3.Headline_barSeVolB, "expSeVol")
    end
    if "SL_SysSeVol" == r1_83 or "SL_SysSeVolBk" == r1_83 or "SysSeTest" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_SysSeVol, r0_83.ItemP3.Headline_barSysSeVol, r0_83.ItemP3.Headline_barSysSeVolB, "expSysSeVol")
    end
    if "SL_MovieVol" == r1_83 or "SL_MovieVolBk" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_MovieVol, r0_83.ItemP3.Headline_barMovieVol, r0_83.ItemP3.Headline_barMovieVolB, "expMovieVol")
    end
    if "SL_VoiceVol" == r1_83 or "SL_VoiceVolBk" == r1_83 or "VoiceTest" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_VoiceVol, r0_83.ItemP3.Headline_barVoiceVol, r0_83.ItemP3.Headline_barVoiceVolB, "expVoiceVol")
    end
    if "SL_SysVoiceVol" == r1_83 or "SL_SysVoiceVolBk" == r1_83 or "SysVoiceTest" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_SysVoiceVol, r0_83.ItemP3.Headline_barSysVoiceVol, r0_83.ItemP3.Headline_barSysVoiceVolB, "expSysVoiceVol")
    end
    if "SL_BgvVol" == r1_83 or "SL_BgvVolBk" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_BgvVol, r0_83.ItemP3.Headline_barBgvVol, r0_83.ItemP3.Headline_barBgvVolB, "expBgvVol")
    end
    if "SL_VoiceBgmVol" == r1_83 or "SL_VoiceBgmVolBk" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_VoiceBgmVol, r0_83.ItemP3.Headline_barVoiceBgmVol, r0_83.ItemP3.Headline_barVoiceBgmVolB, "expVoiceBgmVol")
    end
    if "SL_CharVol" == r1_83 or "SL_CharVolBk" == r1_83 then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_CharVoice, r0_83.ItemP3.Headline_barCharVol, r0_83.ItemP3.Headline_barCharVolB, "expCharVol")
    end
    if r1_83 == "CharTest" then
      if r0_83.ItemP3.expCharTest ~= nil then
        r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_CharVoice, -1, -1, "expCharTest")
      else
        r0_83:ItemSet(r0_83.ItemP3, r1_83, r0_83.ItemP3.Headline_CharVoice, -1, -1, "expCharVol")
      end
    end
    if "SysVoiceEx" == r1_83 and r0_83.ItemP3.expSysVoiceEx ~= nil then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, -1, -1, -1, "expSysVoiceEx")
    end
    if "SysVoiceRa" == r1_83 and r0_83.ItemP3.expSysVoiceRa ~= nil then
      r0_83:ItemSet(r0_83.ItemP3, r1_83, -1, -1, -1, "expSysVoiceRa")
    end
  end
  function g_Menu.Config.ptr.DataNoName(r0_84, r1_84, r2_84)
    -- line: [4398, 4404] id: 84
    local r3_84 = nil	-- notice: implicit variable refs by block#[3]
    if r1_84 == true then
      r3_84 = "Save"
      if not r3_84 then
        ::label_5::
        r3_84 = "Load"
      end
    else
      goto label_5	-- block#2 is visited secondly
    end
    return string.format("P4DataNo%s%04d", r3_84, r2_84)
  end
  function g_Menu.Config.ptr.DataOverName(r0_85, r1_85, r2_85)
    -- line: [4406, 4413] id: 85
    local r3_85 = nil	-- notice: implicit variable refs by block#[3]
    if r1_85 == true then
      r3_85 = "Save"
      if not r3_85 then
        ::label_5::
        r3_85 = "Load"
      end
    else
      goto label_5	-- block#2 is visited secondly
    end
    return string.format("P4DataTh%s%04d", r3_85, r2_85)
  end
  function g_Menu.Config.ptr.DataPage_SetActive(r0_86, r1_86, r2_86, r3_86)
    -- line: [4416, 4643] id: 86
    -- notice: unreachable block#54
    -- notice: unreachable block#55
    -- notice: unreachable block#62
    -- notice: unreachable block#56
    -- notice: unreachable block#22
    -- notice: unreachable block#63
    -- notice: unreachable block#50
    -- notice: unreachable block#23
    -- notice: unreachable block#47
    -- notice: unreachable block#24
    -- notice: unreachable block#59
    -- notice: unreachable block#52
    -- notice: unreachable block#46
    -- notice: unreachable block#21
    -- notice: unreachable block#25
    -- notice: unreachable block#60
    -- notice: unreachable block#48
    -- notice: unreachable block#53
    -- notice: unreachable block#51
    -- notice: unreachable block#57
    -- notice: unreachable block#61
    -- notice: unreachable block#64
    -- notice: unreachable block#58
    -- notice: unreachable block#49
    local r4_86 = cclass.lua_Layers:create()
    if g_dataInfo.tab == 1 then
      r0_86.ButtonP45.PageBase1:bt_SetActive(1)
      r0_86.ButtonP45.PageBase2:bt_SetActive(0)
      for r8_86 = 1, 21, 1 do
        local r9_86 = "Page" .. tostring(r8_86)
        if 1 <= r8_86 and r8_86 <= 10 or r8_86 == 21 then
          if g_dataInfo.page == r8_86 then
            r0_86.ButtonP45[r9_86]:bt_SetActive(1)
          else
            r0_86.ButtonP45[r9_86]:bt_SetActive(0)
          end
        else
          r0_86.ButtonP45[r9_86]:bt_SetActive(3)
        end
      end
    else
      r0_86.ButtonP45.PageBase1:bt_SetActive(0)
      r0_86.ButtonP45.PageBase2:bt_SetActive(1)
      for r8_86 = 1, 21, 1 do
        local r9_86 = "Page" .. tostring(r8_86)
        if 11 <= r8_86 and r8_86 <= 20 or r8_86 == 21 then
          if g_dataInfo.page == r8_86 then
            r0_86.ButtonP45[r9_86]:bt_SetActive(1)
          else
            r0_86.ButtonP45[r9_86]:bt_SetActive(0)
          end
        else
          r0_86.ButtonP45[r9_86]:bt_SetActive(3)
        end
      end
    end
    for r8_86 = 1, 10, 1 do
      local r9_86 = "Data" .. tostring(r8_86)
      r0_86.ButtonP45[r9_86]:bt_SetActive(0)
      if r2_86 == true then
        if g_dataInfo.page == g_DATAPAGEMAX then
          r0_86.ButtonP45[r9_86]:bt_SetActive(2)
        end
        if g_sortData:GetProtect(r8_86 + (g_dataInfo.page - 1) * 10) then
          r0_86.ButtonP45[r9_86]:bt_SetActive(2)
        end
      elseif g_dataInfo.page == g_DATAPAGEMAX then
        local r10_86 = r8_86
        if r8_86 <= 5 then
          if g_autoOrder[r10_86] > 0 then
            r0_86.ButtonP45[r9_86]:bt_SetActive(0)
          else
            r0_86.ButtonP45[r9_86]:bt_SetActive(2)
          end
        elseif g_quickOrder[r10_86 - 5] > 0 then
          r0_86.ButtonP45[r9_86]:bt_SetActive(0)
        else
          r0_86.ButtonP45[r9_86]:bt_SetActive(2)
        end
      elseif cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r8_86) == false then
        r0_86.ButtonP45[r9_86]:bt_SetActive(2)
      else
        r0_86.ButtonP45[r9_86]:bt_SetActive(0)
      end
      updateNewIcon(r1_86, g_dataInfo.page, r2_86)
    end
  end
  function g_Menu.Config.ptr.SelCursorP4(r0_87, r1_87, r2_87, r3_87)
    -- line: [4649, 4651] id: 87
    r0_87:SelCursorP5(r1_87, r2_87, r3_87)
  end
  function g_Menu.Config.ptr.SelCursorP5(r0_88, r1_88, r2_88, r3_88)
    -- line: [4652, 4679] id: 88
    local r4_88 = ConfigGetPageKeyName(4)
    if g_configPage == 5 then
      r4_88 = ConfigGetPageKeyName(5)
    end
  end
  function g_Menu.Config.ptr.DataPage_ButtonJobLD(r0_89, r1_89, r2_89, r3_89, r4_89)
    -- line: [4682, 4685] id: 89
  end
  function g_Menu.Config.ptr.DataPage_ButtonJobLU(r0_90, r1_90, r2_90, r3_90, r4_90)
    -- line: [4686, 4818] id: 90
    -- notice: unreachable block#34
    -- notice: unreachable block#36
    -- notice: unreachable block#38
    -- notice: unreachable block#37
    -- notice: unreachable block#48
    -- notice: unreachable block#31
    -- notice: unreachable block#35
    -- notice: unreachable block#33
    -- notice: unreachable block#8
    -- notice: unreachable block#30
    -- notice: unreachable block#32
    local r5_90 = -1
    if 401 <= r1_90 and r1_90 <= 422 then
      r5_90 = g_dataInfo.page
      g_dataInfo.page = r1_90 - 400
    end
    if 431 <= r1_90 and r1_90 <= 441 then
      g_dataInfo.data_no = r1_90 - 431
      local r6_90 = g_configPage
      if r6_90 == 4 then
        r6_90 = true
      else
        r6_90 = false
      end
      if r6_90 == true then
        local r7_90 = (g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1
        if cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, r7_90) == false then
          cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SAVEGAME, r7_90)
          g_SavedDataUpdateWeight = true
          cfunc.LegacyGame__lua_SetSaveComment(g_saveComment)
          if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
            r0_90:SetConfigButtonActive(r0_90.MenuInf.beforePage)
          end
        else
          openConfirm(LUA_CONFIRM_OVERWRITE)
        end
        r0_90.SaveJob = 4
      elseif g_dataInfo.page == g_DATAPAGEMAX then
        local r7_90 = g_dataInfo.data_no + 1
        if r7_90 < 6 and g_autoOrder[r7_90] > 0 then
          if cfunc.CSaveDataManager__lua_GetEnabled(DATA_MODE_AUTO, g_autoOrder[r7_90]) then
            openConfirm(LUA_CONFIRM_LOAD)
          else
            local r9_90 = cclass.lua_Sounds:new()
            r9_90:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.error), g_SysSEName.error, getSoundVolume("systemse"))
            r9_90:delete()
          end
        elseif g_quickOrder[r7_90 - 5] > 0 then
          if cfunc.CSaveDataManager__lua_GetEnabled(DATA_MODE_QUICK, g_quickOrder[r7_90 - 5]) then
            openConfirm(LUA_CONFIRM_LOAD)
          else
            local r9_90 = cclass.lua_Sounds:new()
            r9_90:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.error), g_SysSEName.error, getSoundVolume("systemse"))
            r9_90:delete()
          end
        end
      else
        local r7_90 = (g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1
        if cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, r7_90) == true then
          if cfunc.CSaveDataManager__lua_GetEnabled(DATA_MODE_NORMAL, r7_90) then
            openConfirm(LUA_CONFIRM_LOAD)
          else
            local r10_90 = cclass.lua_Sounds:new()
            r10_90:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.error), g_SysSEName.error, getSoundVolume("systemse"))
            r10_90:delete()
          end
        end
      end
    end
    if r1_90 == 490 then
      g_dataInfo.tab = 1
    end
    if r1_90 == 491 then
      g_dataInfo.tab = 2
    end
    if 401 <= r1_90 and r1_90 <= 500 then
      local r6_90 = ConfigGetPageKeyName(g_configPage)
      local r7_90 = g_configPage
      if r7_90 == 4 then
        r7_90 = true
      else
        r7_90 = false
      end
      r0_90:deleteThumbnail(r7_90)
      for r11_90 = 1, 10, 1 do
        initThumbnail(r7_90, r11_90 + (g_dataInfo.page - 1) * 10, false)
      end
      r0_90:DataPage_SetActive(r6_90, r7_90, r5_90)
    end
  end
  g_Menu.Config.ptr.SaveJob = 0
  function g_Menu.Config.ptr.initDataPage(r0_91, r1_91, r2_91, r3_91)
    -- line: [4823, 4941] id: 91
    -- notice: unreachable block#19
    initDataOrder()
    if g_dataInfo.init == false then
      r0_91:initDataPageNo()
      g_dataInfo.init = true
    end
    if g_sortData == nil then
      g_sortData = cclass.lua_DataSort:new(0, g_sortType, g_sortOrder, 100)
    end
    g_sortData:ResetMark()
    local r4_91 = cclass.lua_Layers:create()
    if r3_91 == true then
      if r2_91 == true then
      end
      r4_91:initSubLayer("configBase", r1_91, 87, 1)
      if g_dataInfo.tab ~= nil then
        if g_dataInfo.tab <= 0 then
          g_dataInfo.tab = 1
        end
      else
        g_dataInfo.tab = 1
      end
      r0_91.ButtonP45 = {}
      for r8_91 = 1, 11, 1 do
        local r10_91 = 54 - r8_91 - 1
        r0_91:MenuButtonSet(r0_91.ButtonP45, "Page" .. tostring(r8_91), 1, r1_91, r10_91, r10_91, 80 - r8_91 - 1, 67 - r8_91 - 1, -1, 401 + r8_91 - 1, 0, 0)
      end
      for r8_91 = 1, 11, 1 do
        local r10_91 = 108 - r8_91 - 1
        r0_91:MenuButtonSet(r0_91.ButtonP45, "Page" .. tostring(r8_91 + 10), 1, r1_91, r10_91, r10_91, 134 - r8_91 - 1, 121 - r8_91 - 1, -1, 401 + r8_91 - 1 + 10, 0, 0)
      end
      r0_91:MenuButtonSet(r0_91.ButtonP45, "PageBase1", 1, r1_91, 153, 165, 161, 157, 169, 490, 0, 0)
      r0_91:MenuButtonSet(r0_91.ButtonP45, "PageBase2", 1, r1_91, 152, 164, 160, 156, 168, 491, 0, 0)
      for r8_91 = 1, 10, 1 do
        local r10_91 = 5 + r8_91 - 1
        local r12_91 = -1
        r0_91:MenuButtonSet(r0_91.ButtonP45, "Data" .. tostring(r8_91), 1, r1_91, r10_91, r10_91, 17 + r8_91 - 1, -1, 29 + r8_91 - 1, 431 + r8_91 - 1, 0, 0)
        initThumbnail(r2_91, r8_91 + (g_dataInfo.page - 1) * 10, false)
      end
      r0_91.MenuButton:InitList()
      r0_91.MenuButton:SetList("ButtonP45", r0_91.ButtonP45)
      r0_91.MenuButton:InitButton()
    else
      r0_91:deleteThumbnail(r2_91)
    end
    r0_91:DataPage_SetActive(r1_91, r2_91, -1)
  end
  function g_Menu.Config.ptr.deleteThumbnail(r0_92, r1_92)
    -- line: [4946, 4969] id: 92
    local r2_92 = cclass.lua_Layers:create()
    for r6_92 = 1, 10, 1 do
      local r7_92 = getSaveThumbKey(r1_92, r6_92)
      r2_92:cancelEffect("configBase", r7_92, "Update")
      r2_92:setParam("configBase", r7_92, LUA_PARAM_SCALE, 1, 1, 1, 0)
      r2_92:removeLayer("configBase", r7_92)
      r2_92:removeLayer("configBase", getSaveThumbTxt(r1_92, r6_92))
      r2_92:removeLayer("configBase", getSaveThumbTimeTxt(r1_92, r6_92))
      if g_UseSaveNoTxt == true then
        r2_92:removeLayer("configBase", getSaveThumbNoTxt(r1_92, r6_92))
      end
      r2_92:removeLayer("configBase", r0_92:DataOverName(r1_92, r6_92))
    end
  end
  function g_Menu.Config.ptr.initDataPageNo(r0_93)
    -- line: [4974, 5003] id: 93
    -- notice: unreachable block#8
    -- notice: unreachable block#6
    -- notice: unreachable block#7
    local r1_93 = 0
    local r2_93 = 0
    r1_93, r2_93 = cfunc.CSaveDataManager__lua_FindNewData(0, r1_93, r2_93)
    if r1_93 == 0 then
      g_dataInfo.page = math.floor((r2_93 - 1) / 10 + 1)
      if g_dataInfo.page <= 10 then
        g_dataInfo.tab = 1
      else
        g_dataInfo.tab = 2
      end
    elseif r1_93 == 1 then
      g_dataInfo.page = g_DATAPAGEMAX
      g_dataInfo.tab = 1
    end
  end
  function g_Menu.Config.ptr.effectThumbnail(r0_94, r1_94, r2_94, r3_94, r4_94, r5_94, r6_94, r7_94)
    -- line: [5006, 5130] id: 94
    local r8_94 = cclass.lua_Layers:create()
    local r9_94 = getEffectRate()
    local r10_94 = r5_94
    r5_94 = r5_94 / 2
    for r14_94 = 1, 10, 1 do
      local r15_94 = getSaveThumbKey(r1_94, r14_94)
      local r16_94 = getSaveThumbTxt(r1_94, r14_94)
      local r17_94 = getSaveThumbTimeTxt(r1_94, r14_94)
      local r18_94 = getSaveThumbNoTxt(r1_94, r14_94)
      r8_94:cancelEffect("configBase", r15_94, "Update")
      r8_94:setParam("configBase", r15_94, LUA_PARAM_SCALE, 1, 1, 1, 0)
      local r19_94 = r0_94:DataOverName(r1_94, r14_94)
      if r2_94 ~= true then
        if r6_94 == false then
          local r20_94 = r7_94
          r8_94:setParam("configBase", r15_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_94:setParam("configBase", r16_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_94:setParam("configBase", r17_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_94:setParam("configBase", r19_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_94:setEffect("configBase", r15_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r20_94)
          r8_94:setEffect("configBase", r16_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r20_94)
          r8_94:setEffect("configBase", r17_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r20_94)
          r8_94:setEffect("configBase", r19_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r20_94)
          if g_UseSaveNoTxt then
            r8_94:setParam("configBase", r18_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_94:setEffect("configBase", r18_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r20_94)
          end
        else
          local r20_94 = r5_94
          if r0_94.PageSlide then
            r20_94 = 100
          end
          r8_94:setEffect("configBase", r15_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_94, 0, r7_94)
          r8_94:setEffect("configBase", r16_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_94, 0, r7_94)
          r8_94:setEffect("configBase", r17_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_94, 0, r7_94)
          r8_94:setEffect("configBase", r19_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_94, 0, r7_94)
          if g_UseSaveNoTxt then
            r8_94:setEffect("configBase", r18_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_94, 0, r7_94)
          end
        end
        r8_94:startEffect("configBase", r15_94, "ConfigPage", 0)
        r8_94:startEffect("configBase", r16_94, "ConfigPage", 0)
        r8_94:startEffect("configBase", r17_94, "ConfigPage", 0)
        r8_94:startEffect("configBase", r19_94, "ConfigPage", 0)
        if g_UseSaveNoTxt then
          r8_94:startEffect("configBase", r18_94, "ConfigPage", 0)
        end
        if r0_94.PageSlide then
          if r6_94 == false then
            local r20_94 = 0
            local r21_94 = 0
            local r22_94 = 0
            local r23_94 = 0
            r20_94, r21_94, r22_94, r23_94 = r8_94:getParam("configBase", r15_94, LUA_PARAM_POS, r20_94, r21_94, r22_94, r23_94)
            r8_94:setParam("configBase", r15_94, LUA_PARAM_POS, r20_94 - r4_94, r21_94, r22_94, r23_94)
            r20_94, r21_94, r22_94, r23_94 = r8_94:getParam("configBase", r16_94, LUA_PARAM_POS, r20_94, r21_94, r22_94, r23_94)
            r8_94:setParam("configBase", r16_94, LUA_PARAM_POS, r20_94 - r4_94, r21_94, r22_94, r23_94)
            r20_94, r21_94, r22_94, r23_94 = r8_94:getParam("configBase", r17_94, LUA_PARAM_POS, r20_94, r21_94, r22_94, r23_94)
            r8_94:setParam("configBase", r17_94, LUA_PARAM_POS, r20_94 - r4_94, r21_94, r22_94, r23_94)
            r8_94:setParam("configBase", r15_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_94:setParam("configBase", r16_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_94:setParam("configBase", r17_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_94:setEffect("configBase", r15_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r7_94)
            r8_94:setEffect("configBase", r16_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r7_94)
            r8_94:setEffect("configBase", r17_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r7_94)
            if g_UseSaveNoTxt then
              r20_94, r21_94, r22_94, r23_94 = r8_94:getParam("configBase", r18_94, LUA_PARAM_POS, r20_94, r21_94, r22_94, r23_94)
              r8_94:setParam("configBase", r18_94, LUA_PARAM_POS, r20_94 - r4_94, r21_94, r22_94, r23_94)
              r8_94:setParam("configBase", r18_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
              r8_94:setEffect("configBase", r18_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r7_94)
            end
            r20_94, r21_94, r22_94, r23_94 = r8_94:getParam("configBase", r19_94, LUA_PARAM_POS, r20_94, r21_94, r22_94, r23_94)
            r8_94:setParam("configBase", r19_94, LUA_PARAM_POS, r20_94 - r4_94, r21_94, r22_94, r23_94)
            r8_94:setParam("configBase", r19_94, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_94:setEffect("configBase", r19_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_94, 0, r7_94)
          else
            r8_94:setEffect("configBase", r15_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_94, 0, r7_94)
            r8_94:setEffect("configBase", r16_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_94, 0, r7_94)
            r8_94:setEffect("configBase", r17_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_94, 0, r7_94)
            if g_UseSaveNoTxt then
              r8_94:setEffect("configBase", r18_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_94, 0, r7_94)
            end
            r8_94:setEffect("configBase", r19_94, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_94, 0, r7_94)
          end
          r8_94:setEffect("configBase", r15_94, "ConfigPage", LUA_EFFECT_POS, r4_94, 0, 0, 0, 2, r10_94, 0, r7_94)
          r8_94:startEffect("configBase", r15_94, "ConfigPage", 0)
          r8_94:setEffect("configBase", r16_94, "ConfigPage", LUA_EFFECT_POS, r4_94, 0, 0, 0, 2, r10_94, 0, r7_94)
          r8_94:startEffect("configBase", r16_94, "ConfigPage", 0)
          r8_94:setEffect("configBase", r17_94, "ConfigPage", LUA_EFFECT_POS, r4_94, 0, 0, 0, 2, r10_94, 0, r7_94)
          r8_94:startEffect("configBase", r17_94, "ConfigPage", 0)
          if g_UseSaveNoTxt then
            r8_94:setEffect("configBase", r18_94, "ConfigPage", LUA_EFFECT_POS, r4_94, 0, 0, 0, 2, r10_94, 0, r7_94)
            r8_94:startEffect("configBase", r18_94, "ConfigPage", 0)
          end
          r8_94:setEffect("configBase", r19_94, "ConfigPage", LUA_EFFECT_POS, r4_94, 0, 0, 0, 2, r10_94, 0, r7_94)
          r8_94:startEffect("configBase", r19_94, "ConfigPage", 0)
        end
      end
    end
  end
  function g_Menu.Config.ptr.GetIconName(r0_95, r1_95)
    -- line: [5136, 5140] id: 95
    return string.format("gestureIcon%03d", r1_95)
  end
  function g_Menu.Config.ptr.GetDropName(r0_96, r1_96)
    -- line: [5142, 5146] id: 96
    return string.format("Drop%03d", r1_96)
  end
  function g_Menu.Config.ptr.loadIcon(r0_97)
    -- line: [5149, 5160] id: 97
    local r1_97 = getUItype()
    if r1_97 == 0 then
      r0_97:MenuLoadLayer("GestureIcon", "Sys_Arrow.pna")
    end
    if r1_97 == 1 then
      r0_97:MenuLoadLayer("GestureIcon", "Sys_Arrow.pna")
    end
    if r1_97 == 2 then
    end
  end
  function g_Menu.Config.ptr.deleteIcon(r0_98)
    -- line: [5162, 5165] id: 98
    cclass.lua_Layers:create():removeLayer("configBase", "GestureIcon")
  end
  function g_Menu.Config.ptr.GetIconLay(r0_99, r1_99)
    -- line: [5168, 5171] id: 99
    return 14 - r1_99
  end
  function g_Menu.Config.ptr.Page7_SetActive(r0_100)
    -- line: [5175, 5206] id: 100
    local r1_100 = cclass.lua_Layers:create()
    for r5_100 = 1, g_ArrowMax, 1 do
      r0_100.ButtonP7[r0_100:GetIconName(r5_100)]:bt_SetDefPos()
      local r6_100 = r0_100:GetDropName(r5_100 + 10)
      r0_100.ButtonDropP7[r6_100]:bt_SetActive(0)
      r0_100.ButtonDropP7[r6_100]:bt_SetDefPos()
    end
    for r5_100, r6_100 in pairs(g_gestureFunc) do
      r0_100.ButtonP7[r0_100:GetIconName(r6_100 + 1)]:bt_SetPos(r0_100.DropP7[r5_100].x, r0_100.DropP7[r5_100].y)
      local r7_100 = r0_100:GetDropName(r6_100 + 1 + 10)
      r0_100.ButtonDropP7[r7_100]:bt_SetActive(2)
      r0_100.ButtonDropP7[r7_100]:bt_SetPos(r0_100.DropP7[r5_100].x, r0_100.DropP7[r5_100].y)
    end
    if r0_100.ButtonP7.GestureOn ~= nil then
      if g_gestureDisable == true then
        r0_100.ButtonP7.GestureOn:bt_SetActive(4)
        r0_100.ButtonP7.GestureOff:bt_SetActive(0)
      else
        r0_100.ButtonP7.GestureOn:bt_SetActive(0)
        r0_100.ButtonP7.GestureOff:bt_SetActive(4)
      end
    end
  end
  function g_Menu.Config.ptr.DragStart(r0_101, r1_101, r2_101, r3_101)
    -- line: [5209, 5246] id: 101
    r1_101 = r1_101 - 701
    r0_101.MenuButton.onDropFlag = true
    r0_101.DropParam.DropNo = r1_101
    r0_101.DropParam.Before = -1
    for r7_101, r8_101 in pairs(g_gestureFunc) do
      if r8_101 == r1_101 then
        r0_101.DropParam.Before = r7_101
        break
      end
    end
    if r0_101.DropParam.Before == -1 then
      for r7_101 = 1, g_ArrowMax, 1 do
        r0_101.ButtonDropP7[r0_101:GetDropName(r7_101 + 10)]:bt_SetActive(2)
      end
    else
      r0_101:Page7_SetActive()
    end
    local r4_101 = r0_101:GetIconName(r1_101 + 1)
    r0_101.DropParam.DRAGST_X = r0_101.ButtonP7[r4_101].DRAW_POS.x - r2_101
    r0_101.DropParam.DRAGST_Y = r0_101.ButtonP7[r4_101].DRAW_POS.y - r3_101
    cclass.lua_Layers:create():setSubLayerParam("configBase", "GestureIcon", r0_101:GetIconLay(r0_101.DropParam.DropNo), LUA_PARAM_COLOR, 1, 1, 1, 0.8)
  end
  function g_Menu.Config.ptr.DragEnd(r0_102, r1_102, r2_102, r3_102)
    -- line: [5248, 5292] id: 102
    local r4_102 = cclass.lua_Layers:create()
    r0_102.MenuButton.onDropFlag = false
    if r0_102.DropParam.DropNo ~= -1 then
      if 751 <= r1_102 and r1_102 <= 754 then
        r1_102 = r1_102 - 750
        if r0_102.DropParam.Before == -1 then
          local r6_102 = r0_102:GetIconName(g_gestureFunc[r1_102] + 1)
        else
          local r5_102 = g_gestureFunc[r0_102.DropParam.Before]
          g_gestureFunc[r0_102.DropParam.Before] = g_gestureFunc[r1_102]
        end
        g_gestureFunc[r1_102] = r0_102.DropParam.DropNo
        r0_102:Page7_SetActive()
      end
      if 761 <= r1_102 and r1_102 <= 775 and r0_102.DropParam.Before ~= -1 then
        g_gestureFunc[r0_102.DropParam.Before] = r1_102 - 761
        r0_102:Page7_SetActive()
      end
      cclass.lua_Layers:create():setSubLayerVisible("configBase", "GestureIcon", r0_102:GetIconLay(r0_102.DropParam.DropNo), 0)
      r0_102.DropParam.DropNo = -1
      r0_102.DropParam.Before = -1
      r0_102.DropParam.DRAGST_X = 0
      r0_102.DropParam.DRAGST_Y = 0
    end
  end
  function g_Menu.Config.ptr.DragOn(r0_103, r1_103, r2_103)
    -- line: [5294, 5308] id: 103
    if r0_103.DropParam.DropNo ~= -1 then
      local r3_103 = cclass.lua_Layers:create()
      local r4_103 = 0
      local r5_103 = 0
      local r8_103 = r0_103:GetIconLay(r0_103.DropParam.DropNo)
      r3_103:setSubLayerParam("configBase", "GestureIcon", r8_103, LUA_PARAM_POS, r1_103 + r0_103.DropParam.DRAGST_X, r2_103 + r0_103.DropParam.DRAGST_Y, 0, 0)
      r3_103:setSubLayerVisible("configBase", "GestureIcon", r8_103, 1)
    end
  end
  function g_Menu.Config.ptr.P7_ButtonJobLD(r0_104, r1_104, r2_104, r3_104, r4_104)
    -- line: [5311, 5315] id: 104
    if 701 <= r1_104 and r1_104 <= 714 then
      r0_104:DragStart(r1_104, r3_104, r4_104)
    end
  end
  function g_Menu.Config.ptr.P7_ButtonJobLU(r0_105, r1_105, r2_105, r3_105, r4_105)
    -- line: [5317, 5334] id: 105
    if 701 <= r1_105 and r1_105 <= 800 then
      if r1_105 == 770 then
        g_gestureDisable = true
        r0_105:Page7_SetActive()
      end
      if r1_105 == 771 then
        g_gestureDisable = false
        r0_105:Page7_SetActive()
      end
    end
    local r5_105 = 0
    if r0_105.MenuButton.selCursor ~= -1 then
      r5_105 = r0_105.MenuButton.selListKey[r0_105.MenuButton.selCursor].bt_l
    end
    r0_105:DragEnd(r5_105)
  end
  function g_Menu.Config.ptr.initConfigP7(r0_106, r1_106, r2_106)
    -- line: [5342, 5444] id: 106
    if r2_106 then
      local r3_106 = cclass.lua_Layers:create()
      r3_106:initSubLayer("configBase", r1_106, 57, 1)
      r3_106:initSubLayer("configBase", r1_106, 79, 1)
      r3_106:initSubLayer("configBase", r1_106, 80, 1)
      r3_106:initSubLayer("configBase", r1_106, 81, 1)
      r0_106:loadIcon()
      r0_106.ButtonP7 = {}
      r0_106.ButtonDropP7 = {}
      r0_106.DropNo = -1
      for r7_106 = 1, g_ArrowMax, 1 do
        local r8_106 = r0_106:GetIconName(r7_106)
        local r9_106 = 22 - r7_106 - 1
        r0_106:MenuButtonSet(r0_106.ButtonP7, r8_106, 1, r1_106, r9_106, r9_106, 38 - r7_106 - 1, -1, -1, r7_106 + 700, 0, 0)
        r0_106:MenuButtonSet(r0_106.ButtonDropP7, r0_106:GetDropName(r7_106 + 10), 1, r1_106, 54 - r7_106 - 1, -1, -1, -1, -1, r7_106 + 760, 0, 0)
        r3_106:initSubLayer("configBase", "GestureIcon", r0_106:GetIconLay(r7_106 - 1), 0)
      end
      for r7_106 = 1, 4, 1 do
        local r8_106 = -1
        r0_106:MenuButtonSet(r0_106.ButtonDropP7, r0_106:GetDropName(r7_106), 1, r1_106, 2 + r7_106 - 1, -1, -1, -1, -1, r7_106 + 750, 0, 0)
        r8_106 = 2 + r7_106 - 1
        r3_106:initSubLayer("configBase", r1_106, r8_106, 0)
        local r11_106 = 0
        local r12_106 = 0
        local r13_106 = 0
        local r14_106 = 0
        r11_106, r12_106, r13_106, r14_106 = r3_106:getSubLayerParam("configBase", r1_106, r8_106, LUA_PARAM_POS, 0, 0, 0, 0)
        local r15_106 = 0
        local r16_106 = 0
        r15_106, r16_106, r13_106, r14_106 = r3_106:getSubLayerParam("configBase", r1_106, r8_106, LUA_PARAM_SIZE, 0, 0, 0, 0)
        r0_106.DropP7[r7_106] = {
          x = r11_106,
          y = r12_106,
          w = r15_106 + r11_106,
          h = r16_106 + r12_106,
        }
      end
      r0_106:MenuButtonSet(r0_106.ButtonP7, "GestureOn", 1, r1_106, 65, 65, 69, 73, -1, 770, 0, 0)
      r0_106:MenuButtonSet(r0_106.ButtonP7, "GestureOff", 1, r1_106, 66, 66, 70, 74, -1, 771, 0, 0)
      r0_106.ItemP7 = r0_106:ItemSetInit()
      r0_106.ItemP7.GestureOnOFF = MenuItem.new("configBase", r1_106, 60, 61)
      r0_106.MenuButton:InitList()
      r0_106.MenuButton:SetList("ButtonP7", r0_106.ButtonP7)
      r0_106.MenuButton:SetDropList("ButtonDropP7", r0_106.ButtonDropP7)
      r0_106.MenuButton:InitButton()
    end
    r0_106:Page7_SetActive()
  end
  function g_Menu.Config.ptr.SelCursorP7(r0_107, r1_107, r2_107, r3_107, r4_107)
    -- line: [5446, 5528] id: 107
    local r5_107 = cclass.lua_Layers:create()
    if r1_107 ~= -1 then
      r0_107:DragOn(r3_107, r4_107)
    end
    if r2_107 == -1 or r0_107.ItemP7.selCursor_selName ~= r2_107 then
      r0_107:ItemSet(r0_107.ItemP7, -1, -1, -1, -1, -1)
    end
    if r2_107 == "GestureOn" then
      if r0_107.ItemP7.expGestureOn ~= nil then
        if r0_107.ItemP7.GestureOnOFF ~= nil then
          r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, "GestureOnOFF", -1, "expGestureOn")
        else
          r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, -1, -1, "expGestureOn")
        end
      elseif r0_107.ItemP7.GestureOnOFF ~= nil then
        if r0_107.ItemP7.expGesture ~= nil then
          r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, "GestureOnOFF", -1, "expGesture")
        else
          r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, "GestureOnOFF", -1, -1)
        end
      elseif r0_107.ItemP7.expGesture ~= nil then
        r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, -1, -1, "expGesture")
      else
        r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, -1, -1, -1)
      end
    end
    if r2_107 == "GestureOff" then
      if r0_107.ItemP7.expGestureOff ~= nil then
        if r0_107.ItemP7.GestureOnOFF ~= nil then
          r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, "GestureOnOFF", -1, "expGestureOff")
        else
          r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, -1, -1, "expGestureOff")
        end
      elseif r0_107.ItemP7.GestureOnOFF ~= nil then
        if r0_107.ItemP7.expGesture ~= nil then
          r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, "GestureOnOFF", -1, "expGesture")
        else
          r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, "GestureOnOFF", -1, -1)
        end
      elseif r0_107.ItemP7.expGesture ~= nil then
        r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, -1, -1, "expGesture")
      else
        r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, -1, -1, -1)
      end
    end
    for r9_107 = 1, g_ArrowMax, 1 do
      if r0_107:GetIconName(r9_107) == r2_107 and r0_107.ItemP7.expGestureIcon ~= nil then
        r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, -1, -1, "expGestureIcon")
      end
      if r0_107:GetDropName(10 + r9_107) == r2_107 and r0_107.ItemP7.expDrop ~= nil then
        r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, -1, -1, "expDrop")
      end
    end
    for r9_107 = 1, 4, 1 do
      if r0_107:GetDropName(r9_107) == r2_107 and r0_107.ItemP7.expDrop ~= nil then
        r0_107:ItemSet(r0_107.ItemP7, r2_107, -1, -1, -1, "expDrop")
      end
    end
  end
  function g_Menu.Config.ptr.effectP7(r0_108, r1_108, r2_108, r3_108, r4_108, r5_108)
    -- line: [5531, 5541] id: 108
    local r6_108 = cclass.lua_Layers:create()
    local r7_108 = getEffectRate()
    if r1_108 == true then
    end
  end
  if g_EnableNMS then
    function g_Menu.Config.ptr.Page8_SetInitParam(r0_109)
      -- line: [5553, 5568] id: 109
      if 10 < g_NmsPlay.Param and 1 <= g_NmsPlay.Act then
        if g_NmsPlay.Param - 10 < g_NmsPlay.Act then
          g_NmsPlay.Slide = g_NmsPlay.Param - 10
        else
          g_NmsPlay.Slide = g_NmsPlay.Act - 1
        end
      end
    end
    function g_Menu.Config.ptr.Page8_SetActive(r0_110)
      -- line: [5572, 5582] id: 110
      r0_110:SetEntryBarBt()
      r0_110:SetEntryText()
    end
    g_Menu.Config.ptr.P8ChangeSceneNo = g_NmsPlay.Act
    g_Menu.Config.ptr.P8SlideFlag = 0
    function g_Menu.Config.ptr.P8_ButtonJobLD(r0_111, r1_111, r2_111, r3_111, r4_111)
      -- line: [5587, 5594] id: 111
      if 801 <= r1_111 and r1_111 <= 900 and r1_111 == 801 then
        r0_111.P8SlideFlag = 1
        g_NmsPlay.Slide = r0_111.ButtonP8Slide.SlideBar:bt_GetParamY()
      end
    end
    function g_Menu.Config.ptr.P8_ButtonJobLU(r0_112, r1_112, r2_112, r3_112, r4_112)
      -- line: [5596, 5649] id: 112
      if 801 <= r1_112 and r1_112 <= 900 then
        if r1_112 == 802 then
          local r5_112 = r0_112.ButtonP8Slide.BarBack.EVENT_RECT.h / (r0_112.ButtonP8Slide.SlideBar.MOVABLE.PAR_MAX_Y + 1 - r0_112.ButtonP8Slide.SlideBar.MOVABLE.PSIZE_Y)
          local r6_112 = r4_112 - r0_112.ButtonP8Slide.BarBack.DRAW_POS.y
          if r6_112 < 0 then
            r6_112 = 0
          end
          local r7_112 = math.floor(r6_112 / r5_112)
          local r9_112 = r0_112.ButtonP8Slide.SlideBar:bt_GetParamY() - r7_112
          r0_112.ButtonP8Slide.SlideBar:bt_SetParamY(r7_112)
          r0_112:SetEntryBarParam(r7_112)
          r0_112:Page8_SetActive()
        end
        if r1_112 == 803 then
          local r5_112 = r0_112.ButtonP8Slide.SlideBar.MOVABLE.PAR_Y - 1
          r0_112.ButtonP8Slide.SlideBar:bt_SetParamY(r5_112)
          r0_112:SetEntryBarParam(r5_112)
          r0_112:Page8_SetActive()
        end
        if r1_112 == 804 then
          local r5_112 = r0_112.ButtonP8Slide.SlideBar.MOVABLE.PAR_Y + 1
          r0_112.ButtonP8Slide.SlideBar:bt_SetParamY(r5_112)
          r0_112:SetEntryBarParam(r5_112)
          r0_112:Page8_SetActive()
        end
        if r1_112 == 810 then
          openConfirm(LUA_CONFIRM_SCNTOP)
        end
        if 850 <= r1_112 and r1_112 <= 859 then
          g_NmsPlay.Act = r1_112 - 850 + 1 + g_NmsPlay.Slide
          r0_112:Page8_SetActive()
        end
      end
      if r0_112.P8SlideFlag == 1 then
        local r5_112 = r0_112.ButtonP8Slide.SlideBar:bt_GetParamY()
        r0_112.ButtonP8Slide.SlideBar:bt_SetParamY(r5_112)
        r0_112:SetEntryBarParam(r5_112)
        r0_112:Page8_SetActive()
        r0_112.P8SlideFlag = 0
      end
    end
    function g_Menu.Config.ptr.P8GetTitleTextName(r0_113, r1_113)
      -- line: [5652, 5654] id: 113
      return string.format("NmsTitle%03d", r1_113)
    end
    function g_Menu.Config.ptr.P8CreateTitleLayer(r0_114)
      -- line: [5656, 5662] id: 114
      local r1_114 = cclass.lua_Layers:create()
      for r5_114 = 0, 9, 1 do
        r1_114:insertTextLayer("configBase", r0_114:P8GetTitleTextName(r5_114), 350, 32, 2, 2, 2, 2, 0, 1)
      end
    end
    function g_Menu.Config.ptr.P8DeleteTitleLayer(r0_115)
      -- line: [5664, 5670] id: 115
      local r1_115 = cclass.lua_Layers:create()
      for r5_115 = 0, 9, 1 do
        r1_115:removeLayer("configBase", r0_115:P8GetTitleTextName(r5_115))
      end
    end
    function g_Menu.Config.ptr.P8SetTitle(r0_116, r1_116, r2_116)
      -- line: [5672, 5679] id: 116
      local r3_116 = cclass.lua_Layers:create()
      local r4_116 = r0_116:P8GetTitleTextName(r1_116)
      r3_116:clearText("configBase", r4_116)
      if r2_116 ~= nil and r2_116 ~= -1 then
        r3_116:setText("configBase", r4_116, g_nmsTitleList[r2_116], g_NmsFonts.name, g_NmsFonts.size, 0, 0, 4294967295, 255)
      end
    end
    g_Menu.Config.ptr.old_on_th = -1
    function g_Menu.Config.ptr.initConfigP8(r0_117, r1_117, r2_117)
      -- line: [5683, 5807] id: 117
      if r2_117 then
        r0_117.old_on_th = -1
        local r3_117 = cclass.lua_Layers:create()
        r0_117:MenuLoadLayer("NmsTh", "sys_nms_th.pna")
        r0_117:MenuLoadLayer("NmsNo", "sys_nms_no.pna")
        if r0_117.PatchFlag then
          r0_117:MenuLoadLayer("PNmsTh", "Psys_nms_th.pna")
        end
        r0_117:P8CreateTitleLayer()
        for r7_117 = 0, 10, 1 do
          r3_117:initSubLayer("configBase", "NmsNo", r7_117, 0)
        end
        local r4_117 = 0
        local r5_117 = 0
        local r6_117 = 0
        local r7_117 = 0
        r4_117 = 281
        r5_117 = 168
        r3_117:setParam("configBase", "NmsTh", LUA_PARAM_POS, r4_117, r5_117, 0, 0)
        if r0_117.PatchFlag then
          r3_117:setParam("configBase", "PNmsTh", LUA_PARAM_POS, r4_117, r5_117, 0, 0)
        end
        local r9_117 = math.floor(g_NmsPlay.Param / 10) % 10
        local r10_117 = math.floor(g_NmsPlay.Param / 100)
        r3_117:insertPNARefLayer("configBase", "NmsNo1", "NmsNo", g_NmsPlay.Param % 10, 1)
        r3_117:insertPNARefLayer("configBase", "NmsNo2", "NmsNo", r9_117, 1)
        r3_117:insertPNARefLayer("configBase", "NmsNo3", "NmsNo", r10_117, 1)
        r3_117:initSubLayer("configBase", r1_117, 1, 0)
        r3_117:initSubLayer("configBase", r1_117, 2, 0)
        r3_117:initSubLayer("configBase", r1_117, 3, 0)
        r4_117, r5_117, r6_117, r7_117 = r3_117:getSubLayerParam("configBase", r1_117, 1, LUA_PARAM_POS, r4_117, r5_117, r6_117, r7_117)
        r3_117:setParam("configBase", "NmsNo3", LUA_PARAM_POS, r4_117, r5_117, 0, 0)
        r4_117, r5_117, r6_117, r7_117 = r3_117:getSubLayerParam("configBase", r1_117, 2, LUA_PARAM_POS, r4_117, r5_117, r6_117, r7_117)
        r3_117:setParam("configBase", "NmsNo2", LUA_PARAM_POS, r4_117, r5_117, 0, 0)
        r4_117, r5_117, r6_117, r7_117 = r3_117:getSubLayerParam("configBase", r1_117, 3, LUA_PARAM_POS, r4_117, r5_117, r6_117, r7_117)
        r3_117:setParam("configBase", "NmsNo1", LUA_PARAM_POS, r4_117, r5_117, 0, 0)
        r3_117:initSubLayer("configBase", r1_117, 6, 1)
        r3_117:initSubLayer("configBase", r1_117, 7, 1)
        r3_117:initSubLayer("configBase", r1_117, 16, 1)
        r3_117:initSubLayer("configBase", r1_117, 71, 1)
        r3_117:initSubLayer("configBase", r1_117, 81, 0)
        r3_117:initSubLayer("configBase", r1_117, 83, 1)
        r3_117:initSubLayer("configBase", r1_117, 84, 1)
        r3_117:initSubLayer("configBase", r1_117, 87, 1)
        r0_117.ButtonP8 = {}
        r0_117.ButtonP8Slide = {}
        r0_117.ButtonP8Slide.SlideBar = r0_117.MenuButton:SlidebarY(65, 66, r0_117.MenuButton:ButtonCreate("SlideBar", 1, r1_117, 65, -1, -1, -1, -1, 801, 0, g_SysSEName.ok, -1, 0))
        r0_117:MenuButtonSet(r0_117.ButtonP8Slide, "BarBack", 1, r1_117, 68, -1, -1, -1, -1, 802, 0, -1)
        r0_117.ButtonP8Slide.BarBack.se_click = -1
        r0_117:MenuButtonSet(r0_117.ButtonP8, "Up", 0, r1_117, 56, 56, 57, -1, 58, 803, 0, 0)
        r0_117:MenuButtonSet(r0_117.ButtonP8, "Do", 0, r1_117, 61, 61, 62, -1, 63, 804, 0, 0)
        r0_117:MenuButtonSet(r0_117.ButtonP8, "RetTop", 1, r1_117, 75, 75, 76, -1, -1, 810, 0, 0)
        for r14_117 = 0, 9, 1 do
          local r16_117 = 19 + r14_117
          r0_117:MenuButtonSet(r0_117.ButtonP8, "EN_List" .. tostring(r14_117), 1, r1_117, r16_117, r16_117, 31 + r14_117, 43 + r14_117, -1, 850 + r14_117, 0, 0)
        end
        r0_117.MenuButton:InitList()
        r0_117.MenuButton:SetList("ButtonP8", r0_117.ButtonP8)
        r0_117.MenuButton:SetList("ButtonP8Slide", r0_117.ButtonP8Slide)
        r0_117.MenuButton:InitButton()
        r0_117.ButtonP8Slide.SlideBar:bt_SlidebarYInit(g_NmsPlay.Param, 10, 20, 68, 69)
        r0_117.ButtonP8Slide.SlideBar:bt_SetParamY(g_NmsPlay.Slide)
      end
      r0_117:SetEntryBarParam(g_NmsPlay.Slide)
      r0_117:Page8_SetActive()
    end
    function g_Menu.Config.ptr.deleteP8Th(r0_118)
      -- line: [5810, 5834] id: 118
      local r1_118 = cclass.lua_Layers:create()
      r1_118:removeLayer("configBase", "NmsTh")
      r1_118:removeLayer("configBase", "NmsNo")
      if r0_118.PatchFlag then
        r1_118:removeLayer("configBase", "NmsTh")
      end
      r0_118:P8DeleteTitleLayer()
      for r5_118 = 1, 3, 1 do
        r1_118:removeLayer("configBase", "NmsNo" .. tostring(r5_118))
      end
    end
    function g_Menu.Config.ptr.SelCursorP8(r0_119, r1_119, r2_119, r3_119)
      -- line: [5837, 5953] id: 119
      local r4_119 = cclass.lua_Layers:create()
      if r0_119.P8SlideFlag == 1 then
        r0_119:SetEntryBarParam(r0_119.ButtonP8Slide.SlideBar:bt_GetParamY())
        r0_119:Page8_SetActive()
      end
      local r5_119 = -1
      if g_NmsPlay.Param >= 2 then
        for r9_119 = 0, 9, 1 do
          if "EN_List" .. tostring(r9_119) == r1_119 then
            r5_119 = g_NmsPlay.List[g_NmsPlay.Slide + r9_119 + 1]
          end
        end
      end
      local r6_119 = ConfigGetPageKeyName(g_configPage)
      if r1_119 == "RetTop" then
        r4_119:setSubLayerVisible("configBase", r6_119, 81, 1)
      else
        r4_119:setSubLayerVisible("configBase", r6_119, 81, 0)
      end
      if r5_119 == -1 then
        r5_119 = g_NmsPlay.List[g_NmsPlay.Act]
      end
      if r0_119.old_on_th ~= -1 and r0_119.old_on_th ~= r5_119 then
        local r7_119 = r0_119.old_on_th
        local r8_119 = "NmsTh"
        if r7_119 >= g_NmsData.MAX_THUMB then
          r8_119 = "PNmsTh"
        end
        if r8_119 ~= nil then
          local r9_119 = -1
          local r10_119 = -1
          r9_119, r10_119 = GetNmsThumbnailNo(r7_119)
          if r10_119 ~= -1 then
            r4_119:setSubLayerVisible("configBase", r8_119, r10_119, 0)
          elseif r9_119 ~= -1 then
            r4_119:setSubLayerVisible("configBase", r8_119, r9_119, 0)
          end
        end
      end
      if r0_119.old_on_th ~= r5_119 then
        r0_119.old_on_th = r5_119
        if r5_119 ~= -1 then
          local r7_119 = "NmsTh"
          if r5_119 >= g_NmsData.MAX_THUMB then
            r7_119 = "PNmsTh"
          end
          if r7_119 ~= nil then
            local r8_119 = -1
            local r9_119 = -1
            r8_119, r9_119 = GetNmsThumbnailNo(r5_119)
            if r9_119 ~= -1 then
              r4_119:initSubLayer("configBase", r7_119, r9_119, 0)
              r4_119:setSubLayerVisible("configBase", r7_119, r9_119, 1)
            elseif r8_119 ~= -1 then
              r4_119:initSubLayer("configBase", r7_119, r8_119, 0)
              r4_119:setSubLayerVisible("configBase", r7_119, r8_119, 1)
            end
          end
        end
      end
    end
    function g_Menu.Config.ptr.effectP8Th(r0_120, r1_120, r2_120, r3_120, r4_120, r5_120)
      -- line: [5956, 6054] id: 120
      local r6_120 = cclass.lua_Layers:create()
      local r7_120 = getEffectRate()
      if r1_120 ~= true then
        if r4_120 == false then
          local r8_120 = 0
          local r9_120 = 0
          local r10_120 = 0
          local r11_120 = 0
          r8_120, r9_120, r10_120, r11_120 = r6_120:getParam("configBase", "NmsTh", LUA_PARAM_POS, r8_120, r9_120, r10_120, r11_120)
          r6_120:setParam("configBase", "NmsTh", LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_120:setEffect("configBase", "NmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_120, 0, r5_120)
          if r0_120.PatchFlag then
            r8_120, r9_120, r10_120, r11_120 = r6_120:getParam("configBase", "PNmsTh", LUA_PARAM_POS, r8_120, r9_120, r10_120, r11_120)
            r6_120:setParam("configBase", "PNmsTh", LUA_PARAM_COLOR, 1, 1, 1, 0)
            r6_120:setEffect("configBase", "PNmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_120, 0, r5_120)
          end
        else
          r6_120:setEffect("configBase", "NmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_120, 0, r5_120)
          if r0_120.PatchFlag then
            r6_120:setEffect("configBase", "PNmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_120, 0, r5_120)
          end
        end
        r6_120:startEffect("configBase", "NmsTh", "ConfigPage", 0)
        if r0_120.PatchFlag then
          r6_120:startEffect("configBase", "PNmsTh", "ConfigPage", 0)
        end
        for r11_120 = 1, 3, 1 do
          local r12_120 = "NmsNo" .. tostring(r11_120)
          if r4_120 == false then
            r13_120, r14_120, r15_120, r16_120 = r6_120:getParam("configBase", r12_120, LUA_PARAM_POS, 0, 0, 0, 0)
            r6_120:setParam("configBase", r12_120, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r6_120:setEffect("configBase", r12_120, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_120, 0, r5_120)
          else
            r6_120:setEffect("configBase", r12_120, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_120, 0, r5_120)
          end
          r6_120:startEffect("configBase", r12_120, "ConfigPage", 0)
        end
        local r8_120 = g_NmsPlay.Param
        for r12_120 = 0, 9, 1 do
          local r13_120 = "EN_List" .. tostring(r12_120)
          if r0_120.ButtonP8[r13_120].active == 0 or r0_120.ButtonP8[r13_120].active == 4 then
            local r14_120 = r0_120:P8GetTitleTextName(r12_120)
            if r4_120 == false then
              local r15_120 = r0_120.ButtonP8[r13_120].DRAW_POS.x + 5
              local r16_120 = r0_120.ButtonP8[r13_120].DRAW_POS.y + 1
              local r17_120 = 0
              local r18_120 = 0
              r6_120:setParam("configBase", r14_120, LUA_PARAM_COLOR, 1, 1, 1, 0)
              r6_120:setEffect("configBase", r14_120, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_120, 0, r5_120)
            else
              r6_120:setEffect("configBase", r14_120, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_120, 0, r5_120)
            end
            r6_120:startEffect("configBase", r14_120, "ConfigPage", 0)
          end
        end
      end
    end
    function g_Menu.Config.ptr.MenuMouseWheelP8(r0_121, r1_121, r2_121, r3_121)
      -- line: [6058, 6079] id: 121
      local r4_121 = cclass.lua_Layers:create()
      local r5_121 = r0_121.ButtonP8Slide.SlideBar.MOVABLE.PAR_Y
      if g_NmsPlay.Param >= 11 then
        r5_121 = r5_121 - r2_121 / 2
        if r5_121 < 0 then
          r5_121 = 0
        end
        local r6_121 = g_NmsPlay.Param - 10
        if r6_121 < r5_121 then
          r5_121 = r6_121
        end
        r0_121:SetEntryBarParam(r5_121)
        r0_121:Page8_SetActive()
      end
    end
    function g_Menu.Config.ptr.SetEntryBarBt(r0_122)
      -- line: [6083, 6101] id: 122
      for r4_122 = 0, 9, 1 do
        local r5_122 = "EN_List" .. tostring(r4_122)
        if r4_122 < g_NmsPlay.Param then
          local r6_122 = g_NmsPlay.Act
          if r6_122 ~= -1 then
            r6_122 = r6_122 - g_NmsPlay.Slide
          end
          if r6_122 == r4_122 + 1 then
            r0_122.ButtonP8[r5_122]:bt_SetActive(4)
          else
            r0_122.ButtonP8[r5_122]:bt_SetActive(0)
          end
        else
          r0_122.ButtonP8[r5_122]:bt_SetActive(2)
        end
      end
    end
    function g_Menu.Config.ptr.SetEntryText(r0_123)
      -- line: [6104, 6140] id: 123
      local r1_123 = cclass.lua_Layers:create()
      local r2_123 = g_NmsPlay.Param
      for r6_123 = 0, 9, 1 do
        local r7_123 = "EN_List" .. tostring(r6_123)
        if r0_123.ButtonP8[r7_123].active == 0 or r0_123.ButtonP8[r7_123].active == 4 then
          r0_123:P8SetTitle(r6_123, g_NmsPlay.List[r6_123 + g_NmsPlay.Slide + 1] + 1)
          r1_123:setParam("configBase", r0_123:P8GetTitleTextName(r6_123), LUA_PARAM_POS, r0_123.ButtonP8[r7_123].DRAW_POS.x + 5, r0_123.ButtonP8[r7_123].DRAW_POS.y + 1, 0, 0)
        else
          r0_123:P8SetTitle(r6_123, -1)
        end
      end
    end
    function g_Menu.Config.ptr.SetEntryBarParam(r0_124, r1_124)
      -- line: [6143, 6169] id: 124
      g_NmsPlay.Slide = r1_124
      r0_124.ButtonP8Slide.SlideBar:bt_SetParamY(g_NmsPlay.Slide)
      if g_NmsPlay.Param > 10 then
        r0_124.ButtonP8Slide.SlideBar:bt_SetActive(0)
        r0_124.ButtonP8Slide.BarBack:bt_SetActive(0)
        if g_NmsPlay.Slide <= 0 then
          g_NmsPlay.Slide = 0
          r0_124.ButtonP8.Up:bt_SetActive(2)
        else
          r0_124.ButtonP8.Up:bt_SetActive(0)
        end
        if g_NmsPlay.Param - 10 <= g_NmsPlay.Slide then
          g_NmsPlay.Slide = g_NmsPlay.Param - 10
          r0_124.ButtonP8.Do:bt_SetActive(2)
        else
          r0_124.ButtonP8.Do:bt_SetActive(0)
        end
      else
        r0_124.ButtonP8Slide.SlideBar:bt_SetActive(2)
        r0_124.ButtonP8Slide.BarBack:bt_SetActive(2)
        r0_124.ButtonP8.Up:bt_SetActive(2)
        r0_124.ButtonP8.Do:bt_SetActive(2)
      end
    end
  end
  function g_Menu.Config.ptr.Page9_SetActive(r0_125)
    -- line: [6189, 6234] id: 125
    local r1_125 = cclass.lua_Layers:create()
    local r2_125 = ConfigGetPageKeyName(9)
    for r6_125 = 1, r0_125.TipsPageMax, 1 do
      local r7_125 = "Page" .. tostring(r6_125)
      if r6_125 == r0_125.TipsPage then
        r0_125.ButtonP9[r7_125]:bt_SetActive(1)
      else
        r0_125.ButtonP9[r7_125]:bt_SetActive(0)
      end
    end
    for r6_125 = 1, 9, 1 do
      local r7_125 = -1
      local r8_125 = -1
      if r0_125.TipsOldPage ~= -1 then
        r7_125, r8_125 = r0_125:TipsLayer(r0_125.TipsOldPage, r6_125)
        if r7_125 ~= -1 then
          r1_125:setSubLayerVisible("configBase", r2_125, r7_125, 0)
        end
        if r8_125 ~= -1 then
          r1_125:setSubLayerVisible("configBase", r2_125, r8_125, 0)
        end
      end
      r7_125, r8_125 = r0_125:TipsLayer(r0_125.TipsPage, r6_125)
      local r9_125 = r0_125:TipsFlag(r0_125.TipsPage, r6_125)
      if r9_125 == 1 and r8_125 ~= -1 then
        r1_125:initSubLayer("configBase", r2_125, r8_125, 1)
        r1_125:setSubLayerVisible("configBase", r2_125, r8_125, 1)
      end
      if r9_125 == 0 and r7_125 ~= -1 then
        r1_125:initSubLayer("configBase", r2_125, r7_125, 1)
        r1_125:setSubLayerVisible("configBase", r2_125, r7_125, 1)
      end
    end
    r0_125.TipsOldPage = -1
  end
  function g_Menu.Config.ptr.P9_ButtonJobLD(r0_126, r1_126, r2_126, r3_126, r4_126)
    -- line: [6237, 6240] id: 126
    if nil and not nil then
      goto label_2	-- block#1 is visited secondly
    end
  end
  function g_Menu.Config.ptr.P9_ButtonJobLU(r0_127, r1_127, r2_127, r3_127, r4_127)
    -- line: [6242, 6255] id: 127
    if 901 <= r1_127 and r1_127 <= 911 then
      if r0_127.TipsOldPage ~= r0_127.TipsPage then
        r0_127.TipsOldPage = r0_127.TipsPage
      end
      r0_127.TipsPage = r1_127 - 900
      cfunc.LegacyGame__lua_SetVariable(104, r0_127.TipsPage)
    end
    if 901 <= r1_127 and r1_127 <= 1000 then
      r0_127:Page9_SetActive()
    end
  end
  function g_Menu.Config.ptr.TipsLayer(r0_128, r1_128, r2_128)
    -- line: [6258, 6272] id: 128
    local r3_128 = -1
    local r4_128 = -1
    if r1_128 == 4 then
      if r2_128 <= 7 then
        r3_128 = 71 - r2_128 - 1
        r4_128 = 62 - r2_128 - 1
      end
    else
      r3_128 = 143 - r2_128 - 1 - 24 * (r1_128 - 1)
      r4_128 = 132 - r2_128 - 1 - 24 * (r1_128 - 1)
    end
    return r3_128, r4_128
  end
  function g_Menu.Config.ptr.TipsFlag(r0_129, r1_129, r2_129)
    -- line: [6275, 6312] id: 129
    local r3_129 = {
      TIPS_001 = 1080,
    }
    local r4_129 = {
      {
        r3_129.TIPS_001,
        r3_129.TIPS_002,
        r3_129.TIPS_003,
        r3_129.TIPS_004,
        r3_129.TIPS_005,
        r3_129.TIPS_007,
        r3_129.TIPS_006,
        r3_129.TIPS_008,
        r3_129.TIPS_009
      },
      {
        r3_129.TIPS_010,
        r3_129.TIPS_011,
        r3_129.TIPS_012,
        r3_129.TIPS_013,
        r3_129.TIPS_014,
        r3_129.TIPS_015,
        r3_129.TIPS_016,
        r3_129.TIPS_017,
        r3_129.TIPS_018
      },
      {
        r3_129.TIPS_019,
        r3_129.TIPS_020,
        r3_129.TIPS_021,
        r3_129.TIPS_022,
        r3_129.TIPS_023,
        r3_129.TIPS_024,
        r3_129.TIPS_025,
        r3_129.TIPS_026,
        r3_129.TIPS_027
      },
      {
        r3_129.TIPS_028,
        r3_129.TIPS_029,
        r3_129.TIPS_030,
        r3_129.TIPS_031,
        r3_129.TIPS_032,
        r3_129.TIPS_033,
        r3_129.TIPS_034,
        nil,
        nil
      }
    }
    local r5_129 = 0
    if r4_129[r1_129][r2_129] ~= nil then
      if cfunc.LegacyGame__lua_GetFlag(r4_129[r1_129][r2_129]) then
        r5_129 = 1
      else
        r5_129 = 0
      end
    else
      r5_129 = -1
    end
    return r5_129
  end
  g_Menu.Config.ptr.TipsPage = 1
  g_Menu.Config.ptr.TipsPageMax = 4
  g_Menu.Config.ptr.TipsOldPage = -1
  function g_Menu.Config.ptr.initConfigP9(r0_130, r1_130, r2_130)
    -- line: [6318, 6350] id: 130
    if r2_130 then
      local r3_130 = cclass.lua_Layers:create()
      r0_130.TipsPage = cfunc.LegacyGame__lua_GetVariable(104)
      local r4_130 = r0_130.TipsPage
      if r4_130 == 0 then
        r4_130 = 1 or r0_130.TipsPage
      else
        goto label_17	-- block#3 is visited secondly
      end
      r0_130.TipsPage = r4_130
      r3_130:initSubLayer("configBase", r1_130, 147, 1)
      r0_130.ButtonP9 = {}
      for r7_130 = 1, r0_130.TipsPageMax, 1 do
        local r9_130 = 39 - r7_130 - 1
        r0_130:MenuButtonSet(r0_130.ButtonP9, "Page" .. tostring(r7_130), 1, r1_130, r9_130, r9_130, 13 - r7_130 - 1, 26 - r7_130 - 1, -1, 900 + r7_130, 0, 0)
      end
      r0_130.MenuButton:InitList()
      r0_130.MenuButton:SetList("ButtonP9", r0_130.ButtonP9)
      r0_130.MenuButton:InitButton()
    end
    r0_130:Page9_SetActive()
  end
  function g_Menu.Config.ptr.deleteP9Th(r0_131)
    -- line: [6353, 6356] id: 131
    local r1_131 = cclass.lua_Layers:create()
  end
  function g_Menu.Config.ptr.SelCursorP9(r0_132, r1_132, r2_132, r3_132)
    -- line: [6359, 6373] id: 132
    if r1_132 == -1 then
    end
    for r7_132 = 1, 9, 1 do
      if r1_132 == "TipsBase" .. tostring(r7_132) then
      end
    end
  end
  function g_Menu.Config.ptr.effectP9Th(r0_133, r1_133, r2_133, r3_133, r4_133, r5_133)
    -- line: [6376, 6383] id: 133
    local r6_133 = cclass.lua_Layers:create()
    local r7_133 = getEffectRate()
    if r1_133 == true then
    end
  end
  function g_Menu.Config.ptr.InitConfigNo(r0_134)
    -- line: [6388, 6395] id: 134
    r0_134:MenuLoadLayer("config_no", "sys_no.pna")
    local r1_134 = cclass.lua_Layers:create()
    for r5_134 = 0, 9, 1 do
      r1_134:initSubLayer("configBase", "config_no", r5_134, 0)
    end
    r1_134:initSubLayer("configBase", "config_no", 10, 0)
  end
  g_Menu.Config.ptr.PlaceCount = 0
  function g_Menu.Config.ptr.DrawConfigNo(r0_135, r1_135, r2_135, r3_135)
    -- line: [6399, 6439] id: 135
    r0_135:DeleteConfigNo()
    local r4_135 = cclass.lua_Layers:create()
    r0_135.PlaceCount = 0
    local r5_135 = r1_135
    for r9_135 = 0, 9, 1 do
      r5_135 = math.floor(r5_135 / 10)
      r4_135:insertPNARefLayer("configBase", "config_no" .. tostring(r9_135), "config_no", r5_135 % 10, 1)
      r0_135.PlaceCount = r0_135.PlaceCount + 1
      if r5_135 <= 0 then
        break
      end
    end
    r4_135:insertPNARefLayer("configBase", "config_perc", "config_no", 10, 1)
    local r7_135 = math.floor(r2_135 + math.floor((r0_135.PlaceCount + 1) * 10 / 2) - 10)
    local r8_135 = math.floor(r3_135)
    r4_135:setParam("configBase", "config_perc", LUA_PARAM_POS, r7_135, r8_135, 0, 0)
    r7_135 = r7_135 - 10
    for r12_135 = 0, r0_135.PlaceCount - 1, 1 do
      r4_135:setParam("configBase", "config_no" .. tostring(r12_135), LUA_PARAM_POS, r7_135, r8_135, 0, 0)
      r7_135 = r7_135 - 10
    end
  end
  function g_Menu.Config.ptr.DeleteConfigNo(r0_136)
    -- line: [6442, 6450] id: 136
    local r1_136 = cclass.lua_Layers:create()
    for r5_136 = 0, r0_136.PlaceCount - 1, 1 do
      r1_136:removeLayer("configBase", "config_no" .. tostring(r5_136))
    end
    r1_136:removeLayer("configBase", "config_perc")
  end
  local r2_8 = "Sys_Config_Base.pna"
  local r3_8 = getUItype()
  if r3_8 == 0 then
    r2_8 = "Sys_Config_Base.pna"
  end
  if r3_8 == 1 then
    r2_8 = "Sys_Config_Base.pna"
  end
  if r3_8 == 2 then
  end
  local r4_8 = g_Menu.Config.ptr:MenuInit("configBase01", r2_8)
  if res == false then
    return false
  end
  g_Menu.Config.ptr.PatchFlag = cfunc.LegacyGame__lua_GetFlag(1005)
  g_Menu.Config.ptr.PatchFlag = false
  g_Menu.Config.ptr.AllClearFlag = false
  local r5_8 = cfunc.LegacyGame__lua_GetFlag(1001)
  local r6_8 = cfunc.LegacyGame__lua_GetFlag(1002)
  local r7_8 = cfunc.LegacyGame__lua_GetFlag(1003)
  local r8_8 = cfunc.LegacyGame__lua_GetFlag(1004)
  local r9_8 = cfunc.LegacyGame__lua_GetFlag(1005)
  g_Menu.Config.ptr.AllClearFlag = r5_8 and r6_8 and r7_8 and r8_8 and r9_8
  g_Menu.Config.ptr.GetAnyClearFlag = r5_8 or r6_8 or r7_8 or r8_8 or r9_8
  if g_TrialFlag >= 1 then
    g_Menu.Config.ptr.GetAnyClearFlag = false
  else
    g_Menu.Config.ptr.GetAnyClearFlag = true
  end
  g_Menu.Config.ptr:MenuLoadLayer("configBack", "sys_config_back.png")
  cclass.lua_Layers:create():swapLayerOrder("configBase", "configBase01", "configBack")
  g_Menu.Config.ptr.toSysMenu = r1_8
  g_Menu.Config.ptr:InitConfigNo()
  if g_Menu.Config.ptr.NMSAcitve == true then
    g_Menu.Config.ptr:Page8_SetInitParam()
  end
  g_Menu.Config.ptr:initConfigButton()
  g_Menu.Config.ptr:SetConfigButtonActive(r0_8)
  g_Menu.Config.ptr:initConfigPage(r0_8, true)
  g_Menu.Config.ptr:startConfigMenu(r1_8)
  return true
end
function initDataOrder()
  -- line: [6537, 6586] id: 137
  local r0_137 = 0
  local r1_137 = 0
  for r5_137 = 1, 5, 1 do
    g_autoOrder[r5_137] = -1
  end
  r0_137, r1_137 = cfunc.CSaveDataManager__lua_FindNewData(2, r0_137, r1_137)
  if r0_137 == 2 then
    for r5_137 = 1, 5, 1 do
      g_autoOrder[r5_137] = r1_137
      if r1_137 > 0 then
        r1_137 = r1_137 - 1
      end
      if r1_137 < 1 then
        r1_137 = 5
        if r1_137 then
          r1_137 = r1_137
        end
      end
      if 0 < r1_137 and cfunc.CSaveDataManager__lua_IsData(2, r1_137) == false then
        r1_137 = -1
      end
    end
  end
  r0_137, r1_137 = cfunc.CSaveDataManager__lua_FindNewData(2, r0_137, r1_137)
  for r5_137 = 1, 5, 1 do
    g_quickOrder[r5_137] = -1
  end
  r0_137, r1_137 = cfunc.CSaveDataManager__lua_FindNewData(1, r0_137, r1_137)
  if r0_137 == 1 then
    for r5_137 = 1, 5, 1 do
      g_quickOrder[r5_137] = r1_137
      if r1_137 > 0 then
        r1_137 = r1_137 - 1
      end
      if r1_137 < 1 then
        r1_137 = 5
        if r1_137 then
          r1_137 = r1_137
        end
      end
      if 0 < r1_137 and cfunc.CSaveDataManager__lua_IsData(1, r1_137) == false then
        r1_137 = -1
      end
    end
  end
end
function closeConfig()
  -- line: [6589, 6621] id: 138
  if g_Menu.Config.ptr == nil then
    return false
  end
  if g_sortData ~= nil then
    g_sortData:delete()
    g_sortData = nil
  end
  local r0_138 = cclass.lua_Layers:create()
  if g_menuExecute == true then
    r0_138:removeSnap("system")
    r0_138:rtSnap("system")
  else
    if g_CASTOFF then
      cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
    end
    r0_138:setForceBG(true)
    local r1_138 = getEffectRate()
    r0_138:setSnap("configBase", false)
    r0_138:startTransition("configBase", 0, 1, 500 * r1_138, 0, LUA_TRANSITION_ERASE)
  end
  g_Menu.Config.ptr.MenuInf.enabled = false
  g_Menu.Config.ptr.MenuInf.effect = true
  return true
end
function defaultSetting()
  -- line: [6628, 6751] id: 139
  g_autospeed = 850
  g_msgspeed = 95
  g_messagealpha = 80
  g_messageWindowType = 0
  g_allskip = false
  g_selectReleaseSkip = false
  g_selectReleaseAuto = false
  g_effectSpeed = 0
  g_drawSkipIcon = true
  g_mouseAutoMove = true
  g_skipConfirm = false
  g_hideCursor = 0
  g_hideCursorOn = true
  g_zoomMode = 0
  g_deactiveMode = true
  g_MouseRButton = 0
  g_ReadColorChange = true
  changeMessageWindow(-1, true)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, g_zoomMode)
  cfunc.LegacyGame__lua_SetVariable(200, 0)
  for r3_139 = 1, #g_volume, 1 do
    if g_volume[r3_139].name == "bgm" then
      g_volume[r3_139].vol = 500
    elseif g_volume[r3_139].name == "systemse" then
      g_volume[r3_139].vol = 600
    elseif g_volume[r3_139].name == "se" then
      g_volume[r3_139].vol = 700
    elseif g_volume[r3_139].name == "movie" then
      g_volume[r3_139].vol = 800
    elseif g_volume[r3_139].name == "char" then
      g_volume[r3_139].vol = 900
    elseif g_volume[r3_139].name == "charC_SAYA" then
      g_volume[r3_139].vol = 950
    else
      g_volume[r3_139].vol = 900
    end
    g_volume[r3_139].mute = false
  end
  g_clickVoice = false
  g_enablePan = true
  g_bgvVoiceMute = true
  g_bgmCutPer = 90
  g_sysVoiceChar = 999
  g_gestureFunc[1] = 6
  g_gestureFunc[2] = 0
  g_gestureFunc[3] = 5
  g_gestureFunc[4] = 2
  g_gestureDisable = false
  g_altLanguage = false
  changeMessageWindow(-1, true)
  if g_Menu.Config.ptr ~= nil then
    g_Menu.Config.ptr:setCfg2WindowAlpa()
  end
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:changeMessageWindowOpacity()
  end
  if g_menuExecute == false then
    local r0_139 = cclass.lua_Layers:create()
    r0_139:removeSnap("system")
    r0_139:setSnap("system", true)
  end
  cfunc.LegacyGame__lua_NeedVolumeUpdate("bgm")
  cfunc.LegacyGame__lua_NeedVolumeUpdate("se")
  cfunc.LegacyGame__lua_NeedVolumeUpdate("movie")
  cfunc.LegacyGame__lua_NeedVolumeUpdate("char")
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGV, 0)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
  cfunc.LegacyGame__lua_NeedVolumeUpdate("bgv")
  cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
  cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
  local r0_139 = ConfigGetPageKeyName(g_configPage)
  if g_Menu.Config.ptr ~= nil then
    g_Menu.Config.ptr:SetTestVoiceVol(g_volume[g_Menu.Config.ptr:getPersonalIndex()].vol)
    if g_configPage == 1 then
      if g_menuExecute == false then
        for r4_139, r5_139 in pairs(g_Menu.Config.ptr.PreviewList) do
          if r5_139 ~= nil then
            cfunc.LegacyGame__lua_NeedPreview("configBase", r5_139)
          end
        end
      end
      g_Menu.Config.ptr:updatePreviewSize(r0_139)
      g_Menu.Config.ptr:Page1_SetActive()
    elseif g_configPage == 2 then
      g_Menu.Config.ptr:setCfg2WindowAlpa()
      startCfg2Preview()
      g_Menu.Config.ptr:Page2_SetActive()
    elseif g_configPage == 3 then
      g_Menu.Config.ptr.selChar = 1
      g_Menu.Config.ptr:Page3_SetActive(r0_139)
    elseif g_configPage == 7 then
      g_Menu.Config.ptr:Page7_SetActive()
    end
    if g_menuExecute == false then
      local r1_139 = cclass.lua_Layers:create()
      if g_CASTOFF then
        cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
      end
      r1_139:setForceBG(true)
      g_P1Renew = 3
    end
  end
end
function startCfg2Preview()
  -- line: [6753, 6810] id: 140
  local r0_140 = cclass.lua_Layers:create()
  local r1_140 = nil
  local r2_140 = nil
  r1_140, r2_140 = getConfigText()
  local r3_140 = {
    [1] = g_message1Color,
    [2] = g_message2Color,
  }
  local r4_140 = {
    [1] = g_name1Color,
    [2] = g_name2Color,
  }
  local r5_140 = g_EexampleName
  local r6_140 = g_EexampleText
  local r7_140 = g_fonts.name
  local r8_140 = g_fontSize.MsgSize
  local r9_140 = g_fontSize.NameSize
  if getLangPatchFlag() then
    local r10_140 = getUItype()
    if r10_140 == 0 then
      r7_140 = g_fonts2.name
      r6_140 = g_exampleText
      r5_140 = g_exampleName
      r8_140 = g_fontSize2.MsgSize
      r9_140 = g_fontSize2.NameSize
    end
    if r10_140 == 1 then
      r7_140 = g_fonts.name
      r6_140 = g_EexampleText
      r5_140 = g_EexampleName
      r8_140 = g_fontSize.MsgSize
      r9_140 = g_fontSize.NameSize
    end
    if r10_140 == 2 then
    end
  end
  r0_140:clearText("configBase", r1_140)
  r0_140:clearText("configBase", r2_140)
  r0_140:effectText("configBase", r1_140, r6_140, r7_140, r8_140, 1, 0, r3_140[g_messageWindowType + 1].normal, r3_140[g_messageWindowType + 1].normalEdge)
  r0_140:setText("configBase", r2_140, r5_140, r7_140, r9_140, 1, 0, r4_140[g_messageWindowType + 1].normal, r4_140[g_messageWindowType + 1].normalEdge)
  g_Menu.Config.ptr.autoModeTimer:reset()
  local r10_140 = ConfigGetPageKeyName(2)
  g_Menu.Config.ptr:StopClkWait()
end
function updateNewIcon(r0_141, r1_141, r2_141)
  -- line: [6812, 6855] id: 141
  local r3_141 = cclass.lua_Layers:create()
  local r4_141 = 0
  local r5_141 = 0
  r4_141, r5_141 = cfunc.CSaveDataManager__lua_FindNewData(0, r4_141, r5_141)
  if 0 <= r4_141 and g_Menu.Config.ptr ~= nil then
    for r9_141 = 1, 10, 1 do
      r3_141:setSubLayerVisible("configBase", g_Menu.Config.ptr:DataOverName(r2_141, r9_141), 0, 0)
    end
    if r1_141 == g_DATAPAGEMAX and r4_141 == 1 then
      r3_141:setSubLayerVisible("configBase", g_Menu.Config.ptr:DataOverName(r2_141, 6), 0, 1)
      return 
    elseif r4_141 == 0 and math.floor((r5_141 - 1) / 10 + 1) == r1_141 then
      r3_141:setSubLayerVisible("configBase", g_Menu.Config.ptr:DataOverName(r2_141, (r5_141 - 1) % 10 + 1), 0, 1)
      return 
    end
  end
end
function updateNewIconC(r0_142)
  -- line: [6861, 6879] id: 142
  -- notice: unreachable block#3
  local r1_142 = ConfigGetPageKeyName(g_configPage)
  local r2_142 = g_configPage
  if r2_142 == 4 then
    r2_142 = true
  else
    r2_142 = false
  end
  updateNewIcon(r1_142, g_dataInfo.page, r2_142)
  if r0_142 == DATA_MODE_QUICK then
    playSystemVoice(0)
    playSystemVoice(SYSVOICE_QSAVE)
  elseif getSystemSet() == "configBase" and g_Menu.Config.ptr ~= nil then
    g_Menu.Config.ptr:SetConfigButtonActive(g_configPage)
  end
end
g_saveTextColor = {
  normal = 4294967295,
  normalEdge = 4294967295,
  time = 4294967295,
  timeEdge = 4294967295,
  No = 4294967295,
  NoEdge = 4294967295,
  time2 = 4294967295,
  timeEdge2 = 4294967295,
}
function initThumbnail(r0_143, r1_143, r2_143)
  -- line: [6889, 7211] id: 143
  -- notice: unreachable block#32
  -- notice: unreachable block#33
  -- notice: unreachable block#26
  -- notice: unreachable block#29
  -- notice: unreachable block#36
  -- notice: unreachable block#27
  -- notice: unreachable block#30
  -- notice: unreachable block#17
  -- notice: unreachable block#28
  -- notice: unreachable block#18
  -- notice: unreachable block#34
  local r3_143 = r1_143 % 10
  if r3_143 == 0 then
    r3_143 = 10
    if r3_143 then
      r3_143 = r3_143
    end
  end
  if g_Menu.Config.ptr == nil then
    return 
  end
  local r4_143 = cclass.lua_Layers:create()
  local r5_143 = nil
  local r6_143 = nil
  if g_dataInfo.page == g_DATAPAGEMAX then
    if r3_143 < 6 and g_autoOrder[r3_143] > 0 then
      r6_143 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_AUTO, g_autoOrder[r3_143])
    elseif g_quickOrder[r3_143 - 5] > 0 then
      r6_143 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_QUICK, g_quickOrder[r3_143 - 5])
    end
  else
    r5_143 = (g_dataInfo.page - 1) * 10 + r3_143
    g_sortData:Insert(r5_143)
    r6_143 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_NORMAL, r5_143)
  end
  local r7_143 = getSaveThumbKey(r0_143, r3_143)
  local r8_143 = r4_143:insertThumbnailLayer("configBase", r7_143, r6_143, 1)
  local r9_143 = "Data" .. tostring(r3_143)
  local r10_143 = 272 + 163 * (r3_143 - 1) % 5
  if r3_143 >= 6 then
    r10_143 = r10_143 + 102
  end
  local r11_143 = nil	-- notice: implicit variable refs by block#[16, 25, 37, 67, 74]
  if r3_143 < 6 then
    r11_143 = 150
    if not r11_143 then
      ::label_92::
      r11_143 = 379
    end
  else
    goto label_92	-- block#15 is visited secondly
  end
  r4_143:setParam("configBase", r7_143, LUA_PARAM_POS, r10_143 + 10, r11_143 + 30, 0, 0)
  local r14_143 = g_Menu.Config.ptr:DataOverName(r0_143, r3_143)
  r4_143:removeLayer("configBase", r14_143)
  local r15_143 = "sys_config_P4TH.pna"
  local r16_143 = getUItype()
  if r16_143 == 0 then
    r15_143 = "sys_config_P4TH.pna"
  end
  if r16_143 == 1 then
    r15_143 = "sys_config_P4TH.pna"
  end
  if r16_143 == 2 then
    r15_143 = "sys_config_P4TH.pna"
  end
  g_Menu.Config.ptr:MenuLoadLayer(r14_143, r15_143)
  r4_143:initSubLayer("configBase", r14_143, 0, 0)
  r4_143:setParam("configBase", r14_143, LUA_PARAM_POS, r10_143, r11_143, 0, 0)
  local r17_143 = getUItype()
  local r18_143 = getSaveThumbTimeTxt(r0_143, r3_143)
  r4_143:insertTextLayer("configBase", r18_143, 160, 20, 2, 2, 14, 2, 0, 1)
  r4_143:setParam("configBase", r18_143, LUA_PARAM_POS, r10_143 + 12, r11_143 + 110, 0, 0)
  local r19_143 = ""
  local r20_143 = false
  if g_dataInfo.page == g_DATAPAGEMAX then
    if r3_143 < 6 then
      r19_143 = cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_AUTO, g_autoOrder[r3_143])
    else
      r19_143 = cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_QUICK, g_quickOrder[r3_143 - 5])
    end
    if size == true then
      r20_143 = true
    end
  else
    r19_143 = cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r3_143)
  end
  local r21_143 = g_Savefonts.name
  local r22_143 = g_Savefonts.timesize
  if r17_143 == 0 then
    r21_143 = g_Savefonts2.name
    r22_143 = g_Savefonts2.timesize
  end
  if r17_143 == 1 then
    r21_143 = g_Savefonts.name
    r22_143 = g_Savefonts.timesize
    local r23_143 = 0
    local r24_143 = 0
    local r25_143 = {
      "january",
      "february",
      "march",
      "april",
      "may",
      "june",
      "july",
      "august",
      "september",
      "october",
      "november",
      "december"
    }
    local r26_143 = {
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    }
    for r30_143, r31_143 in pairs(r25_143) do
      local r33_143 = string.lower(r19_143)
      r23_143, r24_143 = string.find(r33_143, r31_143)
      if r23_143 ~= nil then
        local r32_143 = string.sub(r19_143, 1, r23_143 - 1)
        r33_143 = string.sub(r19_143, r24_143 + 1)
        local r34_143 = r32_143
        local r35_143 = r26_143[r30_143]
        local r36_143 = r33_143
        r19_143 = r34_143 .. r35_143 .. r36_143
        break
      end
    end
    for r31_143, r32_143 in pairs({
      "monday",
      "tuesday",
      "wednesday",
      "thursday",
      "friday",
      "saturday",
      "sunday"
    }) do
      local r34_143 = string.lower(r19_143)
      r23_143, r24_143 = string.find(r34_143, r32_143)
      if r23_143 ~= nil then
        local r33_143 = string.sub(r19_143, 1, r23_143 - 1)
        r34_143 = string.sub(r19_143, r24_143 + 3)
        local r35_143 = r33_143
        local r36_143 = r34_143
        r19_143 = r35_143 .. r36_143
        break
      end
    end
  end
  if r17_143 == 2 then
    r21_143 = g_Savefonts2.name
    r22_143 = g_Savefonts2.timesize
  end
  if _save then
    r4_143:setText("configBase", r18_143, r19_143, r21_143, r22_143, 0, 0, g_saveTextColor.time, g_saveTextColor.timeEdge)
  else
    r4_143:setText("configBase", r18_143, r19_143, r21_143, r22_143, 0, 0, g_saveTextColor.time2, g_saveTextColor.timeEdge2)
  end
  if g_UseSaveNoTxt then
    if r17_143 == 0 then
      r22_143 = g_Savefonts2.nosize
    end
    if r17_143 == 1 then
      r22_143 = g_Savefonts.nosize
    end
    if r17_143 == 2 then
      r22_143 = g_Savefonts2.nosize
    end
    local r23_143 = getSaveThumbNoTxt(r0_143, r3_143)
    r4_143:insertTextLayer("configBase", r23_143, 210, 20, 2, 2, 14, 2, 0, 1)
    r4_143:setParam("configBase", r23_143, LUA_PARAM_POS, r10_143 + 12, r11_143 + 10, 0, 0)
    r4_143:setText("configBase", r23_143, SaveDataLabelTxt(g_dataInfo.page, r3_143), r21_143, r22_143, 0, 0, g_saveTextColor.No, g_saveTextColor.NoEdge)
  end
  if r17_143 == 0 then
    r22_143 = g_Savefonts2.size
  end
  if r17_143 == 1 then
    r22_143 = g_Savefonts.size
  end
  if r17_143 == 2 then
    r22_143 = g_Savefonts2.size
  end
  local r23_143 = getSaveThumbTxt(r0_143, r3_143)
  r4_143:insertTextLayer("configBase", r23_143, 150, 50, 2, 2, 14, 2, 0, 1)
  r4_143:setParam("configBase", r23_143, LUA_PARAM_POS, r10_143 + 12, r11_143 + 130, 0, 0)
  r19_143 = ""
  if g_dataInfo.page == g_DATAPAGEMAX then
    if r3_143 < 6 then
      local r24_143 = cfunc.CSaveDataManager__lua_GetSaveDataText(DATA_MODE_AUTO, g_autoOrder[r3_143], getGameEngineVersion(), getAltLanguage(), 0)
      if #r24_143 == 0 then
      end
      r19_143 = r19_143 .. r24_143
    else
      r19_143 = r19_143 .. cfunc.CSaveDataManager__lua_GetSaveDataText(DATA_MODE_QUICK, g_quickOrder[r3_143 - 5], getGameEngineVersion(), getAltLanguage(), 1)
    end
  else
    r19_143 = r19_143 .. cfunc.CSaveDataManager__lua_GetSaveDataText(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r3_143, getGameEngineVersion(), getAltLanguage(), 1)
  end
  r4_143:setText("configBase", r23_143, r19_143, r21_143, r22_143, 0, 0, g_saveTextColor.normal, g_saveTextColor.normalEdge)
end
