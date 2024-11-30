-- filename: 
-- version: lua53
-- line: [0, 0] id: 0
ConfigGetPageFileName = function(r0_1)
  -- line: [17, 32] id: 1
  if r0_1 == 5 then
    r0_1 = 4
  end
  local r1_1 = getUItype()
  local r2_1 = string.format("sys_config_P%d.pna", r0_1)
  if r1_1 == 1 and (r0_1 == 1 or r0_1 == 2 or r0_1 == 3 or r0_1 == 4 or r0_1 == 6 or r0_1 == 7) then
    r2_1 = string.format("sys_c_config_P%d.pna", r0_1)
  end
  return r2_1
end
ConfigGetPageKeyName = function(r0_2)
  -- line: [35, 39] id: 2
  return string.format("ConfigPage%03d", r0_2)
end
getConfigText = function()
  -- line: [43, 45] id: 3
  return "ConfigText2", "ConfigTextName"
end
getSaveThumbKey = function(r0_4, r1_4)
  -- line: [47, 53] id: 4
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
getSaveThumbTxt = function(r0_5, r1_5)
  -- line: [55, 60] id: 5
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
getSaveThumbTimeTxt = function(r0_6, r1_6)
  -- line: [63, 68] id: 6
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
getSaveThumbNoTxt = function(r0_7, r1_7)
  -- line: [71, 76] id: 7
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
openConfig = function(r0_8, r1_8)
  -- line: [79, 6815] id: 8
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
    return false
  end
  if g_Menu.Config.ptr ~= nil and (g_Menu.Config.ptr.MenuInf.enabled == true or g_Menu.Config.ptr.MenuInf.effect == true) then
    return false
  end
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ACHIEVEMENT, 5)
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
  g_Menu.Config.ptr.GetMenuMouseEnable = function(r0_9)
    -- line: [157, 166] id: 9
    local r1_9 = false
    if r0_9.MenuInf.enabled == true and r0_9.MenuInf.effect == false and r0_9.MenuInf.pageEffect == false and r0_9.MenuButton ~= nil then
      r1_9 = true
    end
    return r1_9
  end
  g_Menu.Config.ptr.MenuEffect = function(r0_10)
    -- line: [169, 244] id: 10
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
  g_Menu.Config.ptr.MenuEffectEndJob = function(r0_11)
    -- line: [247, 285] id: 11
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
  g_Menu.Config.ptr.updateConfigCursorPos = function(r0_12)
    -- line: [288, 298] id: 12
    local r1_12 = cclass.lua_Layers:create()
    local r2_12 = 0
    local r3_12 = 0
    local r4_12 = cclass.lua_AutoCursor:new()
    r2_12, r3_12 = r4_12:GetCursorPos(r2_12, r3_12)
    r4_12:delete()
    r0_12.MenuButton:changeButton("configBase", r1_12:getCursorPos("configBase", r2_12, r3_12, 0) - 1, r2_12, r3_12)
  end
  g_Menu.Config.ptr.defaultMenuMouseMove = g_Menu.Config.ptr.MenuMouseMove
  g_Menu.Config.ptr.MenuMouseMove = function(r0_13, r1_13, r2_13, r3_13, r4_13, r5_13, r6_13)
    -- line: [303, 351] id: 13
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
  g_Menu.Config.ptr.MenuButtonJobPosRepeat = function(r0_14, r1_14, r2_14, r3_14, r4_14, r5_14, r6_14, r7_14)
    -- line: [354, 365] id: 14
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
  g_Menu.Config.ptr.MenuButtonJobPos = function(r0_15, r1_15, r2_15, r3_15, r4_15)
    -- line: [368, 474] id: 15
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
  g_Menu.Config.ptr.MenuKeyDown = function(r0_16, r1_16, r2_16, r3_16, r4_16)
    -- line: [476, 477] id: 16
  end
  g_Menu.Config.ptr.MenuMouseWheel = function(r0_17, r1_17, r2_17, r3_17)
    -- line: [480, 488] id: 17
    if r0_17:GetMenuMouseEnable() and g_configPage == 8 and r0_17.MenuMouseWheelP8 ~= nil then
      r0_17:MenuMouseWheelP8(r1_17, r2_17, r3_17)
    end
  end
  g_Menu.Config.ptr.startConfigMenu = function(r0_18, r1_18)
    -- line: [494, 513] id: 18
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
  g_Menu.Config.ptr.initConfigButton = function(r0_19)
    -- line: [518, 593] id: 19
    local r1_19 = cclass.lua_Layers:create()
    r1_19:initSubLayer("configBase", "configBase01", 7, 1)
    r1_19:initSubLayer("configBase", "configBase01", 6, 1)
    r1_19:initSubLayer("configBase", "configBase01", 5, 1)
    r1_19:initSubLayer("configBase", "configBase01", 4, 1)
    r1_19:initSubLayer("configBase", "configBase01", 3, 1)
    r1_19:initSubLayer("configBase", "configBase01", 2, 1)
    r1_19:initSubLayer("configBase", "configBase01", 171, 1)
    r1_19:initSubLayer("configBase", "configBase01", 170, 1)
    r1_19:initSubLayer("configBase", "configBase01", 169, 1)
    r1_19:initSubLayer("configBase", "configBase01", 190, 1)
    r0_19.MenuButtonData = {}
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "System", 1, "configBase01", 34, 34, 25, -1, 43, 1, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Text", 1, "configBase01", 33, 33, 24, -1, 42, 2, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Sound", 1, "configBase01", 32, 32, 23, -1, 41, 3, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Save", 1, "configBase01", 31, 31, 22, -1, 40, 4, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Load", 1, "configBase01", 30, 30, 21, -1, 39, 5, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Shortcut", 1, "configBase01", 29, 29, 20, -1, 38, 6, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "Gesture", 1, "configBase01", 28, 28, 19, -1, 37, 7, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "default", 1, "configBase01", 187, 187, 181, -1, 175, 10, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "back", 1, "configBase01", 186, 186, 180, -1, 174, 11, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "title", 1, "configBase01", 185, 185, 179, -1, -1, 12, 0, 0)
    r0_19:MenuButtonSet(r0_19.MenuButtonData, "quit", 1, "configBase01", 184, 184, 178, -1, -1, 13, 0, 0)
    r0_19:MenuButtonInit()
  end
  g_Menu.Config.ptr.DashboardMove = function(r0_20, r1_20, r2_20)
    -- line: [596, 617] id: 20
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
  g_Menu.Config.ptr.UpButtonMove = function(r0_21, r1_21, r2_21)
    -- line: [620, 664] id: 21
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
  g_Menu.Config.ptr.UpButtonMoveEnd = function(r0_22, r1_22)
    -- line: [666, 678] id: 22
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
  g_Menu.Config.ptr.SetConfigButtonActive = function(r0_23, r1_23)
    -- line: [682, 767] id: 23
    for r6_23, r7_23 in pairs({
      "System",
      "Text",
      "Sound",
      "Save",
      "Load",
      "Shortcut",
      "Gesture",
      "NMSMenu",
      "Tips"
    }) do
      local r8_23 = r0_23.MenuButtonData[r7_23]
      if r8_23 ~= nil then
        if r6_23 == r1_23 then
          r0_23.MenuButtonData[r7_23]:bt_SetActive(1)
        else
          r0_23.MenuButtonData[r7_23]:bt_SetActive(0)
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
    local r3_23 = cfunc.LegacyGame__lua_GetFlag(140)
    local r4_23 = cfunc.LegacyGame__lua_GetFlag(127)
    local r5_23 = false
    if r4_23 then
      if r0_23.MenuButtonData.rereplay ~= nil then
        r0_23.MenuButtonData.rereplay:bt_SetActive(0)
        r5_23 = true
      end
      if r0_23.MenuButtonData.renms ~= nil then
        r0_23.MenuButtonData.renms:bt_SetActive(3)
      end
      if r5_23 then
        r0_23.MenuButtonData.title:bt_SetActive(3)
      end
    end
    if r3_23 then
      if r0_23.MenuButtonData.rereplay ~= nil then
        r0_23.MenuButtonData.rereplay:bt_SetActive(3)
      end
      if r0_23.MenuButtonData.renms ~= nil then
        r0_23.MenuButtonData.renms:bt_SetActive(0)
        r5_23 = true
      end
      if r5_23 then
        r0_23.MenuButtonData.title:bt_SetActive(3)
      end
    end
    if g_Menu.Config.ptr.NMSAcitve == false and r0_23.MenuButtonData.NMSMenu ~= nil then
      r0_23.MenuButtonData.NMSMenu:bt_SetActive(2)
    end
  end
  g_Menu.Config.ptr.PageSlide = true
  g_Menu.Config.ptr.initConfigPage = function(r0_24, r1_24, r2_24)
    -- line: [772, 944] id: 24
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
      if g_configPage == 1 then
        r0_24:effectCfg1Preview(r2_24, r10_24, r4_24, true, r8_24)
      elseif g_configPage == 2 then
        r0_24:effectCfg2Text(r2_24, r10_24, r4_24, true, r8_24)
      elseif g_configPage == 4 or g_configPage == 5 then
        local r12_24 = g_configPage
        if r12_24 == 4 then
          r12_24 = true or false
        else
          goto label_160	-- block#36 is visited secondly
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
        r12_24 = false
        if r12_24 then
          r5_24:setParam("configBase", r9_24, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r5_24:setEffect("configBase", r9_24, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r4_24, 0, r8_24)
          r5_24:startEffect("configBase", r9_24, "ConfigPage", 0)
        end
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
          r12_24 = true or false
        else
          goto label_350	-- block#57 is visited secondly
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
  g_Menu.Config.ptr.ConfigLogo = function(r0_25, r1_25, r2_25, r3_25, r4_25)
    -- line: [947, 1125] id: 25
    local r5_25 = cclass.lua_Layers:create()
    local r6_25 = 0
    if false then
      local r7_25 = 0
      local r8_25 = false
      if r1_25 == 1 or r1_25 == 2 or r1_25 == 3 or r1_25 == 7 then
        r7_25 = 1
        if g_configPage == 0 or g_configPage == 4 or g_configPage == 5 or g_configPage == 6 then
          r8_25 = true
        end
      else
        r7_25 = 0
        if g_configPage == 1 or g_configPage == 2 or g_configPage == 3 or g_configPage == 7 then
          r8_25 = true
        end
      end
      local r9_25 = 85
      r5_25:setSubLayerVisible("configBase", "configBase01", r9_25, r7_25)
      if 0 < r3_25 and r8_25 then
        if r7_25 == 1 then
          r5_25:setSubLayerParam("configBase", "configBase01", r9_25, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r5_25:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r9_25, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_25 * r4_25, 0, r6_25)
          r5_25:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r9_25, 0)
        else
          r5_25:setSubLayerParam("configBase", "configBase01", r9_25, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r5_25:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r9_25, LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_25 * r4_25, 0, r6_25)
          r5_25:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r9_25, 0)
        end
      else
        r5_25:setSubLayerParam("configBase", "configBase01", r9_25, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
  end
  g_Menu.Config.ptr.ItemSetInit = function(r0_26)
    -- line: [1129, 1136] id: 26
    return {
      selCursor_selName = -1,
      selCursor_Item = -1,
      selCursor_SubItem = -1,
      selCursor_Conf = -1,
    }
  end
  g_Menu.Config.ptr.ItemSet = function(r0_27, r1_27, r2_27, r3_27, r4_27, r5_27)
    -- line: [1137, 1168] id: 27
    r1_27.selCursor_selName = r2_27
    if r1_27.selCursor_Item ~= -1 then
      r1_27.selCursor_Item:SetAct("def")
      r1_27.selCursor_Item = -1
    end
    if r1_27.selCursor_SubItem ~= -1 then
      r1_27.selCursor_SubItem:SetAct("def")
      r1_27.selCursor_SubItem = -1
    end
    if r1_27.selCursor_Conf ~= -1 then
      r1_27.selCursor_Conf:SetAct("def")
      r1_27.selCursor_Conf = -1
    end
    if r3_27 ~= -1 then
      r1_27.selCursor_Item = r1_27[r3_27]
      r1_27.selCursor_Item:SetAct("on")
    end
    if r4_27 ~= -1 then
      r1_27.selCursor_SubItem = r1_27[r4_27]
      r1_27.selCursor_SubItem:SetAct("on")
    end
    if r5_27 ~= -1 then
      r1_27.selCursor_Conf = r1_27[r5_27]
      r1_27.selCursor_Conf:SetAct("on")
    end
  end
  g_Menu.Config.ptr.CheckItemNew = function(r0_28, r1_28, r2_28, r3_28, r4_28, r5_28)
    -- line: [1172, 1181] id: 28
    local r6_28 = MenuItem.new("configBase", r1_28, r2_28, r3_28)
    r6_28:addLayer("Actdef", r4_28)
    r6_28:addLayer("Acton", r5_28)
    r6_28:ReSet()
    r6_28:SetAct("def")
    r6_28.ActiveFlag = 0
    return r6_28
  end
  g_Menu.Config.ptr.CheckItemAct = function(r0_29, r1_29, r2_29, r3_29)
    -- line: [1183, 1192] id: 29
    if r1_29 == nil then
      return 
    end
    if r1_29[r2_29] == nil then
      return 
    end
    r1_29[r2_29].ActiveFlag = r3_29
  end
  g_Menu.Config.ptr.CheckItemOnCursor = function(r0_30, r1_30, r2_30, r3_30)
    -- line: [1195, 1216] id: 30
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
  g_Menu.Config.ptr.SetSliderParam = function(r0_31, r1_31, r2_31, r3_31, r4_31, r5_31, r6_31)
    -- line: [1222, 1239] id: 31
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
  g_Menu.Config.ptr.MoveSliderBack = function(r0_32, r1_32, r2_32, r3_32)
    -- line: [1241, 1255] id: 32
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
  g_Menu.Config.ptr.GaugeBarCreate = function(r0_33, r1_33, r2_33, r3_33, r4_33, r5_33, r6_33)
    -- line: [1260, 1343] id: 33
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
        -- line: [1272, 1289] id: 34
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
        -- line: [1292, 1308] id: 35
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
        -- line: [1311, 1331] id: 36
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
        -- line: [1334, 1340] id: 37
        if r0_37.set == r1_37 and r2_37 == r0_37.key and r3_37 == r0_37.hit then
          r0_37.OnMouse = true
        else
          r0_37.OnMouse = false
        end
      end,
    }
  end
  g_Menu.Config.ptr.Page1_SetActive = function(r0_38)
    -- line: [1350, 1566] id: 38
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
    if false then
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
      if getAltLanguage() then
        r0_38.ButtonP1.Language1:bt_SetActive(0)
        r0_38.ButtonP1.Language2:bt_SetActive(4)
      else
        r0_38.ButtonP1.Language1:bt_SetActive(4)
        r0_38.ButtonP1.Language2:bt_SetActive(0)
      end
    end
    r0_38:ActiveCheckItemP1()
  end
  g_Menu.Config.ptr.P1_ButtonJobLD = function(r0_39, r1_39, r2_39, r3_39, r4_39)
    -- line: [1569, 1570] id: 39
  end
  g_Menu.Config.ptr.P1_ButtonJobLU = function(r0_40, r1_40, r2_40, r3_40, r4_40)
    -- line: [1571, 1750] id: 40
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
  g_Menu.Config.ptr.initConfigP1_BBase = 137
  g_Menu.Config.ptr.hiyakeflag = true
  g_Menu.Config.ptr.PreviewList = {}
  g_Menu.Config.ptr.initConfigP1 = function(r0_41, r1_41, r2_41)
    -- line: [1755, 2125] id: 41
    local r3_41 = cclass.lua_Layers:create()
    if r2_41 == true then
      r3_41:initSubLayer("configBase", r1_41, 119, 0)
      r3_41:initSubLayer("configBase", r1_41, 120, 0)
      r3_41:initSubLayer("configBase", r1_41, 121, 0)
      r3_41:initSubLayer("configBase", r1_41, 122, 0)
      r3_41:initSubLayer("configBase", r1_41, 123, 0)
      r3_41:initSubLayer("configBase", r1_41, 126, 0)
      r3_41:initSubLayer("configBase", r1_41, 127, 0)
      r3_41:initSubLayer("configBase", r1_41, 128, 0)
      r3_41:initSubLayer("configBase", r1_41, 129, 0)
      r3_41:initSubLayer("configBase", r1_41, 130, 0)
      r3_41:initSubLayer("configBase", r1_41, 131, 0)
      r3_41:initSubLayer("configBase", r1_41, 132, 0)
      r3_41:initSubLayer("configBase", r1_41, 134, 0)
      r3_41:initSubLayer("configBase", r1_41, 135, 0)
      r3_41:initSubLayer("configBase", r1_41, 136, 0)
      r3_41:initSubLayer("configBase", r1_41, r0_41.initConfigP1_BBase, 1)
      if g_CASTOFF then
        r3_41:initSubLayer("configBase", r1_41, 17, 1)
        r3_41:initSubLayer("configBase", r1_41, 18, 1)
      end
      r3_41:initSubLayer("configBase", r1_41, 160, 1)
      r0_41.ButtonP1 = {}
      r0_41:MenuButtonSet(r0_41.ButtonP1, "Window", 1, r1_41, 22, 22, 46, 70, -1, 101, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "FullScreen", 1, r1_41, 23, 23, 47, 71, -1, 102, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "FullSize", 1, r1_41, 25, 25, 49, 73, -1, 103, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "LetterBox", 1, r1_41, 24, 24, 48, 72, -1, 104, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "SideCut", 1, r1_41, 26, 26, 50, 74, -1, 105, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "Without", 1, r1_41, 27, 27, 51, 75, -1, 106, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "MswNormal", 1, r1_41, 28, 28, 52, 76, -1, 140, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "MswSimple", 1, r1_41, 29, 29, 53, 77, -1, 141, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "EFF_Normal", 1, r1_41, 30, 30, 54, 78, -1, 109, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "EFF_Fast", 1, r1_41, 31, 31, 55, 79, -1, 110, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "EFF_None", 1, r1_41, 32, 32, 56, 80, -1, 111, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "SkipIconOn", 1, r1_41, 33, 33, 57, 81, -1, 117, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "SkipIconOff", 1, r1_41, 34, 34, 58, 82, -1, 118, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "AutoCurOn", 1, r1_41, 35, 35, 59, 83, -1, 112, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "AutoCurOff", 1, r1_41, 36, 36, 60, 84, -1, 113, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "ConfMsgOn", 1, r1_41, 37, 37, 61, 85, -1, 119, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "ConfMsgOff", 1, r1_41, 38, 38, 62, 86, -1, 120, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "EraseCur5", 1, r1_41, 39, 39, 63, 87, -1, 127, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "EraseCur30", 1, r1_41, 40, 40, 64, 88, -1, 128, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "EraseCurOff", 1, r1_41, 41, 41, 65, 89, -1, 116, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "DeactiveOn", 1, r1_41, 42, 42, 66, 90, -1, 121, 0, 0)
      r0_41:MenuButtonSet(r0_41.ButtonP1, "DeactiveOff", 1, r1_41, 43, 43, 67, 91, -1, 122, 0, 0)
      if false then
        r0_41:MenuButtonSet(r0_41.ButtonP1, "MouseRConfig", 1, r1_41, 94, 94, 38, 66, 122, 124, 0, 0)
        r0_41:MenuButtonSet(r0_41.ButtonP1, "MouseRSave", 1, r1_41, 93, 93, 37, 65, 121, 125, 0, 0)
        r0_41:MenuButtonSet(r0_41.ButtonP1, "MouseRLoad", 1, r1_41, 92, 92, 36, 64, 120, 126, 0, 0)
        r0_41:MenuButtonSet(r0_41.ButtonP1, "MouseRClose", 1, r1_41, 91, 91, 35, 63, 119, 123, 0, 0)
      end
      if g_CASTOFF then
        r0_41:MenuButtonSet(r0_41.ButtonP1, "CastOn", 1, r1_41, 15, 15, 10, 5, -1, 130, 0, 0)
        r0_41:MenuButtonSet(r0_41.ButtonP1, "CastOffEx", 1, r1_41, 14, 14, 9, 4, -1, 132, 0, 0)
        r0_41:MenuButtonSet(r0_41.ButtonP1, "CastOff", 1, r1_41, 13, 13, 8, 3, -1, 131, 0, 0)
      end
      if getLangPatchFlag() then
        r0_41:MenuButtonSet(r0_41.ButtonP1, "Language1", 1, r1_41, 156, 156, 148, 152, -1, 133, 0, 0)
        r0_41:MenuButtonSet(r0_41.ButtonP1, "Language2", 1, r1_41, 155, 155, 147, 151, -1, 134, 0, 0)
      end
      r0_41.MenuButton:InitList()
      r0_41.MenuButton:SetList("ButtonP1", r0_41.ButtonP1)
      r0_41.MenuButton:InitButton()
      r3_41:initSubLayer("configBase", r1_41, r0_41.initConfigP1_BBase, 1)
      local r4_41 = 0
      local r5_41 = 0
      r4_41, r5_41, r6_41, r7_41 = r3_41:getScreenAspect(r4_41, r5_41, 0, 0)
      local r8_41 = 0
      local r9_41 = 0
      r8_41, r9_41, r10_41, r11_41 = r3_41:getSubLayerParam("configBase", r1_41, r0_41.initConfigP1_BBase, LUA_PARAM_SIZE, r8_41, r9_41, 0, 0)
      if r4_41 ~= 16 or r5_41 ~= 9 then
        r3_41:setSubLayerParam("configBase", r1_41, r0_41.initConfigP1_BBase, LUA_PARAM_SCALE, 1, r8_41 / r4_41 * r5_41 / r9_41, 1, 0)
      end
      r0_41.PreviewList = {}
      if g_menuExecute == false then
        r3_41:insertPreviewLayer("configBase", "preview1", r8_41, r9_41, 1)
        r0_41.PreviewList[1] = "preview1"
      else
        if g_TrialFlag == 0 then
          if r0_41.AllClearFlag then
            r3_41:insertPNARefLayer("configBase", "preview1", r1_41, 136, 1)
          else
            r3_41:insertPNARefLayer("configBase", "preview1", r1_41, 135, 1)
          end
          r0_41.PreviewList[1] = "preview1"
          r3_41:insertPNARefLayer("configBase", "preview6", r1_41, 134, 1)
          r0_41.PreviewList[6] = "preview6"
          r3_41:insertPNARefLayer("configBase", "preview2", r1_41, 119, 1)
          r0_41.PreviewList[2] = "preview2"
          if r0_41.GetAnyClearFlag then
            r3_41:insertPNARefLayer("configBase", "preview3", r1_41, 122, 1)
          else
            r3_41:insertPNARefLayer("configBase", "preview3", r1_41, 123, 1)
          end
          r0_41.PreviewList[3] = "preview3"
          if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) then
            r3_41:insertPNARefLayer("configBase", "preview4", r1_41, 120, 1)
          else
            r3_41:insertPNARefLayer("configBase", "preview4", r1_41, 121, 1)
          end
          r0_41.PreviewList[4] = "preview4"
        end
        if g_TrialFlag >= 1 then
          r3_41:insertPNARefLayer("configBase", "preview1", r1_41, 135, 1)
          r0_41.PreviewList[1] = "preview1"
          r3_41:insertPNARefLayer("configBase", "preview6", r1_41, 134, 1)
          r0_41.PreviewList[6] = "preview6"
          r3_41:insertPNARefLayer("configBase", "preview2", r1_41, 119, 1)
          r0_41.PreviewList[2] = "preview2"
          r3_41:insertPNARefLayer("configBase", "preview3", r1_41, 123, 1)
          r0_41.PreviewList[3] = "preview3"
          if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) then
            r3_41:insertPNARefLayer("configBase", "preview4", r1_41, 121, 1)
            r0_41.PreviewList[4] = "preview4"
          else
            r3_41:insertPNARefLayer("configBase", "preview4", r1_41, 120, 1)
            r0_41.PreviewList[4] = "preview4"
          end
        end
      end
      local r12_41 = 0
      local r13_41 = 0
      local r14_41 = 0
      local r15_41 = 0
      r12_41, r13_41, r14_41, r15_41 = r3_41:getSubLayerParam("configBase", r1_41, r0_41.initConfigP1_BBase, LUA_PARAM_POS, r12_41, r13_41, r14_41, r15_41)
      for r19_41, r20_41 in pairs(r0_41.PreviewList) do
        r3_41:setParam("configBase", r20_41, LUA_PARAM_POS, r12_41, r13_41, r14_41, r15_41)
      end
      r0_41.ItemP1 = r0_41:ItemSetInit()
      r0_41.ItemP1.WindowMode = MenuItem.new("configBase", r1_41, 95, 106)
      r0_41.ItemP1.WideScreen = MenuItem.new("configBase", r1_41, 96, 107)
      r0_41.ItemP1.MswType = MenuItem.new("configBase", r1_41, 97, 108)
      r0_41.ItemP1.Effect = MenuItem.new("configBase", r1_41, 98, 109)
      r0_41.ItemP1.SkipIcon = MenuItem.new("configBase", r1_41, 99, 110)
      r0_41.ItemP1.AutoCursor = MenuItem.new("configBase", r1_41, 100, 111)
      r0_41.ItemP1.ConfMsg = MenuItem.new("configBase", r1_41, 101, 112)
      r0_41.ItemP1.EraseCursor = MenuItem.new("configBase", r1_41, 102, 113)
      r0_41.ItemP1.Deactive = MenuItem.new("configBase", r1_41, 103, 114)
      if getLangPatchFlag() then
        r0_41.ItemP1.Language = MenuItem.new("configBase", r1_41, 143, 142)
      end
      r0_41.ItemP1.Headline_WindowMode = "WindowMode"
      r0_41.ItemP1.Headline_WideScreen = "WideScreen"
      r0_41.ItemP1.Headline_MswType = "MswType"
      r0_41.ItemP1.Headline_Effect = "Effect"
      r0_41.ItemP1.Headline_AutoCursor = "AutoCursor"
      r0_41.ItemP1.Headline_EraseCursor = "EraseCursor"
      r0_41.ItemP1.Headline_RClick = -1
      r0_41.ItemP1.Headline_SkipIcon = "SkipIcon"
      r0_41.ItemP1.Headline_ConfMsg = "ConfMsg"
      r0_41.ItemP1.Headline_Deactive = "Deactive"
      r0_41.ItemP1.Headline_CastOff = -1
      r0_41.ItemP1.expWindowModeWin = MenuItem.new("configBase", r1_41, -1, 17)
      r0_41.ItemP1.expWindowModeFull = MenuItem.new("configBase", r1_41, -1, 16)
      r0_41.ItemP1.expWideScreenFull = MenuItem.new("configBase", r1_41, -1, 15)
      r0_41.ItemP1.expWideScreenLett = MenuItem.new("configBase", r1_41, -1, 14)
      r0_41.ItemP1.expWideScreenSCut = MenuItem.new("configBase", r1_41, -1, 13)
      r0_41.ItemP1.expWideScreenNone = MenuItem.new("configBase", r1_41, -1, 12)
      r0_41.ItemP1.expMswNormal = MenuItem.new("configBase", r1_41, -1, 11)
      r0_41.ItemP1.expMswSimple = MenuItem.new("configBase", r1_41, -1, 10)
      r0_41.ItemP1.expEffectNomal = MenuItem.new("configBase", r1_41, -1, 9)
      r0_41.ItemP1.expEffectQuick = MenuItem.new("configBase", r1_41, -1, 8)
      r0_41.ItemP1.expEffectOff = MenuItem.new("configBase", r1_41, -1, 7)
      r0_41.ItemP1.expSkipIconOn = MenuItem.new("configBase", r1_41, -1, 6)
      r0_41.ItemP1.expAutoCursorOn = MenuItem.new("configBase", r1_41, -1, 5)
      r0_41.ItemP1.expConfMsgOn = MenuItem.new("configBase", r1_41, -1, 4)
      r0_41.ItemP1.expEraseCursor = MenuItem.new("configBase", r1_41, -1, 3)
      r0_41.ItemP1.expEraseCursorTime = -1
      r0_41.ItemP1.expDeactiveOn = MenuItem.new("configBase", r1_41, -1, 2)
      r0_41.ItemP1.expDeactiveOff = MenuItem.new("configBase", r1_41, -1, 1)
      r0_41.ItemP1.expMouseR = -1
      r0_41.ItemP1.expMouseRBLog = -1
      r0_41.ItemP1.expMouseRMin = -1
      r0_41.ItemP1.expCastOffJob = -1
      if getLangPatchFlag() then
        r0_41.ItemP1.expLanguage = MenuItem.new("configBase", r1_41, -1, 140)
      end
    end
    local r6_41 = "updatePreviewSize"
    r6_41 = r1_41
    r0_41:[r6_41](r6_41)
    r0_41:Page1_SetActive()
  end
  g_Menu.Config.ptr.OnCursorCheckItemP1 = function(r0_42, r1_42)
    -- line: [2129, 2130] id: 42
  end
  g_Menu.Config.ptr.ActiveCheckItemP1 = function(r0_43)
    -- line: [2133, 2136] id: 43
    r0_43:OnCursorCheckItemP1(-1)
  end
  g_Menu.Config.ptr.SelCursorP1 = function(r0_44, r1_44, r2_44, r3_44)
    -- line: [2140, 2309] id: 44
    if r1_44 == -1 or r0_44.ItemP1.selCursor_selName ~= r1_44 then
      r0_44:ItemSet(r0_44.ItemP1, -1, -1, -1, -1)
    end
    if r1_44 == "Window" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_WindowMode, -1, "expWindowModeWin")
    end
    if r1_44 == "FullScreen" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_WindowMode, -1, "expWindowModeFull")
    end
    if r1_44 == "FullSize" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_WideScreen, -1, "expWideScreenFull")
    end
    if r1_44 == "LetterBox" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_WideScreen, -1, "expWideScreenLett")
    end
    if r1_44 == "SideCut" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_WideScreen, -1, "expWideScreenSCut")
    end
    if r1_44 == "Without" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_WideScreen, -1, "expWideScreenNone")
    end
    if r1_44 == "MswNormal" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_MswType, -1, "expMswNormal")
    end
    if r1_44 == "MswSimple" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_MswType, -1, "expMswSimple")
    end
    if r1_44 == "EFF_Normal" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_Effect, -1, "expEffectNomal")
    end
    if r1_44 == "EFF_Fast" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_Effect, -1, "expEffectQuick")
    end
    if r1_44 == "EFF_None" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_Effect, -1, "expEffectOff")
    end
    if "AutoCurOn" == r1_44 or "AutoCurOff" == r1_44 then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_AutoCursor, -1, "expAutoCursorOn")
    end
    if r0_44.ItemP1.expEraseCursorTime ~= nil and r0_44.ItemP1.expEraseCursorTime ~= -1 then
      if "EraseCur5" == r1_44 or "EraseCur30" == r1_44 or "EraseCur5Off" == r1_44 or "EraseCur30Off" == r1_44 then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_EraseCursor, -1, "expEraseCursorTime")
      end
      if "EraseCurOn" == r1_44 or "EraseCurOff" == r1_44 then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_EraseCursor, -1, "expEraseCursor")
      end
    elseif "EraseCur5" == r1_44 or "EraseCur30" == r1_44 or "EraseCurOn" == r1_44 or "EraseCurOff" == r1_44 or "EraseCur5Off" == r1_44 or "EraseCur30Off" == r1_44 then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_EraseCursor, -1, "expEraseCursor")
    end
    if "SkipIconOn" == r1_44 or "SkipIconOff" == r1_44 then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_SkipIcon, -1, "expSkipIconOn")
    end
    if "ConfMsgOn" == r1_44 or "ConfMsgOff" == r1_44 then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_ConfMsg, -1, "expConfMsgOn")
    end
    if r1_44 == "DeactiveOn" then
      if r0_44.ItemP1.expDeactiveOn == -1 then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_Deactive, -1, "expDeactive")
      else
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_Deactive, -1, "expDeactiveOn")
      end
    end
    if r1_44 == "DeactiveOff" then
      if r0_44.ItemP1.expDeactiveOff == -1 then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_Deactive, -1, "expDeactive")
      else
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_Deactive, -1, "expDeactiveOff")
      end
    end
    if r1_44 == "MouseRClose" then
      if r0_44.ItemP1.expMouseR == -1 then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseRClose")
      else
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseR")
      end
    end
    if r1_44 == "MouseRConfig" then
      if r0_44.ItemP1.expMouseR == -1 then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseRConfig")
      else
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseR")
      end
    end
    if r1_44 == "MouseRSave" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseR")
    end
    if r1_44 == "MouseRLoad" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseR")
    end
    if r1_44 == "MouseRBLog" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseR")
    end
    if r1_44 == "MouseRMin" then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseR")
    end
    if r0_44.ItemP1.expCastOffJob ~= nil and r0_44.ItemP1.expCastOffJob ~= -1 then
      if "CastOn" == r1_44 or "CastOff" == r1_44 or "CastOffEx" == r1_44 then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_CastOff, -1, "expCastOffJob")
      end
    else
      if r1_44 == "CastOn" then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_CastOff, -1, "expCastOn")
      end
      if r1_44 == "CastOff" then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_CastOff, -1, "expCastOff")
      end
      if r1_44 == "CastOffEx" then
        r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_CastOff, -1, "expCastOffEx")
      end
    end
    if getLangPatchFlag() and ("Language1" == r1_44 or "Language2" == r1_44) then
      r0_44:ItemSet(r0_44.ItemP1, r1_44, "Language", -1, "expLanguage")
    end
    r0_44:OnCursorCheckItemP1(r1_44)
    -- warn: not visited block [71, 77, 83, 89]
    -- block#71:
    -- r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseRSave")
    -- goto label_339
    -- block#77:
    -- r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseRLoad")
    -- goto label_370
    -- block#83:
    -- r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseRBLog")
    -- goto label_401
    -- block#89:
    -- r0_44:ItemSet(r0_44.ItemP1, r1_44, r0_44.ItemP1.Headline_RClick, -1, "expMouseRMin")
    -- goto label_432
  end
  g_Menu.Config.ptr.effectCfg1Preview = function(r0_45, r1_45, r2_45, r3_45, r4_45, r5_45)
    -- line: [2312, 2347] id: 45
    local r6_45 = cclass.lua_Layers:create()
    local r7_45 = getEffectRate()
    for r11_45, r12_45 in pairs(r0_45.PreviewList) do
      if r12_45 ~= nil and r1_45 ~= true then
        if r0_45.PageSlide then
          if r4_45 == false then
            local r13_45 = 0
            local r14_45 = 0
            local r15_45 = 0
            local r16_45 = 0
            r13_45, r14_45, r15_45, r16_45 = r6_45:getParam("configBase", r12_45, LUA_PARAM_POS, r13_45, r14_45, r15_45, r16_45)
            r6_45:setParam("configBase", r12_45, LUA_PARAM_POS, r13_45 - r2_45, r14_45, r15_45, r16_45)
            r6_45:setParam("configBase", r12_45, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r6_45:setEffect("configBase", r12_45, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_45, 0, r5_45)
          else
            r6_45:setEffect("configBase", r12_45, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_45, 0, r5_45)
          end
          r6_45:setEffect("configBase", r12_45, "ConfigPage", LUA_EFFECT_POS, r2_45, 0, 0, 0, 2, r3_45, 0, r5_45)
        elseif r4_45 == false then
          r6_45:setParam("configBase", r12_45, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_45:setEffect("configBase", r12_45, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_45, 0, r5_45)
        else
          r6_45:setEffect("configBase", r12_45, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_45, 0, r5_45)
        end
        r6_45:startEffect("configBase", r12_45, "ConfigPage", 0)
      end
    end
  end
  g_Menu.Config.ptr.updatePreviewSize = function(r0_46, r1_46)
    -- line: [2350, 2393] id: 46
    local r2_46 = cclass.lua_Layers:create()
    local r3_46 = 0
    local r4_46 = 0
    local r5_46 = 0
    r3_46, r4_46, r5_46, r6_46 = r2_46:getScreenAspect(r3_46, r4_46, r5_46, 0)
    local r7_46 = 0
    local r8_46 = 0
    r7_46, r8_46, r9_46, r10_46 = r2_46:getSubLayerParam("configBase", r1_46, r0_46.initConfigP1_BBase, LUA_PARAM_SIZE, r7_46, r8_46, 0, 0)
    for r14_46, r15_46 in pairs(r0_46.PreviewList) do
      if r15_46 ~= nil then
        if g_zoomMode == 3 then
          local r16_46 = APP_INTERNAL_WIDTH / r5_46
          r2_46:setParam("configBase", r15_46, LUA_PARAM_SCALE, r16_46, r16_46, 1, 0)
          r2_46:setParam("configBase", r15_46, LUA_PARAM_RECT, 0, 0, r7_46, r8_46)
        elseif r3_46 ~= 16 or r4_46 ~= 9 then
          if g_zoomMode == 0 then
            r2_46:setParam("configBase", r15_46, LUA_PARAM_SCALE, 1, 1, 1, 0)
            r2_46:setParam("configBase", r15_46, LUA_PARAM_RECT, 0, 0, r7_46, r8_46)
          elseif g_zoomMode == 1 then
            r2_46:setParam("configBase", r15_46, LUA_PARAM_SCALE, 1, r7_46 / r3_46 * r4_46 / r8_46, 1, 0)
            r2_46:setParam("configBase", r15_46, LUA_PARAM_RECT, 0, 0, r7_46, r8_46)
          elseif g_zoomMode == 2 then
            local r16_46 = r7_46 / r3_46 * r4_46 / r8_46
            r2_46:setParam("configBase", r15_46, LUA_PARAM_SCALE, r16_46, r16_46, 1, 0)
            local r17_46 = (r7_46 * r16_46 - r7_46) * 1 / r16_46
            r2_46:setParam("configBase", r15_46, LUA_PARAM_RECT, r17_46 / 2, 0, r7_46 - r17_46, r8_46)
          end
        else
          r2_46:setParam("configBase", r15_46, LUA_PARAM_SCALE, 1, 1, 1, 0)
          r2_46:setParam("configBase", r15_46, LUA_PARAM_RECT, 0, 0, r7_46, r8_46)
        end
      end
    end
  end
  g_Menu.Config.ptr.Page2_SetActive = function(r0_47)
    -- line: [2399, 2473] id: 47
    -- notice: unreachable block#26
    if g_allskip == false then
      r0_47.ButtonP2.SkipRead:bt_SetActive(4)
      r0_47.ButtonP2.SkipAll:bt_SetActive(0)
    else
      r0_47.ButtonP2.SkipRead:bt_SetActive(0)
      r0_47.ButtonP2.SkipAll:bt_SetActive(4)
    end
    local r1_47 = cclass.lua_Layers:create()
    local r2_47 = ConfigGetPageKeyName(2)
    if g_selectReleaseSkip == true then
      if r0_47.ButtonP2.SkipOptOn ~= nil then
        r0_47.ButtonP2.SkipOptOn:bt_SetActive(4)
      end
      if r0_47.ButtonP2.SkipOptOff ~= nil then
        r0_47.ButtonP2.SkipOptOff:bt_SetActive(0)
      end
    else
      if r0_47.ButtonP2.SkipOptOn ~= nil then
        r0_47.ButtonP2.SkipOptOn:bt_SetActive(0)
      end
      if r0_47.ButtonP2.SkipOptOff ~= nil then
        r0_47.ButtonP2.SkipOptOff:bt_SetActive(4)
      end
    end
    if g_selectReleaseAuto == true then
      if r0_47.ButtonP2.AutoOptOn ~= nil then
        r0_47.ButtonP2.AutoOptOn:bt_SetActive(4)
      end
      if r0_47.ButtonP2.AutoOptOff ~= nil then
        r0_47.ButtonP2.AutoOptOff:bt_SetActive(0)
      end
    else
      if r0_47.ButtonP2.AutoOptOn ~= nil then
        r0_47.ButtonP2.AutoOptOn:bt_SetActive(0)
      end
      if r0_47.ButtonP2.AutoOptOff ~= nil then
        r0_47.ButtonP2.AutoOptOff:bt_SetActive(4)
      end
    end
    if r0_47.ButtonP2.ReadColorOn ~= nil then
      if g_ReadColorChange == true then
        r0_47.ButtonP2.ReadColorOn:bt_SetActive(4)
        r0_47.ButtonP2.ReadColorOff:bt_SetActive(0)
      else
        r0_47.ButtonP2.ReadColorOn:bt_SetActive(0)
        r0_47.ButtonP2.ReadColorOff:bt_SetActive(4)
      end
    end
    r0_47.GaugeBarP2.SL_MsgSpeed:GaugeSetParam(g_msgspeed)
    r0_47.GaugeBarP2.SL_OpaWin:GaugeSetParam(g_messagealpha)
    r0_47.GaugeBarP2.SL_AutoSpeed:GaugeSetParam(g_autospeed)
    r0_47:SetSlideActP2(r0_47.MenuButton.selCursor)
  end
  g_Menu.Config.ptr.P2_GaugeJob = function(r0_48, r1_48, r2_48, r3_48, r4_48, r5_48)
    -- line: [2476, 2504] id: 48
    for r9_48, r10_48 in pairs(r0_48.GaugeBarP2) do
      local r11_48 = r10_48:GaugeMove(r1_48, r2_48, r3_48, r4_48, r5_48)
      if r11_48 == 1 then
        g_msgspeed = r0_48.GaugeBarP2.SL_MsgSpeed.param
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEMSGSPEED, 0)
        startCfg2Preview()
      end
      if r11_48 == 2 then
        g_messagealpha = r0_48.GaugeBarP2.SL_OpaWin.param
        r0_48:setCfg2WindowAlpa()
        if g_MenuMsgWin ~= nil then
          g_MenuMsgWin:changeMessageWindowOpacity()
        end
        if g_menuExecute == false then
          local r12_48 = cclass.lua_Layers:create()
          if g_CASTOFF then
            cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
          end
          r12_48:setForceBG(true)
          g_P1Renew = 3
        end
      end
      if r11_48 == 3 then
        g_autospeed = r0_48.GaugeBarP2.SL_AutoSpeed.param
      end
    end
  end
  g_Menu.Config.ptr.P2_ButtonRepeatLD = function(r0_49, r1_49, r2_49, r3_49, r4_49, r5_49, r6_49, r7_49)
    -- line: [2507, 2510] id: 49
    r0_49:P2_GaugeJob(r3_49, r4_49, r5_49, r6_49, r7_49)
  end
  g_Menu.Config.ptr.P2_ButtonJobLD = function(r0_50, r1_50, r2_50, r3_50, r4_50)
    -- line: [2513, 2530] id: 50
    -- notice: unreachable block#5
    -- notice: unreachable block#4
    -- notice: unreachable block#6
    -- notice: unreachable block#7
    -- notice: unreachable block#3
    -- notice: unreachable block#2
    if g_configPage == 2 then
      r0_50.SliderMoveNo = 299
    end
  end
  g_Menu.Config.ptr.P2_ButtonJobLU = function(r0_51, r1_51, r2_51, r3_51, r4_51)
    -- line: [2531, 2662] id: 51
    -- notice: unreachable block#55
    -- notice: unreachable block#48
    -- notice: unreachable block#53
    -- notice: unreachable block#3
    -- notice: unreachable block#10
    -- notice: unreachable block#11
    -- notice: unreachable block#57
    -- notice: unreachable block#5
    -- notice: unreachable block#9
    -- notice: unreachable block#49
    -- notice: unreachable block#2
    -- notice: unreachable block#51
    -- notice: unreachable block#52
    -- notice: unreachable block#56
    -- notice: unreachable block#8
    -- notice: unreachable block#13
    -- notice: unreachable block#1
    -- notice: unreachable block#50
    -- notice: unreachable block#54
    -- notice: unreachable block#4
    -- notice: unreachable block#6
    -- notice: unreachable block#7
    -- notice: unreachable block#12
    -- notice: unreachable block#47
    r0_51:P2_GaugeJob(-1, -1, -1, r3_51, r4_51)
    if r1_51 == 201 then
      g_allskip = false
    end
    if r1_51 == 202 then
      g_allskip = true
    end
    if r1_51 == 203 then
      if r0_51.ButtonP2.SkipOptOff == nil then
        if g_selectReleaseSkip == true then
          g_selectReleaseSkip = false
        else
          g_selectReleaseSkip = true
        end
      else
        g_selectReleaseSkip = true
      end
    end
    if r1_51 == 204 and r0_51.ButtonP2.SkipOptOff ~= nil then
      g_selectReleaseSkip = false
    end
    if r1_51 == 205 then
      if r0_51.ButtonP2.AutoOptOff == nil then
        if g_selectReleaseAuto == true then
          g_selectReleaseAuto = false
        else
          g_selectReleaseAuto = true
        end
      else
        g_selectReleaseAuto = true
      end
    end
    if r1_51 == 206 and r0_51.ButtonP2.AutoOptOff ~= nil then
      g_selectReleaseAuto = false
    end
    if r1_51 == 213 then
      g_ReadColorChange = true
    end
    if r1_51 == 214 then
      g_ReadColorChange = false
    end
    if 201 <= r1_51 and r1_51 <= 300 or 201 <= r0_51.SliderMoveNo and r0_51.SliderMoveNo <= 300 then
      r0_51:Page2_SetActive()
      r0_51.SliderMoveNo = -1
      r0_51:DeleteConfigNo()
    end
  end
  g_Menu.Config.ptr.MakeClkWait = function(r0_52, r1_52)
    -- line: [2665, 2681] id: 52
    -- notice: unreachable block#6
    if r0_52.P2IconKey ~= -1 then
      r1_52 = r0_52.P2IconKey
    end
    local r2_52 = cclass.lua_Layers:create()
    for r6_52 = 0, 14, 1 do
      r2_52:setAnimation("configBase", r1_52, "ClkWait", r6_52, 0.06666666666666667 * r6_52, 0)
    end
  end
  g_Menu.Config.ptr.StartClkWait = function(r0_53)
    -- line: [2684, 2708] id: 53
    -- notice: unreachable block#3
    local r1_53 = cclass.lua_Layers:create()
    local r2_53 = ConfigGetPageKeyName(2)
    if r0_53.P2IconKey ~= -1 then
      r2_53 = r0_53.P2IconKey
    end
    r1_53:startAnimation("configBase", r2_53, "ClkWait", 800, -1, 0)
  end
  g_Menu.Config.ptr.StopClkWait = function(r0_54)
    -- line: [2711, 2727] id: 54
    -- notice: unreachable block#3
    local r1_54 = cclass.lua_Layers:create()
    local r2_54 = ConfigGetPageKeyName(2)
    if r0_54.P2IconKey ~= -1 then
      r2_54 = r0_54.P2IconKey
    end
    r1_54:stopAnimation("configBase", r2_54, "ClkWait")
  end
  g_Menu.Config.ptr.P2SlideBar = {}
  g_Menu.Config.ptr.P2IconKey = -1
  g_Menu.Config.ptr.initConfigP2 = function(r0_55, r1_55, r2_55)
    -- line: [2732, 2927] id: 55
    -- notice: unreachable block#16
    -- notice: unreachable block#12
    -- notice: unreachable block#14
    -- notice: unreachable block#13
    -- notice: unreachable block#15
    -- notice: unreachable block#17
    -- notice: unreachable block#7
    if r2_55 == true then
      local r3_55 = cclass.lua_Layers:create()
      r0_55.P2IconKey = "P2Icon"
      r0_55:MenuLoadLayer(r0_55.P2IconKey, "Sys_ClickWait.pna")
      r3_55:setParam("configBase", r0_55.P2IconKey, LUA_PARAM_POS, 1030, 430, 0, 0)
      r3_55:initSubLayer("configBase", r1_55, 81, 1)
      r3_55:initSubLayer("configBase", r1_55, 83, 1)
      r3_55:initSubLayer("configBase", r1_55, 85, 1)
      r0_55:setCfg2WindowAlpa()
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) == false then
        changeMessageWindow(-1, true)
      end
      local r4_55 = 0
      local r5_55 = 0
      local r6_55 = 0
      local r7_55 = 0
      local r8_55 = nil
      local r9_55 = nil
      r8_55, r9_55 = getConfigText()
      r3_55:insertTextLayer("configBase", r8_55, 800, 240, 100, 5, 100, 5, 0, 1)
      r3_55:insertTextLayer("configBase", r9_55, 550, 40, 100, 5, 100, 5, 0, 1)
      r3_55:setParam("configBase", r8_55, LUA_PARAM_POS, 120, 380, 0, 0)
      r3_55:setParam("configBase", r9_55, LUA_PARAM_POS, 120, 336, 0, 0)
      if getLangPatchFlag() and getAltLanguage() then
        r3_55:setParam("configBase", r8_55, LUA_PARAM_POS, 120, 370, 0, 0)
        r3_55:setParam("configBase", r9_55, LUA_PARAM_POS, 120, 332, 0, 0)
      end
      r0_55:MakeClkWait(r1_55)
      r0_55.ButtonP2 = {}
      r0_55:MenuButtonSet(r0_55.ButtonP2, "SkipRead", 1, r1_55, 38, 38, 46, 54, -1, 201, 0, 0)
      r0_55:MenuButtonSet(r0_55.ButtonP2, "SkipAll", 1, r1_55, 39, 39, 47, 55, -1, 202, 0, 0)
      r0_55.MenuButton:InitList()
      r0_55.MenuButton:SetList("ButtonP2", r0_55.ButtonP2)
      r0_55.MenuButton:InitButton()
      r0_55.P2SlideBar = {}
      r0_55.GaugeBarP2 = {}
      r0_55.GaugeBarP2.SL_MsgSpeed = r0_55:GaugeBarCreate("configBase", r1_55, 26, 16, 100, 1)
      r0_55.GaugeBarP2.SL_OpaWin = r0_55:GaugeBarCreate("configBase", r1_55, 27, 17, 100, 2)
      r0_55.GaugeBarP2.SL_AutoSpeed = r0_55:GaugeBarCreate("configBase", r1_55, 28, 18, 100, 3)
      for r13_55, r14_55 in pairs(r0_55.GaugeBarP2) do
        r14_55:GaugeInit()
      end
      r0_55.GaugeBarP2.SL_MsgSpeed:GaugeSetParam(g_msgspeed)
      r0_55.GaugeBarP2.SL_OpaWin:GaugeSetParam(g_messagealpha)
      r0_55.GaugeBarP2.SL_AutoSpeed:GaugeSetParam(g_autospeed)
      r0_55.ItemP2 = r0_55:ItemSetInit()
      r0_55.ItemP2.MsgSpeed = MenuItem.new("configBase", r1_55, 64, 72)
      r0_55.ItemP2.OpaWindow = MenuItem.new("configBase", r1_55, 65, 73)
      r0_55.ItemP2.SkipMsg = MenuItem.new("configBase", r1_55, 66, 74)
      r0_55.ItemP2.AutoPlay = MenuItem.new("configBase", r1_55, 68, 76)
      r0_55.ItemP2.MsgSpeedBar = MenuItem.new("configBase", r1_55, 22, 19)
      r0_55.ItemP2.OpaWindowBar = MenuItem.new("configBase", r1_55, 23, 20)
      r0_55.ItemP2.AutoPlayBar = MenuItem.new("configBase", r1_55, 24, 21)
      r0_55.ItemP2.Headline_MsgSpeed = "MsgSpeed"
      r0_55.ItemP2.Headline_OpaWindow = "OpaWindow"
      r0_55.ItemP2.Headline_SkipMsg = "SkipMsg"
      r0_55.ItemP2.Headline_SkipOption = -1
      r0_55.ItemP2.Headline_AutoPlay = "AutoPlay"
      r0_55.ItemP2.Headline_AutoOption = -1
      r0_55.ItemP2.Headline_ReadColor = -1
      r0_55.ItemP2.Headline_MsgSpeedBar = "MsgSpeedBar"
      r0_55.ItemP2.Headline_OpaWindowBar = "OpaWindowBar"
      r0_55.ItemP2.Headline_AutoPlayBar = "AutoPlayBar"
      r0_55.ItemP2.expMsgSpeed = MenuItem.new("configBase", r1_55, -1, 7)
      r0_55.ItemP2.expOpaWindow = MenuItem.new("configBase", r1_55, -1, 6)
      r0_55.ItemP2.expSkipMsg = -1
      r0_55.ItemP2.expSkipMsgRead = MenuItem.new("configBase", r1_55, -1, 5)
      r0_55.ItemP2.expSkipMsgAll = MenuItem.new("configBase", r1_55, -1, 4)
      r0_55.ItemP2.expSkipOption = -1
      r0_55.ItemP2.expAutoPlay = MenuItem.new("configBase", r1_55, -1, 2)
      r0_55.ItemP2.expAutoOption = -1
      r0_55.autoModeTimer = AutoModeTimer.new()
      r0_55.autoModeTimer:reset()
      r0_55:Page2_SetActive()
    else
      r0_55:Page2_SetActive()
    end
  end
  g_Menu.Config.ptr.deleteP2key = function(r0_56)
    -- line: [2930, 2941] id: 56
    local r1_56 = cclass.lua_Layers:create()
    local r2_56 = nil
    local r3_56 = nil
    r2_56, r3_56 = getConfigText()
    r1_56:removeLayer("configBase", r2_56)
    r1_56:removeLayer("configBase", r3_56)
    if r0_56.P2IconKey ~= -1 then
      r1_56:removeLayer("configBase", r0_56.P2IconKey)
    end
  end
  g_Menu.Config.ptr.SetSlideActP2 = function(r0_57, r1_57)
    -- line: [2944, 2962] id: 57
    -- notice: unreachable block#5
    -- notice: unreachable block#2
    -- notice: unreachable block#4
    -- notice: unreachable block#6
    -- notice: unreachable block#3
    -- notice: unreachable block#1
  end
  g_Menu.Config.ptr.SelCursorP2 = function(r0_58, r1_58, r2_58, r3_58, r4_58, r5_58, r6_58)
    -- line: [2966, 3085] id: 58
    -- notice: unreachable block#44
    -- notice: unreachable block#4
    -- notice: unreachable block#42
    -- notice: unreachable block#41
    -- notice: unreachable block#45
    -- notice: unreachable block#46
    -- notice: unreachable block#47
    -- notice: unreachable block#48
    -- notice: unreachable block#3
    -- notice: unreachable block#43
    -- notice: unreachable block#49
    -- notice: unreachable block#2
    if r0_58.SliderMoveNo == 299 then
      r0_58:P2_GaugeJob(r2_58, r3_58, r4_58, r5_58, r6_58)
    end
    r0_58:SetSlideActP2(r1_58)
    if r1_58 == -1 or r0_58.ItemP2.selCursor_selName ~= r1_58 then
      r0_58:ItemSet(r0_58.ItemP2, -1, -1, -1, -1)
    end
    if r1_58 == "SkipRead" then
      if r0_58.ItemP2.expSkipMsg ~= -1 then
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_SkipMsg, -1, "expSkipMsg")
      else
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_SkipMsg, -1, "expSkipMsgRead")
        r0_58.ItemP2.expSkipMsgRead:SetAct("on")
        r0_58.ItemP2.selCursor_Conf = r0_58.ItemP2.expSkipMsgRead
      end
    end
    if r1_58 == "SkipAll" then
      if r0_58.ItemP2.expSkipMsg ~= -1 then
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_SkipMsg, -1, "expSkipMsg")
      else
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_SkipMsg, -1, "expSkipMsgAll")
        r0_58.ItemP2.expSkipMsgAll:SetAct("on")
        r0_58.ItemP2.selCursor_Conf = r0_58.ItemP2.expSkipMsgAll
      end
    end
    if "SkipOptOn" == r1_58 or "SkipOptOff" == r1_58 then
      if r0_58.ItemP2.expSkipOption == nil or r0_58.ItemP2.expSkipOption == -1 then
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_SkipMsg, r0_58.ItemP2.Headline_SkipOption, "expSkipMsg")
      else
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_SkipMsg, r0_58.ItemP2.Headline_SkipOption, "expSkipOption")
      end
    end
    if r1_58 == "AutoOptOn" then
      if r0_58.ItemP2.expAutoOption == nil or r0_58.ItemP2.expAutoOption == -1 then
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_AutoPlay, r0_58.ItemP2.Headline_AutoOption, "expAutoPlay")
      else
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_AutoPlay, r0_58.ItemP2.Headline_AutoOption, "expAutoOption")
      end
    end
    if r1_58 == "AutoOptOff" then
      if r0_58.ItemP2.expAutoOption == nil or r0_58.ItemP2.expAutoOption == -1 then
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_AutoPlay, r0_58.ItemP2.Headline_AutoOption, "expAutoPlay")
      else
        r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_AutoPlay, r0_58.ItemP2.Headline_AutoOption, "expAutoOption")
      end
    end
    for r10_58, r11_58 in pairs(r0_58.GaugeBarP2) do
      r11_58:GaugeOnCursor(r2_58, r3_58, r4_58, r5_58, r6_58)
    end
    if r0_58.GaugeBarP2.SL_MsgSpeed.OnMouse then
      r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_MsgSpeed, r0_58.ItemP2.Headline_MsgSpeedBar, "expMsgSpeed")
    end
    if r0_58.GaugeBarP2.SL_OpaWin.OnMouse then
      r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_OpaWindow, r0_58.ItemP2.Headline_OpaWindowBar, "expOpaWindow")
    end
    if r0_58.GaugeBarP2.SL_AutoSpeed.OnMouse then
      r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_AutoPlay, r0_58.ItemP2.Headline_AutoPlayBar, "expAutoPlay")
    end
    if r1_58 == "ReadColorOn" then
      r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_ReadColor, -1, "expReadColor")
    end
    if r1_58 == "ReadColorOff" then
      r0_58:ItemSet(r0_58.ItemP2, r1_58, r0_58.ItemP2.Headline_ReadColor, -1, "expReadColor")
    end
  end
  g_Menu.Config.ptr.setCfg2WindowAlpa = function(r0_59)
    -- line: [3088, 3111] id: 59
    cclass.lua_Layers:create():setSubLayerParam("configBase", ConfigGetPageKeyName(2), 83, LUA_PARAM_COLOR, 1, 1, 1, g_messagealpha / 100)
  end
  g_Menu.Config.ptr.effectCfg2Text = function(r0_60, r1_60, r2_60, r3_60, r4_60, r5_60)
    -- line: [3116, 3173] id: 60
    local r6_60 = cclass.lua_Layers:create()
    local r7_60 = getEffectRate()
    local r8_60 = nil
    local r9_60 = nil
    r8_60, r9_60 = getConfigText()
    if r1_60 ~= true then
      if r0_60.PageSlide then
        if r4_60 == false then
          local r10_60 = 0
          local r11_60 = 0
          local r12_60 = 0
          local r13_60 = 0
          r10_60, r11_60, r12_60, r13_60 = r6_60:getParam("configBase", r8_60, LUA_PARAM_POS, r10_60, r11_60, r12_60, r13_60)
          r6_60:setParam("configBase", r8_60, LUA_PARAM_POS, r10_60 - r2_60, r11_60, r12_60, r13_60)
          r6_60:setParam("configBase", r8_60, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_60:setEffect("configBase", r8_60, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_60, 0, r5_60)
          r10_60, r11_60, r12_60, r13_60 = r6_60:getParam("configBase", r9_60, LUA_PARAM_POS, r10_60, r11_60, r12_60, r13_60)
          r6_60:setParam("configBase", r9_60, LUA_PARAM_POS, r10_60 - r2_60, r11_60, r12_60, r13_60)
          r6_60:setParam("configBase", r9_60, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_60:setEffect("configBase", r9_60, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_60, 0, r5_60)
        else
          r6_60:setEffect("configBase", r8_60, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_60, 0, r5_60)
          r6_60:setEffect("configBase", r9_60, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_60, 0, r5_60)
        end
        r6_60:setEffect("configBase", r8_60, "ConfigPage", LUA_EFFECT_POS, r2_60, 0, 0, 0, 2, r3_60, 0, r5_60)
        r6_60:setEffect("configBase", r9_60, "ConfigPage", LUA_EFFECT_POS, r2_60, 0, 0, 0, 2, r3_60, 0, r5_60)
      elseif r4_60 ~= false then
        r6_60:setEffect("configBase", r8_60, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_60, 0, r5_60)
        r6_60:setEffect("configBase", r9_60, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_60, 0, r5_60)
      end
      r6_60:startEffect("configBase", r8_60, "ConfigPage", 0)
      r6_60:startEffect("configBase", r9_60, "ConfigPage", 0)
      if r0_60.P2IconKey ~= -1 then
        if r4_60 == false then
          r6_60:setParam("configBase", r0_60.P2IconKey, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_60:setEffect("configBase", r0_60.P2IconKey, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_60, 0, r5_60)
        else
          r6_60:setParam("configBase", r0_60.P2IconKey, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r6_60:setEffect("configBase", r0_60.P2IconKey, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_60, 0, r5_60)
        end
        r6_60:startEffect("configBase", r0_60.P2IconKey, "ConfigPage", 0)
      end
    end
  end
  g_Menu.Config.ptr.selChar = 1
  g_Menu.Config.ptr.Page3_SetActive = function(r0_61, r1_61)
    -- line: [3180, 3270] id: 61
    -- notice: unreachable block#23
    -- notice: unreachable block#21
    -- notice: unreachable block#22
    local r2_61 = cclass.lua_Layers:create()
    if g_clickVoice == true then
      r0_61.ButtonP3.VoiceSkipOn:bt_SetActive(4)
      r0_61.ButtonP3.VoiceSkipOff:bt_SetActive(0)
    else
      r0_61.ButtonP3.VoiceSkipOn:bt_SetActive(0)
      r0_61.ButtonP3.VoiceSkipOff:bt_SetActive(4)
    end
    if g_enablePan == true then
      r0_61.ButtonP3.VoiceRLOn:bt_SetActive(4)
      r0_61.ButtonP3.VoiceRLOff:bt_SetActive(0)
    else
      r0_61.ButtonP3.VoiceRLOn:bt_SetActive(0)
      r0_61.ButtonP3.VoiceRLOff:bt_SetActive(4)
    end
    if r0_61.ButtonP3.BgvStopOn ~= nil then
      if g_bgvVoiceMute == true then
        r0_61.ButtonP3.BgvStopOn:bt_SetActive(4)
        r0_61.ButtonP3.BgvStopOff:bt_SetActive(0)
      else
        r0_61.ButtonP3.BgvStopOn:bt_SetActive(0)
        r0_61.ButtonP3.BgvStopOff:bt_SetActive(4)
      end
    end
    if r0_61.ButtonP3.SysVoiceRa ~= nil then
      if g_sysVoiceChar == 999 then
        r0_61.ButtonP3.SysVoiceRa:bt_SetActive(4)
      else
        r0_61.ButtonP3.SysVoiceRa:bt_SetActive(0)
      end
    end
    if r0_61.ButtonP3.SysVoiceEx ~= nil then
      if r0_61.selChar <= r0_61.selCharMax - 2 then
        if r0_61.selChar == g_sysVoiceChar then
          r0_61.ButtonP3.SysVoiceEx:bt_SetActive(4)
        else
          r0_61.ButtonP3.SysVoiceEx:bt_SetActive(0)
        end
      else
        r0_61.ButtonP3.SysVoiceEx:bt_SetActive(3)
      end
    end
    r0_61:SetCharBaseActP3(r1_61)
    r0_61.GaugeBarP3.SL_MasterVol:GaugeSetParam(g_mixer:getMasterVolume())
    r0_61.GaugeBarP3.SL_SysSeVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("systemse")].vol / 10))
    r0_61.GaugeBarP3.SL_BgmVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("bgm")].vol / 10))
    r0_61.GaugeBarP3.SL_SeVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("se")].vol / 10))
    r0_61.GaugeBarP3.SL_MovieVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("movie")].vol / 10))
    r0_61.GaugeBarP3.SL_VoiceVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("char")].vol / 10))
    r0_61.GaugeBarP3.SL_VoiceBgmVol:GaugeSetParam(g_bgmCutPer)
    r0_61.GaugeBarP3.SL_CharVol:GaugeSetParam(math.floor(g_volume[(getSoundIndex("char") + r0_61.selChar)].vol / 10))
    r0_61:SetSlideActP3(r0_61.MenuButton.selCursor)
  end
  g_Menu.Config.ptr.P3_GaugeJob = function(r0_62, r1_62, r2_62, r3_62, r4_62, r5_62)
    -- line: [3272, 3403] id: 62
    for r9_62, r10_62 in pairs(r0_62.GaugeBarP3) do
      local r11_62 = r10_62:GaugeMove(r1_62, r2_62, r3_62, r4_62, r5_62)
      local r12_62 = {
        "SL_MasterVol",
        "SL_SysSeVol",
        "SL_BgmVol",
        "SL_SeVol",
        "SL_MovieVol",
        "SL_VoiceVol",
        "SL_VoiceBgmVol",
        "SL_CharVol"
      }
      if r11_62 == 1 then
        local r13_62 = r0_62.GaugeBarP3[r12_62[r11_62]].param
        if g_mixer:getMasterMute() == true then
          g_mixer:setMasterMute(false)
        end
        g_mixer:setMasterVolume(r13_62)
      end
      if r11_62 == 2 then
        g_volume[getSoundIndex("systemse")].vol = r0_62.GaugeBarP3[r12_62[r11_62]].param * 10
        cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
      end
      if r11_62 == 3 then
        g_volume[getSoundIndex("bgm")].vol = r0_62.GaugeBarP3[r12_62[r11_62]].param * 10
        cfunc.LegacyGame__lua_NeedVolumeUpdate("bgm")
      end
      if r11_62 == 4 then
        g_volume[getSoundIndex("se")].vol = r0_62.GaugeBarP3[r12_62[r11_62]].param * 10
        cfunc.LegacyGame__lua_NeedVolumeUpdate("se")
        r0_62:SetTestSeVol(g_volume[getSoundIndex("se")].vol)
      end
      if r11_62 == 5 then
        g_volume[getSoundIndex("movie")].vol = r0_62.GaugeBarP3[r12_62[r11_62]].param * 10
        cfunc.LegacyGame__lua_NeedVolumeUpdate("movie")
      end
      if r11_62 == 6 then
        local r13_62 = r0_62.GaugeBarP3[r12_62[r11_62]].param
        g_volume[getSoundIndex("char")].vol = r13_62 * 10
        for r17_62 = getSoundIndex("char") + 1, #g_volume, 1 do
          g_volume[r17_62].vol = r13_62 * 10
        end
        cfunc.LegacyGame__lua_NeedVolumeUpdate("char")
        for r17_62, r18_62 in pairs(g_BgvKeyToVolkey) do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(r17_62)
        end
        r0_62:SetTestVoiceVol(g_volume[getSoundIndex("char")].vol)
      end
      if r11_62 == 7 then
        g_bgmCutPer = r0_62.GaugeBarP3[r12_62[r11_62]].param
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
      end
      if r11_62 == 8 then
        g_volume[r0_62:getPersonalIndex()].vol = r0_62.GaugeBarP3[r12_62[r11_62]].param * 10
        r0_62:SetTestVoiceVol(g_volume[r0_62:getPersonalIndex()].vol)
        local r14_62 = nil
        local r15_62 = nil
        local r16_62 = 0
        r14_62, r15_62 = string.find(g_volume[r0_62:getPersonalIndex()].name, "charOtherM")
        if r14_62 ~= nil then
          r16_62 = 1
        end
        r14_62, r15_62 = string.find(g_volume[r0_62:getPersonalIndex()].name, "charOtherF")
        if r14_62 ~= nil then
          r16_62 = 2
        end
        r14_62, r15_62 = string.find(g_volume[r0_62:getPersonalIndex()].name, "charMAN")
        if r14_62 ~= nil then
          r16_62 = 3
        end
        r14_62, r15_62 = string.find(g_volume[r0_62:getPersonalIndex()].name, "charWOMAN")
        if r14_62 ~= nil then
          r16_62 = 4
        end
        if r16_62 == 0 then
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_volume[r0_62:getPersonalIndex()].name)
        elseif r16_62 == 1 then
          for r20_62 = 1, #g_charKeysOtherM, 1 do
            cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r20_62])
          end
        elseif r16_62 == 2 then
          for r20_62 = 1, #g_charKeysOtherF, 1 do
            cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r20_62])
          end
        elseif r16_62 == 3 then
          for r20_62 = 1, #g_volumeID_MAN, 1 do
            g_volume[getSoundIndex("char") + g_volumeID_MAN[r20_62]].vol = g_volume[r0_62:getPersonalIndex()].vol
          end
          for r20_62 = 1, #g_charKeysOtherMAN, 1 do
            cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherMAN[r20_62])
          end
          for r20_62 = 1, #g_charKeysOtherM, 1 do
            cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r20_62])
          end
        elseif r16_62 == 4 then
          for r20_62 = 1, #g_volumeID_WOMAN, 1 do
            g_volume[getSoundIndex("char") + g_volumeID_WOMAN[r20_62]].vol = g_volume[r0_62:getPersonalIndex()].vol
          end
          for r20_62 = 1, #g_charKeysOtherWOMAN, 1 do
            cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherWOMAN[r20_62])
          end
          for r20_62 = 1, #g_charKeysOtherF, 1 do
            cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r20_62])
          end
        end
        for r20_62, r21_62 in pairs(g_BgvKeyToVolkey) do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(r20_62)
        end
      end
    end
  end
  g_Menu.Config.ptr.P3_ButtonRepeatLD = function(r0_63, r1_63, r2_63, r3_63, r4_63, r5_63, r6_63, r7_63)
    -- line: [3406, 3409] id: 63
    r0_63:P3_GaugeJob(r3_63, r4_63, r5_63, r6_63, r7_63)
  end
  g_Menu.Config.ptr.P3_ButtonJobLD = function(r0_64, r1_64, r2_64, r3_64, r4_64)
    -- line: [3412, 3455] id: 64
    -- notice: unreachable block#18
    -- notice: unreachable block#5
    -- notice: unreachable block#6
    -- notice: unreachable block#11
    -- notice: unreachable block#10
    -- notice: unreachable block#8
    -- notice: unreachable block#3
    -- notice: unreachable block#13
    -- notice: unreachable block#14
    -- notice: unreachable block#7
    -- notice: unreachable block#4
    -- notice: unreachable block#9
    -- notice: unreachable block#12
    -- notice: unreachable block#15
    -- notice: unreachable block#17
    -- notice: unreachable block#16
    -- notice: unreachable block#2
    -- notice: unreachable block#19
    -- notice: unreachable block#20
    -- notice: unreachable block#21
    if g_configPage == 3 then
      r0_64.SliderMoveNo = 399
    end
  end
  g_Menu.Config.ptr.P3_ButtonJobLU = function(r0_65, r1_65, r2_65, r3_65, r4_65)
    -- line: [3458, 3841] id: 65
    -- notice: unreachable block#51
    -- notice: unreachable block#26
    -- notice: unreachable block#61
    -- notice: unreachable block#67
    -- notice: unreachable block#70
    -- notice: unreachable block#37
    -- notice: unreachable block#45
    -- notice: unreachable block#32
    -- notice: unreachable block#71
    -- notice: unreachable block#43
    -- notice: unreachable block#24
    -- notice: unreachable block#5
    -- notice: unreachable block#25
    -- notice: unreachable block#4
    -- notice: unreachable block#40
    -- notice: unreachable block#13
    -- notice: unreachable block#52
    -- notice: unreachable block#21
    -- notice: unreachable block#36
    -- notice: unreachable block#9
    -- notice: unreachable block#31
    -- notice: unreachable block#3
    -- notice: unreachable block#17
    -- notice: unreachable block#62
    -- notice: unreachable block#58
    -- notice: unreachable block#10
    -- notice: unreachable block#47
    -- notice: unreachable block#57
    -- notice: unreachable block#1
    -- notice: unreachable block#18
    -- notice: unreachable block#27
    -- notice: unreachable block#28
    -- notice: unreachable block#8
    -- notice: unreachable block#38
    -- notice: unreachable block#53
    -- notice: unreachable block#19
    -- notice: unreachable block#39
    -- notice: unreachable block#2
    -- notice: unreachable block#14
    -- notice: unreachable block#55
    -- notice: unreachable block#66
    -- notice: unreachable block#11
    -- notice: unreachable block#22
    -- notice: unreachable block#33
    -- notice: unreachable block#46
    -- notice: unreachable block#42
    -- notice: unreachable block#7
    -- notice: unreachable block#50
    -- notice: unreachable block#63
    -- notice: unreachable block#30
    -- notice: unreachable block#48
    -- notice: unreachable block#56
    -- notice: unreachable block#64
    -- notice: unreachable block#6
    -- notice: unreachable block#41
    -- notice: unreachable block#15
    -- notice: unreachable block#29
    -- notice: unreachable block#68
    -- notice: unreachable block#72
    -- notice: unreachable block#16
    -- notice: unreachable block#12
    -- notice: unreachable block#73
    -- notice: unreachable block#35
    -- notice: unreachable block#34
    -- notice: unreachable block#65
    -- notice: unreachable block#59
    -- notice: unreachable block#20
    -- notice: unreachable block#54
    -- notice: unreachable block#69
    -- notice: unreachable block#23
    r0_65:P3_GaugeJob(-1, -1, -1, r3_65, r4_65)
    if r1_65 == 301 then
      g_clickVoice = true
    end
    if r1_65 == 302 then
      g_clickVoice = false
    end
    if r1_65 == 303 then
      g_enablePan = true
    end
    if r1_65 == 304 then
      g_enablePan = false
    end
    if r1_65 == 305 then
      g_bgvVoiceMute = true
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGV, 0)
    end
    if r1_65 == 306 then
      g_bgvVoiceMute = false
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGV, 0)
    end
    if 330 <= r1_65 and r1_65 <= 349 then
      r0_65.selChar = r1_65 - 330 + 1
      r0_65:StopTestVoice()
    end
    if r1_65 == 309 then
      local r5_65 = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_MasterVol, r0_65.ButtonP3.SL_MasterVolBk, r3_65)
      if g_mixer:getMasterMute() == true then
        g_mixer:setMasterMute(false)
      end
      g_mixer:setMasterVolume(r5_65)
    end
    if r1_65 == 311 then
      g_volume[getSoundIndex("bgm")].vol = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_BgmVol, r0_65.ButtonP3.SL_BgmVolBk, r3_65) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgm")
    end
    if r1_65 == 313 then
      g_volume[getSoundIndex("se")].vol = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_SeVol, r0_65.ButtonP3.SL_SeVolBk, r3_65) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("se")
      r0_65:SetTestSeVol(g_volume[getSoundIndex("se")].vol)
    end
    if r1_65 == 315 then
      g_volume[getSoundIndex("movie")].vol = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_MovieVol, r0_65.ButtonP3.SL_MovieVolBk, r3_65) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("movie")
    end
    if r1_65 == 317 then
      local r5_65 = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_VoiceVol, r0_65.ButtonP3.SL_VoiceVolBk, r3_65)
      g_volume[getSoundIndex("char")].vol = r5_65 * 10
      for r9_65 = getSoundIndex("char") + 1, #g_volume, 1 do
        g_volume[r9_65].vol = r5_65 * 10
      end
      cfunc.LegacyGame__lua_NeedVolumeUpdate("char")
      for r9_65, r10_65 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_65)
      end
      r0_65:SetTestVoiceVol(g_volume[getSoundIndex("char")].vol)
    end
    if r1_65 == 323 then
      g_volume[getSoundIndex("bgv")].vol = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_BgvVol, r0_65.ButtonP3.SL_BgvVolBk, r3_65) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgv")
      for r9_65, r10_65 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_65)
      end
    end
    if r1_65 == 319 then
      g_bgmCutPer = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_VoiceBgmVol, r0_65.ButtonP3.SL_VoiceBgmVolBk, r3_65)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
    end
    if r1_65 == 321 then
      g_volume[r0_65:getPersonalIndex()].vol = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_CharVol, r0_65.ButtonP3.SL_CharVolBk, r3_65) * 10
      local r6_65 = nil
      local r7_65 = nil
      local r8_65 = 0
      r6_65, r7_65 = string.find(g_volume[r0_65:getPersonalIndex()].name, "charOtherM")
      if r6_65 ~= nil then
        r8_65 = 1
      end
      r6_65, r7_65 = string.find(g_volume[r0_65:getPersonalIndex()].name, "charOtherF")
      if r6_65 ~= nil then
        r8_65 = 2
      end
      if r8_65 == 0 then
        cfunc.LegacyGame__lua_NeedVolumeUpdate(g_volume[r0_65:getPersonalIndex()].name)
      elseif r8_65 == 1 then
        for r12_65 = 1, #g_charKeysOtherM, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r12_65])
        end
      else
        for r12_65 = 1, #g_charKeysOtherF, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r12_65])
        end
      end
      for r12_65, r13_65 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r12_65)
      end
      r0_65:SetTestVoiceVol(g_volume[r0_65:getPersonalIndex()].vol)
    end
    if r1_65 == 324 then
      local r5_65 = r0_65.ButtonP3.SL_SysSeVol:bt_GetParamX()
      r0_65.ButtonP3.SL_SysSeVol:bt_SetParamX(r5_65)
      g_volume[getSoundIndex("systemse")].vol = r5_65 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
    end
    if r1_65 == 325 then
      g_volume[getSoundIndex("systemse")].vol = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_SysSeVol, r0_65.ButtonP3.SL_SysSeVolBk, r3_65) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
    end
    if r1_65 == 326 then
      local r5_65 = r0_65.ButtonP3.SL_SysVoiceVol:bt_GetParamX()
      r0_65.ButtonP3.SL_SysVoiceVol:bt_SetParamX(r5_65)
      g_volume[getSoundIndex("systemVoice")].vol = r5_65 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
    end
    if r1_65 == 327 then
      g_volume[getSoundIndex("systemVoice")].vol = r0_65:MoveSliderBack(r0_65.ButtonP3.SL_SysVoiceVol, r0_65.ButtonP3.SL_SysVoiceVolBk, r3_65) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
    end
    if r1_65 == 350 then
      r0_65:PlayTestSe(getSoundVolume("se"))
    end
    if r1_65 == 351 then
      r0_65:PlayTestVoice(g_sysVoiceChar, getSoundVolume("char"))
    end
    if r1_65 == 352 then
      r0_65:PlayTestVoice(r0_65.selChar, g_volume[r0_65:getPersonalIndex()].vol)
    end
    if r1_65 == 353 then
      r0_65:PlayTestSe(getSoundVolume("systemse"))
    end
    if r1_65 == 354 then
      r0_65:PlayTestVoice(g_sysVoiceChar, getSoundVolume("systemVoice"))
    end
    if r1_65 == 360 then
      g_sysVoiceChar = r0_65.selChar
    end
    if r1_65 == 361 then
      g_sysVoiceChar = 999
    end
    if 301 <= r1_65 and r1_65 <= 400 or 301 <= r0_65.SliderMoveNo and r0_65.SliderMoveNo <= 400 then
      r0_65:Page3_SetActive(ConfigGetPageKeyName(3))
      r0_65.SliderMoveNo = -1
      r0_65:DeleteConfigNo()
    end
  end
  g_Menu.Config.ptr.P3_Voice = {}
  g_Menu.Config.ptr.PlayTestVoice = function(r0_66, r1_66, r2_66)
    -- line: [3847, 3903] id: 66
    local r3_66 = nil
    local r4_66 = -1
    r4_66 = {}
    if r1_66 == 999 then
      r1_66 = math.random(1, #g_charKeys)
    end
    r3_66 = r4_66[r1_66][math.random(1, 2)]
    if r3_66 ~= nil then
      r0_66:SetTestVoiceVol(r2_66)
      local r6_66 = cclass.lua_Sounds:new()
      r6_66:SndStop("ConfTestVoice")
      r6_66:SndPlay("ConfTestVoice", getSoundArcFileName("systemVoice", r3_66), r3_66, r2_66)
      r0_66.TestVoiceRestVol = g_volume[getSoundIndex("bgm")].vol
      r0_66.TestVoicePlayFlag = true
      r6_66:delete()
    end
  end
  g_Menu.Config.ptr.StopTestVoice = function(r0_67)
    -- line: [3906, 3912] id: 67
    local r1_67 = cclass.lua_Sounds:new()
    r1_67:SndStop("ConfTestVoice")
    r0_67.TestVoicePlayFlag = false
    r1_67:delete()
  end
  g_Menu.Config.ptr.SetTestVoiceVol = function(r0_68, r1_68)
    -- line: [3915, 3918] id: 68
    g_ConfigVoiceVolume = r1_68
    cfunc.LegacyGame__lua_NeedVolumeUpdate("ConfTestVoice")
  end
  g_Menu.Config.ptr.CheckTestVoicePlaying = function(r0_69)
    -- line: [3921, 3933] id: 69
    local r1_69 = cclass.lua_Sounds:new()
    if not r1_69:IsPlaying("ConfTestVoice", "ConfTestVoice") and r0_69.TestVoicePlayFlag then
      r0_69:RestBGMVolume()
    end
    r1_69:delete()
  end
  g_Menu.Config.ptr.RestBGMVolume = function(r0_70)
    -- line: [3936, 3942] id: 70
    if r0_70.TestVoicePlayFlag then
      r0_70.TestVoicePlayFlag = false
    end
  end
  g_Menu.Config.ptr.PlayTestSe = function(r0_71, r1_71)
    -- line: [3946, 3953] id: 71
    local r2_71 = "SE_04a_011.ogg"
    r0_71:SetTestSeVol(r1_71)
    local r3_71 = cclass.lua_Sounds:new()
    r3_71:SndStop("ConfTestSE")
    r3_71:SndPlay("ConfTestSE", getSoundArcFileName("se", r2_71), r2_71, r1_71)
    r3_71:delete()
  end
  g_Menu.Config.ptr.StopTestSe = function(r0_72)
    -- line: [3955, 3959] id: 72
    local r1_72 = cclass.lua_Sounds:new()
    r1_72:SndStop("ConfTestSE")
    r1_72:delete()
  end
  g_Menu.Config.ptr.SetTestSeVol = function(r0_73, r1_73)
    -- line: [3962, 3965] id: 73
    g_ConfigSeVolume = r1_73
    cfunc.LegacyGame__lua_NeedVolumeUpdate("ConfTestSE")
  end
  g_Menu.Config.ptr.PlayTestSystemVoice = function(r0_74, r1_74)
    -- line: [3969, 3975] id: 74
  end
  g_Menu.Config.ptr.StopTestSystemVoice = function(r0_75)
    -- line: [3978, 3982] id: 75
  end
  g_Menu.Config.ptr.getPersonalIndex = function(r0_76)
    -- line: [3987, 3989] id: 76
    return getSoundIndex("char") + r0_76.selChar
  end
  g_Menu.Config.ptr.SetCharBaseActP3 = function(r0_77, r1_77)
    -- line: [3992, 4021] id: 77
    local r2_77 = cclass.lua_Layers:create()
    for r6_77 = 0, r0_77.selCharMax - 1, 1 do
      local r7_77 = 182 - r6_77
      local r8_77 = string.format("VoiceChar%03d", r6_77 + 1)
      if r0_77.selChar == r6_77 + 1 then
        r0_77.ButtonP3[r8_77]:bt_SetActive(4)
        r2_77:setSubLayerVisible("configBase", r1_77, r7_77, 1)
        if r0_77.selCharMax - 2 <= r6_77 then
        end
      else
        r0_77.ButtonP3[r8_77]:bt_SetActive(0)
        r2_77:setSubLayerVisible("configBase", r1_77, r7_77, 0)
      end
    end
  end
  g_Menu.Config.ptr.sampleVoiceNo = 1
  g_Menu.Config.ptr.selCharMax = 17
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
    1
  }
  g_Menu.Config.ptr.P3SlideBar = {}
  g_Menu.Config.ptr.initConfigP3 = function(r0_78, r1_78, r2_78)
    -- line: [4028, 4353] id: 78
    -- notice: unreachable block#18
    -- notice: unreachable block#17
    -- notice: unreachable block#14
    -- notice: unreachable block#15
    -- notice: unreachable block#13
    -- notice: unreachable block#5
    -- notice: unreachable block#16
    if r2_78 == true then
      local r3_78 = cclass.lua_Layers:create()
      r3_78:initSubLayer("configBase", r1_78, 184, 1)
      r0_78.ButtonP3 = {}
      r0_78:MenuButtonSet(r0_78.ButtonP3, "VoiceSkipOn", 1, r1_78, 58, 58, 67, 76, -1, 301, 0, 0)
      r0_78:MenuButtonSet(r0_78.ButtonP3, "VoiceSkipOff", 1, r1_78, 59, 59, 68, 77, -1, 302, 0, 0)
      r0_78:MenuButtonSet(r0_78.ButtonP3, "VoiceRLOn", 1, r1_78, 60, 60, 69, 78, -1, 303, 0, 0)
      r0_78:MenuButtonSet(r0_78.ButtonP3, "VoiceRLOff", 1, r1_78, 61, 61, 70, 79, -1, 304, 0, 0)
      r0_78:MenuButtonSet(r0_78.ButtonP3, "SysVoiceEx", 1, r1_78, 62, 62, 71, 80, -1, 360, 0, 0)
      r0_78:MenuButtonSet(r0_78.ButtonP3, "SysVoiceRa", 1, r1_78, 63, 63, 72, 81, -1, 361, 0, 0)
      for r7_78 = 0, r0_78.selCharMax - 1, 1 do
        r3_78:initSubLayer("configBase", r1_78, 182 - r7_78, 0)
        local r9_78 = string.format("VoiceChar%03d", r7_78 + 1)
        local r10_78 = 119 + r7_78
        r0_78:MenuButtonSet(r0_78.ButtonP3, r9_78, 1, r1_78, r10_78, r10_78, 102 + r7_78, 85 + r7_78, -1, 330 + r7_78, 0, 0)
      end
      r0_78.MenuButton:InitList()
      r0_78.MenuButton:SetList("ButtonP3", r0_78.ButtonP3)
      r0_78.MenuButton:InitButton()
      local r4_78 = g_mixer:getMasterVolume()
      if g_mixer:getMasterMute() ~= false or not r4_78 then
        r4_78 = 0
      end
      r0_78.GaugeBarP3.SL_MasterVol = r0_78:GaugeBarCreate("configBase", r1_78, 17, 27, 100, 1)
      r0_78.GaugeBarP3.SL_SysSeVol = r0_78:GaugeBarCreate("configBase", r1_78, 18, 28, 100, 2)
      r0_78.GaugeBarP3.SL_BgmVol = r0_78:GaugeBarCreate("configBase", r1_78, 19, 29, 100, 3)
      r0_78.GaugeBarP3.SL_SeVol = r0_78:GaugeBarCreate("configBase", r1_78, 20, 30, 100, 4)
      r0_78.GaugeBarP3.SL_MovieVol = r0_78:GaugeBarCreate("configBase", r1_78, 21, 31, 100, 5)
      r0_78.GaugeBarP3.SL_VoiceVol = r0_78:GaugeBarCreate("configBase", r1_78, 22, 32, 100, 6)
      r0_78.GaugeBarP3.SL_VoiceBgmVol = r0_78:GaugeBarCreate("configBase", r1_78, 23, 33, 100, 7)
      r0_78.GaugeBarP3.SL_CharVol = r0_78:GaugeBarCreate("configBase", r1_78, 24, 34, 100, 8)
      for r8_78, r9_78 in pairs(r0_78.GaugeBarP3) do
        r9_78:GaugeInit()
      end
      r0_78.GaugeBarP3.SL_MasterVol:GaugeSetParam(r4_78)
      r0_78.GaugeBarP3.SL_SysSeVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("systemse")].vol / 10))
      r0_78.GaugeBarP3.SL_BgmVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("bgm")].vol / 10))
      r0_78.GaugeBarP3.SL_SeVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("se")].vol / 10))
      r0_78.GaugeBarP3.SL_MovieVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("movie")].vol / 10))
      r0_78.GaugeBarP3.SL_VoiceVol:GaugeSetParam(math.floor(g_volume[getSoundIndex("char")].vol / 10))
      r0_78.GaugeBarP3.SL_VoiceBgmVol:GaugeSetParam(g_bgmCutPer)
      r0_78.GaugeBarP3.SL_CharVol:GaugeSetParam(math.floor(g_volume[(getSoundIndex("char") + r0_78.selChar)].vol / 10))
      r0_78.ItemP3 = r0_78:ItemSetInit()
      r0_78.ItemP3.MasterVol = MenuItem.new("configBase", r1_78, 152, 139)
      r0_78.ItemP3.SysSeVol = MenuItem.new("configBase", r1_78, 153, 140)
      r0_78.ItemP3.BgmVol = MenuItem.new("configBase", r1_78, 154, 141)
      r0_78.ItemP3.SeVol = MenuItem.new("configBase", r1_78, 155, 142)
      r0_78.ItemP3.MovieVol = MenuItem.new("configBase", r1_78, 156, 143)
      r0_78.ItemP3.VoiceVol = MenuItem.new("configBase", r1_78, 157, 144)
      r0_78.ItemP3.VoiceSkip = MenuItem.new("configBase", r1_78, 158, 145)
      r0_78.ItemP3.VoiceRL = MenuItem.new("configBase", r1_78, 159, 146)
      r0_78.ItemP3.VoiceBgmVol = MenuItem.new("configBase", r1_78, 160, 147)
      r0_78.ItemP3.CharVol = MenuItem.new("configBase", r1_78, 161, 148)
      r0_78.ItemP3.CharVoice = MenuItem.new("configBase", r1_78, 162, 149)
      r0_78.ItemP3.barMasterVol = MenuItem.new("configBase", r1_78, 47, 37)
      r0_78.ItemP3.barSysSeVol = MenuItem.new("configBase", r1_78, 48, 38)
      r0_78.ItemP3.barBgmVol = MenuItem.new("configBase", r1_78, 49, 39)
      r0_78.ItemP3.barSeVol = MenuItem.new("configBase", r1_78, 50, 40)
      r0_78.ItemP3.barMovieVol = MenuItem.new("configBase", r1_78, 51, 41)
      r0_78.ItemP3.barVoiceVol = MenuItem.new("configBase", r1_78, 52, 42)
      r0_78.ItemP3.barVoiceBgmVol = MenuItem.new("configBase", r1_78, 53, 43)
      r0_78.ItemP3.barCharVol = MenuItem.new("configBase", r1_78, 54, 44)
      r0_78.ItemP3.expMasterVol = MenuItem.new("configBase", r1_78, -1, 12)
      r0_78.ItemP3.expSysSeVol = MenuItem.new("configBase", r1_78, -1, 11)
      r0_78.ItemP3.expBgmVol = MenuItem.new("configBase", r1_78, -1, 10)
      r0_78.ItemP3.expSeVol = MenuItem.new("configBase", r1_78, -1, 9)
      r0_78.ItemP3.expMovieVol = MenuItem.new("configBase", r1_78, -1, 8)
      r0_78.ItemP3.expVoiceVol = MenuItem.new("configBase", r1_78, -1, 7)
      r0_78.ItemP3.expVoiceSkip = MenuItem.new("configBase", r1_78, -1, 6)
      r0_78.ItemP3.expVoiceRL = MenuItem.new("configBase", r1_78, -1, 5)
      r0_78.ItemP3.expVoiceBgmVol = MenuItem.new("configBase", r1_78, -1, 4)
      r0_78.ItemP3.expCharVol = MenuItem.new("configBase", r1_78, -1, 3)
      r0_78.ItemP3.expSysVoiceEx = MenuItem.new("configBase", r1_78, -1, 2)
      r0_78.ItemP3.expSysVoiceRa = MenuItem.new("configBase", r1_78, -1, 1)
      r0_78.ItemP3.Headline_MasterVol = "MasterVol"
      r0_78.ItemP3.Headline_BgmVol = "BgmVol"
      r0_78.ItemP3.Headline_SeVol = "SeVol"
      r0_78.ItemP3.Headline_SysSeVol = "SysSeVol"
      r0_78.ItemP3.Headline_MovieVol = "MovieVol"
      r0_78.ItemP3.Headline_VoiceVol = "VoiceVol"
      r0_78.ItemP3.Headline_CharVoice = "CharVoice"
      r0_78.ItemP3.Headline_VoiceBgmVol = "VoiceBgmVol"
      r0_78.ItemP3.Headline_VoiceSkip = "VoiceSkip"
      r0_78.ItemP3.Headline_VoiceRL = "VoiceRL"
      r0_78.ItemP3.Headline_CharVol = "CharVol"
      r0_78.ItemP3.Headline_BgvVol = -1
      r0_78.ItemP3.Headline_BgvStop = -1
      r0_78.ItemP3.Headline_barMasterVol = "barMasterVol"
      r0_78.ItemP3.Headline_barBgmVol = "barBgmVol"
      r0_78.ItemP3.Headline_barSeVol = "barSeVol"
      r0_78.ItemP3.Headline_barSysSeVol = "barSysSeVol"
      r0_78.ItemP3.Headline_barMovieVol = "barMovieVol"
      r0_78.ItemP3.Headline_barVoiceVol = "barVoiceVol"
      r0_78.ItemP3.Headline_barVoiceBgmVol = "barVoiceBgmVol"
      r0_78.ItemP3.Headline_barCharVol = "barCharVol"
      r0_78.ItemP3.Headline_barSysVoiceVol = -1
      r0_78.ItemP3.Headline_barBgvVol = -1
      local r7_78 = "Page3_SetActive"
      r7_78 = r1_78
      r0_78:[r7_78](r7_78)
    else
      local r5_78 = "Page3_SetActive"
      r5_78 = r1_78
      r0_78:[r5_78](r5_78)
    end
  end
  g_Menu.Config.ptr.SetSlideActP3 = function(r0_79, r1_79)
    -- line: [4356, 4375] id: 79
    -- notice: unreachable block#1
    -- notice: unreachable block#4
    -- notice: unreachable block#5
    -- notice: unreachable block#2
    -- notice: unreachable block#6
    -- notice: unreachable block#3
  end
  g_Menu.Config.ptr.SelCursorP3 = function(r0_80, r1_80, r2_80, r3_80, r4_80, r5_80, r6_80)
    -- line: [4379, 4611] id: 80
    -- notice: unreachable block#70
    -- notice: unreachable block#15
    -- notice: unreachable block#16
    -- notice: unreachable block#21
    -- notice: unreachable block#72
    -- notice: unreachable block#4
    -- notice: unreachable block#58
    -- notice: unreachable block#90
    -- notice: unreachable block#8
    -- notice: unreachable block#69
    -- notice: unreachable block#91
    -- notice: unreachable block#87
    -- notice: unreachable block#76
    -- notice: unreachable block#19
    -- notice: unreachable block#17
    -- notice: unreachable block#79
    -- notice: unreachable block#3
    -- notice: unreachable block#85
    -- notice: unreachable block#81
    -- notice: unreachable block#57
    -- notice: unreachable block#11
    -- notice: unreachable block#88
    -- notice: unreachable block#13
    -- notice: unreachable block#92
    -- notice: unreachable block#62
    -- notice: unreachable block#73
    -- notice: unreachable block#83
    -- notice: unreachable block#60
    -- notice: unreachable block#7
    -- notice: unreachable block#65
    -- notice: unreachable block#66
    -- notice: unreachable block#80
    -- notice: unreachable block#2
    -- notice: unreachable block#61
    -- notice: unreachable block#20
    -- notice: unreachable block#94
    -- notice: unreachable block#10
    -- notice: unreachable block#64
    -- notice: unreachable block#82
    -- notice: unreachable block#9
    -- notice: unreachable block#18
    -- notice: unreachable block#75
    -- notice: unreachable block#59
    -- notice: unreachable block#74
    -- notice: unreachable block#93
    -- notice: unreachable block#63
    -- notice: unreachable block#89
    -- notice: unreachable block#6
    -- notice: unreachable block#71
    -- notice: unreachable block#84
    -- notice: unreachable block#5
    -- notice: unreachable block#77
    -- notice: unreachable block#86
    -- notice: unreachable block#67
    -- notice: unreachable block#68
    -- notice: unreachable block#14
    -- notice: unreachable block#78
    -- notice: unreachable block#12
    if r0_80.SliderMoveNo == 399 then
      r0_80:P3_GaugeJob(r2_80, r3_80, r4_80, r5_80, r6_80)
    end
    r0_80:SetSlideActP3(r1_80)
    if r1_80 == -1 or r0_80.ItemP3.selCursor_selName ~= r1_80 then
      r0_80:ItemSet(r0_80.ItemP3, -1, -1, -1, -1)
    end
    if "VoiceSkipOn" == r1_80 or "VoiceSkipOff" == r1_80 then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_VoiceSkip, -1, "expVoiceSkip")
    end
    if "VoiceRLOn" == r1_80 or "VoiceRLOff" == r1_80 then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_VoiceRL, -1, "expVoiceRL")
    end
    if "BgvStopOn" == r1_80 or "BgvStopOff" == r1_80 then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_BgvStop, -1, "expBgvStop")
    end
    for r10_80 = 0, r0_80.selCharMax - 1, 1 do
      if string.format("VoiceChar%03d", r10_80 + 1) == r1_80 then
        r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_CharVol, -1, "expCharVol")
      end
    end
    for r10_80, r11_80 in pairs(r0_80.GaugeBarP3) do
      r11_80:GaugeOnCursor(r2_80, r3_80, r4_80, r5_80, r6_80)
    end
    if r0_80.GaugeBarP3.SL_MasterVol.OnMouse then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_MasterVol, r0_80.ItemP3.Headline_barMasterVol, "expMasterVol")
    end
    if r0_80.GaugeBarP3.SL_SysSeVol.OnMouse then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_SysSeVol, r0_80.ItemP3.Headline_barSysSeVol, "expSysSeVol")
    end
    if r0_80.GaugeBarP3.SL_BgmVol.OnMouse then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_BgmVol, r0_80.ItemP3.Headline_barBgmVol, "expBgmVol")
    end
    if r0_80.GaugeBarP3.SL_SeVol.OnMouse then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_SeVol, r0_80.ItemP3.Headline_barSeVol, "expSeVol")
    end
    if r0_80.GaugeBarP3.SL_MovieVol.OnMouse then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_MovieVol, r0_80.ItemP3.Headline_barMovieVol, "expMovieVol")
    end
    if r0_80.GaugeBarP3.SL_VoiceVol.OnMouse then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_VoiceVol, r0_80.ItemP3.Headline_barVoiceVol, "expVoiceVol")
    end
    if r0_80.GaugeBarP3.SL_VoiceBgmVol.OnMouse then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_VoiceBgmVol, r0_80.ItemP3.Headline_barVoiceBgmVol, "expVoiceBgmVol")
    end
    if r0_80.GaugeBarP3.SL_CharVol.OnMouse then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, r0_80.ItemP3.Headline_CharVoice, r0_80.ItemP3.Headline_barCharVol, "expCharVol")
    end
    if "SysVoiceEx" == r1_80 and r0_80.ItemP3.expSysVoiceEx ~= nil then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, -1, -1, "expSysVoiceEx")
    end
    if "SysVoiceRa" == r1_80 and r0_80.ItemP3.expSysVoiceRa ~= nil then
      r0_80:ItemSet(r0_80.ItemP3, r1_80, -1, -1, "expSysVoiceRa")
    end
  end
  g_Menu.Config.ptr.DataNoName = function(r0_81, r1_81, r2_81)
    -- line: [4617, 4623] id: 81
    local r3_81 = nil	-- notice: implicit variable refs by block#[3]
    if r1_81 == true then
      r3_81 = "Save"
      if not r3_81 then
        ::label_5::
        r3_81 = "Load"
      end
    else
      goto label_5	-- block#2 is visited secondly
    end
    return string.format("P4DataNo%s%04d", r3_81, r2_81)
  end
  g_Menu.Config.ptr.DataOverName = function(r0_82, r1_82, r2_82)
    -- line: [4625, 4632] id: 82
    local r3_82 = nil	-- notice: implicit variable refs by block#[3]
    if r1_82 == true then
      r3_82 = "Save"
      if not r3_82 then
        ::label_5::
        r3_82 = "Load"
      end
    else
      goto label_5	-- block#2 is visited secondly
    end
    return string.format("P4DataTh%s%04d", r3_82, r2_82)
  end
  g_Menu.Config.ptr.DataPage_SetActive = function(r0_83, r1_83, r2_83, r3_83)
    -- line: [4635, 4870] id: 83
    local r4_83 = cclass.lua_Layers:create()
    if false then
      if g_dataInfo.tab == 1 then
        r4_83:setSubLayerVisible("configBase", r1_83, 212, 1)
        r4_83:setSubLayerVisible("configBase", r1_83, 211, 0)
        r0_83.ButtonP45.PageBase1:bt_SetActive(1)
        r0_83.ButtonP45.PageBase2:bt_SetActive(0)
        for r8_83 = 1, 21, 1 do
          local r9_83 = string.format("Page%d", r8_83)
          if 1 <= r8_83 and r8_83 <= 10 or r8_83 == 21 then
            if g_dataInfo.page == r8_83 then
              r0_83.ButtonP45[r9_83]:bt_SetActive(1)
            else
              r0_83.ButtonP45[r9_83]:bt_SetActive(0)
            end
          else
            r0_83.ButtonP45[r9_83]:bt_SetActive(3)
          end
        end
      else
        r4_83:setSubLayerVisible("configBase", r1_83, 212, 0)
        r4_83:setSubLayerVisible("configBase", r1_83, 211, 1)
        r0_83.ButtonP45.PageBase1:bt_SetActive(0)
        r0_83.ButtonP45.PageBase2:bt_SetActive(1)
        for r8_83 = 1, 21, 1 do
          local r9_83 = string.format("Page%d", r8_83)
          if 11 <= r8_83 and r8_83 <= 20 or r8_83 == 21 then
            if g_dataInfo.page == r8_83 then
              r0_83.ButtonP45[r9_83]:bt_SetActive(1)
            else
              r0_83.ButtonP45[r9_83]:bt_SetActive(0)
            end
          else
            r0_83.ButtonP45[r9_83]:bt_SetActive(3)
          end
        end
      end
    else
      for r8_83 = 1, g_DATAPAGEMAX, 1 do
        local r9_83 = string.format("Page%d", r8_83)
        if g_dataInfo.page == r8_83 then
          r0_83.ButtonP45[r9_83]:bt_SetActive(1)
        else
          r0_83.ButtonP45[r9_83]:bt_SetActive(0)
        end
      end
    end
    for r8_83 = 1, 10, 1 do
      local r9_83 = string.format("Data%d", r8_83)
      r0_83.ButtonP45[r9_83]:bt_SetActive(0)
      if r2_83 == true then
        if g_dataInfo.page == g_DATAPAGEMAX then
          r0_83.ButtonP45[r9_83]:bt_SetActive(2)
        end
        if g_sortData:GetProtect(r8_83 + (g_dataInfo.page - 1) * 10) then
          r0_83.ButtonP45[r9_83]:bt_SetActive(2)
        end
      elseif g_dataInfo.page == g_DATAPAGEMAX then
        local r10_83 = r8_83
        if r8_83 <= 5 then
          if g_autoOrder[r10_83] > 0 then
            r0_83.ButtonP45[r9_83]:bt_SetActive(0)
          else
            r0_83.ButtonP45[r9_83]:bt_SetActive(2)
          end
        elseif g_quickOrder[r10_83 - 5] > 0 then
          r0_83.ButtonP45[r9_83]:bt_SetActive(0)
        else
          r0_83.ButtonP45[r9_83]:bt_SetActive(2)
        end
      elseif cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r8_83) == false then
        r0_83.ButtonP45[r9_83]:bt_SetActive(2)
      else
        r0_83.ButtonP45[r9_83]:bt_SetActive(0)
      end
      updateNewIcon(r1_83, g_dataInfo.page, r2_83)
    end
    if false then
      for r8_83 = 1, 10, 1 do
        if g_dataInfo.page == g_DATAPAGEMAX then
          r0_83.ButtonP45[string.format("LOCK%02d", r8_83)]:bt_SetActive(3)
          r0_83.ButtonP45[string.format("UNLOCK%02d", r8_83)]:bt_SetActive(3)
          r0_83.ButtonP45[string.format("Delete%02d", r8_83)]:bt_SetActive(3)
        else
          local r10_83 = cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r8_83)
          local r11_83 = g_sortData:GetProtect(r8_83 + (g_dataInfo.page - 1) * 10)
          local r12_83 = string.format("LOCK%02d", r8_83)
          if r10_83 == false then
            r0_83.ButtonP45[r12_83]:bt_SetActive(3)
          elseif r11_83 then
            r0_83.ButtonP45[r12_83]:bt_SetActive(3)
          else
            r0_83.ButtonP45[r12_83]:bt_SetActive(0)
          end
          r12_83 = string.format("UNLOCK%02d", r8_83)
          if r10_83 == false then
            r0_83.ButtonP45[r12_83]:bt_SetActive(3)
          elseif r11_83 then
            r0_83.ButtonP45[r12_83]:bt_SetActive(0)
          else
            r0_83.ButtonP45[r12_83]:bt_SetActive(3)
          end
          r12_83 = string.format("Delete%02d", r8_83)
          if r10_83 == false then
            r0_83.ButtonP45[r12_83]:bt_SetActive(3)
          elseif r11_83 then
            r0_83.ButtonP45[r12_83]:bt_SetActive(3)
          else
            r0_83.ButtonP45[r12_83]:bt_SetActive(0)
          end
        end
      end
    end
  end
  g_Menu.Config.ptr.SelCursorP4 = function(r0_84, r1_84, r2_84, r3_84)
    -- line: [4876, 4878] id: 84
    r0_84:SelCursorP5(r1_84, r2_84, r3_84)
  end
  g_Menu.Config.ptr.SelCursorP5 = function(r0_85, r1_85, r2_85, r3_85)
    -- line: [4879, 4906] id: 85
    local r4_85 = ConfigGetPageKeyName(4)
    if g_configPage == 5 then
      r4_85 = ConfigGetPageKeyName(5)
    end
  end
  g_Menu.Config.ptr.DataPage_ButtonJobLD = function(r0_86, r1_86, r2_86, r3_86, r4_86)
    -- line: [4909, 4912] id: 86
  end
  g_Menu.Config.ptr.DataPage_ButtonJobLU = function(r0_87, r1_87, r2_87, r3_87, r4_87)
    -- line: [4913, 5045] id: 87
    local r5_87 = -1
    if 401 <= r1_87 and r1_87 <= 422 then
      r5_87 = g_dataInfo.page
      g_dataInfo.page = r1_87 - 400
    end
    if 431 <= r1_87 and r1_87 <= 441 then
      g_dataInfo.data_no = r1_87 - 431
      local r6_87 = g_configPage
      if r6_87 == 4 then
        r6_87 = true or false
      else
        goto label_23	-- block#7 is visited secondly
      end
      if r6_87 == true then
        local r7_87 = (g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1
        if cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, r7_87) == false then
          cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SAVEGAME, r7_87)
          g_SavedDataUpdateWeight = true
          cfunc.LegacyGame__lua_SetSaveComment(g_saveComment)
          if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
            r0_87:SetConfigButtonActive(r0_87.MenuInf.beforePage)
          end
        else
          openConfirm(LUA_CONFIRM_OVERWRITE)
        end
        r0_87.SaveJob = 4
      elseif g_dataInfo.page == g_DATAPAGEMAX then
        local r7_87 = g_dataInfo.data_no + 1
        if r7_87 < 6 and g_autoOrder[r7_87] > 0 then
          if cfunc.CSaveDataManager__lua_GetEnabled(DATA_MODE_AUTO, g_autoOrder[r7_87]) then
            openConfirm(LUA_CONFIRM_LOAD)
          else
            local r9_87 = cclass.lua_Sounds:new()
            r9_87:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.error), g_SysSEName.error, getSoundVolume("systemse"))
            r9_87:delete()
          end
        elseif g_quickOrder[r7_87 - 5] > 0 then
          if cfunc.CSaveDataManager__lua_GetEnabled(DATA_MODE_QUICK, g_quickOrder[r7_87 - 5]) then
            openConfirm(LUA_CONFIRM_LOAD)
          else
            local r9_87 = cclass.lua_Sounds:new()
            r9_87:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.error), g_SysSEName.error, getSoundVolume("systemse"))
            r9_87:delete()
          end
        end
      else
        local r7_87 = (g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1
        if cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, r7_87) == true then
          if cfunc.CSaveDataManager__lua_GetEnabled(DATA_MODE_NORMAL, r7_87) then
            openConfirm(LUA_CONFIRM_LOAD)
          else
            local r10_87 = cclass.lua_Sounds:new()
            r10_87:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.error), g_SysSEName.error, getSoundVolume("systemse"))
            r10_87:delete()
          end
        end
      end
    end
    if false then
      if 451 <= r1_87 and r1_87 < 461 then
        g_sortData:ProtectData(r1_87 - 450 + (g_dataInfo.page - 1) * 10, g_saveComment, true)
        r0_87.SaveJob = 2
      end
      if 461 <= r1_87 and r1_87 < 471 then
        g_sortData:ProtectData(r1_87 - 460 + (g_dataInfo.page - 1) * 10, g_saveComment, false)
        r0_87.SaveJob = 3
      end
      if 471 <= r1_87 and r1_87 <= 481 then
        g_dataInfo.data_no = r1_87 - 471
        openConfirm(LUA_CONFIRM_DELETEGAME)
      end
    end
    if r1_87 == 490 then
      g_dataInfo.tab = 1
    end
    if r1_87 == 491 then
      g_dataInfo.tab = 2
    end
    if 401 <= r1_87 and r1_87 <= 500 then
      local r6_87 = ConfigGetPageKeyName(g_configPage)
      local r7_87 = g_configPage
      if r7_87 == 4 then
        r7_87 = true or false
      else
        goto label_266	-- block#46 is visited secondly
      end
      r0_87:deleteThumbnail(r7_87)
      for r11_87 = 1, 10, 1 do
        initThumbnail(r7_87, r11_87 + (g_dataInfo.page - 1) * 10, false)
      end
      r0_87:DataPage_SetActive(r6_87, r7_87, r5_87)
    end
  end
  g_Menu.Config.ptr.SaveJob = 0
  g_Menu.Config.ptr.initDataPage = function(r0_88, r1_88, r2_88, r3_88)
    -- line: [5050, 5184] id: 88
    initDataOrder()
    if g_dataInfo.init == false then
      r0_88:initDataPageNo()
      g_dataInfo.init = true
    end
    if g_sortData == nil then
      g_sortData = cclass.lua_DataSort:new(0, g_sortType, g_sortOrder, 100)
    end
    g_sortData:ResetMark()
    local r4_88 = cclass.lua_Layers:create()
    if r3_88 == true then
      if r2_88 == true then
      end
      r4_88:initSubLayer("configBase", r1_88, 70, 1)
      if g_dataInfo.tab ~= nil then
        if g_dataInfo.tab <= 0 then
          g_dataInfo.tab = 1
        end
      else
        g_dataInfo.tab = 1
      end
      r0_88.ButtonP45 = {}
      for r8_88 = 1, 11, 1 do
        local r10_88 = 36 - r8_88 - 1
        r0_88:MenuButtonSet(r0_88.ButtonP45, string.format("Page%d", r8_88), 1, r1_88, r10_88, r10_88, 25 - r8_88 - 1, 14 - r8_88 - 1, -1, 401 + r8_88 - 1, 0, 0)
      end
      if false then
        for r8_88 = 1, 11, 1 do
          local r10_88 = 154 - r8_88 - 1
          r0_88:MenuButtonSet(r0_88.ButtonP45, string.format("Page%d", r8_88 + 10), 1, r1_88, r10_88, r10_88, 128 - r8_88 - 1, 141 - r8_88 - 1, -1, 401 + r8_88 - 1 + 10, 0, 0)
        end
        r0_88:MenuButtonSet(r0_88.ButtonP45, "PageBase1", 1, r1_88, 209, 208, 206, 207, -1, 490, 0, 0)
        r0_88:MenuButtonSet(r0_88.ButtonP45, "PageBase2", 1, r1_88, 203, 202, 200, 201, -1, 491, 0, 0)
      end
      for r8_88 = 1, 10, 1 do
        local r10_88 = 58 - r8_88 - 1
        local r12_88 = -1
        r0_88:MenuButtonSet(r0_88.ButtonP45, string.format("Data%d", r8_88), 1, r1_88, r10_88, r10_88, 48 - r8_88 - 1, -1, 68 - r8_88 - 1, 431 + r8_88 - 1, 0, 0)
        initThumbnail(r2_88, r8_88 + (g_dataInfo.page - 1) * 10, false)
        if false then
          r10_88 = 75 - r8_88 - 1
          r0_88:MenuButtonSet(r0_88.ButtonP45, string.format("LOCK%02d", r8_88), 1, r1_88, r10_88, r10_88, 39 - r8_88 - 1, -1, -1, 451 + r8_88 - 1, 0, 1)
          r10_88 = 51 - r8_88 - 1
          r0_88:MenuButtonSet(r0_88.ButtonP45, string.format("UNLOCK%02d", r8_88), 1, r1_88, r10_88, r10_88, 63 - r8_88 - 1, -1, -1, 461 + r8_88 - 1, 0, 1)
          r10_88 = 25 - r8_88 - 1
          r0_88:MenuButtonSet(r0_88.ButtonP45, string.format("Delete%02d", r8_88), 1, r1_88, r10_88, r10_88, 13 - r8_88 - 1, -1, -1, 471 + r8_88 - 1, 0, 1)
        end
      end
      r0_88.MenuButton:InitList()
      r0_88.MenuButton:SetList("ButtonP45", r0_88.ButtonP45)
      r0_88.MenuButton:InitButton()
    else
      r0_88:deleteThumbnail(r2_88)
    end
    r0_88:DataPage_SetActive(r1_88, r2_88, -1)
  end
  g_Menu.Config.ptr.deleteThumbnail = function(r0_89, r1_89)
    -- line: [5189, 5212] id: 89
    local r2_89 = cclass.lua_Layers:create()
    for r6_89 = 1, 10, 1 do
      local r7_89 = getSaveThumbKey(r1_89, r6_89)
      r2_89:cancelEffect("configBase", r7_89, "Update")
      r2_89:setParam("configBase", r7_89, LUA_PARAM_SCALE, 1, 1, 1, 0)
      r2_89:removeLayer("configBase", r7_89)
      r2_89:removeLayer("configBase", getSaveThumbTxt(r1_89, r6_89))
      r2_89:removeLayer("configBase", getSaveThumbTimeTxt(r1_89, r6_89))
      if g_UseSaveNoTxt == true then
        r2_89:removeLayer("configBase", getSaveThumbNoTxt(r1_89, r6_89))
      end
      r2_89:removeLayer("configBase", r0_89:DataOverName(r1_89, r6_89))
    end
  end
  g_Menu.Config.ptr.initDataPageNo = function(r0_90)
    -- line: [5217, 5246] id: 90
    local r1_90 = 0
    local r2_90 = 0
    r1_90, r2_90 = cfunc.CSaveDataManager__lua_FindNewData(0, r1_90, r2_90)
    if false then
      if r1_90 == 0 then
        g_dataInfo.page = math.floor((r2_90 - 1) / 10 + 1)
        if g_dataInfo.page <= 10 then
          g_dataInfo.tab = 1
        else
          g_dataInfo.tab = 2
        end
      elseif r1_90 == 1 then
        g_dataInfo.page = g_DATAPAGEMAX
        g_dataInfo.tab = 1
      end
    elseif r1_90 == 0 then
      g_dataInfo.page = math.floor((r2_90 - 1) / 10 + 1)
    else
      g_dataInfo.page = g_DATAPAGEMAX
    end
  end
  g_Menu.Config.ptr.effectThumbnail = function(r0_91, r1_91, r2_91, r3_91, r4_91, r5_91, r6_91, r7_91)
    -- line: [5249, 5373] id: 91
    local r8_91 = cclass.lua_Layers:create()
    local r9_91 = getEffectRate()
    local r10_91 = r5_91
    r5_91 = r5_91 / 2
    for r14_91 = 1, 10, 1 do
      local r15_91 = getSaveThumbKey(r1_91, r14_91)
      local r16_91 = getSaveThumbTxt(r1_91, r14_91)
      local r17_91 = getSaveThumbTimeTxt(r1_91, r14_91)
      local r18_91 = getSaveThumbNoTxt(r1_91, r14_91)
      r8_91:cancelEffect("configBase", r15_91, "Update")
      r8_91:setParam("configBase", r15_91, LUA_PARAM_SCALE, 1, 1, 1, 0)
      local r19_91 = r0_91:DataOverName(r1_91, r14_91)
      if r2_91 ~= true then
        if r6_91 == false then
          local r20_91 = r7_91
          r8_91:setParam("configBase", r15_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_91:setParam("configBase", r16_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_91:setParam("configBase", r17_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_91:setParam("configBase", r19_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_91:setEffect("configBase", r15_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r20_91)
          r8_91:setEffect("configBase", r16_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r20_91)
          r8_91:setEffect("configBase", r17_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r20_91)
          r8_91:setEffect("configBase", r19_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r20_91)
          if g_UseSaveNoTxt then
            r8_91:setParam("configBase", r18_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_91:setEffect("configBase", r18_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r20_91)
          end
        else
          local r20_91 = r5_91
          if r0_91.PageSlide then
            r20_91 = 100
          end
          r8_91:setEffect("configBase", r15_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_91, 0, r7_91)
          r8_91:setEffect("configBase", r16_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_91, 0, r7_91)
          r8_91:setEffect("configBase", r17_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_91, 0, r7_91)
          r8_91:setEffect("configBase", r19_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_91, 0, r7_91)
          if g_UseSaveNoTxt then
            r8_91:setEffect("configBase", r18_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r20_91, 0, r7_91)
          end
        end
        r8_91:startEffect("configBase", r15_91, "ConfigPage", 0)
        r8_91:startEffect("configBase", r16_91, "ConfigPage", 0)
        r8_91:startEffect("configBase", r17_91, "ConfigPage", 0)
        r8_91:startEffect("configBase", r19_91, "ConfigPage", 0)
        if g_UseSaveNoTxt then
          r8_91:startEffect("configBase", r18_91, "ConfigPage", 0)
        end
        if r0_91.PageSlide then
          if r6_91 == false then
            local r20_91 = 0
            local r21_91 = 0
            local r22_91 = 0
            local r23_91 = 0
            r20_91, r21_91, r22_91, r23_91 = r8_91:getParam("configBase", r15_91, LUA_PARAM_POS, r20_91, r21_91, r22_91, r23_91)
            r8_91:setParam("configBase", r15_91, LUA_PARAM_POS, r20_91 - r4_91, r21_91, r22_91, r23_91)
            r20_91, r21_91, r22_91, r23_91 = r8_91:getParam("configBase", r16_91, LUA_PARAM_POS, r20_91, r21_91, r22_91, r23_91)
            r8_91:setParam("configBase", r16_91, LUA_PARAM_POS, r20_91 - r4_91, r21_91, r22_91, r23_91)
            r20_91, r21_91, r22_91, r23_91 = r8_91:getParam("configBase", r17_91, LUA_PARAM_POS, r20_91, r21_91, r22_91, r23_91)
            r8_91:setParam("configBase", r17_91, LUA_PARAM_POS, r20_91 - r4_91, r21_91, r22_91, r23_91)
            r8_91:setParam("configBase", r15_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_91:setParam("configBase", r16_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_91:setParam("configBase", r17_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_91:setEffect("configBase", r15_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r7_91)
            r8_91:setEffect("configBase", r16_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r7_91)
            r8_91:setEffect("configBase", r17_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r7_91)
            if g_UseSaveNoTxt then
              r20_91, r21_91, r22_91, r23_91 = r8_91:getParam("configBase", r18_91, LUA_PARAM_POS, r20_91, r21_91, r22_91, r23_91)
              r8_91:setParam("configBase", r18_91, LUA_PARAM_POS, r20_91 - r4_91, r21_91, r22_91, r23_91)
              r8_91:setParam("configBase", r18_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
              r8_91:setEffect("configBase", r18_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r7_91)
            end
            r20_91, r21_91, r22_91, r23_91 = r8_91:getParam("configBase", r19_91, LUA_PARAM_POS, r20_91, r21_91, r22_91, r23_91)
            r8_91:setParam("configBase", r19_91, LUA_PARAM_POS, r20_91 - r4_91, r21_91, r22_91, r23_91)
            r8_91:setParam("configBase", r19_91, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_91:setEffect("configBase", r19_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_91, 0, r7_91)
          else
            r8_91:setEffect("configBase", r15_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_91, 0, r7_91)
            r8_91:setEffect("configBase", r16_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_91, 0, r7_91)
            r8_91:setEffect("configBase", r17_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_91, 0, r7_91)
            if g_UseSaveNoTxt then
              r8_91:setEffect("configBase", r18_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_91, 0, r7_91)
            end
            r8_91:setEffect("configBase", r19_91, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_91, 0, r7_91)
          end
          r8_91:setEffect("configBase", r15_91, "ConfigPage", LUA_EFFECT_POS, r4_91, 0, 0, 0, 2, r10_91, 0, r7_91)
          r8_91:startEffect("configBase", r15_91, "ConfigPage", 0)
          r8_91:setEffect("configBase", r16_91, "ConfigPage", LUA_EFFECT_POS, r4_91, 0, 0, 0, 2, r10_91, 0, r7_91)
          r8_91:startEffect("configBase", r16_91, "ConfigPage", 0)
          r8_91:setEffect("configBase", r17_91, "ConfigPage", LUA_EFFECT_POS, r4_91, 0, 0, 0, 2, r10_91, 0, r7_91)
          r8_91:startEffect("configBase", r17_91, "ConfigPage", 0)
          if g_UseSaveNoTxt then
            r8_91:setEffect("configBase", r18_91, "ConfigPage", LUA_EFFECT_POS, r4_91, 0, 0, 0, 2, r10_91, 0, r7_91)
            r8_91:startEffect("configBase", r18_91, "ConfigPage", 0)
          end
          r8_91:setEffect("configBase", r19_91, "ConfigPage", LUA_EFFECT_POS, r4_91, 0, 0, 0, 2, r10_91, 0, r7_91)
          r8_91:startEffect("configBase", r19_91, "ConfigPage", 0)
        end
      end
    end
  end
  g_Menu.Config.ptr.GetIconName = function(r0_92, r1_92)
    -- line: [5379, 5383] id: 92
    return string.format("gestureIcon%03d", r1_92)
  end
  g_Menu.Config.ptr.GetDropName = function(r0_93, r1_93)
    -- line: [5385, 5389] id: 93
    return string.format("Drop%03d", r1_93)
  end
  g_Menu.Config.ptr.loadIcon = function(r0_94)
    -- line: [5392, 5400] id: 94
    local r1_94 = "Sys_Arrow.pna"
    if getLangPatchFlag() and getAltLanguage() then
      r1_94 = "Sys_C_Arrow.pna"
    end
    r0_94:MenuLoadLayer("GestureIcon", r1_94)
  end
  g_Menu.Config.ptr.deleteIcon = function(r0_95)
    -- line: [5402, 5405] id: 95
    cclass.lua_Layers:create():removeLayer("configBase", "GestureIcon")
  end
  g_Menu.Config.ptr.GetIconLay = function(r0_96, r1_96)
    -- line: [5408, 5411] id: 96
    return 19 - r1_96
  end
  g_Menu.Config.ptr.Page7_SetActive = function(r0_97)
    -- line: [5415, 5446] id: 97
    local r1_97 = cclass.lua_Layers:create()
    for r5_97 = 1, g_ArrowMax, 1 do
      r0_97.ButtonP7[r0_97:GetIconName(r5_97)]:bt_SetDefPos()
      local r6_97 = r0_97:GetDropName(r5_97 + 10)
      r0_97.ButtonDropP7[r6_97]:bt_SetActive(0)
      r0_97.ButtonDropP7[r6_97]:bt_SetDefPos()
    end
    for r5_97, r6_97 in pairs(g_gestureFunc) do
      r0_97.ButtonP7[r0_97:GetIconName(r6_97 + 1)]:bt_SetPos(r0_97.DropP7[r5_97].x, r0_97.DropP7[r5_97].y)
      local r7_97 = r0_97:GetDropName(r6_97 + 1 + 10)
      r0_97.ButtonDropP7[r7_97]:bt_SetActive(2)
      r0_97.ButtonDropP7[r7_97]:bt_SetPos(r0_97.DropP7[r5_97].x, r0_97.DropP7[r5_97].y)
    end
    if r0_97.ButtonP7.GestureOn ~= nil then
      if g_gestureDisable == true then
        r0_97.ButtonP7.GestureOn:bt_SetActive(4)
        r0_97.ButtonP7.GestureOff:bt_SetActive(0)
      else
        r0_97.ButtonP7.GestureOn:bt_SetActive(0)
        r0_97.ButtonP7.GestureOff:bt_SetActive(4)
      end
    end
  end
  g_Menu.Config.ptr.DragStart = function(r0_98, r1_98, r2_98, r3_98)
    -- line: [5449, 5486] id: 98
    r1_98 = r1_98 - 701
    r0_98.MenuButton.onDropFlag = true
    r0_98.DropParam.DropNo = r1_98
    r0_98.DropParam.Before = -1
    for r7_98, r8_98 in pairs(g_gestureFunc) do
      if r8_98 == r1_98 then
        r0_98.DropParam.Before = r7_98
        break
      end
    end
    if r0_98.DropParam.Before == -1 then
      for r7_98 = 1, g_ArrowMax, 1 do
        r0_98.ButtonDropP7[r0_98:GetDropName(r7_98 + 10)]:bt_SetActive(2)
      end
    else
      r0_98:Page7_SetActive()
    end
    local r4_98 = r0_98:GetIconName(r1_98 + 1)
    r0_98.DropParam.DRAGST_X = r0_98.ButtonP7[r4_98].DRAW_POS.x - r2_98
    r0_98.DropParam.DRAGST_Y = r0_98.ButtonP7[r4_98].DRAW_POS.y - r3_98
    cclass.lua_Layers:create():setSubLayerParam("configBase", "GestureIcon", r0_98:GetIconLay(r0_98.DropParam.DropNo), LUA_PARAM_COLOR, 1, 1, 1, 0.8)
  end
  g_Menu.Config.ptr.DragEnd = function(r0_99, r1_99, r2_99, r3_99)
    -- line: [5488, 5532] id: 99
    local r4_99 = cclass.lua_Layers:create()
    r0_99.MenuButton.onDropFlag = false
    if r0_99.DropParam.DropNo ~= -1 then
      if 751 <= r1_99 and r1_99 <= 754 then
        r1_99 = r1_99 - 750
        if r0_99.DropParam.Before == -1 then
          local r6_99 = r0_99:GetIconName(g_gestureFunc[r1_99] + 1)
        else
          local r5_99 = g_gestureFunc[r0_99.DropParam.Before]
          g_gestureFunc[r0_99.DropParam.Before] = g_gestureFunc[r1_99]
        end
        g_gestureFunc[r1_99] = r0_99.DropParam.DropNo
        r0_99:Page7_SetActive()
      end
      if 761 <= r1_99 and r1_99 <= 775 and r0_99.DropParam.Before ~= -1 then
        g_gestureFunc[r0_99.DropParam.Before] = r1_99 - 761
        r0_99:Page7_SetActive()
      end
      cclass.lua_Layers:create():setSubLayerVisible("configBase", "GestureIcon", r0_99:GetIconLay(r0_99.DropParam.DropNo), 0)
      r0_99.DropParam.DropNo = -1
      r0_99.DropParam.Before = -1
      r0_99.DropParam.DRAGST_X = 0
      r0_99.DropParam.DRAGST_Y = 0
    end
  end
  g_Menu.Config.ptr.DragOn = function(r0_100, r1_100, r2_100)
    -- line: [5534, 5548] id: 100
    if r0_100.DropParam.DropNo ~= -1 then
      local r3_100 = cclass.lua_Layers:create()
      local r4_100 = 0
      local r5_100 = 0
      local r8_100 = r0_100:GetIconLay(r0_100.DropParam.DropNo)
      r3_100:setSubLayerParam("configBase", "GestureIcon", r8_100, LUA_PARAM_POS, r1_100 + r0_100.DropParam.DRAGST_X, r2_100 + r0_100.DropParam.DRAGST_Y, 0, 0)
      r3_100:setSubLayerVisible("configBase", "GestureIcon", r8_100, 1)
    end
  end
  g_Menu.Config.ptr.P7_ButtonJobLD = function(r0_101, r1_101, r2_101, r3_101, r4_101)
    -- line: [5551, 5555] id: 101
    if 701 <= r1_101 and r1_101 <= 714 then
      r0_101:DragStart(r1_101, r3_101, r4_101)
    end
  end
  g_Menu.Config.ptr.P7_ButtonJobLU = function(r0_102, r1_102, r2_102, r3_102, r4_102)
    -- line: [5557, 5574] id: 102
    if 701 <= r1_102 and r1_102 <= 800 then
      if r1_102 == 770 then
        g_gestureDisable = true
        r0_102:Page7_SetActive()
      end
      if r1_102 == 771 then
        g_gestureDisable = false
        r0_102:Page7_SetActive()
      end
    end
    local r5_102 = 0
    if r0_102.MenuButton.selCursor ~= -1 then
      r5_102 = r0_102.MenuButton.selListKey[r0_102.MenuButton.selCursor].bt_l
    end
    r0_102:DragEnd(r5_102)
  end
  g_Menu.Config.ptr.initConfigP7 = function(r0_103, r1_103, r2_103)
    -- line: [5582, 5685] id: 103
    if r2_103 then
      local r3_103 = cclass.lua_Layers:create()
      r3_103:initSubLayer("configBase", r1_103, 91, 1)
      r0_103:loadIcon()
      r0_103.ButtonP7 = {}
      r0_103.ButtonDropP7 = {}
      r0_103.DropNo = -1
      for r7_103 = 1, g_ArrowMax, 1 do
        local r8_103 = r0_103:GetIconName(r7_103)
        local r9_103 = 16 + r7_103 - 1
        local r10_103 = 32 + r7_103 - 1
        r3_103:initSubLayer("configBase", r1_103, 48 + r7_103 - 1, 1)
        r0_103:MenuButtonSet(r0_103.ButtonP7, r8_103, 1, r1_103, r9_103, r9_103, r10_103, -1, -1, r7_103 + 700, 0, 0)
        r0_103:MenuButtonSet(r0_103.ButtonDropP7, r0_103:GetDropName(r7_103 + 10), 1, r1_103, 64 + r7_103 - 1, -1, -1, -1, -1, r7_103 + 760, 0, 0)
        r3_103:initSubLayer("configBase", "GestureIcon", r0_103:GetIconLay(r7_103 - 1), 0)
      end
      for r7_103 = 1, 4, 1 do
        local r8_103 = -1
        r0_103:MenuButtonSet(r0_103.ButtonDropP7, r0_103:GetDropName(r7_103), 1, r1_103, 80 + r7_103 - 1, -1, -1, -1, -1, r7_103 + 750, 0, 0)
        r8_103 = 86 + r7_103 - 1
        r3_103:initSubLayer("configBase", r1_103, r8_103, 0)
        local r11_103 = 0
        local r12_103 = 0
        local r13_103 = 0
        local r14_103 = 0
        r11_103, r12_103, r13_103, r14_103 = r3_103:getSubLayerParam("configBase", r1_103, r8_103, LUA_PARAM_POS, 0, 0, 0, 0)
        local r15_103 = 0
        local r16_103 = 0
        r15_103, r16_103, r13_103, r14_103 = r3_103:getSubLayerParam("configBase", r1_103, r8_103, LUA_PARAM_SIZE, 0, 0, 0, 0)
        r0_103.DropP7[r7_103] = {
          x = r11_103,
          y = r12_103,
          w = r15_103 + r11_103,
          h = r16_103 + r12_103,
        }
      end
      r0_103:MenuButtonSet(r0_103.ButtonP7, "GestureOn", 1, r1_103, 12, 12, 8, 4, -1, 770, 0, 0)
      r0_103:MenuButtonSet(r0_103.ButtonP7, "GestureOff", 1, r1_103, 11, 11, 7, 3, -1, 771, 0, 0)
      r0_103.ItemP7 = r0_103:ItemSetInit()
      r0_103.MenuButton:InitList()
      r0_103.MenuButton:SetList("ButtonP7", r0_103.ButtonP7)
      r0_103.MenuButton:SetDropList("ButtonDropP7", r0_103.ButtonDropP7)
      r0_103.MenuButton:InitButton()
    end
    r0_103:Page7_SetActive()
  end
  g_Menu.Config.ptr.SelCursorP7 = function(r0_104, r1_104, r2_104, r3_104, r4_104)
    -- line: [5687, 5769] id: 104
    local r5_104 = cclass.lua_Layers:create()
    if r1_104 ~= -1 then
      r0_104:DragOn(r3_104, r4_104)
    end
    if r2_104 == -1 or r0_104.ItemP7.selCursor_selName ~= r2_104 then
      r0_104:ItemSet(r0_104.ItemP7, -1, -1, -1, -1)
    end
    if r2_104 == "GestureOn" then
      if r0_104.ItemP7.expGestureOn ~= nil then
        if r0_104.ItemP7.GestureOnOFF ~= nil then
          r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, "GestureOnOFF", "expGestureOn")
        else
          r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, -1, "expGestureOn")
        end
      elseif r0_104.ItemP7.GestureOnOFF ~= nil then
        if r0_104.ItemP7.expGesture ~= nil then
          r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, "GestureOnOFF", "expGesture")
        else
          r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, "GestureOnOFF", -1)
        end
      elseif r0_104.ItemP7.expGesture ~= nil then
        r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, -1, "expGesture")
      else
        r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, -1, -1)
      end
    end
    if r2_104 == "GestureOff" then
      if r0_104.ItemP7.expGestureOff ~= nil then
        if r0_104.ItemP7.GestureOnOFF ~= nil then
          r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, "GestureOnOFF", "expGestureOff")
        else
          r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, -1, "expGestureOff")
        end
      elseif r0_104.ItemP7.GestureOnOFF ~= nil then
        if r0_104.ItemP7.expGesture ~= nil then
          r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, "GestureOnOFF", "expGesture")
        else
          r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, "GestureOnOFF", -1)
        end
      elseif r0_104.ItemP7.expGesture ~= nil then
        r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, -1, "expGesture")
      else
        r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, -1, -1)
      end
    end
    for r9_104 = 1, g_ArrowMax, 1 do
      if r0_104:GetIconName(r9_104) == r2_104 and r0_104.ItemP7.expGestureIcon ~= nil then
        r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, -1, "expGestureIcon")
      end
      if r0_104:GetDropName(10 + r9_104) == r2_104 and r0_104.ItemP7.expDrop ~= nil then
        r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, -1, "expDrop")
      end
    end
    for r9_104 = 1, 4, 1 do
      if r0_104:GetDropName(r9_104) == r2_104 and r0_104.ItemP7.expDrop ~= nil then
        r0_104:ItemSet(r0_104.ItemP7, r2_104, -1, -1, "expDrop")
      end
    end
  end
  g_Menu.Config.ptr.effectP7 = function(r0_105, r1_105, r2_105, r3_105, r4_105, r5_105)
    -- line: [5772, 5782] id: 105
    local r6_105 = cclass.lua_Layers:create()
    local r7_105 = getEffectRate()
    if r1_105 == true then
    end
  end
  if g_EnableNMS then
    g_Menu.Config.ptr.Page8_SetInitParam = function(r0_106)
      -- line: [5794, 5809] id: 106
      if 10 < g_NmsPlay.Param and 1 <= g_NmsPlay.Act then
        if g_NmsPlay.Param - 10 < g_NmsPlay.Act then
          g_NmsPlay.Slide = g_NmsPlay.Param - 10
        else
          g_NmsPlay.Slide = g_NmsPlay.Act - 1
        end
      end
    end
    g_Menu.Config.ptr.Page8_SetActive = function(r0_107)
      -- line: [5813, 5823] id: 107
      r0_107:SetEntryBarBt()
      r0_107:SetEntryText()
    end
    g_Menu.Config.ptr.P8ChangeSceneNo = g_NmsPlay.Act
    g_Menu.Config.ptr.P8SlideFlag = 0
    g_Menu.Config.ptr.P8_ButtonJobLD = function(r0_108, r1_108, r2_108, r3_108, r4_108)
      -- line: [5828, 5835] id: 108
      if 801 <= r1_108 and r1_108 <= 900 and r1_108 == 801 then
        r0_108.P8SlideFlag = 1
        g_NmsPlay.Slide = r0_108.ButtonP8Slide.SlideBar:bt_GetParamY()
      end
    end
    g_Menu.Config.ptr.P8_ButtonJobLU = function(r0_109, r1_109, r2_109, r3_109, r4_109)
      -- line: [5837, 5890] id: 109
      if 801 <= r1_109 and r1_109 <= 900 then
        if r1_109 == 802 then
          local r5_109 = r0_109.ButtonP8Slide.BarBack.EVENT_RECT.h / (r0_109.ButtonP8Slide.SlideBar.MOVABLE.PAR_MAX_Y + 1 - r0_109.ButtonP8Slide.SlideBar.MOVABLE.PSIZE_Y)
          local r6_109 = r4_109 - r0_109.ButtonP8Slide.BarBack.DRAW_POS.y
          if r6_109 < 0 then
            r6_109 = 0
          end
          local r7_109 = math.floor(r6_109 / r5_109)
          local r9_109 = r0_109.ButtonP8Slide.SlideBar:bt_GetParamY() - r7_109
          r0_109.ButtonP8Slide.SlideBar:bt_SetParamY(r7_109)
          r0_109:SetEntryBarParam(r7_109)
          r0_109:Page8_SetActive()
        end
        if r1_109 == 803 then
          local r5_109 = r0_109.ButtonP8Slide.SlideBar.MOVABLE.PAR_Y - 1
          r0_109.ButtonP8Slide.SlideBar:bt_SetParamY(r5_109)
          r0_109:SetEntryBarParam(r5_109)
          r0_109:Page8_SetActive()
        end
        if r1_109 == 804 then
          local r5_109 = r0_109.ButtonP8Slide.SlideBar.MOVABLE.PAR_Y + 1
          r0_109.ButtonP8Slide.SlideBar:bt_SetParamY(r5_109)
          r0_109:SetEntryBarParam(r5_109)
          r0_109:Page8_SetActive()
        end
        if r1_109 == 810 then
          openConfirm(LUA_CONFIRM_SCNTOP)
        end
        if 850 <= r1_109 and r1_109 <= 859 then
          g_NmsPlay.Act = r1_109 - 850 + 1 + g_NmsPlay.Slide
          r0_109:Page8_SetActive()
        end
      end
      if r0_109.P8SlideFlag == 1 then
        local r5_109 = r0_109.ButtonP8Slide.SlideBar:bt_GetParamY()
        r0_109.ButtonP8Slide.SlideBar:bt_SetParamY(r5_109)
        r0_109:SetEntryBarParam(r5_109)
        r0_109:Page8_SetActive()
        r0_109.P8SlideFlag = 0
      end
    end
    g_Menu.Config.ptr.P8GetTitleTextName = function(r0_110, r1_110)
      -- line: [5893, 5895] id: 110
      return string.format("NmsTitle%03d", r1_110)
    end
    g_Menu.Config.ptr.P8CreateTitleLayer = function(r0_111)
      -- line: [5897, 5903] id: 111
      local r1_111 = cclass.lua_Layers:create()
      for r5_111 = 0, 9, 1 do
        r1_111:insertTextLayer("configBase", r0_111:P8GetTitleTextName(r5_111), 350, 32, 2, 2, 2, 2, 0, 1)
      end
    end
    g_Menu.Config.ptr.P8DeleteTitleLayer = function(r0_112)
      -- line: [5905, 5911] id: 112
      local r1_112 = cclass.lua_Layers:create()
      for r5_112 = 0, 9, 1 do
        r1_112:removeLayer("configBase", r0_112:P8GetTitleTextName(r5_112))
      end
    end
    g_Menu.Config.ptr.P8SetTitle = function(r0_113, r1_113, r2_113)
      -- line: [5913, 5920] id: 113
      local r3_113 = cclass.lua_Layers:create()
      local r4_113 = r0_113:P8GetTitleTextName(r1_113)
      r3_113:clearText("configBase", r4_113)
      if r2_113 ~= nil and r2_113 ~= -1 then
        r3_113:setText("configBase", r4_113, g_nmsTitleList[r2_113], g_NmsFonts.name, g_NmsFonts.size, 0, 0, 4294967295, 255, 1, 1)
      end
    end
    g_Menu.Config.ptr.old_on_th = -1
    g_Menu.Config.ptr.initConfigP8 = function(r0_114, r1_114, r2_114)
      -- line: [5924, 6049] id: 114
      if r2_114 then
        r0_114.old_on_th = -1
        local r3_114 = cclass.lua_Layers:create()
        r0_114:MenuLoadLayer("NmsTh", "sys_nms_th.pna")
        r0_114:MenuLoadLayer("NmsNo", "sys_nms_no.pna")
        if r0_114.PatchFlag then
          r0_114:MenuLoadLayer("PNmsTh", "Psys_nms_th.pna")
        end
        r0_114:P8CreateTitleLayer()
        for r7_114 = 0, 10, 1 do
          r3_114:initSubLayer("configBase", "NmsNo", r7_114, 0)
        end
        local r4_114 = 0
        local r5_114 = 0
        local r6_114 = 0
        local r7_114 = 0
        r4_114 = 281
        r5_114 = 168
        r3_114:setParam("configBase", "NmsTh", LUA_PARAM_POS, r4_114, r5_114, 0, 0)
        if r0_114.PatchFlag then
          r3_114:setParam("configBase", "PNmsTh", LUA_PARAM_POS, r4_114, r5_114, 0, 0)
        end
        local r9_114 = math.floor(g_NmsPlay.Param / 10) % 10
        local r10_114 = math.floor(g_NmsPlay.Param / 100)
        r3_114:insertPNARefLayer("configBase", "NmsNo1", "NmsNo", g_NmsPlay.Param % 10, 1)
        r3_114:insertPNARefLayer("configBase", "NmsNo2", "NmsNo", r9_114, 1)
        r3_114:insertPNARefLayer("configBase", "NmsNo3", "NmsNo", r10_114, 1)
        r3_114:initSubLayer("configBase", r1_114, 1, 0)
        r3_114:initSubLayer("configBase", r1_114, 2, 0)
        r3_114:initSubLayer("configBase", r1_114, 3, 0)
        r4_114, r5_114, r6_114, r7_114 = r3_114:getSubLayerParam("configBase", r1_114, 1, LUA_PARAM_POS, r4_114, r5_114, r6_114, r7_114)
        r3_114:setParam("configBase", "NmsNo3", LUA_PARAM_POS, r4_114, r5_114, 0, 0)
        r4_114, r5_114, r6_114, r7_114 = r3_114:getSubLayerParam("configBase", r1_114, 2, LUA_PARAM_POS, r4_114, r5_114, r6_114, r7_114)
        r3_114:setParam("configBase", "NmsNo2", LUA_PARAM_POS, r4_114, r5_114, 0, 0)
        r4_114, r5_114, r6_114, r7_114 = r3_114:getSubLayerParam("configBase", r1_114, 3, LUA_PARAM_POS, r4_114, r5_114, r6_114, r7_114)
        r3_114:setParam("configBase", "NmsNo1", LUA_PARAM_POS, r4_114, r5_114, 0, 0)
        r3_114:initSubLayer("configBase", r1_114, 6, 1)
        r3_114:initSubLayer("configBase", r1_114, 7, 1)
        r3_114:initSubLayer("configBase", r1_114, 16, 1)
        r3_114:initSubLayer("configBase", r1_114, 71, 1)
        r3_114:initSubLayer("configBase", r1_114, 81, 0)
        r3_114:initSubLayer("configBase", r1_114, 83, 1)
        r3_114:initSubLayer("configBase", r1_114, 84, 1)
        r3_114:initSubLayer("configBase", r1_114, 87, 1)
        r0_114.ButtonP8 = {}
        r0_114.ButtonP8Slide = {}
        r0_114.ButtonP8Slide.SlideBar = r0_114.MenuButton:SlidebarY(65, 66, r0_114.MenuButton:ButtonCreate("SlideBar", 1, r1_114, 65, -1, -1, -1, -1, 801, 0, g_SysSEName.ok, -1, 0))
        r0_114:MenuButtonSet(r0_114.ButtonP8Slide, "BarBack", 1, r1_114, 68, -1, -1, -1, -1, 802, 0, -1)
        r0_114.ButtonP8Slide.BarBack.se_click = -1
        r0_114:MenuButtonSet(r0_114.ButtonP8, "Up", 0, r1_114, 56, 56, 57, -1, 58, 803, 0, 0)
        r0_114:MenuButtonSet(r0_114.ButtonP8, "Do", 0, r1_114, 61, 61, 62, -1, 63, 804, 0, 0)
        r0_114:MenuButtonSet(r0_114.ButtonP8, "RetTop", 1, r1_114, 75, 75, 76, -1, -1, 810, 0, 0)
        for r14_114 = 0, 9, 1 do
          local r15_114 = string.format("EN_List%d", r14_114)
          local r16_114 = 19 + r14_114
          r0_114:MenuButtonSet(r0_114.ButtonP8, r15_114, 1, r1_114, r16_114, r16_114, 31 + r14_114, 43 + r14_114, -1, 850 + r14_114, 0, 0)
        end
        r0_114.MenuButton:InitList()
        r0_114.MenuButton:SetList("ButtonP8", r0_114.ButtonP8)
        r0_114.MenuButton:SetList("ButtonP8Slide", r0_114.ButtonP8Slide)
        r0_114.MenuButton:InitButton()
        r0_114.ButtonP8Slide.SlideBar:bt_SlidebarYInit(g_NmsPlay.Param, 10, 20, 68, 69)
        r0_114.ButtonP8Slide.SlideBar:bt_SetParamY(g_NmsPlay.Slide)
      end
      r0_114:SetEntryBarParam(g_NmsPlay.Slide)
      r0_114:Page8_SetActive()
    end
    g_Menu.Config.ptr.deleteP8Th = function(r0_115)
      -- line: [6052, 6077] id: 115
      local r1_115 = cclass.lua_Layers:create()
      r1_115:removeLayer("configBase", "NmsTh")
      r1_115:removeLayer("configBase", "NmsNo")
      if r0_115.PatchFlag then
        r1_115:removeLayer("configBase", "NmsTh")
      end
      r0_115:P8DeleteTitleLayer()
      for r5_115 = 1, 3, 1 do
        r1_115:removeLayer("configBase", string.format("NmsNo%d", r5_115))
      end
    end
    g_Menu.Config.ptr.SelCursorP8 = function(r0_116, r1_116, r2_116, r3_116)
      -- line: [6080, 6197] id: 116
      local r4_116 = cclass.lua_Layers:create()
      if r0_116.P8SlideFlag == 1 then
        r0_116:SetEntryBarParam(r0_116.ButtonP8Slide.SlideBar:bt_GetParamY())
        r0_116:Page8_SetActive()
      end
      local r5_116 = -1
      if g_NmsPlay.Param >= 2 then
        for r9_116 = 0, 9, 1 do
          if string.format("EN_List%d", r9_116) == r1_116 then
            r5_116 = g_NmsPlay.List[g_NmsPlay.Slide + r9_116 + 1]
          end
        end
      end
      local r6_116 = ConfigGetPageKeyName(g_configPage)
      if r1_116 == "RetTop" then
        r4_116:setSubLayerVisible("configBase", r6_116, 81, 1)
      else
        r4_116:setSubLayerVisible("configBase", r6_116, 81, 0)
      end
      if r5_116 == -1 then
        r5_116 = g_NmsPlay.List[g_NmsPlay.Act]
      end
      if r0_116.old_on_th ~= -1 and r0_116.old_on_th ~= r5_116 then
        local r7_116 = r0_116.old_on_th
        local r8_116 = "NmsTh"
        if r7_116 >= g_NmsData.MAX_THUMB then
          r8_116 = "PNmsTh"
        end
        if r8_116 ~= nil then
          local r9_116 = -1
          local r10_116 = -1
          r9_116, r10_116 = GetNmsThumbnailNo(r7_116)
          if r10_116 ~= -1 then
            r4_116:setSubLayerVisible("configBase", r8_116, r10_116, 0)
          elseif r9_116 ~= -1 then
            r4_116:setSubLayerVisible("configBase", r8_116, r9_116, 0)
          end
        end
      end
      if r0_116.old_on_th ~= r5_116 then
        r0_116.old_on_th = r5_116
        if r5_116 ~= -1 then
          local r7_116 = "NmsTh"
          if r5_116 >= g_NmsData.MAX_THUMB then
            r7_116 = "PNmsTh"
          end
          if r7_116 ~= nil then
            local r8_116 = -1
            local r9_116 = -1
            r8_116, r9_116 = GetNmsThumbnailNo(r5_116)
            if r9_116 ~= -1 then
              r4_116:initSubLayer("configBase", r7_116, r9_116, 0)
              r4_116:setSubLayerVisible("configBase", r7_116, r9_116, 1)
            elseif r8_116 ~= -1 then
              r4_116:initSubLayer("configBase", r7_116, r8_116, 0)
              r4_116:setSubLayerVisible("configBase", r7_116, r8_116, 1)
            end
          end
        end
      end
    end
    g_Menu.Config.ptr.effectP8Th = function(r0_117, r1_117, r2_117, r3_117, r4_117, r5_117)
      -- line: [6200, 6300] id: 117
      local r6_117 = cclass.lua_Layers:create()
      local r7_117 = getEffectRate()
      if r1_117 ~= true then
        if r4_117 == false then
          local r8_117 = 0
          local r9_117 = 0
          local r10_117 = 0
          local r11_117 = 0
          r8_117, r9_117, r10_117, r11_117 = r6_117:getParam("configBase", "NmsTh", LUA_PARAM_POS, r8_117, r9_117, r10_117, r11_117)
          r6_117:setParam("configBase", "NmsTh", LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_117:setEffect("configBase", "NmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_117, 0, r5_117)
          if r0_117.PatchFlag then
            r8_117, r9_117, r10_117, r11_117 = r6_117:getParam("configBase", "PNmsTh", LUA_PARAM_POS, r8_117, r9_117, r10_117, r11_117)
            r6_117:setParam("configBase", "PNmsTh", LUA_PARAM_COLOR, 1, 1, 1, 0)
            r6_117:setEffect("configBase", "PNmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_117, 0, r5_117)
          end
        else
          r6_117:setEffect("configBase", "NmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_117, 0, r5_117)
          if r0_117.PatchFlag then
            r6_117:setEffect("configBase", "PNmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_117, 0, r5_117)
          end
        end
        r6_117:startEffect("configBase", "NmsTh", "ConfigPage", 0)
        if r0_117.PatchFlag then
          r6_117:startEffect("configBase", "PNmsTh", "ConfigPage", 0)
        end
        for r11_117 = 1, 3, 1 do
          local r12_117 = string.format("NmsNo%d", r11_117)
          if r4_117 == false then
            r13_117, r14_117, r15_117, r16_117 = r6_117:getParam("configBase", r12_117, LUA_PARAM_POS, 0, 0, 0, 0)
            r6_117:setParam("configBase", r12_117, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r6_117:setEffect("configBase", r12_117, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_117, 0, r5_117)
          else
            r6_117:setEffect("configBase", r12_117, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_117, 0, r5_117)
          end
          r6_117:startEffect("configBase", r12_117, "ConfigPage", 0)
        end
        local r8_117 = g_NmsPlay.Param
        for r12_117 = 0, 9, 1 do
          local r13_117 = string.format("EN_List%d", r12_117)
          if r0_117.ButtonP8[r13_117].active == 0 or r0_117.ButtonP8[r13_117].active == 4 then
            local r14_117 = r0_117:P8GetTitleTextName(r12_117)
            if r4_117 == false then
              local r15_117 = r0_117.ButtonP8[r13_117].DRAW_POS.x + 5
              local r16_117 = r0_117.ButtonP8[r13_117].DRAW_POS.y + 1
              local r17_117 = 0
              local r18_117 = 0
              r6_117:setParam("configBase", r14_117, LUA_PARAM_COLOR, 1, 1, 1, 0)
              r6_117:setEffect("configBase", r14_117, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_117, 0, r5_117)
            else
              r6_117:setEffect("configBase", r14_117, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_117, 0, r5_117)
            end
            r6_117:startEffect("configBase", r14_117, "ConfigPage", 0)
          end
        end
      end
    end
    g_Menu.Config.ptr.MenuMouseWheelP8 = function(r0_118, r1_118, r2_118, r3_118)
      -- line: [6304, 6325] id: 118
      local r4_118 = cclass.lua_Layers:create()
      local r5_118 = r0_118.ButtonP8Slide.SlideBar.MOVABLE.PAR_Y
      if g_NmsPlay.Param >= 11 then
        r5_118 = r5_118 - r2_118 / 2
        if r5_118 < 0 then
          r5_118 = 0
        end
        local r6_118 = g_NmsPlay.Param - 10
        if r6_118 < r5_118 then
          r5_118 = r6_118
        end
        r0_118:SetEntryBarParam(r5_118)
        r0_118:Page8_SetActive()
      end
    end
    g_Menu.Config.ptr.SetEntryBarBt = function(r0_119)
      -- line: [6329, 6348] id: 119
      for r4_119 = 0, 9, 1 do
        local r5_119 = string.format("EN_List%d", r4_119)
        if r4_119 < g_NmsPlay.Param then
          local r6_119 = g_NmsPlay.Act
          if r6_119 ~= -1 then
            r6_119 = r6_119 - g_NmsPlay.Slide
          end
          if r6_119 == r4_119 + 1 then
            r0_119.ButtonP8[r5_119]:bt_SetActive(4)
          else
            r0_119.ButtonP8[r5_119]:bt_SetActive(0)
          end
        else
          r0_119.ButtonP8[r5_119]:bt_SetActive(2)
        end
      end
    end
    g_Menu.Config.ptr.SetEntryText = function(r0_120)
      -- line: [6351, 6388] id: 120
      local r1_120 = cclass.lua_Layers:create()
      local r2_120 = g_NmsPlay.Param
      for r6_120 = 0, 9, 1 do
        local r7_120 = string.format("EN_List%d", r6_120)
        if r0_120.ButtonP8[r7_120].active == 0 or r0_120.ButtonP8[r7_120].active == 4 then
          r0_120:P8SetTitle(r6_120, g_NmsPlay.List[r6_120 + g_NmsPlay.Slide + 1] + 1)
          r1_120:setParam("configBase", r0_120:P8GetTitleTextName(r6_120), LUA_PARAM_POS, r0_120.ButtonP8[r7_120].DRAW_POS.x + 5, r0_120.ButtonP8[r7_120].DRAW_POS.y + 1, 0, 0)
        else
          r0_120:P8SetTitle(r6_120, -1)
        end
      end
    end
    g_Menu.Config.ptr.SetEntryBarParam = function(r0_121, r1_121)
      -- line: [6391, 6417] id: 121
      g_NmsPlay.Slide = r1_121
      r0_121.ButtonP8Slide.SlideBar:bt_SetParamY(g_NmsPlay.Slide)
      if g_NmsPlay.Param > 10 then
        r0_121.ButtonP8Slide.SlideBar:bt_SetActive(0)
        r0_121.ButtonP8Slide.BarBack:bt_SetActive(0)
        if g_NmsPlay.Slide <= 0 then
          g_NmsPlay.Slide = 0
          r0_121.ButtonP8.Up:bt_SetActive(2)
        else
          r0_121.ButtonP8.Up:bt_SetActive(0)
        end
        if g_NmsPlay.Param - 10 <= g_NmsPlay.Slide then
          g_NmsPlay.Slide = g_NmsPlay.Param - 10
          r0_121.ButtonP8.Do:bt_SetActive(2)
        else
          r0_121.ButtonP8.Do:bt_SetActive(0)
        end
      else
        r0_121.ButtonP8Slide.SlideBar:bt_SetActive(2)
        r0_121.ButtonP8Slide.BarBack:bt_SetActive(2)
        r0_121.ButtonP8.Up:bt_SetActive(2)
        r0_121.ButtonP8.Do:bt_SetActive(2)
      end
    end
  end
  g_Menu.Config.ptr.Page9_SetActive = function(r0_122)
    -- line: [6437, 6483] id: 122
    local r1_122 = cclass.lua_Layers:create()
    local r2_122 = ConfigGetPageKeyName(9)
    for r6_122 = 1, r0_122.TipsPageMax, 1 do
      local r7_122 = string.format("Page%d", r6_122)
      if r6_122 == r0_122.TipsPage then
        r0_122.ButtonP9[r7_122]:bt_SetActive(1)
      else
        r0_122.ButtonP9[r7_122]:bt_SetActive(0)
      end
    end
    for r6_122 = 1, 9, 1 do
      local r7_122 = -1
      local r8_122 = -1
      if r0_122.TipsOldPage ~= -1 then
        r7_122, r8_122 = r0_122:TipsLayer(r0_122.TipsOldPage, r6_122)
        if r7_122 ~= -1 then
          r1_122:setSubLayerVisible("configBase", r2_122, r7_122, 0)
        end
        if r8_122 ~= -1 then
          r1_122:setSubLayerVisible("configBase", r2_122, r8_122, 0)
        end
      end
      r7_122, r8_122 = r0_122:TipsLayer(r0_122.TipsPage, r6_122)
      local r9_122 = r0_122:TipsFlag(r0_122.TipsPage, r6_122)
      if r9_122 == 1 and r8_122 ~= -1 then
        r1_122:initSubLayer("configBase", r2_122, r8_122, 1)
        r1_122:setSubLayerVisible("configBase", r2_122, r8_122, 1)
      end
      if r9_122 == 0 and r7_122 ~= -1 then
        r1_122:initSubLayer("configBase", r2_122, r7_122, 1)
        r1_122:setSubLayerVisible("configBase", r2_122, r7_122, 1)
      end
    end
    r0_122.TipsOldPage = -1
  end
  g_Menu.Config.ptr.P9_ButtonJobLD = function(r0_123, r1_123, r2_123, r3_123, r4_123)
    -- line: [6486, 6489] id: 123
    if nil and not nil then
      goto label_2	-- block#1 is visited secondly
    end
  end
  g_Menu.Config.ptr.P9_ButtonJobLU = function(r0_124, r1_124, r2_124, r3_124, r4_124)
    -- line: [6491, 6504] id: 124
    if 901 <= r1_124 and r1_124 <= 911 then
      if r0_124.TipsOldPage ~= r0_124.TipsPage then
        r0_124.TipsOldPage = r0_124.TipsPage
      end
      r0_124.TipsPage = r1_124 - 900
      cfunc.LegacyGame__lua_SetVariable(104, r0_124.TipsPage)
    end
    if 901 <= r1_124 and r1_124 <= 1000 then
      r0_124:Page9_SetActive()
    end
  end
  g_Menu.Config.ptr.TipsLayer = function(r0_125, r1_125, r2_125)
    -- line: [6507, 6521] id: 125
    local r3_125 = -1
    local r4_125 = -1
    if r1_125 == 4 then
      if r2_125 <= 7 then
        r3_125 = 71 - r2_125 - 1
        r4_125 = 62 - r2_125 - 1
      end
    else
      r3_125 = 143 - r2_125 - 1 - 24 * (r1_125 - 1)
      r4_125 = 132 - r2_125 - 1 - 24 * (r1_125 - 1)
    end
    return r3_125, r4_125
  end
  g_Menu.Config.ptr.TipsFlag = function(r0_126, r1_126, r2_126)
    -- line: [6524, 6594] id: 126
    local r3_126 = {
      TIPS_001 = 1080,
      TIPS_002 = 1081,
      TIPS_003 = 1082,
      TIPS_004 = 1083,
      TIPS_005 = 1084,
      TIPS_006 = 1085,
      TIPS_007 = 1086,
      TIPS_008 = 1087,
      TIPS_009 = 1088,
      TIPS_010 = 1089,
      TIPS_011 = 1090,
      TIPS_012 = 1091,
      TIPS_013 = 1092,
      TIPS_014 = 1093,
      TIPS_015 = 1094,
      TIPS_016 = 1095,
      TIPS_017 = 1096,
      TIPS_018 = 1097,
      TIPS_019 = 1098,
      TIPS_020 = 1099,
      TIPS_021 = 1100,
      TIPS_022 = 1101,
      TIPS_023 = 1102,
      TIPS_024 = 1103,
      TIPS_025 = 1104,
      TIPS_026 = 1105,
      TIPS_027 = 1106,
      TIPS_028 = 1107,
      TIPS_029 = 1108,
      TIPS_030 = 1109,
      TIPS_031 = 1110,
      TIPS_032 = 1111,
      TIPS_033 = 1112,
      TIPS_034 = 1113,
    }
    local r4_126 = {
      {
        r3_126.TIPS_001,
        r3_126.TIPS_002,
        r3_126.TIPS_003,
        r3_126.TIPS_004,
        r3_126.TIPS_005,
        r3_126.TIPS_007,
        r3_126.TIPS_006,
        r3_126.TIPS_008,
        r3_126.TIPS_009
      },
      {
        r3_126.TIPS_010,
        r3_126.TIPS_011,
        r3_126.TIPS_012,
        r3_126.TIPS_013,
        r3_126.TIPS_014,
        r3_126.TIPS_015,
        r3_126.TIPS_016,
        r3_126.TIPS_017,
        r3_126.TIPS_018
      },
      {
        r3_126.TIPS_019,
        r3_126.TIPS_020,
        r3_126.TIPS_021,
        r3_126.TIPS_022,
        r3_126.TIPS_023,
        r3_126.TIPS_024,
        r3_126.TIPS_025,
        r3_126.TIPS_026,
        r3_126.TIPS_027
      },
      {
        r3_126.TIPS_028,
        r3_126.TIPS_029,
        r3_126.TIPS_030,
        r3_126.TIPS_031,
        r3_126.TIPS_032,
        r3_126.TIPS_033,
        r3_126.TIPS_034,
        nil,
        nil
      }
    }
    local r5_126 = 0
    if r4_126[r1_126][r2_126] ~= nil then
      if cfunc.LegacyGame__lua_GetFlag(r4_126[r1_126][r2_126]) then
        r5_126 = 1
      else
        r5_126 = 0
      end
    else
      r5_126 = -1
    end
    return r5_126
  end
  g_Menu.Config.ptr.TipsPage = 1
  g_Menu.Config.ptr.TipsPageMax = 4
  g_Menu.Config.ptr.TipsOldPage = -1
  g_Menu.Config.ptr.initConfigP9 = function(r0_127, r1_127, r2_127)
    -- line: [6600, 6633] id: 127
    if r2_127 then
      local r3_127 = cclass.lua_Layers:create()
      r0_127.TipsPage = cfunc.LegacyGame__lua_GetVariable(104)
      local r4_127 = r0_127.TipsPage
      if r4_127 == 0 then
        r4_127 = 1 or r0_127.TipsPage
      else
        goto label_17	-- block#3 is visited secondly
      end
      r0_127.TipsPage = r4_127
      r3_127:initSubLayer("configBase", r1_127, 147, 1)
      r0_127.ButtonP9 = {}
      for r7_127 = 1, r0_127.TipsPageMax, 1 do
        local r8_127 = string.format("Page%d", r7_127)
        local r9_127 = 39 - r7_127 - 1
        r0_127:MenuButtonSet(r0_127.ButtonP9, r8_127, 1, r1_127, r9_127, r9_127, 13 - r7_127 - 1, 26 - r7_127 - 1, -1, 900 + r7_127, 0, 0)
      end
      r0_127.MenuButton:InitList()
      r0_127.MenuButton:SetList("ButtonP9", r0_127.ButtonP9)
      r0_127.MenuButton:InitButton()
    end
    r0_127:Page9_SetActive()
  end
  g_Menu.Config.ptr.deleteP9Th = function(r0_128)
    -- line: [6636, 6639] id: 128
    local r1_128 = cclass.lua_Layers:create()
  end
  g_Menu.Config.ptr.SelCursorP9 = function(r0_129, r1_129, r2_129, r3_129)
    -- line: [6642, 6658] id: 129
    if r1_129 == -1 then
    end
    for r7_129 = 1, 9, 1 do
      if r1_129 == string.format("TipsBase%d", r7_129) then
      end
    end
  end
  g_Menu.Config.ptr.effectP9Th = function(r0_130, r1_130, r2_130, r3_130, r4_130, r5_130)
    -- line: [6661, 6668] id: 130
    local r6_130 = cclass.lua_Layers:create()
    local r7_130 = getEffectRate()
    if r1_130 == true then
    end
  end
  g_Menu.Config.ptr.InitConfigNo = function(r0_131)
    -- line: [6673, 6680] id: 131
    r0_131:MenuLoadLayer("config_no", "sys_no.pna")
    local r1_131 = cclass.lua_Layers:create()
    for r5_131 = 0, 9, 1 do
      r1_131:initSubLayer("configBase", "config_no", r5_131, 0)
    end
    r1_131:initSubLayer("configBase", "config_no", 10, 0)
  end
  g_Menu.Config.ptr.PlaceCount = 0
  g_Menu.Config.ptr.DrawConfigNo = function(r0_132, r1_132, r2_132, r3_132)
    -- line: [6684, 6728] id: 132
    r0_132:DeleteConfigNo()
    local r4_132 = cclass.lua_Layers:create()
    r0_132.PlaceCount = 0
    local r5_132 = r1_132
    for r9_132 = 0, 9, 1 do
      r5_132 = math.floor(r5_132 / 10)
      r4_132:insertPNARefLayer("configBase", string.format("config_no%d", r9_132), "config_no", r5_132 % 10, 1)
      r0_132.PlaceCount = r0_132.PlaceCount + 1
      if r5_132 <= 0 then
        break
      end
    end
    r4_132:insertPNARefLayer("configBase", "config_perc", "config_no", 10, 1)
    local r7_132 = math.floor(r2_132 + math.floor((r0_132.PlaceCount + 1) * 10 / 2) - 10)
    local r8_132 = math.floor(r3_132)
    r4_132:setParam("configBase", "config_perc", LUA_PARAM_POS, r7_132, r8_132, 0, 0)
    r7_132 = r7_132 - 10
    for r12_132 = 0, r0_132.PlaceCount - 1, 1 do
      r4_132:setParam("configBase", string.format("config_no%d", r12_132), LUA_PARAM_POS, r7_132, r8_132, 0, 0)
      r7_132 = r7_132 - 10
    end
  end
  g_Menu.Config.ptr.DeleteConfigNo = function(r0_133)
    -- line: [6731, 6741] id: 133
    local r1_133 = cclass.lua_Layers:create()
    for r5_133 = 0, r0_133.PlaceCount - 1, 1 do
      r1_133:removeLayer("configBase", string.format("config_no%d", r5_133))
    end
    r1_133:removeLayer("configBase", "config_perc")
  end
  local r2_8 = "Sys_Config_Base.pna"
  if getUItype() == 1 then
    r2_8 = "sys_c_config_base.pna"
  end
  local r4_8 = g_Menu.Config.ptr:MenuInit("configBase01", r2_8)
  if res == false then
    return false
  end
  g_Menu.Config.ptr.JPatchFlag = getLangPatchFlag()
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
  local r10_8 = cclass.lua_Layers:create()
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
initDataOrder = function()
  -- line: [6822, 6871] id: 134
  local r0_134 = 0
  local r1_134 = 0
  for r5_134 = 1, 5, 1 do
    g_autoOrder[r5_134] = -1
  end
  r0_134, r1_134 = cfunc.CSaveDataManager__lua_FindNewData(2, r0_134, r1_134)
  if r0_134 == 2 then
    for r5_134 = 1, 5, 1 do
      g_autoOrder[r5_134] = r1_134
      if r1_134 > 0 then
        r1_134 = r1_134 - 1
      end
      if r1_134 < 1 then
        r1_134 = 5
        if r1_134 then
          r1_134 = r1_134
        end
      end
      if 0 < r1_134 and cfunc.CSaveDataManager__lua_IsData(2, r1_134) == false then
        r1_134 = -1
      end
    end
  end
  r0_134, r1_134 = cfunc.CSaveDataManager__lua_FindNewData(2, r0_134, r1_134)
  for r5_134 = 1, 5, 1 do
    g_quickOrder[r5_134] = -1
  end
  r0_134, r1_134 = cfunc.CSaveDataManager__lua_FindNewData(1, r0_134, r1_134)
  if r0_134 == 1 then
    for r5_134 = 1, 5, 1 do
      g_quickOrder[r5_134] = r1_134
      if r1_134 > 0 then
        r1_134 = r1_134 - 1
      end
      if r1_134 < 1 then
        r1_134 = 5
        if r1_134 then
          r1_134 = r1_134
        end
      end
      if 0 < r1_134 and cfunc.CSaveDataManager__lua_IsData(1, r1_134) == false then
        r1_134 = -1
      end
    end
  end
end
closeConfig = function()
  -- line: [6874, 6906] id: 135
  if g_Menu.Config.ptr == nil then
    return false
  end
  if g_sortData ~= nil then
    g_sortData:delete()
    g_sortData = nil
  end
  local r0_135 = cclass.lua_Layers:create()
  if g_menuExecute == true then
    r0_135:removeSnap("system")
    r0_135:rtSnap("system")
  else
    if g_CASTOFF then
      cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
    end
    r0_135:setForceBG(true)
    local r1_135 = getEffectRate()
    r0_135:setSnap("configBase", false)
    r0_135:startTransition("configBase", 0, 1, 500 * r1_135, 0, LUA_TRANSITION_ERASE)
  end
  g_Menu.Config.ptr.MenuInf.enabled = false
  g_Menu.Config.ptr.MenuInf.effect = true
  return true
end
defaultSetting = function()
  -- line: [6913, 7037] id: 136
  g_autospeed = 50
  g_msgspeed = 80
  g_messagealpha = 70
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
  for r3_136 = 1, #g_volume, 1 do
    if g_volume[r3_136].name == "bgm" then
      g_volume[r3_136].vol = 600
    elseif g_volume[r3_136].name == "se" then
      g_volume[r3_136].vol = 900
    else
      g_volume[r3_136].vol = 1000
    end
    g_volume[r3_136].mute = false
  end
  g_clickVoice = false
  g_enablePan = true
  g_bgvVoiceMute = true
  g_bgmCutPer = 75
  g_sysVoiceChar = 999
  g_gestureFunc[1] = 6
  g_gestureFunc[2] = 0
  g_gestureFunc[3] = 5
  g_gestureFunc[4] = 2
  g_gestureDisable = false
  changeMessageWindow(-1, true)
  if g_Menu.Config.ptr ~= nil then
    g_Menu.Config.ptr:setCfg2WindowAlpa()
  end
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:changeMessageWindowOpacity()
  end
  if g_menuExecute == false then
    local r0_136 = cclass.lua_Layers:create()
    r0_136:removeSnap("system")
    r0_136:setSnap("system", true)
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
  local r0_136 = ConfigGetPageKeyName(g_configPage)
  if g_Menu.Config.ptr ~= nil then
    g_Menu.Config.ptr:SetTestVoiceVol(g_volume[g_Menu.Config.ptr:getPersonalIndex()].vol)
    if g_configPage == 1 then
      if g_menuExecute == false then
        for r4_136, r5_136 in pairs(g_Menu.Config.ptr.PreviewList) do
          if r5_136 ~= nil then
            cfunc.LegacyGame__lua_NeedPreview("configBase", r5_136)
          end
        end
      end
      g_Menu.Config.ptr:updatePreviewSize(r0_136)
      g_Menu.Config.ptr:Page1_SetActive()
    elseif g_configPage == 2 then
      g_Menu.Config.ptr:setCfg2WindowAlpa()
      startCfg2Preview()
      g_Menu.Config.ptr:Page2_SetActive()
    elseif g_configPage == 3 then
      g_Menu.Config.ptr.selChar = 1
      g_Menu.Config.ptr:Page3_SetActive(r0_136)
    elseif g_configPage == 7 then
      g_Menu.Config.ptr:Page7_SetActive()
    end
    if g_menuExecute == false then
      local r1_136 = cclass.lua_Layers:create()
      if g_CASTOFF then
        cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
      end
      r1_136:setForceBG(true)
      g_P1Renew = 3
    end
  end
end
startCfg2Preview = function()
  -- line: [7039, 7096] id: 137
  local r0_137 = cclass.lua_Layers:create()
  local r1_137 = nil
  local r2_137 = nil
  r1_137, r2_137 = getConfigText()
  local r3_137 = getUItype()
  local r4_137 = g_fonts0.name
  local r5_137 = g_fontSize0.MsgSize
  local r6_137 = g_fontSize0.NameSize
  local r7_137 = g_exampleName0
  local r8_137 = g_exampleText0
  if r3_137 == 2 then
    r4_137 = g_fonts2.name
    r5_137 = g_fontSize2.MsgSize
    r6_137 = g_fontSize2.NameSize
    r7_137 = g_exampleName2
    r8_137 = g_exampleText2
  elseif getLangPatchFlag() and getAltLanguage() then
    r4_137 = g_fonts1.name
    r5_137 = g_fontSize1.MsgSize
    r6_137 = g_fontSize1.NameSize
    r7_137 = g_exampleName1
    r8_137 = g_exampleText1
  end
  local r9_137 = {
    [1] = g_message1Color,
    [2] = g_message2Color,
  }
  local r10_137 = {
    [1] = g_name1Color,
    [2] = g_name2Color,
  }
  r0_137:clearText("configBase", r1_137)
  r0_137:clearText("configBase", r2_137)
  r0_137:effectText("configBase", r1_137, r8_137, r4_137, r5_137, 1, 0, r9_137[g_messageWindowType + 1].normal, r9_137[g_messageWindowType + 1].normalEdge, 1, 1)
  r0_137:setText("configBase", r2_137, r7_137, r4_137, r6_137, 1, 0, r10_137[g_messageWindowType + 1].normal, r10_137[g_messageWindowType + 1].normalEdge, 1, 1)
  g_Menu.Config.ptr.autoModeTimer:reset()
  local r11_137 = ConfigGetPageKeyName(2)
  g_Menu.Config.ptr:StopClkWait()
end
updateNewIcon = function(r0_138, r1_138, r2_138)
  -- line: [7098, 7141] id: 138
  local r3_138 = cclass.lua_Layers:create()
  local r4_138 = 0
  local r5_138 = 0
  r4_138, r5_138 = cfunc.CSaveDataManager__lua_FindNewData(0, r4_138, r5_138)
  if 0 <= r4_138 and g_Menu.Config.ptr ~= nil then
    for r9_138 = 1, 10, 1 do
      r3_138:setSubLayerVisible("configBase", g_Menu.Config.ptr:DataOverName(r2_138, r9_138), 0, 0)
    end
    if r1_138 == g_DATAPAGEMAX and r4_138 == 1 then
      r3_138:setSubLayerVisible("configBase", g_Menu.Config.ptr:DataOverName(r2_138, 6), 0, 1)
      return 
    elseif r4_138 == 0 and math.floor((r5_138 - 1) / 10 + 1) == r1_138 then
      r3_138:setSubLayerVisible("configBase", g_Menu.Config.ptr:DataOverName(r2_138, (r5_138 - 1) % 10 + 1), 0, 1)
      return 
    end
  end
end
updateNewIconC = function(r0_139)
  -- line: [7147, 7165] id: 139
  local r1_139 = ConfigGetPageKeyName(g_configPage)
  local r2_139 = g_configPage
  if r2_139 == 4 then
    r2_139 = true or false
  else
    goto label_9	-- block#2 is visited secondly
  end
  updateNewIcon(r1_139, g_dataInfo.page, r2_139)
  if r0_139 == DATA_MODE_QUICK then
    playSystemVoice(0)
    playSystemVoice(SYSVOICE_QSAVE)
  elseif getSystemSet() == "configBase" and g_Menu.Config.ptr ~= nil then
    g_Menu.Config.ptr:SetConfigButtonActive(g_configPage)
  end
end
g_saveTextColor = {
  normal = 5153535,
  normalEdge = 4294967295,
  time = 5153535,
  timeEdge = 4294967295,
  No = 5153535,
  NoEdge = 4294967295,
  time2 = 5153535,
  timeEdge2 = 4294967295,
}
initThumbnail = function(r0_140, r1_140, r2_140)
  -- line: [7175, 7454] id: 140
  local r3_140 = getUItype()
  local r4_140 = true
  local r5_140 = r1_140 % 10
  if r5_140 == 0 then
    r5_140 = 10
    if r5_140 then
      r5_140 = r5_140
    end
  end
  if g_Menu.Config.ptr == nil then
    return 
  end
  local r6_140 = cclass.lua_Layers:create()
  local r7_140 = nil
  local r8_140 = nil
  local r12_140 = nil	-- notice: implicit variable refs by block#[14, 18, 30, 58, 70]
  if g_dataInfo.page == g_DATAPAGEMAX then
    if r5_140 < 6 and g_autoOrder[r5_140] > 0 then
      r8_140 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_AUTO, g_autoOrder[r5_140])
    elseif g_quickOrder[r5_140 - 5] > 0 then
      r12_140 = r5_140 - 5
      r8_140 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_QUICK, g_quickOrder[r12_140])
    end
  else
    r7_140 = (g_dataInfo.page - 1) * 10 + r5_140
    g_sortData:Insert(r7_140)
    r8_140 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_NORMAL, r7_140)
  end
  local r9_140 = getSaveThumbKey(r0_140, r5_140)
  local r10_140 = r6_140:insertThumbnailLayer("configBase", r9_140, r8_140, 1)
  local r11_140 = string.format("Data%d", r5_140)
  if r5_140 < 6 then
    r12_140 = 381
    if not r12_140 then
      ::label_88::
      r12_140 = 755
    end
  else
    goto label_88	-- block#13 is visited secondly
  end
  local r13_140 = 152 + 90 * (r5_140 - 1) % 5
  r6_140:setParam("configBase", r9_140, LUA_PARAM_POS, r12_140 + 7, r13_140 + 7, 0, 0)
  if r2_140 == true then
    r6_140:cancelEffect("configBase", r9_140, "Update")
    r6_140:setParam("configBase", r9_140, LUA_PARAM_SCALE, 1, 1, 1, 0)
    local r16_140 = getEffectRate()
    r6_140:setEffect("configBase", r9_140, "Update", LUA_EFFECT_SCALE, 0.08, 0.08, 0, 0, 0, 150 * r16_140, 0, 0)
    r6_140:setEffect("configBase", r9_140, "Update", LUA_EFFECT_SCALE, -0.08, -0.08, 0, 0, 0, 100 * r16_140, 0, 0)
    r6_140:startEffect("configBase", r9_140, "Update", 2)
  end
  local r16_140 = g_Menu.Config.ptr:DataOverName(r0_140, r5_140)
  r6_140:removeLayer("configBase", r16_140)
  local r17_140 = "sys_config_P4TH.pna"
  local r18_140 = getUItype()
  if r18_140 == 1 then
    r17_140 = "sys_c_config_P4TH.pna"
  end
  g_Menu.Config.ptr:MenuLoadLayer(r16_140, r17_140)
  r6_140:initSubLayer("configBase", r16_140, 0, 0)
  r6_140:setParam("configBase", r16_140, LUA_PARAM_POS, r12_140, r13_140, 0, 0)
  if false then
    if g_dataInfo.page == g_DATAPAGEMAX then
      local r19_140 = 0
      local r20_140 = 0
      local r21_140 = 0
      local r22_140 = 0
      if r5_140 < 6 then
        local r23_140 = {
          [1] = 40,
          [2] = 12 - r5_140,
          [3] = 24,
          [4] = 36,
        }
        local r24_140 = 12
        for r28_140, r29_140 in pairs(r23_140) do
          r6_140:initSubLayer("configBase", r16_140, r29_140, 1)
          r19_140, r20_140, r21_140, r22_140 = r6_140:getSubLayerParam("configBase", r16_140, r29_140, LUA_PARAM_POS, r19_140, r20_140, r21_140, r22_140)
          r6_140:setSubLayerParam("configBase", r16_140, r29_140, LUA_PARAM_POS, r19_140 + r24_140, r20_140, 0, 0)
        end
      else
        local r23_140 = {
          [1] = 39,
          [2] = 12 - r5_140 - 5,
          [3] = 24,
          [4] = 36,
        }
        local r24_140 = 15
        for r28_140, r29_140 in pairs(r23_140) do
          r6_140:initSubLayer("configBase", r16_140, r29_140, 1)
          r19_140, r20_140, r21_140, r22_140 = r6_140:getSubLayerParam("configBase", r16_140, r29_140, LUA_PARAM_POS, r19_140, r20_140, r21_140, r22_140)
          r6_140:setSubLayerParam("configBase", r16_140, r29_140, LUA_PARAM_POS, r19_140 + r24_140, r20_140, 0, 0)
        end
      end
    else
      r6_140:initSubLayer("configBase", r16_140, 38, 1)
      local r19_140 = (g_dataInfo.page - 1) * 10 + r5_140
      local r20_140 = {
        [1] = r19_140 % 10,
        [2] = math.floor(r19_140 / 10) % 10,
        [3] = math.floor(r19_140 / 100),
      }
      r6_140:initSubLayer("configBase", r16_140, 12 - r20_140[1], 1)
      r6_140:initSubLayer("configBase", r16_140, 24 - r20_140[2], 1)
      r6_140:initSubLayer("configBase", r16_140, 36 - r20_140[3], 1)
    end
  end
  local r19_140 = getSaveThumbTimeTxt(r0_140, r5_140)
  r6_140:insertTextLayer("configBase", r19_140, 180, 30, 2, 2, 14, 2, 0, 1)
  r6_140:setParam("configBase", r19_140, LUA_PARAM_POS, r12_140 + 190, r13_140 + 4, 0, 0)
  local r20_140 = ""
  local r21_140 = false
  if g_dataInfo.page == g_DATAPAGEMAX then
    if r5_140 < 6 then
      r20_140 = cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_AUTO, g_autoOrder[r5_140])
    else
      r20_140 = cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_QUICK, g_quickOrder[r5_140 - 5])
    end
    if size == true then
      r21_140 = true
    end
  else
    r20_140 = cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r5_140)
  end
  local r22_140 = g_Savefonts0.name
  local r23_140 = g_Savefonts0.timesize
  if r18_140 == 0 then
    r22_140 = g_Savefonts0.name
    r23_140 = g_Savefonts0.timesize
  end
  if r18_140 == 1 then
    r22_140 = g_Savefonts1.name
    r23_140 = g_Savefonts1.timesize
    r20_140 = SaveDataTimeTxt(r20_140)
  end
  if r18_140 == 2 then
    r22_140 = g_Savefonts2.name
    r23_140 = g_Savefonts2.timesize
    r20_140 = SaveDataTimeTxt(r20_140)
  end
  if r4_140 then
    if r10_140 == true and r21_140 == false then
      r6_140:setText("configBase", r19_140, r20_140, r22_140, r23_140, 0, 0, 5153535, 4294967295, 1, 1)
    else
      r6_140:setText("configBase", r19_140, r20_140, r22_140, r23_140, 0, 0, 2947526607, 4294967247, 1, 1)
    end
  elseif _save then
    r6_140:setText("configBase", r19_140, r20_140, r22_140, r23_140, 0, 0, g_saveTextColor.time, g_saveTextColor.timeEdge, 1, 1)
  else
    r6_140:setText("configBase", r19_140, r20_140, r22_140, r23_140, 0, 0, g_saveTextColor.time2, g_saveTextColor.timeEdge2, 1, 1)
  end
  if g_UseSaveNoTxt then
    if r18_140 == 0 then
      r23_140 = g_Savefonts0.nosize
    end
    if r18_140 == 1 then
      r23_140 = g_Savefonts1.nosize
    end
    if r18_140 == 2 then
      r23_140 = g_Savefonts2.nosize
    end
    local r24_140 = getSaveThumbNoTxt(r0_140, r5_140)
    r6_140:insertTextLayer("configBase", r24_140, 210, 30, 2, 2, 14, 2, 0, 1)
    r6_140:setParam("configBase", r24_140, LUA_PARAM_POS, r12_140 + 130, r13_140 + 4, 0, 0)
    r20_140 = SaveDataLabelTxt(g_dataInfo.page, r5_140)
    if r4_140 then
      if r10_140 == true and r21_140 == false then
        r6_140:setText("configBase", r24_140, r20_140, r22_140, r23_140, 0, 0, 5153535, 4294967295, 1, 1)
      else
        r6_140:setText("configBase", r24_140, r20_140, r22_140, r23_140, 0, 0, 2947526607, 4294967247, 1, 1)
      end
    else
      r6_140:setText("configBase", r24_140, r20_140, r22_140, r23_140, 0, 0, g_saveTextColor.No, g_saveTextColor.NoEdge, 1, 1)
    end
  end
  if r18_140 == 0 then
    r23_140 = g_Savefonts0.size
  end
  if r18_140 == 1 then
    r23_140 = g_Savefonts1.size
  end
  if r18_140 == 2 then
    r23_140 = g_Savefonts2.size
  end
  local r24_140 = getSaveThumbTxt(r0_140, r5_140)
  r6_140:insertTextLayer("configBase", r24_140, 200, 50, 2, 2, 14, 2, 0, 1)
  r6_140:setParam("configBase", r24_140, LUA_PARAM_POS, r12_140 + 130, r13_140 + 25, 0, 0)
  r20_140 = ""
  if g_dataInfo.page == g_DATAPAGEMAX then
    if r5_140 < 6 then
      r20_140 = cfunc.CSaveDataManager__lua_GetSaveDataText(DATA_MODE_AUTO, g_autoOrder[r5_140], getGameEngineVersion(), getAltLanguage(), 0)
      if #r20_140 == 0 then
        r20_140 = cfunc.CSaveDataManager__lua_GetSaveDataText(DATA_MODE_AUTO, g_autoOrder[r5_140], getGameEngineVersion(), getAltLanguage(), 1)
      end
    else
      r20_140 = cfunc.CSaveDataManager__lua_GetSaveDataText(DATA_MODE_QUICK, g_quickOrder[r5_140 - 5], getGameEngineVersion(), getAltLanguage(), 1)
    end
  else
    r20_140 = cfunc.CSaveDataManager__lua_GetSaveDataText(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r5_140, getGameEngineVersion(), getAltLanguage(), 1)
  end
  if r4_140 then
    if r10_140 == true and r21_140 == false then
      r6_140:setText("configBase", r24_140, r20_140, r22_140, r23_140, 0, 0, 5153535, 4294967295, 1, 1)
    else
      r6_140:setText("configBase", r24_140, r20_140, r22_140, r23_140, 0, 0, 2947526607, 4294967247, 1, 1)
    end
  else
    r6_140:setText("configBase", r24_140, r20_140, r22_140, r23_140, 0, 0, g_saveTextColor.normal, g_saveTextColor.normalEdge, 1, 1)
  end
end
