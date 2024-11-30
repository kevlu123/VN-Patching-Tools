-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
APP_INTERNAL_WIDTH = 1280
APP_INTERNAL_HEIGHT = 720
SELECT_WINDOW_PITCH = 18
SYSVOICE_STARTUP = 1
SYSVOICE_TITLECALL = 2
SYSVOICE_CONFIRMQUIT = 3
SYSVOICE_END = 4
SYSVOICE_CONFIRMQUICK = 5
SYSVOICE_CONFIRMLOAD = 6
SYSVOICE_QSAVE = 7
SYSVOICE_CONFIRMOVERWRITE = 8
SYSVOICE_CONFIRMDEFAULT = 9
SYSVOICE_CONFIRMGALLERY = 10
SYSVOICE_CONFIRMTITLE = 11
g_refreshCursor = false
g_menuExecute = false
g_messageInfo = {
  enabled = false,
  effect = false,
  wndCursor = -1,
  nameWindow = 1,
  msgWindow = 1,
}
g_selectInfo = {
  enabled = false,
  effect = false,
  count = 0,
  selCursor = -1,
  enable = {},
}
g_dialogInfo = {
  confirmDialog = 0,
  enabled = false,
  effect = false,
  selCursor = -1,
}
g_sysmenuInfo = {
  enabled = false,
  effect = false,
  selCursor = -1,
}
g_logInfo = {
  enabled = false,
  effect = false,
  selCursor = -1,
  selText = -1,
  repeatStart = -1,
  selLine = -1,
  iconCount = 0,
  scrollBar
}
g_configInfo = {
  enabled = false,
  effect = false,
  page = 0,
  selCursor = -1,
  pageEffect = false,
  beforePage = -1,
  toSysMenu = false,
}
g_luaMenuInfo = {
  enabled = false,
  effect = false,
  setName = "",
  selCursor = -1,
}
g_mixer = nil
g_cmdLineInfo = {
  enabled = false,
  effect = false,
}
g_buttons = {
  75,
  70,
  65,
  60,
  55,
  50,
  44,
  32,
  20,
  8
}
g_disable = {
  76,
  71,
  66,
  61,
  56,
  51,
  40,
  28,
  16,
  4
}
g_normal = {
  75,
  70,
  65,
  60,
  55,
  50,
  39,
  27,
  15,
  3
}
g_select = {
  74,
  69,
  64,
  59,
  54,
  49,
  38,
  26,
  14,
  2
}
g_disableBase = {
  45,
  33,
  21,
  9
}
g_normalBase = {
  44,
  32,
  20,
  8
}
g_selectBase = {
  43,
  31,
  19,
  7
}
g_novelBase = {
  73,
  77
}
g_all = {
  g_buttons,
  g_disable,
  g_normal,
  g_select,
  g_disableBase,
  g_selectBase,
  g_novelBase
}
g_selectTextColor = {
  normal = 5153535,
  normalEdge = 4294967295,
  already = 4294967295,
  alreadyEdge = 255,
  selected = 4294919423,
  selectedEdge = 3422604543,
  disabled = 3351758791,
  disabledEdge = 255,
}
g_namedisp = 0
g_windowID = 0
g_zoomMode = 0
g_screenMode = 0
g_autospeed = 0
g_msgspeed = 0
g_messagealpha = 70
g_allskip = false
g_selectReleaseSkip = false
g_selectReleaseAuto = false
g_effectSpeed = 0
g_drawSkipIcon = true
g_mouseAutoMove = true
g_skipConfirm = false
g_hideCursor = 0
g_deactiveMode = true
g_volume = {
  {
    name = "bgm",
    vol = 0,
    mute = false,
  },
  {
    name = "se",
    vol = 0,
    mute = false,
  },
  {
    name = "movie",
    vol = 0,
    mute = false,
  },
  {
    name = "char",
    vol = 0,
    mute = false,
  },
  {
    name = "charKOT",
    vol = 0,
    mute = false,
  },
  {
    name = "charAGE",
    vol = 0,
    mute = false,
  },
  {
    name = "charAMA",
    vol = 0,
    mute = false,
  },
  {
    name = "charASA",
    vol = 0,
    mute = false,
  },
  {
    name = "charYOR",
    vol = 0,
    mute = false,
  },
  {
    name = "charHIB",
    vol = 0,
    mute = false,
  },
  {
    name = "charHOT",
    vol = 0,
    mute = false,
  },
  {
    name = "charAKA",
    vol = 0,
    mute = false,
  },
  {
    name = "charKAN",
    vol = 0,
    mute = false,
  },
  {
    name = "charTAT",
    vol = 0,
    mute = false,
  },
  {
    name = "charMAS",
    vol = 0,
    mute = false,
  },
  {
    name = "charISU",
    vol = 0,
    mute = false,
  },
  {
    name = "charHRK",
    vol = 0,
    mute = false,
  },
  {
    name = "charHRM",
    vol = 0,
    mute = false,
  },
  {
    name = "charHAT",
    vol = 0,
    mute = false,
  },
  {
    name = "charOtherM",
    vol = 0,
    mute = false,
  },
  {
    name = "charOtherF",
    vol = 0,
    mute = false,
  },
  nil
}
g_clickVoice = true
g_enablePan = true
g_bgvVoiceMute = true
g_gestureFunc = {
  6,
  0,
  5,
  2
}
g_bgmCutPer = 75
g_messageWindowType = 0
g_sysVoiceChar = 999
g_charKeys = {
  "charKOT",
  "charAGE",
  "charAMA",
  "charASA",
  "charYOR",
  "charHIB",
  "charHOT",
  "charAKA",
  "charKAN",
  "charTAT",
  "charMAS",
  "charISU",
  "charHRK",
  "charHRM",
  "charHAT"
}
g_charKeysOtherM = {
  "charMOB01",
  "charMOB02",
  "charMOB03",
  "charMOB04",
  "charMOB05",
  "charMOB06"
}
g_charKeysOtherF = {
  "charYUK",
  "charSAN",
  "charRYO",
  "charMOB07",
  "charMOB08",
  "charMOB09"
}
function getGameEngineVersion()
  -- line: [123, 125] id: 1
  return 1.05
end
function resetGame()
  -- line: [128, 156] id: 2
  local r0_2 = cclass.lua_Layers:create()
  stopClickWaitAnimation()
  if g_messageInfo.effect == true then
    r0_2:cancelEffect("system", "Msg01", "WndDisp")
    r0_2:cancelEffect("system", "Txt01", "WndDisp")
    g_messageInfo.effect = false
  end
  nameWindowVisible(false)
  r0_2:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 0)
  r0_2:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
  if g_selectInfo.enabled == true or g_selectInfo.effect == true then
    local r1_2 = cclass.CLegacyFontInfo:create()
    for r5_2 = 1, g_selectInfo.count, 1 do
      local r6_2 = "SelWnd" .. tostring(r5_2)
      local r7_2 = "SelTxt" .. tostring(r5_2)
      r1_2:remove("system", r7_2)
      r0_2:removeLayer("system", r6_2)
      r0_2:removeLayer("system", r7_2)
    end
    g_selectInfo.enabled = false
    g_selectInfo.effect = false
  end
  resetSkipIcon()
  return true
end
function resetSkipIcon()
  -- line: [159, 166] id: 3
  g_buttonEffect.skip = false
  g_buttonEffect.auto = false
  local r0_3 = cclass.lua_Layers:create()
  r0_3:setVisible("system", "Skip01", 0)
  r0_3:setVisible("system", "Auto01", 0)
  return true
end
function initLegacyGame(r0_4)
  -- line: [169, 331] id: 4
  -- notice: unreachable block#11
  -- notice: unreachable block#41
  -- notice: unreachable block#71
  -- notice: unreachable block#78
  -- notice: unreachable block#85
  -- notice: unreachable block#18
  -- notice: unreachable block#34
  -- notice: unreachable block#57
  -- notice: unreachable block#25
  -- notice: unreachable block#92
  -- notice: unreachable block#48
  local r2_4 = cclass.lua_Registry:new(r0_4)
  g_screenMode = r2_4:GetDWORD("ScreenMode")
  g_zoomMode = r2_4:GetDWORD("KeepAspectRatio")
  local r1_4 = r2_4:IsKeyDWORD("messageSpeed")
  g_msgspeed = r2_4:GetDWORD("messageSpeed")
  if r1_4 == false then
    g_msgspeed = 80
  end
  r1_4 = r2_4:IsKeyDWORD("messageAlpha")
  g_messagealpha = r2_4:GetDWORD("messageAlpha")
  if r1_4 == false then
    g_messagealpha = 70
  end
  r1_4 = r2_4:IsKeyDWORD("autoSpeed")
  g_autospeed = r2_4:GetDWORD("autoSpeed")
  if r1_4 == false then
    g_autospeed = 50
  end
  local r3_4 = 0
  r1_4 = r2_4:IsKeyDWORD("allSkip")
  local r4_4 = r2_4:GetDWORD("allSkip")
  r3_4 = r4_4
  if r1_4 == false then
    r3_4 = 0
  end
  if r3_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_allskip = r4_4
  r1_4 = r2_4:IsKeyDWORD("selectReleaseSkip")
  r4_4 = r2_4:GetDWORD("selectReleaseSkip")
  r3_4 = r4_4
  if r1_4 == false then
    r3_4 = 0
  end
  if r3_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_selectReleaseSkip = r4_4
  r1_4 = r2_4:IsKeyDWORD("selectReleaseAuto")
  r4_4 = r2_4:GetDWORD("selectReleaseAuto")
  r3_4 = r4_4
  if r1_4 == false then
    r3_4 = 0
  end
  if r3_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_selectReleaseAuto = r4_4
  r1_4 = r2_4:IsKeyDWORD("effectSpeed")
  g_effectSpeed = r2_4:GetDWORD("effectSpeed")
  if r1_4 == false then
    g_effectSpeed = 0
  end
  r1_4 = r2_4:IsKeyDWORD("drawSkipIcon")
  r4_4 = r2_4:GetDWORD("drawSkipIcon")
  r3_4 = r4_4
  if r1_4 == false then
    r3_4 = 1
  end
  if r3_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_drawSkipIcon = r4_4
  r1_4 = r2_4:IsKeyDWORD("mouseAutoMove")
  r4_4 = r2_4:GetDWORD("mouseAutoMove")
  r3_4 = r4_4
  if r1_4 == false then
    r3_4 = 1
  end
  if r3_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_mouseAutoMove = r4_4
  r1_4 = r2_4:IsKeyDWORD("skipConfirm")
  r4_4 = r2_4:GetDWORD("skipConfirm")
  r3_4 = r4_4
  if r1_4 == false then
    r3_4 = 0
  end
  if r3_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_skipConfirm = r4_4
  r1_4 = r2_4:IsKeyDWORD("hideCursor")
  g_hideCursor = r2_4:GetDWORD("hideCursor")
  if r1_4 == false then
    g_hideCursor = 0
  end
  r1_4 = r2_4:IsKeyDWORD("deactiveMode")
  r4_4 = r2_4:GetDWORD("deactiveMode")
  r3_4 = r4_4
  if r1_4 == false then
    r3_4 = 1
  end
  if r3_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_deactiveMode = r4_4
  for r7_4, r8_4 in pairs(g_volume) do
    r1_4 = r2_4:IsKeyDWORD(r8_4.name .. "Volume")
    r8_4.vol = r2_4:GetDWORD(r8_4.name .. "Volume")
    if r1_4 == false then
      if r8_4.name == "bgm" then
        r8_4.vol = 600
      elseif r8_4.name == "se" then
        r8_4.vol = 900
      else
        r8_4.vol = 1000
      end
    end
    r1_4 = r2_4:IsKeyDWORD(r8_4.name .. "Mute")
    local r9_4 = r2_4:GetDWORD(r8_4.name .. "Mute")
    r3_4 = r9_4
    if r1_4 == false then
      r3_4 = 0
    end
    if r3_4 == 1 then
      r9_4 = true
    else
      r9_4 = false
    end
    r8_4.mute = r9_4
  end
  r1_4 = r2_4:IsKeyDWORD("clickVoice")
  r4_4 = r2_4:GetDWORD("clickVoice")
  if r4_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_clickVoice = r4_4
  if r1_4 == false then
    g_clickVoice = false
  end
  r1_4 = r2_4:IsKeyDWORD("enablePan")
  r4_4 = r2_4:GetDWORD("enablePan")
  if r4_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_enablePan = r4_4
  if r1_4 == false then
    g_enablePan = true
  end
  r1_4 = r2_4:IsKeyDWORD("bgvVoiceMute")
  r4_4 = r2_4:GetDWORD("bgvVoiceMute")
  if r4_4 == 1 then
    r4_4 = true
  else
    r4_4 = false
  end
  g_bgvVoiceMute = r4_4
  if r1_4 == false then
    g_bgvVoiceMute = true
  end
  for r7_4 = 1, #g_gestureFunc, 1 do
    if r2_4:IsKeyDWORD("gesture" .. tostring(r7_4)) == true then
      g_gestureFunc[r7_4] = r2_4:GetDWORD("gesture" .. tostring(r7_4))
    end
  end
  r1_4 = r2_4:IsKeyDWORD("bgmCutPer")
  g_bgmCutPer = r2_4:GetDWORD("bgmCutPer")
  if r1_4 == false then
    g_bgmCutPer = 75
  end
  r1_4 = r2_4:IsKeyDWORD("messageWindowType")
  g_messageWindowType = r2_4:GetDWORD("messageWindowType")
  if r1_4 == false then
    g_messageWindowType = 0
  end
  r1_4 = r2_4:IsKeyDWORD("sysVoiceChar")
  g_sysVoiceChar = r2_4:GetDWORD("sysVoiceChar")
  if r1_4 == false then
    g_sysVoiceChar = 999
  end
  r2_4:delete()
  g_mixer = cclass.lua_Mixer:new()
  math.randomseed(os.time())
  r4_4 = cclass.CLegacyFontInfo:create()
  return true
end
function finalizeLegacyGame(r0_5)
  -- line: [334, 397] id: 5
  local r1_5 = cclass.lua_Registry:new(r0_5)
  r1_5:SetDWORD("messageSpeed", g_msgspeed)
  r1_5:SetDWORD("messageAlpha", g_messagealpha)
  r1_5:SetDWORD("autoSpeed", g_autospeed)
  local r2_5 = 0
  if g_allskip == true then
    r2_5 = 1 or 0
  else
    goto label_24	-- block#2 is visited secondly
  end
  r1_5:SetDWORD("allSkip", r2_5)
  if g_selectReleaseSkip == true then
    r2_5 = 1 or 0
  else
    goto label_35	-- block#5 is visited secondly
  end
  r1_5:SetDWORD("selectReleaseSkip", r2_5)
  if g_selectReleaseAuto == true then
    r2_5 = 1 or 0
  else
    goto label_46	-- block#8 is visited secondly
  end
  r1_5:SetDWORD("selectReleaseAuto", r2_5)
  r1_5:SetDWORD("effectSpeed", g_effectSpeed)
  if g_drawSkipIcon == true then
    r2_5 = 1 or 0
  else
    goto label_61	-- block#11 is visited secondly
  end
  r1_5:SetDWORD("drawSkipIcon", r2_5)
  if g_mouseAutoMove == true then
    r2_5 = 1 or 0
  else
    goto label_72	-- block#14 is visited secondly
  end
  r1_5:SetDWORD("mouseAutoMove", r2_5)
  if g_skipConfirm == true then
    r2_5 = 1 or 0
  else
    goto label_83	-- block#17 is visited secondly
  end
  r1_5:SetDWORD("skipConfirm", r2_5)
  r1_5:SetDWORD("hideCursor", g_hideCursor)
  if g_deactiveMode == true then
    r2_5 = 1 or 0
  else
    goto label_98	-- block#20 is visited secondly
  end
  r1_5:SetDWORD("deactiveMode", r2_5)
  for r6_5, r7_5 in pairs(g_volume) do
    r1_5:SetDWORD(r7_5.name .. "Volume", r7_5.vol)
    if r7_5.mute == true then
      r2_5 = 1 or 0
    else
      goto label_119	-- block#24 is visited secondly
    end
    r1_5:SetDWORD(r7_5.name .. "Mute", r2_5)
  end
  if g_clickVoice == true then
    r2_5 = 1 or 0
  else
    goto label_134	-- block#29 is visited secondly
  end
  r1_5:SetDWORD("clickVoice", r2_5)
  if g_enablePan == true then
    r2_5 = 1 or 0
  else
    goto label_145	-- block#32 is visited secondly
  end
  r1_5:SetDWORD("enablePan", r2_5)
  if g_bgvVoiceMute == true then
    r2_5 = 1 or 0
  else
    goto label_156	-- block#35 is visited secondly
  end
  r1_5:SetDWORD("bgvVoiceMute", r2_5)
  for r6_5 = 1, #g_gestureFunc, 1 do
    r1_5:SetDWORD("gesture" .. tostring(r6_5), g_gestureFunc[r6_5])
  end
  r1_5:SetDWORD("bgmCutPer", g_bgmCutPer)
  r1_5:SetDWORD("messageWindowType", g_messageWindowType)
  r1_5:SetDWORD("sysVoiceChar", g_sysVoiceChar)
  g_mixer:delete()
  r1_5:delete()
end
function screenChangeNotification()
  -- line: [399, 407] id: 6
  local r0_6 = g_screenMode
  if r0_6 == 0 then
    r0_6 = 1 or 0
  else
    goto label_6	-- block#2 is visited secondly
  end
  g_screenMode = r0_6
  if getSystemSet() == "configBase" and g_configInfo.page == 1 then
    initConfigP1("ConfigPage" .. tostring(g_configInfo.page), false)
  end
end
function aspectChangeNotification(r0_7)
  -- line: [409, 417] id: 7
  g_zoomMode = r0_7
  if getSystemSet() == "configBase" and g_configInfo.page == 1 then
    initConfigP1("ConfigPage" .. tostring(g_configInfo.page), false)
  end
end
function changeMessageColor()
  -- line: [419, 423] id: 8
  local r0_8 = cclass.lua_Layers:create()
  r0_8:updateTextColor("system", "Txt01")
  r0_8:updateTextColor("system", "Name01")
end
function changeMessageWindow(r0_9, r1_9)
  -- line: [425, 525] id: 9
  local r2_9 = g_windowID
  if r2_9 == r0_9 then
    if r0_9 == -1 then
      r2_9 = r1_9 == true
    else
      goto label_7	-- block#3 is visited secondly
    end
    if r2_9 == false then
      return true
    end
  end
  r2_9 = cclass.lua_Layers:create()
  local r3_9 = r2_9:getAnimationState("system", "Clk01", "\x83N\x83\x8a\x83b\x83N\x91҂\xbf")
  local r4_9 = r0_9
  if r4_9 == -1 then
    r4_9 = g_messageWindowType
  end
  local r5_9 = nil
  if r4_9 == 1 then
    r5_9 = "Sys_MessageWindow_S.pna"
  elseif r4_9 == 2 then
    r5_9 = "Sys_MessageWindow_N.pna"
  else
    r5_9 = "Sys_MessageWindow.pna"
  end
  local r6_9 = getGraphicsArcFileName("system", r5_9)
  if r2_9:insertLayer("system", "Msg01", LUA_LAYER_PNA, r6_9, r5_9, 1) == false then
    return false
  end
  local r8_9 = {
    78
  }
  local r9_9 = g_messagealpha / 100
  for r13_9, r14_9 in pairs(r8_9) do
    r2_9:initSubLayer("system", "Msg01", r14_9, 1)
    r2_9:setSubLayerParam("system", "Msg01", r14_9, LUA_PARAM_COLOR, 1, 1, 1, r9_9)
  end
  for r13_9, r14_9 in pairs(g_all) do
    for r18_9, r19_9 in pairs(r14_9) do
      r2_9:initSubLayer("system", "Msg01", r19_9, 1)
    end
  end
  if r1_9 == false then
    if r4_9 == 2 then
      r2_9:insertTextLayer("system", "Txt01", 744, 684, 4, 36, 24, 1, 0.25, 1)
    else
      r2_9:insertTextLayer("system", "Txt01", 744, 125, 4, 0, 24, 1, 0.25, 1)
    end
  end
  if r4_9 == 2 then
    r2_9:setParam("system", "Msg01", LUA_PARAM_POS, 0, 0, 0, 0)
    r2_9:setParam("system", "Txt01", LUA_PARAM_POS, 280, 0, 0, 0)
  else
    r2_9:setParam("system", "Msg01", LUA_PARAM_POS, 0, 558, 0, 0)
    r2_9:setParam("system", "Txt01", LUA_PARAM_POS, 280, 598, 0, 0)
  end
  if r1_9 == false then
    r2_9:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
  end
  local r10_9 = cclass.CLegacyFontInfo:create()
  if r4_9 == 1 or r4_9 == 2 then
    r2_9:insertLayer("system", "Clk01", LUA_LAYER_PNA, r6_9, "Sys_ClickWait_S.pna", 1)
    r2_9:setSubLayerParam("system", "Skip01", 6, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r2_9:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r10_9:changeColor("system", "Txt01", 4294967295, 8438527)
    r10_9:changeColor("system", "Name01", 4294967295, 8438527)
  else
    r2_9:insertLayer("system", "Clk01", LUA_LAYER_PNA, r6_9, "Sys_ClickWait.pna", 1)
    r2_9:setSubLayerParam("system", "Skip01", 6, LUA_PARAM_COLOR, 1, 1, 1, 1)
    r2_9:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_COLOR, 1, 1, 1, 1)
    r10_9:changeColor("system", "Txt01", 5153535, 4294967295)
    r10_9:changeColor("system", "Name01", 5153535, 4294967295)
  end
  for r14_9 = 1, 15, 1 do
    r2_9:setAnimation("system", "Clk01", "\x83N\x83\x8a\x83b\x83N\x91҂\xbf", 15 - r14_9, 0.06666666666666667 * (r14_9 - 1), 0)
  end
  if r1_9 == true then
    r2_9:updateTextColor("system", "Txt01")
    r2_9:updateTextColor("system", "Name01")
    if r3_9 == true then
      startClickWaitAnimation()
    end
    if g_messageInfo.enabled == true then
      openMessageWindowWoEffect()
    else
      resetMessageWindow(false)
    end
  else
    resetMessageWindow(false)
  end
  g_windowID = r0_9
  return true
end
function getMessageWindowID()
  -- line: [527, 529] id: 10
  return g_windowID
end
function isUseNameWindow()
  -- line: [531, 536] id: 11
  if g_windowID == 2 then
    return false
  end
  return true
end
function initSystemScreen()
  -- line: [539, 590] id: 12
  local r0_12 = cclass.lua_Layers:create()
  if r0_12:add("system") == false then
    return false
  end
  local r2_12 = g_messageWindowType
  changeMessageWindow(-1, false)
  resetMessageWindow(false)
  r0_12:insertTextLayer("system", "Name01", 460, 33, 1, 4, 1, 1, 0, 0)
  r0_12:setParam("system", "Name01", LUA_PARAM_COLOR, 1, 1, 1, 1)
  local r3_12 = getGraphicsArcFileName("system", "Sys_ClickWait.pna")
  r0_12:insertLayer("system", "Skip01", LUA_LAYER_PNA, r3_12, "Sys_Skip.pna", 0)
  r0_12:setParam("system", "Skip01", LUA_PARAM_POS, 34, 644, 0, 0)
  for r8_12, r9_12 in pairs({
    1,
    2,
    3,
    4,
    5,
    6
  }) do
    r0_12:initSubLayer("system", "Skip01", r9_12, 1)
  end
  r0_12:insertLayer("system", "Auto01", LUA_LAYER_PNA, r3_12, "Sys_Auto.pna", 0)
  for r9_12, r10_12 in pairs({
    1,
    2,
    3,
    4
  }) do
    r0_12:initSubLayer("system", "Auto01", r10_12, 1)
  end
  r0_12:setParam("system", "Auto01", LUA_PARAM_POS, 34, 560, 0, 0)
  if r2_12 == 1 then
    r0_12:setSubLayerParam("system", "Skip01", 6, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r0_12:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_COLOR, 1, 1, 1, 0)
  else
    r0_12:setSubLayerParam("system", "Skip01", 6, LUA_PARAM_COLOR, 1, 1, 1, 1)
    r0_12:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_COLOR, 1, 1, 1, 1)
  end
  updateSkipAutoIcon()
  local r6_12 = 0
  local r7_12 = 0
  r6_12, r7_12, r8_12, r9_12 = r0_12:getParam("system", "Msg01", LUA_PARAM_POS, r6_12, r7_12, 0, 0)
  r0_12:setParam("system", "Name01", LUA_PARAM_POS, r6_12 + 226, r7_12 + 5, 0, 0)
  r0_12:add("overlay")
  r0_12:setOverlaySet("overlay")
  r0_12:insertLayer("overlay", "Arrow", LUA_LAYER_PNA, getGraphicsArcFileName("overlay", "Sys_Arrow.pna"), "Sys_Arrow.pna", 0)
  r0_12:setParam("overlay", "Arrow", LUA_PARAM_POS, 603, 360, 0, 0)
  for r14_12 = 0, 16, 1 do
    r0_12:initSubLayer("overlay", "Arrow", r14_12, 0)
  end
  return true
end
function checkOverlayFunction(r0_13)
  -- line: [592, 682] id: 13
  if r0_13 == 0 then
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) == false then
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
        return false
      end
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        return false
      end
      if isMessageWindowEffect() then
        return false
      end
    end
    return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLESKIP)
  elseif r0_13 == 1 then
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) == false and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
      return false
    end
    return true
  elseif r0_13 ~= 10 and r0_13 ~= 11 then
    if r0_13 == 12 then
      if isMessageWindowEffect() then
        return false
      end
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) then
        return false
      end
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
        return false
      end
    else
      if isMessageWindowEffect() then
        return false
      end
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) then
        return false
      end
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        return false
      end
      if (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) == true) and g_selectInfo.enabled == false then
        return false
      end
      if r0_13 == 3 then
        return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOG)
      elseif r0_13 == 6 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLEQLOAD) == false) then
        return false
      elseif r0_13 == 5 and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        return false
      elseif r0_13 == 8 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false) then
        return false
      elseif r0_13 == 7 and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        return false
      elseif r0_13 == 13 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLESELECTLOAD) == false) then
        return false
      end
    end
  end
  return true
end
function updateOverlay(r0_14, r1_14)
  -- line: [684, 707] id: 14
  if getSystemSet() ~= "system" then
    r1_14 = false
  end
  local r3_14 = cclass.lua_Layers:create()
  if r1_14 == false then
    r3_14:setVisible("overlay", "Arrow", 0)
  else
    local r4_14 = g_gestureFunc[r0_14 + 1]
    for r8_14 = 0, 15, 1 do
      local r9_14 = nil	-- notice: implicit variable refs by block#[8]
      if r8_14 == r4_14 then
        r9_14 = 1
        if not r9_14 then
          ::label_29::
          r9_14 = 0
        end
      else
        goto label_29	-- block#7 is visited secondly
      end
      r3_14:setSubLayerVisible("overlay", "Arrow", 16 - r8_14, r9_14)
    end
    local r6_14 = nil	-- notice: implicit variable refs by block#[13]
    if checkOverlayFunction(r4_14) == true then
      r6_14 = 0
      if not r6_14 then
        ::label_45::
        r6_14 = 1
      end
    else
      goto label_45	-- block#12 is visited secondly
    end
    r3_14:setSubLayerVisible("overlay", "Arrow", 0, r6_14)
    r3_14:setVisible("overlay", "Arrow", 1)
  end
end
function getSystemSet()
  -- line: [709, 737] id: 15
  if g_dialogInfo.confirmDialog > 0 then
    return "dialog"
  elseif g_sysmenuInfo.enabled == true or g_sysmenuInfo.effect == true then
    return "sysmenu"
  elseif g_logInfo.enabled == true or g_logInfo.effect == true then
    return "messageLog"
  elseif g_configInfo.enabled == true or g_configInfo.effect == true then
    return "configBase"
  elseif g_cmdLineInfo.enabled == true or g_cmdLineInfo.effect == true then
    return "cmdLine"
  elseif g_luaMenuInfo.enabled == true or g_luaMenuInfo.effect == true then
    return g_luaMenuInfo.setName
  elseif g_TitleMenu ~= nil and g_TitleMenu:GetMenuActive() == true then
    return g_TitleMenu.MenuInf.SetName
  elseif g_GalleryMenu ~= nil and g_GalleryMenu:GetMenuActive() == true then
    return g_GalleryMenu.MenuInf.SetName
  elseif g_CgBrowser ~= nil and g_CgBrowser:GetMenuActive() == true then
    return g_CgBrowser.MenuInf.SetName
  elseif g_AfterMenu ~= nil and g_AfterMenu:GetMenuActive() == true then
    return g_AfterMenu.MenuInf.SetName
  elseif g_StoryMenu ~= nil and g_StoryMenu:GetMenuActive() == true then
    return g_StoryMenu.MenuInf.SetName
  end
  return "system"
end
function getMessageWindowKey(r0_16)
  -- line: [739, 741] id: 16
  return "system", "Txt01"
end
function getNameWindowKey(r0_17)
  -- line: [743, 746] id: 17
  g_messageInfo.nameWindow = 1
  return "system", "Name01"
end
function getMessageWindowState()
  -- line: [748, 752] id: 18
  if g_messageInfo.nameWindow == 1 then
    return g_namedisp, g_messageInfo.nameWindow, g_messageInfo.msgWindow, "system", "Name01"
  end
end
function setMessageWindowState(r0_19, r1_19)
  -- line: [754, 757] id: 19
  g_messageInfo.nameWindow = r0_19
  g_messageInfo.msgWindow = r1_19
end
function changeMessageWindowOpacity(r0_20)
  -- line: [759, 769] id: 20
  local r1_20 = cclass.lua_Layers:create()
  local r2_20 = g_messagealpha / 100
  r1_20:setSubLayerParam("configBase", r0_20, 74, LUA_PARAM_COLOR, 1, 1, 1, r2_20)
  for r7_20, r8_20 in pairs({
    78
  }) do
    r1_20:initSubLayer("system", "Msg01", r8_20, 1)
    r1_20:setSubLayerParam("system", "Msg01", r8_20, LUA_PARAM_COLOR, 1, 1, 1, r2_20)
  end
end
function nameWindowVisible(r0_21)
  -- line: [771, 790] id: 21
  local r1_21 = cclass.lua_Layers:create()
  local r2_21 = 0
  if r0_21 then
    r2_21 = 1
  end
  local r4_21 = nil	-- notice: implicit variable refs by block#[8]
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
    r4_21 = 1
    if not r4_21 then
      ::label_17::
      r4_21 = LUA_SKIPSPEED_NONE
    end
  else
    goto label_17	-- block#4 is visited secondly
  end
  if g_messageInfo.nameWindow == 1 then
    r1_21:setVisible("system", "Name01", r2_21)
    if g_messageInfo.effect == true and r2_21 == 1 then
      local r5_21 = 1
      r1_21:setParam("system", "Name01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_21:setEffect("system", "Name01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, r5_21, 0, 300 * r4_21, 0, 0)
      r1_21:startEffect("system", "Name01", "WndDisp", 0)
    end
  end
  g_namedisp = r2_21
end
function openMessageWindowWoEffect()
  -- line: [792, 827] id: 22
  local r0_22 = cclass.lua_Layers:create()
  for r4_22, r5_22 in pairs(g_all) do
    for r9_22, r10_22 in pairs(r5_22) do
      r0_22:setSubLayerParam("system", "Msg01", r10_22, LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
  local r1_22 = g_messagealpha / 100
  for r5_22 = 1, #g_normal, 1 do
    local r6_22 = nil
    local r7_22 = nil
    if checkMessageFocus(g_buttons[r5_22], true) == true then
      r6_22 = g_normal[r5_22]
      if r5_22 > 6 then
        r7_22 = g_normalBase[r5_22 - 6]
      end
    else
      r6_22 = g_disable[r5_22]
      if r5_22 > 6 then
        r7_22 = g_disableBase[r5_22 - 6]
      end
    end
    r0_22:setSubLayerParam("system", "Msg01", r6_22, LUA_PARAM_COLOR, 1, 1, 1, 1)
    if r5_22 > 6 then
      r0_22:setSubLayerParam("system", "Msg01", r7_22, LUA_PARAM_COLOR, 1, 1, 1, 1)
    end
  end
  for r5_22, r6_22 in pairs(g_buttons) do
    r0_22:setSubLayerHitTest("system", "Msg01", r6_22, 1, 0)
  end
  setButtonState()
end
function openMessageWindow()
  -- line: [829, 905] id: 23
  local r0_23 = nil	-- notice: implicit variable refs by block#[13]
  if g_windowID >= 0 then
    r0_23 = g_windowID
  elseif g_messageWindowType == 1 then
    r0_23 = 1
    if r0_23 then
      ::label_11::
      r0_23 = 0
    end
  else
    goto label_11	-- block#4 is visited secondly
  end
  local r1_23 = cclass.lua_Layers:create()
  local r3_23 = g_all
  for r5_23, r6_23 in pairs(r3_23) do
    for r10_23, r11_23 in pairs(r6_23) do
      r1_23:setSubLayerParam("system", "Msg01", r11_23, LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
    r3_23 = 1 or LUA_SKIPSPEED_NONE
  else
    goto label_47	-- block#12 is visited secondly
  end
  r1_23:setEffect("system", "Msg01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 200 * r3_23, 0, 0)
  r1_23:setEffect("system", "Txt01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 200 * r3_23, 0, 0)
  r1_23:setEffect("system", "MsgFace", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 200 * r3_23, 0, 0)
  r1_23:startEffect("system", "Msg01", "WndDisp", 0)
  r1_23:startEffect("system", "Txt01", "WndDisp", 0)
  r1_23:startEffect("system", "MsgFace", "WndDisp", 0)
  if r0_23 == 1 then
    r3_23 = LUA_SKIPSPEED_NONE
    if r3_23 then
      r3_23 = r3_23
    end
  end
  local r4_23 = g_messagealpha / 100
  for r8_23 = 1, #g_normal, 1 do
    local r9_23 = nil
    local r10_23 = nil
    if checkMessageFocus(g_buttons[r8_23], true) == true then
      r9_23 = g_normal[r8_23]
      if r8_23 > 6 then
        r10_23 = g_normalBase[r8_23 - 6]
      end
    else
      r9_23 = g_disable[r8_23]
      if r8_23 > 6 then
        r10_23 = g_disableBase[r8_23 - 6]
      end
    end
    r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", r9_23, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 200 * r3_23, 0, 100 * r3_23)
    r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", r9_23, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 200 * r3_23, 0, 100 * r3_23)
    r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", r9_23, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 100 * r3_23, 0, 0)
    r1_23:startSubLayerEffect("system", "Msg01", "WndDisp", r9_23, 0)
    if r8_23 > 6 then
      r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", r10_23, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 200 * r3_23, 0, 100 * r3_23)
      r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", r10_23, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 200 * r3_23, 0, 100 * r3_23)
      r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", r10_23, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 100 * r3_23, 0, 0)
      r1_23:startSubLayerEffect("system", "Msg01", "WndDisp", r10_23, 0)
    end
  end
  if g_windowID ~= 2 then
    r1_23:setSubLayerParam("system", "Msg01", 78, LUA_PARAM_ROTATE, 0, 90, 0, 0)
    r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", 78, LUA_EFFECT_ROTATE, 0, -90, 0, 0, EFFECT_EASEIN, 150 * r3_23, 0, 0)
    r1_23:startSubLayerEffect("system", "Msg01", "WndDisp", 78, 0)
  else
    r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", g_novelBase[2], LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r3_23, 0, 0)
    r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", g_novelBase[2], LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 200 * r3_23, 0, 0)
    r1_23:setSubLayerEffect("system", "Msg01", "WndDisp", g_novelBase[2], LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 100 * r3_23, 0, 0)
    r1_23:startSubLayerEffect("system", "Msg01", "WndDisp", g_novelBase[2], 0)
  end
  for r8_23, r9_23 in pairs(g_buttons) do
    r1_23:setSubLayerHitTest("system", "Msg01", r9_23, 1, 0)
  end
  if g_windowID == 2 then
    r1_23:setSubLayerHitTest("system", "Msg01", g_novelBase[2], 1, 0)
  end
  g_messageInfo.enabled = true
  g_messageInfo.effect = true
  setButtonState()
end
function closeMessageWindow()
  -- line: [907, 922] id: 24
  local r1_24 = nil	-- notice: implicit variable refs by block#[3]
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
    r1_24 = 1
    if not r1_24 then
      ::label_9::
      r1_24 = LUA_SKIPSPEED_NONE
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  local r2_24 = cclass.lua_Layers:create()
  r2_24:setEffect("system", "Msg01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 200 * r1_24, 0, 0)
  r2_24:setEffect("system", "Txt01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 200 * r1_24, 0, 0)
  r2_24:setEffect("system", "MsgFace", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 200 * r1_24, 0, 0)
  r2_24:startEffect("system", "Msg01", "WndDisp", 0)
  r2_24:startEffect("system", "Txt01", "WndDisp", 0)
  r2_24:startEffect("system", "MsgFace", "WndDisp", 0)
  g_messageInfo.enabled = false
  g_messageInfo.effect = true
  nameWindowVisible(false)
  setButtonState()
end
function resetMessageWindow(r0_25)
  -- line: [924, 952] id: 25
  if r0_25 == true then
    if getSystemSet() == "system" then
      cfunc.D3DApp__lua_PostMouseMove()
    end
  else
    local r1_25 = cclass.lua_Layers:create()
    for r5_25 = 1, 10, 1 do
      r1_25:cancelSubLayerEffect("system", "Msg01", g_select[r5_25], "btnState")
      r1_25:cancelSubLayerEffect("system", "Msg01", g_select[r5_25], "btnState2")
      r1_25:cancelSubLayerEffect("system", "Msg01", g_normal[r5_25], "btnState")
      if r5_25 > 6 then
        r1_25:cancelSubLayerEffect("system", "Msg01", g_selectBase[r5_25 - 6], "btnState")
        r1_25:cancelSubLayerEffect("system", "Msg01", g_normalBase[r5_25 - 6], "btnState")
      end
    end
    r1_25:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r1_25:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r1_25:setParam("system", "MsgFace", LUA_PARAM_COLOR, 1, 1, 1, 0)
    g_messageInfo.enabled = false
    g_messageInfo.effect = false
    nameWindowVisible(false)
    for r5_25, r6_25 in pairs(g_buttons) do
      r1_25:setSubLayerHitTest("system", "Msg01", r6_25, 1, 0)
    end
  end
end
function isMessageWindowEffect()
  -- line: [954, 964] id: 26
  local r1_26 = cclass.lua_Layers:create():isEffect("system", "WndDisp")
  if g_messageInfo.effect == true and r1_26 == false then
    setButtonState()
    g_messageInfo.wndCursor = -1
    g_messageInfo.effect = false
    g_refreshCursor = true
  end
  return r1_26
end
function hideMessageWindow(r0_27)
  -- line: [967, 1013] id: 27
  local r1_27 = cclass.lua_Layers:create()
  if r1_27:isEffect("system", "Msg01") == true then
    return false
  end
  local r3_27 = 0
  if r0_27 == 0 then
    r3_27 = 1
    local r4_27 = cclass.lua_Sounds:new()
    r4_27:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
    r4_27:delete()
    g_refreshCursor = true
  end
  r1_27:setVisible("system", "Msg01", r3_27)
  r1_27:setVisible("system", "Txt01", r3_27)
  r1_27:setVisible("system", "Clk01", r3_27)
  if g_namedisp == 1 then
    r1_27:setVisible("system", "Name01", r3_27)
  end
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) then
    cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
    r1_27:setVisible("system", "Skip01", r3_27)
  end
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGAUTO) then
    r1_27:setVisible("system", "Auto01", r3_27)
  end
  r1_27:setVisible("system", "MsgFace", r3_27)
  if r0_27 == 1 then
    r1_27:cancelSubLayerEffect("system", "Msg01", g_select[6], "btnState")
    r1_27:cancelSubLayerEffect("system", "Msg01", g_normal[6], "btnState")
    r1_27:setSubLayerParam("system", "Msg01", g_select[6], LUA_PARAM_COLOR, 1, 1, 1, 0)
    r1_27:setSubLayerParam("system", "Msg01", g_normal[6], LUA_PARAM_COLOR, 1, 1, 1, 1)
  end
  hideSelect(r0_27)
  return true
end
function startClickWaitAnimation()
  -- line: [1015, 1027] id: 28
  local r0_28 = cclass.lua_Layers:create()
  if g_windowID == 2 then
    local r1_28 = 0
    local r2_28 = 0
    r1_28, r2_28 = r0_28:getLastTextPos("system", "Txt01", r1_28, r2_28)
    r0_28:setParam("system", "Clk01", LUA_PARAM_POS, r1_28, r2_28 - 45, 0, 0)
  else
    r0_28:setParam("system", "Clk01", LUA_PARAM_POS, 1032, 662, 0, 0)
  end
  r0_28:startAnimation("system", "Clk01", "\x83N\x83\x8a\x83b\x83N\x91҂\xbf", 1000, -1, 0)
end
function stopClickWaitAnimation()
  -- line: [1029, 1032] id: 29
  cclass.lua_Layers:create():stopAnimation("system", "Clk01", "\x83N\x83\x8a\x83b\x83N\x91҂\xbf")
end
function getDefaultFont()
  -- line: [1034, 1036] id: 30
  return "MS UI Gothic"
end
function initFontInformation()
  -- line: [1038, 1050] id: 31
  local r0_31 = cclass.CLegacyFontInfo:create()
  r0_31:add("system", "Name01", "MS UI Gothic", 18, 2, 0, 5153535, 4294967295)
  r0_31:add("system", "Txt01", "MS UI Gothic", 18, 2, 0, 5153535, 4294967295)
  r0_31:add("messageLog", "LogText01", "MS UI Gothic", 18, 2, 0, g_logTextColor.normal, g_logTextColor.normalEdge)
  r0_31:add("cmdLine", "inputLine", "MS UI Gothic", 18, 2, 0, 5153535, 4294967295)
end
function getAllSkip()
  -- line: [1053, 1055] id: 32
  return g_allskip
end
function getSelectReleaseSkip()
  -- line: [1058, 1060] id: 33
  return g_selectReleaseSkip
end
function getSelectReleaseAuto()
  -- line: [1063, 1065] id: 34
  return g_selectReleaseAuto
end
function getEffectSpeed()
  -- line: [1068, 1070] id: 35
  return g_effectSpeed
end
function getUseBGMCut()
  -- line: [1073, 1075] id: 36
  return g_bgmCutPer
end
function getEffectRate()
  -- line: [1078, 1087] id: 37
  local r0_37 = 1
  local r1_37 = getEffectSpeed()
  if r1_37 == 2 then
    r0_37 = LUA_SKIPSPEED_NONE
  elseif r1_37 == 1 then
    r0_37 = LUA_SKIPSPEED_OMIT
  end
  return r0_37
end
function getSoundIndex(r0_38)
  -- line: [1090, 1100] id: 38
  for r4_38, r5_38 in pairs(g_volume) do
    local r6_38 = nil
    local r7_38 = nil
    r6_38, r7_38 = string.find(string.lower(r0_38), string.lower(r5_38.name))
    if r6_38 ~= nil then
      return r4_38
    end
  end
  return 0
end
function checkOtherVoice(r0_39)
  -- line: [1102, 1120] id: 39
  for r4_39 = 1, #g_charKeysOtherM, 1 do
    local r5_39 = nil
    local r6_39 = nil
    r5_39, r6_39 = string.find(string.lower(r0_39), string.lower(g_charKeysOtherM[r4_39]))
    if r5_39 ~= nil then
      return 1
    end
  end
  for r4_39 = 1, #g_charKeysOtherF, 1 do
    local r5_39 = nil
    local r6_39 = nil
    r5_39, r6_39 = string.find(string.lower(r0_39), string.lower(g_charKeysOtherF[r4_39]))
    if r5_39 ~= nil then
      return 2
    end
  end
  return 0
end
function getSoundVolume(r0_40)
  -- line: [1123, 1163] id: 40
  local r1_40 = checkOtherVoice(r0_40)
  if r1_40 == 1 then
    r0_40 = "charOtherM"
  elseif r1_40 == 2 then
    r0_40 = "charOtherF"
  end
  local r2_40 = false
  local r3_40 = 0
  for r7_40, r8_40 in pairs(g_volume) do
    local r9_40 = nil
    local r10_40 = nil
    r9_40, r10_40 = string.find(string.lower(r0_40), string.lower(r8_40.name))
    if r9_40 ~= nil then
      local r11_40 = r8_40.vol
      if r8_40.mute == true then
        r11_40 = 0
      end
      if r8_40.name == getVoiceAllKey() then
        r2_40 = true
        r3_40 = r11_40
      else
        return r11_40
      end
    end
  end
  if r2_40 == true then
    return r3_40
  end
  local r4_40 = nil
  local r5_40 = nil
  r4_40, r5_40 = string.find(string.lower(r0_40), "bgv")
  if r4_40 ~= nil then
    return 1000
  end
  return 0
end
function getMessageSpeed()
  -- line: [1166, 1171] id: 41
  return math.floor(350 - 350 * g_msgspeed / 100)
end
function getAutoWaitTime()
  -- line: [1174, 1176] id: 42
  return g_autospeed + 5
end
function getGraphicsArcFileName(r0_43, r1_43)
  -- line: [1180, 1289] id: 43
  if string.lower(string.sub(r1_43, 1, 4)) == "sys_" then
    return "SysGraphic.arc"
  end
  if string.lower(string.sub(r1_43, 1, 5)) == "efmsk" then
    return "Graphic.arc"
  end
  if string.lower(string.sub(r1_43, 1, 2)) == "bg" then
    return "Chip1.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "sky" then
    return "Chip1.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "age" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "com" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "hut" then
    return "Chip3.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "kot" then
    return "Chip5.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "ama" then
    return "Chip6.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "aft" then
    return "Chip7.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "bef" then
    return "Chip7.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "ags" then
    return "Chip8.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "hot" then
    return "Chip8.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "nov" then
    return "Chip8.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "hus" then
    return "Chip9.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "kan" then
    return "Chip9.arc"
  end
  if string.lower(string.sub(r1_43, 1, 4)) == "sdev" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_43, 1, 4)) == "fdsd" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_43, 1, 2)) == "an" then
    return "Chip4.arc"
  end
  if string.lower(string.sub(r1_43, 1, 2)) == "ef" then
    return "Chip4.arc"
  end
  if string.lower(string.sub(r1_43, 1, 3)) == "est" then
    return "Chip4.arc"
  end
  if string.lower(string.sub(r1_43, 1, 2)) == "im" then
    return "Chip4.arc"
  end
  return "Graphic.arc"
end
function getSoundArcFileName(r0_44, r1_44)
  -- line: [1292, 1313] id: 44
  local r2_44 = nil	-- notice: implicit variable refs by block#[0, 2, 4, 6]
  r2_44, r3_44 = string.find(string.lower(r0_44), "char")
  if r2_44 ~= nil then
    return "Voice.arc"
  end
  r2_44, r3_44 = string.find(string.lower(r0_44), "bgv")
  if r2_44 ~= nil then
    return "Voice.arc"
  end
  r2_44, r3_44 = string.find(string.lower(r0_44), "bgm")
  if r2_44 ~= nil then
    return "Bgm.arc"
  end
  r2_44, r3_44 = string.find(string.lower(r0_44), "systemvoice")
  if r2_44 ~= nil then
    return "SysVoice.arc"
  end
  return "Se.arc"
end
function getVoiceAllKey()
  -- line: [1317, 1319] id: 45
  return "char"
end
function getBGVAllKey()
  -- line: [1322, 1324] id: 46
  return "bgv"
end
function getBGMAllKey()
  -- line: [1327, 1329] id: 47
  return "bgm"
end
function getBGVCharKey(r0_48)
  -- line: [1332, 1334] id: 48
  return ""
end
function getMouseAutoMove()
  -- line: [1337, 1339] id: 49
  return g_mouseAutoMove
end
function getHideCursor()
  -- line: [1342, 1344] id: 50
  return g_hideCursor
end
function getClickVoice()
  -- line: [1347, 1349] id: 51
  return g_clickVoice
end
function getEnablePan()
  -- line: [1352, 1354] id: 52
  return g_enablePan
end
function getBGVVoiceMute()
  -- line: [1357, 1359] id: 53
  return g_bgvVoiceMute
end
function getDeactiveMode()
  -- line: [1362, 1364] id: 54
  return g_deactiveMode
end
function executeSelect()
  -- line: [1367, 1380] id: 55
  if g_selectInfo.enabled and g_selectInfo.effect == false and 0 <= g_selectInfo.selCursor then
    local r0_55 = cclass.lua_Sounds:new()
    r0_55:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    r0_55:delete()
    cfunc.LegacyGame__lua_SelectItem(g_selectInfo.selCursor)
    setSelectTextColor(g_selectInfo.selCursor, 2)
    cclass.lua_Layers:create():updateTextColor("system", "SelTxt" .. tostring(g_selectInfo.selCursor + 1))
    closeSelect()
  end
end
function onLButtonDown(r0_56, r1_56, r2_56, r3_56, r4_56, r5_56)
  -- line: [1383, 1421] id: 56
  if r0_56 == "system" and r1_56 == "Msg01" then
    onLButtonDownMessageWindow(r2_56)
    executeSelect()
  elseif r0_56 == "dialog" then
    onLButtonDownDialog(r1_56, r2_56)
  elseif r0_56 == "sysmenu" then
    onLButtonDownSystemMenu(r1_56, r2_56)
  elseif r0_56 == "messageLog" then
    onLButtonDownMessageLog(r1_56, r2_56, r3_56, r4_56, r5_56)
  elseif r0_56 == "configBase" then
    onLButtonDownConfig(r1_56, r2_56, r3_56, r4_56, r5_56)
  elseif r0_56 ~= "cmdLine" then
    if r0_56 == "titleMenu" then
      onLButtonDownTitle(r0_56, r1_56, r2_56, r3_56, r4_56, r5_56)
    elseif r0_56 == "GalleryMenu" then
      onLButtonDownGallery(r0_56, r1_56, r2_56, r3_56, r4_56, r5_56)
    elseif r0_56 == "CgBrowser" then
      onLButtonDownCgBrowser(r0_56, r1_56, r2_56, r3_56, r4_56, r5_56)
    elseif r0_56 == "AfterMenu" then
      onLButtonDownAfterMenu(r0_56, r1_56, r2_56, r3_56, r4_56, r5_56)
    elseif r0_56 == "StoryMenu" then
      onLButtonDownStoryMenu(r0_56, r1_56, r2_56, r3_56, r4_56, r5_56)
    elseif r0_56 == "cgDisp" then
      onLButtonDownCGDisp(r5_56)
    end
  end
end
function onLButtonUp(r0_57, r1_57, r2_57, r3_57, r4_57, r5_57)
  -- line: [1424, 1461] id: 57
  if r0_57 ~= "system" and r0_57 ~= "dialog" and r0_57 ~= "sysmenu" then
    if r0_57 == "messageLog" then
      g_logInfo.scrollBar:onLButtonUp(r3_57, r4_57)
      local r7_57 = cclass.lua_Layers:create():getCursorPos("messageLog", r3_57, r4_57, 0)
      changeMessageLogFocus(r7_57 - 1)
      g_logInfo.selCursor = r7_57 - 1
    elseif r0_57 == "configBase" and g_configInfo.page == 7 then
      onLButtonUpCfgP7(r3_57, r4_57, r5_57)
    elseif r0_57 ~= "cmdLine" then
      if r0_57 == "titleMenu" then
        onLButtonUpTitle(r0_57, r1_57, r2_57, r3_57, r4_57, r5_57)
      elseif r0_57 == "GalleryMenu" then
        onLButtonUpGallery(r0_57, r1_57, r2_57, r3_57, r4_57, r5_57)
      elseif r0_57 == "CgBrowser" then
        onLButtonUpCgBrowser(r0_57, r1_57, r2_57, r3_57, r4_57, r5_57)
      elseif r0_57 == "AfterMenu" then
        onLButtonUpAfterMenu(r0_57, r1_57, r2_57, r3_57, r4_57, r5_57)
      elseif r0_57 == "StoryMenu" then
        onLButtonUpStoryMenu(r0_57, r1_57, r2_57, r3_57, r4_57, r5_57)
      elseif r0_57 == "cgDisp" then
      end
    end
  end
end
function isGesture(r0_58)
  -- line: [1464, 1473] id: 58
  if g_DisableGestureFlag == true then
    return false
  end
  if r0_58 == "system" then
    return true
  end
  return false
end
function onGesture(r0_59, r1_59, r2_59, r3_59, r4_59, r5_59)
  -- line: [1476, 1526] id: 59
  if r0_59 == "system" then
    local r6_59 = g_gestureFunc[r2_59 + 1]
    if checkOverlayFunction(r6_59) == false then
      return 
    end
    if r6_59 == 0 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
    elseif r6_59 == 1 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGCTRLSKIP)
    elseif r6_59 == 2 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGAUTO)
    elseif r6_59 == 3 then
      openMessageLog()
    elseif r6_59 == 4 then
      openConfig(0, false)
    elseif r6_59 == 5 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
    elseif r6_59 == 6 then
      openConfirm(LUA_CONFIRM_QUICKLOAD)
    elseif r6_59 == 7 then
      openConfig(4, false)
    elseif r6_59 == 8 then
      openConfig(5, false)
    elseif r6_59 == 9 then
      openConfirm(LUA_CONFIRM_TITLE)
    elseif r6_59 == 10 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_MINIMIZED, 0)
    elseif r6_59 == 11 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SCREENMODE, 0)
    elseif r6_59 == 12 then
      local r8_59 = nil
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        r8_59 = 0
      else
        r8_59 = 1
      end
      if hideMessageWindow(r8_59) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGHIDE)
      end
    elseif r6_59 == 13 then
      openConfirm(LUA_CONFIRM_SELECTLOAD)
    elseif r6_59 == 14 then
    end
  end
end
function onRButtonUp(r0_60, r1_60, r2_60, r3_60, r4_60, r5_60)
  -- line: [1529, 1587] id: 60
  if r0_60 == "system" then
    local r6_60 = nil
    if g_messageInfo.effect == false and g_messageInfo.enabled == true then
      local r7_60 = nil
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        r7_60 = 0
      else
        r7_60 = 1
      end
      if hideMessageWindow(r7_60) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGHIDE)
      end
    end
  elseif r0_60 == "dialog" then
    onRButtonDownDialog(r1_60, r2_60)
  elseif r0_60 == "sysmenu" then
    onRButtonDownSystemMenu(r1_60, r2_60)
  elseif r0_60 == "messageLog" then
    onRButtonDownMessageLog(r1_60, r2_60)
  elseif r0_60 == "configBase" then
    onRButtonDownConfig(r1_60, r2_60)
  elseif r0_60 ~= "cmdLine" and r0_60 ~= "titleMenu" then
    if r0_60 == "GalleryMenu" then
      onRButtonUpGallery(r0_60, r1_60, r2_60, r3_60, r4_60, r5_60)
    elseif r0_60 == "CgBrowser" then
      onRButtonUpCgBrowser(r0_60, r1_60, r2_60, r3_60, r4_60, r5_60)
    elseif r0_60 == "AfterMenu" then
      onRButtonUpAfterMenu(r0_60, r1_60, r2_60, r3_60, r4_60, r5_60)
    elseif r0_60 == "StoryMenu" then
      onRButtonUpStoryMenu(r0_60, r1_60, r2_60, r3_60, r4_60, r5_60)
    elseif r0_60 == "cgDisp" then
      onRButtonDownCGDisp(r1_60, r2_60)
    end
  end
end
function onMButtonDown(r0_61, r1_61, r2_61, r3_61, r4_61, r5_61)
  -- line: [1590, 1600] id: 61
  if r0_61 ~= "system" then
    if r0_61 == "cgDisp" then
      onMButtonDownCGDisp(r3_61, r4_61)
    elseif r0_61 == "CgBrowser" then
      onMButtonDownCgBrowser(r0_61, r1_61, r2_61, r3_61, r4_61, r5_61)
    end
  end
end
function onMButtonUp(r0_62, r1_62, r2_62, r3_62, r4_62, r5_62)
  -- line: [1603, 1613] id: 62
  if r0_62 ~= "system" then
    if r0_62 == "cgDisp" then
      onMButtonUpCGDisp(r3_62, r4_62)
    elseif r0_62 == "CgBrowser" then
      onMButtonUpCgBrowser(r0_62, r1_62, r2_62, r3_62, r4_62, r5_62)
    end
  end
end
function onMouseMove(r0_63, r1_63, r2_63, r3_63, r4_63, r5_63)
  -- line: [1616, 1657] id: 63
  if r0_63 == "system" then
    if r1_63 == "Msg01" then
      onMouseMoveMessageWindow(r2_63)
      if g_selectInfo.enabled then
        onMouseMoveSelect(getSelectMousePos(r3_63, r4_63))
      end
    else
      g_selectInfo.selCursor = -1
      g_messageInfo.wndCursor = -1
    end
  elseif r0_63 == "dialog" then
    onMouseMoveDialog(r1_63, r2_63, r3_63, r4_63)
  elseif r0_63 == "sysmenu" then
    onMouseMoveSystemMenu(r1_63, r2_63, r3_63, r4_63)
  elseif r0_63 == "messageLog" then
    onMouseMoveMessageLog(r1_63, r2_63, r3_63, r4_63)
  elseif r0_63 == "configBase" then
    onMouseMoveConfig(r1_63, r2_63, r3_63, r4_63)
  elseif r0_63 ~= "cmdLine" then
    if r0_63 == "titleMenu" then
      onMouseMoveTitle(r0_63, r1_63, r2_63, r3_63, r4_63, r5_63)
    elseif r0_63 == "GalleryMenu" then
      onMouseMoveGallery(r0_63, r1_63, r2_63, r3_63, r4_63, r5_63)
    elseif r0_63 == "CgBrowser" then
      onMouseMoveCgBrowser(r0_63, r1_63, r2_63, r3_63, r4_63, r5_63)
    elseif r0_63 == "AfterMenu" then
      onMouseMoveAfterMenu(r0_63, r1_63, r2_63, r3_63, r4_63, r5_63)
    elseif r0_63 == "StoryMenu" then
      onMouseMoveStoryMenu(r0_63, r1_63, r2_63, r3_63, r4_63, r5_63)
    elseif r0_63 == "cgDisp" then
      onMouseMoveCGDisp(r1_63, r2_63, r3_63, r4_63)
    end
  end
end
function onMouseWheel(r0_64, r1_64)
  -- line: [1660, 1685] id: 64
  if r0_64 ~= "system" and r0_64 ~= "dialog" then
    if r0_64 == "messageLog" and g_logInfo.effect == false then
      onWheelMouseLogLayer(r1_64, true)
    elseif r0_64 ~= "sysmenu" and r0_64 ~= "cmdLine" and r0_64 ~= "configBase" and r0_64 ~= "titleMenu" then
      if r0_64 == "cgDisp" then
        onWheelMouseCGDisp(r1_64)
      elseif r0_64 == "GalleryMenu" then
        onWheelMouseGallery(r0_64, r1_64)
      elseif r0_64 == "CgBrowser" then
        onWheelMouseCgBrowser(r0_64, r1_64)
      end
    end
  end
end
function onKeyDown(r0_65, r1_65, r2_65, r3_65)
  -- line: [1688, 1751] id: 65
  if r0_65 == "system" and g_selectInfo.enabled and g_selectInfo.effect == false then
    if r2_65 == LUA_KEYCODE_ENTER then
      executeSelect()
    elseif r2_65 == LUA_KEYCODE_UP and g_selectInfo.selCursor ~= 0 then
      local r4_65 = nil
      if g_selectInfo.selCursor == -1 then
        for r8_65 = 1, g_selectInfo.count, 1 do
          if g_selectInfo.enable[r8_65] == true then
            onMouseMoveSelect(r8_65 - 1)
          end
        end
      else
        r4_65 = g_selectInfo.selCursor
        for r8_65 = g_selectInfo.selCursor - 1, 0, -1 do
          if g_selectInfo.enable[r8_65 + 1] == true then
            onMouseMoveSelect(r8_65)
          end
        end
      end
    elseif r2_65 == LUA_KEYCODE_DOWN and g_selectInfo.selCursor < g_selectInfo.count - 1 then
      local r4_65 = nil
      r4_65 = g_selectInfo.selCursor
      for r8_65 = g_selectInfo.selCursor + 1, g_selectInfo.count - 1, 1 do
        if g_selectInfo.enable[r8_65 + 1] == true then
          onMouseMoveSelect(r8_65)
        end
      end
    end
  elseif r0_65 == "dialog" then
    onKeyDownDialog(r2_65, r3_65)
  elseif r0_65 ~= "sysmenu" then
    if r0_65 == "messageLog" then
      onKeyDownMessageLog(r2_65, r3_65)
    elseif r0_65 == "configBase" then
      onKeyDownConfig(r2_65, r3_65)
    elseif r0_65 ~= "cmdLine" and r0_65 ~= "titleMenu" and r0_65 == "cgDisp" then
    end
  end
end
function onLButtonDownMessageWindow(r0_66)
  -- line: [1754, 1803] id: 66
  if g_messageInfo.effect == false and g_messageInfo.enabled == true then
    local r1_66 = cclass.lua_Sounds:new()
    if checkMessageFocus(r0_66, false) == false then
      r0_66 = -1
    end
    if r0_66 == g_buttons[1] then
      r1_66:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
      openConfirm(LUA_CONFIRM_QUICKLOAD)
    elseif r0_66 == g_buttons[2] then
      r1_66:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
    elseif r0_66 == g_buttons[3] then
      openConfig(5, false)
    elseif r0_66 == g_buttons[4] then
      openConfig(4, false)
    elseif r0_66 == g_buttons[5] then
      r1_66:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
      openMessageLog()
    elseif r0_66 == g_buttons[9] then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_VOICEREPEAT, 0)
    elseif r0_66 == g_buttons[7] then
      r1_66:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGAUTO)
    elseif r0_66 == g_buttons[8] then
      r1_66:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
    elseif r0_66 == g_buttons[10] then
      openConfig(0, false)
    elseif r0_66 == g_buttons[6] and hideMessageWindow(1) == true then
      r1_66:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGHIDE)
      g_messageInfo.wndCursor = -1
    end
    r1_66:delete()
  end
end
function onMessageOutEnd(r0_67)
  -- line: [1805, 1816] id: 67
  if r0_67 == "configBase" and g_configInfo.page == 2 then
    local r1_67 = cclass.lua_Layers:create()
    g_cfgP2Info.autoModeTimer:start(r1_67:messageLength("configBase", "ConfigText2"))
    r1_67:startAnimation("configBase", "ConfigPage2", "ClkWait", 1000, -1, 0)
  end
end
function onIMEnd(r0_68, r1_68, r2_68)
  -- line: [1818, 1831] id: 68
  if r0_68 == "cmdLine" then
    if r2_68 == false then
      cfunc.LegacyGame__lua_SetString("@FIRST", r1_68, false)
      cfunc.LegacyGame__lua_SetString("@FIRST", r1_68, true)
    end
    local r3_68 = cclass.lua_Layers:create()
    r3_68:removeLayer("cmdLine", "inputLine")
    r3_68:removeLayer("cmdLine", "CmdLine01")
    g_cmdLineInfo.enabled = false
    g_cmdLineInfo.effect = false
  end
end
function addFrame(r0_69, r1_69)
  -- line: [1834, 1856] id: 69
  if r0_69 == "configBase" then
    if g_configInfo.page == 2 and g_cfgP2Info.autoModeTimer:addFrame(r1_69) == true then
      startCfg2Preview()
    elseif g_configInfo.page == 3 then
      local r2_69 = g_mixer:getMasterVolume()
      if g_mixer:getMasterMute() ~= false or not r2_69 then
        r2_69 = 0
      end
      if g_cfgP3Info.masterBar:getValue() ~= r2_69 then
        g_cfgP3Info.masterBar:updateBar(r2_69)
      end
    end
  elseif r0_69 == "messageLog" then
    drawSceneJumpIcon()
  elseif r0_69 == "cmdLine" then
    setIMState()
  end
end
function checkMessageFocus(r0_70, r1_70)
  -- line: [1859, 1915] id: 70
  if r1_70 == false and (r0_70 == g_buttons[1] or r0_70 == g_buttons[2] or r0_70 == g_buttons[3] or r0_70 == g_buttons[4] or r0_70 == g_buttons[10]) and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
    return false
  end
  if r0_70 == g_buttons[1] then
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLEQLOAD) == false then
      return false
    end
    return true
  elseif r0_70 == g_buttons[2] then
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
      return false
    end
    return true
  elseif r0_70 == g_buttons[3] then
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
      return false
    end
    return true
  elseif r0_70 == g_buttons[4] then
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
      return false
    end
    return true
  elseif r0_70 == g_buttons[5] then
    return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOG)
  elseif r0_70 == g_buttons[9] then
    return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLEVOICEREPEAT)
  elseif r0_70 == g_buttons[7] then
    return true
  elseif r0_70 == g_buttons[8] then
    return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLESKIP) or g_allskip
  elseif r0_70 == g_buttons[10] then
    return true
  elseif r0_70 == g_buttons[6] then
    return true
  elseif r0_70 == g_novelBase[2] and g_windowID == 2 then
    return true
  end
  return false
end
function onMouseMoveMessageWindow(r0_71)
  -- line: [1918, 1935] id: 71
  if g_messageInfo.effect == false and g_messageInfo.enabled == true and g_messageInfo.wndCursor ~= r0_71 then
    if checkMessageFocus(r0_71, false) == false then
      r0_71 = -1
    end
    if 0 <= r0_71 and r0_71 ~= g_novelBase[2] then
      local r1_71 = cclass.lua_Sounds:new()
      r1_71:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
      r1_71:delete()
    end
    changeButtonFocus(r0_71)
    g_messageInfo.wndCursor = r0_71
  end
end
function onMouseMoveSelect(r0_72)
  -- line: [1938, 1948] id: 72
  if r0_72 ~= g_selectInfo.selCursor then
    if r0_72 >= 0 then
      local r1_72 = cclass.lua_Sounds:new()
      r1_72:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
      r1_72:delete()
    end
    changeSelectFocus(r0_72)
    g_selectInfo.selCursor = r0_72
  end
end
function faceRead(r0_73)
  -- line: [1951, 1964] id: 73
  local r1_73 = cclass.lua_Layers:create()
  if string.lower(r0_73) == ".png" then
    r1_73:removeLayer("system", "MsgFace")
    return true
  else
    local r3_73 = r1_73:insertLayer("system", "MsgFace", LUA_LAYER_STD, getGraphicsArcFileName("system", r0_73), r0_73, 1)
    r1_73:setParam("system", "MsgFace", LUA_PARAM_POS, 89, 511, 0, 0)
    return r3_73
  end
end
function changeButtonFocus(r0_74)
  -- line: [1967, 2081] id: 74
  if g_messageInfo.effect == true then
    return 
  end
  local r1_74 = cclass.lua_Layers:create()
  local r2_74 = false
  local r3_74 = false
  for r7_74, r8_74 in pairs(g_buttons) do
    if r0_74 == r8_74 then
      r1_74:cancelSubLayerEffect("system", "Msg01", g_select[r7_74], "btnState")
      r1_74:cancelSubLayerEffect("system", "Msg01", g_select[r7_74], "btnState2")
      r1_74:cancelSubLayerEffect("system", "Msg01", g_normal[r7_74], "btnState")
      if r7_74 > 6 then
        r1_74:cancelSubLayerEffect("system", "Msg01", g_selectBase[r7_74 - 6], "btnState")
        r1_74:cancelSubLayerEffect("system", "Msg01", g_normalBase[r7_74 - 6], "btnState")
      end
      local r9_74 = 0
      local r10_74 = 0
      local r11_74 = 0
      local r12_74 = 0
      local r13_74 = 0
      r9_74, r10_74, r11_74, r12_74 = r1_74:getSubLayerParam("system", "Msg01", g_select[r7_74], LUA_PARAM_COLOR, r9_74, r10_74, r11_74, r12_74)
      r9_74, r10_74, r11_74, r13_74 = r1_74:getSubLayerParam("system", "Msg01", g_normal[r7_74], LUA_PARAM_COLOR, r9_74, r10_74, r11_74, r13_74)
      local r14_74 = 0
      local r15_74 = 0
      r14_74, r15_74, r16_74, r17_74 = r1_74:getSubLayerParam("system", "Msg01", g_select[r7_74], LUA_PARAM_SCALE, r14_74, r15_74, 0, 0)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_select[r7_74], LUA_EFFECT_OPACITY, 0, 0, 0, 1 - r12_74, 0, 150 * (1 - r12_74), 0, 0)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_select[r7_74], LUA_EFFECT_SCALE, 1.2 - r14_74, 1.2 - r15_74, 0, 0, 0, 150 * (1.2 - r14_74) / 0.2, 0, 0)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_select[r7_74], LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 50, 0, 0)
      if r7_74 > 6 then
        r9_74, r10_74, r11_74, r12_74 = r1_74:getSubLayerParam("system", "Msg01", g_selectBase[r7_74 - 6], LUA_PARAM_COLOR, r9_74, r10_74, r11_74, r12_74)
        r9_74, r10_74, r11_74, r13_74 = r1_74:getSubLayerParam("system", "Msg01", g_normalBase[r7_74 - 6], LUA_PARAM_COLOR, r9_74, r10_74, r11_74, r13_74)
        r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_selectBase[r7_74 - 6], LUA_EFFECT_OPACITY, 0, 0, 0, 1 - r12_74, 0, 150 * (1 - r12_74), 0, 0)
        r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_selectBase[r7_74 - 6], 0)
        r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_normalBase[r7_74 - 6], LUA_EFFECT_OPACITY, 0, 0, 0, r13_74 * -1, 0, 100 * r13_74, 0, 0)
        r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_normalBase[r7_74 - 6], 0)
      elseif r7_74 ~= 6 then
        r2_74 = true
      end
      r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_select[r7_74], 0)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState2", g_select[r7_74], LUA_EFFECT_SCALE, 0.1, 0.1, 0, 0, 0, 350, 0, 500)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState2", g_select[r7_74], LUA_EFFECT_SCALE, -0.1, -0.1, 0, 0, 0, 150, 0, 0)
      r1_74:startSubLayerEffect("system", "Msg01", "btnState2", g_select[r7_74], -1)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_normal[r7_74], LUA_EFFECT_OPACITY, 0, 0, 0, r13_74 * -1, 0, 100 * r13_74, 0, 0)
      r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_normal[r7_74], 0)
    elseif g_messageInfo.wndCursor == r8_74 then
      r1_74:cancelSubLayerEffect("system", "Msg01", g_select[r7_74], "btnState")
      r1_74:cancelSubLayerEffect("system", "Msg01", g_select[r7_74], "btnState2")
      r1_74:cancelSubLayerEffect("system", "Msg01", g_normal[r7_74], "btnState")
      if r7_74 > 6 then
        r1_74:cancelSubLayerEffect("system", "Msg01", g_selectBase[r7_74 - 6], "btnState")
        r1_74:cancelSubLayerEffect("system", "Msg01", g_normalBase[r7_74 - 6], "btnState")
      end
      local r9_74 = 0
      local r10_74 = 0
      local r11_74 = 0
      local r12_74 = 0
      local r13_74 = 0
      r9_74, r10_74, r11_74, r12_74 = r1_74:getSubLayerParam("system", "Msg01", g_select[r7_74], LUA_PARAM_COLOR, r9_74, r10_74, r11_74, r12_74)
      r9_74, r10_74, r11_74, r13_74 = r1_74:getSubLayerParam("system", "Msg01", g_normal[r7_74], LUA_PARAM_COLOR, r9_74, r10_74, r11_74, r13_74)
      if r7_74 > 6 then
        r9_74, r10_74, r11_74, r12_74 = r1_74:getSubLayerParam("system", "Msg01", g_selectBase[r7_74 - 6], LUA_PARAM_COLOR, r9_74, r10_74, r11_74, r12_74)
        r9_74, r10_74, r11_74, r13_74 = r1_74:getSubLayerParam("system", "Msg01", g_normalBase[r7_74 - 6], LUA_PARAM_COLOR, r9_74, r10_74, r11_74, r13_74)
        r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_selectBase[r7_74 - 6], LUA_EFFECT_OPACITY, 0, 0, 0, r12_74 * -1, 0, 150 * r12_74, 0, 0)
        r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_selectBase[r7_74 - 6], 0)
        r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_normalBase[r7_74 - 6], LUA_EFFECT_OPACITY, 0, 0, 0, 1 - r13_74, 0, 150 * (1 - r13_74), 0, 0)
        r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_normalBase[r7_74 - 6], 0)
      elseif r7_74 ~= 6 then
        r3_74 = true
      end
      local r14_74 = 0
      local r15_74 = 0
      r14_74, r15_74, r16_74, r17_74 = r1_74:getSubLayerParam("system", "Msg01", g_select[r7_74], LUA_PARAM_SCALE, r14_74, r15_74, 0, 0)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_select[r7_74], LUA_EFFECT_OPACITY, 0, 0, 0, r12_74 * -1, 0, 150 * r12_74, 0, 0)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_select[r7_74], LUA_EFFECT_SCALE, 1 - r14_74, 1 - r15_74, 0, 0, 0, 150 * r12_74, 0, 0)
      r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_select[r7_74], 0)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_normal[r7_74], LUA_EFFECT_OPACITY, 0, 0, 0, 1 - r13_74, 0, 150 * (1 - r13_74), 0, 0)
      r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_normal[r7_74], 0)
    end
  end
  if g_windowID == 2 then
    if r0_74 == g_novelBase[2] then
      r2_74 = true
    elseif g_messageInfo.wndCursor == g_novelBase[2] then
      r3_74 = true
    end
    if r2_74 == true or r3_74 == true then
      r1_74:cancelSubLayerEffect("system", "Msg01", g_novelBase[1], "btnState")
      r1_74:cancelSubLayerEffect("system", "Msg01", g_novelBase[2], "btnState")
    end
    if r2_74 == true then
      local r4_74 = 0
      local r5_74 = 0
      local r6_74 = 0
      local r7_74 = 0
      local r8_74 = 0
      r4_74, r5_74, r6_74, r7_74 = r1_74:getSubLayerParam("system", "Msg01", g_novelBase[1], LUA_PARAM_COLOR, r4_74, r5_74, r6_74, r7_74)
      r4_74, r5_74, r6_74, r8_74 = r1_74:getSubLayerParam("system", "Msg01", g_novelBase[2], LUA_PARAM_COLOR, r4_74, r5_74, r6_74, r8_74)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_novelBase[1], LUA_EFFECT_OPACITY, 0, 0, 0, 1 - r7_74, 0, 150 * (1 - r7_74), 0, 0)
      r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_novelBase[1], 0)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_novelBase[2], LUA_EFFECT_OPACITY, 0, 0, 0, r8_74 * -1, 0, 100 * r8_74, 0, 0)
      r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_novelBase[2], 0)
    elseif r3_74 == true then
      local r4_74 = 0
      local r5_74 = 0
      local r6_74 = 0
      local r7_74 = 0
      local r8_74 = 0
      r4_74, r5_74, r6_74, r7_74 = r1_74:getSubLayerParam("system", "Msg01", g_novelBase[1], LUA_PARAM_COLOR, r4_74, r5_74, r6_74, r7_74)
      r4_74, r5_74, r6_74, r8_74 = r1_74:getSubLayerParam("system", "Msg01", g_novelBase[2], LUA_PARAM_COLOR, r4_74, r5_74, r6_74, r8_74)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_novelBase[1], LUA_EFFECT_OPACITY, 0, 0, 0, r7_74 * -1, 0, 150 * r7_74, 0, 0)
      r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_novelBase[1], 0)
      r1_74:setSubLayerEffect("system", "Msg01", "btnState", g_novelBase[2], LUA_EFFECT_OPACITY, 0, 0, 0, 1 - r8_74, 0, 150 * (1 - r8_74), 0, 0)
      r1_74:startSubLayerEffect("system", "Msg01", "btnState", g_novelBase[2], 0)
    end
  end
end
function changeSelectFocus(r0_75)
  -- line: [2084, 2111] id: 75
  local r1_75 = cclass.lua_Layers:create()
  local r7_75 = nil	-- notice: implicit variable refs by block#[5]
  if r0_75 >= 0 then
    local r2_75 = "SelWnd" .. tostring(r0_75 + 1)
    for r6_75 = 0, 1, 1 do
      if r6_75 == 0 then
        r7_75 = 1
        if not r7_75 then
          ::label_20::
          r7_75 = 0
        end
      else
        goto label_20	-- block#4 is visited secondly
      end
      r1_75:setSubLayerVisible("system", r2_75, r6_75, r7_75)
      if r7_75 == 1 then
        r1_75:setSubLayerEffect("system", r2_75, "Focus", r6_75, LUA_EFFECT_SCALE, 0.01, 0.01, 0, 0, 0, 500, 0, 0)
        r1_75:setSubLayerEffect("system", r2_75, "Focus", r6_75, LUA_EFFECT_SCALE, -0.01, -0.01, 0, 0, 0, 500, 0, 0)
        r1_75:startSubLayerEffect("system", r2_75, "Focus", r6_75, -1)
      end
    end
  end
  if g_selectInfo.selCursor >= 0 then
    local r2_75 = "SelWnd" .. tostring(g_selectInfo.selCursor + 1)
    local r3_75 = "SelTxt" .. tostring(g_selectInfo.selCursor + 1)
    for r7_75 = 0, 1, 1 do
      local r8_75 = nil	-- notice: implicit variable refs by block#[13]
      if r7_75 == 0 then
        r8_75 = 0
        if not r8_75 then
          ::label_94::
          r8_75 = 1
        end
      else
        goto label_94	-- block#12 is visited secondly
      end
      r1_75:setSubLayerVisible("system", r2_75, r7_75, r8_75)
      if r8_75 == 0 then
        r1_75:cancelSubLayerEffect("sysmenu", r2_75, r7_75, "Focus")
        r1_75:setSubLayerParam("sysmenu", r2_75, r7_75, LUA_PARAM_SCALE, 1, 1, 1, 0)
      end
    end
  end
end
g_buttonEffect = {
  auto = false,
  skip = false,
}
function setButtonState()
  -- line: [2116, 2248] id: 76
  local r0_76 = cclass.lua_Layers:create()
  if g_messageInfo.effect == false then
    for r4_76 = 1, 10, 1 do
      local r8_76 = 0
      r5_76, r6_76, r7_76, r8_76 = r0_76:getSubLayerParam("system", "Msg01", g_disable[r4_76], LUA_PARAM_COLOR, 0, 0, 0, r8_76)
      if checkMessageFocus(g_buttons[r4_76], true) == true then
        if g_normal[r4_76] ~= g_messageInfo.wndCursor and r8_76 ~= 0 then
          r0_76:setSubLayerParam("system", "Msg01", g_disable[r4_76], LUA_PARAM_COLOR, 1, 1, 1, 0)
          r0_76:setSubLayerParam("system", "Msg01", g_normal[r4_76], LUA_PARAM_COLOR, 1, 1, 1, 1)
          if r4_76 > 6 then
            r0_76:setSubLayerParam("system", "Msg01", g_disableBase[r4_76 - 6], LUA_PARAM_COLOR, 1, 1, 1, 0)
            r0_76:setSubLayerParam("system", "Msg01", g_normalBase[r4_76 - 6], LUA_PARAM_COLOR, 1, 1, 1, 1)
          end
          g_refreshCursor = true
        end
      else
        if g_messageInfo.wndCursor == g_buttons[r4_76] then
          r0_76:cancelSubLayerEffect("system", "Msg01", g_select[r4_76], "btnState")
          r0_76:cancelSubLayerEffect("system", "Msg01", g_select[r4_76], "btnState2")
          r0_76:setSubLayerParam("system", "Msg01", g_select[r4_76], LUA_PARAM_COLOR, 1, 1, 1, 0)
          if r4_76 > 6 then
            r0_76:cancelSubLayerEffect("system", "Msg01", g_selectBase[r4_76 - 6], "btnState")
            r0_76:setSubLayerParam("system", "Msg01", g_selectBase[r4_76 - 6], LUA_PARAM_COLOR, 1, 1, 1, 0)
          end
          g_messageInfo.wndCursor = -1
          g_refreshCursor = true
        end
        r0_76:setSubLayerParam("system", "Msg01", g_disable[r4_76], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r0_76:setSubLayerParam("system", "Msg01", g_normal[r4_76], LUA_PARAM_COLOR, 1, 1, 1, 0)
        if r4_76 > 6 then
          r0_76:setSubLayerParam("system", "Msg01", g_disableBase[r4_76 - 6], LUA_PARAM_COLOR, 1, 1, 1, 1)
          r0_76:setSubLayerParam("system", "Msg01", g_normalBase[r4_76 - 6], LUA_PARAM_COLOR, 1, 1, 1, 0)
        end
      end
    end
  end
  local r1_76 = nil
  if g_windowID >= 0 then
    if g_windowID == 0 then
      r1_76 = 100 or 0
    else
      goto label_213	-- block#18 is visited secondly
    end
  elseif g_messageWindowType == 0 then
    r1_76 = 100 or 0
  else
    goto label_221	-- block#22 is visited secondly
  end
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) ~= false or not 1 then
    local r3_76 = LUA_SKIPSPEED_NONE
  end
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) and g_messageInfo.enabled == true then
    if g_allskip == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) then
      r0_76:setSubLayerVisible("system", "Skip01", 2, 1)
      r0_76:setSubLayerVisible("system", "Skip01", 3, 0)
    else
      r0_76:setSubLayerVisible("system", "Skip01", 2, 0)
      r0_76:setSubLayerVisible("system", "Skip01", 3, 1)
    end
    if g_selectReleaseSkip then
      r0_76:setSubLayerVisible("system", "Skip01", 4, 1)
      r0_76:setSubLayerVisible("system", "Skip01", 5, 0)
    else
      r0_76:setSubLayerVisible("system", "Skip01", 4, 0)
      r0_76:setSubLayerVisible("system", "Skip01", 5, 1)
    end
    r0_76:setSubLayerVisible("system", "Skip01", 6, 1)
    if r0_76:isVisible("system", "Skip01") == false then
      r0_76:setParam("system", "Skip01", LUA_PARAM_ROTATE, 0, 90, 0, 0)
      r0_76:setVisible("system", "Skip01", 1)
      r0_76:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r1_76, 0, 0)
      r0_76:startEffect("system", "Skip01", "SkipDisp", 0)
      r0_76:setSubLayerParam("system", "Skip01", 1, LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r0_76:setSubLayerEffect("system", "Skip01", "SkipEffect", 1, LUA_EFFECT_SCALE, 0.5, 0.5, 0, 0, 0, 200, 0, 0)
      r0_76:setSubLayerEffect("system", "Skip01", "SkipEffect", 1, LUA_EFFECT_SCALE, -0.5, -0.5, 0, 0, 0, 100, 0, 0)
      r0_76:startSubLayerEffect("system", "Skip01", "SkipEffect", 1, -1)
      g_buttonEffect.skip = false
    end
  elseif r0_76:isVisible("system", "Skip01") == true and g_buttonEffect.skip == false then
    r0_76:cancelEffect("system", "Skip01", "SkipDisp")
    r0_76:setParam("system", "Skip01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r0_76:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_76, 0, 0)
    r0_76:startEffect("system", "Skip01", "SkipDisp", 0)
    g_buttonEffect.skip = true
  end
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGAUTO) and g_messageInfo.enabled == true then
    if g_selectReleaseAuto then
      r0_76:setSubLayerVisible("system", "Auto01", 2, 1)
      r0_76:setSubLayerVisible("system", "Auto01", 3, 0)
    else
      r0_76:setSubLayerVisible("system", "Auto01", 2, 0)
      r0_76:setSubLayerVisible("system", "Auto01", 3, 1)
    end
    r0_76:setSubLayerVisible("system", "Auto01", 4, 1)
    if r0_76:isVisible("system", "Auto01") == false then
      r0_76:setParam("system", "Auto01", LUA_PARAM_ROTATE, 0, 90, 0, 0)
      r0_76:setVisible("system", "Auto01", 1)
      r0_76:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r1_76, 0, 0)
      r0_76:startEffect("system", "Auto01", "AutoDisp", 0)
      r0_76:setSubLayerParam("system", "Auto01", 1, LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r0_76:setSubLayerEffect("system", "Auto01", "AutoEffect", 1, LUA_EFFECT_SCALE, 0.5, 0.5, 0, 0, 0, 500, 0, 0)
      r0_76:setSubLayerEffect("system", "Auto01", "AutoEffect", 1, LUA_EFFECT_SCALE, -0.5, -0.5, 0, 0, 0, 250, 0, 0)
      r0_76:startSubLayerEffect("system", "Auto01", "AutoEffect", 1, -1)
      g_buttonEffect.auto = false
    end
  elseif r0_76:isVisible("system", "Auto01") == true and g_buttonEffect.auto == false then
    r0_76:cancelEffect("system", "Auto01", "AutoDisp")
    r0_76:setParam("system", "Auto01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r0_76:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_76, 0, 0)
    r0_76:startEffect("system", "Auto01", "AutoDisp", 0)
    g_buttonEffect.auto = true
  end
  if g_buttonEffect.skip == true and r0_76:isEffect("system", "SkipDisp") == false then
    r0_76:setVisible("system", "Skip01", 0)
    g_buttonEffect.skip = false
  end
  if g_buttonEffect.auto == true and r0_76:isEffect("system", "AutoDisp") == false then
    r0_76:setVisible("system", "Auto01", 0)
    g_buttonEffect.auto = false
  end
end
function updateSkipAutoIcon()
  -- line: [2251, 2260] id: 77
  local r0_77 = cclass.lua_Layers:create()
  if g_drawSkipIcon == true then
    r0_77:setParam("system", "Auto01", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r0_77:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 1)
  else
    r0_77:setParam("system", "Auto01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r0_77:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 0)
  end
end
function refreshCursorPos()
  -- line: [2264, 2269] id: 78
  if g_refreshCursor then
    cfunc.D3DApp__lua_PostMouseMove()
    g_refreshCursor = false
  end
end
function willChangeVariable()
  -- line: [2272, 2273] id: 79
end
function didChangeVariable()
  -- line: [2276, 2277] id: 80
end
function getCharacterKeyCount()
  -- line: [2280, 2282] id: 81
  return #g_charKeys + #g_charKeysOtherM + #g_charKeysOtherF
end
function getCharacterKey(r0_82)
  -- line: [2285, 2294] id: 82
  r0_82 = r0_82 + 1
  if #g_charKeys + #g_charKeysOtherM < r0_82 then
    return g_charKeysOtherF[r0_82 - #g_charKeys + #g_charKeysOtherM]
  elseif #g_charKeys < r0_82 then
    return g_charKeysOtherM[r0_82 - #g_charKeys]
  else
    return g_charKeys[r0_82]
  end
end
function executeQuickSave()
  -- line: [2297, 2302] id: 83
  local r0_83 = cclass.lua_Sounds:new()
  r0_83:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
  r0_83:delete()
end
function executeQuickLoad()
  -- line: [2305, 2310] id: 84
  local r0_84 = cclass.lua_Sounds:new()
  r0_84:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  openConfirm(LUA_CONFIRM_QUICKLOAD)
  r0_84:delete()
end
function getMessageWindowEffect()
  -- line: [2313, 2315] id: 85
  return g_messageInfo.effect
end
function initSelect(r0_86)
  -- line: [2318, 2369] id: 86
  local r2_86 = {}
  g_selectInfo.enable = r2_86
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
    r2_86 = 1 or LUA_SKIPSPEED_NONE
  else
    goto label_12	-- block#2 is visited secondly
  end
  local r3_86 = cclass.lua_Layers:create()
  local r4_86 = cclass.CLegacyFontInfo:create()
  local r5_86 = getGraphicsArcFileName("system", "Sys_Select.pna")
  for r9_86 = 1, r0_86, 1 do
    local r10_86 = "SelWnd" .. tostring(r9_86)
    r3_86:insertLayer("system", r10_86, LUA_LAYER_PNA, r5_86, "Sys_Select.pna", 1)
    local r11_86 = 0
    local r12_86 = 0
    r11_86, r12_86, r13_86, r14_86 = r3_86:getParam("system", r10_86, LUA_PARAM_SIZE, r11_86, r12_86, 0, 0)
    local r15_86 = APP_INTERNAL_HEIGHT / 2 - r0_86 * r12_86 / 2 - (r0_86 - 1) * SELECT_WINDOW_PITCH / 2 + (r9_86 - 1) * r12_86 + (r9_86 - 1) * SELECT_WINDOW_PITCH
    local r16_86 = APP_INTERNAL_WIDTH
    r3_86:setParam("system", r10_86, LUA_PARAM_POS, r16_86, r15_86, 0, 0)
    if r9_86 == 1 then
      local r17_86 = cclass.lua_AutoCursor:new()
      r17_86:AutoCursor(250 + r11_86 / 2, r15_86 + r12_86 / 2, 300)
      r17_86:delete()
    end
    for r20_86 = 0, 1, 1 do
      local r21_86 = nil	-- notice: implicit variable refs by block#[10]
      if r20_86 == 0 then
        r21_86 = 0
        if not r21_86 then
          ::label_112::
          r21_86 = 1
        end
      else
        goto label_112	-- block#9 is visited secondly
      end
      r3_86:initSubLayer("system", r10_86, r20_86, r21_86)
    end
    local r17_86 = "SelTxt" .. tostring(r9_86)
    r3_86:insertTextLayer("system", r17_86, r11_86, r12_86, 1, 8, 1, 1, 0, 1)
    r3_86:setParam("system", r17_86, LUA_PARAM_POS, r16_86, r15_86, 0, 0)
    r4_86:add("system", r17_86, "MS UI Gothic", 20, 2, 0, g_selectTextColor.normal, g_selectTextColor.normalEdge)
    r3_86:setParam("system", r10_86, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_86:setParam("system", r17_86, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_86:setEffect("system", r10_86, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r2_86, 0, 100 * (r9_86 - 1) * r2_86)
    r3_86:setEffect("system", r17_86, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r2_86, 0, 100 * (r9_86 - 1) * r2_86)
    local r18_86 = 250 - APP_INTERNAL_WIDTH
    r3_86:setEffect("system", r10_86, "SelDisp", LUA_EFFECT_POS, r18_86, 0, 0, 0, 0, 300 * r2_86, 0, 100 * (r9_86 - 1) * r2_86)
    r3_86:setEffect("system", r17_86, "SelDisp", LUA_EFFECT_POS, r18_86, 0, 0, 0, 0, 300 * r2_86, 0, 100 * (r9_86 - 1) * r2_86)
    r3_86:startEffect("system", r10_86, "SelDisp", 0)
    r3_86:startEffect("system", r17_86, "SelDisp", 0)
    g_selectInfo.enable[r9_86] = true
  end
  g_selectInfo.effect = true
  g_selectInfo.enabled = true
  g_selectInfo.count = r0_86
end
function disableSelectItem(r0_87)
  -- line: [2372, 2378] id: 87
  cclass.lua_Layers:create():setSubLayerParam("system", "SelWnd" .. tostring(r0_87 + 1), 1, LUA_PARAM_COLOR, 0.5, 0.5, 0.5, 0.6)
  setSelectTextColor(r0_87, -1)
  g_selectInfo.enable[r0_87 + 1] = false
end
function closeSelect()
  -- line: [2381, 2423] id: 88
  local r1_88 = nil	-- notice: implicit variable refs by block#[5, 6]
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
    r1_88 = 1
    if not r1_88 then
      ::label_9::
      r1_88 = LUA_SKIPSPEED_NONE
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  local r2_88 = cclass.lua_Layers:create()
  local r3_88 = cclass.lua_Layers:create()
  local r4_88 = 0
  for r8_88 = 1, g_selectInfo.count, 1 do
    local r9_88 = "SelWnd" .. tostring(r8_88)
    local r10_88 = "SelTxt" .. tostring(r8_88)
    r3_88:setParam("system", r9_88, LUA_PARAM_COLOR, 1, 1, 1, 1)
    r3_88:setParam("system", r10_88, LUA_PARAM_COLOR, 1, 1, 1, 1)
    if r8_88 ~= g_selectInfo.selCursor + 1 then
      local r11_88 = g_selectInfo.count - 1 - r4_88
      r3_88:setEffect("system", r9_88, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r1_88, 0, 100 * r11_88 * r1_88)
      r3_88:setEffect("system", r10_88, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r1_88, 0, 100 * r11_88 * r1_88)
      local r12_88 = "SelWnd" .. tostring(r8_88)
      local r13_88 = 0
      r13_88, r14_88, r15_88, r16_88 = r3_88:getParam("system", r12_88, LUA_PARAM_SIZE, r13_88, 0, 0, 0)
      local r17_88 = (250 + r13_88) * -1
      r3_88:setEffect("system", r12_88, "SelDisp", LUA_EFFECT_POS, r17_88, 0, 0, 0, 0, 300 * r1_88, 0, 100 * r11_88 * r1_88)
      r3_88:setEffect("system", r10_88, "SelDisp", LUA_EFFECT_POS, r17_88, 0, 0, 0, 0, 300 * r1_88, 0, 100 * r11_88 * r1_88)
      r3_88:startEffect("system", r12_88, "SelDisp", 0)
      r3_88:startEffect("system", r10_88, "SelDisp", 0)
      r4_88 = r4_88 + 1
    else
      r3_88:setBlurCount("system", r9_88, 5)
      r3_88:setEffect("system", r9_88, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 200 * r1_88, 0, (300 + 100 * (g_selectInfo.count - 1)) * r1_88)
      r3_88:setEffect("system", r9_88, "SelDisp", LUA_EFFECT_SCALE, 0.25, 0.25, 0, -1, 0, 300 * r1_88, 0, (300 + 100 * (g_selectInfo.count - 1)) * r1_88)
      r3_88:setEffect("system", r10_88, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r1_88, 0, (300 + 100 * (g_selectInfo.count - 1)) * r1_88)
      r3_88:startEffect("system", r9_88, "SelDisp", 0)
      r3_88:startEffect("system", r10_88, "SelDisp", 0)
    end
  end
  g_selectInfo.effect = true
  g_selectInfo.enabled = false
end
function hideSelect(r0_89)
  -- line: [2426, 2438] id: 89
  local r1_89 = nil	-- notice: implicit variable refs by block#[5]
  if r0_89 == 1 then
    r1_89 = 0
    if not r1_89 then
      ::label_5::
      r1_89 = 1
    end
  else
    goto label_5	-- block#2 is visited secondly
  end
  if g_selectInfo.enabled == true then
    local r2_89 = cclass.lua_Layers:create()
    local r3_89 = getGraphicsArcFileName("system", "Sys_Select.pna")
    for r7_89 = 1, g_selectInfo.count, 1 do
      r2_89:setVisible("system", "SelWnd" .. tostring(r7_89), r1_89)
      r2_89:setVisible("system", "SelTxt" .. tostring(r7_89), r1_89)
    end
  end
end
function getSelectTextKey(r0_90)
  -- line: [2441, 2444] id: 90
  return "system", "SelTxt" .. tostring(r0_90 + 1)
end
function isSelectEffect()
  -- line: [2447, 2478] id: 91
  local r0_91 = cclass.lua_Layers:create()
  local r1_91 = r0_91:isEffect("system", "SelDisp")
  if g_selectInfo.effect == true and r1_91 == false then
    g_selectInfo.effect = false
    if g_selectInfo.enabled == true then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SELECTSAVEGAME, 0)
      local r2_91 = 0
      local r3_91 = 0
      local r4_91 = cclass.lua_AutoCursor:new()
      r2_91, r3_91 = r4_91:GetCursorPos(r2_91, r3_91)
      r4_91:delete()
      local r5_91 = getSelectMousePos(r2_91, r3_91)
      if r5_91 >= 0 then
        local r6_91 = cclass.lua_Sounds:new()
        r6_91:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
        r6_91:delete()
        changeSelectFocus(r5_91)
        g_selectInfo.selCursor = r5_91
      end
    else
      local r2_91 = cclass.CLegacyFontInfo:create()
      for r6_91 = 1, g_selectInfo.count, 1 do
        local r7_91 = "SelWnd" .. tostring(r6_91)
        local r8_91 = "SelTxt" .. tostring(r6_91)
        r2_91:remove("system", r8_91)
        r0_91:removeLayer("system", r7_91)
        r0_91:removeLayer("system", r8_91)
      end
    end
  end
  return r1_91
end
function getSelectMousePos(r0_92, r1_92)
  -- line: [2481, 2500] id: 92
  if g_selectInfo.enabled == true and g_selectInfo.effect == false then
    local r2_92 = cclass.lua_Layers:create()
    for r6_92 = 1, g_selectInfo.count, 1 do
      if g_selectInfo.enable[r6_92] == true then
        local r8_92 = "SelTxt" .. tostring(r6_92)
        local r9_92 = 0
        local r10_92 = 0
        r9_92, r10_92, r11_92, r12_92 = r2_92:getParam("system", "SelWnd" .. tostring(r6_92), LUA_PARAM_SIZE, r9_92, r10_92, 0, 0)
        local r13_92 = 250
        local r14_92 = APP_INTERNAL_HEIGHT / 2 - g_selectInfo.count * r10_92 / 2 - (g_selectInfo.count - 1) * SELECT_WINDOW_PITCH / 2 + (r6_92 - 1) * r10_92 + (r6_92 - 1) * SELECT_WINDOW_PITCH
        if r13_92 <= r0_92 and r14_92 <= r1_92 and r0_92 < r13_92 + r9_92 and r1_92 < r14_92 + r10_92 then
          return r6_92 - 1
        end
      end
    end
  end
  return -1
end
function setSelectTextColor(r0_93, r1_93)
  -- line: [2503, 2517] id: 93
  local r2_93 = "SelTxt" .. tostring(r0_93 + 1)
  local r3_93 = cclass.CLegacyFontInfo:create()
  if r1_93 == 0 then
    r3_93:changeColor("system", r2_93, g_selectTextColor.normal, g_selectTextColor.normalEdge)
  elseif r1_93 == 1 then
    r3_93:changeColor("system", r2_93, g_selectTextColor.already, g_selectTextColor.alreadyEdge)
  elseif r1_93 == 2 then
    r3_93:changeColor("system", r2_93, g_selectTextColor.selected, g_selectTextColor.selectedEdge)
  else
    r3_93:changeColor("system", r2_93, g_selectTextColor.disabled, g_selectTextColor.disabledEdge)
  end
end
function isSystemEffect(r0_94)
  -- line: [2520, 2530] id: 94
  -- notice: unreachable block#8
  -- notice: unreachable block#23
  -- notice: unreachable block#28
  -- notice: unreachable block#18
  -- notice: unreachable block#3
  -- notice: unreachable block#13
  local r1_94 = false
  local r2_94 = isDialogEffect()
  if r2_94 == true then
    r2_94 = true
  else
    r2_94 = false
  end
  local r3_94 = isSystemMenuEffect()
  if r3_94 == true then
    r3_94 = true
  else
    r3_94 = false
  end
  local r4_94 = isMessageLogEffect()
  if r4_94 == true then
    r4_94 = true
  else
    r4_94 = false
  end
  local r5_94 = isConfigBaseEffect()
  if r5_94 == true then
    r5_94 = true
  else
    r5_94 = false
  end
  local r6_94 = isCmdLineEffect()
  if r6_94 == true then
    r6_94 = true
  else
    r6_94 = false
  end
  local r7_94 = isLuaMenuEffect()
  if r7_94 == true then
    r7_94 = true
  else
    r7_94 = false
  end
  return r2_94 or r3_94 or r4_94 or r5_94 or r6_94 or r7_94
end
g_sysMenuNormal = {}
g_sysMenuSelect = {}
g_sysMenuAll = {
  g_sysMenuNormal,
  g_sysMenuSelect
}
function isSystemMenuEffect()
  -- line: [2541, 2567] id: 95
  local r0_95 = cclass.lua_Layers:create()
  local r1_95 = r0_95:isEffect("sysmenu", "SysMenuDisp")
  if r1_95 == false then
    r1_95 = r0_95:isTransition("sysmenu")
  end
  if g_sysmenuInfo.effect == true and r1_95 == false then
    if g_sysmenuInfo.enabled == false then
      r0_95:remove("sysmenu")
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
    else
      local r2_95 = 0
      local r3_95 = 0
      local r4_95 = cclass.lua_AutoCursor:new()
      r2_95, r3_95 = r4_95:GetCursorPos(r2_95, r3_95)
      r4_95:delete()
      local r5_95 = r0_95:getCursorPos("sysmenu", r2_95, r3_95, 0)
      changeSystemMenuFocus(r5_95 - 1)
      g_sysmenuInfo.selCursor = r5_95 - 1
    end
    g_sysmenuInfo.effect = false
  end
  return r1_95
end
function openSystemMenu()
  -- line: [2570, 2643] id: 96
  local r0_96 = cclass.lua_Layers:create()
  if r0_96:add("sysmenu") == false then
    return false
  end
  local r2_96 = cclass.lua_Sounds:new()
  r2_96:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  r2_96:delete()
  local r3_96 = cclass.lua_MeasureTime:new()
  r0_96:insertLayer("sysmenu", "SysMenu01", LUA_LAYER_PNA, getGraphicsArcFileName("sysmenu", "Sys_SysMenu.pna"), "Sys_SysMenu.pna", 1)
  r0_96:setParam("sysmenu", "SysMenu01", LUA_PARAM_COLOR, 1, 1, 1, 0)
  r0_96:initSubLayer("sysmenu", "SysMenu01", 25, 1)
  r0_96:initSubLayer("sysmenu", "SysMenu01", 24, 1)
  local r5_96 = g_sysMenuNormal
  local r6_96 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA)
  if r6_96 == true then
    r6_96 = 1 or 15
  else
    goto label_75	-- block#4 is visited secondly
  end
  r5_96[1] = r6_96
  r5_96 = g_sysMenuNormal
  r6_96 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA)
  if r6_96 ~= true then
    r6_96 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD)
    if r6_96 == false then
      ::label_90::
      r6_96 = 2 or 16
    else
      goto label_93	-- block#8 is visited secondly
    end
  else
    goto label_90	-- block#7 is visited secondly
  end
  r5_96[2] = r6_96
  g_sysMenuNormal[3] = 17
  g_sysMenuNormal[4] = 20
  g_sysMenuNormal[5] = 21
  g_sysMenuNormal[6] = 22
  g_sysMenuSelect[1] = 5
  g_sysMenuSelect[2] = 6
  g_sysMenuSelect[3] = 7
  g_sysMenuSelect[4] = 10
  g_sysMenuSelect[5] = 11
  g_sysMenuSelect[6] = 12
  for r8_96, r9_96 in pairs(g_sysMenuAll) do
    for r13_96, r14_96 in pairs(r9_96) do
      r0_96:initSubLayer("sysmenu", "SysMenu01", r14_96, 1)
      r0_96:setSubLayerParam("sysmenu", "SysMenu01", r14_96, LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
  r5_96 = -1
  for r9_96, r10_96 in pairs(g_sysMenuNormal) do
    r0_96:setSubLayerParam("sysmenu", "SysMenu01", r10_96, LUA_PARAM_COLOR, 1, 1, 1, 1)
    if r10_96 ~= 1 and r10_96 ~= 2 then
      r0_96:setSubLayerHitTest("sysmenu", "SysMenu01", r10_96, 1, 0)
      if r5_96 < 0 then
        r5_96 = r10_96
      end
    end
  end
  r6_96 = 0
  local r7_96 = 0
  local r9_96 = 0
  r6_96, r7_96, r8_96, r9_96 = r0_96:getSubLayerParam("sysmenu", "SysMenu01", r5_96, LUA_PARAM_SIZE, r6_96, r7_96, 0, r9_96)
  local r10_96 = 0
  local r11_96 = 0
  r10_96, r11_96, r12_96, r9_96 = r0_96:getSubLayerParam("sysmenu", "SysMenu01", r5_96, LUA_PARAM_POS, r10_96, r11_96, 0, r9_96)
  local r13_96 = cclass.lua_AutoCursor:new()
  r13_96:AutoCursor(r10_96 + r6_96 / 2, r11_96 + r7_96 / 2, 250)
  r13_96:SetCursor(0)
  r13_96:delete()
  r0_96:setEffect("sysmenu", "SysMenu01", "SysMenuDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * getEffectRate(), 0, 0)
  r0_96:startEffect("sysmenu", "SysMenu01", "SysMenuDisp", 0)
  g_sysmenuInfo.enabled = true
  g_sysmenuInfo.effect = true
  g_sysmenuInfo.selCursor = -1
  r3_96:delete()
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
end
function closeSystemMenu(r0_97, r1_97, r2_97)
  -- line: [2646, 2667] id: 97
  local r3_97 = cclass.lua_Layers:create()
  local r4_97 = getEffectRate()
  if r1_97 == false then
    local r5_97 = cclass.lua_Sounds:new()
    if r0_97 == true then
      r5_97:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    else
      r5_97:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    end
    r5_97:delete()
    r3_97:setEffect("sysmenu", "SysMenu01", "SysMenuDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r4_97, 0, 0)
    r3_97:startEffect("sysmenu", "SysMenu01", "SysMenuDisp", 0)
  else
    r3_97:startTransition("sysmenu", 0, 1, 500 * getEffectRate(), 0, LUA_TRANSITION_ERASE)
  end
  if r2_97 == false then
    g_sysmenuInfo.effect = true
  end
  g_sysmenuInfo.enabled = false
end
function deleteSystemMenu()
  -- line: [2670, 2675] id: 98
  cclass.lua_Layers:create():remove("sysmenu")
  g_sysmenuInfo.effect = false
  g_sysmenuInfo.enabled = false
end
function onLButtonDownSystemMenu(r0_99, r1_99)
  -- line: [2678, 2717] id: 99
  if g_sysmenuInfo.effect == false then
    local r2_99 = cclass.lua_Layers:create()
    local r3_99 = cclass.lua_Sounds:new()
    if r1_99 == 15 then
      deleteSystemMenu()
      r2_99:rtSnap("system")
      openConfig(4, true)
    elseif r1_99 == 16 then
      deleteSystemMenu()
      r2_99:rtSnap("system")
      openConfig(5, true)
    elseif r1_99 == 17 then
      deleteSystemMenu()
      r2_99:rtSnap("system")
      openConfig(1, true)
    elseif r1_99 ~= 18 and r1_99 ~= 19 then
      if r1_99 == 20 then
        local r4_99 = cclass.lua_Sounds:new()
        r4_99:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
        r4_99:delete()
        r2_99:setSnap("sysmenu", false)
        openConfirm(LUA_CONFIRM_TITLE)
      elseif r1_99 == 21 then
        closeSystemMenu(false, false, false)
      elseif r1_99 == 22 then
        local r4_99 = cclass.lua_Sounds:new()
        r4_99:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
        r4_99:delete()
        openConfirm(LUA_CONFIRM_QUIT)
      end
    end
    r3_99:delete()
  end
end
function onRButtonDownSystemMenu(r0_100, r1_100)
  -- line: [2720, 2724] id: 100
  if g_sysmenuInfo.effect == false then
    closeSystemMenu(true, false, false)
  end
end
function onMouseMoveSystemMenu(r0_101, r1_101, r2_101, r3_101)
  -- line: [2727, 2734] id: 101
  if g_sysmenuInfo.effect == false and g_sysmenuInfo.selCursor ~= r1_101 then
    changeSystemMenuFocus(r1_101)
    g_sysmenuInfo.selCursor = r1_101
  end
end
function changeSystemMenuFocus(r0_102)
  -- line: [2737, 2753] id: 102
  local r1_102 = cclass.lua_Layers:create()
  if r0_102 >= 0 then
    local r2_102 = cclass.lua_Sounds:new()
    r2_102:SndPlay("systemse2", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
    r2_102:delete()
  end
  for r5_102, r6_102 in pairs(g_sysMenuNormal) do
    if r0_102 == r6_102 then
      r1_102:setSubLayerParam("sysmenu", "SysMenu01", r6_102, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_102:setSubLayerParam("sysmenu", "SysMenu01", g_sysMenuSelect[r5_102], LUA_PARAM_COLOR, 1, 1, 1, 1)
    elseif g_sysmenuInfo.selCursor == r6_102 then
      r1_102:setSubLayerParam("sysmenu", "SysMenu01", r6_102, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_102:setSubLayerParam("sysmenu", "SysMenu01", g_sysMenuSelect[r5_102], LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
end
function isDialogEffect()
  -- line: [2759, 2791] id: 103
  local r0_103 = cclass.lua_Layers:create()
  local r1_103 = r0_103:isEffect("dialog", "DialogDisp")
  if g_dialogInfo.effect == true and r1_103 == false then
    if g_dialogInfo.enabled == false then
      if g_skipConfirm == true then
        executeProcess()
        g_dialogInfo.effect = false
        return 
      end
      r0_103:remove("dialog")
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      g_dialogInfo.confirmDialog = 0
      cfunc.D3DApp__lua_PostMouseMove()
    else
      local r2_103 = 0
      local r3_103 = 0
      local r4_103 = cclass.lua_AutoCursor:new()
      r2_103, r3_103 = r4_103:GetCursorPos(r2_103, r3_103)
      r4_103:delete()
      local r5_103 = r0_103:getCursorPos("dialog", r2_103, r3_103, 0)
      changeDialogFocus(r5_103 - 1)
      g_dialogInfo.selCursor = r5_103 - 1
    end
    g_dialogInfo.effect = false
  end
  return r1_103
end
function openCmdLine()
  -- line: [2793, 2814] id: 104
  local r0_104 = cclass.lua_Layers:create()
  if r0_104:add("cmdLine") == false then
    return false
  end
  r0_104:insertLayer("cmdLine", "CmdLine01", LUA_LAYER_PNA, getGraphicsArcFileName("cmdLine", "Sys_CmdLine.pna"), "Sys_CmdLine.pna", 1)
  for r6_104 = 1, 13, 1 do
    local r1_104 = r0_104:initSubLayer("cmdLine", "CmdLine01", r6_104, 1)
  end
  local r3_104 = 0
  local r4_104 = 0
  local r5_104 = 0
  local r6_104 = 0
  r3_104, r4_104, r5_104, r6_104 = r0_104:getSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_SIZE, r3_104, r4_104, r5_104, r6_104)
  r0_104:insertCommandLineLayer("cmdLine", "inputLine", cfunc.LegacyGame__lua_GetString("@FIRST", true), r3_104, r4_104, 8, 1, 8, 1, 0.25, 1, 5)
  r3_104, r4_104, r5_104, r6_104 = r0_104:getSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_POS, r3_104, r4_104, r5_104, r6_104)
  r0_104:setParam("cmdLine", "inputLine", LUA_PARAM_POS, r3_104, r4_104, r5_104, r6_104)
  g_cmdLineInfo.enabled = true
  g_cmdLineInfo.effect = false
  cfunc.LegacyGame__lua_NeedShell("http://www.will-japan.co.jp/")
end
function isCmdLineEffect()
  -- line: [2816, 2818] id: 105
  return false
end
function setIMState()
  -- line: [2820, 2861] id: 106
  local r0_106 = cclass.lua_Layers:create()
  local r1_106 = 0
  local r2_106 = 0
  local r3_106 = 0
  local r4_106 = 0
  r1_106, r2_106, r3_106, r4_106 = r0_106:getIMStatus("cmdLine", "inputLine", r1_106, r2_106, r3_106, r4_106)
  if r1_106 == 0 and r2_106 ~= 5 then
    r2_106 = 0
  end
  if r2_106 == 1 or r2_106 == 2 or r2_106 == 3 then
    r0_106:setSubLayerVisible("cmdLine", "CmdLine01", 10, 0)
    r0_106:setSubLayerVisible("cmdLine", "CmdLine01", 11, 1)
  else
    r0_106:setSubLayerVisible("cmdLine", "CmdLine01", 10, 1)
    r0_106:setSubLayerVisible("cmdLine", "CmdLine01", 11, 0)
  end
  local r5_106 = 5
  if r2_106 == 1 then
    r5_106 = 9
  elseif r2_106 == 2 then
    r5_106 = 8
  elseif r2_106 == 3 then
    r5_106 = 7
  elseif r2_106 == 4 then
    r5_106 = 6
  end
  local r15_106 = nil	-- notice: implicit variable refs by block#[20]
  for r9_106 = 5, 9, 1 do
    local r12_106 = "cmdLine"
    local r13_106 = "CmdLine01"
    local r14_106 = r9_106
    if r9_106 == r5_106 then
      r15_106 = 1
      if not r15_106 then
        ::label_85::
        r15_106 = 0
      end
    else
      goto label_85	-- block#19 is visited secondly
    end
    r0_106:setSubLayerVisible(r12_106, r13_106, r14_106, r15_106)
  end
  local r8_106 = "cmdLine"
  local r9_106 = "CmdLine01"
  local r10_106 = 1
  local r11_106 = nil	-- notice: implicit variable refs by block#[25, 28, 31, 34]
  if r3_106 == 1 then
    r11_106 = 0
    if not r11_106 then
      ::label_97::
      r11_106 = 1
    end
  else
    goto label_97	-- block#24 is visited secondly
  end
  r0_106:setSubLayerVisible(r8_106, r9_106, r10_106, r11_106)
  r8_106 = "cmdLine"
  r9_106 = "CmdLine01"
  r10_106 = 2
  if r3_106 == 1 then
    r11_106 = 1
    if not r11_106 then
      ::label_108::
      r11_106 = 0
    end
  else
    goto label_108	-- block#27 is visited secondly
  end
  r0_106:setSubLayerVisible(r8_106, r9_106, r10_106, r11_106)
  r8_106 = "cmdLine"
  r9_106 = "CmdLine01"
  r10_106 = 3
  if r4_106 == 1 then
    r11_106 = 0
    if not r11_106 then
      ::label_119::
      r11_106 = 1
    end
  else
    goto label_119	-- block#30 is visited secondly
  end
  r0_106:setSubLayerVisible(r8_106, r9_106, r10_106, r11_106)
  r8_106 = "cmdLine"
  r9_106 = "CmdLine01"
  r10_106 = 4
  if r4_106 == 1 then
    r11_106 = 1
    if not r11_106 then
      ::label_130::
      r11_106 = 0
    end
  else
    goto label_130	-- block#33 is visited secondly
  end
  r0_106:setSubLayerVisible(r8_106, r9_106, r10_106, r11_106)
  for r9_106 = 1, 12, 1 do
    local r12_106 = "cmdLine"
    local r13_106 = "CmdLine01"
    local r14_106 = r9_106
    r15_106 = LUA_PARAM_COLOR
    local r16_106 = 1
    local r17_106 = 1
    local r18_106 = 1
    local r19_106 = nil	-- notice: implicit variable refs by block#[38]
    if r1_106 == 1 then
      r19_106 = 1
      if not r19_106 then
        ::label_149::
        r19_106 = 0.5
      end
    else
      goto label_149	-- block#37 is visited secondly
    end
    r0_106:setSubLayerParam(r12_106, r13_106, r14_106, r15_106, r16_106, r17_106, r18_106, r19_106)
  end
end
function openConfirm(r0_107)
  -- line: [2864, 2936] id: 107
  local r1_107 = {
    SYSVOICE_CONFIRMTITLE,
    SYSVOICE_CONFIRMGALLERY,
    SYSVOICE_CONFIRMOVERWRITE,
    SYSVOICE_CONFIRMLOAD,
    SYSVOICE_CONFIRMQUICK,
    SYSVOICE_CONFIRMQUIT,
    SYSVOICE_CONFIRMDEFAULT
  }
  if cfunc.LegacyGame__lua_GetFlag(127) == true and r0_107 == LUA_CONFIRM_TITLE then
    r0_107 = LUA_CONFIRM_ALBUM
  end
  if g_dialogInfo.confirmDialog == 0 then
    g_dialogInfo.confirmDialog = r0_107
    local r3_107 = cclass.lua_Layers:create()
    if g_skipConfirm == true then
      g_dialogInfo.effect = true
      g_dialogInfo.enabled = false
      g_dialogInfo.selCursor = -1
      return 
    end
    if r3_107:add("dialog") == false then
      return false
    end
    local r5_107 = cclass.lua_MeasureTime:new()
    r3_107:insertLayer("dialog", "Dialog01", LUA_LAYER_PNA, getGraphicsArcFileName("dialog", "Sys_Dialog.pna"), "Sys_Dialog.pna", 1)
    r3_107:setParam("dialog", "Dialog01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_107:initSubLayer("dialog", "Dialog01", 14, 1)
    if r0_107 == LUA_CONFIRM_SELECTLOAD then
      r3_107:initSubLayer("dialog", "Dialog01", 4 + LUA_CONFIRM_LOAD, 1)
    else
      r3_107:initSubLayer("dialog", "Dialog01", 4 + r0_107, 1)
    end
    for r10_107 = 0, 3, 1 do
      r3_107:initSubLayer("dialog", "Dialog01", r10_107, 1)
      if r10_107 >= 2 then
        r3_107:setSubLayerParam("dialog", "Dialog01", r10_107, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_107:setSubLayerHitTest("dialog", "Dialog01", r10_107, 1, 0)
      else
        r3_107:setSubLayerParam("dialog", "Dialog01", r10_107, LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
    end
    local r7_107 = 0
    local r8_107 = 0
    local r10_107 = 0
    r7_107, r8_107, r9_107, r10_107 = r3_107:getSubLayerParam("dialog", "Dialog01", 3, LUA_PARAM_SIZE, r7_107, r8_107, 0, r10_107)
    local r11_107 = 0
    local r12_107 = 0
    r11_107, r12_107, r13_107, r10_107 = r3_107:getSubLayerParam("dialog", "Dialog01", 3, LUA_PARAM_POS, r11_107, r12_107, 0, r10_107)
    local r14_107 = cclass.lua_AutoCursor:new()
    r14_107:AutoCursor(r11_107 + r7_107 / 2, r12_107 + r8_107 / 2, 250)
    r14_107:SetCursor(0)
    r14_107:delete()
    r3_107:setEffect("dialog", "Dialog01", "DialogDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * getEffectRate(), 0, 0)
    r3_107:startEffect("dialog", "Dialog01", "DialogDisp", 0)
    g_dialogInfo.effect = true
    g_dialogInfo.enabled = true
    g_dialogInfo.selCursor = -1
    r5_107:delete()
    if r1_107[g_dialogInfo.confirmDialog] ~= nil then
      playSystemVoice(r1_107[g_dialogInfo.confirmDialog])
    end
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  end
end
function closeConfirm(r0_108)
  -- line: [2939, 2965] id: 108
  if g_skipConfirm == true then
    g_dialogInfo.confirmDialog = 0
    return 
  end
  local r1_108 = cclass.lua_Sounds:new()
  if r0_108 == false then
    r1_108:SndPlay("systemse2", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  else
    r1_108:SndPlay("systemse2", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  end
  r1_108:SndStop("%SysVoice%")
  r1_108:delete()
  local r2_108 = cclass.lua_Layers:create()
  r2_108:setEffect("dialog", "Dialog01", "DialogDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * getEffectRate(), 0, 0)
  r2_108:startEffect("dialog", "Dialog01", "DialogDisp", 0)
  g_dialogInfo.effect = true
  g_dialogInfo.enabled = false
  if r0_108 == true then
    local r4_108 = cclass.lua_AutoCursor:new()
    r4_108:RestoreCursor(250)
    r4_108:delete()
  end
end
function executeProcess()
  -- line: [2968, 3027] id: 109
  if g_dialogInfo.confirmDialog == LUA_CONFIRM_QUIT then
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUIT, 0)
  elseif g_dialogInfo.confirmDialog == LUA_CONFIRM_QUICKLOAD then
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKLOADGAME, -1)
    closeConfirm(false)
  elseif g_dialogInfo.confirmDialog == LUA_CONFIRM_LOAD then
    if g_dataInfo.page == 11 then
      local r0_109 = 58 - g_dataInfo.selCursor + 1
      if r0_109 < 6 then
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_AUTOLOADGAME, g_autoOrder[r0_109])
      else
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKLOADGAME, g_quickOrder[r0_109 - 5])
      end
    else
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_LOADGAME, (g_dataInfo.page - 1) * 10 + 58 - g_dataInfo.selCursor + 1)
    end
    closeConfirm(false)
    cclass.lua_Layers:create():removeSnap("system")
    local r1_109 = cclass.lua_Sounds:new()
    r1_109:BgmStop("systembgm", 500)
    r1_109:delete()
    g_menuExecute = false
    closeConfig()
  elseif g_dialogInfo.confirmDialog == LUA_CONFIRM_OVERWRITE then
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SAVEGAME, (g_dataInfo.page - 1) * 10 + 58 - g_dataInfo.selCursor + 1)
    closeConfirm(true)
  elseif g_dialogInfo.confirmDialog == LUA_CONFIRM_TITLE or g_dialogInfo.confirmDialog == LUA_CONFIRM_ALBUM then
    cclass.lua_Layers:create():removeSnap("system")
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_TITLE, 0)
    closeConfirm(false)
    if g_configInfo.enabled == true then
      closeConfig()
    end
    if g_sysmenuInfo.enabled == true then
      closeSystemMenu(false, true, false)
    end
  elseif g_dialogInfo.confirmDialog == LUA_CONFIRM_DEFAULT then
    closeConfirm(false)
    defaultSetting()
  elseif g_dialogInfo.confirmDialog == LUA_CONFIRM_MEMLOAD then
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_BACKGAME, cclass.lua_Layers:create():getIndexLogLayerText("messageLog", "LogText01", g_logInfo.selLine))
    closeConfirm(false)
    cclass.lua_Layers:create():removeSnap("system")
    g_menuExecute = false
    closeMessageLog()
  elseif g_dialogInfo.confirmDialog == LUA_CONFIRM_SELECTLOAD then
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SELECTLOADGAME, -1)
    closeConfirm(false)
  end
end
function onLButtonDownDialog(r0_110, r1_110)
  -- line: [3030, 3040] id: 110
  if g_dialogInfo.effect == false then
    if r1_110 == 2 then
      closeConfirm(true)
    elseif r1_110 == 3 then
      executeProcess()
    end
  end
end
function onRButtonDownDialog(r0_111, r1_111)
  -- line: [3043, 3047] id: 111
  if g_dialogInfo.effect == false then
    closeConfirm(true)
  end
end
function onMouseMoveDialog(r0_112, r1_112, r2_112, r3_112)
  -- line: [3050, 3057] id: 112
  if g_dialogInfo.effect == false and g_dialogInfo.selCursor ~= r1_112 then
    changeDialogFocus(r1_112)
    g_dialogInfo.selCursor = r1_112
  end
end
function onKeyDownDialog(r0_113, r1_113)
  -- line: [3060, 3085] id: 113
  if r1_113 == true then
    return 
  end
  if g_dialogInfo.effect == false then
    if r0_113 == LUA_KEYCODE_RIGHT and g_dialogInfo.selCursor ~= 2 then
      changeDialogFocus(2)
      g_dialogInfo.selCursor = 2
    elseif r0_113 == LUA_KEYCODE_ENTER then
      if g_dialogInfo.selCursor == 2 then
        closeConfirm(true)
      elseif g_dialogInfo.selCursor == 3 then
        executeProcess()
      end
    elseif r0_113 == LUA_KEYCODE_SPACE then
      closeConfirm(true)
    end
  end
  -- warn: not visited block [5]
  -- block#5:
  -- changeDialogFocus(3)
  -- g_dialogInfo.selCursor = 3
  -- goto label_57
end
function changeDialogFocus(r0_114)
  -- line: [3088, 3105] id: 114
  local r1_114 = cclass.lua_Layers:create()
  if r0_114 >= 0 then
    local r2_114 = cclass.lua_Sounds:new()
    r2_114:SndPlay("systemse2", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
    r2_114:delete()
  end
  for r5_114 = 2, 3, 1 do
    if r0_114 == r5_114 then
      r1_114:setSubLayerParam("dialog", "Dialog01", r5_114, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_114:setSubLayerParam("dialog", "Dialog01", r5_114 - 2, LUA_PARAM_COLOR, 1, 1, 1, 1)
    elseif g_dialogInfo.selCursor == r5_114 then
      r1_114:setSubLayerParam("dialog", "Dialog01", r5_114, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_114:setSubLayerParam("dialog", "Dialog01", r5_114 - 2, LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
end
g_logButtons = {
  1,
  8,
  13,
  6
}
g_logDisable = {
  1,
  8,
  13
}
g_logNormal = {
  2,
  9,
  14
}
g_logSelect = {
  3,
  10,
  15
}
g_logAll = {
  g_logButtons,
  g_logDisable,
  g_logNormal,
  g_logSelect
}
g_logTextColor = {
  normal = 4294967295,
  normalEdge = 255,
  voice = 4227509247,
  voiceEdge = 255,
}
function isMessageLogEffect()
  -- line: [3119, 3150] id: 115
  local r0_115 = cclass.lua_Layers:create()
  local r1_115 = r0_115:isTransition("messageLog")
  if g_logInfo.effect == true and r1_115 == false then
    if g_logInfo.enabled == false then
      r0_115:remove("messageLog")
      r0_115:removeSnap("system")
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
    else
      setMessageLogButtonState()
      local r2_115 = 0
      local r3_115 = 0
      local r4_115 = cclass.lua_AutoCursor:new()
      r2_115, r3_115 = r4_115:GetCursorPos(r2_115, r3_115)
      r4_115:delete()
      local r5_115 = r0_115:getCursorPos("messageLog", r2_115, r3_115, 0)
      changeMessageLogFocus(r5_115 - 1)
      g_logInfo.selCursor = r5_115 - 1
      local r6_115 = r0_115:hitTestLogLayerText("messageLog", "LogText01", r2_115, r3_115)
      changeMessageLogTextFocus(r6_115, false)
      g_logInfo.textCursor = r6_115
      checkTextLineFocus(r2_115, r3_115)
    end
    g_logInfo.effect = false
  end
  return r1_115
end
function setMessageLogButtonState()
  -- line: [3153, 3189] id: 116
  local r0_116 = cclass.lua_Layers:create()
  r0_116:setSubLayerParam("messageLog", "Log01", g_logDisable[1], LUA_PARAM_COLOR, 1, 1, 1, 0)
  local r1_116 = nil
  local r2_116 = nil
  if g_logInfo.selCursor == 1 then
    r1_116 = g_logSelect[1] or g_logNormal[1]
  else
    goto label_24	-- block#2 is visited secondly
  end
  if g_logInfo.selCursor == 1 then
    r2_116 = g_logNormal[1] or g_logSelect[1]
  else
    goto label_34	-- block#5 is visited secondly
  end
  r0_116:setSubLayerParam("messageLog", "Log01", r1_116, LUA_PARAM_COLOR, 1, 1, 1, 1)
  r0_116:setSubLayerParam("messageLog", "Log01", r2_116, LUA_PARAM_COLOR, 1, 1, 1, 0)
  local r3_116 = false
  local r4_116 = false
  r3_116, r4_116 = r0_116:getLogButtonState("messageLog", "LogText01", r3_116, r4_116)
  if r3_116 == false then
    r0_116:setSubLayerParam("messageLog", "Log01", g_logDisable[2], LUA_PARAM_COLOR, 1, 1, 1, 1)
    r0_116:setSubLayerParam("messageLog", "Log01", g_logNormal[2], LUA_PARAM_COLOR, 1, 1, 1, 0)
    r0_116:setSubLayerParam("messageLog", "Log01", g_logSelect[2], LUA_PARAM_COLOR, 1, 1, 1, 0)
  else
    r0_116:setSubLayerParam("messageLog", "Log01", g_logDisable[2], LUA_PARAM_COLOR, 1, 1, 1, 0)
    if g_logInfo.selCursor == 8 then
      r1_116 = g_logSelect[2] or g_logNormal[2]
    else
      goto label_121	-- block#10 is visited secondly
    end
    if g_logInfo.selCursor == 8 then
      r2_116 = g_logNormal[2] or g_logSelect[2]
    else
      goto label_131	-- block#13 is visited secondly
    end
    r0_116:setSubLayerParam("messageLog", "Log01", r1_116, LUA_PARAM_COLOR, 1, 1, 1, 1)
    r0_116:setSubLayerParam("messageLog", "Log01", r2_116, LUA_PARAM_COLOR, 1, 1, 1, 0)
  end
  if r4_116 == false then
    r0_116:setSubLayerParam("messageLog", "Log01", g_logDisable[3], LUA_PARAM_COLOR, 1, 1, 1, 1)
    r0_116:setSubLayerParam("messageLog", "Log01", g_logNormal[3], LUA_PARAM_COLOR, 1, 1, 1, 0)
    r0_116:setSubLayerParam("messageLog", "Log01", g_logSelect[3], LUA_PARAM_COLOR, 1, 1, 1, 0)
  else
    r0_116:setSubLayerParam("messageLog", "Log01", g_logDisable[3], LUA_PARAM_COLOR, 1, 1, 1, 0)
    if g_logInfo.selCursor == 13 then
      r1_116 = g_logSelect[3] or g_logNormal[3]
    else
      goto label_208	-- block#19 is visited secondly
    end
    if g_logInfo.selCursor == 13 then
      r2_116 = g_logNormal[3] or g_logSelect[3]
    else
      goto label_218	-- block#22 is visited secondly
    end
    r0_116:setSubLayerParam("messageLog", "Log01", r1_116, LUA_PARAM_COLOR, 1, 1, 1, 1)
    r0_116:setSubLayerParam("messageLog", "Log01", r2_116, LUA_PARAM_COLOR, 1, 1, 1, 0)
  end
  local r5_116 = 0
  local r6_116 = 0
  r5_116, r6_116 = r0_116:getLogTextLine("messageLog", "LogText01", r5_116, r6_116)
  g_logInfo.scrollBar:setSliderPos(r5_116, r6_116)
end
function openMessageLog()
  -- line: [3192, 3257] id: 117
  local r0_117 = cclass.lua_Layers:create()
  if r0_117:add("messageLog") == false then
    return false
  end
  local r2_117 = cclass.lua_MeasureTime:new()
  local r3_117 = getGraphicsArcFileName("messageLog", "Sys_Log.pna")
  r0_117:insertLayer("messageLog", "Log01", LUA_LAYER_PNA, r3_117, "Sys_Log.pna", 1)
  r0_117:initSubLayer("messageLog", "Log01", 25, 1)
  r0_117:initSubLayer("messageLog", "Log01", 21, 0)
  r0_117:initSubLayer("messageLog", "Log01", 20, 0)
  r0_117:initSubLayer("messageLog", "Log01", 24, 0)
  r0_117:initSubLayer("messageLog", "Log01", 23, 0)
  r0_117:initSubLayer("messageLog", "Log01", 22, 0)
  r0_117:initSubLayer("messageLog", "Log01", 19, 1)
  r0_117:initSubLayer("messageLog", "Log01", 18, 0)
  for r7_117, r8_117 in pairs(g_logAll) do
    for r12_117, r13_117 in pairs(r8_117) do
      r0_117:initSubLayer("messageLog", "Log01", r13_117, 1)
    end
  end
  for r7_117 = 1, #g_logNormal, 1 do
    r0_117:setSubLayerParam("messageLog", "Log01", g_logDisable[r7_117], LUA_PARAM_COLOR, 1, 1, 1, 1)
    r0_117:setSubLayerParam("messageLog", "Log01", g_logNormal[r7_117], LUA_PARAM_COLOR, 1, 1, 1, 0)
    r0_117:setSubLayerParam("messageLog", "Log01", g_logSelect[r7_117], LUA_PARAM_COLOR, 1, 1, 1, 0)
  end
  r0_117:setSubLayerParam("messageLog", "Log01", 6, LUA_PARAM_COLOR, 1, 1, 1, 0)
  g_logInfo.scrollBar = ScrollBar.new("messageLog", "Log01", 6, 1207, 112, 25, 495)
  for r7_117, r8_117 in pairs(g_logButtons) do
    r0_117:setSubLayerHitTest("messageLog", "Log01", r8_117, 1, 0)
  end
  r0_117:insertLayer("messageLog", "LogPrevBase", LUA_LAYER_PNA, r3_117, "Sys_Preview.pna", 0)
  r0_117:initSubLayer("messageLog", "LogPrevBase", 0, 1)
  r0_117:insertLogLayer("messageLog", "LogText01", 744, 720, 1, 36, 24, 36, 0.25, 1)
  local r4_117 = 0
  r4_117, r5_117, r6_117, r7_117 = r0_117:getParam("system", "Msg01", LUA_PARAM_POS, r4_117, 0, 0, 0)
  r0_117:setParam("messageLog", "LogText01", LUA_PARAM_POS, r4_117 + 240, 0, 0, 0)
  g_logInfo.enabled = true
  g_logInfo.effect = true
  g_logInfo.selCursor = -1
  g_logInfo.selText = -1
  g_logInfo.selLine = -1
  g_logInfo.iconCount = 0
  r0_117:setSnap("system", true)
  local r8_117 = getEffectRate()
  r0_117:copySnap("messageLog", "system")
  r0_117:startTransition("messageLog", 0, 1, 300 * r8_117, 0, LUA_TRANSITION_NORMAL)
  r2_117:delete()
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
end
function closeMessageLog()
  -- line: [3260, 3272] id: 118
  local r0_118 = cclass.lua_Sounds:new()
  r0_118:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  r0_118:delete()
  local r1_118 = cclass.lua_Layers:create()
  r1_118:stopLogVoice("messageLog", "LogText01")
  local r2_118 = getEffectRate()
  r1_118:setSnap("messageLog", false)
  r1_118:startTransition("messageLog", 0, 1, 300 * r2_118, 0, LUA_TRANSITION_ERASE)
  g_logInfo.effect = true
  g_logInfo.enabled = false
end
function checkTextLineFocus(r0_119, r1_119)
  -- line: [3275, 3319] id: 119
  -- notice: unreachable block#7
  local r2_119 = cclass.lua_Layers:create()
  local r3_119 = r2_119:getTextLineLogLayerText("messageLog", "LogText01", r1_119)
  local r4_119 = g_logInfo.selLine
  if r3_119 >= 0 then
    local r5_119 = 0
    r5_119, r6_119, r7_119, r8_119 = r2_119:getSubLayerParam("messageLog", "Log01", 20, LUA_PARAM_POS, r5_119, 0, 0, 0)
    local r9_119 = 0
    r9_119, r10_119, r11_119, r12_119 = r2_119:getSubLayerParam("messageLog", "Log01", 20, LUA_PARAM_SIZE, r9_119, 0, 0, 0)
    if r0_119 < r5_119 or r5_119 + r9_119 <= r0_119 then
      r3_119 = -1
    end
    local r13_119 = g_logInfo.selLine
    if r13_119 == r3_119 then
      r13_119 = true
    else
      r13_119 = false
    end
    changeMessageLogLineFocus(r3_119, r13_119)
    g_logInfo.selLine = r3_119
  elseif g_logInfo.selLine ~= -1 then
    changeMessageLogLineFocus(r3_119, true)
    g_logInfo.selLine = r3_119
  end
  if g_logInfo.selLine ~= r4_119 then
    if g_logInfo.selLine >= 0 then
      local r5_119 = r2_119:getIndexLogLayerText("messageLog", "LogText01", g_logInfo.selLine)
      r2_119:insertPNARefLayer("messageLog", "LogPrevBaseR", "LogPrevBase", 0, 1)
      r2_119:insertLogPreviewLayer("messageLog", "LogPreview", r5_119, 210, 120, 1)
      local r7_119 = 0
      local r9_119 = 0
      r6_119, r7_119, r8_119, r9_119 = r2_119:getLogTextRectIndex("messageLog", "LogText01", g_logInfo.selLine, 0, r7_119, 0, r9_119)
      local r11_119 = 0
      r10_119, r11_119, r12_119, r13_119 = r2_119:getSubLayerParam("messageLog", "Log01", 20, LUA_PARAM_SIZE, 0, r11_119, 0, 0)
      local r14_119 = r7_119 + r9_119 / 2 - r11_119 / 2
      local r16_119 = 0
      r15_119, r16_119, r17_119, r18_119 = r2_119:getParam("messageLog", "LogPrevBaseR", LUA_PARAM_SIZE, 0, r16_119, 0, 0)
      if APP_INTERNAL_HEIGHT < r14_119 + r11_119 + 10 + r16_119 then
        r2_119:setParam("messageLog", "LogPrevBaseR", LUA_PARAM_POS, 4, r14_119 - r16_119 - 10, 0, 0)
        r2_119:setParam("messageLog", "LogPreview", LUA_PARAM_POS, 12, r14_119 - r16_119 - 10 + 7, 0, 0)
      else
        r2_119:setParam("messageLog", "LogPrevBaseR", LUA_PARAM_POS, 4, r14_119 + r11_119 + 10, 0, 0)
        r2_119:setParam("messageLog", "LogPreview", LUA_PARAM_POS, 12, r14_119 + r11_119 + 10 + 7, 0, 0)
      end
    else
      r2_119:removeLayer("messageLog", "LogPrevBaseR")
      r2_119:removeLayer("messageLog", "LogPreview")
    end
  end
end
function onMouseMoveMessageLog(r0_120, r1_120, r2_120, r3_120)
  -- line: [3322, 3366] id: 120
  if g_logInfo.effect == false then
    local r4_120 = cclass.lua_Layers:create()
    if g_logInfo.scrollBar:isDrug() == true and 0 <= r2_120 and 0 <= r3_120 and r2_120 < APP_INTERNAL_WIDTH and r3_120 < APP_INTERNAL_HEIGHT then
      local r5_120 = 0
      local r6_120 = 0
      r5_120, r6_120 = r4_120:getLogTextLine("messageLog", "LogText01", r5_120, r6_120)
      if g_logInfo.scrollBar.rect.left - 100 <= r2_120 and r2_120 < g_logInfo.scrollBar.rect.right + 100 then
        local r7_120 = g_logInfo.scrollBar:getNearSelect(r2_120, r3_120, r5_120)
        if 0 <= r7_120 and r7_120 ~= r6_120 then
          onWheelMouseLogLayer(r6_120 - r7_120, false)
        end
      end
    end
    local r5_120 = false
    local r6_120 = false
    r5_120, r6_120 = r4_120:getLogButtonState("messageLog", "LogText01", r5_120, r6_120)
    local r7_120 = r1_120
    if r7_120 == 8 and r5_120 == false then
      r7_120 = -1
    end
    if r7_120 == 13 and r6_120 == false then
      r7_120 = -1
    end
    local r8_120 = 0
    r8_120, r9_120 = r4_120:getLogTextLine("messageLog", "LogText01", r8_120, 0)
    if r7_120 == 6 and r8_120 < 2 then
      r7_120 = -1
    end
    if g_logInfo.selCursor ~= r7_120 then
      changeMessageLogFocus(r7_120)
      g_logInfo.selCursor = r7_120
    end
    local r10_120 = r4_120:hitTestLogLayerText("messageLog", "LogText01", r2_120, r3_120)
    if g_logInfo.textCursor ~= r10_120 then
      changeMessageLogTextFocus(r10_120, false)
      g_logInfo.textCursor = r10_120
    end
    checkTextLineFocus(r2_120, r3_120)
  end
end
function onWheelMouseLogLayer(r0_121, r1_121)
  -- line: [3369, 3390] id: 121
  -- notice: unreachable block#6
  if cclass.lua_Layers:create():onWheelMouseLogLayer("messageLog", "LogText01", r0_121, r1_121) == true and r1_121 == true then
    closeMessageLog()
    return 
  end
  setMessageLogButtonState()
  local r4_121 = cclass.lua_Layers:create()
  local r5_121 = 0
  local r6_121 = 0
  local r7_121 = cclass.lua_AutoCursor:new()
  r5_121, r6_121 = r7_121:GetCursorPos(r5_121, r6_121)
  r7_121:delete()
  local r8_121 = r4_121:hitTestLogLayerText("messageLog", "LogText01", r5_121, r6_121)
  local r9_121 = g_logInfo.textCursor
  if r9_121 == r8_121 then
    r9_121 = true
  else
    r9_121 = false
  end
  changeMessageLogTextFocus(r8_121, r9_121)
  g_logInfo.textCursor = r8_121
  checkTextLineFocus(r5_121, r6_121)
end
function onLButtonDownMessageLog(r0_122, r1_122, r2_122, r3_122, r4_122)
  -- line: [3393, 3436] id: 122
  -- notice: unreachable block#10
  if g_logInfo.effect == false then
    if r4_122 == false then
      g_logInfo.repeatStart = r1_122
    elseif g_logInfo.repeatStart ~= r1_122 then
      return 
    end
    local r5_122 = g_logInfo.scrollBar:isDrug()
    if r5_122 == true then
      return 
    end
    if r4_122 == true then
      r5_122 = true
    else
      r5_122 = false
    end
    if r4_122 == true and (r1_122 == 8 or r1_122 == 13) then
      r5_122 = false
    end
    if r5_122 == true then
      return 
    end
    if r1_122 == 1 then
      closeMessageLog()
    elseif r1_122 == 8 then
      onWheelMouseLogLayer(1, false)
    elseif r1_122 == 13 then
      onWheelMouseLogLayer(-1, false)
    else
      local r6_122 = cclass.lua_Layers:create()
      local r7_122 = 0
      local r8_122 = 0
      r7_122, r8_122 = r6_122:getLogTextLine("messageLog", "LogText01", r7_122, r8_122)
      local r9_122 = g_logInfo.scrollBar:onLButtonDown(r1_122, r2_122, r3_122, r7_122, r8_122, r4_122)
      if 0 <= r9_122 and r9_122 ~= r8_122 then
        onWheelMouseLogLayer(r8_122 - r9_122, false)
      end
    end
    if g_logInfo.textCursor >= 0 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_LOG_VOICEPLAY, g_logInfo.textCursor)
    end
    if g_logInfo.selLine >= 0 then
      openConfirm(LUA_CONFIRM_MEMLOAD)
    end
  end
end
function onRButtonDownMessageLog(r0_123, r1_123)
  -- line: [3439, 3443] id: 123
  if g_logInfo.effect == false then
    closeMessageLog()
  end
end
function onKeyDownMessageLog(r0_124, r1_124)
  -- line: [3446, 3472] id: 124
  if g_logInfo.effect == false then
    local r2_124 = cclass.lua_Layers:create()
    local r3_124 = 0
    local r4_124 = 0
    r3_124, r4_124 = r2_124:getLogTextLine("messageLog", "LogText01", r3_124, r4_124)
    if r0_124 == LUA_KEYCODE_HOME then
      onWheelMouseLogLayer(r4_124, false)
    elseif r0_124 == LUA_KEYCODE_END then
      onWheelMouseLogLayer(-(r3_124 - r4_124 - 1), false)
    elseif r0_124 == LUA_KEYCODE_UP then
      onWheelMouseLogLayer(1, false)
    elseif r0_124 == LUA_KEYCODE_DOWN then
      onWheelMouseLogLayer(-1, false)
    elseif r0_124 == LUA_KEYCODE_PAGEUP then
      onWheelMouseLogLayer(r2_124:pageUpLogText("messageLog", "LogText01"), false)
    elseif r0_124 == LUA_KEYCODE_PAGEDOWN then
      onWheelMouseLogLayer(-r2_124:getLogTextDrawCount("messageLog", "LogText01", 0), false)
    elseif r0_124 ~= LUA_KEYCODE_ENTER and r0_124 == LUA_KEYCODE_SPACE then
      closeMessageLog()
    end
  end
end
function changeMessageLogFocus(r0_125)
  -- line: [3475, 3520] id: 125
  if g_logInfo.effect == false or g_logInfo.enabled == true then
    local r1_125 = cclass.lua_Layers:create()
    local r2_125 = false
    local r3_125 = false
    r2_125, r3_125 = r1_125:getLogButtonState("messageLog", "LogText01", r2_125, r3_125)
    for r7_125, r8_125 in pairs(g_logButtons) do
      if r8_125 == 6 then
        if r0_125 == 6 or g_logInfo.scrollBar:isDrug() == true then
          r1_125:setSubLayerVisible("messageLog", "Log01", 19, 0)
          r1_125:setSubLayerVisible("messageLog", "Log01", 18, 1)
        else
          r1_125:setSubLayerVisible("messageLog", "Log01", 19, 1)
          r1_125:setSubLayerVisible("messageLog", "Log01", 18, 0)
        end
      elseif r0_125 == r8_125 then
        r1_125:cancelSubLayerEffect("messageLog", "Log01", g_logSelect[r7_125], "btnState2")
        r1_125:setSubLayerEffect("messageLog", "Log01", "btnState2", g_logSelect[r7_125], LUA_EFFECT_SCALE, 0.1, 0.1, 0, 0, 0, 350, 0, 500)
        r1_125:setSubLayerEffect("messageLog", "Log01", "btnState2", g_logSelect[r7_125], LUA_EFFECT_SCALE, -0.1, -0.1, 0, 0, 0, 150, 0, 0)
        r1_125:startSubLayerEffect("messageLog", "Log01", "btnState2", g_logSelect[r7_125], -1)
        r1_125:setSubLayerParam("messageLog", "Log01", g_logSelect[r7_125], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r1_125:setSubLayerParam("messageLog", "Log01", g_logNormal[r7_125], LUA_PARAM_COLOR, 1, 1, 1, 0)
        local r9_125 = cclass.lua_Sounds:new()
        r9_125:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
        r9_125:delete()
      elseif g_logInfo.selCursor == r8_125 then
        r1_125:cancelSubLayerEffect("messageLog", "Log01", g_logSelect[r7_125], "btnState2")
        r1_125:setSubLayerParam("messageLog", "Log01", g_logSelect[r7_125], LUA_PARAM_SCALE, 1, 1, 1, 0)
        if r8_125 == 8 and r2_125 == false or r8_125 == 13 and r3_125 == false then
          r1_125:setSubLayerParam("messageLog", "Log01", g_logSelect[r7_125], LUA_PARAM_COLOR, 1, 1, 1, 0)
          r1_125:setSubLayerParam("messageLog", "Log01", g_logNormal[r7_125], LUA_PARAM_COLOR, 1, 1, 1, 0)
        else
          r1_125:setSubLayerParam("messageLog", "Log01", g_logSelect[r7_125], LUA_PARAM_COLOR, 1, 1, 1, 0)
          r1_125:setSubLayerParam("messageLog", "Log01", g_logNormal[r7_125], LUA_PARAM_COLOR, 1, 1, 1, 1)
        end
      end
    end
  end
end
function drawSceneJumpIcon()
  -- line: [3523, 3584] id: 126
  local r0_126 = cclass.lua_Layers:create()
  local r1_126 = r0_126:getLogTextDrawCount("messageLog", "LogText01", 0)
  if r1_126 <= 0 then
    g_logInfo.iconCount = 0
    return 
  end
  local r3_126 = 0
  r2_126, r3_126 = r0_126:getLogTextLine("messageLog", "LogText01", 0, r3_126)
  local r4_126 = -1
  local r5_126 = 0
  local r6_126 = {}
  for r10_126 = r3_126, r3_126 + r1_126 - 1, 1 do
    local r11_126 = r0_126:getLogLineToIndex("messageLog", "LogText01", r10_126)
    r6_126[r5_126 + 1] = r11_126
    local r12_126 = 0
    r12_126 = r0_126:getIndexLogLayerText("messageLog", "LogText01", r11_126)
    if r4_126 ~= r12_126 then
      if r12_126 >= 0 then
        r5_126 = r5_126 + 1
      end
      r4_126 = r12_126
    end
  end
  if g_logInfo.iconCount ~= r5_126 then
    if g_logInfo.iconCount < r5_126 then
      for r10_126 = g_logInfo.iconCount + 1, r5_126, 1 do
        local r11_126 = "dataIcon" .. tostring(r10_126)
        r0_126:insertPNARefLayer("messageLog", r11_126, "Log01", 21, 1)
        r0_126:swapLayerOrder("messageLog", r11_126, "LogPreview")
        r0_126:swapLayerOrder("messageLog", r11_126, "LogPrevBaseR")
      end
    else
      for r10_126 = r5_126 + 1, g_logInfo.iconCount, 1 do
        r0_126:removeLayer("messageLog", "dataIcon" .. tostring(r10_126))
      end
    end
  end
  g_logInfo.iconCount = r5_126
  local r7_126 = 0
  local r9_126 = 0
  local r10_126 = 0
  r7_126, r8_126, r9_126, r10_126 = r0_126:getSubLayerParam("messageLog", "Log01", 21, LUA_PARAM_POS, r7_126, 0, r9_126, r10_126)
  for r14_126 = 1, g_logInfo.iconCount, 1 do
    local r16_126 = 0
    local r18_126 = 0
    r15_126, r16_126, r17_126, r18_126 = r0_126:getLogTextRectIndex("messageLog", "LogText01", r6_126[r14_126], 0, r16_126, 0, r18_126)
    local r20_126 = 0
    r19_126, r20_126, r21_126, r22_126 = r0_126:getSubLayerParam("messageLog", "Log01", 20, LUA_PARAM_SIZE, 0, r20_126, 0, 0)
    local r23_126 = "dataIcon" .. tostring(r14_126)
    r0_126:setParam("messageLog", r23_126, LUA_PARAM_POS, r7_126, r16_126 + r18_126 / 2 - r20_126 / 2, r9_126, r10_126)
    local r24_126 = r6_126[r14_126]
    if r24_126 ~= g_logInfo.selLine then
      r24_126 = 1 or 0
    else
      goto label_194	-- block#20 is visited secondly
    end
    r0_126:setParam("messageLog", r23_126, LUA_PARAM_COLOR, 1, 1, 1, r24_126)
  end
end
function changeMessageLogLineFocus(r0_127, r1_127)
  -- line: [3587, 3612] id: 127
  local r2_127 = cclass.lua_Layers:create()
  if r0_127 >= 0 then
    r2_127:setSubLayerVisible("messageLog", "Log01", 20, 1)
    local r4_127 = 0
    local r6_127 = 0
    r3_127, r4_127, r5_127, r6_127 = r2_127:getLogTextRect("messageLog", "LogText01", 0, r4_127, 0, r6_127)
    local r8_127 = 0
    r7_127, r8_127, r9_127, r10_127 = r2_127:getSubLayerParam("messageLog", "Log01", 20, LUA_PARAM_SIZE, 0, r8_127, 0, 0)
    local r11_127 = 0
    r11_127, r12_127, r13_127, r14_127 = r2_127:getSubLayerParam("messageLog", "Log01", 20, LUA_PARAM_POS, r11_127, 0, 0, 0)
    r2_127:setSubLayerParam("messageLog", "Log01", 20, LUA_PARAM_POS, r11_127, r4_127 + r6_127 / 2 - r8_127 / 2, 0, 0)
    if r1_127 == false then
      local r15_127 = cclass.lua_Sounds:new()
      r15_127:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
      r15_127:delete()
    end
  else
    r2_127:setSubLayerVisible("messageLog", "Log01", 20, 0)
  end
end
function changeMessageLogTextFocus(r0_128, r1_128)
  -- line: [3615, 3647] id: 128
  local r2_128 = cclass.lua_Layers:create()
  if r0_128 >= 0 then
    r2_128:setSubLayerVisible("messageLog", "Log01", 22, 1)
    r2_128:setSubLayerVisible("messageLog", "Log01", 23, 1)
    r2_128:setSubLayerVisible("messageLog", "Log01", 24, 1)
    local r4_128 = 0
    local r6_128 = 0
    r3_128, r4_128, r5_128, r6_128 = r2_128:getLogTextRect("messageLog", "LogText01", 0, r4_128, 0, r6_128)
    r6_128 = r6_128 - 20
    r4_128 = r4_128 + 10
    local r7_128 = 0
    local r8_128 = 0
    local r9_128 = 0
    local r10_128 = 0
    r7_128, r8_128, r9_128, r10_128 = r2_128:getSubLayerParam("messageLog", "Log01", 24, LUA_PARAM_SIZE, r7_128, r8_128, r9_128, r10_128)
    local r11_128 = 0
    local r14_128 = 0
    r11_128, r12_128, r13_128, r14_128 = r2_128:getSubLayerParam("messageLog", "Log01", 24, LUA_PARAM_POS, r11_128, 0, 0, r14_128)
    r2_128:setSubLayerParam("messageLog", "Log01", 24, LUA_PARAM_POS, r11_128, r4_128, 0, 0)
    r2_128:setSubLayerParam("messageLog", "Log01", 24, LUA_PARAM_CENTERZ, 0, 0, 0, 0)
    r2_128:setSubLayerParam("messageLog", "Log01", 24, LUA_PARAM_SCALE, 1, r6_128 / r8_128, 1, 0)
    r2_128:setSubLayerParam("messageLog", "Log01", 23, LUA_PARAM_POS, r11_128, r4_128 + r6_128, r11_128, r14_128)
    r7_128, r8_128, r9_128, r10_128 = r2_128:getSubLayerParam("messageLog", "Log01", 23, LUA_PARAM_SIZE, r7_128, r8_128, r9_128, r10_128)
    r2_128:setSubLayerParam("messageLog", "Log01", 22, LUA_PARAM_POS, r11_128, r4_128 - r8_128, r11_128, r14_128)
    if r1_128 == false then
      local r16_128 = cclass.lua_Sounds:new()
      r16_128:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
      r16_128:delete()
    end
  else
    r2_128:setSubLayerVisible("messageLog", "Log01", 22, 0)
    r2_128:setSubLayerVisible("messageLog", "Log01", 23, 0)
    r2_128:setSubLayerVisible("messageLog", "Log01", 24, 0)
  end
end
function getMessageLogTextColor(r0_129)
  -- line: [3650, 3656] id: 129
  if r0_129 == 0 then
    return g_logTextColor.normal, g_logTextColor.normalEdge
  else
    return g_logTextColor.voice, g_logTextColor.voiceEdge
  end
end
function getMessageLogKey()
  -- line: [3659, 3661] id: 130
  return "messageLog", "LogText01"
end
g_configBaseUpperNormal = {
  28,
  27,
  26,
  25,
  24,
  23,
  22
}
g_configBaseUpperSelect = {
  21,
  20,
  19,
  18,
  17,
  16,
  15
}
g_configBaseUpperDisable = {
  35,
  34,
  33,
  32,
  31,
  30,
  29
}
g_configBaseUpperBar = {
  7,
  6,
  5,
  4,
  3,
  2
}
g_configBaseUpperPage = {
  14,
  13,
  12,
  11,
  10,
  9,
  8
}
g_configBaseUpperAll = {
  g_configBaseUpperNormal,
  g_configBaseUpperSelect,
  g_configBaseUpperDisable,
  g_configBaseUpperBar,
  g_configBaseUpperPage
}
g_configUpperOrigin = {}
g_configUpperBarOrigin = {}
g_configBaseLowerNormal = {
  52,
  51,
  50,
  49
}
g_configBaseLowerSelect = {
  48,
  47,
  46,
  45
}
g_configBaseLowerDisable = {
  44,
  43
}
g_configBaseLowerBar = {
  42,
  41,
  40
}
g_configBaseLowerAll = {
  g_configBaseLowerNormal,
  g_configBaseLowerSelect,
  g_configBaseLowerDisable,
  g_configBaseLowerBar
}
g_configBaseNormal = {
  g_configBaseUpperNormal,
  g_configBaseLowerNormal
}
g_configBaseSelect = {
  g_configBaseUpperSelect,
  g_configBaseLowerSelect
}
function updateConfigCursorPos()
  -- line: [3682, 3700] id: 131
  local r0_131 = cclass.lua_Layers:create()
  local r1_131 = 0
  local r2_131 = 0
  local r3_131 = cclass.lua_AutoCursor:new()
  r1_131, r2_131 = r3_131:GetCursorPos(r1_131, r2_131)
  r3_131:delete()
  local r4_131 = r0_131:getCursorPos("configBase", r1_131, r2_131, 0)
  changeConfigFocus(r4_131 - 1)
  changeConfigPageFocus(r0_131:getCursorPos("configBase", r1_131, r2_131, 1) - 1)
  if r4_131 > 0 then
    g_configInfo.selCursor = r4_131 - 1
  else
    g_configInfo.selCursor = -1
  end
end
function isConfigBaseEffect()
  -- line: [3703, 3768] id: 132
  -- notice: unreachable block#23
  local r0_132 = cclass.lua_Layers:create()
  local r1_132 = r0_132:isTransition("configBase")
  if g_configInfo.effect == true and r1_132 == false then
    if g_configInfo.enabled == false then
      setButtonState()
      r0_132:remove("configBase")
      if g_menuExecute == false then
        r0_132:removeSnap("system")
      end
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
    else
      updateConfigCursorPos()
      if g_configInfo.page == 2 then
        startCfg2Preview()
      end
      if g_configInfo.toSysMenu == true then
        r0_132:removeSnap("system")
        r0_132:setSnap("system", true)
      end
    end
    g_configInfo.effect = false
  end
  if g_configInfo.pageEffect == true then
    local r2_132 = r0_132:isEffect("configBase", "ConfigPage")
    if g_configInfo.pageEffect == true and r2_132 == false then
      r0_132:removeLayer("configBase", "ConfigPage" .. tostring(g_configInfo.beforePage))
      if g_configInfo.beforePage == 1 then
        r0_132:removeLayer("configBase", "preview")
      end
      if g_configInfo.beforePage == 2 then
        r0_132:removeLayer("configBase", "ConfigText2")
      end
      if g_configInfo.beforePage == 4 or g_configInfo.beforePage == 5 then
        local r4_132 = g_configInfo.beforePage
        if r4_132 == 4 then
          r4_132 = true
        else
          r4_132 = false
        end
        deleteThumbnail(r4_132, g_dataInfo.page)
      end
      if g_configInfo.beforePage == 7 then
        for r7_132 = 1, #g_gestureFunc, 1 do
          local r8_132 = "gestureIcon" .. tostring(r7_132)
          r0_132:removeLayer("configBase", r8_132 .. "N")
          r0_132:removeLayer("configBase", r8_132 .. "S")
        end
        r0_132:removeLayer("configBase", "drugIcon")
      end
      g_configInfo.pageEffect = false
      updateConfigCursorPos()
      if g_configInfo.page == 2 then
        startCfg2Preview()
      end
    end
  end
  return r1_132
end
function initConfigUpperButton(r0_133, r1_133, r2_133, r3_133)
  -- line: [3771, 3924] id: 133
  local r4_133 = cclass.lua_Layers:create()
  local r5_133 = getEffectRate()
  if r1_133 == true then
    for r9_133, r10_133 in pairs(g_configBaseUpperAll) do
      for r14_133, r15_133 in pairs(r10_133) do
        r4_133:initSubLayer("configBase", "ConfigBase01", r15_133, 1)
        r4_133:setSubLayerParam("configBase", "ConfigBase01", r15_133, LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
    end
    for r9_133 = 1, #g_configBaseUpperNormal, 1 do
      local r10_133 = 0
      local r11_133 = 0
      local r12_133 = 0
      local r13_133 = 0
      r10_133, r11_133, r12_133, r13_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], LUA_PARAM_POS, r10_133, r11_133, r12_133, r13_133)
      g_configUpperOrigin[r9_133] = r10_133
      if r9_133 < #g_configBaseUpperNormal then
        r10_133, r11_133, r12_133, r13_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperBar[r9_133], LUA_PARAM_POS, r10_133, r11_133, r12_133, r13_133)
        g_configUpperBarOrigin[r9_133] = r10_133
      end
    end
  end
  for r9_133 = 1, #g_configBaseUpperNormal, 1 do
    if r9_133 == r0_133 then
      r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperSelect[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperDisable[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperPage[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 1)
      if r1_133 == false and r3_133 == false then
        r4_133:setSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperPage[r9_133], LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 100 * r5_133, 0, r2_133)
        r4_133:setSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperPage[r9_133], LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 50 * r5_133, 0, 0)
        r4_133:startSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperPage[r9_133], 0)
      end
      r4_133:setSubLayerHitTest("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], 0, 0)
    else
      r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperSelect[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperDisable[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperPage[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 0)
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true and (r9_133 == 4 or r9_133 == 5) then
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperDisable[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_133:setSubLayerHitTest("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], 0, 0)
      elseif cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false and r9_133 == 5 then
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperDisable[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_133:setSubLayerHitTest("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], 0, 0)
      elseif g_menuExecute == true and r9_133 == 4 then
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperDisable[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_133:setSubLayerHitTest("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], 0, 0)
      else
        r4_133:setSubLayerHitTest("configBase", "ConfigBase01", g_configBaseUpperNormal[r9_133], 1, 0)
      end
    end
  end
  for r9_133 = 1, #g_configBaseUpperBar, 1 do
    r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperBar[r9_133], LUA_PARAM_COLOR, 1, 1, 1, 1)
  end
  local r6_133 = 0
  local r7_133 = 0
  local r8_133 = 0
  local r9_133 = 0
  for r13_133 = 1, #g_configBaseUpperNormal, 1 do
    if r13_133 <= r0_133 then
      r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r13_133], LUA_PARAM_POS, r6_133, r7_133, r8_133, r9_133)
      local r14_133 = r6_133 - g_configUpperOrigin[r13_133]
      if r1_133 == true then
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r13_133], LUA_PARAM_POS, r6_133 - r14_133, r7_133, r8_133, r9_133)
      else
        r4_133:setSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperNormal[r13_133], LUA_EFFECT_POS, r14_133 * -1, 0, 0, 0, 0, 150 * r5_133, 0, r2_133)
        r4_133:startSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperNormal[r13_133], 0)
      end
      r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperSelect[r13_133], LUA_PARAM_POS, r6_133, r7_133, r8_133, r9_133)
      if r1_133 == true then
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperSelect[r13_133], LUA_PARAM_POS, r6_133 - r14_133, r7_133, r8_133, r9_133)
      else
        r4_133:setSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperSelect[r13_133], LUA_EFFECT_POS, r14_133 * -1, 0, 0, 0, 0, 150 * r5_133, 0, r2_133)
        r4_133:startSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperSelect[r13_133], 0)
      end
      r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperDisable[r13_133], LUA_PARAM_POS, r6_133, r7_133, r8_133, r9_133)
      if r1_133 == true then
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperDisable[r13_133], LUA_PARAM_POS, r6_133 - r14_133, r7_133, r8_133, r9_133)
      else
        r4_133:setSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperDisable[r13_133], LUA_EFFECT_POS, r14_133 * -1, 0, 0, 0, 0, 150 * r5_133, 0, r2_133)
        r4_133:startSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperDisable[r13_133], 0)
      end
      if r13_133 < #g_configBaseUpperNormal then
        r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperBar[r13_133], LUA_PARAM_POS, r6_133, r7_133, r8_133, r9_133)
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperBar[r13_133], LUA_PARAM_POS, g_configUpperBarOrigin[r13_133], r7_133, r8_133, r9_133)
        if r13_133 == r0_133 then
          r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperPage[r0_133], LUA_PARAM_SIZE, r6_133, r7_133, r8_133, r9_133)
          offset = r6_133
          r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r0_133], LUA_PARAM_SIZE, r6_133, r7_133, r8_133, r9_133)
          offset = offset - r6_133
          r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperBar[r13_133], LUA_PARAM_POS, r6_133, r7_133, r8_133, r9_133)
          r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperBar[r13_133], LUA_PARAM_POS, r6_133 + offset, r7_133, r8_133, r9_133)
        end
      end
    else
      r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperPage[r0_133], LUA_PARAM_SIZE, r6_133, r7_133, r8_133, r9_133)
      offset = r6_133
      r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r0_133], LUA_PARAM_SIZE, r6_133, r7_133, r8_133, r9_133)
      offset = offset - r6_133
      r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r13_133], LUA_PARAM_POS, r6_133, r7_133, r8_133, r9_133)
      local r14_133 = g_configUpperOrigin[r13_133] + offset - r6_133
      if r1_133 == true then
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[r13_133], LUA_PARAM_POS, r6_133 + r14_133, r7_133, r8_133, r9_133)
      else
        r4_133:setSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperNormal[r13_133], LUA_EFFECT_POS, r14_133, 0, 0, 0, 0, 150 * r5_133, 0, r2_133)
        r4_133:startSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperNormal[r13_133], 0)
      end
      r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperSelect[r13_133], LUA_PARAM_POS, r6_133, r7_133, r8_133, r9_133)
      if r1_133 == true then
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperSelect[r13_133], LUA_PARAM_POS, r6_133 + r14_133, r7_133, r8_133, r9_133)
      else
        r4_133:setSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperSelect[r13_133], LUA_EFFECT_POS, r14_133, 0, 0, 0, 0, 150 * r5_133, 0, r2_133)
        r4_133:startSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperSelect[r13_133], 0)
      end
      r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperDisable[r13_133], LUA_PARAM_POS, r6_133, r7_133, r8_133, r9_133)
      if r1_133 == true then
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperDisable[r13_133], LUA_PARAM_POS, r6_133 + r14_133, r7_133, r8_133, r9_133)
      else
        r4_133:setSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperDisable[r13_133], LUA_EFFECT_POS, r14_133, 0, 0, 0, 0, 150 * r5_133, 0, r2_133)
        r4_133:startSubLayerEffect("configBase", "ConfigBase01", "ConfigPage", g_configBaseUpperDisable[r13_133], 0)
      end
      if r13_133 < #g_configBaseUpperNormal then
        local r15_133 = r14_133
        if g_configInfo.page == r13_133 and r0_133 < g_configInfo.page then
          r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperPage[g_configInfo.page], LUA_PARAM_SIZE, r6_133, r7_133, r8_133, r9_133)
          offset = r6_133
          r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperNormal[g_configInfo.page], LUA_PARAM_SIZE, r6_133, r7_133, r8_133, r9_133)
          offset = offset - r6_133
          r15_133 = r15_133 - offset
        end
        r6_133, r7_133, r8_133, r9_133 = r4_133:getSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperBar[r13_133], LUA_PARAM_POS, r6_133, r7_133, r8_133, r9_133)
        r4_133:setSubLayerParam("configBase", "ConfigBase01", g_configBaseUpperBar[r13_133], LUA_PARAM_POS, r6_133 + r15_133, r7_133, r8_133, r9_133)
      end
    end
  end
end
function initConfigLowerButton(r0_134, r1_134, r2_134)
  -- line: [3928, 3965] id: 134
  local r3_134 = cclass.lua_Layers:create()
  if r1_134 == true then
    for r7_134, r8_134 in pairs(g_configBaseLowerAll) do
      for r12_134, r13_134 in pairs(r8_134) do
        r3_134:initSubLayer("configBase", "ConfigBase01", r13_134, 1)
        r3_134:setSubLayerParam("configBase", "ConfigBase01", r13_134, LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
    end
  end
  for r7_134 = 1, #g_configBaseLowerNormal, 1 do
    if r7_134 == 1 and 3 < r0_134 and r0_134 ~= 7 then
      r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerNormal[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerSelect[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerDisable[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r3_134:setSubLayerHitTest("configBase", "ConfigBase01", g_configBaseLowerNormal[r7_134], 0, 0)
    elseif g_menuExecute == true and r7_134 == 2 then
      r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerNormal[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerSelect[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerDisable[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r3_134:setSubLayerHitTest("configBase", "ConfigBase01", g_configBaseLowerNormal[r7_134], 0, 0)
    else
      r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerNormal[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerSelect[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 0)
      if r7_134 < 3 then
        r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerDisable[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
      r3_134:setSubLayerHitTest("configBase", "ConfigBase01", g_configBaseLowerNormal[r7_134], 1, 0)
    end
  end
  for r7_134 = 1, #g_configBaseLowerBar, 1 do
    r3_134:setSubLayerParam("configBase", "ConfigBase01", g_configBaseLowerBar[r7_134], LUA_PARAM_COLOR, 1, 1, 1, 1)
  end
end
function initDataPageNo()
  -- line: [3968, 3979] id: 135
  local r0_135 = 0
  local r1_135 = 0
  r0_135, r1_135 = cfunc.CSaveDataManager__lua_FindNewData(0, r0_135, r1_135)
  if r0_135 == 0 then
    g_dataInfo.page = (r1_135 - 1) / 10 + 1
    g_dataInfo.page = math.floor(g_dataInfo.page)
  elseif r0_135 == 1 then
    g_dataInfo.page = 11
  end
end
function initConfigPage(r0_136, r1_136)
  -- line: [3982, 4094] id: 136
  -- notice: unreachable block#33
  -- notice: unreachable block#50
  local r2_136 = cclass.lua_MeasureTime:new()
  local r3_136 = getEffectRate()
  local r4_136 = cclass.lua_Layers:create()
  if r1_136 == false then
    local r5_136 = cclass.lua_Sounds:new()
    r5_136:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    r5_136:delete()
  end
  local r5_136 = "Sys_ConfigP" .. tostring(r0_136) .. ".pna"
  local r6_136 = getGraphicsArcFileName("configBase", r5_136)
  local r7_136 = "ConfigPage" .. tostring(r0_136)
  r4_136:insertLayer("configBase", r7_136, LUA_LAYER_PNA, r6_136, r5_136, 1)
  r4_136:setInputID("configBase", r7_136, 1)
  if r0_136 == 1 then
    initConfigP1(r7_136, true)
  elseif r0_136 == 2 then
    initConfigP2(r7_136, true)
  elseif r0_136 == 3 then
    initConfigP3(r7_136, true)
  elseif r0_136 == 4 then
    initDataOrder()
    if g_dataInfo.init == false then
      initDataPageNo()
      g_dataInfo.init = true
    end
    initDataPage(r7_136, true, true, g_dataInfo.page)
  elseif r0_136 == 5 then
    initDataOrder()
    if g_dataInfo.init == false then
      initDataPageNo()
      g_dataInfo.init = true
    end
    initDataPage(r7_136, false, true, g_dataInfo.page)
  elseif r0_136 == 6 then
    r4_136:initSubLayer("configBase", r7_136, 0, 1)
  elseif r0_136 == 7 then
    initConfigP7(r7_136, true)
  end
  if r1_136 == false then
    local r8_136 = r2_136:diff() * 1000
    local r9_136 = "ConfigPage" .. tostring(g_configInfo.page)
    r4_136:clearHitTestAll("configBase", r9_136)
    local r10_136 = g_configInfo.page
    if r0_136 < r10_136 then
      r10_136 = APP_INTERNAL_WIDTH or -1 * APP_INTERNAL_WIDTH
    else
      goto label_157	-- block#23 is visited secondly
    end
    if g_configInfo.page == 1 then
      effectCfg1Preview(r1_136, r10_136, true, r8_136)
    end
    if g_configInfo.page == 2 then
      effectCfg2Text(r1_136, r10_136, true, r8_136)
    end
    if g_configInfo.page == 4 or g_configInfo.page == 5 then
      local r11_136 = g_configInfo.page
      if r11_136 == 4 then
        r11_136 = true
      else
        r11_136 = false
      end
      effectThumbnail(r11_136, r1_136, g_dataInfo.page, r10_136, true, r8_136)
    end
    if g_configInfo.page == 7 then
      effectCfg7Icon(r1_136, r10_136, true, r8_136)
    end
    r4_136:setEffect("configBase", r9_136, "ConfigPage", LUA_EFFECT_POS, r10_136, 0, 0, 0, 0, 300 * r3_136, 0, r8_136)
    r4_136:startEffect("configBase", r9_136, "ConfigPage", 0)
    g_configInfo.beforePage = g_configInfo.page
    g_configInfo.pageEffect = true
    local r11_136 = g_configInfo.page
    if r0_136 < r11_136 then
      r11_136 = APP_INTERNAL_WIDTH
      r10_136 = r11_136
      if r10_136 then
        ::label_248::
        r11_136 = APP_INTERNAL_WIDTH
        r10_136 = -1 * r11_136
      end
    else
      goto label_248	-- block#40 is visited secondly
    end
    r4_136:setParam("configBase", r7_136, LUA_PARAM_POS, -r10_136, 0, 0, 0)
    r4_136:setEffect("configBase", r7_136, "ConfigPage", LUA_EFFECT_POS, r10_136, 0, 0, 0, 0, 300 * r3_136, 0, r8_136)
    r4_136:startEffect("configBase", r7_136, "ConfigPage", 0)
    if r0_136 == 1 then
      effectCfg1Preview(r1_136, r10_136, false, r8_136)
    end
    if r0_136 == 2 then
      effectCfg2Text(r1_136, r10_136, false, r8_136)
    end
    if r0_136 == 4 or r0_136 == 5 then
      if r0_136 == 4 then
        r11_136 = true
      else
        r11_136 = false
      end
      effectThumbnail(r11_136, r1_136, g_dataInfo.page, r10_136, false, r8_136)
    end
    if r0_136 == 7 then
      effectCfg7Icon(r1_136, r10_136, false, r8_136)
    end
  end
  local r8_136 = 0
  if r1_136 == false then
    r8_136 = r2_136:diff() * 1000
  end
  initConfigUpperButton(r0_136, r1_136, r8_136, false)
  initConfigLowerButton(r0_136, r1_136, r8_136)
  g_configInfo.selCursor = -1
  g_configInfo.page = r0_136
  r2_136:delete()
end
function openConfig(r0_137, r1_137)
  -- line: [4097, 4148] id: 137
  if g_configInfo.enabled == true or g_configInfo.effect == true then
    return false
  end
  if g_menuExecute == false then
    local r2_137 = cclass.lua_Sounds:new()
    r2_137:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    r2_137:delete()
  end
  if r0_137 == 0 then
    if 1 <= g_configInfo.page and g_configInfo.page <= 3 then
      r0_137 = g_configInfo.page
    else
      r0_137 = 1
    end
  end
  local r2_137 = cclass.lua_Layers:create()
  if r2_137:add("configBase") == false then
    return false
  end
  local r4_137 = cclass.lua_MeasureTime:new()
  r2_137:insertLayer("configBase", "ConfigBase01", LUA_LAYER_PNA, getGraphicsArcFileName("configBase", "Sys_ConfigBase.pna"), "Sys_ConfigBase.pna", 1)
  r2_137:initSubLayer("configBase", "ConfigBase01", 55, 1)
  local r6_137 = getEffectRate()
  initConfigPage(r0_137, true)
  if g_menuExecute == false and r1_137 == false then
    r2_137:setSnap("system", true)
  end
  r2_137:copySnap("configBase", "system")
  r2_137:startTransition("configBase", 0, 1, 500 * r6_137, 0, LUA_TRANSITION_NORMAL)
  if r1_137 == false then
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  end
  g_configInfo.enabled = true
  g_configInfo.effect = true
  g_configInfo.toSysMenu = r1_137
  r4_137:delete()
  return true
end
function closeConfig()
  -- line: [4151, 4167] id: 138
  local r0_138 = cclass.lua_Sounds:new()
  r0_138:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  r0_138:delete()
  local r1_138 = cclass.lua_Layers:create()
  if g_menuExecute == true then
    r1_138:removeSnap("system")
    r1_138:rtSnap("system")
  else
    local r2_138 = getEffectRate()
    r1_138:setSnap("configBase", false)
    r1_138:startTransition("configBase", 0, 1, 500 * r2_138, 0, LUA_TRANSITION_ERASE)
  end
  g_configInfo.effect = true
  g_configInfo.enabled = false
end
function onMouseMoveConfig(r0_139, r1_139, r2_139, r3_139)
  -- line: [4170, 4188] id: 139
  local r4_139 = cclass.lua_Layers:create()
  if g_configInfo.enabled == true and g_configInfo.effect == false and g_configInfo.pageEffect == false then
    if g_configInfo.selCursor ~= r1_139 and g_cfgP7Info.drug == false then
      changeConfigFocus(r1_139)
      g_configInfo.selCursor = r1_139
    end
    if r1_139 < 0 then
      if g_configInfo.page == 7 then
        onDrugCfgP7(r2_139, r3_139)
      end
      changeConfigPageFocus(r4_139:getCursorPos("configBase", r2_139, r3_139, 1) - 1)
    end
  end
end
function defaultSetting()
  -- line: [4191, 4253] id: 140
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
  g_deactiveMode = true
  for r3_140 = 1, #g_volume, 1 do
    if g_volume[r3_140].name == "bgm" then
      g_volume[r3_140].vol = 600
    elseif g_volume[r3_140].name == "se" then
      g_volume[r3_140].vol = 900
    else
      g_volume[r3_140].vol = 1000
    end
    g_volume[r3_140].mute = false
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
  changeMessageWindow(-1, true)
  changeMessageWindowOpacity("ConfigPage2")
  if g_menuExecute == false then
    local r0_140 = cclass.lua_Layers:create()
    r0_140:removeSnap("system")
    r0_140:setSnap("system", true)
  end
  cfunc.LegacyGame__lua_NeedVolumeUpdate("bgm")
  cfunc.LegacyGame__lua_NeedVolumeUpdate("se")
  cfunc.LegacyGame__lua_NeedVolumeUpdate("movie")
  cfunc.LegacyGame__lua_NeedVolumeUpdate("char")
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGV, 0)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
  local r0_140 = "ConfigPage" .. tostring(g_configInfo.page)
  if g_configInfo.page == 1 then
    if g_menuExecute == false then
      cfunc.LegacyGame__lua_NeedPreview("configBase", "preview")
    end
    initConfigP1(r0_140, false)
  elseif g_configInfo.page == 2 then
    startCfg2Preview()
    initConfigP2(r0_140, false)
  elseif g_configInfo.page == 3 then
    initConfigP3(r0_140, false)
  elseif g_configInfo.page == 7 then
    initConfigP7(r0_140, false)
  end
end
function onLButtonDownConfig(r0_141, r1_141, r2_141, r3_141, r4_141)
  -- line: [4256, 4324] id: 141
  if g_configInfo.enabled == true and g_configInfo.effect == false and g_configInfo.pageEffect == false then
    local r5_141 = cclass.lua_Sounds:new()
    if r1_141 == g_configBaseLowerNormal[1] then
      if r4_141 == false then
        r5_141:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
        openConfirm(LUA_CONFIRM_DEFAULT)
      end
    elseif r1_141 == g_configBaseLowerNormal[2] then
      if r4_141 == false then
        closeConfig()
      end
    elseif r1_141 == g_configBaseLowerNormal[3] then
      if r4_141 == false then
        if g_menuExecute == true then
          closeConfig()
        else
          r5_141:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
          openConfirm(LUA_CONFIRM_TITLE)
        end
      end
    elseif r1_141 == g_configBaseLowerNormal[4] then
      if r4_141 == false then
        r5_141:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
        openConfirm(LUA_CONFIRM_QUIT)
      end
    elseif r1_141 == g_configBaseUpperNormal[1] then
      if r4_141 == false then
        initConfigPage(1, false)
      end
    elseif r1_141 == g_configBaseUpperNormal[2] then
      if r4_141 == false then
        initConfigPage(2, false)
      end
    elseif r1_141 == g_configBaseUpperNormal[3] then
      if r4_141 == false then
        initConfigPage(3, false)
      end
    elseif r1_141 == g_configBaseUpperNormal[4] then
      if r4_141 == false then
        initConfigPage(4, false)
      end
    elseif r1_141 == g_configBaseUpperNormal[5] then
      if r4_141 == false then
        initConfigPage(5, false)
      end
    elseif r1_141 == g_configBaseUpperNormal[6] then
      if r4_141 == false then
        initConfigPage(6, false)
      end
    elseif r1_141 == g_configBaseUpperNormal[7] then
      if r4_141 == false then
        initConfigPage(7, false)
      end
    else
      onLButtonDownConfigPage(r4_141)
    end
    r5_141:delete()
  end
end
function onLButtonDownConfigPage(r0_142)
  -- line: [4327, 4346] id: 142
  if g_configInfo.page == 1 then
    onLButtonDownCfgP1(r0_142)
  elseif g_configInfo.page == 2 then
    onLButtonDownCfgP2(r0_142)
  elseif g_configInfo.page == 3 then
    onLButtonDownCfgP3(r0_142)
  elseif g_configInfo.page == 4 then
    onLButtonDownData(r0_142, true)
  elseif g_configInfo.page == 5 then
    onLButtonDownData(r0_142, false)
  elseif g_configInfo.page ~= 6 and g_configInfo.page == 7 then
    onLButtonDownCfgP7(r0_142)
  end
end
function onRButtonDownConfig(r0_143, r1_143)
  -- line: [4349, 4353] id: 143
  if g_configInfo.enabled == true and g_configInfo.effect == false and g_configInfo.pageEffect == false then
    closeConfig()
  end
end
function onKeyDownConfig(r0_144, r1_144)
  -- line: [4356, 4366] id: 144
  if r1_144 == ture then
    return 
  end
  if g_configInfo.enabled == true and g_configInfo.effect == false and g_configInfo.pageEffect == false and r0_144 == LUA_KEYCODE_SPACE then
    closeConfig()
  end
end
function changeConfigFocus(r0_145)
  -- line: [4369, 4388] id: 145
  local r1_145 = cclass.lua_Layers:create()
  for r5_145, r6_145 in pairs(g_configBaseNormal) do
    for r10_145, r11_145 in pairs(r6_145) do
      if r0_145 == r11_145 then
        r1_145:setSubLayerParam("configBase", "ConfigBase01", g_configBaseSelect[r5_145][r10_145], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r1_145:setSubLayerParam("configBase", "ConfigBase01", g_configBaseNormal[r5_145][r10_145], LUA_PARAM_COLOR, 1, 1, 1, 0)
        local r12_145 = cclass.lua_Sounds:new()
        r12_145:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
        r12_145:delete()
      elseif g_configInfo.selCursor == r11_145 then
        r1_145:setSubLayerParam("configBase", "ConfigBase01", g_configBaseSelect[r5_145][r10_145], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_145:setSubLayerParam("configBase", "ConfigBase01", g_configBaseNormal[r5_145][r10_145], LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
  end
end
function changeConfigPageFocus(r0_146)
  -- line: [4391, 4428] id: 146
  if g_configInfo.page == 1 and g_cfgP1Info.selCursor ~= r0_146 then
    changeCfgP1Focus(r0_146)
    g_cfgP1Info.selCursor = r0_146
  elseif g_configInfo.page == 2 and g_cfgP2Info.selCursor ~= r0_146 then
    changeCfgP2Focus(r0_146)
    g_cfgP2Info.selCursor = r0_146
  elseif g_configInfo.page == 3 and g_cfgP3Info.selCursor ~= r0_146 then
    changeCfgP3Focus(r0_146)
    g_cfgP3Info.selCursor = r0_146
  elseif g_configInfo.page == 4 and g_dataInfo.selCursor ~= r0_146 then
    changeDataFocus(r0_146)
    g_dataInfo.selCursor = r0_146
  elseif g_configInfo.page == 5 and g_dataInfo.selCursor ~= r0_146 then
    changeDataFocus(r0_146)
    g_dataInfo.selCursor = r0_146
  elseif g_configInfo.page ~= 6 and g_configInfo.page == 7 and g_cfgP7Info.selCursor ~= r0_146 then
    changeCfgP7Focus(r0_146)
    g_cfgP7Info.selCursor = r0_146
  end
end
g_cfgP1Normal = {
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31,
  32,
  33,
  34,
  35,
  36,
  37,
  38,
  39,
  40,
  41,
  42
}
g_cfgP1Select = {
  43,
  44,
  45,
  46,
  47,
  48,
  49,
  50,
  51,
  52,
  53,
  54,
  55,
  56,
  57,
  58,
  59,
  60,
  61,
  62,
  63,
  64
}
g_cfgP1Current = {
  65,
  66,
  67,
  68,
  69,
  70,
  71,
  72,
  73,
  74,
  75,
  76,
  77,
  78,
  79,
  80,
  81,
  82,
  83,
  84,
  85,
  86
}
g_cfgP1ItemNormal = {
  88,
  89,
  90,
  91,
  92,
  93,
  94,
  95,
  96
}
g_cfgP1ItemSelect = {
  97,
  98,
  99,
  100,
  101,
  102,
  103,
  104,
  105
}
g_cfgP1Detail = {
  17,
  16,
  15,
  14,
  13,
  12,
  11,
  10,
  9,
  8,
  7,
  6,
  5,
  4,
  3,
  2,
  1,
  nil
}
g_cfgP1DetailIndex = {
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  12,
  13,
  13,
  14,
  14,
  15,
  15,
  15,
  16,
  17
}
g_cfgP1Button = {
  g_cfgP1Normal,
  g_cfgP1Select,
  g_cfgP1Current,
  g_cfgP1Detail,
  g_cfgP1ItemNormal,
  g_cfgP1ItemSelect
}
g_cfgP1Info = {
  selCursor = -1,
}
g_cfgP1DetailX = {}
function isCfgP1Current(r0_147)
  -- line: [4443, 4499] id: 147
  if r0_147 < 3 then
    local r1_147 = g_screenMode
    if r1_147 == 0 then
      r1_147 = 2 or 1
    else
      goto label_8	-- block#3 is visited secondly
    end
    if r0_147 == r1_147 then
      return true
    end
  elseif r0_147 < 7 and r0_147 == g_zoomMode + 3 then
    return true
  elseif r0_147 < 9 and r0_147 == g_messageWindowType + 7 then
    return true
  elseif r0_147 < 12 and r0_147 == g_effectSpeed + 9 then
    return true
  elseif r0_147 < 14 then
    local r1_147 = g_drawSkipIcon
    if r1_147 == false then
      r1_147 = 13 or 12
    else
      goto label_49	-- block#18 is visited secondly
    end
    if r0_147 == r1_147 then
      return true
    end
  elseif r0_147 < 16 then
    local r1_147 = g_mouseAutoMove
    if r1_147 == false then
      r1_147 = 15 or 14
    else
      goto label_63	-- block#24 is visited secondly
    end
    if r0_147 == r1_147 then
      return true
    end
  elseif r0_147 < 18 then
    local r1_147 = g_skipConfirm
    if r1_147 == true then
      r1_147 = 17 or 16
    else
      goto label_77	-- block#30 is visited secondly
    end
    if r0_147 == r1_147 then
      return true
    end
  elseif r0_147 < 21 and r0_147 == g_hideCursor + 18 then
    return true
  elseif r0_147 < 23 then
    local r1_147 = g_deactiveMode
    if r1_147 == true then
      r1_147 = 21 or 22
    else
      goto label_100	-- block#39 is visited secondly
    end
    if r0_147 == r1_147 then
      return true
    end
  end
  return false
end
function updatePreviewSize(r0_148)
  -- line: [4502, 4539] id: 148
  local r1_148 = cclass.lua_Layers:create()
  local r2_148 = 0
  local r3_148 = 0
  local r4_148 = 0
  r2_148, r3_148, r4_148, r5_148 = r1_148:getScreenAspect(r2_148, r3_148, r4_148, 0)
  local r6_148 = 0
  local r7_148 = 0
  r6_148, r7_148, r8_148, r9_148 = r1_148:getSubLayerParam("configBase", r0_148, 107, LUA_PARAM_SIZE, r6_148, r7_148, 0, 0)
  if g_zoomMode == 3 then
    local r10_148 = APP_INTERNAL_WIDTH / r4_148
    r1_148:setParam("configBase", "preview", LUA_PARAM_SCALE, r10_148, r10_148, 1, 0)
    r1_148:setParam("configBase", "preview", LUA_PARAM_RECT, 0, 0, r6_148, r7_148)
  elseif r2_148 ~= 16 or r3_148 ~= 9 then
    if g_zoomMode == 0 then
      r1_148:setParam("configBase", "preview", LUA_PARAM_SCALE, 1, 1, 1, 0)
      r1_148:setParam("configBase", "preview", LUA_PARAM_RECT, 0, 0, r6_148, r7_148)
    elseif g_zoomMode == 1 then
      r1_148:setParam("configBase", "preview", LUA_PARAM_SCALE, 1, r6_148 / r2_148 * r3_148 / r7_148, 1, 0)
      r1_148:setParam("configBase", "preview", LUA_PARAM_RECT, 0, 0, r6_148, r7_148)
    elseif g_zoomMode == 2 then
      local r10_148 = r6_148 / r2_148 * r3_148 / r7_148
      r1_148:setParam("configBase", "preview", LUA_PARAM_SCALE, r10_148, r10_148, 1, 0)
      local r11_148 = (r6_148 * r10_148 - r6_148) * 1 / r10_148
      r1_148:setParam("configBase", "preview", LUA_PARAM_RECT, r11_148 / 2, 0, r6_148 - r11_148, r7_148)
    end
  else
    r1_148:setParam("configBase", "preview", LUA_PARAM_SCALE, 1, 1, 1, 0)
    r1_148:setParam("configBase", "preview", LUA_PARAM_RECT, 0, 0, r6_148, r7_148)
  end
end
function initConfigP1(r0_149, r1_149)
  -- line: [4542, 4601] id: 149
  local r2_149 = cclass.lua_Layers:create()
  if r1_149 == true then
    r2_149:initSubLayer("configBase", r0_149, 108, 1)
    for r6_149, r7_149 in pairs(g_cfgP1Button) do
      for r11_149, r12_149 in pairs(r7_149) do
        r2_149:initSubLayer("configBase", r0_149, r12_149, 1)
      end
    end
    r2_149:initSubLayer("configBase", r0_149, 107, 1)
    local r3_149 = 0
    local r4_149 = 0
    r3_149, r4_149, r5_149, r6_149 = r2_149:getScreenAspect(r3_149, r4_149, 0, 0)
    local r7_149 = 0
    local r8_149 = 0
    r7_149, r8_149, r9_149, r10_149 = r2_149:getSubLayerParam("configBase", r0_149, 107, LUA_PARAM_SIZE, r7_149, r8_149, 0, 0)
    if r3_149 ~= 16 or r4_149 ~= 9 then
      r2_149:setSubLayerParam("configBase", r0_149, 107, LUA_PARAM_SCALE, 1, r7_149 / r3_149 * r4_149 / r8_149, 1, 0)
    end
    if g_menuExecute == false then
      r2_149:insertPreviewLayer("configBase", "preview", r7_149, r8_149, 1)
    else
      r2_149:initSubLayer("configBase", r0_149, 18, 0)
      r2_149:insertPNARefLayer("configBase", "preview", r0_149, 18, 1)
    end
    local r11_149 = 0
    local r12_149 = 0
    local r13_149 = 0
    local r14_149 = 0
    r11_149, r12_149, r13_149, r14_149 = r2_149:getSubLayerParam("configBase", r0_149, 107, LUA_PARAM_POS, r11_149, r12_149, r13_149, r14_149)
    r2_149:setParam("configBase", "preview", LUA_PARAM_POS, r11_149, r12_149, r13_149, r14_149)
  end
  for r6_149 = 1, #g_cfgP1Normal, 1 do
    if isCfgP1Current(r6_149) == false then
      r2_149:setSubLayerParam("configBase", r0_149, g_cfgP1Normal[r6_149], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_149:setSubLayerParam("configBase", r0_149, g_cfgP1Select[r6_149], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_149:setSubLayerParam("configBase", r0_149, g_cfgP1Current[r6_149], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_149:setSubLayerHitTest("configBase", r0_149, g_cfgP1Normal[r6_149], 1, 0)
    else
      r2_149:setSubLayerParam("configBase", r0_149, g_cfgP1Normal[r6_149], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_149:setSubLayerParam("configBase", r0_149, g_cfgP1Select[r6_149], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_149:setSubLayerParam("configBase", r0_149, g_cfgP1Current[r6_149], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_149:setSubLayerHitTest("configBase", r0_149, g_cfgP1Normal[r6_149], 1, 0)
    end
  end
  if r1_149 == true then
    for r6_149 = 1, #g_cfgP1Detail, 1 do
      r2_149:setSubLayerParam("configBase", r0_149, g_cfgP1Detail[r6_149], LUA_PARAM_COLOR, 1, 1, 1, 0)
      local r7_149 = 0
      r7_149, r8_149, r9_149, r10_149 = r2_149:getSubLayerParam("configBase", r0_149, g_cfgP1Detail[r6_149], LUA_PARAM_POS, r7_149, 0, 0, 0)
      g_cfgP1DetailX[r6_149] = r7_149
    end
    for r6_149 = 1, #g_cfgP1ItemSelect, 1 do
      r2_149:setSubLayerParam("configBase", r0_149, g_cfgP1ItemSelect[r6_149], LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
    g_cfgP1Info.selCursor = -1
  end
  updatePreviewSize(r0_149)
end
function onLButtonDownCfgP1(r0_150)
  -- line: [4603, 4716] id: 150
  if r0_150 == true then
    return 
  end
  local r1_150 = 0
  for r5_150 = 1, #g_cfgP1Normal, 1 do
    if g_cfgP1Normal[r5_150] == g_cfgP1Info.selCursor then
      r1_150 = r5_150
      break
    end
  end
  if isCfgP1Current(r1_150) == true then
    return 
  end
  local r2_150 = cclass.lua_Sounds:new()
  local r3_150 = "ConfigPage" .. tostring(g_configInfo.page)
  if g_cfgP1Info.selCursor == g_cfgP1Normal[1] or g_cfgP1Info.selCursor == g_cfgP1Normal[2] then
    r2_150:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SCREENMODE, 0)
  end
  if g_cfgP1Info.selCursor == g_cfgP1Normal[3] or g_cfgP1Info.selCursor == g_cfgP1Normal[4] or g_cfgP1Info.selCursor == g_cfgP1Normal[5] or g_cfgP1Info.selCursor == g_cfgP1Normal[6] then
    r2_150:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    local r4_150 = 0
    if g_cfgP1Info.selCursor == g_cfgP1Normal[4] then
      r4_150 = 1
    elseif g_cfgP1Info.selCursor == g_cfgP1Normal[5] then
      r4_150 = 2
    elseif g_cfgP1Info.selCursor == g_cfgP1Normal[6] then
      r4_150 = 3
    end
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, r4_150)
  end
  if g_cfgP1Info.selCursor == g_cfgP1Normal[7] or g_cfgP1Info.selCursor == g_cfgP1Normal[8] then
    r2_150:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    local r4_150 = g_cfgP1Info.selCursor
    if r4_150 == g_cfgP1Normal[8] then
      r4_150 = 1 or 0
    else
      goto label_158	-- block#26 is visited secondly
    end
    g_messageWindowType = r4_150
    if g_windowID ~= 2 then
      changeMessageWindow(-1, true)
      if g_menuExecute == false then
        r4_150 = cclass.lua_Layers:create()
        r4_150:removeSnap("system")
        r4_150:setSnap("system", true)
      end
      if g_menuExecute == false then
        cfunc.LegacyGame__lua_NeedPreview("configBase", "preview")
      end
    end
    initConfigP1(r3_150, false)
  end
  if g_cfgP1Info.selCursor == g_cfgP1Normal[9] or g_cfgP1Info.selCursor == g_cfgP1Normal[10] or g_cfgP1Info.selCursor == g_cfgP1Normal[11] then
    r2_150:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_effectSpeed = 0
    if g_cfgP1Info.selCursor == g_cfgP1Normal[10] then
      g_effectSpeed = 1
    elseif g_cfgP1Info.selCursor == g_cfgP1Normal[11] then
      g_effectSpeed = 2
    end
    initConfigP1(r3_150, false)
  end
  if g_cfgP1Info.selCursor == g_cfgP1Normal[12] or g_cfgP1Info.selCursor == g_cfgP1Normal[13] then
    r2_150:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_drawSkipIcon = true
    if g_cfgP1Info.selCursor == g_cfgP1Normal[13] then
      g_drawSkipIcon = false
    end
    updateSkipAutoIcon()
    initConfigP1(r3_150, false)
  end
  if g_cfgP1Info.selCursor == g_cfgP1Normal[14] or g_cfgP1Info.selCursor == g_cfgP1Normal[15] then
    r2_150:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_mouseAutoMove = true
    if g_cfgP1Info.selCursor == g_cfgP1Normal[15] then
      g_mouseAutoMove = false
    end
    initConfigP1(r3_150, false)
  end
  if g_cfgP1Info.selCursor == g_cfgP1Normal[16] or g_cfgP1Info.selCursor == g_cfgP1Normal[17] then
    r2_150:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_skipConfirm = false
    if g_cfgP1Info.selCursor == g_cfgP1Normal[17] then
      g_skipConfirm = true
    end
    initConfigP1(r3_150, false)
  end
  if g_cfgP1Info.selCursor == g_cfgP1Normal[18] or g_cfgP1Info.selCursor == g_cfgP1Normal[19] or g_cfgP1Info.selCursor == g_cfgP1Normal[20] then
    r2_150:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_hideCursor = 0
    if g_cfgP1Info.selCursor == g_cfgP1Normal[19] then
      g_hideCursor = 1
    elseif g_cfgP1Info.selCursor == g_cfgP1Normal[20] then
      g_hideCursor = 2
    end
    initConfigP1(r3_150, false)
  end
  if g_cfgP1Info.selCursor == g_cfgP1Normal[21] or g_cfgP1Info.selCursor == g_cfgP1Normal[22] then
    r2_150:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_deactiveMode = true
    if g_cfgP1Info.selCursor == g_cfgP1Normal[22] then
      g_deactiveMode = false
    end
    initConfigP1(r3_150, false)
  end
  r2_150:delete()
end
function changeCfgP1Focus(r0_151)
  -- line: [4719, 4781] id: 151
  -- notice: unreachable block#61
  -- notice: unreachable block#49
  -- notice: unreachable block#68
  -- notice: unreachable block#55
  -- notice: unreachable block#74
  -- notice: unreachable block#36
  -- notice: unreachable block#22
  -- notice: unreachable block#43
  -- notice: unreachable block#30
  local r1_151 = cclass.lua_Layers:create()
  local r2_151 = "ConfigPage" .. tostring(g_configInfo.page)
  local r3_151 = -1
  for r7_151, r8_151 in pairs(g_cfgP1Normal) do
    if r0_151 == r8_151 then
      if isCfgP1Current(r7_151) == false then
        r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1Normal[r7_151], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1Select[r7_151], LUA_PARAM_COLOR, 1, 1, 1, 1)
        local r9_151 = cclass.lua_Sounds:new()
        r9_151:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
        r9_151:delete()
      end
      r3_151 = r7_151
    elseif g_cfgP1Info.selCursor == r8_151 and isCfgP1Current(r7_151) == false then
      r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1Normal[r7_151], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1Select[r7_151], LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
  for r7_151 = 1, #g_cfgP1Detail, 1 do
    local r8_151 = g_cfgP1DetailIndex[r3_151]
    if r7_151 == r8_151 then
      r8_151 = 1 or 0
    else
      goto label_108	-- block#12 is visited secondly
    end
    r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1Detail[r7_151], LUA_PARAM_COLOR, 1, 1, 1, r8_151)
    if r8_151 ~= 0 then
      if g_cfgP1Normal[r3_151] == r0_151 then
        local r10_151 = 0
        local r11_151 = 0
        local r12_151 = 0
        r9_151, r10_151, r11_151, r12_151 = r1_151:getSubLayerParam("configBase", r2_151, g_cfgP1Detail[r7_151], LUA_PARAM_POS, 0, r10_151, r11_151, r12_151)
        r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1Detail[r7_151], LUA_PARAM_POS, g_cfgP1DetailX[r7_151] - APP_INTERNAL_WIDTH, r10_151, r11_151, r12_151)
        r1_151:setSubLayerEffect("configBase", r2_151, "textScroll", g_cfgP1Detail[r7_151], LUA_EFFECT_POS, APP_INTERNAL_WIDTH + 10, 0, 0, 0, EFFECT_EASEIN, 150, 0, 0)
        r1_151:setSubLayerEffect("configBase", r2_151, "textScroll", g_cfgP1Detail[r7_151], LUA_EFFECT_POS, -15, 0, 0, 0, 0, 30, 0, 0)
        r1_151:setSubLayerEffect("configBase", r2_151, "textScroll", g_cfgP1Detail[r7_151], LUA_EFFECT_POS, 5, 0, 0, 0, 0, 15, 0, 0)
        r1_151:startSubLayerEffect("configBase", r2_151, "textScroll", g_cfgP1Detail[r7_151], 0)
      end
    else
      r1_151:cancelSubLayerEffect("configBase", r2_151, g_cfgP1Detail[r7_151], "textScroll")
    end
  end
  local r4_151 = {}
  local r5_151 = g_cfgP1Normal[1]
  if r0_151 ~= r5_151 then
    r5_151 = g_cfgP1Normal[2]
    if r0_151 == r5_151 then
      goto label_238
    else
      r5_151 = false
    end
  else
    ::label_238::
    ::label_238::
    r5_151 = true
  end
  r4_151[1] = r5_151
  r5_151 = g_cfgP1Normal[3]
  if r0_151 ~= r5_151 then
    r5_151 = g_cfgP1Normal[4]
    if r0_151 ~= r5_151 then
      r5_151 = g_cfgP1Normal[5]
      if r0_151 ~= r5_151 then
        r5_151 = g_cfgP1Normal[6]
        if r0_151 == r5_151 then
          goto label_260
        else
          r5_151 = false
        end
      end
    end
  else
    ::label_260::
    ::label_260::
    r5_151 = true
  end
  r4_151[2] = r5_151
  r5_151 = g_cfgP1Normal[7]
  if r0_151 ~= r5_151 then
    r5_151 = g_cfgP1Normal[8]
    if r0_151 == r5_151 then
      goto label_274
    else
      r5_151 = false
    end
  else
    ::label_274::
    ::label_274::
    r5_151 = true
  end
  r4_151[3] = r5_151
  r5_151 = g_cfgP1Normal[9]
  if r0_151 ~= r5_151 then
    r5_151 = g_cfgP1Normal[10]
    if r0_151 ~= r5_151 then
      r5_151 = g_cfgP1Normal[11]
      if r0_151 == r5_151 then
        goto label_292
      else
        r5_151 = false
      end
    end
  else
    ::label_292::
    ::label_292::
    r5_151 = true
  end
  r4_151[4] = r5_151
  r5_151 = g_cfgP1Normal[12]
  if r0_151 ~= r5_151 then
    r5_151 = g_cfgP1Normal[13]
    if r0_151 == r5_151 then
      goto label_306
    else
      r5_151 = false
    end
  else
    ::label_306::
    ::label_306::
    r5_151 = true
  end
  r4_151[5] = r5_151
  r5_151 = g_cfgP1Normal[14]
  if r0_151 ~= r5_151 then
    r5_151 = g_cfgP1Normal[15]
    if r0_151 == r5_151 then
      goto label_320
    else
      r5_151 = false
    end
  else
    ::label_320::
    ::label_320::
    r5_151 = true
  end
  r4_151[6] = r5_151
  r5_151 = g_cfgP1Normal[16]
  if r0_151 ~= r5_151 then
    r5_151 = g_cfgP1Normal[17]
    if r0_151 == r5_151 then
      goto label_334
    else
      r5_151 = false
    end
  else
    ::label_334::
    ::label_334::
    r5_151 = true
  end
  r4_151[7] = r5_151
  r5_151 = g_cfgP1Normal[18]
  if r0_151 ~= r5_151 then
    r5_151 = g_cfgP1Normal[19]
    if r0_151 ~= r5_151 then
      r5_151 = g_cfgP1Normal[20]
      if r0_151 == r5_151 then
        goto label_352
      else
        r5_151 = false
      end
    end
  else
    ::label_352::
    ::label_352::
    r5_151 = true
  end
  r4_151[8] = r5_151
  r5_151 = g_cfgP1Normal[21]
  if r0_151 ~= r5_151 then
    r5_151 = g_cfgP1Normal[22]
    if r0_151 == r5_151 then
      goto label_366
    else
      r5_151 = false
    end
  else
    ::label_366::
    ::label_366::
    r5_151 = true
  end
  r4_151[9] = r5_151
  for r8_151 = 1, #g_cfgP1ItemSelect, 1 do
    if r4_151[r8_151] == true then
      r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1ItemSelect[r8_151], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1ItemNormal[r8_151], LUA_PARAM_COLOR, 1, 1, 1, 0)
    else
      r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1ItemSelect[r8_151], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_151:setSubLayerParam("configBase", r2_151, g_cfgP1ItemNormal[r8_151], LUA_PARAM_COLOR, 1, 1, 1, 1)
    end
  end
end
function effectCfg1Preview(r0_152, r1_152, r2_152, r3_152)
  -- line: [4784, 4800] id: 152
  local r4_152 = cclass.lua_Layers:create()
  local r5_152 = getEffectRate()
  local r6_152 = "preview"
  if r0_152 ~= true then
    if r2_152 == false then
      local r7_152 = 0
      local r8_152 = 0
      local r9_152 = 0
      local r10_152 = 0
      r7_152, r8_152, r9_152, r10_152 = r4_152:getParam("configBase", r6_152, LUA_PARAM_POS, r7_152, r8_152, r9_152, r10_152)
      r4_152:setParam("configBase", r6_152, LUA_PARAM_POS, r7_152 - r1_152, r8_152, r9_152, r10_152)
    end
    r4_152:setEffect("configBase", r6_152, "ConfigPage", LUA_EFFECT_POS, r1_152, 0, 0, 0, 0, 300 * r5_152, 0, r3_152)
    r4_152:startEffect("configBase", r6_152, "ConfigPage", 0)
  end
end
g_cfgP2Normal = {
  25,
  26,
  27,
  28,
  29,
  30
}
g_cfgP2Select = {
  31,
  32,
  33,
  34,
  35,
  36
}
g_cfgP2Current = {
  37,
  38,
  39,
  40,
  41,
  42
}
g_cfgP2Detail = {
  7,
  6,
  5,
  4,
  3,
  2,
  1
}
g_cfgP2ItemNormal = {
  45,
  46,
  47,
  48,
  49,
  50
}
g_cfgP2ItemSelect = {
  51,
  52,
  53,
  54,
  55,
  56
}
g_cfgP2DetailIndex = {
  3,
  4,
  5,
  5,
  7,
  7
}
g_cfgP2Button = {
  g_cfgP2Normal,
  g_cfgP2Select,
  g_cfgP2Current,
  g_cfgP2Detail,
  g_cfgP2ItemNormal,
  g_cfgP2ItemSelect
}
g_cfgP2Info = {
  selCursor = -1,
  messageBar,
  opacityBar,
  autoSpeedBar,
  autoModeTimer
}
g_cfgP2DetailX = {}
function isCfgP2Current(r0_153)
  -- line: [4815, 4836] id: 153
  if r0_153 < 3 then
    local r1_153 = g_allskip
    if r1_153 == false then
      r1_153 = 1 or 2
    else
      goto label_8	-- block#3 is visited secondly
    end
    if r0_153 == r1_153 then
      return true
    end
  elseif r0_153 < 5 then
    local r1_153 = g_selectReleaseSkip
    if r1_153 == true then
      r1_153 = 3 or 4
    else
      goto label_22	-- block#9 is visited secondly
    end
    if r0_153 == r1_153 then
      return true
    end
  elseif r0_153 < 7 then
    local r1_153 = g_selectReleaseAuto
    if r1_153 == true then
      r1_153 = 5 or 6
    else
      goto label_36	-- block#15 is visited secondly
    end
    if r0_153 == r1_153 then
      return true
    end
  end
  return false
end
function initConfigP2(r0_154, r1_154)
  -- line: [4839, 4901] id: 154
  local r2_154 = cclass.lua_Layers:create()
  if r1_154 == true then
    r2_154:initSubLayer("configBase", r0_154, 75, 1)
    r2_154:initSubLayer("configBase", r0_154, 74, 1)
    r2_154:setSubLayerParam("configBase", r0_154, 74, LUA_PARAM_COLOR, 1, 1, 1, g_messagealpha / 100)
    r2_154:initSubLayer("configBase", r0_154, 58, 1)
    for r7_154, r8_154 in pairs(g_cfgP2Button) do
      for r12_154, r13_154 in pairs(r8_154) do
        r2_154:initSubLayer("configBase", r0_154, r13_154, 1)
      end
    end
    local r4_154 = "ConfigText2"
    r2_154:insertTextLayer("configBase", r4_154, 744, 118, 4, 0, 24, 1, 0.25, 1)
    r2_154:setParam("configBase", r4_154, LUA_PARAM_POS, 282, 372, 0, 0)
    for r8_154 = 1, 15, 1 do
      r2_154:setAnimation("configBase", r0_154, "ClkWait", 74 - r8_154, 0.06666666666666667 * (r8_154 - 1), 0)
    end
  end
  for r6_154 = 1, #g_cfgP2Normal, 1 do
    if isCfgP2Current(r6_154) == false then
      r2_154:setSubLayerParam("configBase", r0_154, g_cfgP2Normal[r6_154], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_154:setSubLayerParam("configBase", r0_154, g_cfgP2Select[r6_154], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_154:setSubLayerParam("configBase", r0_154, g_cfgP2Current[r6_154], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_154:setSubLayerHitTest("configBase", r0_154, g_cfgP2Normal[r6_154], 1, 0)
    else
      r2_154:setSubLayerParam("configBase", r0_154, g_cfgP2Normal[r6_154], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_154:setSubLayerParam("configBase", r0_154, g_cfgP2Select[r6_154], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_154:setSubLayerParam("configBase", r0_154, g_cfgP2Current[r6_154], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_154:setSubLayerHitTest("configBase", r0_154, g_cfgP2Normal[r6_154], 1, 0)
    end
  end
  if r1_154 == true then
    for r6_154 = 1, #g_cfgP2Detail, 1 do
      r2_154:setSubLayerParam("configBase", r0_154, g_cfgP2Detail[r6_154], LUA_PARAM_COLOR, 1, 1, 1, 0)
      local r7_154 = 0
      r7_154, r8_154, r9_154, r10_154 = r2_154:getSubLayerParam("configBase", r0_154, g_cfgP2Detail[r6_154], LUA_PARAM_POS, r7_154, 0, 0, 0)
      g_cfgP2DetailX[r6_154] = r7_154
    end
    g_cfgP2Info.messageBar = GraphBar.new("configBase", r0_154, 100, 11, 14, 20, 17)
    g_cfgP2Info.messageBar:init(g_msgspeed)
    g_cfgP2Info.opacityBar = GraphBar.new("configBase", r0_154, 100, 12, 15, 21, 18)
    g_cfgP2Info.opacityBar:init(g_messagealpha)
    g_cfgP2Info.autoSpeedBar = GraphBar.new("configBase", r0_154, 100, 13, 16, 22, 19)
    g_cfgP2Info.autoSpeedBar:init(g_autospeed)
    g_cfgP2Info.autoModeTimer = AutoModeTimer.new()
    g_cfgP2Info.autoModeTimer:reset()
    for r6_154 = 1, #g_cfgP2ItemSelect, 1 do
      r2_154:setSubLayerParam("configBase", r0_154, g_cfgP2ItemSelect[r6_154], LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
    g_cfgP2Info.selCursor = -1
  else
    g_cfgP2Info.messageBar:updateBar(g_msgspeed)
    g_cfgP2Info.opacityBar:updateBar(g_messagealpha)
    g_cfgP2Info.autoSpeedBar:updateBar(g_autospeed)
  end
end
function onLButtonDownCfgP2(r0_155)
  -- line: [4903, 4976] id: 155
  if r0_155 == true and g_cfgP2Info.selCursor ~= g_cfgP2Info.messageBar:getInput() and g_cfgP2Info.selCursor ~= g_cfgP2Info.opacityBar:getInput() and g_cfgP2Info.selCursor ~= g_cfgP2Info.autoSpeedBar:getInput() then
    return 
  end
  local r1_155 = 0
  for r5_155 = 1, #g_cfgP2Normal, 1 do
    if g_cfgP2Normal[r5_155] == g_cfgP2Info.selCursor then
      r1_155 = r5_155
      break
    end
  end
  if isCfgP2Current(r1_155) == true then
    return 
  end
  local r2_155 = cclass.lua_Sounds:new()
  local r3_155 = "ConfigPage" .. tostring(g_configInfo.page)
  if g_cfgP2Info.selCursor == g_cfgP2Normal[1] or g_cfgP2Info.selCursor == g_cfgP2Normal[2] then
    r2_155:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_allskip = false
    if g_cfgP2Info.selCursor == g_cfgP2Normal[2] then
      g_allskip = true
    end
    initConfigP2(r3_155, false)
  end
  if g_cfgP2Info.selCursor == g_cfgP2Normal[3] or g_cfgP2Info.selCursor == g_cfgP2Normal[4] then
    r2_155:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_selectReleaseSkip = true
    if g_cfgP2Info.selCursor == g_cfgP2Normal[4] then
      g_selectReleaseSkip = false
    end
    initConfigP2(r3_155, false)
  end
  if g_cfgP2Info.selCursor == g_cfgP2Normal[5] or g_cfgP2Info.selCursor == g_cfgP2Normal[6] then
    r2_155:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_selectReleaseAuto = true
    if g_cfgP2Info.selCursor == g_cfgP2Normal[6] then
      g_selectReleaseAuto = false
    end
    initConfigP2(r3_155, false)
  end
  local r4_155 = 0
  local r5_155 = 0
  local r6_155 = cclass.lua_AutoCursor:new()
  r4_155, r5_155 = r6_155:GetCursorPos(r4_155, r5_155)
  r6_155:delete()
  local r7_155 = g_cfgP2Info.opacityBar:onLButtonDown(g_cfgP2Info.selCursor, r4_155, r5_155, g_messagealpha)
  if r7_155 ~= g_messagealpha then
    g_messagealpha = r7_155
    changeMessageWindowOpacity(r3_155)
    if g_menuExecute == false then
      local r8_155 = cclass.lua_Layers:create()
      r8_155:removeSnap("system")
      r8_155:setSnap("system", true)
    end
  end
  r7_155 = g_cfgP2Info.messageBar:onLButtonDown(g_cfgP2Info.selCursor, r4_155, r5_155, g_msgspeed)
  if r7_155 ~= g_msgspeed then
    g_msgspeed = r7_155
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEMSGSPEED, 0)
    startCfg2Preview()
  end
  r7_155 = g_cfgP2Info.autoSpeedBar:onLButtonDown(g_cfgP2Info.selCursor, r4_155, r5_155, g_autospeed)
  if 0 <= r7_155 and r7_155 ~= g_autospeed then
    g_autospeed = r7_155
  end
  r2_155:delete()
end
function changeCfgP2Focus(r0_156)
  -- line: [4979, 5054] id: 156
  -- notice: unreachable block#36
  -- notice: unreachable block#41
  -- notice: unreachable block#62
  -- notice: unreachable block#49
  -- notice: unreachable block#55
  -- notice: unreachable block#68
  local r1_156 = cclass.lua_Layers:create()
  local r2_156 = "ConfigPage" .. tostring(g_configInfo.page)
  local r3_156 = -1
  for r7_156, r8_156 in pairs(g_cfgP2Normal) do
    if r0_156 == r8_156 then
      if isCfgP2Current(r7_156) == false then
        r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2Normal[r7_156], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2Select[r7_156], LUA_PARAM_COLOR, 1, 1, 1, 1)
        local r9_156 = cclass.lua_Sounds:new()
        r9_156:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
        r9_156:delete()
      end
      r3_156 = r7_156
    elseif g_cfgP2Info.selCursor == r8_156 and isCfgP2Current(r7_156) == false then
      r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2Normal[r7_156], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2Select[r7_156], LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
  g_cfgP2Info.messageBar:changeFocus(g_cfgP2Info.selCursor, r0_156)
  g_cfgP2Info.opacityBar:changeFocus(g_cfgP2Info.selCursor, r0_156)
  g_cfgP2Info.autoSpeedBar:changeFocus(g_cfgP2Info.selCursor, r0_156)
  for r7_156 = 1, #g_cfgP2Detail, 1 do
    local r8_156 = g_cfgP2DetailIndex[r3_156]
    if r7_156 == r8_156 then
      r8_156 = 1 or 0
    else
      goto label_129	-- block#12 is visited secondly
    end
    if r0_156 == g_cfgP2Info.messageBar:getInput() and r7_156 == 1 then
      r8_156 = 1
    end
    if r0_156 == g_cfgP2Info.opacityBar:getInput() and r7_156 == 2 then
      r8_156 = 1
    end
    if r0_156 == g_cfgP2Info.autoSpeedBar:getInput() and r7_156 == 6 then
      r8_156 = 1
    end
    r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2Detail[r7_156], LUA_PARAM_COLOR, 1, 1, 1, r8_156)
    if r8_156 ~= 0 then
      if g_cfgP2Normal[r3_156] == r0_156 or r0_156 == g_cfgP2Info.messageBar:getInput() and r7_156 == 1 or r0_156 == g_cfgP2Info.opacityBar:getInput() and r7_156 == 2 or r0_156 == g_cfgP2Info.autoSpeedBar:getInput() and r7_156 == 6 then
        local r10_156 = 0
        local r11_156 = 0
        local r12_156 = 0
        r9_156, r10_156, r11_156, r12_156 = r1_156:getSubLayerParam("configBase", r2_156, g_cfgP2Detail[r7_156], LUA_PARAM_POS, 0, r10_156, r11_156, r12_156)
        r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2Detail[r7_156], LUA_PARAM_POS, g_cfgP2DetailX[r7_156] - APP_INTERNAL_WIDTH, r10_156, r11_156, r12_156)
        r1_156:setSubLayerEffect("configBase", r2_156, "textScroll", g_cfgP2Detail[r7_156], LUA_EFFECT_POS, APP_INTERNAL_WIDTH + 10, 0, 0, 0, EFFECT_EASEIN, 150, 0, 0)
        r1_156:setSubLayerEffect("configBase", r2_156, "textScroll", g_cfgP2Detail[r7_156], LUA_EFFECT_POS, -15, 0, 0, 0, 0, 30, 0, 0)
        r1_156:setSubLayerEffect("configBase", r2_156, "textScroll", g_cfgP2Detail[r7_156], LUA_EFFECT_POS, 5, 0, 0, 0, 0, 15, 0, 0)
        r1_156:startSubLayerEffect("configBase", r2_156, "textScroll", g_cfgP2Detail[r7_156], 0)
      end
    else
      r1_156:cancelSubLayerEffect("configBase", r2_156, g_cfgP2Detail[r7_156], "textScroll")
    end
  end
  local r4_156 = {}
  local r5_156 = g_cfgP2Info.messageBar:getInput()
  if r0_156 == r5_156 then
    r5_156 = true
  else
    r5_156 = false
  end
  r4_156[1] = r5_156
  r5_156 = g_cfgP2Info.opacityBar:getInput()
  if r0_156 == r5_156 then
    r5_156 = true
  else
    r5_156 = false
  end
  r4_156[2] = r5_156
  r5_156 = g_cfgP2Normal[1]
  if r0_156 ~= r5_156 then
    r5_156 = g_cfgP2Normal[2]
    if r0_156 ~= r5_156 then
      r5_156 = g_cfgP2Normal[3]
      if r0_156 ~= r5_156 then
        r5_156 = g_cfgP2Normal[4]
        if r0_156 == r5_156 then
          goto label_342
        else
          r5_156 = false
        end
      end
    end
  else
    ::label_342::
    ::label_342::
    r5_156 = true
  end
  r4_156[3] = r5_156
  r5_156 = g_cfgP2Normal[3]
  if r0_156 ~= r5_156 then
    r5_156 = g_cfgP2Normal[4]
    if r0_156 == r5_156 then
      goto label_356
    else
      r5_156 = false
    end
  else
    ::label_356::
    ::label_356::
    r5_156 = true
  end
  r4_156[4] = r5_156
  r5_156 = g_cfgP2Info.autoSpeedBar:getInput()
  if r0_156 ~= r5_156 then
    r5_156 = g_cfgP2Normal[5]
    if r0_156 ~= r5_156 then
      r5_156 = g_cfgP2Normal[6]
      if r0_156 == r5_156 then
        goto label_376
      else
        r5_156 = false
      end
    end
  else
    ::label_376::
    ::label_376::
    r5_156 = true
  end
  r4_156[5] = r5_156
  r5_156 = g_cfgP2Normal[5]
  if r0_156 ~= r5_156 then
    r5_156 = g_cfgP2Normal[6]
    if r0_156 == r5_156 then
      goto label_390
    else
      r5_156 = false
    end
  else
    ::label_390::
    ::label_390::
    r5_156 = true
  end
  r4_156[6] = r5_156
  for r8_156 = 1, #g_cfgP2ItemSelect, 1 do
    if r4_156[r8_156] == true then
      r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2ItemSelect[r8_156], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2ItemNormal[r8_156], LUA_PARAM_COLOR, 1, 1, 1, 0)
    else
      r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2ItemSelect[r8_156], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_156:setSubLayerParam("configBase", r2_156, g_cfgP2ItemNormal[r8_156], LUA_PARAM_COLOR, 1, 1, 1, 1)
    end
  end
end
function effectCfg2Text(r0_157, r1_157, r2_157, r3_157)
  -- line: [5057, 5073] id: 157
  local r4_157 = cclass.lua_Layers:create()
  local r5_157 = getEffectRate()
  local r6_157 = "ConfigText2"
  if r0_157 ~= true then
    if r2_157 == false then
      local r7_157 = 0
      local r8_157 = 0
      local r9_157 = 0
      local r10_157 = 0
      r7_157, r8_157, r9_157, r10_157 = r4_157:getParam("configBase", r6_157, LUA_PARAM_POS, r7_157, r8_157, r9_157, r10_157)
      r4_157:setParam("configBase", r6_157, LUA_PARAM_POS, r7_157 - r1_157, r8_157, r9_157, r10_157)
    end
    r4_157:setEffect("configBase", r6_157, "ConfigPage", LUA_EFFECT_POS, r1_157, 0, 0, 0, 0, 300 * r5_157, 0, r3_157)
    r4_157:startEffect("configBase", r6_157, "ConfigPage", 0)
  end
end
function startCfg2Preview()
  -- line: [5076, 5085] id: 158
  local r0_158 = cclass.lua_Layers:create()
  local r1_158 = "ConfigText2"
  local r2_158 = "\x82\xb1\x82\xea\x82\u{343}T\x83\x93\x83v\x83\x8b\x83e\x83L\x83X\x83g\x82ł\xb7\x81B\n\x83e\x83L\x83X\x83g\x82\u{315}\\\x8e\xa6\x91\xac\x93x\x82\u{342}\xb1\x82ꂭ\x82炢\x82ł\xb7\x81B\x82\xa0\x82\xa2\x82\xa4\x82\xa6\x82\xa8\x82P\x82Q\x82R\x82S\x82T\x82U\x82V\x82W\x82X\x82O{\x8a\xbf\x8e\x9a:\x82\xa9\x82\xf1\x82\xb6}\x82`\x82a\x82b\x82c\x82d\x81I\x81H"
  r0_158:clearText("configBase", r1_158)
  r0_158:effectText("configBase", r1_158, r2_158, "MS UI Gothic", 18, 2, 0, 5153535, 4294967295)
  g_cfgP2Info.autoModeTimer:reset()
  r0_158:stopAnimation("configBase", "ConfigPage2", "ClkWait")
end
g_cfgP3Normal = {
  44,
  45,
  46,
  47,
  48,
  49,
  100,
  101,
  102,
  103,
  104,
  105,
  106,
  107,
  108,
  109,
  110,
  111,
  112,
  113,
  114,
  115,
  116,
  nil
}
g_cfgP3Select = {
  51,
  52,
  53,
  54,
  55,
  56,
  83,
  84,
  85,
  86,
  87,
  88,
  89,
  90,
  91,
  92,
  93,
  94,
  95,
  96,
  97,
  98,
  99,
  nil
}
g_cfgP3Current = {
  58,
  59,
  60,
  61,
  62,
  63,
  66,
  67,
  68,
  69,
  70,
  71,
  72,
  73,
  74,
  75,
  76,
  77,
  78,
  79,
  80,
  81,
  82,
  nil
}
g_cfgP3Detail = {
  11,
  10,
  9,
  8,
  7,
  6,
  5,
  4,
  3,
  2,
  1
}
g_cfgP3ItemNormal = {
  129,
  130,
  131,
  132,
  133,
  134,
  135,
  136,
  137,
  138
}
g_cfgP3ItemSelect = {
  119,
  120,
  121,
  122,
  123,
  124,
  125,
  126,
  127,
  128
}
g_cfgP3CharBase = {
  157,
  156,
  155,
  154,
  153,
  152,
  151,
  150,
  149,
  148,
  147,
  146,
  145,
  144,
  143,
  142,
  141,
  nil
}
g_cfgP3DetailIndex = {
  6,
  6,
  7,
  7,
  10,
  11,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  nil
}
g_cfgP3Button = {
  g_cfgP3Normal,
  g_cfgP3Select,
  g_cfgP3Current,
  g_cfgP3Detail,
  g_cfgP3ItemNormal,
  g_cfgP3ItemSelect,
  g_cfgP3CharBase
}
g_cfgP3Info = {
  selCursor = -1,
  selChar = 1,
  masterBar,
  bgmBar,
  seBar,
  movieBar,
  voiceBar,
  cutBar,
  charBar
}
g_cfgP3DetailX = {}
function getPersonalIndex()
  -- line: [5103, 5105] id: 159
  return getSoundIndex("char") + g_cfgP3Info.selChar
end
function isCfgP3Current(r0_160)
  -- line: [5107, 5134] id: 160
  if r0_160 < 3 then
    local r1_160 = g_clickVoice
    if r1_160 == true then
      r1_160 = 1 or 2
    else
      goto label_8	-- block#3 is visited secondly
    end
    if r0_160 == r1_160 then
      return true
    end
  elseif r0_160 < 5 then
    local r1_160 = g_enablePan
    if r1_160 == true then
      r1_160 = 3 or 4
    else
      goto label_22	-- block#9 is visited secondly
    end
    if r0_160 == r1_160 then
      return true
    end
  elseif r0_160 < 6 and g_sysVoiceChar == g_cfgP3Info.selChar then
    return true
  elseif r0_160 < 7 and g_sysVoiceChar == 999 then
    return true
  elseif r0_160 < 24 and r0_160 - 6 == g_cfgP3Info.selChar then
    return true
  end
  return false
end
function initConfigP3(r0_161, r1_161)
  -- line: [5137, 5220] id: 161
  local r2_161 = cclass.lua_Layers:create()
  if r1_161 == true then
    r2_161:initSubLayer("configBase", r0_161, 159, 1)
    for r6_161, r7_161 in pairs(g_cfgP3Button) do
      for r11_161, r12_161 in pairs(r7_161) do
        r2_161:initSubLayer("configBase", r0_161, r12_161, 1)
      end
    end
  end
  for r6_161 = 1, #g_cfgP3Normal, 1 do
    if isCfgP3Current(r6_161) == false then
      r2_161:setSubLayerParam("configBase", r0_161, g_cfgP3Normal[r6_161], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_161:setSubLayerParam("configBase", r0_161, g_cfgP3Select[r6_161], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_161:setSubLayerParam("configBase", r0_161, g_cfgP3Current[r6_161], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_161:setSubLayerHitTest("configBase", r0_161, g_cfgP3Normal[r6_161], 1, 0)
    else
      r2_161:setSubLayerParam("configBase", r0_161, g_cfgP3Normal[r6_161], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_161:setSubLayerParam("configBase", r0_161, g_cfgP3Select[r6_161], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_161:setSubLayerParam("configBase", r0_161, g_cfgP3Current[r6_161], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_161:setSubLayerHitTest("configBase", r0_161, g_cfgP3Normal[r6_161], 1, 0)
    end
  end
  local r3_161 = g_mixer:getMasterVolume()
  if g_mixer:getMasterMute() ~= false or not r3_161 then
    r3_161 = 0
  end
  if r1_161 == true then
    for r7_161 = 1, #g_cfgP3Detail, 1 do
      r2_161:setSubLayerParam("configBase", r0_161, g_cfgP3Detail[r7_161], LUA_PARAM_COLOR, 1, 1, 1, 0)
      local r8_161 = 0
      r8_161, r9_161, r10_161, r11_161 = r2_161:getSubLayerParam("configBase", r0_161, g_cfgP3Detail[r7_161], LUA_PARAM_POS, r8_161, 0, 0, 0)
      g_cfgP3DetailX[r7_161] = r8_161
    end
    g_cfgP3Info.masterBar = GraphBar.new("configBase", r0_161, 100, 15, 22, 36, 29)
    g_cfgP3Info.masterBar:init(r3_161)
    g_cfgP3Info.bgmBar = GraphBar.new("configBase", r0_161, 100, 16, 23, 37, 30)
    g_cfgP3Info.bgmBar:init(g_volume[getSoundIndex("bgm")].vol / 10)
    g_cfgP3Info.seBar = GraphBar.new("configBase", r0_161, 100, 17, 24, 38, 31)
    g_cfgP3Info.seBar:init(g_volume[getSoundIndex("se")].vol / 10)
    g_cfgP3Info.movieBar = GraphBar.new("configBase", r0_161, 100, 18, 25, 39, 32)
    g_cfgP3Info.movieBar:init(g_volume[getSoundIndex("movie")].vol / 10)
    g_cfgP3Info.voiceBar = GraphBar.new("configBase", r0_161, 100, 19, 26, 40, 33)
    g_cfgP3Info.voiceBar:init(g_volume[getSoundIndex("char")].vol / 10)
    g_cfgP3Info.cutBar = GraphBar.new("configBase", r0_161, 100, 20, 27, 41, 34)
    g_cfgP3Info.cutBar:init(g_bgmCutPer)
    g_cfgP3Info.charBar = GraphBar.new("configBase", r0_161, 100, 21, 28, 42, 35)
    g_cfgP3Info.charBar:init(g_volume[getPersonalIndex()].vol / 10)
    for r7_161 = 1, #g_cfgP3ItemSelect, 1 do
      r2_161:setSubLayerParam("configBase", r0_161, g_cfgP3ItemSelect[r7_161], LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
    g_cfgP3Info.selCursor = -1
  else
    g_cfgP3Info.masterBar:updateBar(r3_161)
    g_cfgP3Info.bgmBar:updateBar(g_volume[getSoundIndex("bgm")].vol / 10)
    g_cfgP3Info.seBar:updateBar(g_volume[getSoundIndex("se")].vol / 10)
    g_cfgP3Info.movieBar:updateBar(g_volume[getSoundIndex("movie")].vol / 10)
    g_cfgP3Info.voiceBar:updateBar(g_volume[getSoundIndex("char")].vol / 10)
    g_cfgP3Info.cutBar:updateBar(g_bgmCutPer)
    g_cfgP3Info.charBar:updateBar(g_volume[getPersonalIndex()].vol / 10)
  end
  for r7_161 = 1, #g_cfgP3CharBase, 1 do
    if g_cfgP3Info.selChar == r7_161 then
      r2_161:setSubLayerVisible("configBase", r0_161, g_cfgP3CharBase[r7_161], 1)
    else
      r2_161:setSubLayerVisible("configBase", r0_161, g_cfgP3CharBase[r7_161], 0)
    end
  end
  local r4_161 = 1
  if g_cfgP3Info.selChar > 15 then
    r4_161 = 0
  end
  r2_161:setSubLayerVisible("configBase", r0_161, g_cfgP3Normal[5], r4_161)
  r2_161:setSubLayerVisible("configBase", r0_161, g_cfgP3Select[5], r4_161)
  r2_161:setSubLayerVisible("configBase", r0_161, g_cfgP3Current[5], r4_161)
end
function onLButtonDownCfgP3(r0_162)
  -- line: [5222, 5362] id: 162
  -- notice: unreachable block#30
  -- notice: unreachable block#22
  if r0_162 == true and g_cfgP3Info.selCursor ~= g_cfgP3Info.masterBar:getInput() and g_cfgP3Info.selCursor ~= g_cfgP3Info.bgmBar:getInput() and g_cfgP3Info.selCursor ~= g_cfgP3Info.seBar:getInput() and g_cfgP3Info.selCursor ~= g_cfgP3Info.movieBar:getInput() and g_cfgP3Info.selCursor ~= g_cfgP3Info.voiceBar:getInput() and g_cfgP3Info.selCursor ~= g_cfgP3Info.cutBar:getInput() and g_cfgP3Info.selCursor ~= g_cfgP3Info.charBar:getInput() then
    return 
  end
  local r1_162 = 0
  for r5_162 = 1, #g_cfgP3Normal, 1 do
    if g_cfgP3Normal[r5_162] == g_cfgP3Info.selCursor then
      r1_162 = r5_162
      break
    end
  end
  if r1_162 ~= 5 and r1_162 ~= 6 and isCfgP3Current(r1_162) == true then
    return 
  end
  local r2_162 = cclass.lua_Sounds:new()
  local r3_162 = "ConfigPage" .. tostring(g_configInfo.page)
  if g_cfgP3Info.selCursor == g_cfgP3Normal[1] or g_cfgP3Info.selCursor == g_cfgP3Normal[2] then
    r2_162:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    local r4_162 = g_cfgP3Info.selCursor
    if r4_162 == g_cfgP3Normal[1] then
      r4_162 = true
    else
      r4_162 = false
    end
    g_clickVoice = r4_162
    initConfigP3(r3_162, false)
  end
  if g_cfgP3Info.selCursor == g_cfgP3Normal[3] or g_cfgP3Info.selCursor == g_cfgP3Normal[4] then
    r2_162:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    local r4_162 = g_cfgP3Info.selCursor
    if r4_162 == g_cfgP3Normal[3] then
      r4_162 = true
    else
      r4_162 = false
    end
    g_enablePan = r4_162
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEPAN, 0)
    initConfigP3(r3_162, false)
  end
  if g_cfgP3Info.selCursor == g_cfgP3Normal[5] then
    r2_162:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    if isCfgP3Current(r1_162) == true then
      g_sysVoiceChar = 0
    else
      g_sysVoiceChar = g_cfgP3Info.selChar
    end
    initConfigP3(r3_162, false)
  end
  if g_cfgP3Info.selCursor == g_cfgP3Normal[6] then
    r2_162:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    if isCfgP3Current(r1_162) == true then
      g_sysVoiceChar = 0
    else
      g_sysVoiceChar = 999
    end
    initConfigP3(r3_162, false)
  end
  if g_cfgP3Normal[7] <= g_cfgP3Info.selCursor and g_cfgP3Info.selCursor <= g_cfgP3Normal[23] then
    r2_162:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_cfgP3Info.selChar = r1_162 - 6
    initConfigP3(r3_162, false)
  end
  local r4_162 = 0
  local r5_162 = 0
  local r6_162 = cclass.lua_AutoCursor:new()
  r4_162, r5_162 = r6_162:GetCursorPos(r4_162, r5_162)
  r6_162:delete()
  local r7_162 = g_mixer:getMasterVolume()
  if g_mixer:getMasterMute() ~= false or not r7_162 then
    r7_162 = 0
  end
  local r8_162 = g_cfgP3Info.masterBar:onLButtonDown(g_cfgP3Info.selCursor, r4_162, r5_162, r7_162)
  if r8_162 ~= r7_162 then
    if g_mixer:getMasterMute() == true then
      g_mixer:setMasterMute(false)
    end
    g_mixer:setMasterVolume(r8_162)
    initConfigP3(r3_162, false)
  end
  r8_162 = g_cfgP3Info.bgmBar:onLButtonDown(g_cfgP3Info.selCursor, r4_162, r5_162, g_volume[getSoundIndex("bgm")].vol / 10)
  if r8_162 ~= g_volume[getSoundIndex("bgm")].vol / 10 then
    g_volume[getSoundIndex("bgm")].vol = r8_162 * 10
    cfunc.LegacyGame__lua_NeedVolumeUpdate("bgm")
    initConfigP3(r3_162, false)
  end
  r8_162 = g_cfgP3Info.seBar:onLButtonDown(g_cfgP3Info.selCursor, r4_162, r5_162, g_volume[getSoundIndex("se")].vol / 10)
  if r8_162 ~= g_volume[getSoundIndex("se")].vol / 10 then
    g_volume[getSoundIndex("se")].vol = r8_162 * 10
    cfunc.LegacyGame__lua_NeedVolumeUpdate("se")
    initConfigP3(r3_162, false)
  end
  r8_162 = g_cfgP3Info.movieBar:onLButtonDown(g_cfgP3Info.selCursor, r4_162, r5_162, g_volume[getSoundIndex("movie")].vol / 10)
  if r8_162 ~= g_volume[getSoundIndex("movie")].vol / 10 then
    g_volume[getSoundIndex("movie")].vol = r8_162 * 10
    cfunc.LegacyGame__lua_NeedVolumeUpdate("movie")
    initConfigP3(r3_162, false)
  end
  r8_162 = g_cfgP3Info.voiceBar:onLButtonDown(g_cfgP3Info.selCursor, r4_162, r5_162, g_volume[getSoundIndex("char")].vol / 10)
  if r8_162 ~= g_volume[getSoundIndex("char")].vol / 10 or r8_162 == 100 and g_cfgP3Info.selCursor == g_cfgP3Info.voiceBar:getInput() then
    g_volume[getSoundIndex("char")].vol = r8_162 * 10
    for r12_162 = getSoundIndex("char") + 1, #g_volume, 1 do
      g_volume[r12_162].vol = r8_162 * 10
    end
    cfunc.LegacyGame__lua_NeedVolumeUpdate("char")
    initConfigP3(r3_162, false)
  end
  r8_162 = g_cfgP3Info.cutBar:onLButtonDown(g_cfgP3Info.selCursor, r4_162, r5_162, g_bgmCutPer)
  if r8_162 ~= g_bgmCutPer then
    g_bgmCutPer = r8_162
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
    initConfigP3(r3_162, false)
  end
  r8_162 = g_cfgP3Info.charBar:onLButtonDown(g_cfgP3Info.selCursor, r4_162, r5_162, g_volume[getPersonalIndex()].vol / 10)
  if r8_162 ~= g_volume[getPersonalIndex()].vol / 10 then
    g_volume[getPersonalIndex()].vol = r8_162 * 10
    local r9_162 = nil
    local r10_162 = nil
    local r11_162 = 0
    r9_162, r10_162 = string.find(g_volume[getPersonalIndex()].name, "charOtherM")
    if r9_162 ~= nil then
      r11_162 = 1
    end
    r9_162, r10_162 = string.find(g_volume[getPersonalIndex()].name, "charOtherF")
    if r9_162 ~= nil then
      r11_162 = 2
    end
    if r11_162 == 0 then
      cfunc.LegacyGame__lua_NeedVolumeUpdate(g_volume[getPersonalIndex()].name)
    elseif r11_162 == 1 then
      for r15_162 = 1, #g_charKeysOtherM, 1 do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r15_162])
      end
    else
      for r15_162 = 1, #g_charKeysOtherF, 1 do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r15_162])
      end
    end
    initConfigP3(r3_162, false)
  end
  r2_162:delete()
end
function changeCfgP3Focus(r0_163)
  -- line: [5365, 5466] id: 163
  -- notice: unreachable block#88
  -- notice: unreachable block#56
  -- notice: unreachable block#66
  -- notice: unreachable block#71
  -- notice: unreachable block#76
  -- notice: unreachable block#93
  -- notice: unreachable block#104
  -- notice: unreachable block#61
  -- notice: unreachable block#99
  -- notice: unreachable block#82
  local r1_163 = cclass.lua_Layers:create()
  local r2_163 = "ConfigPage" .. tostring(g_configInfo.page)
  local r3_163 = -1
  for r7_163, r8_163 in pairs(g_cfgP3Normal) do
    if r0_163 == r8_163 then
      if isCfgP3Current(r7_163) == false then
        r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3Normal[r7_163], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3Select[r7_163], LUA_PARAM_COLOR, 1, 1, 1, 1)
        local r9_163 = cclass.lua_Sounds:new()
        r9_163:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
        r9_163:delete()
      end
      r3_163 = r7_163
    elseif g_cfgP3Info.selCursor == r8_163 and isCfgP3Current(r7_163) == false then
      r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3Normal[r7_163], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3Select[r7_163], LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
  g_cfgP3Info.masterBar:changeFocus(g_cfgP3Info.selCursor, r0_163)
  g_cfgP3Info.bgmBar:changeFocus(g_cfgP3Info.selCursor, r0_163)
  g_cfgP3Info.seBar:changeFocus(g_cfgP3Info.selCursor, r0_163)
  g_cfgP3Info.movieBar:changeFocus(g_cfgP3Info.selCursor, r0_163)
  g_cfgP3Info.voiceBar:changeFocus(g_cfgP3Info.selCursor, r0_163)
  g_cfgP3Info.cutBar:changeFocus(g_cfgP3Info.selCursor, r0_163)
  g_cfgP3Info.charBar:changeFocus(g_cfgP3Info.selCursor, r0_163)
  for r7_163 = 1, #g_cfgP3Detail, 1 do
    local r8_163 = g_cfgP3DetailIndex[r3_163]
    if r7_163 == r8_163 then
      r8_163 = 1 or 0
    else
      goto label_157	-- block#12 is visited secondly
    end
    if r0_163 == g_cfgP3Info.masterBar:getInput() and r7_163 == 1 then
      r8_163 = 1
    end
    if r0_163 == g_cfgP3Info.bgmBar:getInput() and r7_163 == 2 then
      r8_163 = 1
    end
    if r0_163 == g_cfgP3Info.seBar:getInput() and r7_163 == 3 then
      r8_163 = 1
    end
    if r0_163 == g_cfgP3Info.movieBar:getInput() and r7_163 == 4 then
      r8_163 = 1
    end
    if r0_163 == g_cfgP3Info.voiceBar:getInput() and r7_163 == 5 then
      r8_163 = 1
    end
    if r0_163 == g_cfgP3Info.cutBar:getInput() and r7_163 == 8 then
      r8_163 = 1
    end
    if r0_163 == g_cfgP3Info.charBar:getInput() and r7_163 == 9 then
      r8_163 = 1
    end
    r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3Detail[r7_163], LUA_PARAM_COLOR, 1, 1, 1, r8_163)
    if r8_163 ~= 0 then
      if g_cfgP3Normal[r3_163] == r0_163 or r0_163 == g_cfgP3Info.masterBar:getInput() and r7_163 == 1 or r0_163 == g_cfgP3Info.bgmBar:getInput() and r7_163 == 2 or r0_163 == g_cfgP3Info.seBar:getInput() and r7_163 == 3 or r0_163 == g_cfgP3Info.movieBar:getInput() and r7_163 == 4 or r0_163 == g_cfgP3Info.voiceBar:getInput() and r7_163 == 5 or r0_163 == g_cfgP3Info.cutBar:getInput() and r7_163 == 8 or r0_163 == g_cfgP3Info.charBar:getInput() and r7_163 == 9 then
        local r10_163 = 0
        local r11_163 = 0
        local r12_163 = 0
        r9_163, r10_163, r11_163, r12_163 = r1_163:getSubLayerParam("configBase", r2_163, g_cfgP3Detail[r7_163], LUA_PARAM_POS, 0, r10_163, r11_163, r12_163)
        r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3Detail[r7_163], LUA_PARAM_POS, g_cfgP3DetailX[r7_163] - APP_INTERNAL_WIDTH, r10_163, r11_163, r12_163)
        r1_163:setSubLayerEffect("configBase", r2_163, "textScroll", g_cfgP3Detail[r7_163], LUA_EFFECT_POS, APP_INTERNAL_WIDTH + 10, 0, 0, 0, EFFECT_EASEIN, 150, 0, 0)
        r1_163:setSubLayerEffect("configBase", r2_163, "textScroll", g_cfgP3Detail[r7_163], LUA_EFFECT_POS, -15, 0, 0, 0, 0, 30, 0, 0)
        r1_163:setSubLayerEffect("configBase", r2_163, "textScroll", g_cfgP3Detail[r7_163], LUA_EFFECT_POS, 5, 0, 0, 0, 0, 15, 0, 0)
        r1_163:startSubLayerEffect("configBase", r2_163, "textScroll", g_cfgP3Detail[r7_163], 0)
      end
    else
      r1_163:cancelSubLayerEffect("configBase", r2_163, g_cfgP3Detail[r7_163], "textScroll")
    end
  end
  local r4_163 = {}
  local r5_163 = g_cfgP3Info.masterBar:getInput()
  if r0_163 == r5_163 then
    r5_163 = true
  else
    r5_163 = false
  end
  r4_163[1] = r5_163
  r5_163 = g_cfgP3Info.bgmBar:getInput()
  if r0_163 == r5_163 then
    r5_163 = true
  else
    r5_163 = false
  end
  r4_163[2] = r5_163
  r5_163 = g_cfgP3Info.seBar:getInput()
  if r0_163 == r5_163 then
    r5_163 = true
  else
    r5_163 = false
  end
  r4_163[3] = r5_163
  r5_163 = g_cfgP3Info.movieBar:getInput()
  if r0_163 == r5_163 then
    r5_163 = true
  else
    r5_163 = false
  end
  r4_163[4] = r5_163
  r5_163 = g_cfgP3Info.voiceBar:getInput()
  if r0_163 == r5_163 then
    r5_163 = true
  else
    r5_163 = false
  end
  r4_163[5] = r5_163
  r5_163 = g_cfgP3Normal[1]
  if r0_163 ~= r5_163 then
    r5_163 = g_cfgP3Normal[2]
    if r0_163 == r5_163 then
      goto label_466
    else
      r5_163 = false
    end
  else
    ::label_466::
    ::label_466::
    r5_163 = true
  end
  r4_163[6] = r5_163
  r5_163 = g_cfgP3Normal[3]
  if r0_163 ~= r5_163 then
    r5_163 = g_cfgP3Normal[4]
    if r0_163 == r5_163 then
      goto label_480
    else
      r5_163 = false
    end
  else
    ::label_480::
    ::label_480::
    r5_163 = true
  end
  r4_163[7] = r5_163
  r5_163 = g_cfgP3Info.cutBar:getInput()
  if r0_163 == r5_163 then
    r5_163 = true
  else
    r5_163 = false
  end
  r4_163[8] = r5_163
  r5_163 = g_cfgP3Normal[7]
  if r5_163 <= r0_163 then
    r5_163 = g_cfgP3Normal[23]
    if r0_163 <= r5_163 then
      r5_163 = true
    end
  else
    r5_163 = false
  end
  r4_163[9] = r5_163
  r5_163 = g_cfgP3Info.charBar:getInput()
  if r0_163 == r5_163 then
    r5_163 = true
  else
    r5_163 = false
  end
  r4_163[10] = r5_163
  for r8_163 = 1, #g_cfgP3ItemSelect, 1 do
    if r4_163[r8_163] == true then
      r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3ItemSelect[r8_163], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3ItemNormal[r8_163], LUA_PARAM_COLOR, 1, 1, 1, 0)
    else
      r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3ItemSelect[r8_163], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_163:setSubLayerParam("configBase", r2_163, g_cfgP3ItemNormal[r8_163], LUA_PARAM_COLOR, 1, 1, 1, 1)
    end
  end
end
g_cfgP7Normal = {
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14
}
g_cfgP7Select = {
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28
}
g_cfgP7Current = {
  29,
  30,
  31,
  32,
  33,
  34,
  35,
  36,
  37,
  38,
  39,
  40,
  41,
  42
}
g_cfgP7IconHit = {
  46,
  45,
  44,
  43
}
g_cfgP7Button = {
  g_cfgP7Normal,
  g_cfgP7Select,
  g_cfgP7Current,
  g_cfgP7IconHit
}
g_cfgP7Info = {
  selCursor = -1,
  drug = false,
  drugItem = -1,
  swapItem = -1,
}
function isCfgP7Current(r0_164)
  -- line: [5477, 5484] id: 164
  for r4_164 = 1, #g_gestureFunc, 1 do
    if g_gestureFunc[r4_164] == r0_164 - 1 then
      return true
    end
  end
  return false
end
function onDrugCfgP7(r0_165, r1_165)
  -- line: [5486, 5493] id: 165
  if g_cfgP7Info.drug == true then
    local r2_165 = cclass.lua_Layers:create()
    r2_165:setVisible("configBase", "drugIcon", 1)
    r2_165:setParam("configBase", "drugIcon", LUA_PARAM_POS, r0_165, r1_165, 0, 0)
    r2_165:setParam("configBase", "drugIcon", LUA_PARAM_COLOR, 1, 1, 1, 0.5)
  end
end
function initConfigP7(r0_166, r1_166)
  -- line: [5496, 5539] id: 166
  local r2_166 = cclass.lua_Layers:create()
  if r1_166 == true then
    r2_166:initSubLayer("configBase", r0_166, 47, 1)
    for r6_166, r7_166 in pairs(g_cfgP7Button) do
      for r11_166, r12_166 in pairs(r7_166) do
        r2_166:initSubLayer("configBase", r0_166, r12_166, 1)
      end
    end
  end
  for r6_166 = 1, #g_gestureFunc, 1 do
    local r7_166 = "gestureIcon" .. tostring(r6_166)
    r2_166:insertPNARefLayer("configBase", r7_166 .. "N", r0_166, g_cfgP7Normal[g_gestureFunc[r6_166] + 1], 1)
    r2_166:insertPNARefLayer("configBase", r7_166 .. "S", r0_166, g_cfgP7Select[g_gestureFunc[r6_166] + 1], 0)
    r2_166:setSubLayerParam("configBase", r0_166, g_cfgP7IconHit[r6_166], LUA_PARAM_COLOR, 1, 1, 1, 0)
    r2_166:setSubLayerHitTest("configBase", r0_166, g_cfgP7IconHit[r6_166], 1, 0)
  end
  r2_166:setParam("configBase", "gestureIcon1N", LUA_PARAM_POS, 307, 160, 0, 0)
  r2_166:setParam("configBase", "gestureIcon1S", LUA_PARAM_POS, 307, 160, 0, 0)
  r2_166:setParam("configBase", "gestureIcon2N", LUA_PARAM_POS, 481, 335, 0, 0)
  r2_166:setParam("configBase", "gestureIcon2S", LUA_PARAM_POS, 481, 335, 0, 0)
  r2_166:setParam("configBase", "gestureIcon3N", LUA_PARAM_POS, 307, 510, 0, 0)
  r2_166:setParam("configBase", "gestureIcon3S", LUA_PARAM_POS, 307, 510, 0, 0)
  r2_166:setParam("configBase", "gestureIcon4N", LUA_PARAM_POS, 130, 335, 0, 0)
  r2_166:setParam("configBase", "gestureIcon4S", LUA_PARAM_POS, 130, 335, 0, 0)
  for r6_166 = 1, #g_cfgP7Normal, 1 do
    if isCfgP7Current(r6_166) == false then
      r2_166:setSubLayerParam("configBase", r0_166, g_cfgP7Normal[r6_166], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_166:setSubLayerParam("configBase", r0_166, g_cfgP7Select[r6_166], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_166:setSubLayerParam("configBase", r0_166, g_cfgP7Current[r6_166], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_166:setSubLayerHitTest("configBase", r0_166, g_cfgP7Normal[r6_166], 1, 0)
    else
      r2_166:setSubLayerParam("configBase", r0_166, g_cfgP7Normal[r6_166], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_166:setSubLayerParam("configBase", r0_166, g_cfgP7Select[r6_166], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_166:setSubLayerParam("configBase", r0_166, g_cfgP7Current[r6_166], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_166:setSubLayerHitTest("configBase", r0_166, g_cfgP7Normal[r6_166], 0, 0)
    end
  end
  g_cfgP7Info.selCursor = -1
  g_cfgP7Info.drug = false
end
function effectCfg7Icon(r0_167, r1_167, r2_167, r3_167)
  -- line: [5542, 5560] id: 167
  local r4_167 = cclass.lua_Layers:create()
  local r5_167 = getEffectRate()
  if r0_167 ~= true then
    for r9_167 = 1, #g_gestureFunc, 1 do
      local r10_167 = "gestureIcon" .. tostring(r9_167)
      if r2_167 == false then
        local r11_167 = 0
        local r12_167 = 0
        local r13_167 = 0
        local r14_167 = 0
        r11_167, r12_167, r13_167, r14_167 = r4_167:getParam("configBase", r10_167 .. "N", LUA_PARAM_POS, r11_167, r12_167, r13_167, r14_167)
        r4_167:setParam("configBase", r10_167 .. "N", LUA_PARAM_POS, r11_167 - r1_167, r12_167, r13_167, r14_167)
      end
      r4_167:setEffect("configBase", r10_167 .. "N", "ConfigPage", LUA_EFFECT_POS, r1_167, 0, 0, 0, 0, 300 * r5_167, 0, r3_167)
      r4_167:startEffect("configBase", r10_167 .. "N", "ConfigPage", 0)
    end
  end
end
function changeCfgP7Focus(r0_168)
  -- line: [5563, 5606] id: 168
  local r1_168 = cclass.lua_Layers:create()
  local r2_168 = "ConfigPage" .. tostring(g_configInfo.page)
  if g_cfgP7Info.drug == true then
    for r6_168, r7_168 in pairs(g_cfgP7Normal) do
      if r7_168 == r0_168 then
        r0_168 = -1
        break
      end
    end
  end
  for r6_168, r7_168 in pairs(g_cfgP7Normal) do
    if r0_168 == r7_168 then
      r1_168:setSubLayerParam("configBase", r2_168, g_cfgP7Normal[r6_168], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_168:setSubLayerParam("configBase", r2_168, g_cfgP7Select[r6_168], LUA_PARAM_COLOR, 1, 1, 1, 1)
      local r8_168 = cclass.lua_Sounds:new()
      r8_168:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
      r8_168:delete()
    elseif g_cfgP7Info.selCursor == r7_168 then
      r1_168:setSubLayerParam("configBase", r2_168, g_cfgP7Normal[r6_168], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_168:setSubLayerParam("configBase", r2_168, g_cfgP7Select[r6_168], LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
  for r6_168, r7_168 in pairs(g_cfgP7IconHit) do
    if r0_168 == r7_168 then
      local r8_168 = "gestureIcon" .. tostring(r6_168)
      r1_168:setVisible("configBase", r8_168 .. "N", 0)
      r1_168:setVisible("configBase", r8_168 .. "S", 1)
      local r9_168 = cclass.lua_Sounds:new()
      r9_168:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
      r9_168:delete()
    elseif g_cfgP7Info.selCursor == r7_168 then
      local r8_168 = "gestureIcon" .. tostring(r6_168)
      r1_168:setVisible("configBase", r8_168 .. "N", 1)
      r1_168:setVisible("configBase", r8_168 .. "S", 0)
    end
  end
end
function onLButtonDownCfgP7(r0_169)
  -- line: [5608, 5637] id: 169
  if r0_169 == true or g_cfgP7Info.drug == true then
    return 
  end
  if g_cfgP7Info.selCursor > 0 then
    local r1_169 = cclass.lua_Layers:create()
    local r2_169 = "ConfigPage" .. tostring(g_configInfo.page)
    if g_cfgP7Info.selCursor <= g_cfgP7Normal[14] then
      r1_169:insertPNARefLayer("configBase", "drugIcon", r2_169, g_cfgP7Info.selCursor, 0)
      g_cfgP7Info.swapItem = -1
    else
      for r6_169, r7_169 in pairs(g_cfgP7IconHit) do
        if r7_169 == g_cfgP7Info.selCursor then
          local r8_169 = 0
          for r12_169, r13_169 in pairs(g_cfgP7Normal) do
            if r13_169 == g_gestureFunc[r6_169] then
              r8_169 = r12_169
              break
            end
          end
          r1_169:insertPNARefLayer("configBase", "drugIcon", r2_169, r8_169 + 1, 0)
          g_cfgP7Info.swapItem = r6_169
          break
        end
      end
    end
    g_cfgP7Info.drug = true
    g_cfgP7Info.drugItem = g_cfgP7Info.selCursor
  end
end
function onLButtonUpCfgP7(r0_170, r1_170, r2_170)
  -- line: [5639, 5673] id: 170
  if r2_170 == true then
    return 
  end
  if g_cfgP7Info.drug == true then
    for r6_170, r7_170 in pairs(g_cfgP7IconHit) do
      if r7_170 == g_cfgP7Info.selCursor then
        local r8_170 = cclass.lua_Sounds:new()
        r8_170:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
        r8_170:delete()
        if g_cfgP7Info.swapItem == -1 then
          local r9_170 = 0
          for r13_170, r14_170 in pairs(g_cfgP7Normal) do
            if r14_170 == g_cfgP7Info.drugItem then
              r9_170 = r13_170
              break
            end
          end
          g_gestureFunc[r6_170] = r9_170 - 1
        else
          g_gestureFunc[r6_170] = g_gestureFunc[g_cfgP7Info.swapItem]
          g_gestureFunc[g_cfgP7Info.swapItem] = g_gestureFunc[r6_170]
        end
        initConfigP7("ConfigPage" .. tostring(g_configInfo.page), false)
        break
      end
    end
    cclass.lua_Layers:create():removeLayer("configBase", "drugIcon")
    g_cfgP7Info.drug = false
  end
end
g_dataPageNormal = {
  36,
  35,
  34,
  33,
  32,
  31,
  30,
  29,
  28,
  27,
  26
}
g_dataPageSelect = {
  25,
  24,
  23,
  22,
  21,
  20,
  19,
  18,
  17,
  16,
  15
}
g_dataPageCurrent = {
  14,
  13,
  12,
  11,
  10,
  9,
  8,
  7,
  6,
  5,
  4
}
g_dataBaseDisable = {
  68,
  67,
  66,
  65,
  64,
  63,
  62,
  61,
  60,
  59
}
g_dataBaseNormal = {
  58,
  57,
  56,
  55,
  54,
  53,
  52,
  51,
  50,
  49
}
g_dataBaseSelect = {
  48,
  47,
  46,
  45,
  44,
  43,
  42,
  41,
  40,
  39
}
g_dataNormal = {
  g_dataPageNormal,
  g_dataBaseNormal
}
g_dataSelect = {
  g_dataPageSelect,
  g_dataBaseSelect
}
g_dataAll = {
  g_dataPageNormal,
  g_dataPageSelect,
  g_dataPageCurrent,
  g_dataBaseDisable,
  g_dataBaseNormal,
  g_dataBaseSelect
}
g_dataInfo = {
  init = false,
  page = 1,
  selCursor = -1,
}
g_quickOrder = {}
g_autoOrder = {}
function initDataOrder()
  -- line: [5692, 5737] id: 171
  local r0_171 = 0
  local r1_171 = 0
  for r5_171 = 1, 5, 1 do
    g_autoOrder[r5_171] = -1
  end
  r0_171, r1_171 = cfunc.CSaveDataManager__lua_FindNewData(2, r0_171, r1_171)
  if r0_171 == 2 then
    for r5_171 = 1, 5, 1 do
      g_autoOrder[r5_171] = r1_171
      if r1_171 > 0 then
        r1_171 = r1_171 - 1
      end
      if r1_171 < 1 then
        r1_171 = 5
        if r1_171 then
          r1_171 = r1_171
        end
      end
      if 0 < r1_171 and cfunc.CSaveDataManager__lua_IsData(2, r1_171) == false then
        r1_171 = -1
      end
    end
  end
  r0_171, r1_171 = cfunc.CSaveDataManager__lua_FindNewData(2, r0_171, r1_171)
  for r5_171 = 1, 5, 1 do
    g_quickOrder[r5_171] = -1
  end
  r0_171, r1_171 = cfunc.CSaveDataManager__lua_FindNewData(1, r0_171, r1_171)
  if r0_171 == 1 then
    for r5_171 = 1, 5, 1 do
      g_quickOrder[r5_171] = r1_171
      if r1_171 > 0 then
        r1_171 = r1_171 - 1
      end
      if r1_171 < 1 then
        r1_171 = 5
        if r1_171 then
          r1_171 = r1_171
        end
      end
      if 0 < r1_171 and cfunc.CSaveDataManager__lua_IsData(1, r1_171) == false then
        r1_171 = -1
      end
    end
  end
end
function deleteThumbnail(r0_172, r1_172)
  -- line: [5740, 5750] id: 172
  local r2_172 = cclass.lua_Layers:create()
  for r6_172 = 1, 10, 1 do
    local r7_172 = nil	-- notice: implicit variable refs by block#[4]
    if r0_172 == true then
      r7_172 = "Save"
      if not r7_172 then
        ::label_13::
        r7_172 = "Load"
      end
    else
      goto label_13	-- block#3 is visited secondly
    end
    r7_172 = r7_172 .. "Thumbnail" .. tostring(r6_172)
    r2_172:removeLayer("configBase", r7_172)
    local r8_172 = nil	-- notice: implicit variable refs by block#[7]
    if r0_172 == true then
      r8_172 = "Save"
      if not r8_172 then
        ::label_29::
        r8_172 = "Load"
      end
    else
      goto label_29	-- block#6 is visited secondly
    end
    r8_172 = r8_172 .. "Text" .. tostring(r6_172)
    r2_172:removeLayer("configBase", r8_172)
  end
end
function effectThumbnail(r0_173, r1_173, r2_173, r3_173, r4_173, r5_173)
  -- line: [5753, 5778] id: 173
  local r6_173 = cclass.lua_Layers:create()
  local r7_173 = getEffectRate()
  for r11_173 = 1, 10, 1 do
    local r12_173 = nil	-- notice: implicit variable refs by block#[4]
    if r0_173 == true then
      r12_173 = "Save"
      if not r12_173 then
        ::label_15::
        r12_173 = "Load"
      end
    else
      goto label_15	-- block#3 is visited secondly
    end
    local r13_173 = r12_173
    r12_173 = r13_173 .. "Thumbnail" .. tostring(r11_173)
    if r0_173 == true then
      r13_173 = "Save" or "Load"
    else
      goto label_27	-- block#6 is visited secondly
    end
    r13_173 = r13_173 .. "Text" .. tostring(r11_173)
    if r1_173 ~= true then
      if r4_173 == false then
        local r14_173 = 0
        local r15_173 = 0
        local r16_173 = 0
        local r17_173 = 0
        r14_173, r15_173, r16_173, r17_173 = r6_173:getParam("configBase", r12_173, LUA_PARAM_POS, r14_173, r15_173, r16_173, r17_173)
        r6_173:setParam("configBase", r12_173, LUA_PARAM_POS, r14_173 - r3_173, r15_173, r16_173, r17_173)
        r14_173, r15_173, r16_173, r17_173 = r6_173:getParam("configBase", r13_173, LUA_PARAM_POS, r14_173, r15_173, r16_173, r17_173)
        r6_173:setParam("configBase", r13_173, LUA_PARAM_POS, r14_173 - r3_173, r15_173, r16_173, r17_173)
      end
      r6_173:setEffect("configBase", r12_173, "ConfigPage", LUA_EFFECT_POS, r3_173, 0, 0, 0, 0, 300 * r7_173, 0, r5_173)
      r6_173:startEffect("configBase", r12_173, "ConfigPage", 0)
      r6_173:setEffect("configBase", r13_173, "ConfigPage", LUA_EFFECT_POS, r3_173, 0, 0, 0, 0, 300 * r7_173, 0, r5_173)
      r6_173:startEffect("configBase", r13_173, "ConfigPage", 0)
    end
  end
end
function initThumbnail(r0_174, r1_174, r2_174)
  -- line: [5781, 5846] id: 174
  local r3_174 = cclass.lua_Layers:create()
  local r4_174 = nil
  local r5_174 = nil
  local r6_174 = g_dataInfo.page
  if r6_174 == 11 then
    if r1_174 < 6 then
      r6_174 = g_autoOrder[r1_174]
      if r6_174 > 0 then
        r6_174 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_AUTO, g_autoOrder[r1_174])
        r5_174 = r6_174
      end
    else
      r6_174 = g_quickOrder[r1_174 - 5]
      if r6_174 > 0 then
        r6_174 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_QUICK, g_quickOrder[r1_174 - 5])
        r5_174 = r6_174
      end
    end
  else
    r6_174 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r1_174)
    r5_174 = r6_174
  end
  if r0_174 == true then
    r6_174 = "Save" or "Load"
  else
    goto label_53	-- block#9 is visited secondly
  end
  r6_174 = r6_174 .. "Thumbnail" .. tostring(r1_174)
  local r7_174 = r3_174:insertThumbnailLayer("configBase", r6_174, r5_174, 1)
  local r8_174 = nil	-- notice: implicit variable refs by block#[13, 15]
  if r1_174 < 6 then
    r8_174 = 388
    if not r8_174 then
      ::label_71::
      r8_174 = 762
    end
  else
    goto label_71	-- block#12 is visited secondly
  end
  local r9_174 = 159 + 90 * (r1_174 - 1) % 5
  r3_174:setParam("configBase", r6_174, LUA_PARAM_POS, r8_174, r9_174, 0, 0)
  local r10_174 = nil	-- notice: implicit variable refs by block#[18]
  if r2_174 == true then
    r10_174 = getEffectRate()
    r3_174:setEffect("configBase", r6_174, "Update", LUA_EFFECT_SCALE, 0.08, 0.08, 0, 0, 0, 150 * r10_174, 0, 0)
    r3_174:setEffect("configBase", r6_174, "Update", LUA_EFFECT_SCALE, -0.08, -0.08, 0, 0, 0, 100 * r10_174, 0, 0)
    r3_174:startEffect("configBase", r6_174, "Update", 2)
  end
  r8_174 = r8_174 + 118
  r9_174 = r9_174 - 4
  if r0_174 == true then
    r10_174 = "Save"
    if not r10_174 then
      ::label_130::
      r10_174 = "Load"
    end
  else
    goto label_130	-- block#17 is visited secondly
  end
  r10_174 = r10_174 .. "Text" .. tostring(r1_174)
  r3_174:insertTextLayer("configBase", r10_174, 226, 77, 2, 2, 14, 2, 0.25, 1)
  r3_174:setParam("configBase", r10_174, LUA_PARAM_POS, r8_174, r9_174, 0, 0)
  local r11_174 = nil
  local r12_174 = false
  if g_dataInfo.page == 11 then
    if r1_174 < 6 then
      r11_174 = "\x81\xa1Auto" .. tostring(r1_174) .. " " .. cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_AUTO, g_autoOrder[r1_174]) .. "\n" .. cfunc.CSaveDataManager__lua_GetSaveDataChapter(DATA_MODE_AUTO, g_autoOrder[r1_174], getGameEngineVersion())
    else
      r11_174 = "\x81\xa1Quick" .. tostring(r1_174 - 5) .. cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_QUICK, g_quickOrder[r1_174 - 5]) .. "\n" .. cfunc.CSaveDataManager__lua_GetSaveDataChapter(DATA_MODE_QUICK, g_quickOrder[r1_174 - 5], getGameEngineVersion())
    end
    if r0_174 == true then
      r12_174 = true
    end
  else
    r11_174 = "\x81\xa1" .. string.format("%02d", (g_dataInfo.page - 1) * 10 + r1_174) .. "  " .. cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r1_174) .. "\n" .. cfunc.CSaveDataManager__lua_GetSaveDataChapter(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r1_174, getGameEngineVersion())
  end
  if r7_174 == true and r12_174 == false then
    r3_174:setText("configBase", r10_174, r11_174, "MS UI Gothic", 10, 0, 0, 5153535, 4294967295)
  else
    r3_174:setText("configBase", r10_174, r11_174, "MS UI Gothic", 10, 0, 0, 2947526607, 4294967247)
  end
end
function updateNewIconC(r0_175)
  -- line: [5849, 5860] id: 175
  updateNewIcon("ConfigPage" .. tostring(g_configInfo.page), g_dataInfo.page)
  if r0_175 == DATA_MODE_QUICK then
    playSystemVoice(0)
    playSystemVoice(SYSVOICE_QSAVE)
  elseif getSystemSet() ~= "system" then
    initConfigUpperButton(g_configInfo.page, false, 0, true)
  end
end
function updateNewIcon(r0_176, r1_176)
  -- line: [5863, 5893] id: 176
  local r2_176 = cclass.lua_Layers:create()
  r2_176:setSubLayerVisible("configBase", r0_176, 2, 0)
  local r3_176 = 0
  local r4_176 = 0
  r3_176, r4_176 = cfunc.CSaveDataManager__lua_FindNewData(0, r3_176, r4_176)
  if r3_176 >= 0 and r3_176 == 0 and math.floor((r4_176 - 1) / 10 + 1) == r1_176 then
    r2_176:setSubLayerVisible("configBase", r0_176, 2, 1)
    local r6_176 = nil
    local r7_176 = nil
    if (r4_176 - 1) % 10 < 5 then
      r6_176 = 675 or 1049
    else
      goto label_70	-- block#8 is visited secondly
    end
    r2_176:setSubLayerParam("configBase", r0_176, 2, LUA_PARAM_POS, r6_176, 158 + 90 * (r4_176 - 1) % 10 % 5, 0, 0)
    return 
  end
  -- warn: not visited block [3]
  -- block#3:
  -- r2_176:setSubLayerVisible("configBase", r0_176, 2, 1)
  -- r2_176:setSubLayerParam("configBase", r0_176, 2, LUA_PARAM_POS, 1049, 158, 0, 0)
  -- return 
  -- goto label_87
end
function initDataPage(r0_177, r1_177, r2_177, r3_177)
  -- line: [5896, 5953] id: 177
  local r4_177 = cclass.lua_Layers:create()
  if r2_177 == true then
    r4_177:initSubLayer("configBase", r0_177, 70, 1)
    for r8_177, r9_177 in pairs(g_dataAll) do
      for r13_177, r14_177 in pairs(r9_177) do
        r4_177:initSubLayer("configBase", r0_177, r14_177, 1)
        r4_177:setSubLayerParam("configBase", r0_177, r14_177, LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
    end
    r4_177:initSubLayer("configBase", r0_177, 2, 1)
  else
    deleteThumbnail(r1_177, g_dataInfo.page)
  end
  for r8_177 = 1, #g_dataPageNormal, 1 do
    if r8_177 == r3_177 then
      r4_177:setSubLayerParam("configBase", r0_177, g_dataPageNormal[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_177:setSubLayerParam("configBase", r0_177, g_dataPageSelect[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_177:setSubLayerParam("configBase", r0_177, g_dataPageCurrent[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_177:setSubLayerHitTest("configBase", r0_177, g_dataPageNormal[r8_177], 0, 0)
    else
      r4_177:setSubLayerParam("configBase", r0_177, g_dataPageNormal[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_177:setSubLayerParam("configBase", r0_177, g_dataPageSelect[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_177:setSubLayerParam("configBase", r0_177, g_dataPageCurrent[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_177:setSubLayerHitTest("configBase", r0_177, g_dataPageNormal[r8_177], 1, 0)
    end
  end
  for r8_177 = 1, #g_dataBaseNormal, 1 do
    if r3_177 == 11 and r1_177 == true then
      r4_177:setSubLayerParam("configBase", r0_177, g_dataBaseNormal[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_177:setSubLayerParam("configBase", r0_177, g_dataBaseSelect[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_177:setSubLayerParam("configBase", r0_177, g_dataBaseDisable[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_177:setSubLayerHitTest("configBase", r0_177, g_dataBaseNormal[r8_177], 0, 0)
    else
      r4_177:setSubLayerParam("configBase", r0_177, g_dataBaseNormal[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_177:setSubLayerParam("configBase", r0_177, g_dataBaseSelect[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_177:setSubLayerParam("configBase", r0_177, g_dataBaseDisable[r8_177], LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_177:setSubLayerHitTest("configBase", r0_177, g_dataBaseNormal[r8_177], 1, 0)
    end
  end
  for r8_177 = 1, 10, 1 do
    initThumbnail(r1_177, r8_177, false)
  end
  updateNewIcon(r0_177, r3_177)
  g_dataInfo.page = r3_177
  if r2_177 == true then
    g_dataInfo.selCursor = -1
  end
end
function onMouseMoveData(r0_178, r1_178)
  -- line: [5956, 5961] id: 178
  if g_dataInfo.selCursor ~= r0_178 then
    changeDataFocus(r0_178)
    g_dataInfo.selCursor = r0_178
  end
end
function onLButtonDownData(r0_179, r1_179)
  -- line: [5964, 6026] id: 179
  if r0_179 == true then
    return 
  end
  local r2_179 = cclass.lua_Sounds:new()
  if 26 <= g_dataInfo.selCursor and g_dataInfo.selCursor <= 36 then
    r2_179:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
    g_dataInfo.page = 36 - g_dataInfo.selCursor + 1
    initDataPage("ConfigPage" .. tostring(g_configInfo.page), r1_179, false, g_dataInfo.page)
  end
  if 49 <= g_dataInfo.selCursor and g_dataInfo.selCursor <= 58 then
    if r1_179 == true then
      r2_179:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
      local r3_179 = (g_dataInfo.page - 1) * 10 + 58 - g_dataInfo.selCursor + 1
      if cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, r3_179) == false then
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SAVEGAME, r3_179)
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
          cclass.lua_Layers:create():setSubLayerHitTest("configBase", "ConfigBase01", g_configBaseUpperNormal[5], 1, 0)
        end
      else
        openConfirm(LUA_CONFIRM_OVERWRITE)
      end
    elseif g_dataInfo.page == 11 then
      local r3_179 = 58 - g_dataInfo.selCursor + 1
      if r3_179 < 6 and g_autoOrder[r3_179] > 0 then
        r2_179:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
        openConfirm(LUA_CONFIRM_LOAD)
      elseif g_quickOrder[r3_179 - 5] > 0 then
        r2_179:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
        openConfirm(LUA_CONFIRM_LOAD)
      end
    elseif cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + 58 - g_dataInfo.selCursor + 1) == true then
      r2_179:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
      openConfirm(LUA_CONFIRM_LOAD)
    end
  end
  r2_179:delete()
end
function changeDataFocus(r0_180)
  -- line: [6029, 6049] id: 180
  local r1_180 = cclass.lua_Layers:create()
  local r2_180 = "ConfigPage" .. tostring(g_configInfo.page)
  for r6_180, r7_180 in pairs(g_dataNormal) do
    for r11_180, r12_180 in pairs(r7_180) do
      if r0_180 == r12_180 then
        r1_180:setSubLayerParam("configBase", r2_180, g_dataSelect[r6_180][r11_180], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r1_180:setSubLayerParam("configBase", r2_180, g_dataNormal[r6_180][r11_180], LUA_PARAM_COLOR, 1, 1, 1, 0)
        local r13_180 = cclass.lua_Sounds:new()
        r13_180:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
        r13_180:delete()
      elseif g_dataInfo.selCursor == r12_180 then
        r1_180:setSubLayerParam("configBase", r2_180, g_dataSelect[r6_180][r11_180], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_180:setSubLayerParam("configBase", r2_180, g_dataNormal[r6_180][r11_180], LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
  end
end
g_TitleMenu = nil
function isLuaMenuEffect()
  -- line: [6055, 6083] id: 181
  local r0_181 = false
  if g_TitleMenu ~= nil then
    r0_181 = g_TitleMenu:MenuEffect()
  end
  if g_GalleryMenu ~= nil then
    local r1_181 = g_GalleryMenu:MenuEffect()
    if not r0_181 then
      r0_181 = r1_181
    end
  end
  if g_CgBrowser ~= nil then
    local r1_181 = g_CgBrowser:MenuEffect()
    if not r0_181 then
      r0_181 = r1_181
    end
  end
  if g_AfterMenu ~= nil then
    local r1_181 = g_AfterMenu:MenuEffect()
    if not r0_181 then
      r0_181 = r1_181
    end
  end
  if g_StoryMenu ~= nil then
    local r1_181 = g_StoryMenu:MenuEffect()
    if not r0_181 then
      r0_181 = r1_181
    end
  end
  return r0_181
end
function onMouseMoveTitle(r0_182, r1_182, r2_182, r3_182, r4_182, r5_182)
  -- line: [6091, 6095] id: 182
  if g_TitleMenu ~= nil and r0_182 == g_TitleMenu.MenuInf.SetName then
    g_TitleMenu:MenuMouseMove(r0_182, r1_182, r2_182, r3_182, r4_182, r5_182)
  end
end
function onLButtonDownTitle(r0_183, r1_183, r2_183, r3_183, r4_183, r5_183)
  -- line: [6098, 6102] id: 183
  if g_TitleMenu ~= nil and r0_183 == g_TitleMenu.MenuInf.SetName then
    g_TitleMenu:MenuLButtonDown(r0_183, r1_183, r2_183, r3_183, r4_183, r5_183)
  end
end
function onLButtonUpTitle(r0_184, r1_184, r2_184, r3_184, r4_184, r5_184)
  -- line: [6104, 6108] id: 184
  if g_TitleMenu ~= nil and r0_184 == g_TitleMenu.MenuInf.SetName then
    g_TitleMenu:MenuLButtonUp(r0_184, r1_184, r2_184, r3_184, r4_184, r5_184)
  end
end
g_cgDispInfo = {
  width = 0,
  height = 0,
  minScale = 1,
  drug = false,
  xPos = 0,
  yPos = 0,
}
function cgDisp(r0_185, r1_185)
  -- line: [6117, 6172] id: 185
  local r2_185 = cclass.lua_Sounds:new()
  r2_185:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  r2_185:delete()
  local r3_185 = cclass.lua_Layers:create()
  if r3_185:add("cgDisp") == false then
    return false
  end
  local r5_185 = cclass.lua_MeasureTime:new()
  local r6_185 = getGraphicsArcFileName("cgDisp", r0_185)
  r3_185:insertLayer("cgDisp", "cgDisp00", LUA_LAYER_STD, r6_185, "_IBG_000.png", 1)
  if string.lower(string.sub(r0_185, -4)) ~= ".pna" then
    r3_185:insertLayer("cgDisp", "cgDisp01", LUA_LAYER_STD, r6_185, r0_185, 1)
  end
  local r7_185 = 0
  local r8_185 = 0
  r7_185, r8_185, r9_185, r10_185 = r3_185:getParam("cgDisp", "cgDisp01", LUA_PARAM_SIZE, r7_185, r8_185, 0, 0)
  g_cgDispInfo.width = r7_185
  g_cgDispInfo.height = r8_185
  if r3_185:isMosaic("cgDisp", "cgDisp01") == true then
    r7_185 = 1
    r8_185 = 1
  else
    r7_185 = APP_INTERNAL_WIDTH / r7_185
    r8_185 = APP_INTERNAL_HEIGHT / r8_185
  end
  local r12_185 = g_cgDispInfo
  local r13_185 = nil	-- notice: implicit variable refs by block#[11]
  if r7_185 < r8_185 then
    r13_185 = r7_185
    if r13_185 then
      ::label_102::
      r13_185 = r8_185
    end
  else
    goto label_102	-- block#10 is visited secondly
  end
  r12_185.minScale = r13_185
  r12_185 = 0
  r13_185 = 0
  r13_185 = APP_INTERNAL_HEIGHT / 2 - g_cgDispInfo.height / 2
  r3_185:setParam("cgDisp", "cgDisp01", LUA_PARAM_POS, APP_INTERNAL_WIDTH / 2 - g_cgDispInfo.width / 2, r13_185, 0, 0)
  local r14_185 = getEffectRate()
  r3_185:copySnap("cgDisp", "system")
  r3_185:startTransition("cgDisp", 0, 1, 350 * r14_185, 0, LUA_TRANSITION_NORMAL)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_luaMenuInfo.enabled = true
  g_luaMenuInfo.effect = true
  g_luaMenuInfo.setName = "cgDisp"
  g_luaMenuInfo.selCursor = -1
  r5_185:delete()
  setCGDispCursor()
  return true
end
function closeCGDisp(r0_186)
  -- line: [6174, 6190] id: 186
  local r1_186 = cclass.lua_Sounds:new()
  r1_186:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  r1_186:delete()
  cfunc.LegacyGame__lua_SetVariable(0, r0_186)
  local r2_186 = cclass.lua_Layers:create()
  r2_186:removeSnap("system")
  r2_186:rtSnap("system")
  g_cgDispInfo.drug = false
  local r3_186 = cclass.lua_AutoCursor:new()
  r3_186:SetCursor(0)
  r3_186:delete()
  g_luaMenuInfo.effect = true
  g_luaMenuInfo.enabled = false
end
function onWheelMouseCGDisp(r0_187)
  -- line: [6192, 6256] id: 187
  if g_luaMenuInfo.effect == true or g_luaMenuInfo.enabled == false then
    return 
  end
  local r1_187 = cclass.lua_Layers:create()
  local r2_187 = 0
  local r3_187 = 0
  local r4_187 = 0
  local r5_187 = 0
  r2_187, r3_187, r4_187, r5_187 = r1_187:getParam("cgDisp", "cgDisp01", LUA_PARAM_SCALE, r2_187, r3_187, r4_187, r5_187)
  local r6_187 = r2_187
  local r7_187 = r3_187
  r2_187 = r2_187 + r0_187 * 0.05
  r3_187 = r3_187 + r0_187 * 0.05
  if 4 < r2_187 or 4 < r3_187 then
    r2_187 = 4
    r3_187 = 4
  end
  if r2_187 < g_cgDispInfo.minScale or r3_187 < g_cgDispInfo.minScale then
    r2_187 = g_cgDispInfo.minScale
    r3_187 = g_cgDispInfo.minScale
  end
  r1_187:setParam("cgDisp", "cgDisp01", LUA_PARAM_SCALE, r2_187, r3_187, r4_187, r5_187)
  local r8_187 = 0
  local r9_187 = 0
  local r10_187 = 0
  local r11_187 = 0
  r8_187, r9_187, r10_187, r11_187 = r1_187:getParam("cgDisp", "cgDisp01", LUA_PARAM_POS, r8_187, r9_187, r10_187, r11_187)
  if r6_187 ~= 1 then
    r8_187 = (r8_187 * -1 + (g_cgDispInfo.width * r6_187 - APP_INTERNAL_WIDTH) / 2 - (g_cgDispInfo.width - APP_INTERNAL_WIDTH) / 2) / r6_187
  else
    r8_187 = r8_187 * -1
  end
  if r7_187 ~= 1 then
    r9_187 = (r9_187 * -1 + (g_cgDispInfo.height * r7_187 - APP_INTERNAL_HEIGHT) / 2 - (g_cgDispInfo.height - APP_INTERNAL_HEIGHT) / 2) / r7_187
  else
    r9_187 = r9_187 * -1
  end
  local r12_187 = r8_187 + APP_INTERNAL_WIDTH / r6_187 / 2
  local r13_187 = r9_187 + APP_INTERNAL_HEIGHT / r7_187 / 2
  if r2_187 ~= 1 then
    r12_187 = r12_187 - g_cgDispInfo.width / 2
    r8_187 = (g_cgDispInfo.width - APP_INTERNAL_WIDTH) / 2 * -1 - r12_187 * r2_187
  else
    r8_187 = (r12_187 - APP_INTERNAL_WIDTH / r2_187 / 2) * -1
  end
  if r3_187 ~= 1 then
    r13_187 = r13_187 - g_cgDispInfo.height / 2
    r9_187 = (g_cgDispInfo.height - APP_INTERNAL_HEIGHT) / 2 * -1 - r13_187 * r3_187
  else
    r9_187 = (r13_187 - APP_INTERNAL_HEIGHT / r3_187 / 2) * -1
  end
  r1_187:setParam("cgDisp", "cgDisp01", LUA_PARAM_POS, r8_187, r9_187, r10_187, r11_187)
  checkCGPos()
  setCGDispCursor()
end
function onMouseMoveCGDisp(r0_188, r1_188, r2_188, r3_188)
  -- line: [6259, 6282] id: 188
  if 0 <= r2_188 and 0 <= r3_188 and r2_188 < APP_INTERNAL_WIDTH and r3_188 < APP_INTERNAL_HEIGHT and g_luaMenuInfo.enabled == true and g_luaMenuInfo.effect == false then
    if g_cgDispInfo.drug == true then
      local r4_188 = cclass.lua_Layers:create()
      local r5_188 = r2_188 - g_cgDispInfo.xPos
      local r6_188 = r3_188 - g_cgDispInfo.yPos
      r7_188, r8_188, r9_188, r10_188 = r4_188:getParam("cgDisp", "cgDisp01", LUA_PARAM_SCALE, 0, 0, 0, 0)
      local r11_188 = 0
      local r12_188 = 0
      local r13_188 = 0
      local r14_188 = 0
      r11_188, r12_188, r13_188, r14_188 = r4_188:getParam("cgDisp", "cgDisp01", LUA_PARAM_POS, r11_188, r12_188, r13_188, r14_188)
      r4_188:setParam("cgDisp", "cgDisp01", LUA_PARAM_POS, r11_188 + r5_188, r12_188 + r6_188, r13_188, r14_188)
      checkCGPos()
    end
    g_cgDispInfo.xPos = r2_188
    g_cgDispInfo.yPos = r3_188
    setCGDispCursor()
  end
end
function onLButtonDownCGDisp(r0_189)
  -- line: [6285, 6292] id: 189
  if g_luaMenuInfo.enabled == true and g_luaMenuInfo.effect == false then
    if r0_189 == true then
      return 
    end
    closeCGDisp(1)
  end
end
function onRButtonDownCGDisp(r0_190, r1_190)
  -- line: [6295, 6299] id: 190
  if g_luaMenuInfo.enabled == true and g_luaMenuInfo.effect == false then
    closeCGDisp(-1)
  end
end
function setCGDispCursor()
  -- line: [6302, 6314] id: 191
  local r0_191 = cclass.lua_AutoCursor:new()
  local r1_191 = 0
  local r2_191 = cclass.lua_Layers:create()
  local r3_191 = 0
  local r4_191 = 0
  r3_191, r4_191, r5_191, r6_191 = r2_191:getParam("cgDisp", "cgDisp01", LUA_PARAM_SCALE, r3_191, r4_191, 0, 0)
  if APP_INTERNAL_WIDTH < g_cgDispInfo.width * r3_191 or APP_INTERNAL_HEIGHT < g_cgDispInfo.height * r4_191 then
    if g_cgDispInfo.drug == true then
      r1_191 = 2 or 1
    else
      goto label_45	-- block#4 is visited secondly
    end
  end
  r0_191:SetCursor(r1_191)
  r0_191:delete()
end
function onMButtonDownCGDisp(r0_192, r1_192)
  -- line: [6317, 6324] id: 192
  if g_luaMenuInfo.enabled == true and g_luaMenuInfo.effect == false then
    g_cgDispInfo.xPos = r0_192
    g_cgDispInfo.yPos = r1_192
    g_cgDispInfo.drug = true
    setCGDispCursor()
  end
end
function onMButtonUpCGDisp(r0_193, r1_193)
  -- line: [6327, 6330] id: 193
  g_cgDispInfo.drug = false
  setCGDispCursor()
end
function checkCGPos()
  -- line: [6333, 6365] id: 194
  local r0_194 = cclass.lua_Layers:create()
  local r1_194 = 0
  local r2_194 = 0
  local r3_194 = 0
  local r4_194 = 0
  r1_194, r2_194, r3_194, r4_194 = r0_194:getParam("cgDisp", "cgDisp01", LUA_PARAM_POS, r1_194, r2_194, r3_194, r4_194)
  local r5_194 = 0
  local r6_194 = 0
  r5_194, r6_194, r7_194, r8_194 = r0_194:getParam("cgDisp", "cgDisp01", LUA_PARAM_SCALE, r5_194, r6_194, 0, 0)
  local r9_194 = 0
  local r10_194 = 0
  if g_cgDispInfo.width * r5_194 < APP_INTERNAL_WIDTH then
    r9_194 = APP_INTERNAL_WIDTH / 2 - g_cgDispInfo.width / 2
  end
  if g_cgDispInfo.height * r6_194 < APP_INTERNAL_HEIGHT then
    r10_194 = APP_INTERNAL_HEIGHT / 2 - g_cgDispInfo.height / 2
  end
  local r11_194 = APP_INTERNAL_WIDTH - g_cgDispInfo.width + r9_194
  local r12_194 = r9_194
  local r13_194 = APP_INTERNAL_HEIGHT - g_cgDispInfo.height + r10_194
  local r14_194 = r10_194
  if r5_194 ~= 1 and r9_194 == 0 then
    local r15_194 = (g_cgDispInfo.width * r5_194 - g_cgDispInfo.width) / 2
    r11_194 = r11_194 - r15_194
    r12_194 = r12_194 + r15_194
  end
  if r6_194 ~= 1 and r10_194 == 0 then
    local r15_194 = (g_cgDispInfo.height * r6_194 - g_cgDispInfo.height) / 2
    r13_194 = r13_194 - r15_194
    r14_194 = r14_194 + r15_194
  end
  if r1_194 < r11_194 then
    r1_194 = r11_194
    if r1_194 then
      r1_194 = r1_194
    end
  end
  if r12_194 < r1_194 then
    r1_194 = r12_194
    if r1_194 then
      r1_194 = r1_194
    end
  end
  if r2_194 < r13_194 then
    r2_194 = r13_194
    if r2_194 then
      r2_194 = r2_194
    end
  end
  if r14_194 < r2_194 then
    r2_194 = r14_194
    if r2_194 then
      r2_194 = r2_194
    end
  end
  r0_194:setParam("cgDisp", "cgDisp01", LUA_PARAM_POS, r1_194, r2_194, r3_194, r4_194)
end
function playSystemVoice(r0_195)
  -- line: [6369, 6392] id: 195
  if r0_195 == 0 then
    local r1_195 = cclass.lua_Sounds:new()
    r1_195:SndStop("%SysVoice%")
    r1_195:delete()
    return 
  end
  if g_sysVoiceChar == 0 then
    return 
  end
  local r1_195 = {
    "SV_START",
    "SV_TITLECALL",
    "SV_ENDCHECK",
    "SV_END",
    "SV_QLOAD",
    "SV_LOAD",
    "SV_QSAVE",
    "SV_OVERWRITE",
    "SV_DEFAULT",
    "SV_GALLERY",
    "SV_TITLE"
  }
  local r2_195 = g_sysVoiceChar
  if r2_195 == 999 then
    r2_195 = math.random(1, 15)
  end
  local r3_195 = r1_195[r0_195] .. string.format("%02d", r2_195) .. ".ogg"
  local r4_195 = cclass.lua_Sounds:new()
  local r5_195 = g_charKeys[r2_195] .. "%SysVoice%"
  r4_195:SndPlay(r5_195, getSoundArcFileName("systemvoice", r3_195), r3_195, getSoundVolume(r5_195))
  r4_195:delete()
end
AutoModeTimer = {}
function AutoModeTimer.new()
  -- line: [6399, 6431] id: 196
  return {
    textLength = 0,
    waitLength = 0,
    carryTime = 0,
    enable = false,
    start = function(r0_197, r1_197)
      -- line: [6406, 6411] id: 197
      r0_197.enable = true
      r0_197.textLength = r1_197
      r0_197.waitLength = 0
      r0_197.carryTime = 0
    end,
    addFrame = function(r0_198, r1_198)
      -- line: [6413, 6425] id: 198
      if r0_198.enable == true then
        local r2_198 = getAutoWaitTime()
        local r3_198 = math.floor((r1_198 + r0_198.carryTime) / r2_198)
        r0_198.carryTime = r1_198 + r0_198.carryTime - r2_198 * r3_198
        r0_198.waitLength = r0_198.waitLength + r3_198
        if r0_198.textLength <= r0_198.waitLength then
          return true
        end
      end
      return false
    end,
    reset = function(r0_199)
      -- line: [6427, 6429] id: 199
      r0_199.enable = false
    end,
  }
end
GraphBar = {}
function GraphBar.new(r0_200, r1_200, r2_200, r3_200, r4_200, r5_200, r6_200)
  -- line: [6437, 6529] id: 200
  return {
    now = 0,
    max = r2_200,
    layerset = r0_200,
    layerkey = r1_200,
    memberLayer = {
      r3_200,
      r4_200,
      r5_200,
      r6_200
    },
    init = function(r0_201, r1_201)
      -- line: [6445, 6461] id: 201
      local r2_201 = cclass.lua_Layers:create()
      for r6_201 = 1, #r0_201.memberLayer, 1 do
        r2_201:initSubLayer(r0_201.layerset, r0_201.layerkey, r0_201.memberLayer[r6_201], 1)
        if r6_201 == 1 then
          r2_201:setSubLayerParam(r0_201.layerset, r0_201.layerkey, r0_201.memberLayer[r6_201], LUA_PARAM_COLOR, 1, 1, 1, 0)
          r2_201:setSubLayerHitTest(r0_201.layerset, r0_201.layerkey, r0_201.memberLayer[r6_201], 1, 0)
        elseif r6_201 == 2 then
          r0_201:updateBar(r1_201)
        elseif r6_201 == 4 then
          r2_201:setSubLayerParam(r0_201.layerset, r0_201.layerkey, r0_201.memberLayer[r6_201], LUA_PARAM_COLOR, 1, 1, 1, 0)
        end
      end
    end,
    updateBar = function(r0_202, r1_202)
      -- line: [6463, 6477] id: 202
      if r0_202.max > 0 then
        local r2_202 = cclass.lua_Layers:create()
        if r1_202 == 0 then
          r2_202:setSubLayerParam(r0_202.layerset, r0_202.layerkey, r0_202.memberLayer[2], LUA_PARAM_COLOR, 1, 1, 1, 0)
        else
          r2_202:setSubLayerParam(r0_202.layerset, r0_202.layerkey, r0_202.memberLayer[2], LUA_PARAM_COLOR, 1, 1, 1, 1)
          local r3_202 = 0
          local r4_202 = 0
          r3_202, r4_202, r5_202, r6_202 = r2_202:getSubLayerParam(r0_202.layerset, r0_202.layerkey, r0_202.memberLayer[2], LUA_PARAM_SIZE, r3_202, r4_202, 0, 0)
          r2_202:setSubLayerParam(r0_202.layerset, r0_202.layerkey, r0_202.memberLayer[2], LUA_PARAM_RECT, 0, 0, r3_202 * r1_202 / r0_202.max, r4_202)
        end
      end
      r0_202.now = r1_202
    end,
    changeFocus = function(r0_203, r1_203, r2_203)
      -- line: [6479, 6493] id: 203
      local r3_203 = cclass.lua_Layers:create()
      if r2_203 == r0_203:getInput() then
        local r4_203 = cclass.lua_Sounds:new()
        r4_203:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
        r4_203:delete()
        r3_203:setSubLayerParam(r0_203.layerset, r0_203.layerkey, r0_203.memberLayer[3], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_203:setSubLayerParam(r0_203.layerset, r0_203.layerkey, r0_203.memberLayer[4], LUA_PARAM_COLOR, 1, 1, 1, 1)
      elseif r1_203 == r0_203:getInput() then
        r3_203:setSubLayerParam(r0_203.layerset, r0_203.layerkey, r0_203.memberLayer[3], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_203:setSubLayerParam(r0_203.layerset, r0_203.layerkey, r0_203.memberLayer[4], LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
    end,
    onLButtonDown = function(r0_204, r1_204, r2_204, r3_204, r4_204)
      -- line: [6495, 6519] id: 204
      if r1_204 == r0_204:getInput() then
        local r5_204 = cclass.lua_Layers:create()
        local r6_204 = 0
        r6_204, r7_204, r8_204, r9_204 = r5_204:getSubLayerParam(r0_204.layerset, r0_204.layerkey, r0_204.memberLayer[2], LUA_PARAM_SIZE, r6_204, 0, 0, 0)
        local r10_204 = 0
        r10_204, r11_204, r12_204, r13_204 = r5_204:getSubLayerParam(r0_204.layerset, r0_204.layerkey, r0_204.memberLayer[2], LUA_PARAM_POS, r10_204, 0, 0, 0)
        local r14_204 = r4_204
        if r2_204 <= r10_204 then
          r14_204 = 0
        elseif r10_204 + r6_204 <= r2_204 then
          r14_204 = r2_200
        else
          r14_204 = math.modf(r2_200 * (r2_204 - r10_204) / r6_204)
        end
        if r4_204 ~= r14_204 then
          r0_204:updateBar(r14_204)
        end
        return r14_204
      end
      return r4_204
    end,
    getInput = function(r0_205)
      -- line: [6521, 6523] id: 205
      return r0_205.memberLayer[1]
    end,
    getValue = function(r0_206)
      -- line: [6525, 6527] id: 206
      return r0_206.now
    end,
  }
end
ScrollBar = {}
function ScrollBar.new(r0_207, r1_207, r2_207, r3_207, r4_207, r5_207, r6_207)
  -- line: [6536, 6630] id: 207
  -- notice: unreachable block#3
  local r7_207 = {
    layerset = r0_207,
    layerkey = r1_207,
    layerno = r2_207,
    drug = false,
  }
  local r8_207 = {
    left = r3_207,
    top = r4_207,
    right = r3_207 + r5_207,
    bottom = r4_207 + r6_207,
  }
  r7_207.rect = r8_207
  if r5_207 < r6_207 then
    r8_207 = true
  else
    r8_207 = false
  end
  r7_207.vertical = r8_207
  function r7_207.getNearSelect(r0_208, r1_208, r2_208, r3_208)
    -- line: [6545, 6575] id: 208
    local r4_208 = cclass.lua_Layers:create()
    local r5_208 = 0
    local r6_208 = 0
    r5_208, r6_208, r7_208, r8_208 = r4_208:getSubLayerParam(r0_208.layerset, r0_208.layerkey, r0_208.layerno, LUA_PARAM_SIZE, r5_208, r6_208, 0, 0)
    if r0_208.vertical == true then
      local r9_208 = r2_208 - r0_208.rect.top
      local r10_208 = r0_208.rect.bottom - r0_208.rect.top - r6_208
      if r9_208 < r6_208 / 2 then
        return 0
      elseif r10_208 < r9_208 then
        return r3_208
      end
      return math.modf(r3_208 * r9_208 / r10_208)
    else
      local r9_208 = r1_208 - r0_208.rect.left
      local r10_208 = r0_208.rect.right - r0_208.rect.left - r5_208
      if r9_208 < r5_208 / 2 then
        return 0
      elseif r10_208 < r9_208 then
        return r3_208
      end
      return math.modf(r3_208 * r9_208 / r10_208)
    end
  end
  function r7_207.onLButtonDown(r0_209, r1_209, r2_209, r3_209, r4_209, r5_209, r6_209)
    -- line: [6577, 6593] id: 209
    if r6_209 == true then
      return -1
    end
    if r0_209.layerno == r1_209 then
      r0_209.drug = true
    elseif r0_209.rect.left <= r2_209 and r2_209 < r0_209.rect.right and r0_209.rect.top <= r3_209 and r3_209 < r0_209.rect.bottom then
      return r0_209:getNearSelect(r2_209, r3_209, r4_209)
    end
    return -1
  end
  function r7_207.onLButtonUp(r0_210, r1_210, r2_210)
    -- line: [6595, 6599] id: 210
    if r0_210.drug == true then
      r0_210.drug = false
    end
  end
  function r7_207.isDrug(r0_211)
    -- line: [6601, 6603] id: 211
    return r0_211.drug
  end
  function r7_207.setSliderPos(r0_212, r1_212, r2_212)
    -- line: [6605, 6628] id: 212
    local r3_212 = cclass.lua_Layers:create()
    if r1_212 == 1 then
      r3_212:setSubLayerParam(r0_212.layerset, r0_212.layerkey, r0_212.layerno, LUA_PARAM_COLOR, 1, 1, 1, 0)
      return 
    end
    r3_212:setSubLayerParam(r0_212.layerset, r0_212.layerkey, r0_212.layerno, LUA_PARAM_COLOR, 1, 1, 1, 1)
    local r4_212 = 0
    local r5_212 = 0
    r4_212, r5_212, r6_212, r7_212 = r3_212:getSubLayerParam(r0_212.layerset, r0_212.layerkey, r0_212.layerno, LUA_PARAM_SIZE, r4_212, r5_212, 0, 0)
    local r8_212 = 0
    local r9_212 = 0
    local r10_212 = 0
    local r11_212 = 0
    r8_212, r9_212, r10_212, r11_212 = r3_212:getSubLayerParam(r0_207, r1_207, r0_212.layerno, LUA_PARAM_POS, r8_212, r9_212, r10_212, r11_212)
    if r0_212.vertical == true then
      r9_212 = math.floor(r0_212.rect.top + (r0_212.rect.bottom - r0_212.rect.top - r5_212) / (r1_212 - 1) * r2_212)
    else
      r8_212 = math.floor(r0_212.rect.left + (r0_212.rect.right - r0_212.rect.left - r4_212) / (r1_212 - 1) * r2_212)
    end
    r3_212:setSubLayerParam(r0_212.layerset, r0_212.layerkey, r0_212.layerno, LUA_PARAM_POS, r8_212, r9_212, r10_212, r11_212)
  end
  return r7_207
end
Menu = {}
function Menu.new(r0_213)
  -- line: [6641, 6935] id: 213
  local r1_213 = {
    MenuInf = {},
  }
  r1_213.MenuInf.enabled = false
  r1_213.MenuInf.effect = false
  r1_213.MenuInf.SetName = r0_213
  r1_213.MenuInf.ButtonLayer = ""
  r1_213.MenuInf.ButtonPna = ""
  r1_213.MenuButton = nil
  r1_213.MenuButtonData = {}
  function r1_213.MenuEffect(r0_214)
    -- line: [6660, 6669] id: 214
    local r1_214 = false
    r1_214 = r0_214:MenuEffectTransJob()
    if r0_214.MenuInf.effect == true and r1_214 == false then
      r0_214:MenuEffectEndJob()
      r0_214.MenuInf.effect = false
    end
    return r1_214
  end
  function r1_213.MenuEffectTransJob(r0_215)
    -- line: [6674, 6683] id: 215
    local r1_215 = cclass.lua_Layers:create()
    if r0_215.MenuInf.enabled == true then
      return r1_215:isTransition(r0_215.MenuInf.SetName)
    else
      return r1_215:isTransition(r0_215.MenuInf.SetName)
    end
  end
  function r1_213.MenuEffectEndJob(r0_216)
    -- line: [6685, 6712] id: 216
    local r1_216 = cclass.lua_Layers:create()
    if r0_216.MenuInf.enabled == true then
      local r2_216 = 0
      local r3_216 = 0
      local r4_216 = cclass.lua_AutoCursor:new()
      r2_216, r3_216 = r4_216:GetCursorPos(r2_216, r3_216)
      r4_216:delete()
      r0_216.MenuButton:changeButton(r0_216.MenuInf.SetName, r1_216:getCursorPos(r0_216.MenuInf.SetName, r2_216, r3_216, 0) - 1, r2_216, r3_216)
    else
      if g_menuExecute == false then
        r1_216:removeSnap("system")
      end
      r1_216:remove(r0_216.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_216.MenuInf.ButtonLayer = ""
      r0_216.MenuInf.ButtonPna = ""
    end
  end
  function r1_213.MenuEffectStart(r0_217, r1_217, r2_217)
    -- line: [6714, 6721] id: 217
    local r3_217 = cclass.lua_Layers:create()
    local r4_217 = cclass.lua_MeasureTime:new()
    local r5_217 = getEffectRate()
    r3_217:startTransition(r0_217.MenuInf.SetName, 0, 1, r1_217 * r5_217, r2_217 * r4_217:diff() * r5_217, LUA_TRANSITION_NORMAL)
    r4_217:delete()
  end
  function r1_213.MenuEffectEnd(r0_218, r1_218)
    -- line: [6723, 6731] id: 218
    local r2_218 = cclass.lua_Layers:create()
    local r3_218 = getEffectRate()
    r2_218:setSnap(r0_218.MenuInf.SetName, false)
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_RTSNAP, 0)
    r2_218:startTransition(r0_218.MenuInf.SetName, 0, 1, r1_218 * r3_218, 0, LUA_TRANSITION_ERASE)
  end
  function r1_213.MenuEffectToMenu(r0_219, r1_219)
    -- line: [6733, 6741] id: 219
    local r2_219 = cclass.lua_Layers:create()
    r2_219:removeSnap("system")
    r2_219:rtSnap("system")
    local r3_219 = getEffectRate()
    r2_219:setSnap(r0_219.MenuInf.SetName, false)
    r2_219:startTransition(r0_219.MenuInf.SetName, 0, 1, r1_219 * r3_219, 0, LUA_TRANSITION_ERASE)
  end
  function r1_213.MenuInit(r0_220, r1_220, r2_220)
    -- line: [6746, 6768] id: 220
    local r3_220 = true
    r0_220.MenuInf.enabled = false
    r0_220.MenuInf.effect = false
    r0_220.MenuInf.ButtonLayer = r1_220
    r0_220.MenuInf.ButtonPna = r2_220
    if cclass.lua_Layers:create():add(r0_220.MenuInf.SetName) == false then
      return false
    end
    r0_220:MenuLoadLayer(r1_220, r2_220)
    r0_220.MenuButton = Button.new(r0_220.MenuInf.SetName)
    r0_220.MenuButton:InitList()
    r0_220.MenuButtonData = {}
    return r3_220
  end
  function r1_213.MenuLoadLayer(r0_221, r1_221, r2_221)
    -- line: [6771, 6781] id: 221
    local r3_221 = cclass.lua_Layers:create()
    local r4_221 = getGraphicsArcFileName(r0_221.MenuInf.SetName, r2_221)
    local r5_221 = false
    if string.lower(string.sub(r2_221, -4)) == ".pna" then
      r5_221 = r3_221:insertLayer(r0_221.MenuInf.SetName, r1_221, LUA_LAYER_PNA, r4_221, r2_221, 1)
    else
      r5_221 = r3_221:insertLayer(r0_221.MenuInf.SetName, r1_221, LUA_LAYER_STD, r4_221, r2_221, 1)
    end
    return r5_221
  end
  function r1_213.MenuButtonInit(r0_222)
    -- line: [6786, 6792] id: 222
    if r0_222.MenuButton ~= nil then
      r0_222.MenuButton:SetList("MenuButtonData", r0_222.MenuButtonData)
      r0_222.MenuButton:InitButton()
    end
  end
  function r1_213.MenuButtonSet(r0_223, r1_223, r2_223, r3_223, r4_223, r5_223, r6_223, r7_223, r8_223, r9_223, r10_223, r11_223, r12_223)
    -- line: [6795, 6797] id: 223
    r1_223[r2_223] = r0_223.MenuButton:ButtonCreate(r2_223, r3_223, r4_223, r5_223, r6_223, r7_223, r8_223, r9_223, r10_223, r11_223, "SYS01.ogg", "SYS03.ogg", r12_223)
  end
  function r1_213.MenuMoveButtonSet(r0_224, r1_224, r2_224, r3_224, r4_224, r5_224, r6_224, r7_224, r8_224, r9_224, r10_224, r11_224, r12_224)
    -- line: [6800, 6804] id: 224
    r1_224[r2_224] = r0_224.MenuButton:Movable(r0_224.MenuButton:ButtonCreate(r2_224, r3_224, r4_224, r5_224, r6_224, r7_224, r8_224, r9_224, r10_224, r11_224, "SYS01.ogg", "SYS03.ogg", r12_224))
  end
  function r1_213.MenuAnimButtonSet(r0_225, r1_225, r2_225, r3_225, r4_225, r5_225, r6_225, r7_225, r8_225, r9_225, r10_225, r11_225, r12_225, r13_225)
    -- line: [6807, 6811] id: 225
    r1_225[r3_225] = r0_225.MenuButton:Animatable(r2_225, r0_225.MenuButton:ButtonCreate(r3_225, r4_225, r5_225, r6_225, r7_225, r8_225, r9_225, r10_225, r11_225, r12_225, "SYS01.ogg", "SYS03.ogg", r13_225))
  end
  function r1_213.MenuButtonJobPos(r0_226, r1_226, r2_226, r3_226, r4_226)
    -- line: [6815, 6817] id: 226
    r0_226:MenuButtonJob(r1_226, r2_226)
  end
  function r1_213.MenuButtonJob(r0_227, r1_227, r2_227)
    -- line: [6818, 6825] id: 227
  end
  function r1_213.GetMenuActive(r0_228)
    -- line: [6828, 6834] id: 228
    local r1_228 = false
    if r0_228.MenuInf.enabled == true or r0_228.MenuInf.effect == true then
      r1_228 = true
    end
    return r1_228
  end
  function r1_213.GetMenuMouseEnable(r0_229)
    -- line: [6837, 6843] id: 229
    local r1_229 = false
    if r0_229.MenuInf.enabled == true and r0_229.MenuInf.effect == false and r0_229.MenuButton ~= nil then
      r1_229 = true
    end
    return r1_229
  end
  function r1_213.MenuMouseMove(r0_230, r1_230, r2_230, r3_230, r4_230, r5_230, r6_230)
    -- line: [6847, 6856] id: 230
    if r6_230 == true then
      return 
    end
    if r0_230:GetMenuMouseEnable() then
      r0_230.MenuButton:mouseMove(r2_230, r3_230, r4_230, r5_230)
    end
  end
  function r1_213.MenuLButtonDown(r0_231, r1_231, r2_231, r3_231, r4_231, r5_231, r6_231)
    -- line: [6860, 6871] id: 231
    local r7_231 = 0
    if r6_231 == true then
      return r7_231
    end
    if r0_231:GetMenuMouseEnable() then
      r7_231 = r0_231.MenuButton:mouseLdown(r2_231, r3_231, r4_231, r5_231, r6_231)
    end
    r0_231:MenuButtonJobPos(r7_231, "LD", r4_231, r5_231)
    return r7_231
  end
  function r1_213.MenuLButtonUp(r0_232, r1_232, r2_232, r3_232, r4_232, r5_232, r6_232)
    -- line: [6875, 6886] id: 232
    local r7_232 = 0
    if r6_232 == true then
      return r7_232
    end
    if r0_232:GetMenuMouseEnable() then
      r7_232 = r0_232.MenuButton:mouseLup(r2_232, r3_232, r4_232, r5_232, r6_232)
    end
    r0_232:MenuButtonJobPos(r7_232, "LU", r4_232, r5_232)
    return r7_232
  end
  function r1_213.MenuRButtonDown(r0_233, r1_233, r2_233, r3_233, r4_233, r5_233, r6_233)
    -- line: [6890, 6901] id: 233
    local r7_233 = 0
    if r6_233 == true then
      return r7_233
    end
    if r0_233:GetMenuMouseEnable() then
      r7_233 = r0_233.MenuButton:mouseRdown(r2_233, r3_233, r4_233, r5_233, r6_233)
    end
    r0_233:MenuButtonJobPos(r7_233, "RD", r4_233, r5_233)
    return r7_233
  end
  function r1_213.MenuRButtonUp(r0_234, r1_234, r2_234, r3_234, r4_234, r5_234, r6_234)
    -- line: [6905, 6916] id: 234
    local r7_234 = 0
    if r6_234 == true then
      return r7_234
    end
    if r0_234:GetMenuMouseEnable() then
      r7_234 = r0_234.MenuButton:mouseRup(r2_234, r3_234, r4_234, r5_234, r6_234)
    end
    r0_234:MenuButtonJobPos(r7_234, "RU", r4_234, r5_234)
    return r7_234
  end
  function r1_213.MenuMButtonDown(r0_235, r1_235, r2_235, r3_235, r4_235, r5_235, r6_235)
    -- line: [6919, 6920] id: 235
  end
  function r1_213.MenuMButtonUp(r0_236, r1_236, r2_236, r3_236, r4_236, r5_236, r6_236)
    -- line: [6923, 6924] id: 236
  end
  function r1_213.MenuMouseWheel(r0_237, r1_237, r2_237)
    -- line: [6927, 6928] id: 237
  end
  function r1_213.MenuKeyDown(r0_238, r1_238, r2_238, r3_238, r4_238)
    -- line: [6931, 6932] id: 238
  end
  return r1_213
end
Button = {}
function Button.new(r0_239)
  -- line: [6942, 8245] id: 239
  local r1_239 = {
    selCursor = -1,
    selDownCursor = -1,
    sellayerset = r0_239,
    dataList = {},
    selListKey = nil,
    selDownKey = nil,
    onDropList = {},
    onDropFlag = false,
    ButtonCreate = function(r0_240, r1_240, r2_240, r3_240, r4_240, r5_240, r6_240, r7_240, r8_240, r9_240, r10_240, r11_240, r12_240, r13_240)
      -- line: [6962, 6964] id: 240
      return r0_240:_ButtonCreate(-1, r1_240, r2_240, r3_240, r4_240, r5_240, r6_240, r7_240, r8_240, r9_240, r10_240, r11_240, r12_240, r13_240)
    end,
    _ButtonCreate = function(r0_241, r1_241, r2_241, r3_241, r4_241, r5_241, r6_241, r7_241, r8_241, r9_241, r10_241, r11_241, r12_241, r13_241, r14_241)
      -- line: [6966, 7434] id: 241
      local r15_241 = {}
      if r1_241 == -1 then
        r1_241 = r1_239.sellayerset
      end
      r15_241.layerset = r1_241
      r15_241.arg = r2_241
      r15_241.EVENT_TYPE = r3_241
      r15_241.layerkey = r4_241
      r15_241.SubLayer = {}
      function r15_241.bt_addLayer(r0_242, r1_242, r2_242)
        -- line: [6982, 6984] id: 242
        r0_242.SubLayer[r1_242] = {
          no = r2_242,
          x = 0,
          y = 0,
          r = 0,
          g = 0,
          b = 0,
          a = 0,
        }
      end
      r15_241:bt_addLayer("hit", r5_241)
      r15_241:bt_addLayer("def", r6_241)
      r15_241:bt_addLayer("on", r7_241)
      r15_241:bt_addLayer("act", r8_241)
      r15_241:bt_addLayer("dis", r9_241)
      r15_241.bt_l = r10_241
      r15_241.bt_r = r11_241
      function r15_241.bt_getLR(r0_243)
        -- line: [6997, 6999] id: 243
        return r0_243.bt_l, r0_243.bt_r
      end
      r15_241.se_on = r12_241
      r15_241.se_click = r13_241
      r15_241.priority = r14_241
      r15_241.active = 0
      r15_241.focusflag = false
      r15_241.initpos = {
        x = 0,
        y = 0,
      }
      r15_241.initrect = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
      }
      r15_241.DRAW_POS = {
        x = 0,
        y = 0,
      }
      r15_241.EVENT_RECT = {
        w = 0,
        h = 0,
      }
      function r15_241.bt_GetPos(r0_244)
        -- line: [7015, 7017] id: 244
        return r0_244.DRAW_POS.x, r0_244.DRAW_POS.y
      end
      function r15_241.bt_GetInitPos(r0_245)
        -- line: [7018, 7020] id: 245
        return r0_245.initpos.x, r0_245.initpos.y
      end
      r15_241.initFlag = false
      function r15_241.bt_init(r0_246)
        -- line: [7024, 7081] id: 246
        if r0_246.initFlag == false then
          r0_246.initFlag = true
          local r1_246 = false
          local r2_246 = cclass.lua_Layers:create()
          for r6_246, r7_246 in pairs(r0_246.SubLayer) do
            if r7_246.no ~= -1 then
              local r8_246 = 0
              local r9_246 = 0
              local r10_246 = 0
              local r11_246 = 0
              r2_246:initSubLayer(r0_246.layerset, r0_246.layerkey, r7_246.no, 1)
              r7_246.r, r7_246.g, r7_246.b, r7_246.a = r2_246:getSubLayerParam(r0_246.layerset, r0_246.layerkey, r7_246.no, LUA_PARAM_COLOR, r8_246, r9_246, r10_246, r11_246)
              if r7_246.no == r0_246.SubLayer.hit.no then
                r7_246.x = 0
                r7_246.y = 0
                if r7_246 ~= r0_246.SubLayer.hit then
                  r1_246 = true
                end
              else
                r8_246, r9_246, r10_246, r11_246 = r2_246:getSubLayerParam(r0_246.layerset, r0_246.layerkey, r0_246.SubLayer.hit.no, LUA_PARAM_POS, r8_246, r9_246, r10_246, r11_246)
                r7_246.x = r8_246
                r7_246.y = r9_246
                r8_246, r9_246, r10_246, r11_246 = r2_246:getSubLayerParam(r0_246.layerset, r0_246.layerkey, r7_246.no, LUA_PARAM_POS, r8_246, r9_246, r10_246, r11_246)
                r7_246.x = r8_246 - r7_246.x
                r7_246.y = r9_246 - r7_246.y
              end
            end
          end
          if r1_246 == false then
            r0_246.SubLayer.hit.a = 0
            r2_246:setSubLayerParam(r0_246.layerset, r0_246.layerkey, r0_246.SubLayer.hit.no, LUA_PARAM_COLOR, 1, 1, 1, 0)
          end
          r0_246.initrect.x, r0_246.initrect.y, r0_246.initrect.w, r0_246.initrect.h = r0_246:bt_GetLayerRect(r0_246.layerkey, r0_246.SubLayer.hit.no)
          r0_246.initpos.x = r0_246.initrect.x
          r0_246.initpos.y = r0_246.initrect.y
          r0_246.DRAW_POS.x = r0_246.initrect.x
          r0_246.DRAW_POS.y = r0_246.initrect.y
          r0_246.EVENT_RECT.w = r0_246.initrect.w - r0_246.initrect.x
          r0_246.EVENT_RECT.h = r0_246.initrect.h - r0_246.initrect.y
          if r0_246.EVENT_TYPE == 0 and r0_246.SubLayer.hit.no ~= -1 then
            r2_246:setSubLayerHitTest(r0_246.layerset, r0_246.layerkey, r0_246.SubLayer.hit.no, 1, 0.1)
          end
          r0_246:bt_SetActive(0)
        end
      end
      function r15_241.bt_SetColor(r0_247, r1_247, r2_247, r3_247, r4_247)
        -- line: [7084, 7091] id: 247
        local r5_247 = cclass.lua_Layers:create()
        for r9_247, r10_247 in pairs(r0_247.SubLayer) do
          if r10_247.no ~= -1 then
            r5_247:setSubLayerParam(r0_247.layerset, r0_247.layerkey, r10_247.no, LUA_PARAM_COLOR, r1_247, r2_247, r3_247, r4_247)
          end
        end
      end
      function r15_241.bt_ResetColor(r0_248)
        -- line: [7093, 7096] id: 248
        local r1_248 = cclass.lua_Layers:create()
        r0_248:bt_SetActive(r0_248.active)
      end
      function r15_241.bt_SetOnOffActive(r0_249)
        -- line: [7098, 7141] id: 249
        if r0_249.active == 0 then
          if r0_249.focusflag == false then
            r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.def, true)
            r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.on, false)
          elseif r0_249.SubLayer.on.no ~= -1 then
            r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.def, false)
            r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.on, true)
          else
            r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.def, true)
            r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.on, false)
          end
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.act, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.dis, false)
        end
        if r0_249.active == 1 then
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.def, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.on, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.act, true)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.dis, false)
        end
        if r0_249.active == 2 then
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.def, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.on, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.act, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.dis, true)
        end
        if r0_249.active == 3 then
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.def, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.on, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.act, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.dis, false)
        end
        if r0_249.active == 4 then
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.def, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.on, false)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.act, true)
          r0_249:bt_SetEnableSubLayer(r0_249.SubLayer.dis, false)
        end
      end
      function r15_241.bt_GetLayerRect(r0_250, r1_250, r2_250)
        -- line: [7145, 7147] id: 250
        return GetLayerRect(r0_250.layerset, r1_250, r2_250)
      end
      function r15_241.bt_getNowKey(r0_251)
        -- line: [7150, 7171] id: 251
        local r1_251 = -1
        if r0_251.active == 0 then
          if r0_251.focusflag == false then
            r1_251 = r0_251.SubLayer.def.no
          else
            r1_251 = r0_251.SubLayer.on.no
          end
        end
        if r0_251.active == 1 then
          r1_251 = r0_251.SubLayer.act.no
        end
        if r0_251.active == 2 then
          r1_251 = r0_251.SubLayer.dis.no
        end
        if r0_251.active == 3 then
        end
        if r0_251.active == 4 then
          r1_251 = r0_251.SubLayer.act.no
        end
        return r1_251
      end
      function r15_241.bt_getNowColor(r0_252)
        -- line: [7172, 7208] id: 252
        local r1_252 = 0
        local r2_252 = 0
        local r3_252 = 0
        local r4_252 = 0
        if r0_252.active == 0 then
          if r0_252.focusflag == false then
            r1_252 = r0_252.SubLayer.def.r
            r2_252 = r0_252.SubLayer.def.g
            r3_252 = r0_252.SubLayer.def.b
            r4_252 = r0_252.SubLayer.def.a
          else
            r1_252 = r0_252.SubLayer.on.r
            r2_252 = r0_252.SubLayer.on.g
            r3_252 = r0_252.SubLayer.on.b
            r4_252 = r0_252.SubLayer.on.a
          end
        end
        if r0_252.active == 1 then
          r1_252 = r0_252.SubLayer.act.r
          r2_252 = r0_252.SubLayer.act.g
          r3_252 = r0_252.SubLayer.act.b
          r4_252 = r0_252.SubLayer.act.a
        end
        if r0_252.active == 2 then
          r1_252 = r0_252.SubLayer.dis.r
          r2_252 = r0_252.SubLayer.dis.g
          r3_252 = r0_252.SubLayer.dis.b
          r4_252 = r0_252.SubLayer.dis.a
        end
        if r0_252.active == 3 then
        end
        if r0_252.active == 4 then
          r1_252 = r0_252.SubLayer.act.r
          r2_252 = r0_252.SubLayer.act.g
          r3_252 = r0_252.SubLayer.act.b
          r4_252 = r0_252.SubLayer.act.a
        end
        return r1_252, r2_252, r3_252, r4_252
      end
      function r15_241.bt_change(r0_253, r1_253, r2_253, r3_253, r4_253)
        -- line: [7213, 7295] id: 253
        local r5_253 = cclass.lua_Layers:create()
        local r6_253 = 0
        local r7_253 = r0_253.priority
        if r0_253.active == 0 or r0_253.active == 4 then
          local r8_253 = {
            def = false,
            on = false,
          }
          if r0_253.EVENT_TYPE == 0 then
            if r0_253.SubLayer.hit.no ~= -1 and r0_253.SubLayer.hit.no == r2_253 then
              r6_253 = 1
              if r0_253.focusflag == false then
                r0_253:bt_PlayAnim()
              end
              r0_253.focusflag = true
            else
              r0_253.focusflag = false
              r0_253:bt_StopAnim()
            end
          elseif r0_253.DRAW_POS.x <= r3_253 and r0_253.DRAW_POS.y <= r4_253 and r3_253 < r0_253.DRAW_POS.x + r0_253.EVENT_RECT.w and r4_253 < r0_253.DRAW_POS.y + r0_253.EVENT_RECT.h then
            r6_253 = 1
            if r0_253.focusflag == false then
              r0_253:bt_PlayAnim()
            end
            r0_253.focusflag = true
          else
            r0_253.focusflag = false
            r0_253:bt_StopAnim()
          end
          if r0_253.active == 0 then
            if r0_253.focusflag == true then
              if r0_253.SubLayer.def.no ~= -1 then
                r8_253.def = false
              end
              if r0_253.SubLayer.on.no ~= -1 then
                r8_253.on = true
              else
                r8_253.def = true
              end
            else
              if r0_253.SubLayer.def.no ~= -1 then
                r8_253.def = true
              end
              if r0_253.SubLayer.on.no ~= -1 then
                r8_253.on = false
              else
                r8_253.def = true
              end
            end
            r0_253:bt_SetEnableSubLayer(r0_253.SubLayer.def, r8_253.def)
            r0_253:bt_SetEnableSubLayer(r0_253.SubLayer.on, r8_253.on)
          end
        end
        return r6_253, r7_253
      end
      function r15_241.bt_SetEnableSubLayer(r0_254, r1_254, r2_254)
        -- line: [7298, 7310] id: 254
        if r1_254.no ~= -1 then
          local r3_254 = cclass.lua_Layers:create()
          if r2_254 == true then
            r3_254:setSubLayerParam(r0_254.layerset, r0_254.layerkey, r1_254.no, LUA_PARAM_COLOR, r1_254.r, r1_254.g, r1_254.b, r1_254.a)
          else
            r3_254:setSubLayerParam(r0_254.layerset, r0_254.layerkey, r1_254.no, LUA_PARAM_COLOR, 1, 1, 1, 0)
          end
        end
      end
      function r15_241.bt_ResetActive(r0_255)
        -- line: [7313, 7318] id: 255
        for r4_255, r5_255 in pairs(r0_255.SubLayer) do
          r0_255:bt_SetEnableSubLayer(r5_255, true)
        end
      end
      function r15_241.bt_SetActive(r0_256, r1_256)
        -- line: [7322, 7383] id: 256
        local r2_256 = cclass.lua_Layers:create()
        if r1_256 == 0 then
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.def, true)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.on, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.act, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.dis, false)
          if r0_256.SubLayer.hit.no ~= -1 then
            r2_256:setSubLayerHitTest(r0_256.layerset, r0_256.layerkey, r0_256.SubLayer.hit.no, 1, 0.1)
          end
        end
        if r1_256 == 1 then
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.def, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.on, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.act, true)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.dis, false)
          if r0_256.SubLayer.hit.no ~= -1 then
            r2_256:setSubLayerHitTest(r0_256.layerset, r0_256.layerkey, r0_256.SubLayer.hit.no, 0, 0.1)
          end
          r0_256:bt_StopAnim()
        end
        if r1_256 == 2 then
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.def, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.on, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.act, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.dis, true)
          if r0_256.SubLayer.hit.no ~= -1 then
            r2_256:setSubLayerHitTest(r0_256.layerset, r0_256.layerkey, r0_256.SubLayer.hit.no, 0, 0.1)
          end
          r0_256:bt_StopAnim()
        end
        if r1_256 == 3 then
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.def, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.on, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.act, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.dis, false)
          if r0_256.SubLayer.hit.no ~= -1 then
            r2_256:setSubLayerHitTest(r0_256.layerset, r0_256.layerkey, r0_256.SubLayer.hit.no, 0, 0.1)
          end
          r0_256:bt_StopAnim()
        end
        if r1_256 == 4 then
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.def, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.on, false)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.act, true)
          r0_256:bt_SetEnableSubLayer(r0_256.SubLayer.dis, false)
          if r0_256.SubLayer.hit.no ~= -1 then
            r2_256:setSubLayerHitTest(r0_256.layerset, r0_256.layerkey, r0_256.SubLayer.hit.no, 1, 0.1)
          end
          r0_256:bt_StopAnim()
        end
        r0_256.active = r1_256
      end
      function r15_241.bt_OnSePlay(r0_257)
        -- line: [7387, 7393] id: 257
        if r0_257.se_on ~= nil then
          local r1_257 = cclass.lua_Sounds:new()
          r1_257:SndPlay("systemse", getSoundArcFileName("systemse", r0_257.se_on), r0_257.se_on, getSoundVolume("systemse"))
          r1_257:delete()
        end
      end
      function r15_241.bt_ClickSePlay(r0_258)
        -- line: [7394, 7400] id: 258
        if r0_258.se_click ~= nil then
          local r1_258 = cclass.lua_Sounds:new()
          r1_258:SndPlay("systemse", getSoundArcFileName("systemse", r0_258.se_click), r0_258.se_click, getSoundVolume("systemse"))
          r1_258:delete()
        end
      end
      function r15_241.bt_SetPos(r0_259, r1_259, r2_259)
        -- line: [7402, 7413] id: 259
        r0_259.DRAW_POS.x = r1_259
        r0_259.DRAW_POS.y = r2_259
        local r3_259 = cclass.lua_Layers:create()
        for r7_259, r8_259 in pairs(r0_259.SubLayer) do
          if r8_259.no ~= -1 then
            r3_259:setSubLayerParam(r0_259.layerset, r0_259.layerkey, r8_259.no, LUA_PARAM_POS, r1_259 + r8_259.x, r2_259 + r8_259.y, 0, 0)
          end
        end
      end
      function r15_241.bt_SetDefPos(r0_260)
        -- line: [7415, 7417] id: 260
        r0_260:bt_SetPos(r0_260.initrect.x, r0_260.initrect.y)
      end
      function r15_241.bt_PlayAnim(r0_261)
        -- line: [7420, 7421] id: 261
      end
      function r15_241.bt_StopAnim(r0_262)
        -- line: [7422, 7423] id: 262
      end
      function r15_241.bt_MovableStart(r0_263, r1_263, r2_263)
        -- line: [7426, 7427] id: 263
      end
      function r15_241.bt_MovableControl(r0_264, r1_264, r2_264)
        -- line: [7428, 7430] id: 264
        return false
      end
      return r15_241
    end,
    SetList = function(r0_265, r1_265, r2_265)
      -- line: [7439, 7441] id: 265
      r0_265.dataList[r1_265] = r2_265
    end,
    InitList = function(r0_266)
      -- line: [7443, 7446] id: 266
      r0_266.dataList = {}
      r0_266.onDropList = {}
    end,
    SetDropList = function(r0_267, r1_267, r2_267)
      -- line: [7448, 7450] id: 267
      r0_267.onDropList[r1_267] = r2_267
    end,
    InitButton = function(r0_268)
      -- line: [7456, 7479] id: 268
      r0_268.selCursor = -1
      r0_268.selDownCursor = -1
      r0_268.selListKey = nil
      r0_268.selDownKey = nil
      for r4_268, r5_268 in pairs(r0_268.dataList) do
        if r5_268 ~= nil then
          for r9_268, r10_268 in pairs(r5_268) do
            r10_268:bt_init()
          end
        end
      end
      for r4_268, r5_268 in pairs(r0_268.onDropList) do
        if r5_268 ~= nil then
          for r9_268, r10_268 in pairs(r5_268) do
            r10_268:bt_init()
          end
        end
      end
    end,
    ResetButtonActive = function(r0_269, r1_269)
      -- line: [7483, 7487] id: 269
      for r5_269, r6_269 in pairs(r1_269) do
        r6_269:bt_ResetActive()
      end
    end,
    ResetColor = function(r0_270, r1_270)
      -- line: [7493, 7497] id: 270
      for r5_270, r6_270 in pairs(r1_270) do
        r6_270:bt_ResetColor()
      end
    end,
    SetColor = function(r0_271, r1_271, r2_271, r3_271, r4_271, r5_271)
      -- line: [7499, 7503] id: 271
      for r9_271, r10_271 in pairs(r1_271) do
        r10_271:bt_SetColor(r2_271, r3_271, r4_271, r5_271)
      end
    end,
    changeButton = function(r0_272, r1_272, r2_272, r3_272, r4_272)
      -- line: [7507, 7565] id: 272
      local r5_272 = 0
      local r6_272 = -2
      if r0_272.selDownCursor ~= -1 then
        r5_272, r6_272 = r0_272.selDownKey[r0_272.selDownCursor]:bt_change(r1_272, r2_272, r3_272, r4_272)
        if r5_272 ~= 0 then
          r0_272.selCursor = r0_272.selDownCursor
          r0_272.selListKey = r0_272.selDownKey
        elseif r0_272.onDropFlag == true then
          r0_272:offCursor(r0_272.dataList)
          r0_272:offCursor(r0_272.onDropList)
          local r7_272 = -1
          local r8_272 = nil
          r7_272, r8_272 = r0_272:onCursor(r0_272.onDropList, r1_272, r2_272, r3_272, r4_272)
          if r7_272 ~= -1 then
            if r0_272.selCursor ~= r7_272 then
              r8_272[r7_272]:bt_OnSePlay()
            end
            r0_272.selCursor = r7_272
            r0_272.selListKey = r8_272
          else
            r0_272.selCursor = -1
            r0_272.selListKey = nil
          end
        else
          r0_272.selCursor = -1
          r0_272.selListKey = nil
        end
      end
      if r0_272.selDownCursor == -1 then
        local r7_272 = -1
        local r8_272 = nil
        r7_272, r8_272 = r0_272:onCursor(r0_272.dataList, r1_272, r2_272, r3_272, r4_272)
        if r7_272 ~= -1 then
          if r0_272.selCursor ~= r7_272 then
            r8_272[r7_272]:bt_OnSePlay()
          end
          r0_272.selCursor = r7_272
          r0_272.selListKey = r8_272
        else
          r0_272.selCursor = -1
          r0_272.selListKey = nil
        end
      end
    end,
    onCursor = function(r0_273, r1_273, r2_273, r3_273, r4_273, r5_273)
      -- line: [7569, 7596] id: 273
      local r6_273 = -1
      local r7_273 = -2
      local r8_273 = nil
      for r12_273, r13_273 in pairs(r1_273) do
        if r13_273 ~= nil then
          for r17_273, r18_273 in pairs(r13_273) do
            local r19_273 = 0
            local r20_273 = -2
            r19_273, r20_273 = r18_273:bt_change(r2_273, r3_273, r4_273, r5_273)
            if r19_273 ~= 0 and r7_273 < r20_273 then
              r6_273 = r17_273
              r7_273 = r20_273
              r8_273 = r13_273
            end
          end
        end
      end
      return r6_273, r8_273
    end,
    offCursor = function(r0_274, r1_274)
      -- line: [7600, 7614] id: 274
      for r5_274, r6_274 in pairs(r1_274) do
        if r6_274 ~= nil then
          for r10_274, r11_274 in pairs(r6_274) do
            if r11_274.active == 0 then
              r11_274.focusflag = false
              r11_274:bt_StopAnim()
              r11_274:bt_SetEnableSubLayer(r11_274.SubLayer.def, true)
              r11_274:bt_SetEnableSubLayer(r11_274.SubLayer.on, false)
            end
          end
        end
      end
    end,
    mouseMove = function(r0_275, r1_275, r2_275, r3_275, r4_275)
      -- line: [7618, 7626] id: 275
      local r5_275 = false
      if r0_275.selDownCursor ~= -1 then
        r5_275 = r0_275.selDownKey[r0_275.selDownCursor]:bt_MovableControl(r3_275, r4_275)
      end
      if r5_275 == false then
        r0_275:changeButton(r1_275, r2_275, r3_275, r4_275)
      end
    end,
    mouseLdown = function(r0_276, r1_276, r2_276, r3_276, r4_276, r5_276)
      -- line: [7631, 7647] id: 276
      local r6_276 = 0
      if _buttonrepeat == true then
        return r6_276
      end
      r0_276:changeButton(r1_276, r2_276, r3_276, r4_276)
      if r0_276.selCursor ~= -1 then
        r0_276.selDownCursor = r0_276.selCursor
        r0_276.selDownKey = r0_276.selListKey
        r0_276.selDownKey[r0_276.selDownCursor]:bt_ClickSePlay()
        r0_276.selDownKey[r0_276.selDownCursor]:bt_MovableStart(r3_276, r4_276)
        r6_276 = r0_276.selDownKey[r0_276.selDownCursor].bt_l
      end
      return r6_276
    end,
    mouseLup = function(r0_277, r1_277, r2_277, r3_277, r4_277, r5_277)
      -- line: [7652, 7669] id: 277
      local r6_277 = 0
      if _buttonrepeat == true then
        return r6_277
      end
      r0_277:changeButton(r1_277, r2_277, r3_277, r4_277)
      if r0_277.selCursor ~= -1 and r0_277.selCursor == r0_277.selDownCursor then
        r6_277 = r0_277.selDownKey[r0_277.selDownCursor].bt_l
      end
      r0_277:offCursor(r0_277.onDropList)
      r0_277.selDownCursor = -1
      r0_277.selDownKey = nil
      return r6_277
    end,
    mouseRdown = function(r0_278, r1_278, r2_278, r3_278, r4_278, r5_278)
      -- line: [7674, 7685] id: 278
      local r6_278 = 0
      if _buttonrepeat == true then
        return r6_278
      end
      if r0_278.selDownCursor == -1 and r0_278.selCursor ~= -1 then
        r6_278 = r0_278.selListKey[r0_278.selCursor].bt_r
      end
      return r6_278
    end,
    mouseRup = function(r0_279, r1_279, r2_279, r3_279, r4_279, r5_279)
      -- line: [7690, 7702] id: 279
      local r6_279 = 0
      if _buttonrepeat == true then
        return r6_279
      end
      if r0_279.selDownCursor == -1 and r0_279.selCursor ~= -1 then
        r0_279.selListKey[r0_279.selCursor]:bt_ClickSePlay()
        r6_279 = r0_279.selListKey[r0_279.selCursor].bt_r
      end
      return r6_279
    end,
    Animatable = function(r0_280, r1_280, r2_280)
      -- line: [7709, 7744] id: 280
      local r3_280 = r2_280
      r3_280.anim = {
        play = false,
        name = r1_280,
      }
      function r3_280.bt_PlayAnim(r0_281)
        -- line: [7713, 7727] id: 281
        if r0_281.anim.name ~= -1 and r0_281.active == 0 then
          local r1_281 = cclass.lua_Layers:create()
          r0_281.anim.play = true
          if r0_281.SubLayer.on.no ~= -1 then
            r1_281:cancelSubLayerEffect(r0_281.layerset, r0_281.layerkey, r0_281.SubLayer.on.no, r0_281.anim.name)
            r1_281:setSubLayerEffect(r0_281.layerset, r0_281.layerkey, r0_281.anim.name, r0_281.SubLayer.on.no, LUA_EFFECT_SCALE, 0.1, 0.1, 0, 0, 0, 300, 0, 100)
            r1_281:setSubLayerEffect(r0_281.layerset, r0_281.layerkey, r0_281.anim.name, r0_281.SubLayer.on.no, LUA_EFFECT_SCALE, -0.1, -0.1, 0, 0, 0, 300, 0, 0)
            r1_281:startSubLayerEffect(r0_281.layerset, r0_281.layerkey, r0_281.anim.name, r0_281.SubLayer.on.no, -1)
          end
        end
      end
      function r3_280.bt_StopAnim(r0_282)
        -- line: [7729, 7740] id: 282
        if r0_282.anim.play == true and r0_282.anim.name ~= -1 then
          local r1_282 = cclass.lua_Layers:create()
          r0_282.anim.play = false
          if r0_282.SubLayer.on.no ~= -1 then
            r1_282:cancelSubLayerEffect(r0_282.layerset, r0_282.layerkey, r0_282.SubLayer.on.no, r0_282.anim.name)
            r1_282:setSubLayerParam(r0_282.layerset, r0_282.layerkey, r0_282.SubLayer.on.no, LUA_PARAM_SCALE, 1, 1, 1, 0)
          end
        end
      end
      return r3_280
    end,
    Movable = function(r0_283, r1_283)
      -- line: [7749, 8125] id: 283
      local r2_283 = r1_283
      r2_283.MOVABLE = {
        flag = false,
        DRAGST_X = 0,
        DRAGST_Y = 0,
        BT_X = 0,
        BT_Y = 0,
        MAX_X = 0,
        MAX_Y = 0,
        PAR_X = 0,
        PAR_Y = 0,
        MIN_W = 0,
        MIN_H = 0,
        PAR_MAX_X = 0,
        PAR_MAX_Y = 0,
        PSIZE_X = 0,
        PSIZE_Y = 0,
      }
      r2_283.MOVERANGE = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
      }
      r2_283.EVRANGE = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
      }
      function r2_283.bt_SetMovableInit(r0_284, r1_284, r2_284, r3_284, r4_284, r5_284, r6_284, r7_284)
        -- line: [7775, 7793] id: 284
        r0_284.MOVABLE.flag = r1_284
        r0_284.MOVABLE.PAR_MAX_X = r2_284
        r0_284.MOVABLE.PAR_MAX_Y = r3_284
        r0_284.MOVABLE.PSIZE_X = r4_284
        r0_284.MOVABLE.PSIZE_Y = r5_284
        r0_284.MOVABLE.MIN_W = r6_284
        r0_284.MOVABLE.MIN_H = r7_284
        r0_284:bt_SetEventWParam(r4_284)
        r0_284:bt_SetEventHParam(r5_284)
        r0_284.MOVABLE.PAR_X = 0
        r0_284.MOVABLE.PAR_Y = 0
      end
      function r2_283.bt_SetMoveRangeRect(r0_285, r1_285, r2_285, r3_285, r4_285)
        -- line: [7796, 7801] id: 285
        r0_285.MOVERANGE.x = r1_285
        r0_285.MOVERANGE.y = r2_285
        r0_285.MOVERANGE.w = r3_285
        r0_285.MOVERANGE.h = r4_285
      end
      function r2_283.bt_SetMoveRangeRectLayer(r0_286, r1_286)
        -- line: [7803, 7810] id: 286
        cclass.lua_Layers:create():initSubLayer(r0_286.layerset, r0_286.layerkey, r1_286, 0)
        local r3_286 = 0
        local r4_286 = 0
        local r5_286 = 0
        local r6_286 = 0
        r3_286, r4_286, r5_286, r6_286 = r0_286:bt_GetLayerRect(r0_286.layerkey, r1_286)
        r0_286:bt_SetMoveRangeRect(r3_286, r4_286, r5_286, r6_286)
      end
      function r2_283.bt_GetMoveRangeRectW(r0_287)
        -- line: [7813, 7815] id: 287
        return r0_287.MOVERANGE.w - r0_287.MOVERANGE.x
      end
      function r2_283.bt_GetMoveRangeRectH(r0_288)
        -- line: [7816, 7818] id: 288
        return r0_288.MOVERANGE.h - r0_288.MOVERANGE.y
      end
      function r2_283.bt_MovableStart(r0_289, r1_289, r2_289)
        -- line: [7822, 7838] id: 289
        if r0_289.MOVABLE.flag == false then
          return 
        end
        r0_289.MOVABLE.DRAGST_X = r1_289
        r0_289.MOVABLE.DRAGST_Y = r2_289
        r0_289.MOVABLE.BT_X = r0_289.DRAW_POS.x
        r0_289.MOVABLE.BT_Y = r0_289.DRAW_POS.y
      end
      function r2_283.bt_MovableControl(r0_290, r1_290, r2_290)
        -- line: [7840, 7865] id: 290
        if r0_290.MOVABLE.flag == false then
          return false
        end
        local r3_290 = 0
        local r4_290 = 0
        if r0_290.EVRANGE.x <= r1_290 and r1_290 < r0_290.EVRANGE.w and r0_290.EVRANGE.y <= r2_290 and r2_290 < r0_290.EVRANGE.h then
          r3_290 = r0_290.MOVABLE.BT_X + r1_290 - r0_290.MOVABLE.DRAGST_X
          r4_290 = r0_290.MOVABLE.BT_Y + r2_290 - r0_290.MOVABLE.DRAGST_Y
          r3_290, r4_290 = r0_290:bt_MovableSetRange(r3_290, r4_290)
        else
          r3_290 = r0_290.MOVABLE.BT_X
          r4_290 = r0_290.MOVABLE.BT_Y
        end
        if r0_290.DRAW_POS.x ~= r3_290 or r0_290.DRAW_POS.y ~= r4_290 then
          r0_290:bt_SetPos(r3_290, r4_290)
          r0_290:bt_MoveCalc()
        end
        return true
      end
      function r2_283.bt_MovableCorrect(r0_291)
        -- line: [7868, 7883] id: 291
        if r0_291.MOVABLE.flag == false then
          return 
        end
        local r2_291 = r0_291.MOVABLE.PSIZE_Y
        r0_291:bt_SetEventWParam(r0_291.MOVABLE.PSIZE_X)
        r0_291:bt_SetEventHParam(r2_291)
        r0_291:bt_SetMovableMove_XParam(r0_291.MOVABLE.PAR_X)
        r0_291:bt_SetMovableMove_YParam(r0_291.MOVABLE.PAR_Y)
        r0_291.DRAW_POS.x, r0_291.DRAW_POS.y = r0_291:bt_MovableSetRange(r0_291.DRAW_POS.x, r0_291.DRAW_POS.y)
      end
      function r2_283.bt_MovableSetRange(r0_292, r1_292, r2_292)
        -- line: [7886, 7916] id: 292
        local r3_292 = r1_292
        local r4_292 = r2_292
        if r3_292 < r0_292.MOVERANGE.x then
          r3_292 = r0_292.MOVERANGE.x
        end
        if r4_292 < r0_292.MOVERANGE.y then
          r4_292 = r0_292.MOVERANGE.y
        end
        local r5_292 = r0_292.MOVERANGE.w - r0_292.EVENT_RECT.w
        if r5_292 <= r3_292 then
          r3_292 = r5_292
        end
        local r6_292 = r0_292.MOVERANGE.h - r0_292.EVENT_RECT.h
        if r6_292 <= r4_292 then
          r4_292 = r6_292
        end
        return r3_292, r4_292
      end
      function r2_283.bt_MoveCalc(r0_293)
        -- line: [7920, 7956] id: 293
        local r1_293 = r0_293:bt_GetMoveRangeParamX()
        local r2_293 = r0_293:bt_GetMoveRangeParamY()
        r0_293.MOVABLE.MAX_X = r0_293:bt_GetMoveRangeX()
        r0_293.MOVABLE.MAX_Y = r0_293:bt_GetMoveRangeY()
        if r0_293.MOVABLE.MAX_X == 0 then
          r0_293.MOVABLE.PAR_X = 0
        else
          r0_293.MOVABLE.PAR_X = (r0_293.DRAW_POS.x - r0_293.initpos.x + r0_293.MOVABLE.MAX_X / r1_293 / 2) * r1_293 / r0_293.MOVABLE.MAX_X
          r0_293.MOVABLE.PAR_X = math.floor(r0_293.MOVABLE.PAR_X)
          if r0_293.MOVABLE.PAR_X < 0 then
            r0_293.MOVABLE.PAR_X = 0
          end
        end
        if r0_293.MOVABLE.MAX_Y == 0 then
          r0_293.MOVABLE.PAR_Y = 0
        else
          r0_293.MOVABLE.PAR_Y = (r0_293.DRAW_POS.y - r0_293.initpos.y + r0_293.MOVABLE.MAX_Y / r2_293 / 2) * r2_293 / r0_293.MOVABLE.MAX_Y
          r0_293.MOVABLE.PAR_Y = math.floor(r0_293.MOVABLE.PAR_Y)
          if r0_293.MOVABLE.PAR_Y < 0 then
            r0_293.MOVABLE.PAR_Y = 0
          end
        end
      end
      function r2_283.bt_SetSlidebarPos(r0_294)
        -- line: [7959, 7963] id: 294
        r0_294:bt_MovableCorrect()
        local r1_294 = cclass.lua_Layers:create()
        r0_294:bt_SetPos(r0_294.DRAW_POS.x, r0_294.DRAW_POS.y)
      end
      function r2_283.bt_SetParamX(r0_295, r1_295)
        -- line: [7967, 7970] id: 295
        r0_295:bt_SetMovableMove_XParam(r1_295)
        r0_295:bt_SetSlidebarPos()
      end
      function r2_283.bt_SetParamY(r0_296, r1_296)
        -- line: [7971, 7974] id: 296
        r0_296:bt_SetMovableMove_YParam(r1_296)
        r0_296:bt_SetSlidebarPos()
      end
      function r2_283.bt_GetParamX(r0_297)
        -- line: [7977, 7980] id: 297
        r0_297:bt_MoveCalc()
        return r0_297.MOVABLE.PAR_X
      end
      function r2_283.bt_GetParamY(r0_298)
        -- line: [7981, 7984] id: 298
        r0_298:bt_MoveCalc()
        return r0_298.MOVABLE.PAR_Y
      end
      function r2_283.bt_SetEventWParam(r0_299, r1_299)
        -- line: [7987, 8001] id: 299
        r0_299.MOVABLE.PSIZE_X = r1_299
        if r0_299.MOVABLE.PAR_MAX_X ~= 0 and r0_299.MOVABLE.PSIZE_X ~= 0 and r0_299.MOVABLE.MIN_W ~= 0 then
          local r2_299 = 0
          r2_299 = r0_299:bt_GetMoveRangeRectW() * r0_299.MOVABLE.PSIZE_X / r0_299.MOVABLE.PAR_MAX_X
          if r2_299 < r0_299.MOVABLE.MIN_W then
            r2_299 = r0_299.MOVABLE.MIN_W
          end
          r0_299.EVENT_RECT.w = math.floor(r2_299)
        end
      end
      function r2_283.bt_SetEventHParam(r0_300, r1_300)
        -- line: [8002, 8017] id: 300
        r0_300.MOVABLE.PSIZE_Y = r1_300
        if r0_300.MOVABLE.PAR_MAX_Y ~= 0 and r0_300.MOVABLE.PSIZE_Y ~= 0 and r0_300.MOVABLE.MIN_H ~= 0 then
          local r2_300 = 0
          r2_300 = r0_300:bt_GetMoveRangeRectH() * r0_300.MOVABLE.PSIZE_Y / r0_300.MOVABLE.PAR_MAX_Y
          if r2_300 < r0_300.MOVABLE.MIN_H then
            r2_300 = r0_300.MOVABLE.MIN_H
          end
          r0_300.EVENT_RECT.h = math.floor(r2_300)
        end
      end
      function r2_283.bt_SetMovableMove_X(r0_301, r1_301)
        -- line: [8021, 8023] id: 301
        r0_301.DRAW_POS.x = r1_301 + r0_301.MOVERANGE.x
      end
      function r2_283.bt_SetMovableMove_Y(r0_302, r1_302)
        -- line: [8024, 8026] id: 302
        r0_302.DRAW_POS.y = r1_302 + r0_302.MOVERANGE.y
      end
      function r2_283.bt_SetMovableMove_XParam(r0_303, r1_303)
        -- line: [8030, 8049] id: 303
        local r3_303 = r0_303:bt_GetMoveRangeParamX()
        if r3_303 < r1_303 then
          r1_303 = r3_303
        end
        r0_303.MOVABLE.PAR_X = r1_303
        r0_303.MOVABLE.MAX_X = r0_303:bt_GetMoveRangeX()
        local r2_303 = nil	-- notice: implicit variable refs by block#[6]
        if r3_303 > 0 then
          r2_303 = math.ceil(r0_303.MOVABLE.PAR_X * r0_303.MOVABLE.MAX_X / r3_303)
          if r0_303.MOVABLE.MAX_X < r2_303 then
            r2_303 = r0_303.MOVABLE.MAX_X
          end
        else
          r2_303 = 0
        end
        r0_303:bt_SetMovableMove_X(r2_303)
      end
      function r2_283.bt_SetMovableMove_YParam(r0_304, r1_304)
        -- line: [8050, 8070] id: 304
        r0_304.MOVABLE.PAR_Y = r1_304
        local r2_304 = nil
        local r3_304 = r0_304:bt_GetMoveRangeParamY()
        if r3_304 < r1_304 then
          r1_304 = r3_304
        end
        r0_304.MOVABLE.PAR_Y = r1_304
        r0_304.MOVABLE.MAX_Y = r0_304:bt_GetMoveRangeY()
        if r3_304 > 0 then
          r2_304 = math.ceil(r0_304.MOVABLE.PAR_Y * r0_304.MOVABLE.MAX_Y / r3_304)
          if r0_304.MOVABLE.MAX_Y < r2_304 then
            r2_304 = r0_304.MOVABLE.MAX_Y
          end
        else
          r2_304 = 0
        end
        r0_304:bt_SetMovableMove_Y(r2_304)
      end
      function r2_283.bt_GetMoveRangeX(r0_305)
        -- line: [8073, 8080] id: 305
        local r1_305 = r0_305:bt_GetMoveRangeRectW() - r0_305.EVENT_RECT.w
        if r1_305 < 0 then
          r1_305 = 0
        end
        return r1_305
      end
      function r2_283.bt_GetMoveRangeY(r0_306)
        -- line: [8081, 8089] id: 306
        local r1_306 = r0_306:bt_GetMoveRangeRectH() - r0_306.EVENT_RECT.h
        if r1_306 < 0 then
          r1_306 = 0
        end
        return r1_306
      end
      function r2_283.bt_GetMoveRangeParamX(r0_307)
        -- line: [8091, 8098] id: 307
        local r1_307 = r0_307.MOVABLE.PAR_MAX_X - r0_307.MOVABLE.PSIZE_X
        if r1_307 < 0 then
          r1_307 = 0
        end
        return r1_307
      end
      function r2_283.bt_GetMoveRangeParamY(r0_308)
        -- line: [8099, 8106] id: 308
        local r1_308 = r0_308.MOVABLE.PAR_MAX_Y - r0_308.MOVABLE.PSIZE_Y
        if r1_308 < 0 then
          r1_308 = 0
        end
        return r1_308
      end
      function r2_283.bt_SetEventRangeRect(r0_309, r1_309, r2_309, r3_309, r4_309)
        -- line: [8108, 8113] id: 309
        r0_309.EVRANGE.x = r1_309
        r0_309.EVRANGE.y = r2_309
        r0_309.EVRANGE.w = r3_309
        r0_309.EVRANGE.h = r4_309
      end
      function r2_283.bt_SetEventRangeRectLayer(r0_310, r1_310)
        -- line: [8115, 8122] id: 310
        cclass.lua_Layers:create():initSubLayer(r0_310.layerset, r0_310.layerkey, r1_310, 0)
        local r3_310 = 0
        local r4_310 = 0
        local r5_310 = 0
        local r6_310 = 0
        r3_310, r4_310, r5_310, r6_310 = r0_310:bt_GetLayerRect(r0_310.layerkey, r1_310)
        r0_310:bt_SetEventRangeRect(r3_310, r4_310, r5_310, r6_310)
      end
      return r2_283
    end,
    SlidebarY = function(r0_311, r1_311, r2_311, r3_311)
      -- line: [8130, 8238] id: 311
      local r4_311 = r0_311:Movable(r3_311)
      r4_311:bt_addLayer("bar", r1_311)
      r4_311:bt_addLayer("bot", r2_311)
      function r4_311.bt_SlidebarYInit(r0_312, r1_312, r2_312, r3_312, r4_312, r5_312)
        -- line: [8138, 8147] id: 312
        r0_312:bt_SetMoveRangeRectLayer(r4_312)
        r0_312:bt_SetEventRangeRectLayer(r5_312)
        r0_312:bt_SetMovableInit(true, 0, r1_312, 0, r2_312, 0, r3_312)
        r0_312:bt_SetSlidebarPos()
      end
      function r4_311.bt_MovableControl(r0_313, r1_313, r2_313)
        -- line: [8150, 8186] id: 313
        if r0_313.MOVABLE.flag == false then
          return false
        end
        local r3_313 = 0
        local r4_313 = 0
        if r0_313.EVRANGE.x <= r1_313 and r1_313 < r0_313.EVRANGE.w and r0_313.EVRANGE.y <= r2_313 and r2_313 < r0_313.EVRANGE.h then
          r3_313 = r0_313.MOVABLE.BT_X + r1_313 - r0_313.MOVABLE.DRAGST_X
          r4_313 = r0_313.MOVABLE.BT_Y + r2_313 - r0_313.MOVABLE.DRAGST_Y
          r3_313, r4_313 = r0_313:bt_MovableSetRange(r3_313, r4_313)
        else
          r3_313 = r0_313.MOVABLE.BT_X
          r4_313 = r0_313.MOVABLE.BT_Y
        end
        if r0_313.DRAW_POS.x ~= r3_313 or r0_313.DRAW_POS.y ~= r4_313 then
          r0_313.DRAW_POS.x = r3_313
          r0_313.DRAW_POS.y = r4_313
          local r5_313 = cclass.lua_Layers:create()
          r5_313:setSubLayerParam(r0_313.layerset, r0_313.layerkey, r0_313.SubLayer.bar.no, LUA_PARAM_POS, r3_313, r4_313, 0, 0)
          r5_313:setSubLayerParam(r0_313.layerset, r0_313.layerkey, r0_313.SubLayer.bot.no, LUA_PARAM_POS, r3_313, r4_313 + r0_313.EVENT_RECT.h - 10, 0, 0)
          r0_313:bt_MoveCalc()
        end
        return true
      end
      function r4_311.bt_SetActive(r0_314, r1_314)
        -- line: [8189, 8212] id: 314
        local r2_314 = cclass.lua_Layers:create()
        for r6_314, r7_314 in pairs(r0_314.SubLayer) do
          if r7_314.no ~= -1 then
            if r1_314 == 0 then
              if r7_314.no == r0_314.SubLayer.bar.no or r7_314.no == r0_314.SubLayer.bot.no then
                r0_314:bt_SetEnableSubLayer(r7_314, true)
              else
                r0_314:bt_SetEnableSubLayer(r7_314, false)
              end
            else
              r0_314:bt_SetEnableSubLayer(r7_314, false)
            end
          end
        end
        r0_314.active = r1_314
      end
      function r4_311.bt_SetSlidebarPos(r0_315)
        -- line: [8216, 8233] id: 315
        r0_315:bt_MovableCorrect()
        local r1_315 = cclass.lua_Layers:create()
        local r2_315 = {
          x = 0,
          y = 0,
        }
        r2_315.x = r0_315.DRAW_POS.x
        r2_315.y = r0_315.DRAW_POS.y
        r1_315:setSubLayerParam(r0_315.layerset, r0_315.layerkey, r0_315.SubLayer.bar.no, LUA_PARAM_POS, r2_315.x, r2_315.y, 0, 0)
        local r3_315 = {
          w = 0,
          h = 0,
        }
        r3_315.w = r0_315.EVENT_RECT.w
        r3_315.h = r0_315.EVENT_RECT.h - 10
        r1_315:setSubLayerParam(r0_315.layerset, r0_315.layerkey, r0_315.SubLayer.bar.no, LUA_PARAM_RECT, 0, 0, r3_315.w, r3_315.h)
        r2_315.x = r0_315.DRAW_POS.x
        r2_315.y = r0_315.DRAW_POS.y + r0_315.EVENT_RECT.h - 10
        r1_315:setSubLayerParam(r0_315.layerset, r0_315.layerkey, r0_315.SubLayer.bot.no, LUA_PARAM_POS, r2_315.x, r2_315.y, 0, 0)
      end
      return r4_311
    end,
  }
  return r1_239
end
NudeMenuItem = {}
function NudeMenuItem.new(r0_316, r1_316)
  -- line: [8250, 8322] id: 316
  return {
    layerset = r0_316,
    layerkey = r1_316,
    Layer = {},
    actKey = -2,
    addLayer = function(r0_317, r1_317, r2_317)
      -- line: [8260, 8273] id: 317
      local r3_317 = 0
      local r4_317 = 0
      local r5_317 = 0
      local r6_317 = 0
      local r7_317 = 0
      local r8_317 = 0
      local r9_317 = 0
      local r10_317 = 0
      if r2_317 >= 0 then
        local r11_317 = cclass.lua_Layers:create()
        r11_317:initSubLayer(r0_317.layerset, r0_317.layerkey, r2_317, 1)
        r3_317, r4_317, r5_317, r6_317 = r11_317:getSubLayerParam(r0_317.layerset, r0_317.layerkey, r2_317, LUA_PARAM_COLOR, r3_317, r4_317, r5_317, r6_317)
        r7_317, r8_317, r9_317, r10_317 = r11_317:getSubLayerParam(r0_317.layerset, r0_317.layerkey, r2_317, LUA_PARAM_POS, r7_317, r8_317, r9_317, r10_317)
      end
      r0_317.Layer[r1_317] = {
        no = r2_317,
        x = r7_317,
        y = r8_317,
        r = r3_317,
        g = r4_317,
        b = r5_317,
        a = r6_317,
      }
    end,
    SetAct = function(r0_318, r1_318)
      -- line: [8277, 8296] id: 318
      if r0_318.actKey == r1_318 then
        return 
      end
      local r2_318 = cclass.lua_Layers:create()
      for r6_318, r7_318 in pairs(r0_318.Layer) do
        if r7_318.no ~= -1 then
          if r6_318 == r1_318 then
            r2_318:setSubLayerParam(r0_318.layerset, r0_318.layerkey, r7_318.no, LUA_PARAM_COLOR, r7_318.r, r7_318.g, r7_318.b, r7_318.a)
          else
            r2_318:setSubLayerParam(r0_318.layerset, r0_318.layerkey, r7_318.no, LUA_PARAM_COLOR, 0, 0, 0, 0)
          end
        end
      end
      r0_318.actKey = r1_318
    end,
    ReSet = function(r0_319)
      -- line: [8299, 8308] id: 319
      local r1_319 = cclass.lua_Layers:create()
      for r5_319, r6_319 in pairs(r0_319.Layer) do
        if r6_319.no ~= -1 then
          r1_319:setSubLayerParam(r0_319.layerset, r0_319.layerkey, r6_319.no, LUA_PARAM_COLOR, r6_319.r, r6_319.g, r6_319.b, r6_319.a)
        end
      end
      r0_319.actKey = -2
    end,
    SetPos = function(r0_320, r1_320, r2_320, r3_320)
      -- line: [8311, 8319] id: 320
      local r4_320 = cclass.lua_Layers:create()
      for r8_320, r9_320 in pairs(r0_320.Layer) do
        r9_320.movex = r2_320 + r9_320.x - r0_320.Layer[r1_320].x
        r9_320.movey = r3_320 + r9_320.y - r0_320.Layer[r1_320].y
        r4_320:setSubLayerParam(r0_320.layerset, r0_320.layerkey, r9_320.no, LUA_PARAM_POS, r9_320.movex, r9_320.movey, 0, 0)
      end
    end,
  }
end
MenuItem = {}
function MenuItem.new(r0_321, r1_321, r2_321, r3_321)
  -- line: [8326, 8335] id: 321
  local r4_321 = NudeMenuItem.new(r0_321, r1_321)
  r4_321:addLayer("def", r2_321)
  r4_321:addLayer("on", r3_321)
  r4_321:SetAct("def")
  return r4_321
end
function GetLayerRect(r0_322, r1_322, r2_322)
  -- line: [8339, 8352] id: 322
  local r3_322 = 0
  local r4_322 = 0
  local r5_322 = 0
  local r6_322 = 0
  local r7_322 = 0
  local r8_322 = 0
  local r9_322 = 0
  local r10_322 = 0
  if r1_322 ~= -1 and r2_322 ~= -1 then
    local r11_322 = cclass.lua_Layers:create()
    r7_322, r8_322, r9_322, r10_322 = r11_322:getSubLayerParam(r0_322, r1_322, r2_322, LUA_PARAM_POS, r7_322, r8_322, r9_322, r10_322)
    r3_322 = r7_322
    r4_322 = r8_322
    r7_322, r8_322, r9_322, r10_322 = r11_322:getSubLayerParam(r0_322, r1_322, r2_322, LUA_PARAM_SIZE, r7_322, r8_322, r9_322, r10_322)
    r5_322 = r7_322 + r3_322
    r6_322 = r8_322 + r4_322
  end
  return r3_322, r4_322, r5_322, r6_322
end
function SetAutoOncursor(r0_323, r1_323, r2_323, r3_323)
  -- line: [8355, 8365] id: 323
  local r4_323 = cclass.lua_Layers:create()
  local r5_323 = 0
  local r6_323 = 0
  local r7_323 = 0
  local r8_323 = 0
  r5_323, r6_323, r7_323, r8_323 = r4_323:getSubLayerParam(r0_323, r1_323, r2_323, LUA_PARAM_SIZE, r5_323, r6_323, r7_323, r8_323)
  local r9_323 = 0
  local r10_323 = 0
  r9_323, r10_323, r7_323, r8_323 = r4_323:getSubLayerParam(r0_323, r1_323, r2_323, LUA_PARAM_POS, r9_323, r10_323, r7_323, r8_323)
  SetAutoOncursorPos(r9_323 + r5_323 / 2, r10_323 + r6_323 / 2, r3_323)
end
function SetAutoOncursorPos(r0_324, r1_324, r2_324)
  -- line: [8368, 8373] id: 324
  local r3_324 = cclass.lua_AutoCursor:new()
  r3_324:AutoCursor(r0_324, r1_324, r2_324)
  r3_324:SetCursor(0)
  r3_324:delete()
end
g_TitleInit = false
function openTitle()
  -- line: [8383, 8864] id: 325
  g_TitleMenu = Menu.new("titleMenu")
  local r0_325 = cclass.lua_AutoCursor:new()
  r0_325:SetCursor(3)
  r0_325:delete()
  function g_TitleMenu.MenuInit(r0_326)
    -- line: [8393, 8415] id: 326
    local r1_326 = true
    r0_326.MenuInf.enabled = false
    r0_326.MenuInf.effect = false
    if cclass.lua_Layers:create():add(r0_326.MenuInf.SetName) == false then
      return false
    end
    r0_326.MenuButton = Button.new(r0_326.MenuInf.SetName)
    r0_326.MenuButton:InitList()
    r0_326.MenuButtonData = {}
    return r1_326
  end
  function g_TitleMenu.MenuEffectTransJob(r0_327)
    -- line: [8417, 8426] id: 327
    local r1_327 = cclass.lua_Layers:create()
    if r0_327.MenuInf.enabled == true then
      return r1_327:isEffect(r0_327.MenuInf.SetName, "TitleDisp")
    else
      return r1_327:isTransition(r0_327.MenuInf.SetName)
    end
  end
  function g_TitleMenu.MenuEffectEndJob(r0_328)
    -- line: [8428, 8474] id: 328
    local r1_328 = cclass.lua_Layers:create()
    if r0_328.MenuInf.enabled == true then
      r0_328.MenuButton:ResetColor(r0_328.MenuButtonData)
      local r2_328 = 0
      local r3_328 = 0
      local r4_328 = cclass.lua_AutoCursor:new()
      r2_328, r3_328 = r4_328:GetCursorPos(r2_328, r3_328)
      r4_328:delete()
      r0_328.MenuButton:changeButton(r0_328.MenuInf.SetName, r1_328:getCursorPos(r0_328.MenuInf.SetName, r2_328, r3_328, 0) - 1, r2_328, r3_328)
      local r6_328 = 0
      if r0_328.MenuButton.selCursor ~= -1 then
        r6_328 = r0_328.MenuButton.selListKey[r0_328.MenuButton.selCursor].bt_l
      end
      r0_328:TitleSelCursor(r0_328.MenuButton.selCursor, r6_328, r2_328, r3_328)
      if g_TitleInit == false then
        playSystemVoice(SYSVOICE_TITLECALL)
      end
      g_TitleInit = true
    else
      r1_328:remove(r0_328.MenuInf.SetName)
      local r2_328 = cclass.lua_AutoCursor:new()
      r2_328:SetCursor(0)
      r2_328:delete()
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_328.MenuInf.ButtonLayer = ""
      r0_328.MenuInf.ButtonPna = ""
    end
  end
  function g_TitleMenu.MenuEffectStart(r0_329, r1_329, r2_329, r3_329)
    -- line: [8478, 8594] id: 329
    if r3_329 == 0 then
      local r4_329 = cclass.lua_Sounds:new()
      r4_329:BgmPlay("systembgm", getSoundArcFileName("BGM", ".ogg"), "BGM34.ogg", getSoundVolume("BGM"))
      cfunc.LegacyGame__lua_SetVariable(112, 30)
      r4_329:delete()
    end
    r0_329.MenuInf.effect = true
    r0_329.MenuInf.enabled = true
    local r4_329 = cclass.lua_Layers:create()
    local r5_329 = cclass.lua_MeasureTime:new()
    local r6_329 = getEffectRate()
    local r7_329 = r2_329 * r5_329:diff()
    r5_329:delete()
    r4_329:setVisible("titleMenu", "titleBack", 1)
    local r8_329 = 1800
    local r9_329 = r8_329 - 500
    local r10_329 = 300
    local r11_329 = 100
    local r12_329 = 200
    local r13_329 = 150
    if r3_329 == 0 then
      r4_329:setParam("titleMenu", "titleBack", LUA_PARAM_POS, 0, 0, 0, 0)
      r4_329:setEffect("titleMenu", "titleBack", "TitleDisp", LUA_EFFECT_POS, 0, -378, 0, 0, 2, r8_329 * r6_329, 0, 0)
    else
      r8_329 = 500
      r9_329 = 500
      r4_329:setParam("titleMenu", "titleBack", LUA_PARAM_POS, 0, -378, 0, 0)
    end
    r4_329:setParam("titleMenu", "titleBack", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_329:setEffect("titleMenu", "titleBack", "TitleDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r8_329 * r6_329, 0, 0)
    r4_329:startEffect("titleMenu", "titleBack", "TitleDisp", 0)
    r4_329:setVisible("titleMenu", "titleBase01", 1)
    r4_329:setSubLayerVisible("titleMenu", "titleBase01", 1, 1)
    r4_329:setSubLayerParam("titleMenu", "titleBase01", 1, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_329:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", 1, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 500 * r6_329, 0, r9_329 * r6_329)
    r4_329:startSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", 1, 0)
    r0_329.MenuButton:SetColor(r0_329.MenuButtonData, 1, 1, 1, 0)
    r0_329.EffectButtonKeyList = {}
    local r14_329 = 0
    local function r15_329(r0_330, r1_330, r2_330)
      -- line: [8541, 8548] id: 330
      local r3_330 = {
        key = r0_330,
        x = r1_330,
        y = r2_330,
      }
      r14_329 = r14_329 + 1
      r0_329.EffectButtonKeyList[r14_329] = r3_330
    end
    local r16_329 = r9_329
    local r17_329 = -1
    local r18_329 = 0
    local r19_329 = 0
    local r20_329 = 0
    local r21_329 = 0
    for r25_329 = 1, 5, 1 do
      r17_329 = r0_329.MenuButtonData[r0_329:GetButtonName(r25_329)]:bt_getNowKey()
      r18_329, r19_329, r20_329, r21_329 = r4_329:getSubLayerParam("titleMenu", "titleBase01", r17_329, LUA_PARAM_POS, r18_329, r19_329, r20_329, r21_329)
      r4_329:setSubLayerParam("titleMenu", "titleBase01", r17_329, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_329:setSubLayerParam("titleMenu", "titleBase01", r17_329, LUA_PARAM_POS, r18_329 - 100, r19_329 + 25, r20_329, r21_329)
      r4_329:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r17_329, LUA_EFFECT_POS, 100, -25, 0, 0, 3, r10_329 * r6_329, 0, r16_329 * r6_329)
      r4_329:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r17_329, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r10_329 * r6_329, 0, r16_329 * r6_329)
      r4_329:startSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r17_329, 0)
      r15_329(r17_329, r18_329, r19_329)
      if r0_329.TitleItem[r0_329:GetButtonName(r25_329)].Active == 0 then
        r17_329 = r0_329.TitleItem[r0_329:GetButtonName(r25_329)].Layer.def.no
      else
        r17_329 = r0_329.TitleItem[r0_329:GetButtonName(r25_329)].Layer.dis.no
      end
      r18_329, r19_329, r20_329, r21_329 = r4_329:getSubLayerParam("titleMenu", "titleBase01", r17_329, LUA_PARAM_POS, r18_329, r19_329, r20_329, r21_329)
      r4_329:setSubLayerParam("titleMenu", "titleBase01", r17_329, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_329:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r17_329, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r11_329 * r6_329, 0, (r16_329 + r10_329) * r6_329)
      r4_329:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r17_329, LUA_EFFECT_SCALE, 0.3, 0.3, 0, 0, 0, r11_329 * r6_329, 0, (r16_329 + r10_329) * r6_329)
      r4_329:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r17_329, LUA_EFFECT_SCALE, -0.3, -0.3, 0, 0, 0, r12_329 * r6_329, 0, 0)
      r4_329:startSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r17_329, 0)
      r16_329 = r16_329 + r13_329
      r15_329(r17_329, r18_329, r19_329)
    end
    r4_329:setSubLayerVisible("titleMenu", "titleBase01", 2, 1)
    r4_329:setSubLayerParam("titleMenu", "titleBase01", 2, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_329:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", 2, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 500 * r6_329, 0, r16_329 * r6_329)
    r4_329:startSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", 2, 0)
  end
  g_TitleMenu.EffectButtonKeyList = {}
  function g_TitleMenu.CancelMenuEffect(r0_331)
    -- line: [8598, 8633] id: 331
    if r0_331.MenuInf.effect == true and r0_331.MenuInf.enabled == true then
      local r1_331 = cclass.lua_Layers:create()
      r1_331:cancelEffect("titleMenu", "titleBase01", "TitleDisp")
      r1_331:cancelSubLayerEffect("titleMenu", "titleBase01", 1, "TitleDisp")
      r1_331:cancelSubLayerEffect("titleMenu", "titleBase01", 2, "TitleDisp")
      for r5_331, r6_331 in pairs(r0_331.EffectButtonKeyList) do
        r1_331:cancelSubLayerEffect("titleMenu", "titleBase01", r6_331.key, "TitleDisp")
        r1_331:setSubLayerParam("titleMenu", "titleBase01", r6_331.key, LUA_PARAM_POS, r6_331.x, r6_331.y, 1, 1)
        r1_331:setSubLayerParam("titleMenu", "titleBase01", r6_331.key, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r1_331:setSubLayerParam("titleMenu", "titleBase01", r6_331.key, LUA_PARAM_SCALE, 1, 1, 1, 0)
      end
      r1_331:setSubLayerParam("titleMenu", "titleBase01", 1, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_331:setSubLayerParam("titleMenu", "titleBase01", 2, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_331:cancelEffect("titleMenu", "titleBack", "TitleDisp")
      r1_331:setParam("titleMenu", "titleBack", LUA_PARAM_POS, 0, -378, 0, 0)
      r1_331:setParam("titleMenu", "titleBack", LUA_PARAM_COLOR, 1, 1, 1, 1)
    end
  end
  function g_TitleMenu.MenuButtonJob(r0_332, r1_332, r2_332)
    -- line: [8637, 8684] id: 332
    if r1_332 ~= 0 and r2_332 == "LD" then
      local r3_332 = cclass.lua_Layers:create()
      r3_332:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_332)
      if r1_332 == 104 then
        r3_332:removeSnap("system")
        playSystemVoice(0)
        playSystemVoice(SYSVOICE_END)
        r0_332:MenuEffectEnd(0)
        local r4_332 = cclass.lua_Sounds:new()
        r4_332:BgmStop("systembgm", 500)
        r4_332:delete()
        g_menuExecute = false
      else
        if r1_332 == 100 then
        end
        if r1_332 == 103 then
        end
        r3_332:rtSnap("system")
      end
      r0_332.MenuInf.enabled = false
      r0_332.MenuInf.effect = true
    end
    if r2_332 == "LD" then
      r0_332:CancelMenuEffect()
    end
  end
  function g_TitleMenu.MenuKeyDown(r0_333, r1_333, r2_333, r3_333, r4_333)
    -- line: [8687, 8691] id: 333
    if r4_333 == true then
      return ret_flag
    end
  end
  g_TitleMenu.defaultMenuMouseMove = g_TitleMenu.MenuMouseMove
  function g_TitleMenu.MenuMouseMove(r0_334, r1_334, r2_334, r3_334, r4_334, r5_334, r6_334)
    -- line: [8696, 8706] id: 334
    r0_334:defaultMenuMouseMove(r1_334, r2_334, r3_334, r4_334, r5_334, r6_334)
    local r7_334 = 0
    if r0_334.MenuButton.selCursor ~= -1 then
      r7_334 = r0_334.MenuButton.selListKey[r0_334.MenuButton.selCursor].bt_l
    end
    r0_334:TitleSelCursor(r0_334.MenuButton.selCursor, r7_334, r4_334, r5_334)
  end
  g_TitleMenu.TitleItem = {}
  function g_TitleMenu.ItemSetInit(r0_335)
    -- line: [8712, 8717] id: 335
    return {
      selCursor_Item = -1,
      selCursor_selName = -1,
    }
  end
  function g_TitleMenu.ItemSet(r0_336, r1_336, r2_336, r3_336)
    -- line: [8720, 8748] id: 336
    if r1_336.selCursor_selName ~= r3_336 then
      local r4_336 = cclass.lua_Layers:create()
      if r1_336.selCursor_Item ~= -1 then
        r4_336:cancelSubLayerEffect("titleMenu", "titleBase01", r1_336.selCursor_Item.Layer.on.no, "TitleOn")
        r4_336:setSubLayerParam("titleMenu", "titleBase01", r1_336.selCursor_Item.Layer.on.no, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r1_336.selCursor_Item:SetAct("def")
        r1_336.selCursor_Item = -1
      end
      if r3_336 ~= -1 then
        r1_336.selCursor_Item = r1_336[r3_336]
        r1_336.selCursor_Item:SetAct("on")
        r4_336:cancelSubLayerEffect("titleMenu", "titleBase01", r1_336.selCursor_Item.Layer.on.no, "TitleOn")
        r4_336:setSubLayerEffect("titleMenu", "titleBase01", "TitleOn", r1_336.selCursor_Item.Layer.on.no, LUA_EFFECT_SCALE, 0.05, 0.05, 0, 0, 0, 300, 0, 100)
        r4_336:setSubLayerEffect("titleMenu", "titleBase01", "TitleOn", r1_336.selCursor_Item.Layer.on.no, LUA_EFFECT_SCALE, -0.05, -0.05, 0, 0, 0, 300, 0, 0)
        r4_336:startSubLayerEffect("titleMenu", "titleBase01", "TitleOn", r1_336.selCursor_Item.Layer.on.no, -1)
      end
    end
    r1_336.selCursor_selName = r2_336
  end
  function g_TitleMenu.MenuItemTitle(r0_337, r1_337, r2_337, r3_337, r4_337, r5_337)
    -- line: [8749, 8759] id: 337
    local r6_337 = NudeMenuItem.new(r1_337, r2_337)
    r6_337:addLayer("def", r3_337)
    r6_337:addLayer("on", r4_337)
    r6_337:addLayer("dis", r5_337)
    r6_337:addLayer("erase", -1)
    r6_337:SetAct("erase")
    r6_337.Active = 0
    return r6_337
  end
  function g_TitleMenu.GetButtonName(r0_338, r1_338)
    -- line: [8761, 8764] id: 338
    return ({
      "start",
      "load",
      "config",
      "gallery",
      "exit"
    })[r1_338]
  end
  function g_TitleMenu.TitleMenuInit(r0_339)
    -- line: [8766, 8819] id: 339
    local r1_339 = r0_339:MenuInit("titleBase01", "SYS_FDTitle.pna")
    if res == false then
      return false
    end
    local r2_339 = cclass.lua_Layers:create()
    r0_339:MenuLoadLayer("titleBack", "bg01_01s.png")
    r2_339:setVisible("titleMenu", "titleBack", 1)
    r0_339:MenuLoadLayer("titleBase01", "SYS_FDTitle.pna")
    r2_339:initSubLayer("titleMenu", "titleBase01", 1, 0)
    r2_339:initSubLayer("titleMenu", "titleBase01", 2, 0)
    r0_339.TitleItem = r0_339:ItemSetInit()
    for r6_339 = 1, 5, 1 do
      local r7_339 = 19 + (r6_339 - 1) * 2
      r0_339:MenuButtonSet(r0_339.MenuButtonData, r0_339:GetButtonName(r6_339), 0, "titleBase01", r7_339, r7_339, 7 + (r6_339 - 1) * 2, -1, 31 + (r6_339 - 1) * 2, 100 + r6_339 - 1, 0, 0)
      r0_339.TitleItem[r0_339:GetButtonName(r6_339)] = r0_339:MenuItemTitle("titleMenu", "titleBase01", 18 + (r6_339 - 1) * 2, 6 + (r6_339 - 1) * 2, 30 + (r6_339 - 1) * 2)
    end
    r0_339:MenuButtonInit()
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
      r0_339.MenuButtonData.load:bt_SetActive(2)
      r0_339.TitleItem.load.Active = 2
    end
  end
  function g_TitleMenu.TitleSelCursor(r0_340, r1_340, r2_340, r3_340, r4_340)
    -- line: [8822, 8834] id: 340
    if r1_340 == -1 then
      r0_340:ItemSet(r0_340.TitleItem, -1, -1)
    elseif 100 <= r2_340 and r2_340 <= 105 then
      r0_340:ItemSet(r0_340.TitleItem, r1_340, r0_340:GetButtonName(r2_340 - 100 + 1))
    else
      r0_340:ItemSet(r0_340.TitleItem, -1, -1)
    end
  end
  g_TitleMenu:TitleMenuInit()
  local r1_325 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r1_325:setSnap("system", true)
    r1_325:copySnap("titleMenu", "system")
    g_TitleMenu:MenuEffectStart(0, 0, 0)
  else
    r1_325:copySnap("titleMenu", "system")
    g_TitleMenu:MenuEffectStart(0, 0, 1)
  end
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
g_GalleryMenu = nil
g_GalleryPage = 1
g_GalleryCgPage = 1
g_GalleryScenePage = 1
g_GalleryBgmPage = 1
g_GalleryCgPageMax = 9
g_GalleryScenePageMax = 2
g_GalleryCgThMax = 2
g_GallerySceneThMax = 1
function openGallery(r0_341, r1_341)
  -- line: [8889, 11873] id: 341
  g_GalleryMenu = Menu.new("GalleryMenu")
  local r2_341 = g_GalleryMenu
  r2_341.retSetNameFlag = true
  function r2_341.retSetName(r0_342)
    -- line: [8897, 8903] id: 342
    if r0_342.retSetNameFlag == true then
      return r0_342.MenuInf.SetName
    else
      return "system"
    end
  end
  function r2_341.MenuInit(r0_343)
    -- line: [8909, 8954] id: 343
    local r1_343 = true
    r0_343.MenuInf.enabled = true
    r0_343.MenuInf.effect = true
    r0_343.MenuInf.ButtonLayer = ""
    r0_343.MenuInf.ButtonPna = ""
    if cclass.lua_Layers:create():add(r0_343.MenuInf.SetName) == false then
      return false
    end
    local r4_343 = cfunc.LegacyGame__lua_GetVariable(100)
    local r5_343 = cfunc.LegacyGame__lua_GetVariable(101)
    local r6_343 = cfunc.LegacyGame__lua_GetVariable(102)
    if r4_343 == 0 then
      g_GalleryCgPage = 1
    else
      g_GalleryCgPage = r4_343
    end
    if r5_343 == 0 then
      g_GalleryScenePage = 1
    else
      g_GalleryScenePage = r5_343
    end
    if r6_343 == 0 then
      g_GalleryBgmPage = 1
    else
      g_GalleryBgmPage = r6_343
    end
    r0_343.BGM_SoundNo = cfunc.LegacyGame__lua_GetVariable(112)
    r0_343.MenuButton = Button.new(r0_343.MenuInf.SetName)
    r0_343.MenuButton:InitList()
    r0_343.MenuButtonData = {}
    return r1_343
  end
  function r2_341.MenuButtonJob(r0_344, r1_344, r2_344)
    -- line: [8957, 9071] id: 344
    local r3_344 = cclass.lua_Layers:create()
    if g_GalleryPage == 4 and r2_344 == "LD" and r3_344:isVisible("GalleryMenu", "GalleryChara") == false then
      r0_344:GalleryCharaMenuClose(false)
    end
    if r1_344 ~= 0 and r2_344 == "LD" then
      if r1_344 == 1 then
        r0_344:initPageGallery(1, false)
      end
      if r1_344 == 2 then
        r0_344:initPageGallery(2, false)
      end
      if r1_344 == 3 then
        r0_344:initPageGallery(3, false)
      end
      if r1_344 == 4 then
        r0_344:initPageGallery(4, false)
      end
      if r1_344 == 10 then
        r0_344.BT_DataBace.stop:bt_SetActive(2)
        r0_344:GalleryBgmStop()
      end
      if r1_344 == 11 then
        r3_344:rtSnap("system")
        cfunc.LegacyGame__lua_SetVariable(99, 0)
        r0_344:closeGallery(0)
        r0_344:PlayTitleSound()
      end
      if r1_344 == 12 then
        r0_344.MenuButton.selDownCursor = -1
        r0_344.MenuButton.selDownKey = nil
        openConfirm(LUA_CONFIRM_QUIT)
      end
      if 101 <= r1_344 and r1_344 <= 112 then
        local r4_344 = r1_344 - 100
        if g_GalleryPage == 1 then
          r0_344:CGPageInit(r4_344, g_GalleryCgPage, false)
        end
        if g_GalleryPage == 2 then
          r0_344:ScenePageInit(r4_344, g_GalleryScenePage, false)
        end
        if g_GalleryPage == 3 then
          r0_344:BGMPageInit(r4_344, g_GalleryBgmPage, false)
        end
      end
      if 201 <= r1_344 and r1_344 <= 209 then
        local r4_344 = r1_344 - 200
        if g_GalleryPage == 1 then
          cfunc.LegacyGame__lua_SetVariable(99, 1)
          cfunc.LegacyGame__lua_SetVariable(105, r4_344)
          r0_344:closeGallery(0)
        end
        if g_GalleryPage == 2 then
          cfunc.LegacyGame__lua_SetVariable(99, 2)
          cfunc.LegacyGame__lua_SetVariable(110, r4_344)
          r0_344:closeGallery(2)
          r0_344:GalleryBgmStop()
          g_menuExecute = false
        end
      end
      if 301 <= r1_344 and r1_344 <= 333 then
        r0_344.MenuButton.selDownCursor = -1
        r0_344.MenuButton.selDownKey = nil
        r0_344:GallerySetBgmButton(r1_344 - 300)
      end
      if g_GalleryPage == 4 then
        r0_344:GalleryCharaLD(r1_344)
      end
    end
    if r2_344 == "RU" and r0_344:GetMenuMouseEnable() then
      local r4_344 = false
      if g_GalleryPage == 4 and r3_344:isVisible("GalleryMenu", "GalleryChara") == false then
        r0_344:GalleryCharaMenuClose(false)
        r4_344 = true
      end
      if r4_344 == false then
        cfunc.LegacyGame__lua_SetVariable(99, 0)
        r0_344:closeGallery(0)
        r0_344:PlayTitleSound()
      end
    end
  end
  r2_341.MenuInf.PageEffect = false
  r2_341.MenuInf.PageEffect2 = false
  r2_341.MenuInf.GalleryEff = false
  function r2_341.MenuEffect(r0_345)
    -- line: [9079, 9182] id: 345
    local r1_345 = false
    if r0_345.MenuInf.GalleryEff == true and cclass.lua_Layers:create():isEffect("GalleryMenu", "GalleryEff") == false then
      r0_345.MenuInf.GalleryEff = false
    end
    r1_345 = r0_345:MenuEffectTransJob()
    if r0_345.MenuInf.effect == true and r1_345 == false and r0_345.MenuInf.GalleryEff == false then
      r0_345:MenuEffectEndJob()
      r0_345.MenuInf.effect = false
    end
    if r0_345.MenuInf.PageEffect == true then
      local r2_345 = cclass.lua_Layers:create()
      ret = r2_345:isEffect("GalleryMenu", "GalleryPageEff")
      if ret == false then
        if r0_345.beforePage == 1 then
          r2_345:setSubLayerVisible("GalleryMenu", "GalleryBace", 1, 0)
          r2_345:removeLayer("GalleryMenu", "GalleryCg")
          r0_345:DeleteGalleryThumbnail(1, g_GalleryCgPage)
        end
        if r0_345.beforePage == 2 then
          r2_345:setSubLayerVisible("GalleryMenu", "GalleryBace", 2, 0)
          r2_345:removeLayer("GalleryMenu", "GalleryScene")
          r0_345:DeleteGalleryThumbnail(2, g_GalleryScenePage)
        end
        if r0_345.beforePage == 3 then
          r2_345:setSubLayerVisible("GalleryMenu", "GalleryBace", 3, 0)
          r2_345:removeLayer("GalleryMenu", "GalleryBgm")
        end
        if r0_345.beforePage == 4 then
          r2_345:setSubLayerVisible("GalleryMenu", "GalleryBace", 4, 0)
          r2_345:setSubLayerVisible("GalleryMenu", "GalleryBace", 49, 0)
          r2_345:setSubLayerVisible("GalleryMenu", "GalleryBace", 51, 0)
          r2_345:removeLayer("GalleryMenu", "GalleryChara")
        end
        if g_GalleryPage == 1 then
          r0_345.BT_DataBace.Scene:bt_SetPos(r0_345.CG_scene_pos.x, r0_345.CG_scene_pos.y)
          r0_345.BT_DataBace.BGM:bt_SetPos(r0_345.CG_bgm_pos.x, r0_345.CG_bgm_pos.y)
          r0_345.BT_DataBace.Chara:bt_SetPos(r0_345.CG_chara_pos.x, r0_345.CG_chara_pos.y)
        end
        if g_GalleryPage == 2 then
          r0_345.BT_DataBace.BGM:bt_SetPos(r0_345.Scene_bgm_pos.x, r0_345.Scene_bgm_pos.y)
          r0_345.BT_DataBace.Chara:bt_SetPos(r0_345.Scene_chara_pos.x, r0_345.Scene_chara_pos.y)
        end
        if g_GalleryPage == 3 then
          r0_345.BT_DataBace.Scene:bt_SetDefPos()
          r0_345.BT_DataBace.Chara:bt_SetPos(r0_345.Bgm_chara_pos.x, r0_345.Bgm_chara_pos.y)
        end
        if g_GalleryPage == 4 then
          r0_345.BT_DataBace.BGM:bt_SetDefPos()
          r0_345.BT_DataBace.Scene:bt_SetDefPos()
          r0_345.BT_DataBace.Chara:bt_SetDefPos()
        end
        r0_345.beforePage = 0
        local r3_345 = 0
        local r4_345 = 0
        local r5_345 = cclass.lua_AutoCursor:new()
        r3_345, r4_345 = r5_345:GetCursorPos(r3_345, r4_345)
        r5_345:delete()
        r0_345.MenuButton:changeButton(r0_345.MenuInf.SetName, r2_345:getCursorPos(r0_345.MenuInf.SetName, r3_345, r4_345, 0) - 1, r3_345, r4_345)
        r0_345.MenuInf.PageEffect = false
      end
    end
    if r0_345.MenuInf.PageEffect2 == true then
      local r2_345 = cclass.lua_Layers:create()
      ret = r2_345:isEffect("GalleryMenu", "GalleryPageEff2")
      if ret == false then
        local r3_345 = 0
        local r4_345 = 0
        local r5_345 = cclass.lua_AutoCursor:new()
        r3_345, r4_345 = r5_345:GetCursorPos(r3_345, r4_345)
        r5_345:delete()
        r0_345.MenuButton:changeButton(r0_345.MenuInf.SetName, r2_345:getCursorPos(r0_345.MenuInf.SetName, r3_345, r4_345, 0) - 1, r3_345, r4_345)
        r0_345.MenuInf.PageEffect2 = false
      end
    end
    return r1_345
  end
  function r2_341.MenuEffectEndJob(r0_346)
    -- line: [9184, 9210] id: 346
    local r1_346 = cclass.lua_Layers:create()
    if r0_346.MenuInf.enabled == true then
      local r2_346 = 0
      local r3_346 = 0
      local r4_346 = cclass.lua_AutoCursor:new()
      r2_346, r3_346 = r4_346:GetCursorPos(r2_346, r3_346)
      r4_346:delete()
      r0_346.MenuButton:changeButton(r0_346.MenuInf.SetName, r1_346:getCursorPos(r0_346.MenuInf.SetName, r2_346, r3_346, 0) - 1, r2_346, r3_346)
    else
      r1_346:remove(r0_346.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_346.MenuInf.ButtonLayer = ""
      r0_346.MenuInf.ButtonPna = ""
    end
  end
  function r2_341.MenuEffectStart(r0_347, r1_347, r2_347)
    -- line: [9212, 9222] id: 347
    local r3_347 = cclass.lua_Layers:create()
    local r4_347 = cclass.lua_MeasureTime:new()
    local r5_347 = getEffectRate()
    r3_347:startTransition(r0_347.MenuInf.SetName, 0, 1, r1_347 * r5_347, r2_347 * r4_347:diff() * r5_347, LUA_TRANSITION_NORMAL)
    r4_347:delete()
    r0_347.MenuInf.enabled = true
    r0_347.MenuInf.effect = true
  end
  function r2_341.GetMenuMouseEnable(r0_348)
    -- line: [9227, 9238] id: 348
    local r1_348 = false
    if r0_348.MenuInf.enabled == true and r0_348.MenuInf.effect == false and r0_348.MenuInf.PageEffect == false and r0_348.MenuInf.PageEffect2 == false and r0_348.MenuInf.GalleryEff == false and r0_348.MenuButton ~= nil then
      r1_348 = true
    end
    return r1_348
  end
  r2_341.defaultMenuMouseMove = r2_341.MenuMouseMove
  function r2_341.MenuMouseMove(r0_349, r1_349, r2_349, r3_349, r4_349, r5_349, r6_349)
    -- line: [9242, 9275] id: 349
    r0_349:defaultMenuMouseMove(r1_349, r2_349, r3_349, r4_349, r5_349, r6_349)
    local r7_349 = 0
    if r0_349.MenuButton.selCursor ~= -1 then
      r7_349 = r0_349.MenuButton.selListKey[r0_349.MenuButton.selCursor].bt_l
    end
    if g_GalleryPage == 1 or g_GalleryPage == 2 then
      local r8_349 = 0
      if 201 <= r7_349 and r7_349 <= 209 then
        r8_349 = r7_349 - 200
      end
      local r9_349 = 0
      if g_GalleryPage == 1 then
        r9_349 = g_GalleryCgPage
      end
      if g_GalleryPage == 2 then
        r9_349 = g_GalleryScenePage
      end
      r0_349:GalleryThumbnailOnOff(g_GalleryPage, r9_349, r8_349)
    end
    if g_GalleryPage == 4 then
      r0_349:GalleryCharaSelCursor(r0_349.MenuButton.selCursor, r7_349, r4_349, r5_349)
    end
  end
  function r2_341.MenuMouseWheel(r0_350, r1_350, r2_350)
    -- line: [9277, 9283] id: 350
    if r0_350:GetMenuMouseEnable() and g_GalleryPage == 4 and r2_350 ~= 0 then
      r0_350:GalleryCharaWheel(r2_350)
    end
  end
  function r2_341.GetCgThumbnailEnable(r0_351, r1_351, r2_351)
    -- line: [9290, 9302] id: 351
    if g_GalleryCgPageMax < r1_351 then
      return false
    end
    if r1_351 == g_GalleryCgPageMax and g_GalleryCgThMax < r2_351 then
      return false
    end
    return true
  end
  function r2_341.GetCgFlag(r0_352, r1_352, r2_352)
    -- line: [9304, 9407] id: 352
    local r3_352 = {
      AFT_01 = 1080,
      AFT_13 = 1081,
      AFT_02 = 1082,
      AFT_03 = 1083,
      AFT_07 = 1084,
      AFT_08 = 1085,
      AFT_11 = 1086,
      AFT_12 = 1087,
      AFT_14 = 1088,
      AFT_04 = 1089,
      AFT_05 = 1090,
      AFT_06 = 1091,
      AFT_09 = 1092,
      AFT_10 = 1093,
      BEF_01 = 1094,
      BEF_02 = 1095,
      BEF_05 = 1096,
      BEF_08 = 1097,
      BEF_09 = 1098,
      BEF_03 = 1099,
      BEF_04 = 1100,
      BEF_06 = 1101,
      BEF_07 = 1102,
      HOT_01 = 1103,
      HOT_02 = 1104,
      HOT_10 = 1105,
      HOT_03 = 1106,
      HOT_06 = 1107,
      HOT_09 = 1108,
      HOT_04 = 1109,
      HOT_05 = 1110,
      HOT_07 = 1111,
      HOT_08 = 1112,
      KAN_01 = 1113,
      KAN_02 = 1114,
      KAN_04 = 1115,
      KAN_03 = 1116,
      KAN_09 = 1117,
      KAN_05 = 1118,
      KAN_06 = 1119,
      KAN_07 = 1120,
      KAN_08 = 1121,
      HUS_03 = 1122,
      HUS_01 = 1123,
      HUS_02 = 1124,
      AGS_01 = 1125,
      AGS_02 = 1126,
      AGS_03 = 1127,
      NOV_01 = 1128,
      NOV_02 = 1129,
      COM_01 = 1130,
      KOT_00 = 1131,
      KOT_01 = 1132,
      KOT_11 = 1133,
      KOT_21 = 1134,
      AGE_16 = 1135,
      AMA_01 = 1136,
      AMA_08 = 1137,
      HUT_22 = 1138,
      FDSDEV01 = 1139,
      FDSDEV02 = 1140,
      FDSDEV03 = 1141,
      FDSDEV04 = 1142,
      FDSDEV05 = 1143,
      FDSDEV06 = 1144,
      FDSDEV07 = 1145,
      FDSDEV08 = 1146,
      FDSDEV09 = 1147,
      FDSDEV10 = 1148,
      FDSDEV11 = 1149,
      FDSDEV12 = 1150,
      FDSDEV13 = 1151,
      FDSDEV14 = 1152,
      FDSDEV15 = 1153,
    }
    local r4_352 = {
      {
        r3_352.AFT_01,
        r3_352.AFT_13,
        r3_352.AFT_02,
        r3_352.AFT_03,
        r3_352.AFT_07,
        r3_352.AFT_08,
        r3_352.AFT_11,
        r3_352.AFT_12,
        r3_352.AFT_14
      },
      {
        r3_352.AFT_04,
        r3_352.AFT_05,
        r3_352.AFT_06,
        r3_352.AFT_09,
        r3_352.AFT_10,
        r3_352.BEF_01,
        r3_352.BEF_02,
        r3_352.BEF_05,
        r3_352.BEF_08
      },
      {
        r3_352.BEF_09,
        r3_352.BEF_03,
        r3_352.BEF_04,
        r3_352.BEF_06,
        r3_352.BEF_07,
        r3_352.HOT_01,
        r3_352.HOT_02,
        r3_352.HOT_10,
        r3_352.HOT_03
      },
      {
        r3_352.HOT_06,
        r3_352.HOT_09,
        r3_352.HOT_04,
        r3_352.HOT_05,
        r3_352.HOT_07,
        r3_352.HOT_08,
        r3_352.KAN_01,
        r3_352.KAN_02,
        r3_352.KAN_04
      },
      {
        r3_352.KAN_03,
        r3_352.KAN_09,
        r3_352.KAN_05,
        r3_352.KAN_06,
        r3_352.KAN_07,
        r3_352.KAN_08,
        r3_352.HUS_03,
        r3_352.HUS_01,
        r3_352.HUS_02
      },
      {
        r3_352.AGS_01,
        r3_352.AGS_02,
        r3_352.AGS_03,
        r3_352.NOV_01,
        r3_352.NOV_02,
        r3_352.COM_01,
        r3_352.KOT_00,
        r3_352.KOT_01,
        r3_352.KOT_11
      },
      {
        r3_352.KOT_21,
        r3_352.AGE_16,
        r3_352.AMA_01,
        r3_352.AMA_08,
        r3_352.HUT_22,
        r3_352.FDSDEV01,
        r3_352.FDSDEV02,
        r3_352.FDSDEV03,
        r3_352.FDSDEV04
      },
      {
        r3_352.FDSDEV05,
        r3_352.FDSDEV06,
        r3_352.FDSDEV07,
        r3_352.FDSDEV08,
        r3_352.FDSDEV09,
        r3_352.FDSDEV10,
        r3_352.FDSDEV11,
        r3_352.FDSDEV12,
        r3_352.FDSDEV13
      },
      {
        r3_352.FDSDEV14,
        r3_352.FDSDEV15
      }
    }
    if #r4_352 < r1_352 then
      return false
    end
    if #r4_352[r1_352] < r2_352 then
      return false
    end
    return cfunc.LegacyGame__lua_GetFlag(r4_352[r1_352][r2_352])
  end
  function r2_341.CGPageInit(r0_353, r1_353, r2_353, r3_353)
    -- line: [9410, 9453] id: 353
    g_GalleryCgPage = r1_353
    local r4_353 = "P" .. tostring(g_GalleryCgPage)
    local r5_353 = cclass.lua_Layers:create()
    for r9_353, r10_353 in pairs(r0_353.BT_DataCgPage) do
      if r10_353.arg == r4_353 then
        r10_353:bt_SetActive(1)
      else
        r10_353:bt_SetActive(0)
      end
    end
    local r6_353 = 9
    if r1_353 == g_GalleryCgPageMax then
      r6_353 = g_GalleryCgThMax
    end
    local r7_353 = false
    for r11_353 = 1, 9, 1 do
      r4_353 = "TH" .. tostring(r11_353)
      local r12_353 = r11_353 + 50
      if r0_353:GetCgThumbnailEnable(r1_353, r11_353) == true then
        if r0_353:GetCgFlag(r1_353, r11_353) == true then
          r0_353.BT_DataCgTh[r4_353]:bt_SetActive(0)
        else
          r0_353.BT_DataCgTh[r4_353]:bt_SetActive(2)
        end
      else
        r0_353.BT_DataCgTh[r4_353]:bt_SetActive(3)
      end
    end
    r0_353:DeleteGalleryThumbnail(1, r2_353)
    r0_353:LoadGalleryThumbnail(1, r1_353)
  end
  function r2_341.GetSceneThumbnailEnable(r0_354, r1_354, r2_354)
    -- line: [9456, 9466] id: 354
    if g_GalleryScenePageMax < r1_354 then
      return false
    end
    if r1_354 == g_GalleryScenePageMax and g_GallerySceneThMax < r2_354 then
      return false
    end
    return true
  end
  function r2_341.GetSceneFlag(r0_355, r1_355, r2_355)
    -- line: [9468, 9474] id: 355
    return cfunc.LegacyGame__lua_GetFlag(1060 + (r1_355 - 1) * 9 + r2_355 - 1)
  end
  function r2_341.ScenePageInit(r0_356, r1_356, r2_356, r3_356)
    -- line: [9476, 9513] id: 356
    g_GalleryScenePage = r1_356
    local r4_356 = "P" .. tostring(g_GalleryScenePage)
    local r5_356 = cclass.lua_Layers:create()
    for r9_356, r10_356 in pairs(r0_356.BT_DataScenePage) do
      if r10_356.arg == r4_356 then
        r10_356:bt_SetActive(1)
      else
        r10_356:bt_SetActive(0)
      end
    end
    local r6_356 = false
    for r10_356 = 1, 9, 1 do
      r4_356 = "TH" .. tostring(r10_356)
      local r11_356 = r10_356 + 50
      if r0_356:GetSceneThumbnailEnable(r1_356, r10_356) == true then
        if r0_356:GetSceneFlag(r1_356, r10_356) == true then
          r0_356.BT_DataSceneTh[r4_356]:bt_SetActive(0)
        else
          r0_356.BT_DataSceneTh[r4_356]:bt_SetActive(2)
        end
      else
        r0_356.BT_DataSceneTh[r4_356]:bt_SetActive(3)
      end
    end
    r0_356:DeleteGalleryThumbnail(2, r2_356)
    r0_356:LoadGalleryThumbnail(2, r1_356)
  end
  function r2_341.GetBgmPageEnable(r0_357, r1_357, r2_357)
    -- line: [9516, 9532] id: 357
    if r1_357 > 2 then
      return false
    end
    if r1_357 == 1 and 20 < r2_357 then
      return false
    end
    if r1_357 == 2 and r2_357 <= 20 then
      return false
    end
    return true
  end
  function r2_341.GetBgmFlag(r0_358, r1_358, r2_358)
    -- line: [9534, 9540] id: 358
    return cfunc.LegacyGame__lua_GetFlag(1020 + r2_358 - 1)
  end
  r2_341.BGM_SoundNo = 0
  function r2_341.BGMPageInit(r0_359, r1_359, r2_359, r3_359)
    -- line: [9543, 9574] id: 359
    g_GalleryBgmPage = r1_359
    if r1_359 == 1 then
      r0_359.BT_DataBgmPage.P1:bt_SetActive(1)
      r0_359.BT_DataBgmPage.P2:bt_SetActive(0)
    else
      r0_359.BT_DataBgmPage.P1:bt_SetActive(0)
      r0_359.BT_DataBgmPage.P2:bt_SetActive(1)
    end
    local r4_359 = false
    for r8_359 = 1, 32, 1 do
      local r9_359 = "S" .. tostring(r8_359)
      if r0_359:GetBgmPageEnable(r1_359, r8_359) == true then
        if r0_359:GetBgmFlag(r1_359, r8_359) == true then
          if r0_359.BGM_SoundNo == r8_359 then
            r0_359.BT_DataBgmSoundP[r9_359]:bt_SetActive(1)
          else
            r0_359.BT_DataBgmSoundP[r9_359]:bt_SetActive(0)
          end
        else
          r0_359.BT_DataBgmSoundP[r9_359]:bt_SetActive(2)
        end
      else
        r0_359.BT_DataBgmSoundP[r9_359]:bt_SetActive(3)
      end
    end
  end
  r2_341.CG_scene_pos = {
    x = 176,
    y = 56,
  }
  r2_341.CG_bgm_pos = {
    x = 298,
    y = 48,
  }
  r2_341.CG_chara_pos = {
    x = 395,
    y = 48,
  }
  r2_341.Scene_bgm_pos = {
    x = 355,
    y = 48,
  }
  r2_341.Scene_chara_pos = {
    x = 452,
    y = 48,
  }
  r2_341.Bgm_chara_pos = {
    x = 428,
    y = 48,
  }
  r2_341.beforePage = 0
  function r2_341.initPageGallery(r0_360, r1_360, r2_360)
    -- line: [9595, 10058] id: 360
    if r1_360 == 0 then
      r1_360 = g_GalleryPage
    end
    if r0_360.BGM_SoundNo == 0 then
      r0_360.BT_DataBace.stop:bt_SetActive(2)
    else
      r0_360.BT_DataBace.stop:bt_SetActive(0)
    end
    local r3_360 = cclass.lua_Layers:create()
    local r4_360 = getEffectRate()
    local r5_360 = 0
    local r6_360 = 0
    local r7_360 = 0
    local r8_360 = 0
    local r9_360 = ""
    r0_360.MenuButton:InitList()
    r0_360.BT_DataBace.CG:bt_SetActive(0)
    r0_360.BT_DataBace.Scene:bt_SetActive(0)
    r0_360.BT_DataBace.BGM:bt_SetActive(0)
    r0_360.BT_DataBace.Chara:bt_SetActive(0)
    if r1_360 == 1 then
      r9_360 = "GalleryCg"
      r0_360:MenuLoadLayer(r9_360, "SYS_GalleryCg.pna")
      r0_360:LoadGalleryThumbnail(1, g_GalleryCgPage)
      r0_360:GalleryCgPage()
      r0_360.MenuButton:SetList("BT_DataCgPage", r0_360.BT_DataCgPage)
      r0_360.MenuButton:SetList("BT_DataCgTh", r0_360.BT_DataCgTh)
      r0_360:MenuButtonInit()
      r0_360.MenuButton:SetList("BT_DataBace", r0_360.BT_DataBace)
      r3_360:initSubLayer("GalleryMenu", r9_360, 105, 1)
      r0_360:CGPageInit(g_GalleryCgPage, g_GalleryCgPage, true)
      r3_360:setSubLayerVisible("GalleryMenu", "GalleryBace", 1, 1)
      if r2_360 == true then
        r0_360.BT_DataBace.CG:bt_SetDefPos()
        r0_360.BT_DataBace.CG:bt_SetActive(1)
        r0_360.BT_DataBace.Scene:bt_SetPos(r0_360.CG_scene_pos.x, r0_360.CG_scene_pos.y)
        r0_360.BT_DataBace.BGM:bt_SetPos(r0_360.CG_bgm_pos.x, r0_360.CG_bgm_pos.y)
        r0_360.BT_DataBace.Chara:bt_SetPos(r0_360.CG_chara_pos.x, r0_360.CG_chara_pos.y)
      end
    end
    if r1_360 == 2 then
      r9_360 = "GalleryScene"
      r0_360:MenuLoadLayer(r9_360, "SYS_GalleryCg.pna")
      r0_360:LoadGalleryThumbnail(2, g_GalleryScenePage)
      r0_360:GalleryScenePage()
      r0_360.MenuButton:SetList("BT_DataScenePage", r0_360.BT_DataScenePage)
      r0_360.MenuButton:SetList("BT_DataSceneTh", r0_360.BT_DataSceneTh)
      r0_360:MenuButtonInit()
      r0_360.MenuButton:SetList("BT_DataBace", r0_360.BT_DataBace)
      r3_360:initSubLayer("GalleryMenu", r9_360, 105, 1)
      r0_360:ScenePageInit(g_GalleryScenePage, g_GalleryScenePage, true)
      r3_360:setSubLayerVisible("GalleryMenu", "GalleryBace", 2, 1)
      if r2_360 == true then
        r0_360.BT_DataBace.CG:bt_SetDefPos()
        r0_360.BT_DataBace.Scene:bt_SetDefPos()
        r0_360.BT_DataBace.Scene:bt_SetActive(1)
        r0_360.BT_DataBace.BGM:bt_SetPos(r0_360.Scene_bgm_pos.x, r0_360.Scene_bgm_pos.y)
        r0_360.BT_DataBace.Chara:bt_SetPos(r0_360.Scene_chara_pos.x, r0_360.Scene_chara_pos.y)
      end
    end
    if r1_360 == 3 then
      r9_360 = "GalleryBgm"
      r0_360:MenuLoadLayer(r9_360, "SYS_GalleryBGM.pna")
      r0_360:GalleryBgmPage()
      r0_360.MenuButton:SetList("BT_DataBgmPage", r0_360.BT_DataBgmPage)
      r0_360.MenuButton:SetList("BT_DataBgmSoundP", r0_360.BT_DataBgmSoundP)
      r0_360:MenuButtonInit()
      r0_360.MenuButton:SetList("BT_DataBace", r0_360.BT_DataBace)
      r3_360:initSubLayer("GalleryMenu", r9_360, 204, 1)
      r0_360:BGMPageInit(g_GalleryBgmPage, g_GalleryBgmPage, true)
      r3_360:setSubLayerVisible("GalleryMenu", "GalleryBace", 3, 1)
      if r2_360 == true then
        r0_360.BT_DataBace.CG:bt_SetDefPos()
        r0_360.BT_DataBace.Scene:bt_SetDefPos()
        r0_360.BT_DataBace.BGM:bt_SetDefPos()
        r0_360.BT_DataBace.BGM:bt_SetActive(1)
        r0_360.BT_DataBace.Chara:bt_SetPos(r0_360.Bgm_chara_pos.x, r0_360.Bgm_chara_pos.y)
      end
    end
    if r1_360 == 4 then
      r9_360 = "GalleryChara"
      r0_360:MenuLoadLayer(r9_360, "SYS_GalleryChara.pna")
      r0_360:GalleryCharaPage()
      r0_360.MenuButton:SetList("BT_CharaPage", r0_360.BT_CharaPage)
      r0_360:MenuButtonInit()
      r0_360.MenuButton:SetList("BT_DataBace", r0_360.BT_DataBace)
      r0_360:GalleryCharaAct()
      r3_360:initSubLayer("GalleryMenu", r9_360, 507, 1)
      r3_360:initSubLayer("GalleryMenu", r9_360, 508, 1)
      r3_360:initSubLayer("GalleryMenu", r9_360, 509, 1)
      r3_360:initSubLayer("GalleryMenu", r9_360, 510, 1)
      r3_360:setSubLayerVisible("GalleryMenu", "GalleryBace", 4, 1)
      r3_360:setSubLayerVisible("GalleryMenu", "GalleryBace", 49, 1)
      r3_360:setSubLayerVisible("GalleryMenu", "GalleryBace", 51, 1)
      if r2_360 == true then
        r0_360.BT_DataBace.CG:bt_SetDefPos()
        r0_360.BT_DataBace.Scene:bt_SetDefPos()
        r0_360.BT_DataBace.BGM:bt_SetDefPos()
        r0_360.BT_DataBace.Chara:bt_SetDefPos()
        r0_360.BT_DataBace.Chara:bt_SetActive(1)
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", 50, LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
    end
    if r2_360 == false then
      r0_360.beforePage = g_GalleryPage
      local r10_360 = r0_360.beforePage
      if r1_360 < r10_360 then
        r10_360 = APP_INTERNAL_WIDTH or -1 * APP_INTERNAL_WIDTH
      else
        goto label_389	-- block#20 is visited secondly
      end
      local r11_360 = r10_360
      local r12_360 = r10_360
      r0_360.MenuInf.PageEffect = true
      if r1_360 == 1 then
        eff_Layer = 1
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
        r0_360.BT_DataBace.CG:bt_SetActive(1)
        local r13_360 = r0_360.BT_DataBace.CG.SubLayer.act.no
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 100 * r4_360, 0, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 50 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        r5_360, r6_360 = r0_360.BT_DataBace.Scene:bt_GetPos()
        r7_360 = r0_360.CG_scene_pos.x - r5_360
        r8_360 = r0_360.CG_scene_pos.y - r6_360
        if r7_360 ~= 0 or r8_360 ~= 0 then
          r13_360 = r0_360.BT_DataBace.Scene.SubLayer.def.no
          r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_POS, r7_360, r8_360, 0, 0, 0, 150 * r4_360, 0, 0)
          r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        end
        r5_360, r6_360 = r0_360.BT_DataBace.BGM:bt_GetPos()
        r7_360 = r0_360.CG_bgm_pos.x - r5_360
        r8_360 = r0_360.CG_bgm_pos.y - r6_360
        if r7_360 ~= 0 or r8_360 ~= 0 then
          r13_360 = r0_360.BT_DataBace.BGM.SubLayer.def.no
          r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_POS, r7_360, r8_360, 0, 0, 0, 150 * r4_360, 0, 0)
          r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        end
        r5_360, r6_360 = r0_360.BT_DataBace.Chara:bt_GetPos()
        r7_360 = r0_360.CG_chara_pos.x - r5_360
        r8_360 = r0_360.CG_chara_pos.y - r6_360
        if r7_360 ~= 0 or r8_360 ~= 0 then
          r13_360 = r0_360.BT_DataBace.Chara.SubLayer.def.no
          r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_POS, r7_360, r8_360, 0, 0, 0, 150 * r4_360, 0, 0)
          r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        end
        r0_360:GalleryThumbnailEffect(1, g_GalleryCgPage, r10_360, 300, false)
      end
      if r1_360 == 2 then
        eff_Layer = 2
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
        r0_360.BT_DataBace.Scene:bt_SetDefPos()
        r0_360.BT_DataBace.Scene:bt_SetActive(1)
        local r13_360 = r0_360.BT_DataBace.Scene.SubLayer.act.no
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 100 * r4_360, 0, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 50 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        r5_360, r6_360 = r0_360.BT_DataBace.BGM:bt_GetPos()
        r7_360 = r0_360.Scene_bgm_pos.x - r5_360
        r8_360 = r0_360.Scene_bgm_pos.y - r6_360
        if r7_360 ~= 0 or r8_360 ~= 0 then
          r13_360 = r0_360.BT_DataBace.BGM.SubLayer.def.no
          r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_POS, r7_360, r8_360, 0, 0, 0, 150 * r4_360, 0, 0)
          r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        end
        r5_360, r6_360 = r0_360.BT_DataBace.Chara:bt_GetPos()
        r7_360 = r0_360.Scene_chara_pos.x - r5_360
        r8_360 = r0_360.Scene_chara_pos.y - r6_360
        if r7_360 ~= 0 or r8_360 ~= 0 then
          r13_360 = r0_360.BT_DataBace.Chara.SubLayer.def.no
          r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_POS, r7_360, r8_360, 0, 0, 0, 150 * r4_360, 0, 0)
          r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        end
        r0_360:GalleryThumbnailEffect(2, g_GalleryScenePage, r10_360, 300, false)
      end
      if r1_360 == 3 then
        eff_Layer = 3
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
        r5_360, r6_360 = r0_360.BT_DataBace.Scene:bt_GetPos()
        r7_360, r8_360 = r0_360.BT_DataBace.Scene:bt_GetInitPos()
        r7_360 = r7_360 - r5_360
        r8_360 = r8_360 - r6_360
        local r13_360 = r0_360.BT_DataBace.Scene.SubLayer.def.no
        if r7_360 ~= 0 or r8_360 ~= 0 then
          r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_POS, r7_360, r8_360, 0, 0, 0, 150 * r4_360, 0, 0)
          r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        end
        r0_360.BT_DataBace.BGM:bt_SetDefPos()
        r0_360.BT_DataBace.BGM:bt_SetActive(1)
        r13_360 = r0_360.BT_DataBace.BGM.SubLayer.act.no
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 100 * r4_360, 0, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 50 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        r5_360, r6_360 = r0_360.BT_DataBace.Chara:bt_GetPos()
        r7_360 = r0_360.Bgm_chara_pos.x - r5_360
        r8_360 = r0_360.Bgm_chara_pos.y - r6_360
        if r7_360 ~= 0 or r8_360 ~= 0 then
          r13_360 = r0_360.BT_DataBace.Chara.SubLayer.def.no
          r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_POS, r7_360, r8_360, 0, 0, 0, 150 * r4_360, 0, 0)
          r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        end
      end
      if r1_360 == 4 then
        r11_360 = APP_INTERNAL_WIDTH
        eff_Layer = 4
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
        eff_Layer = 49
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_POS, -r11_360, 0, 0, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_POS, r11_360, 0, 0, 0, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
        eff_Layer = 51
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
        r5_360, r6_360 = r0_360.BT_DataBace.Scene:bt_GetPos()
        r7_360, r8_360 = r0_360.BT_DataBace.Scene:bt_GetInitPos()
        r7_360 = r7_360 - r5_360
        r8_360 = r8_360 - r6_360
        local r13_360 = r0_360.BT_DataBace.Scene.SubLayer.def.no
        if r7_360 ~= 0 or r8_360 ~= 0 then
          r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, LUA_EFFECT_POS, r7_360, r8_360, 0, 0, 0, 150 * r4_360, 0, 0)
          r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r13_360, 0)
        end
        r5_360, r6_360 = r0_360.BT_DataBace.BGM:bt_GetPos()
        r7_360, r8_360 = r0_360.BT_DataBace.BGM:bt_GetInitPos()
        r7_360 = r7_360 - r5_360
        r8_360 = r8_360 - r6_360
        local r14_360 = r0_360.BT_DataBace.BGM.SubLayer.def.no
        if r7_360 ~= 0 or r8_360 ~= 0 then
          r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r14_360, LUA_EFFECT_POS, r7_360, r8_360, 0, 0, 0, 150 * r4_360, 0, 0)
          r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r14_360, 0)
        end
        r0_360.BT_DataBace.Chara:bt_SetDefPos()
        r0_360.BT_DataBace.Chara:bt_SetActive(1)
        r14_360 = r0_360.BT_DataBace.Chara.SubLayer.act.no
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r14_360, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 100 * r4_360, 0, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r14_360, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 50 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r14_360, 0)
        r14_360 = 50
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", r14_360, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r14_360, LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", r14_360, 0)
      end
      local r13_360 = ""
      if r0_360.beforePage == 1 then
        r13_360 = "GalleryCg"
        r0_360:GalleryThumbnailEffect(1, g_GalleryCgPage, r12_360, 300, true)
        eff_Layer = 1
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
      end
      if r0_360.beforePage == 2 then
        r13_360 = "GalleryScene"
        r0_360:GalleryThumbnailEffect(2, g_GalleryScenePage, r12_360, 300, true)
        eff_Layer = 2
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
      end
      if r0_360.beforePage == 3 then
        r13_360 = "GalleryBgm"
        eff_Layer = 3
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
      end
      if r0_360.beforePage == 4 then
        r13_360 = "GalleryChara"
        r12_360 = -APP_INTERNAL_WIDTH
        eff_Layer = 4
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
        eff_Layer = 49
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_POS, 0, 0, 0, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_POS, r12_360, 0, 0, 0, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
        eff_Layer = 51
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
        eff_Layer = 50
        r3_360:setSubLayerParam("GalleryMenu", "GalleryBace", eff_Layer, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_360:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r4_360, 0, 0)
        r3_360:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryPageEff", eff_Layer, 0)
      end
      r3_360:clearHitTestAll("GalleryMenu", r13_360)
      r3_360:setEffect("GalleryMenu", r13_360, "GalleryPageEff", LUA_EFFECT_POS, r12_360, 0, 0, 0, 0, 300 * r4_360, 0, 0)
      r3_360:startEffect("GalleryMenu", r13_360, "GalleryPageEff", 0)
      r3_360:setParam("GalleryMenu", r9_360, LUA_PARAM_POS, -r11_360, 0, 0, 0)
      r3_360:setEffect("GalleryMenu", r9_360, "GalleryPageEff", LUA_EFFECT_POS, r11_360, 0, 0, 0, 0, 300 * r4_360, 0, 0)
      r3_360:startEffect("GalleryMenu", r9_360, "GalleryPageEff", 0)
    end
    g_GalleryPage = r1_360
    cfunc.LegacyGame__lua_SetVariable(107, g_GalleryPage)
  end
  function r2_341.LoadGalleryThumbnail(r0_361, r1_361, r2_361)
    -- line: [10063, 10105] id: 361
    local r3_361 = ""
    local r4_361 = ""
    local r5_361 = ""
    local r6_361 = ""
    r3_361, r4_361 = r0_361:CgThumbnailLayerName(r1_361, r2_361)
    r5_361, r6_361 = r0_361:CgThumbnailFileName(r1_361, r2_361)
    r0_361:MenuLoadLayer(r3_361, r5_361)
    r0_361:MenuLoadLayer(r4_361, r6_361)
    local r7_361 = false
    local r8_361 = 1
    local r9_361 = cclass.lua_Layers:create()
    local r10_361 = 399
    local r11_361 = 163
    local r12_361 = 240
    local r13_361 = 149
    for r17_361 = 1, 3, 1 do
      for r21_361 = 1, 3, 1 do
        local r22_361 = false
        local r23_361 = false
        if r1_361 == 1 then
          r22_361 = r0_361:GetCgThumbnailEnable(r2_361, r8_361)
          r23_361 = r0_361:GetCgFlag(r2_361, r8_361)
        end
        if r1_361 == 2 then
          r22_361 = r0_361:GetSceneThumbnailEnable(r2_361, r8_361)
          r23_361 = r0_361:GetSceneFlag(r2_361, r8_361)
        end
        if r22_361 == true and r23_361 == true then
          local r24_361 = (r2_361 - 1) * 9 + r8_361 - 1
          r9_361:initSubLayer(r0_361.MenuInf.SetName, r3_361, r24_361, 0)
          r9_361:initSubLayer(r0_361.MenuInf.SetName, r4_361, r24_361, 1)
          local r25_361 = r10_361 + r12_361 * (r21_361 - 1)
          local r26_361 = r11_361 + r13_361 * (r17_361 - 1)
          r9_361:setSubLayerParam(r0_361.MenuInf.SetName, r3_361, r24_361, LUA_PARAM_POS, r25_361, r26_361, 0, 0)
          r9_361:setSubLayerParam(r0_361.MenuInf.SetName, r4_361, r24_361, LUA_PARAM_POS, r25_361, r26_361, 0, 0)
        end
        r8_361 = r8_361 + 1
      end
    end
  end
  function r2_341.DeleteGalleryThumbnail(r0_362, r1_362, r2_362)
    -- line: [10109, 10116] id: 362
    local r3_362 = ""
    local r4_362 = ""
    local r5_362, r6_362 = r0_362:CgThumbnailLayerName(r1_362, r2_362)
    local r7_362 = cclass.lua_Layers:create()
    r7_362:removeLayer(r0_362.MenuInf.SetName, r5_362)
    r7_362:removeLayer(r0_362.MenuInf.SetName, r6_362)
  end
  function r2_341.GalleryThumbnailOnOff(r0_363, r1_363, r2_363, r3_363)
    -- line: [10119, 10133] id: 363
    local r4_363 = ""
    local r5_363 = ""
    local r6_363, r7_363 = r0_363:CgThumbnailLayerName(r1_363, r2_363)
    local r8_363 = cclass.lua_Layers:create()
    for r12_363 = 1, 9, 1 do
      local r13_363 = (r2_363 - 1) * 9 + r12_363 - 1
      if r3_363 == r12_363 then
        r8_363:setSubLayerVisible(r0_363.MenuInf.SetName, r6_363, r13_363, 1)
        r8_363:setSubLayerVisible(r0_363.MenuInf.SetName, r7_363, r13_363, 0)
      else
        r8_363:setSubLayerVisible(r0_363.MenuInf.SetName, r6_363, r13_363, 0)
        r8_363:setSubLayerVisible(r0_363.MenuInf.SetName, r7_363, r13_363, 1)
      end
    end
  end
  function r2_341.GalleryThumbnailEffect(r0_364, r1_364, r2_364, r3_364, r4_364, r5_364)
    -- line: [10135, 10151] id: 364
    local r6_364 = cclass.lua_Layers:create()
    local r7_364 = getEffectRate()
    local r8_364 = ""
    local r9_364 = ""
    r8_364, r9_364 = r0_364:CgThumbnailLayerName(r1_364, r2_364)
    if r5_364 == false then
      local r10_364 = 0
      local r11_364 = 0
      local r12_364 = 0
      local r13_364 = 0
      r10_364, r11_364, r12_364, r13_364 = r6_364:getParam(r0_364.MenuInf.SetName, r8_364, LUA_PARAM_POS, r10_364, r11_364, r12_364, r13_364)
      r6_364:setParam(r0_364.MenuInf.SetName, r8_364, LUA_PARAM_POS, r10_364 - r3_364, r11_364, 0, 0)
      r10_364, r11_364, r12_364, r13_364 = r6_364:getParam(r0_364.MenuInf.SetName, r9_364, LUA_PARAM_POS, r10_364, r11_364, r12_364, r13_364)
      r6_364:setParam(r0_364.MenuInf.SetName, r9_364, LUA_PARAM_POS, r10_364 - r3_364, r11_364, 0, 0)
    end
    r6_364:setEffect(r0_364.MenuInf.SetName, r8_364, "GalleryPageEff", LUA_EFFECT_POS, r3_364, 0, 0, 0, 0, 300 * r7_364, 0, 0)
    r6_364:startEffect(r0_364.MenuInf.SetName, r8_364, "GalleryPageEff", 0)
    r6_364:setEffect(r0_364.MenuInf.SetName, r9_364, "GalleryPageEff", LUA_EFFECT_POS, r3_364, 0, 0, 0, 0, 300 * r7_364, 0, 0)
    r6_364:startEffect(r0_364.MenuInf.SetName, r9_364, "GalleryPageEff", 0)
  end
  function r2_341.CgThumbnailLayerName(r0_365, r1_365, r2_365)
    -- line: [10154, 10169] id: 365
    local r3_365 = ""
    local r4_365 = ""
    if r1_365 == 1 then
      r3_365 = "GalleryCgThOn"
      r4_365 = "GalleryCgThOff"
    else
      r3_365 = "GalleryScThOn"
      r4_365 = "GalleryScThOff"
    end
    return r3_365, r4_365
  end
  function r2_341.CgThumbnailFileName(r0_366, r1_366, r2_366)
    -- line: [10171, 10186] id: 366
    local r3_366 = ""
    local r4_366 = ""
    if r1_366 == 1 then
      r3_366 = "SYS_GalleryCgThOn.pna"
      r4_366 = "SYS_GalleryCgThOff.pna"
    else
      r3_366 = "SYS_GalleryScThOn.pna"
      r4_366 = "SYS_GalleryScThOff.pna"
    end
    return r3_366, r4_366
  end
  function r2_341.GallerySetBgmButton(r0_367, r1_367)
    -- line: [10190, 10231] id: 367
    if r0_367.BGM_SoundNo ~= 0 then
      local r2_367 = false
      if r0_367.BGM_SoundNo <= 20 and r1_367 <= 20 then
        r2_367 = true
      end
      if 20 < r0_367.BGM_SoundNo and 20 < r1_367 then
        r2_367 = true
      end
      if r2_367 == true then
        r0_367.BT_DataBgmSoundP["S" .. tostring(r0_367.BGM_SoundNo)]:bt_SetActive(0)
      end
    end
    local r2_367 = "S" .. tostring(r1_367)
    r0_367.BT_DataBgmSoundP[r2_367]:bt_SetActive(1)
    r0_367.BT_DataBace.stop:bt_SetActive(0)
    local r3_367 = cclass.lua_Layers:create()
    local r4_367 = getEffectRate()
    r3_367:setSubLayerEffect("GalleryMenu", "GalleryBgm", "GalleryEff", r0_367.BT_DataBgmSoundP[r2_367].SubLayer.act.no, LUA_EFFECT_SCALE, 0.025, 0.025, 0, 0, 0, 100 * r4_367, 0, 0)
    r3_367:setSubLayerEffect("GalleryMenu", "GalleryBgm", "GalleryEff", r0_367.BT_DataBgmSoundP[r2_367].SubLayer.act.no, LUA_EFFECT_SCALE, -0.025, -0.025, 0, 0, 0, 50 * r4_367, 0, 0)
    r3_367:startSubLayerEffect("GalleryMenu", "GalleryBgm", "GalleryEff", r0_367.BT_DataBgmSoundP[r2_367].SubLayer.act.no, 0)
    r3_367:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryEff", r0_367.BT_DataBace.stop.SubLayer.def.no, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 100 * r4_367, 0, 0)
    r3_367:setSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryEff", r0_367.BT_DataBace.stop.SubLayer.def.no, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 50 * r4_367, 0, 0)
    r3_367:startSubLayerEffect("GalleryMenu", "GalleryBace", "GalleryEff", r0_367.BT_DataBace.stop.SubLayer.def.no, 0)
    r0_367.MenuInf.GalleryEff = true
    r0_367:GalleryBgmPlay(r1_367)
  end
  function r2_341.GalleryBgmPlay(r0_368, r1_368)
    -- line: [10233, 10275] id: 368
    r0_368.BGM_SoundNo = r1_368
    cfunc.LegacyGame__lua_SetVariable(112, r0_368.BGM_SoundNo)
    local r2_368 = {
      [1] = "bgm29.ogg",
      [2] = "bgm01.ogg",
      [3] = "bgm12.ogg",
      [4] = "bgm03.ogg",
      [5] = "bgm02.ogg",
      [6] = "bgm05.ogg",
      [7] = "bgm04.ogg",
      [8] = "bgm10.ogg",
      [9] = "bgm07.ogg",
      [10] = "bgm08a.ogg",
      [11] = "bgm09a.ogg",
      [12] = "bgm06.ogg",
      [13] = "bgm11.ogg",
      [14] = "bgm13.ogg",
      [15] = "bgm14.ogg",
      [16] = "bgm15.ogg",
      [17] = "bgm16.ogg",
      [18] = "bgm17.ogg",
      [19] = "bgm18a.ogg",
      [20] = "bgm19.ogg",
      [21] = "bgm20.ogg",
      [22] = "bgm21.ogg",
      [23] = "bgm22.ogg",
      [24] = "bgm23.ogg",
      [25] = "bgm24a.ogg",
      [26] = "bgm25.ogg",
      [27] = "bgm26.ogg",
      [28] = "bgm32.ogg",
      [29] = "bgm33.ogg",
      [30] = "bgm34.ogg",
      [31] = "bgm35.ogg",
      [32] = "bgm36.ogg",
    }
    local r3_368 = cclass.lua_Sounds:new()
    r3_368:BgmPlay("systembgm", getSoundArcFileName("BGM", ".ogg"), r2_368[r1_368], getSoundVolume("BGM"))
    r3_368:delete()
  end
  function r2_341.GalleryBgmStop(r0_369)
    -- line: [10278, 10301] id: 369
    if r0_369.BGM_SoundNo > 0 then
      if g_GalleryPage == 3 then
        local r1_369 = false
        if r0_369.BGM_SoundNo <= 20 and g_GalleryBgmPage == 1 then
          r1_369 = true
        end
        if 20 < r0_369.BGM_SoundNo and g_GalleryBgmPage == 2 then
          r1_369 = true
        end
        if r1_369 == true then
          r0_369.BT_DataBgmSoundP["S" .. tostring(r0_369.BGM_SoundNo)]:bt_SetActive(0)
        end
      end
      local r1_369 = cclass.lua_Sounds:new()
      r1_369:BgmStop("systembgm", 200)
      r1_369:delete()
      r0_369.BGM_SoundNo = 0
      cfunc.LegacyGame__lua_SetVariable(112, r0_369.BGM_SoundNo)
    end
  end
  function r2_341.closeGallery(r0_370, r1_370)
    -- line: [10303, 10329] id: 370
    cfunc.LegacyGame__lua_SetVariable(100, g_GalleryCgPage)
    cfunc.LegacyGame__lua_SetVariable(101, g_GalleryScenePage)
    cfunc.LegacyGame__lua_SetVariable(102, g_GalleryBgmPage)
    cfunc.LegacyGame__lua_SetVariable(107, g_GalleryPage)
    if r1_370 == 2 then
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      cclass.lua_Layers:create():removeSnap("system")
      r0_370:MenuEffectEnd(0)
    else
      r0_370:MenuEffectToMenu(0)
    end
    r0_370.MenuInf.enabled = false
    r0_370.MenuInf.effect = true
  end
  function r2_341.PlayTitleSound(r0_371)
    -- line: [10331, 10341] id: 371
    if r0_371.BGM_SoundNo ~= 30 then
      r0_371:GalleryBgmPlay(30)
    end
  end
  r2_341.BT_DataCgPage = {}
  r2_341.BT_DataCgTh = {}
  function r2_341.GalleryCgPage(r0_372)
    -- line: [10357, 10375] id: 372
    r0_372.BT_DataCgPage = {}
    r0_372.BT_DataCgTh = {}
    for r4_372 = 1, g_GalleryCgPageMax, 1 do
      local r6_372 = 6 * (r4_372 - 1) + 1
      r0_372:MenuButtonSet(r0_372.BT_DataCgPage, "P" .. tostring(r4_372), 1, "GalleryCg", r6_372, r6_372, r6_372 + 1, r6_372 + 2, r6_372 + 3, 100 + r4_372, 0, 0)
    end
    for r4_372 = 1, 9, 1 do
      r0_372:MenuButtonSet(r0_372.BT_DataCgTh, "TH" .. tostring(r4_372), 1, "GalleryCg", 107 + r4_372 - 1, 73 + r4_372 - 1, 84 + r4_372 - 1, -1, 95 + r4_372 - 1, 200 + r4_372, 0, 0)
    end
  end
  r2_341.BT_DataScenePage = {}
  r2_341.BT_DataSceneTh = {}
  function r2_341.GalleryScenePage(r0_373)
    -- line: [10381, 10399] id: 373
    r0_373.BT_DataScenePage = {}
    r0_373.BT_DataSceneTh = {}
    for r4_373 = 1, g_GalleryScenePageMax, 1 do
      local r6_373 = 6 * (r4_373 - 1) + 1
      r0_373:MenuButtonSet(r0_373.BT_DataScenePage, "P" .. tostring(r4_373), 1, "GalleryScene", r6_373, r6_373, r6_373 + 1, r6_373 + 2, r6_373 + 3, 100 + r4_373, 0, 0)
    end
    for r4_373 = 1, 9, 1 do
      r0_373:MenuButtonSet(r0_373.BT_DataSceneTh, "TH" .. tostring(r4_373), 1, "GalleryScene", 107 + r4_373 - 1, 73 + r4_373 - 1, 84 + r4_373 - 1, -1, 95 + r4_373 - 1, 200 + r4_373, 0, 0)
    end
  end
  r2_341.BT_DataBgmPage = {}
  r2_341.BT_DataBgmSoundP = {}
  function r2_341.GalleryBgmPage(r0_374)
    -- line: [10405, 10419] id: 374
    r0_374.BT_DataBgmPage = {}
    r0_374.BT_DataBgmSoundP = {}
    r0_374:MenuButtonSet(r0_374.BT_DataBgmPage, "P1", 1, "GalleryBgm", 193, 193, 194, 195, 196, 101, 0, 0)
    r0_374:MenuButtonSet(r0_374.BT_DataBgmPage, "P2", 1, "GalleryBgm", 199, 199, 200, 201, 202, 102, 0, 0)
    for r4_374 = 1, 32, 1 do
      local r6_374 = 6 * (r4_374 - 1) + 1
      r0_374:MenuButtonSet(r0_374.BT_DataBgmSoundP, "S" .. tostring(r4_374), 1, "GalleryBgm", r6_374 + 1, r6_374 + 1, r6_374, r6_374 + 2, r6_374 + 3, 300 + r4_374, 0, 0)
    end
  end
  function r2_341.ItemSetInit(r0_375)
    -- line: [10424, 10429] id: 375
    return {
      selCursor_selName = -1,
      selCursor_Item = -1,
    }
  end
  function r2_341.ItemSet(r0_376, r1_376, r2_376, r3_376)
    -- line: [10432, 10444] id: 376
    r1_376.selCursor_selName = r2_376
    if r1_376.selCursor_Item ~= -1 then
      r1_376.selCursor_Item:SetAct("def")
      r1_376.selCursor_Item = -1
    end
    if r3_376 ~= -1 then
      r1_376.selCursor_Item = r1_376[r3_376]
      r1_376.selCursor_Item:SetAct("on")
    end
  end
  function r2_341.MenuCharaGetItemName(r0_377, r1_377)
    -- line: [10448, 10452] id: 377
    return ({
      "char",
      "size",
      "pose",
      "poDi",
      "clot",
      "expr",
      "opex",
      "back",
      "time",
      "chEn",
      "bgEn"
    })[r1_377]
  end
  function r2_341.ItemParamSet(r0_378, r1_378)
    -- line: [10455, 10463] id: 378
    local r2_378 = {}
    for r6_378 = 1, 9, 1 do
      r2_378[r0_378:MenuCharaGetItemName(r6_378)] = r1_378
    end
    return r2_378
  end
  function r2_341.MenuItemChara(r0_379, r1_379, r2_379, r3_379, r4_379)
    -- line: [10465, 10475] id: 379
    local r5_379 = NudeMenuItem.new(r1_379, r2_379)
    r5_379:addLayer("def", -1)
    r5_379:addLayer("act", r3_379)
    r5_379:addLayer("dis", r4_379)
    r5_379:SetAct("def")
    r5_379.enable = true
    return r5_379
  end
  r2_341.CharEnable = true
  r2_341.BackEnable = true
  r2_341.BT_CharaPage = {}
  r2_341.ChItem = {}
  r2_341.ChItemData = {}
  function r2_341.GalleryCharaPage(r0_380)
    -- line: [10487, 10606] id: 380
    r0_380.BT_CharaPage = {}
    r0_380:MenuButtonSet(r0_380.BT_CharaPage, "ChClose", 1, "GalleryChara", 502, 502, 503, -1, -1, 500, 0, 0)
    for r4_380 = 1, 11, 1 do
      local r7_380 = r4_380 - 1 + 429
      r0_380:MenuButtonSet(r0_380.BT_CharaPage, "ChOptionL" .. r0_380:MenuCharaGetItemName(r4_380), 1, "GalleryChara", r4_380 - 1 + 477, r4_380 - 1 + 405, r7_380, r7_380, r4_380 - 1 + 453, 400 + r4_380, 0, 0)
    end
    for r4_380 = 1, 11, 1 do
      local r7_380 = r4_380 - 1 + 440
      r0_380:MenuButtonSet(r0_380.BT_CharaPage, "ChOptionR" .. r0_380:MenuCharaGetItemName(r4_380), 1, "GalleryChara", r4_380 - 1 + 488, r4_380 - 1 + 416, r7_380, r7_380, r4_380 - 1 + 464, 420 + r4_380, 0, 0)
    end
    r0_380.ChItem = r0_380:ItemSetInit()
    for r4_380 = 1, 11, 1 do
      r0_380.ChItem["OptionItem" .. r0_380:MenuCharaGetItemName(r4_380)] = MenuItem.new("GalleryMenu", "GalleryChara", 3 + r4_380 - 1, 16 + r4_380 - 1)
    end
    r0_380.ChItemData = {}
    r0_380.ChItemData.IT = r0_380:ItemParamSet(1)
    r0_380.ChItemData.IT_dat = r0_380:ItemParamSet(0)
    r0_380.ChItemData.IT_max = r0_380:ItemParamSet(0)
    r0_380.ChItemData.IT_dat.char = cfunc.LegacyGame__lua_GetVariable(115)
    r0_380.ChItemData.IT_dat.size = cfunc.LegacyGame__lua_GetVariable(116)
    r0_380.ChItemData.IT_dat.pose = cfunc.LegacyGame__lua_GetVariable(117)
    r0_380.ChItemData.IT_dat.poDi = cfunc.LegacyGame__lua_GetVariable(118)
    r0_380.ChItemData.IT_dat.clot = cfunc.LegacyGame__lua_GetVariable(119)
    r0_380.ChItemData.IT_dat.expr = cfunc.LegacyGame__lua_GetVariable(120)
    r0_380.ChItemData.IT_dat.opex = cfunc.LegacyGame__lua_GetVariable(121)
    r0_380.ChItemData.IT_dat.back = cfunc.LegacyGame__lua_GetVariable(122)
    r0_380.ChItemData.IT_dat.time = cfunc.LegacyGame__lua_GetVariable(123)
    r0_380.CharEnable = cfunc.LegacyGame__lua_GetFlag(130)
    r0_380.BackEnable = cfunc.LegacyGame__lua_GetFlag(131)
    r0_380.ChItemData.Max = r0_380:ItemParamSet(0)
    r0_380.ChItemData.Max.char = 23
    r0_380.ChItemData.Max.size = 4
    r0_380.ChItemData.Max.pose = 5
    r0_380.ChItemData.Max.poDi = 7
    r0_380.ChItemData.Max.clot = 7
    r0_380.ChItemData.Max.expr = 60
    r0_380.ChItemData.Max.opex = 5
    r0_380.ChItemData.Max.back = 35
    r0_380.ChItemData.Max.time = 20
    r0_380.ChItemData.IT_max.char = 23
    r0_380.ChItemData.IT_max.back = 35
    local r1_380 = r0_380:ItemParamSet(0)
    local r2_380 = r0_380:ItemParamSet(0)
    r1_380.char = 213
    r1_380.size = 188
    r1_380.pose = 182
    r1_380.poDi = 175
    r1_380.clot = 166
    r1_380.expr = 157
    r1_380.opex = 95
    r1_380.back = 88
    r1_380.time = 51
    r2_380.char = 399
    r2_380.size = 374
    r2_380.pose = 368
    r2_380.poDi = 361
    r2_380.clot = 352
    r2_380.expr = 343
    r2_380.opex = 281
    r2_380.back = 274
    r2_380.time = 237
    r0_380.ChItemData.Data = {}
    for r6_380 = 1, 9, 1 do
      local r7_380 = r0_380:MenuCharaGetItemName(r6_380)
      r0_380.ChItemData.Data[r7_380] = {}
      for r11_380 = 1, r0_380.ChItemData.Max[r7_380], 1 do
        r0_380.ChItemData.Data[r7_380][r11_380] = r0_380:MenuItemChara("GalleryMenu", "GalleryChara", r1_380[r7_380] - r11_380 - 1, r2_380[r7_380] - r11_380 - 1)
      end
    end
    r0_380:GalleryCharaSetCharaParamInit()
    r0_380:GalleryCharaSetCharaParam("char")
    r0_380:GalleryCharaSetBackParam(1)
  end
  function r2_341.GalleryCharaChangeItem(r0_381, r1_381, r2_381)
    -- line: [10609, 10641] id: 381
    local r3_381 = r0_381:MenuCharaGetItemName(r2_381)
    local r4_381 = r0_381.ChItemData.IT[r3_381]
    for r8_381 = 1, r0_381.ChItemData.Max[r3_381], 1 do
      if r1_381 == 0 then
        r4_381 = r4_381 - 1
        if r4_381 <= 0 then
          r4_381 = r0_381.ChItemData.Max[r3_381]
        end
      else
        r4_381 = r4_381 + 1
        if r0_381.ChItemData.Max[r3_381] < r4_381 then
          r4_381 = 1
        end
      end
      if r0_381.ChItemData.Data[r3_381][r4_381].enable == true then
        break
      end
    end
    r0_381.ChItemData.IT[r3_381] = r4_381
    if r3_381 == "char" or r3_381 == "size" or r3_381 == "pose" then
      r0_381:GalleryCharaSetCharaParam(r3_381)
    end
    if r3_381 == "back" then
      r0_381:GalleryCharaSetBackParam(r4_381)
    end
  end
  r2_341.GalleryCharaParamInit = false
  function r2_341.GalleryCharaSetCharaParamInit(r0_382)
    -- line: [10644, 10661] id: 382
    r0_382.GalleryCharaParamInit = true
    local function r1_382(r0_383, r1_383, r2_383, r3_383, r4_383, r5_383, r6_383)
      -- line: [10649, 10659] id: 383
      return {
        char = r0_383,
        size = r1_383,
        pose = r2_383,
        poDi = r3_383,
        clot = r4_383,
        expr = r5_383,
        opex = r6_383,
      }
    end
  end
  function r2_341.GalleryCharaSetCharaParam(r0_384, r1_384)
    -- line: [10664, 10789] id: 384
    if r1_384 == "back" or r1_384 == "time" then
      return 
    end
    for r5_384 = 1, 7, 1 do
      local r6_384 = r0_384:MenuCharaGetItemName(r5_384)
      if r1_384 == "char" and r6_384 ~= "char" then
        r0_384.ChItemData.IT[r6_384] = 1
      end
      if r1_384 == "pose" and r6_384 ~= "pose" and r6_384 ~= "char" and r6_384 ~= "size" then
        r0_384.ChItemData.IT[r6_384] = 1
      end
    end
    local r2_384 = r0_384.ChItemData.IT.char
    local r3_384 = r0_384.ChItemData.IT.pose
    for r7_384 = 1, 7, 1 do
      local r8_384 = r0_384:MenuCharaGetItemName(r7_384)
      if r8_384 == "size" then
        for r12_384 = 1, r0_384.ChItemData.Max[r8_384], 1 do
          if r0_384.CharaFile[r2_384][r3_384][r12_384] ~= nil then
            r0_384.ChItemData.Data[r8_384][r12_384].enable = true
          else
            r0_384.ChItemData.Data[r8_384][r12_384].enable = false
          end
        end
      end
      if r8_384 == "pose" then
        for r12_384 = 1, r0_384.ChItemData.Max[r8_384], 1 do
          if r12_384 <= #r0_384.CharaLayer[r2_384] then
            r0_384.ChItemData.Data[r8_384][r12_384].enable = true
          else
            r0_384.ChItemData.Data[r8_384][r12_384].enable = false
          end
        end
      end
      if r8_384 == "poDi" then
        for r12_384 = 1, r0_384.ChItemData.Max[r8_384], 1 do
          if r12_384 <= r0_384.CharaLayer[r2_384][r3_384].poDi then
            r0_384.ChItemData.Data[r8_384][r12_384].enable = true
          else
            r0_384.ChItemData.Data[r8_384][r12_384].enable = false
          end
        end
      end
      if r8_384 == "clot" then
        for r12_384 = 1, r0_384.ChItemData.Max[r8_384], 1 do
          if r0_384.CharaLayer[r2_384][r3_384].clot[r12_384] ~= -1 then
            r0_384.ChItemData.Data[r8_384][r12_384].enable = true
          else
            r0_384.ChItemData.Data[r8_384][r12_384].enable = false
          end
        end
      end
      if r8_384 == "expr" then
        local r9_384 = r0_384.CharaLayer[r2_384][r3_384].expr1[1] - r0_384.CharaLayer[r2_384][r3_384].expr1[2] + 1
        if r2_384 == 23 then
          r9_384 = 6
        end
        for r13_384 = 1, r0_384.ChItemData.Max[r8_384], 1 do
          if r13_384 <= r9_384 then
            r0_384.ChItemData.Data[r8_384][r13_384].enable = true
          else
            r0_384.ChItemData.Data[r8_384][r13_384].enable = false
          end
        end
      end
      if r8_384 == "opex" then
        r0_384.ChItemData.Data[r8_384][1].enable = true
        for r12_384 = 2, 4, 1 do
          if r0_384.CharaLayer[r2_384][r3_384].opex[r12_384 - 1] ~= -1 then
            r0_384.ChItemData.Data[r8_384][r12_384].enable = true
          else
            r0_384.ChItemData.Data[r8_384][r12_384].enable = false
          end
        end
        if r0_384.CharaLayer[r2_384][r3_384].opex[1] ~= -1 and r0_384.CharaLayer[r2_384][r3_384].opex[3] ~= -1 then
          r0_384.ChItemData.Data[r8_384][5].enable = true
        else
          r0_384.ChItemData.Data[r8_384][5].enable = false
        end
      end
      if r8_384 ~= "char" then
        local r9_384 = 0
        local r10_384 = 0
        local r11_384 = false
        for r15_384 = 1, r0_384.ChItemData.Max[r8_384], 1 do
          if r0_384.ChItemData.Data[r8_384][r15_384].enable == true then
            r9_384 = r9_384 + 1
            if r10_384 == 0 then
              r10_384 = r15_384
            end
          elseif r0_384.ChItemData.IT[r8_384] == r15_384 then
            r11_384 = true
          end
        end
        r0_384.ChItemData.IT_max[r8_384] = r9_384
        if r11_384 == true then
          r0_384.ChItemData.IT[r8_384] = r10_384
        end
      end
    end
  end
  function r2_341.GalleryCharaSetBackParam(r0_385, r1_385)
    -- line: [10792, 10815] id: 385
    r0_385.ChItemData.IT.time = 1
    r0_385.ChItemData.IT_max.time = #r0_385.BackFile[r1_385]
    for r5_385 = 1, r0_385.ChItemData.Max.time, 1 do
      if r5_385 <= r0_385.ChItemData.IT_max.time then
        r0_385.ChItemData.Data.time[r5_385].enable = true
      else
        r0_385.ChItemData.Data.time[r5_385].enable = false
      end
    end
    r0_385.BackPosY = 0
    if r1_385 == 16 then
      r0_385.BackPosY = -550
    end
    if r1_385 == 27 then
      r0_385.BackPosY = 0
    end
    if r1_385 == 1 then
      r0_385.BackPosY = -550
    end
  end
  function r2_341.GalleryCharaWheel(r0_386, r1_386)
    -- line: [10818, 10840] id: 386
    if r0_386.ChItemData.IT.back == 1 or r0_386.ChItemData.IT.back == 16 or r0_386.ChItemData.IT.back == 27 then
      r0_386.BackPosY = r0_386.BackPosY + r1_386 * 20
      if r0_386.BackPosY > 0 then
        r0_386.BackPosY = 0
      end
      if r0_386.ChItemData.IT.back == 16 and r0_386.BackPosY < -560 then
        r0_386.BackPosY = -560
      elseif r0_386.ChItemData.IT.back == 27 and r0_386.BackPosY < -240 then
        r0_386.BackPosY = -240
      elseif r0_386.BackPosY < -720 then
        r0_386.BackPosY = -720
      end
      cclass.lua_Layers:create():setParam("GalleryMenu", "GalleryBack", LUA_PARAM_POS, 0, r0_386.BackPosY, 0, 0)
    end
  end
  function r2_341.GalleryCharaAct(r0_387)
    -- line: [10844, 10931] id: 387
    local r1_387 = ""
    local r2_387 = ""
    for r6_387, r7_387 in pairs(r0_387.ChItemData.Data) do
      local r8_387 = r0_387.ChItemData.IT_max[r6_387]
      if r0_387.ChItemData.IT.char == 7 and r0_387.ChItemData.IT.pose == 2 and r0_387.ChItemData.IT.clot ~= 5 and r0_387.ChItemData.IT.clot ~= 6 and r6_387 == "poDi" then
        r0_387.ChItemData.IT[r6_387] = 1
        r8_387 = 1
      end
      if r0_387.ChItemData.IT_dat[r6_387] ~= 0 then
        r7_387[r0_387.ChItemData.IT_dat[r6_387]]:SetAct("def")
      end
      r0_387.ChItemData.IT_dat[r6_387] = r0_387.ChItemData.IT[r6_387]
      r1_387 = "ChOptionL" .. r6_387
      r2_387 = "ChOptionR" .. r6_387
      if r8_387 > 1 then
        r0_387.BT_CharaPage[r1_387]:bt_SetActive(0)
        r0_387.BT_CharaPage[r2_387]:bt_SetActive(0)
        r7_387[r0_387.ChItemData.IT_dat[r6_387]]:SetAct("act")
      else
        r0_387.BT_CharaPage[r1_387]:bt_SetActive(2)
        r0_387.BT_CharaPage[r2_387]:bt_SetActive(2)
        r7_387[r0_387.ChItemData.IT_dat[r6_387]]:SetAct("dis")
      end
    end
    r1_387 = "ChOptionL" .. r0_387:MenuCharaGetItemName(10)
    r2_387 = "ChOptionR" .. r0_387:MenuCharaGetItemName(10)
    if r0_387.CharEnable == true then
      r0_387.BT_CharaPage[r1_387]:bt_SetActive(1)
      r0_387.BT_CharaPage[r2_387]:bt_SetActive(0)
    else
      r0_387.BT_CharaPage[r1_387]:bt_SetActive(0)
      r0_387.BT_CharaPage[r2_387]:bt_SetActive(1)
    end
    r1_387 = "ChOptionL" .. r0_387:MenuCharaGetItemName(11)
    r2_387 = "ChOptionR" .. r0_387:MenuCharaGetItemName(11)
    if r0_387.BackEnable == true then
      r0_387.BT_CharaPage[r1_387]:bt_SetActive(1)
      r0_387.BT_CharaPage[r2_387]:bt_SetActive(0)
    else
      r0_387.BT_CharaPage[r1_387]:bt_SetActive(0)
      r0_387.BT_CharaPage[r2_387]:bt_SetActive(1)
    end
    cfunc.LegacyGame__lua_SetVariable(115, r0_387.ChItemData.IT_dat.char)
    cfunc.LegacyGame__lua_SetVariable(116, r0_387.ChItemData.IT_dat.size)
    cfunc.LegacyGame__lua_SetVariable(117, r0_387.ChItemData.IT_dat.pose)
    cfunc.LegacyGame__lua_SetVariable(118, r0_387.ChItemData.IT_dat.poDi)
    cfunc.LegacyGame__lua_SetVariable(119, r0_387.ChItemData.IT_dat.clot)
    cfunc.LegacyGame__lua_SetVariable(120, r0_387.ChItemData.IT_dat.expr)
    cfunc.LegacyGame__lua_SetVariable(121, r0_387.ChItemData.IT_dat.opex)
    cfunc.LegacyGame__lua_SetVariable(122, r0_387.ChItemData.IT_dat.back)
    cfunc.LegacyGame__lua_SetVariable(123, r0_387.ChItemData.IT_dat.time)
    cfunc.LegacyGame__lua_SetFlag(130, r0_387.CharEnable)
    cfunc.LegacyGame__lua_SetFlag(131, r0_387.BackEnable)
    r0_387:GalleryCharaDeletePic()
    r0_387:GalleryCharaSetPic(false)
    local r3_387 = cclass.lua_Layers:create()
    r3_387:swapLayerOrder("GalleryMenu", "GalleryChara", "GalleryBack")
    r3_387:swapLayerOrder("GalleryMenu", "GalleryBace", "GalleryBack")
    r3_387:swapLayerOrder("GalleryMenu", "GalleryChara", "GalleryCharaBu")
    r3_387:swapLayerOrder("GalleryMenu", "GalleryBace", "GalleryCharaBu")
  end
  function r2_341.GalleryCharaSelCursor(r0_388, r1_388, r2_388, r3_388, r4_388)
    -- line: [10936, 10955] id: 388
    if r1_388 == -1 then
      r0_388:ItemSet(r0_388.ChItem, -1, -1)
    elseif 401 <= r2_388 and r2_388 <= 431 then
      local r5_388 = 0
      if r2_388 <= 420 then
        r5_388 = r2_388 - 400
      else
        r5_388 = r2_388 - 420
      end
      r0_388:ItemSet(r0_388.ChItem, r1_388, "OptionItem" .. r0_388:MenuCharaGetItemName(r5_388))
    else
      r0_388:ItemSet(r0_388.ChItem, -1, -1)
    end
  end
  function r2_341.GalleryCharaMenuClose(r0_389, r1_389)
    -- line: [10958, 10985] id: 389
    local r2_389 = cclass.lua_Layers:create()
    if r1_389 then
      r2_389:setVisible("GalleryMenu", "GalleryChara", 0)
      r2_389:setVisible("GalleryMenu", "GalleryBace", 0)
      r0_389.MenuButton:InitList()
      r2_389:setSubLayerParam("GalleryMenu", "GalleryBace", 49, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_389:setSubLayerParam("GalleryMenu", "GalleryBace", 51, LUA_PARAM_COLOR, 1, 1, 1, 0)
    else
      r2_389:setVisible("GalleryMenu", "GalleryChara", 1)
      r2_389:setVisible("GalleryMenu", "GalleryBace", 1)
      r0_389.MenuButton:InitList()
      r0_389.MenuButton:SetList("BT_CharaPage", r0_389.BT_CharaPage)
      r0_389.MenuButton:SetList("BT_DataBace", r0_389.BT_DataBace)
      r2_389:setSubLayerParam("GalleryMenu", "GalleryBace", 49, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_389:setSubLayerParam("GalleryMenu", "GalleryBace", 51, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r0_389:MenuMouseMove("GalleryMenu", "GalleryBace", -1, 0, 0, 0)
    end
  end
  function r2_341.GalleryCharaLD(r0_390, r1_390)
    -- line: [10987, 11023] id: 390
    if 401 <= r1_390 and r1_390 <= 409 then
      r0_390:GalleryCharaChangeItem(0, r1_390 - 400)
    end
    if 421 <= r1_390 and r1_390 <= 429 then
      r0_390:GalleryCharaChangeItem(1, r1_390 - 420)
    end
    if r1_390 == 410 then
      r0_390.CharEnable = true
    end
    if r1_390 == 411 then
      r0_390.BackEnable = true
    end
    if r1_390 == 430 then
      r0_390.CharEnable = false
      if r0_390.BackEnable == false then
        r0_390.BackEnable = true
      end
    end
    if r1_390 == 431 then
      r0_390.BackEnable = false
      if r0_390.CharEnable == false then
        r0_390.CharEnable = true
      end
    end
    if r1_390 == 500 then
      r0_390:GalleryCharaMenuClose(true)
    end
    if r1_390 == 500 or 401 <= r1_390 and r1_390 <= 432 then
      r0_390:GalleryCharaAct()
    end
  end
  r2_341.BackPosY = 0
  function r2_341.GalleryCharaSetPicInit(r0_391)
    -- line: [11028, 11540] id: 391
    r0_391.BackPosY = 0
    r0_391.BackFile = {}
    r0_391.BackFile[1] = {
      "BG01_01S.png",
      "BG01_02S.png",
      "BG01_03S.png",
      "BG01_04S.png",
      "BG01_14S.png"
    }
    r0_391.BackFile[2] = {
      "BG02_01S.png",
      "BG02_02S.png",
      "BG02_03S.png",
      "BG02_04S.png",
      "BG02_05S.png"
    }
    r0_391.BackFile[3] = {
      "BG03_01S.png",
      "BG03_02S.png",
      "BG03_05S.png"
    }
    r0_391.BackFile[4] = {
      "BG04_01S.png",
      "BG04_02S.png",
      "BG04_05S.png"
    }
    r0_391.BackFile[5] = {
      "BG05A_01S.png",
      "BG05B_01S.png",
      "BG05B_02S.png",
      "BG05B_03S.png",
      "BG05B_04S.png",
      "BG05B_05S.png",
      "BG05C_01S.png",
      "BG05C_02S.png",
      "BG05C_03S.png",
      "BG05C_04S.png",
      "BG05C_05S.png",
      "BG05E_01S.png",
      "BG05E_02S.png",
      "BG05E_03S.png"
    }
    r0_391.BackFile[6] = {
      "BG06_01S.png"
    }
    r0_391.BackFile[7] = {
      "BG07_01S.png",
      "BG07_02S.png"
    }
    r0_391.BackFile[8] = {
      "BG08_01S.png",
      "BG08_02S.png",
      "BG08_03S.png",
      "BG08_04S.png",
      "BG08_05S.png",
      "BG08_06S.png"
    }
    r0_391.BackFile[9] = {
      "BG09_01S.png",
      "BG09_02S.png",
      "BG09_03S.png",
      "BG09_04S.png",
      "BG09_05S.png"
    }
    r0_391.BackFile[10] = {
      "BG10_01S.png",
      "BG10_02S.png",
      "BG10_03S.png",
      "BG10_04S.png"
    }
    r0_391.BackFile[11] = {
      "BG11_01S.png",
      "BG11_02S.png",
      "BG11_03S.png",
      "BG11_04S.png",
      "BG11_05S.png"
    }
    r0_391.BackFile[12] = {
      "BG12_01S.png",
      "BG12_02S.png",
      "BG12_03S.png",
      "BG12_05S.png",
      "BG12_06S.png"
    }
    r0_391.BackFile[13] = {
      "BG13_01S.png",
      "BG13_02S.png",
      "BG13_03S.png",
      "BG13_04S.png",
      "BG13_05S.png",
      "BG13_11S.png"
    }
    r0_391.BackFile[14] = {
      "BG14_01S.png",
      "BG14_02S.png"
    }
    r0_391.BackFile[15] = {
      "BG15B_01S.png",
      "BG15B_02S.png",
      "BG15B_03S.png",
      "BG15B_05S.png",
      "BG15_01S.png",
      "BG15_02S.png",
      "BG15_03S.png",
      "BG15_05S.png"
    }
    r0_391.BackFile[16] = {
      "BG16_01S.png",
      "BG16_02S.png",
      "BG16_03S.png",
      "BG16_05S.png",
      "BG16_08S.png",
      "BG16_13S.png",
      "BG16_14S.png"
    }
    r0_391.BackFile[17] = {
      "BG17_01S.png",
      "BG17_02S.png",
      "BG17_03S.png"
    }
    r0_391.BackFile[18] = {
      "BG18_01S.png",
      "BG18_02S.png",
      "BG18_03S.png",
      "BG18_11S.png"
    }
    r0_391.BackFile[19] = {
      "BG19_01S.png",
      "BG19_02S.png",
      "BG19_04S.png",
      "BG19_05S.png",
      "BG19_08S.png",
      "BG19_11S.png",
      "BG19_12S.png",
      "BG19_13S.png",
      "BG19_14S.png",
      "BG19_15S.png",
      "BG19_16S.png"
    }
    r0_391.BackFile[20] = {
      "BG20B_01S.png",
      "BG20C_01S.png",
      "BG20D_01S.png",
      "BG20_01S.png"
    }
    r0_391.BackFile[21] = {
      "BG21_01S.png"
    }
    r0_391.BackFile[22] = {
      "BG22_01S.png",
      "BG22_02S.png",
      "BG22_03S.png",
      "BG22_05S.png",
      "BG22_11S.png",
      "BG22_14S.png",
      "BG22_15S.png"
    }
    r0_391.BackFile[23] = {
      "BG23_01S.png",
      "BG23_03S.png",
      "BG23_14S.png",
      "BG23_15S.png",
      "BG23_16S.png"
    }
    r0_391.BackFile[24] = {
      "BG24_01S.png",
      "BG24_02S.png",
      "BG24_03S.png"
    }
    r0_391.BackFile[25] = {
      "BG25_01S.png"
    }
    r0_391.BackFile[26] = {
      "BG26_01S.png"
    }
    r0_391.BackFile[27] = {
      "BG27_01S.png",
      "BG27_02S.png",
      "BG27_03S.png",
      "BG27_04S.png",
      "BG27_08S.png"
    }
    r0_391.BackFile[28] = {
      "BG28_01S.png",
      "BG28_03S.png",
      "BG28_05S.png"
    }
    r0_391.BackFile[29] = {
      "BG29_01S.png",
      "BG29_05S.png"
    }
    r0_391.BackFile[30] = {
      "BG30_01S.png"
    }
    r0_391.BackFile[31] = {
      "BG31_01S.png"
    }
    r0_391.BackFile[32] = {
      "SKY01_01S.png",
      "SKY01_02S.png",
      "SKY01_03S.png",
      "SKY01_04S.png",
      "SKY01_05S.png",
      "SKY01_06S.png",
      "SKY01_07S.png",
      "SKY01_08S.png"
    }
    r0_391.BackFile[33] = {
      "SKY02_01S.png",
      "SKY02_07S.png",
      "SKY02_08S.png"
    }
    r0_391.BackFile[34] = {
      "SKY06_01S.png",
      "SKY06_07S.png",
      "SKY06_08S.png",
      "SKY06_09S.png",
      "SKY07_07S.png",
      "SKY07_08S.png",
      "SKY08_01S.png"
    }
    r0_391.BackFile[35] = {
      "SKY09_01S.png",
      "SKY09_07S.png",
      "SKY09_08S.png",
      "SKY10_01S.png",
      "SKY10_07S.png",
      "SKY10_08S.png"
    }
    r0_391.BackTime = {}
    r0_391.BackTime["BG01_01S.png"] = 1
    r0_391.BackTime["BG01_02S.png"] = 1
    r0_391.BackTime["BG01_03S.png"] = 1
    r0_391.BackTime["BG01_04S.png"] = 1
    r0_391.BackTime["BG01_14S.png"] = 1
    r0_391.BackTime["BG02_01S.png"] = 1
    r0_391.BackTime["BG02_02S.png"] = 6
    r0_391.BackTime["BG02_03S.png"] = 2
    r0_391.BackTime["BG02_04S.png"] = 3
    r0_391.BackTime["BG02_05S.png"] = 8
    r0_391.BackTime["BG03_01S.png"] = 1
    r0_391.BackTime["BG03_05S.png"] = 7
    r0_391.BackTime["BG04_01S.png"] = 1
    r0_391.BackTime["BG04_02S.png"] = 5
    r0_391.BackTime["BG04_03S.png"] = 7
    r0_391.BackTime["BG05A_01S.png"] = 1
    r0_391.BackTime["BG05B_01S.png"] = 1
    r0_391.BackTime["BG05B_02S.png"] = 5
    r0_391.BackTime["BG05B_03S.png"] = 2
    r0_391.BackTime["BG05B_04S.png"] = 4
    r0_391.BackTime["BG05B_05S.png"] = 7
    r0_391.BackTime["BG05C_01S.png"] = 1
    r0_391.BackTime["BG05C_02S.png"] = 5
    r0_391.BackTime["BG05C_03S.png"] = 2
    r0_391.BackTime["BG05C_04S.png"] = 4
    r0_391.BackTime["BG05C_05S.png"] = 7
    r0_391.BackTime["BG06_01S.png"] = 1
    r0_391.BackTime["BG07_01S.png"] = 1
    r0_391.BackTime["BG07_02S.png"] = 6
    r0_391.BackTime["BG08_01S.png"] = 1
    r0_391.BackTime["BG08_02S.png"] = 5
    r0_391.BackTime["BG08_03S.png"] = 1
    r0_391.BackTime["BG08_04S.png"] = 4
    r0_391.BackTime["BG08_05S.png"] = 7
    r0_391.BackTime["BG08_06S.png"] = 2
    r0_391.BackTime["BG09_01S.png"] = 1
    r0_391.BackTime["BG09_02S.png"] = 5
    r0_391.BackTime["BG09_03S.png"] = 1
    r0_391.BackTime["BG09_04S.png"] = 4
    r0_391.BackTime["BG09_05S.png"] = 7
    r0_391.BackTime["BG10_01S.png"] = 1
    r0_391.BackTime["BG10_02S.png"] = 5
    r0_391.BackTime["BG10_03S.png"] = 1
    r0_391.BackTime["BG10_04S.png"] = 4
    r0_391.BackTime["BG11_01S.png"] = 1
    r0_391.BackTime["BG11_02S.png"] = 6
    r0_391.BackTime["BG11_03S.png"] = 5
    r0_391.BackTime["BG11_04S.png"] = 4
    r0_391.BackTime["BG11_05S.png"] = 8
    r0_391.BackTime["BG12_01S.png"] = 1
    r0_391.BackTime["BG12_02S.png"] = 6
    r0_391.BackTime["BG12_03S.png"] = 5
    r0_391.BackTime["BG12_05S.png"] = 7
    r0_391.BackTime["BG12_06S.png"] = 7
    r0_391.BackTime["BG13_01S.png"] = 1
    r0_391.BackTime["BG13_02S.png"] = 6
    r0_391.BackTime["BG13_03S.png"] = 3
    r0_391.BackTime["BG13_04S.png"] = 4
    r0_391.BackTime["BG13_05S.png"] = 8
    r0_391.BackTime["BG13_11S.png"] = 10
    r0_391.BackTime["BG14_01S.png"] = 1
    r0_391.BackTime["BG14_02S.png"] = 5
    r0_391.BackTime["BG15_01S.png"] = 1
    r0_391.BackTime["BG15_02S.png"] = 6
    r0_391.BackTime["BG15_03S.png"] = 3
    r0_391.BackTime["BG15_05S.png"] = 8
    r0_391.BackTime["BG15B_01S.png"] = 1
    r0_391.BackTime["BG15B_02S.png"] = 6
    r0_391.BackTime["BG15B_03S.png"] = 3
    r0_391.BackTime["BG15B_05S.png"] = 8
    r0_391.BackTime["BG16_01S.png"] = 1
    r0_391.BackTime["BG16_02S.png"] = 6
    r0_391.BackTime["BG16_03S.png"] = 3
    r0_391.BackTime["BG16_05S.png"] = 8
    r0_391.BackTime["BG16_08S.png"] = 4
    r0_391.BackTime["BG16_13S.png"] = 12
    r0_391.BackTime["BG16_14S.png"] = 14
    r0_391.BackTime["BG17_01S.png"] = 1
    r0_391.BackTime["BG17_02S.png"] = 6
    r0_391.BackTime["BG17_03S.png"] = 3
    r0_391.BackTime["BG18_01S.png"] = 1
    r0_391.BackTime["BG18_02S.png"] = 6
    r0_391.BackTime["BG18_03S.png"] = 3
    r0_391.BackTime["BG18_11S.png"] = 10
    r0_391.BackTime["BG19_01S.png"] = 1
    r0_391.BackTime["BG19_02S.png"] = 6
    r0_391.BackTime["BG19_04S.png"] = 4
    r0_391.BackTime["BG19_05S.png"] = 8
    r0_391.BackTime["BG19_11S.png"] = 9
    r0_391.BackTime["BG19_12S.png"] = 13
    r0_391.BackTime["BG19_13S.png"] = 11
    r0_391.BackTime["BG19_14S.png"] = 14
    r0_391.BackTime["BG19_15S.png"] = 12
    r0_391.BackTime["BG19_16S.png"] = 1
    r0_391.BackTime["BG20_01S.png"] = 1
    r0_391.BackTime["BG20B_01S.png"] = 1
    r0_391.BackTime["BG20C_01S.png"] = 1
    r0_391.BackTime["BG20D_01S.png"] = 1
    r0_391.BackTime["BG21_01S.png"] = 1
    r0_391.BackTime["BG22_01S.png"] = 1
    r0_391.BackTime["BG22_02S.png"] = 6
    r0_391.BackTime["BG22_03S.png"] = 3
    r0_391.BackTime["BG22_05S.png"] = 8
    r0_391.BackTime["BG22_11S.png"] = 10
    r0_391.BackTime["BG22_14S.png"] = 14
    r0_391.BackTime["BG22_15S.png"] = 12
    r0_391.BackTime["BG23_01S.png"] = 1
    r0_391.BackTime["BG23_03S.png"] = 3
    r0_391.BackTime["BG23_14S.png"] = 14
    r0_391.BackTime["BG23_15S.png"] = 12
    r0_391.BackTime["BG24_01S.png"] = 1
    r0_391.BackTime["BG24_02S.png"] = 5
    r0_391.BackTime["BG25_01S.png"] = 1
    r0_391.BackTime["BG26_01S.png"] = 1
    r0_391.BackTime["BG27_01S.png"] = 1
    r0_391.BackTime["BG27_02S.png"] = 1
    r0_391.BackTime["BG27_03S.png"] = 1
    r0_391.BackTime["BG27_04S.png"] = 1
    r0_391.BackTime["BG27_08S.png"] = 1
    r0_391.BackTime["BG28_01S.png"] = 1
    r0_391.BackTime["BG28_03S.png"] = 1
    r0_391.BackTime["BG28_05S.png"] = 7
    r0_391.BackTime["BG29_01S.png"] = 1
    r0_391.BackTime["BG29_05S.png"] = 8
    r0_391.BackTime["BG30_01S.png"] = 1
    r0_391.BackTime["BG31_01S.png"] = 1
    r0_391.BackTimeColor = {}
    r0_391.BackTimeColor[1] = {
      r = 1,
      g = 1,
      b = 1,
      a = 1,
    }
    r0_391.BackTimeColor[2] = {
      r = 0.9,
      g = 0.95,
      b = 1,
      a = 1,
    }
    r0_391.BackTimeColor[3] = {
      r = 0.84,
      g = 0.91,
      b = 1,
      a = 1,
    }
    r0_391.BackTimeColor[4] = {
      r = 0.55,
      g = 0.66,
      b = 0.74,
      a = 1,
    }
    r0_391.BackTimeColor[5] = {
      r = 1,
      g = 0.95,
      b = 0.92,
      a = 1,
    }
    r0_391.BackTimeColor[6] = {
      r = 1,
      g = 0.92,
      b = 0.83,
      a = 1,
    }
    r0_391.BackTimeColor[7] = {
      r = 0.95,
      g = 0.95,
      b = 0.97,
      a = 1,
    }
    r0_391.BackTimeColor[8] = {
      r = 0.89,
      g = 0.89,
      b = 0.94,
      a = 1,
    }
    r0_391.BackTimeColor[9] = {
      r = 1,
      g = 0.91,
      b = 0.97,
      a = 1,
    }
    r0_391.BackTimeColor[10] = {
      r = 0.98,
      g = 0.86,
      b = 0.94,
      a = 1,
    }
    r0_391.BackTimeColor[11] = {
      r = 0.95,
      g = 0.95,
      b = 1,
      a = 1,
    }
    r0_391.BackTimeColor[12] = {
      r = 0.92,
      g = 0.92,
      b = 1,
      a = 1,
    }
    r0_391.BackTimeColor[13] = {
      r = 0.9,
      g = 0.9,
      b = 0.94,
      a = 1,
    }
    r0_391.BackTimeColor[14] = {
      r = 0.89,
      g = 0.89,
      b = 0.94,
      a = 1,
    }
    local function r1_391(r0_392, r1_392)
      -- line: [11222, 11228] id: 392
      return {
        x = r0_392,
        y = r1_392,
      }
    end
    r0_391.CharaPos = {}
    r0_391.CharaPos["A\x8f\xac\x92\xb9_01S.pna"] = r1_391(367, -100)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_02S.pna"] = r1_391(274, -99)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_03S.pna"] = r1_391(425, -100)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_01S.pna"] = r1_391(383, -100)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_02S.pna"] = r1_391(463, -100)
    r0_391.CharaPos["C\x93V\x89\xb9_01S.pna"] = r1_391(347, -100)
    r0_391.CharaPos["C\x93V\x89\xb9_02S.pna"] = r1_391(494, -100)
    r0_391.CharaPos["C\x93V\x89\xb9_03S.pna"] = r1_391(434, -101)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_01S.pna"] = r1_391(428, -100)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_02S.pna"] = r1_391(463, -100)
    r0_391.CharaPos["E\x96\xe9\x97\xda_01S.pna"] = r1_391(428, -100)
    r0_391.CharaPos["E\x96\xe9\x97\xda_02S.pna"] = r1_391(421, -100)
    r0_391.CharaPos["F\x82Ђ\u{382}\xe8_01S.pna"] = r1_391(492, -100)
    r0_391.CharaPos["G\x82ق\xbd\x82\xe9_01S.pna"] = r1_391(498, -100)
    r0_391.CharaPos["H\x8e\xe9\xe4\xbb_01S.pna"] = r1_391(455, -100)
    r0_391.CharaPos["I\x89\xc0\x93ގq_01S.pna"] = r1_391(473, -100)
    r0_391.CharaPos["J\x92B\x96\xe7_01S.pna"] = r1_391(394, -91)
    r0_391.CharaPos["K\x96\x8f\x8e\x9f_01S.pna"] = r1_391(479, -100)
    r0_391.CharaPos["L\x8c~_01S.pna"] = r1_391(435, -101)
    r0_391.CharaPos["M\x95\xc9_01S.pna"] = r1_391(472, -100)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_01M.pna"] = r1_391(378, -100)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_02M.pna"] = r1_391(281, -100)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_03M.pna"] = r1_391(384, -100)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_01M.pna"] = r1_391(290, -101)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_02M.pna"] = r1_391(408, -100)
    r0_391.CharaPos["C\x93V\x89\xb9_01M.pna"] = r1_391(237, -100)
    r0_391.CharaPos["C\x93V\x89\xb9_02M.pna"] = r1_391(443, -100)
    r0_391.CharaPos["C\x93V\x89\xb9_03M.pna"] = r1_391(359, -99)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_01M.pna"] = r1_391(351, -100)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_02M.pna"] = r1_391(396, -100)
    r0_391.CharaPos["E\x96\xe9\x97\xda_01M.pna"] = r1_391(351, -100)
    r0_391.CharaPos["E\x96\xe9\x97\xda_02M.pna"] = r1_391(341, -99)
    r0_391.CharaPos["F\x82Ђ\u{382}\xe8_01M.pna"] = r1_391(440, -100)
    r0_391.CharaPos["G\x82ق\xbd\x82\xe9_01M.pna"] = r1_391(462, -100)
    r0_391.CharaPos["H\x8e\xe9\xe4\xbb_01M.pna"] = r1_391(388, -100)
    r0_391.CharaPos["I\x89\xc0\x93ގq_01M.pna"] = r1_391(413, -100)
    r0_391.CharaPos["J\x92B\x96\xe7_01M.pna"] = r1_391(303, -100)
    r0_391.CharaPos["K\x96\x8f\x8e\x9f_01M.pna"] = r1_391(423, -100)
    r0_391.CharaPos["L\x8c~_01M.pna"] = r1_391(341, -100)
    r0_391.CharaPos["M\x95\xc9_01M.pna"] = r1_391(405, -100)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_01L.pna"] = r1_391(121, -101)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_02L.pna"] = r1_391(360, -100)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_03L.pna"] = r1_391(169, -99)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_01L.pna"] = r1_391(344, -100)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_02L.pna"] = r1_391(300, -99)
    r0_391.CharaPos["C\x93V\x89\xb9_01L.pna"] = r1_391(132, -100)
    r0_391.CharaPos["C\x93V\x89\xb9_02L.pna"] = r1_391(283, -100)
    r0_391.CharaPos["C\x93V\x89\xb9_03L.pna"] = r1_391(172, -101)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_01L.pna"] = r1_391(169, -100)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_02L.pna"] = r1_391(246, -100)
    r0_391.CharaPos["E\x96\xe9\x97\xda_01L.pna"] = r1_391(169, -100)
    r0_391.CharaPos["E\x96\xe9\x97\xda_02L.pna"] = r1_391(54, -99)
    r0_391.CharaPos["F\x82Ђ\u{382}\xe8_01L.pna"] = r1_391(289, -100)
    r0_391.CharaPos["G\x82ق\xbd\x82\xe9_01L.pna"] = r1_391(297, -110)
    r0_391.CharaPos["H\x8e\xe9\xe4\xbb_01L.pna"] = r1_391(190, -141)
    r0_391.CharaPos["I\x89\xc0\x93ގq_01L.pna"] = r1_391(182, -99)
    r0_391.CharaPos["J\x92B\x96\xe7_01L.pna"] = r1_391(66, -100)
    r0_391.CharaPos["K\x96\x8f\x8e\x9f_01L.pna"] = r1_391(243, -180)
    r0_391.CharaPos["L\x8c~_01L.pna"] = r1_391(78, -102)
    r0_391.CharaPos["M\x95\xc9_01L.pna"] = r1_391(265, -100)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_02W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["A\x8f\xac\x92\xb9_03W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_02W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["C\x93V\x89\xb9_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["C\x93V\x89\xb9_02W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["C\x93V\x89\xb9_03W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_02W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["E\x96\xe9\x97\xda_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["E\x96\xe9\x97\xda_02W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["F\x82Ђ\u{382}\xe8_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["G\x82ق\xbd\x82\xe9_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["H\x8e\xe9\xe4\xbb_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["I\x89\xc0\x93ގq_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["J\x92B\x96\xe7_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["K\x96\x8f\x8e\x9f_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["L\x8c~_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["M\x95\xc9_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_03S.pna"] = r1_391(513, -110)
    r0_391.CharaPos["N\x83C\x83X\x83J_01S.pna"] = r1_391(452, -94)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_03S.pna"] = r1_391(429, -100)
    r0_391.CharaPos["E\x96\xe9\x97\xda_03S.pna"] = r1_391(429, -100)
    r0_391.CharaPos["O\x91\x81\x95c_01S.pna"] = r1_391(524, -120)
    r0_391.CharaPos["Q\x97R\x89\xc0_01S.pna"] = r1_391(481, -100)
    r0_391.CharaPos["P\x97\xba\x8eq_01S.pna"] = r1_391(496, -113)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_03M.pna"] = r1_391(470, -100)
    r0_391.CharaPos["N\x83C\x83X\x83J_01M.pna"] = r1_391(410, -96)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_03M.pna"] = r1_391(333, -99)
    r0_391.CharaPos["E\x96\xe9\x97\xda_03M.pna"] = r1_391(333, -99)
    r0_391.CharaPos["O\x91\x81\x95c_01M.pna"] = r1_391(498, -100)
    r0_391.CharaPos["Q\x97R\x89\xc0_01M.pna"] = r1_391(440, -100)
    r0_391.CharaPos["P\x97\xba\x8eq_01M.pna"] = r1_391(450, -100)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_03L.pna"] = r1_391(309, -100)
    r0_391.CharaPos["N\x83C\x83X\x83J_01L.pna"] = r1_391(243, -82)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_03L.pna"] = r1_391(4, -100)
    r0_391.CharaPos["E\x96\xe9\x97\xda_03L.pna"] = r1_391(4, -100)
    r0_391.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_03W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["N\x83C\x83X\x83J_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["D\x88\x9f\x8e\xd1_03W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["E\x96\xe9\x97\xda_03W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["O\x91\x81\x95c_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["Q\x97R\x89\xc0_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["P\x97\xba\x8eq_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["R\x83n\x83b\x83g_01M.pna"] = r1_391(260, 0)
    r0_391.CharaPos["R\x83n\x83b\x83g_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["S\x97\xb2\x95v_01S.pna"] = r1_391(430, -99)
    r0_391.CharaPos["S\x97\xb2\x95v_01M.pna"] = r1_391(331, -100)
    r0_391.CharaPos["S\x97\xb2\x95v_01L.pna"] = r1_391(144, -100)
    r0_391.CharaPos["S\x97\xb2\x95v_01W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["\x90\xb0\x8aCST01_S.pna"] = r1_391(379, -100)
    r0_391.CharaPos["\x8f\xac\x92\xb9FDST02_S.pna"] = r1_391(434, -100)
    r0_391.CharaPos["\x8f\xac\x92\xb9FDST01_S.pna"] = r1_391(454, -100)
    r0_391.CharaPos["\x89\xc0\x93ގqST02_S.pna"] = r1_391(446, -100)
    r0_391.CharaPos["\x82ق\xbd\x82\xe9ST02_S.pna"] = r1_391(492, -100)
    r0_391.CharaPos["\x83C\x83X\x83JFDST01_S.pna"] = r1_391(448, -100)
    r0_391.CharaPos["\xea\xa1ST01_S.pna"] = r1_391(495, -100)
    r0_391.CharaPos["\x92B\x96\xe7FDST01_S.pna"] = r1_391(431, -100)
    r0_391.CharaPos["\x90\xb0\x8aCST01_M.pna"] = r1_391(327, -100)
    r0_391.CharaPos["\x8f\xac\x92\xb9FDST02_M.pna"] = r1_391(378, -100)
    r0_391.CharaPos["\x8f\xac\x92\xb9FDST01_M.pna"] = r1_391(385, -100)
    r0_391.CharaPos["\x89\xc0\x93ގqST02_M.pna"] = r1_391(368, -100)
    r0_391.CharaPos["\x82ق\xbd\x82\xe9ST02_M.pna"] = r1_391(446, -100)
    r0_391.CharaPos["\x83C\x83X\x83JFDST01_M.pna"] = r1_391(394, -100)
    r0_391.CharaPos["\xea\xa1ST01_M.pna"] = r1_391(447, -100)
    r0_391.CharaPos["\x92B\x96\xe7FDST01_M.pna"] = r1_391(379, -100)
    r0_391.CharaPos["\x90\xb0\x8aCST01_L.pna"] = r1_391(71, -130)
    r0_391.CharaPos["\x8f\xac\x92\xb9FDST02_L.pna"] = r1_391(107, -100)
    r0_391.CharaPos["\x8f\xac\x92\xb9FDST01_L.pna"] = r1_391(160, -100)
    r0_391.CharaPos["\x89\xc0\x93ގqST02_L.pna"] = r1_391(201, -142)
    r0_391.CharaPos["\x82ق\xbd\x82\xe9ST02_L.pna"] = r1_391(263, -100)
    r0_391.CharaPos["\x83C\x83X\x83JFDST01_L.pna"] = r1_391(205, -100)
    r0_391.CharaPos["\xea\xa1ST01_L.pna"] = r1_391(264, -100)
    r0_391.CharaPos["\x92B\x96\xe7FDST01_L.pna"] = r1_391(110, -180)
    r0_391.CharaPos["\x90\xb0\x8aCST01_W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["\x8f\xac\x92\xb9FDST02_W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["\x8f\xac\x92\xb9FDST01_W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["\x89\xc0\x93ގqST02_W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["\x82ق\xbd\x82\xe9ST02_W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["\x83C\x83X\x83JFDST01_W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["\xea\xa1ST01_W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["\x92B\x96\xe7FDST01_W.pna"] = r1_391(431, 29)
    r0_391.CharaPos["R\x83n\x83b\x83g_01\x92ǉ\xc1_M.pna"] = r1_391(384, 2)
    r0_391.CharaPos["R\x83n\x83b\x83g_01\x92ǉ\xc1_W.pna"] = r1_391(431, 29)
    local function r2_391(r0_393, r1_393, r2_393, r3_393, r4_393, r5_393, r6_393, r7_393)
      -- line: [11386, 11397] id: 393
      return {
        clot = r0_393,
        opex = r1_393,
        etc = r2_393,
        frame = r3_393,
        poDi = r4_393,
        expr1 = r5_393,
        expr2 = r6_393,
        expr3 = r7_393,
      }
    end
    r0_391.CharaLayer = {}
    r0_391.CharaLayer[1] = {}
    r0_391.CharaLayer[1][1] = r2_391({
      54,
      51,
      48,
      45,
      57,
      -1,
      -1
    }, {
      0,
      1,
      -1
    }, 58, 59, 3, {
      42,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[1][2] = r2_391({
      51,
      53,
      49,
      47,
      55,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 57, 1, {
      46,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[1][3] = r2_391({
      39,
      37,
      33,
      35,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, 31, 42, 2, {
      30,
      4
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[1][4] = r2_391({
      55,
      51,
      -1,
      -1,
      59,
      -1,
      47
    }, {
      0,
      -1,
      -1
    }, -1, 62, 2, {
      42,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[1][5] = r2_391({
      37,
      32,
      -1,
      -1,
      42,
      -1,
      27
    }, {
      0,
      -1,
      -1
    }, -1, 45, 3, {
      21,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[2] = {}
    r0_391.CharaLayer[2][1] = r2_391({
      49,
      47,
      45,
      43,
      51,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 52, 2, {
      41,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[2][2] = r2_391({
      33,
      31,
      29,
      27,
      35,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 36, 2, {
      25,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[2][3] = r2_391({
      38,
      37,
      35,
      36,
      39,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 40, 1, {
      34,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[3] = {}
    r0_391.CharaLayer[3][1] = r2_391({
      57,
      54,
      48,
      45,
      60,
      -1,
      -1
    }, {
      1,
      0,
      2
    }, -1, 61, 3, {
      42,
      3
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[3][2] = r2_391({
      59,
      56,
      47,
      53,
      62,
      -1,
      -1
    }, {
      2,
      -1,
      0
    }, 1, 63, 3, {
      44,
      24
    }, {
      -1,
      -1
    }, {
      23,
      3
    })
    r0_391.CharaLayer[3][3] = r2_391({
      48,
      47,
      45,
      44,
      49,
      -1,
      -1
    }, {
      2,
      1,
      0
    }, -1, 50, 1, {
      43,
      3
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[4] = {}
    r0_391.CharaLayer[4][1] = r2_391({
      68,
      66,
      62,
      64,
      70,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, 0, 71, 2, {
      60,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[4][2] = r2_391({
      46,
      44,
      42,
      40,
      48,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, 1, 49, 2, {
      38,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[4][3] = r2_391({
      62,
      59,
      53,
      56,
      65,
      -1,
      -1
    }, {
      1,
      -1,
      -1
    }, 0, 66, 3, {
      50,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[5] = {}
    r0_391.CharaLayer[5][1] = r2_391({
      68,
      66,
      62,
      64,
      70,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, 0, 71, 2, {
      60,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[5][2] = r2_391({
      34,
      33,
      32,
      31,
      35,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, 1, 36, 1, {
      30,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[5][3] = r2_391({
      62,
      59,
      53,
      56,
      65,
      -1,
      -1
    }, {
      1,
      -1,
      -1
    }, 0, 66, 3, {
      50,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[6] = {}
    r0_391.CharaLayer[6][1] = r2_391({
      48,
      46,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 49, 2, {
      44,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[6][2] = r2_391({
      35,
      31,
      -1,
      -1,
      39,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 42, 2, {
      26,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[7] = {}
    r0_391.CharaLayer[7][1] = r2_391({
      88,
      86,
      -1,
      84,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 89, 2, {
      82,
      42
    }, {
      41,
      1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[7][2] = r2_391({
      27,
      30,
      -1,
      33,
      41,
      37,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 44, 2, {
      23,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[8] = {}
    r0_391.CharaLayer[8][1] = r2_391({
      -1,
      46,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 47, 2, {
      44,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[9] = {}
    r0_391.CharaLayer[9][1] = r2_391({
      46,
      44,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 47, 2, {
      42,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[10] = {}
    r0_391.CharaLayer[10][1] = r2_391({
      23,
      22,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 24, 1, {
      21,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[11] = {}
    r0_391.CharaLayer[11][1] = r2_391({
      -1,
      41,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 42, 2, {
      39,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[12] = {}
    r0_391.CharaLayer[12][1] = r2_391({
      44,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 47, 1, {
      40,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[13] = {}
    r0_391.CharaLayer[13][1] = r2_391({
      41,
      40,
      -1,
      -1,
      -1,
      -1,
      42
    }, {
      1,
      -1,
      -1
    }, 0, 43, 1, {
      39,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[14] = {}
    r0_391.CharaLayer[14][1] = r2_391({
      42,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 43, 1, {
      41,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[15] = {}
    r0_391.CharaLayer[15][1] = r2_391({
      -1,
      67,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 70, 1, {
      63,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[16] = {}
    r0_391.CharaLayer[16][1] = r2_391({
      46,
      43,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 49, 1, {
      39,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[17] = {}
    r0_391.CharaLayer[17][1] = r2_391({
      45,
      42,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 48, 1, {
      38,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[18] = {}
    r0_391.CharaLayer[18][1] = r2_391({
      -1,
      27,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, 0, 28, 1, {
      26,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[19] = {}
    r0_391.CharaLayer[19][1] = r2_391({
      -1,
      34,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 35, 1, {
      33,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[20] = {}
    r0_391.CharaLayer[20][1] = r2_391({
      35,
      34,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 36, 1, {
      33,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[21] = {}
    r0_391.CharaLayer[21][1] = r2_391({
      32,
      33,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      31,
      -1,
      -1
    }, -1, 34, 1, {
      30,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[22] = {}
    r0_391.CharaLayer[22][1] = r2_391({
      33,
      34,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      32,
      -1,
      -1
    }, -1, 35, 1, {
      31,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaLayer[23] = {}
    r0_391.CharaLayer[23][1] = r2_391({
      -1,
      -2,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, -1, 1, {
      4,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_391.CharaFile = {}
    r0_391.CharaFile[1] = {}
    r0_391.CharaFile[1][1] = {
      "A\x8f\xac\x92\xb9_01M.pna",
      "A\x8f\xac\x92\xb9_01S.pna",
      "A\x8f\xac\x92\xb9_01L.pna",
      "A\x8f\xac\x92\xb9_01W.pna"
    }
    r0_391.CharaFile[1][2] = {
      "A\x8f\xac\x92\xb9_02M.pna",
      "A\x8f\xac\x92\xb9_02S.pna",
      "A\x8f\xac\x92\xb9_02L.pna",
      "A\x8f\xac\x92\xb9_02W.pna"
    }
    r0_391.CharaFile[1][3] = {
      "A\x8f\xac\x92\xb9_03M.pna",
      "A\x8f\xac\x92\xb9_03S.pna",
      "A\x8f\xac\x92\xb9_03L.pna",
      "A\x8f\xac\x92\xb9_03W.pna"
    }
    r0_391.CharaFile[1][4] = {
      "\x8f\xac\x92\xb9FDST01_M.pna",
      "\x8f\xac\x92\xb9FDST01_S.pna",
      "\x8f\xac\x92\xb9FDST01_L.pna",
      "\x8f\xac\x92\xb9FDST01_W.pna"
    }
    r0_391.CharaFile[1][5] = {
      "\x8f\xac\x92\xb9FDST02_M.pna",
      "\x8f\xac\x92\xb9FDST02_S.pna",
      "\x8f\xac\x92\xb9FDST02_L.pna",
      "\x8f\xac\x92\xb9FDST02_W.pna"
    }
    r0_391.CharaFile[2] = {}
    r0_391.CharaFile[2][1] = {
      "B\x82\xa0\x82\xb0\x82\xcd_01M.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_01S.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_01L.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_01W.pna"
    }
    r0_391.CharaFile[2][2] = {
      "B\x82\xa0\x82\xb0\x82\xcd_02M.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_02S.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_02L.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_02W.pna"
    }
    r0_391.CharaFile[2][3] = {
      "B\x82\xa0\x82\xb0\x82\xcd_03M.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_03S.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_03L.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_03W.pna"
    }
    r0_391.CharaFile[3] = {}
    r0_391.CharaFile[3][1] = {
      "C\x93V\x89\xb9_01M.pna",
      "C\x93V\x89\xb9_01S.pna",
      "C\x93V\x89\xb9_01L.pna",
      "C\x93V\x89\xb9_01W.pna"
    }
    r0_391.CharaFile[3][2] = {
      "C\x93V\x89\xb9_02M.pna",
      "C\x93V\x89\xb9_02S.pna",
      "C\x93V\x89\xb9_02L.pna",
      "C\x93V\x89\xb9_02W.pna"
    }
    r0_391.CharaFile[3][3] = {
      "C\x93V\x89\xb9_03M.pna",
      "C\x93V\x89\xb9_03S.pna",
      "C\x93V\x89\xb9_03L.pna",
      "C\x93V\x89\xb9_03W.pna"
    }
    r0_391.CharaFile[4] = {}
    r0_391.CharaFile[4][1] = {
      "D\x88\x9f\x8e\xd1_01M.pna",
      "D\x88\x9f\x8e\xd1_01S.pna",
      "D\x88\x9f\x8e\xd1_01L.pna",
      "D\x88\x9f\x8e\xd1_01W.pna"
    }
    r0_391.CharaFile[4][2] = {
      "D\x88\x9f\x8e\xd1_02M.pna",
      "D\x88\x9f\x8e\xd1_02S.pna",
      "D\x88\x9f\x8e\xd1_02L.pna",
      "D\x88\x9f\x8e\xd1_02W.pna"
    }
    r0_391.CharaFile[4][3] = {
      "D\x88\x9f\x8e\xd1_03M.pna",
      "D\x88\x9f\x8e\xd1_03S.pna",
      "D\x88\x9f\x8e\xd1_03L.pna",
      "D\x88\x9f\x8e\xd1_03W.pna"
    }
    r0_391.CharaFile[5] = {}
    r0_391.CharaFile[5][1] = {
      "E\x96\xe9\x97\xda_01M.pna",
      "E\x96\xe9\x97\xda_01S.pna",
      "E\x96\xe9\x97\xda_01L.pna",
      "E\x96\xe9\x97\xda_01W.pna"
    }
    r0_391.CharaFile[5][2] = {
      "E\x96\xe9\x97\xda_02M.pna",
      "E\x96\xe9\x97\xda_02S.pna",
      "E\x96\xe9\x97\xda_02L.pna",
      "E\x96\xe9\x97\xda_02W.pna"
    }
    r0_391.CharaFile[5][3] = {
      "E\x96\xe9\x97\xda_03M.pna",
      "E\x96\xe9\x97\xda_03S.pna",
      "E\x96\xe9\x97\xda_03L.pna",
      "E\x96\xe9\x97\xda_03W.pna"
    }
    r0_391.CharaFile[6] = {}
    r0_391.CharaFile[6][1] = {
      "G\x82ق\xbd\x82\xe9_01M.pna",
      "G\x82ق\xbd\x82\xe9_01S.pna",
      "G\x82ق\xbd\x82\xe9_01L.pna",
      "G\x82ق\xbd\x82\xe9_01W.pna"
    }
    r0_391.CharaFile[6][2] = {
      "\x82ق\xbd\x82\xe9ST02_M.pna",
      "\x82ق\xbd\x82\xe9ST02_S.pna",
      "\x82ق\xbd\x82\xe9ST02_L.pna",
      "\x82ق\xbd\x82\xe9ST02_W.pna"
    }
    r0_391.CharaFile[7] = {}
    r0_391.CharaFile[7][1] = {
      "I\x89\xc0\x93ގq_01M.pna",
      "I\x89\xc0\x93ގq_01S.pna",
      "I\x89\xc0\x93ގq_01L.pna",
      "I\x89\xc0\x93ގq_01W.pna"
    }
    r0_391.CharaFile[7][2] = {
      "\x89\xc0\x93ގqST02_M.pna",
      "\x89\xc0\x93ގqST02_S.pna",
      "\x89\xc0\x93ގqST02_L.pna",
      "\x89\xc0\x93ގqST02_W.pna"
    }
    r0_391.CharaFile[8] = {}
    r0_391.CharaFile[8][1] = {
      "F\x82Ђ\u{382}\xe8_01M.pna",
      "F\x82Ђ\u{382}\xe8_01S.pna",
      "F\x82Ђ\u{382}\xe8_01L.pna",
      "F\x82Ђ\u{382}\xe8_01W.pna"
    }
    r0_391.CharaFile[9] = {}
    r0_391.CharaFile[9][1] = {
      "H\x8e\xe9\xe4\xbb_01M.pna",
      "H\x8e\xe9\xe4\xbb_01S.pna",
      "H\x8e\xe9\xe4\xbb_01L.pna",
      "H\x8e\xe9\xe4\xbb_01W.pna"
    }
    r0_391.CharaFile[10] = {}
    r0_391.CharaFile[10][1] = {
      "M\x95\xc9_01M.pna",
      "M\x95\xc9_01S.pna",
      "M\x95\xc9_01L.pna",
      "M\x95\xc9_01W.pna"
    }
    r0_391.CharaFile[11] = {}
    r0_391.CharaFile[11][1] = {
      "J\x92B\x96\xe7_01M.pna",
      "J\x92B\x96\xe7_01S.pna",
      "J\x92B\x96\xe7_01L.pna",
      "J\x92B\x96\xe7_01W.pna"
    }
    r0_391.CharaFile[12] = {}
    r0_391.CharaFile[12][1] = {
      "\x92B\x96\xe7FDST01_M.pna",
      "\x92B\x96\xe7FDST01_S.pna",
      "\x92B\x96\xe7FDST01_L.pna",
      "\x92B\x96\xe7FDST01_W.pna"
    }
    r0_391.CharaFile[13] = {}
    r0_391.CharaFile[13][1] = {
      "K\x96\x8f\x8e\x9f_01M.pna",
      "K\x96\x8f\x8e\x9f_01S.pna",
      "K\x96\x8f\x8e\x9f_01L.pna",
      "K\x96\x8f\x8e\x9f_01W.pna"
    }
    r0_391.CharaFile[14] = {}
    r0_391.CharaFile[14][1] = {
      "N\x83C\x83X\x83J_01M.pna",
      "N\x83C\x83X\x83J_01S.pna",
      "N\x83C\x83X\x83J_01L.pna",
      "N\x83C\x83X\x83J_01W.pna"
    }
    r0_391.CharaFile[15] = {}
    r0_391.CharaFile[15][1] = {
      "\x83C\x83X\x83JFDST01_M.pna",
      "\x83C\x83X\x83JFDST01_S.pna",
      "\x83C\x83X\x83JFDST01_L.pna",
      "\x83C\x83X\x83JFDST01_W.pna"
    }
    r0_391.CharaFile[16] = {}
    r0_391.CharaFile[16][1] = {
      "\xea\xa1ST01_M.pna",
      "\xea\xa1ST01_S.pna",
      "\xea\xa1ST01_L.pna",
      "\xea\xa1ST01_W.pna"
    }
    r0_391.CharaFile[17] = {}
    r0_391.CharaFile[17][1] = {
      "\x90\xb0\x8aCST01_M.pna",
      "\x90\xb0\x8aCST01_S.pna",
      "\x90\xb0\x8aCST01_L.pna",
      "\x90\xb0\x8aCST01_W.pna"
    }
    r0_391.CharaFile[18] = {}
    r0_391.CharaFile[18][1] = {
      "L\x8c~_01M.pna",
      "L\x8c~_01S.pna",
      "L\x8c~_01L.pna",
      "L\x8c~_01W.pna"
    }
    r0_391.CharaFile[19] = {}
    r0_391.CharaFile[19][1] = {
      "S\x97\xb2\x95v_01M.pna",
      "S\x97\xb2\x95v_01S.pna",
      "S\x97\xb2\x95v_01L.pna",
      "S\x97\xb2\x95v_01W.pna"
    }
    r0_391.CharaFile[20] = {}
    r0_391.CharaFile[20][1] = {
      "Q\x97R\x89\xc0_01M.pna",
      "Q\x97R\x89\xc0_01S.pna",
      nil,
      "Q\x97R\x89\xc0_01W.pna"
    }
    r0_391.CharaFile[21] = {}
    r0_391.CharaFile[21][1] = {
      "O\x91\x81\x95c_01M.pna",
      "O\x91\x81\x95c_01S.pna",
      nil,
      "O\x91\x81\x95c_01W.pna"
    }
    r0_391.CharaFile[22] = {}
    r0_391.CharaFile[22][1] = {
      "P\x97\xba\x8eq_01M.pna",
      "P\x97\xba\x8eq_01S.pna",
      nil,
      "P\x97\xba\x8eq_01W.pna"
    }
    r0_391.CharaFile[23] = {}
    r0_391.CharaFile[23][1] = {
      "R\x83n\x83b\x83g_01M.pna",
      nil,
      nil,
      "R\x83n\x83b\x83g_01W.pna"
    }
    r0_391.CharaFile[24] = {}
    r0_391.CharaFile[24][1] = {
      "R\x83n\x83b\x83g_01\x92ǉ\xc1_M.pna",
      nil,
      nil,
      "R\x83n\x83b\x83g_01\x92ǉ\xc1_W.pna"
    }
  end
  function r2_341.GalleryCharaSetPic(r0_394, r1_394)
    -- line: [11543, 11736] id: 394
    local r2_394 = 1
    local r3_394 = 1
    local r4_394 = 1
    local r5_394 = 1
    local r6_394 = 1
    local r7_394 = 1
    local r8_394 = 1
    local r9_394 = 1
    local r10_394 = 1
    local r11_394 = cclass.lua_Layers:create()
    if r1_394 == false then
      r2_394 = r0_394.ChItemData.IT_dat.back
      r3_394 = r0_394.ChItemData.IT_dat.time
      r4_394 = r0_394.ChItemData.IT_dat.char
      r5_394 = r0_394.ChItemData.IT_dat.size
      r6_394 = r0_394.ChItemData.IT_dat.pose
      r7_394 = r0_394.ChItemData.IT_dat.poDi
      r8_394 = r0_394.ChItemData.IT_dat.clot
      r9_394 = r0_394.ChItemData.IT_dat.expr
      r10_394 = r0_394.ChItemData.IT_dat.opex
    end
    local r12_394 = r0_394.BackFile[r2_394][r3_394]
    local r13_394 = r0_394.CharaFile[r4_394][r6_394][r5_394]
    if r4_394 == 23 and r9_394 == 6 then
      r13_394 = r0_394.CharaFile[24][r6_394][r5_394]
    end
    r0_394:MenuLoadLayer("GalleryBack", r12_394)
    if r0_394.BackEnable == true then
      r11_394:setVisible("GalleryMenu", "GalleryBack", 1)
    else
      r11_394:setVisible("GalleryMenu", "GalleryBack", 0)
    end
    r11_394:setParam("GalleryMenu", "GalleryBack", LUA_PARAM_POS, 0, r0_394.BackPosY, 0, 0)
    r0_394:MenuLoadLayer("GalleryCharaBu", r13_394)
    if r0_394.CharEnable == true then
      r11_394:setVisible("GalleryMenu", "GalleryCharaBu", 1)
    else
      r11_394:setVisible("GalleryMenu", "GalleryCharaBu", 0)
    end
    if r5_394 == 4 or r4_394 == 23 then
      r11_394:setParam("GalleryMenu", "GalleryCharaBu", LUA_PARAM_POS, r0_394.CharaPos[r13_394].x, r0_394.CharaPos[r13_394].y + 90, 0, 0)
    else
      r11_394:setParam("GalleryMenu", "GalleryCharaBu", LUA_PARAM_POS, r0_394.CharaPos[r13_394].x, r0_394.CharaPos[r13_394].y, 0, 0)
    end
    if r0_394.BackEnable == true then
      local r14_394 = r0_394.BackTime[r12_394]
      if r14_394 ~= nil then
        r11_394:setParam("GalleryMenu", "GalleryCharaBu", LUA_PARAM_COLOR, r0_394.BackTimeColor[r14_394].r, r0_394.BackTimeColor[r14_394].g, r0_394.BackTimeColor[r14_394].b, r0_394.BackTimeColor[r14_394].a)
      end
    end
    local r14_394 = 0
    if r4_394 == 4 and r5_394 == 2 and r6_394 == 3 then
      r14_394 = 1
    end
    local r15_394 = r0_394.CharaLayer[r4_394][r6_394].clot[r8_394]
    if r15_394 >= 0 then
      r11_394:initSubLayer("GalleryMenu", "GalleryCharaBu", r15_394 - r7_394 - 1 + r14_394, 1)
    end
    if r10_394 ~= 1 then
      if r10_394 == 5 then
        r15_394 = r0_394.CharaLayer[r4_394][r6_394].opex[1]
        if r15_394 >= 0 then
          r11_394:initSubLayer("GalleryMenu", "GalleryCharaBu", r15_394 + r14_394, 1)
        end
        r15_394 = r0_394.CharaLayer[r4_394][r6_394].opex[3]
        if r15_394 >= 0 then
          r11_394:initSubLayer("GalleryMenu", "GalleryCharaBu", r15_394 + r14_394, 1)
        end
      else
        r15_394 = r0_394.CharaLayer[r4_394][r6_394].opex[r10_394 - 1]
        if r15_394 >= 0 then
          r11_394:initSubLayer("GalleryMenu", "GalleryCharaBu", r15_394 + r14_394, 1)
        end
      end
    end
    r15_394 = r0_394.CharaLayer[r4_394][r6_394].etc
    if r15_394 >= 0 then
      r11_394:initSubLayer("GalleryMenu", "GalleryCharaBu", r15_394 + r14_394, 1)
    end
    if r5_394 == 4 then
      r15_394 = r0_394.CharaLayer[r4_394][r6_394].frame
      if r15_394 >= 0 then
        r11_394:initSubLayer("GalleryMenu", "GalleryCharaBu", r15_394 + r14_394, 1)
      end
    end
    r15_394 = r0_394.CharaLayer[r4_394][r6_394].expr1[1]
    if r7_394 == 2 then
      local r16_394 = r0_394.CharaLayer[r4_394][r6_394].expr2[1]
      if r16_394 >= 0 then
        r15_394 = r16_394
      end
    end
    if r7_394 == 3 then
      local r16_394 = r0_394.CharaLayer[r4_394][r6_394].expr3[1]
      if r16_394 >= 0 then
        r15_394 = r16_394
      end
    end
    if r4_394 == 23 and r5_394 == 4 and 0 <= r15_394 then
      r15_394 = r15_394 + 1
    end
    if r4_394 == 1 then
      local r16_394 = 0
      if r6_394 == 2 and 34 <= r9_394 then
        r16_394 = r16_394 + 1
      end
      if r6_394 == 3 and 9 <= r9_394 then
        r16_394 = r16_394 + 1
      end
      if r6_394 == 3 and 22 <= r9_394 then
        r16_394 = r16_394 + 1
      end
      if r6_394 == 3 and 25 <= r9_394 then
        r16_394 = r16_394 + 1
      end
      r9_394 = r9_394 + r16_394
    end
    if r15_394 >= 0 then
      r15_394 = r15_394 - r9_394 - 1
      if r4_394 == 23 and r9_394 == 6 then
        r15_394 = 0
      end
      r11_394:initSubLayer("GalleryMenu", "GalleryCharaBu", r15_394 + r14_394, 1)
    end
    -- warn: not visited block [38]
    -- block#38:
    -- r15_394 = r15_394 + r14_394
    -- r11_394:initSubLayer("GalleryMenu", "GalleryCharaBu", r15_394, 1)
    -- goto label_261
  end
  function r2_341.GalleryCharaDeletePic(r0_395)
    -- line: [11739, 11744] id: 395
    local r1_395 = cclass.lua_Layers:create()
    r1_395:removeLayer("GalleryMenu", "GalleryBack")
    r1_395:removeLayer("GalleryMenu", "GalleryCharaBu")
  end
  function r2_341.GalleryBaseInit(r0_396)
    -- line: [11747, 11794] id: 396
    local r1_396 = cclass.lua_Layers:create()
    r0_396:GalleryCharaSetPicInit()
    r0_396:GalleryCharaSetPic(true)
    r0_396:MenuLoadLayer("GalleryDefaultBack", "bg00_02s.png")
    r1_396:setVisible("GalleryMenu", "GalleryDefaultBack", 1)
    r0_396:MenuLoadLayer("GalleryBace", "SYS_GalleryBase.pna")
    r1_396:initSubLayer("GalleryMenu", "GalleryBace", 1, 0)
    r1_396:initSubLayer("GalleryMenu", "GalleryBace", 2, 0)
    r1_396:initSubLayer("GalleryMenu", "GalleryBace", 3, 0)
    r1_396:initSubLayer("GalleryMenu", "GalleryBace", 4, 0)
    r1_396:initSubLayer("GalleryMenu", "GalleryBace", 31, 1)
    r1_396:initSubLayer("GalleryMenu", "GalleryBace", 49, 1)
    r1_396:initSubLayer("GalleryMenu", "GalleryBace", 50, 1)
    r1_396:initSubLayer("GalleryMenu", "GalleryBace", 51, 1)
    r1_396:setSubLayerVisible("GalleryMenu", "GalleryBace", 49, 0)
    r1_396:setSubLayerVisible("GalleryMenu", "GalleryBace", 51, 0)
    r0_396.BT_DataBace = {}
    r0_396:MenuButtonSet(r0_396.BT_DataBace, "CG", 1, "GalleryBace", 6, 6, 7, 8, 9, 1, 0, 0)
    r0_396:MenuButtonSet(r0_396.BT_DataBace, "Scene", 1, "GalleryBace", 12, 12, 13, 14, 15, 2, 0, 0)
    r0_396:MenuButtonSet(r0_396.BT_DataBace, "BGM", 1, "GalleryBace", 18, 18, 19, 20, 21, 3, 0, 0)
    r0_396:MenuButtonSet(r0_396.BT_DataBace, "Chara", 1, "GalleryBace", 24, 24, 25, 26, 27, 4, 0, 0)
    r0_396:MenuButtonSet(r0_396.BT_DataBace, "stop", 1, "GalleryBace", 33, 33, 34, -1, 36, 10, 0, 0)
    r0_396:MenuButtonSet(r0_396.BT_DataBace, "title", 1, "GalleryBace", 39, 39, 40, -1, -1, 11, 0, 0)
    r0_396:MenuButtonSet(r0_396.BT_DataBace, "quit", 1, "GalleryBace", 44, 44, 45, -1, -1, 12, 0, 0)
    r0_396.MenuButton:SetList("BT_DataBace", r0_396.BT_DataBace)
    r0_396:MenuButtonInit()
  end
  cfunc.LegacyGame__lua_SetFlag(130, true)
  cfunc.LegacyGame__lua_SetFlag(131, true)
  local r3_341 = r2_341:MenuInit()
  if res == false then
    return false
  end
  r2_341:GalleryBaseInit()
  if r1_341 ~= 0 and r1_341 == 2 then
    r2_341:GalleryBgmPlay(30)
  end
  r2_341:initPageGallery(0, true)
  local r4_341 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r4_341:setSnap("system", true)
  end
  r4_341:copySnap("GalleryMenu", "system")
  r2_341:MenuEffectStart(500, 0)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function onMouseMoveGallery(r0_397, r1_397, r2_397, r3_397, r4_397, r5_397)
  -- line: [11877, 11881] id: 397
  if g_GalleryMenu ~= nil and r0_397 == g_GalleryMenu.MenuInf.SetName then
    g_GalleryMenu:MenuMouseMove(r0_397, r1_397, r2_397, r3_397, r4_397, r5_397)
  end
end
function onWheelMouseGallery(r0_398, r1_398)
  -- line: [11884, 11888] id: 398
  if g_GalleryMenu ~= nil and r0_398 == g_GalleryMenu.MenuInf.SetName then
    g_GalleryMenu:MenuMouseWheel(r0_398, r1_398)
  end
end
function onLButtonDownGallery(r0_399, r1_399, r2_399, r3_399, r4_399, r5_399)
  -- line: [11891, 11895] id: 399
  if g_GalleryMenu ~= nil and r0_399 == g_GalleryMenu.MenuInf.SetName then
    g_GalleryMenu:MenuLButtonDown(r0_399, r1_399, r2_399, r3_399, r4_399, r5_399)
  end
end
function onLButtonUpGallery(r0_400, r1_400, r2_400, r3_400, r4_400, r5_400)
  -- line: [11897, 11901] id: 400
  if g_GalleryMenu ~= nil and r0_400 == g_GalleryMenu.MenuInf.SetName then
    g_GalleryMenu:MenuLButtonUp(r0_400, r1_400, r2_400, r3_400, r4_400, r5_400)
  end
end
function onRButtonUpGallery(r0_401, r1_401, r2_401, r3_401, r4_401, r5_401)
  -- line: [11904, 11908] id: 401
  if g_GalleryMenu ~= nil and r0_401 == g_GalleryMenu.MenuInf.SetName then
    g_GalleryMenu:MenuRButtonUp(r0_401, r1_401, r2_401, r3_401, r4_401, r5_401)
  end
end
g_CgBrowser = nil
function openCgBrowser(r0_402, r1_402)
  -- line: [11914, 12409] id: 402
  g_CgBrowser = Menu.new("CgBrowser")
  local r2_402 = g_CgBrowser
  function r2_402.MenuInit(r0_403)
    -- line: [11927, 11939] id: 403
    local r1_403 = true
    r0_403.MenuInf.enabled = true
    r0_403.MenuInf.effect = true
    if cclass.lua_Layers:create():add(r0_403.MenuInf.SetName) == false then
      return false
    end
    return r1_403
  end
  function r2_402.MenuEffectEndJob(r0_404)
    -- line: [11967, 11980] id: 404
    local r1_404 = cclass.lua_Layers:create()
    if r0_404.MenuInf.enabled ~= true then
      r1_404:remove(r0_404.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_404.MenuInf.ButtonLayer = ""
      r0_404.MenuInf.ButtonPna = ""
    end
  end
  function r2_402.MenuEffectStart(r0_405, r1_405)
    -- line: [11983, 11991] id: 405
    cclass.lua_Layers:create():startTransition(r0_405.MenuInf.SetName, 0, 1, r1_405 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_405.MenuInf.enabled = true
    r0_405.MenuInf.effect = true
  end
  function r2_402.GetMenuMouseEnable(r0_406)
    -- line: [12007, 12018] id: 406
    local r1_406 = false
    if r0_406.MenuInf.enabled == true and r0_406.MenuInf.effect == false then
      r1_406 = true
    end
    return r1_406
  end
  function r2_402.MenuMouseMove(r0_407, r1_407, r2_407, r3_407, r4_407, r5_407, r6_407)
    -- line: [12024, 12037] id: 407
    if r6_407 == true then
      return 
    end
    if r0_407:GetMenuMouseEnable() then
      r0_407:DragMoveCg(r4_407, r5_407)
      r0_407:Cursor()
    elseif r0_407.DragMoveFlag == true then
      r0_407.DragMoveFlag = false
      r0_407:Cursor()
    end
  end
  function r2_402.MenuLButtonDown(r0_408, r1_408, r2_408, r3_408, r4_408, r5_408, r6_408)
    -- line: [12039, 12058] id: 408
    local r7_408 = 0
    if r6_408 == true then
      return r7_408
    end
    if r0_408:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, 0)
      r0_408:closeBrowser()
    elseif r0_408.DragMoveFlag == true then
      r0_408.DragMoveFlag = false
      r0_408:Cursor()
    end
    return r7_408
  end
  function r2_402.MenuLButtonUp(r0_409, r1_409, r2_409, r3_409, r4_409, r5_409, r6_409)
    -- line: [12060, 12072] id: 409
    local r7_409 = 0
    if r6_409 == true then
      return r7_409
    end
    if r0_409.DragMoveFlag == true then
      r0_409.DragMoveFlag = false
      r0_409:Cursor()
    end
    return r7_409
  end
  function r2_402.MenuRButtonDown(r0_410, r1_410, r2_410, r3_410, r4_410, r5_410, r6_410)
    -- line: [12074, 12087] id: 410
    local r7_410 = 0
    if r6_410 == true then
      return r7_410
    end
    if not r0_410:GetMenuMouseEnable() and r0_410.DragMoveFlag == true then
      r0_410.DragMoveFlag = false
      r0_410:Cursor()
    end
    return r7_410
  end
  function r2_402.MenuRButtonUp(r0_411, r1_411, r2_411, r3_411, r4_411, r5_411, r6_411)
    -- line: [12089, 12107] id: 411
    local r7_411 = 0
    if r6_411 == true then
      return r7_411
    end
    if r0_411:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_411:closeBrowser()
    elseif r0_411.DragMoveFlag == true then
      r0_411.DragMoveFlag = false
      r0_411:Cursor()
    end
    return r7_411
  end
  function r2_402.MenuMButtonDown(r0_412, r1_412, r2_412, r3_412, r4_412, r5_412, r6_412)
    -- line: [12109, 12125] id: 412
    local r7_412 = 0
    if r6_412 == true then
      return r7_412
    end
    if r0_412:GetMenuMouseEnable() then
      r0_412:DragStart(r4_412, r5_412)
    elseif r0_412.DragMoveFlag == true then
      r0_412.DragMoveFlag = false
      r0_412:Cursor()
    end
    return r7_412
  end
  function r2_402.MenuMButtonUp(r0_413, r1_413, r2_413, r3_413, r4_413, r5_413, r6_413)
    -- line: [12127, 12139] id: 413
    if r0_413:GetMenuMouseEnable() and r0_413.DragMoveFlag == true then
      r0_413.DragMoveFlag = false
      r0_413:Cursor()
    elseif r0_413.DragMoveFlag == true then
      r0_413.DragMoveFlag = false
      r0_413:Cursor()
    end
  end
  function r2_402.MoveCgPos(r0_414, r1_414, r2_414)
    -- line: [12161, 12169] id: 414
    local r3_414 = cclass.lua_Layers:create()
    r1_414, r2_414 = r0_414:PosCalc(r1_414, r2_414)
    r0_414.LoadCgInf.EventCG.posx = r1_414
    r0_414.LoadCgInf.EventCG.posy = r2_414
    r3_414:setParam(r0_414.MenuInf.SetName, "EventCG", LUA_PARAM_POS, r1_414, r2_414, 0, 0)
    r0_414:Cursor()
  end
  function r2_402.ScaleCg(r0_415, r1_415)
    -- line: [12171, 12186] id: 415
    local r2_415 = cclass.lua_Layers:create()
    if r1_415 < r0_415.LoadCgInf.EventCG.MinScale then
      r1_415 = r0_415.LoadCgInf.EventCG.MinScale
    end
    if r1_415 > 1 then
      r1_415 = 1
    end
    r2_415:setParam(r0_415.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, r1_415, r1_415, 0, 0)
    r0_415.LoadCgInf.EventCG.Scale = r1_415
    r0_415:MoveCgPos(r0_415.LoadCgInf.EventCG.posx, r0_415.LoadCgInf.EventCG.posy)
    r0_415:Cursor()
  end
  r2_402.DragMoveFlag = false
  r2_402.DragMovePosx = 0
  r2_402.DragMovePosy = 0
  function r2_402.DragMoveCg(r0_416, r1_416, r2_416)
    -- line: [12191, 12208] id: 416
    if r0_416.DragMoveFlag == true and 0 <= r1_416 and 0 <= r2_416 and r1_416 < APP_INTERNAL_WIDTH and r2_416 < APP_INTERNAL_HEIGHT then
      r0_416.DragMovePosx = r1_416
      r0_416.DragMovePosy = r2_416
      r0_416:MoveCgPos(r1_416 - r0_416.DragMovePosx + r0_416.LoadCgInf.EventCG.posx, r2_416 - r0_416.DragMovePosy + r0_416.LoadCgInf.EventCG.posy)
    end
  end
  function r2_402.DragStart(r0_417, r1_417, r2_417)
    -- line: [12209, 12213] id: 417
    r0_417.DragMoveFlag = true
    r0_417.DragMovePosx = r1_417
    r0_417.DragMovePosy = r2_417
  end
  function r2_402.PosCalc(r0_418, r1_418, r2_418)
    -- line: [12215, 12249] id: 418
    local r3_418 = 0
    local r4_418 = 0
    local r5_418 = 0
    local r6_418 = nil
    local r7_418 = 0
    local r8_418 = 0
    r5_418, r6_418, r7_418, r8_418 = cclass.lua_Layers:create():getParam(r0_418.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, 0, 0, 0, 0)
    r3_418 = (r0_418.LoadCgInf.EventCG.size_w * r5_418 - r0_418.LoadCgInf.EventCG.size_w) / 2
    r4_418 = (r0_418.LoadCgInf.EventCG.size_h * r6_418 - r0_418.LoadCgInf.EventCG.size_h) / 2
    local r10_418 = 0 - r0_418.LoadCgInf.EventCG.size_w - APP_INTERNAL_WIDTH - r3_418
    local r11_418 = 0 - r0_418.LoadCgInf.EventCG.size_h - APP_INTERNAL_HEIGHT - r4_418
    if r0_418.LoadCgInf.EventCG.size_w * r5_418 < APP_INTERNAL_WIDTH then
      r1_418 = (APP_INTERNAL_WIDTH - r0_418.LoadCgInf.EventCG.size_w) / 2
    else
      if r1_418 < r10_418 then
        r1_418 = r10_418
      end
      if r3_418 < r1_418 then
        r1_418 = r3_418
      end
    end
    if r0_418.LoadCgInf.EventCG.size_h * r6_418 < APP_INTERNAL_HEIGHT then
      r2_418 = (APP_INTERNAL_HEIGHT - r0_418.LoadCgInf.EventCG.size_h) / 2
    else
      if r2_418 < r11_418 then
        r2_418 = r11_418
      end
      if r4_418 < r2_418 then
        r2_418 = r4_418
      end
    end
    return r1_418, r2_418
  end
  function r2_402.Cursor(r0_419)
    -- line: [12252, 12265] id: 419
    local r1_419 = cclass.lua_AutoCursor:new()
    local r2_419 = 0
    local r3_419 = cclass.lua_Layers:create()
    local r4_419 = 0
    local r5_419 = 0
    r4_419, r5_419, r6_419, r7_419 = r3_419:getParam(r0_419.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, r4_419, r5_419, 0, 0)
    if APP_INTERNAL_WIDTH < r0_419.LoadCgInf.EventCG.size_w * r4_419 or APP_INTERNAL_HEIGHT < r0_419.LoadCgInf.EventCG.size_h * r5_419 then
      if r0_419.DragMoveFlag == true then
        r2_419 = 2 or 1
      else
        goto label_47	-- block#4 is visited secondly
      end
    end
    r1_419:SetCursor(r2_419)
    r1_419:delete()
  end
  r2_402.Different = 1
  r2_402.LoadCgInf = {}
  function r2_402.LoadCg(r0_420, r1_420, r2_420)
    -- line: [12285, 12327] id: 420
    local r3_420 = r0_420:MenuLoadLayer(r1_420, r2_420)
    local r4_420 = 0
    local r5_420 = 0
    local r8_420 = cclass.lua_Layers:create()
    r4_420, r5_420, r6_420, r7_420 = r8_420:getParam(r0_420.MenuInf.SetName, r1_420, LUA_PARAM_SIZE, r4_420, r5_420, 0, 0)
    local r9_420 = r4_420
    local r10_420 = r5_420
    local r11_420 = 1
    local r12_420 = 0.5
    if r8_420:isMosaic(r0_420.MenuInf.SetName, r1_420) == false and (APP_INTERNAL_WIDTH <= r4_420 or APP_INTERNAL_HEIGHT <= r5_420) then
      r4_420 = APP_INTERNAL_WIDTH / r4_420
      r5_420 = APP_INTERNAL_HEIGHT / r5_420
      if r5_420 < r4_420 then
        r11_420 = r5_420
      else
        r11_420 = r4_420
      end
      if r11_420 < 0.5 then
        r11_420 = 0.5
      end
      r12_420 = r11_420
      r8_420:setParam(r0_420.MenuInf.SetName, r1_420, LUA_PARAM_SCALE, r11_420, r11_420, 0, 0)
    end
    local r14_420 = (APP_INTERNAL_WIDTH - r9_420) / 2
    local r15_420 = (APP_INTERNAL_HEIGHT - r10_420) / 2
    r8_420:setParam(r0_420.MenuInf.SetName, r1_420, LUA_PARAM_POS, r14_420, r15_420, 0, 0)
    r0_420.LoadCgInf[r1_420] = {
      posx = r14_420,
      posy = r15_420,
      size_w = r9_420,
      size_h = r10_420,
      Scale = r11_420,
      MinScale = r12_420,
    }
    r0_420:Cursor()
    return r3_420
  end
  function r2_402.closeBrowser(r0_421)
    -- line: [12370, 12381] id: 421
    r0_421:MenuEffectToMenu(0)
    r0_421.MenuInf.enabled = false
    r0_421.MenuInf.effect = true
    cclass.lua_Layers:create():rtSnap("system")
    local r2_421 = cclass.lua_AutoCursor:new()
    r2_421:SetCursor(0)
    r2_421:delete()
  end
  local r3_402 = r2_402:MenuInit()
  if res == false then
    return false
  end
  if r2_402:LoadCg("EventCG", r0_402) == false then
    print("\x83t\x83@\x83C\x83\x8b\x82\xaa\x96\xb3\x82\xa9\x82\xc1\x82\xbd")
  end
  cclass.lua_Layers:create():copySnap("CgBrowser", "system")
  r2_402:MenuEffectStart(200)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function onMouseMoveCgBrowser(r0_422, r1_422, r2_422, r3_422, r4_422, r5_422)
  -- line: [12412, 12416] id: 422
  if g_CgBrowser ~= nil and r0_422 == g_CgBrowser.MenuInf.SetName then
    g_CgBrowser:MenuMouseMove(r0_422, r1_422, r2_422, r3_422, r4_422, r5_422)
  end
end
function onLButtonDownCgBrowser(r0_423, r1_423, r2_423, r3_423, r4_423, r5_423)
  -- line: [12419, 12423] id: 423
  if g_CgBrowser ~= nil and r0_423 == g_CgBrowser.MenuInf.SetName then
    g_CgBrowser:MenuLButtonDown(r0_423, r1_423, r2_423, r3_423, r4_423, r5_423)
  end
end
function onLButtonUpCgBrowser(r0_424, r1_424, r2_424, r3_424, r4_424, r5_424)
  -- line: [12425, 12429] id: 424
  if g_CgBrowser ~= nil and r0_424 == g_CgBrowser.MenuInf.SetName then
    g_CgBrowser:MenuLButtonUp(r0_424, r1_424, r2_424, r3_424, r4_424, r5_424)
  end
end
function onRButtonUpCgBrowser(r0_425, r1_425, r2_425, r3_425, r4_425, r5_425)
  -- line: [12432, 12436] id: 425
  if g_CgBrowser ~= nil and r0_425 == g_CgBrowser.MenuInf.SetName then
    g_CgBrowser:MenuRButtonUp(r0_425, r1_425, r2_425, r3_425, r4_425, r5_425)
  end
end
function onMButtonDownCgBrowser(r0_426, r1_426, r2_426, r3_426, r4_426, r5_426)
  -- line: [12438, 12442] id: 426
  if g_CgBrowser ~= nil and r0_426 == g_CgBrowser.MenuInf.SetName then
    g_CgBrowser:MenuMButtonDown(r0_426, r1_426, r2_426, r3_426, r4_426, r5_426)
  end
end
function onMButtonUpCgBrowser(r0_427, r1_427, r2_427, r3_427, r4_427, r5_427)
  -- line: [12444, 12448] id: 427
  if g_CgBrowser ~= nil and r0_427 == g_CgBrowser.MenuInf.SetName then
    g_CgBrowser:MenuMButtonUp(r0_427, r1_427, r2_427, r3_427, r4_427, r5_427)
  end
end
function onWheelMouseCgBrowser(r0_428, r1_428)
  -- line: [12450, 12454] id: 428
  if g_CgBrowser ~= nil and r0_428 == g_CgBrowser.MenuInf.SetName then
    g_CgBrowser:MenuMouseWheel(r0_428, r1_428)
  end
end
g_AfterMenu = nil
function openAfter(r0_429, r1_429)
  -- line: [12463, 12588] id: 429
  g_AfterMenu = Menu.new("AfterMenu")
  local r2_429 = g_AfterMenu
  function r2_429.MenuButtonJob(r0_430, r1_430, r2_430)
    -- line: [12470, 12501] id: 430
    if r1_430 ~= 0 and r2_430 == "LD" then
      cclass.lua_Layers:create():removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_430)
      g_menuExecute = false
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      r0_430:MenuEffectEnd(0)
      r0_430.MenuInf.enabled = false
      r0_430.MenuInf.effect = true
      local r4_430 = cclass.lua_Sounds:new()
      r4_430:BgmStop("systembgm", 500)
      r4_430:delete()
    end
    if r2_430 == "RU" then
      local r3_430 = cclass.lua_Layers:create()
      cfunc.LegacyGame__lua_SetVariable(99, 0)
      r0_430:MenuEffectToMenu(500)
      r0_430.MenuInf.enabled = false
      r0_430.MenuInf.effect = true
    end
  end
  function r2_429.MenuEffectTransJob(r0_431)
    -- line: [12504, 12513] id: 431
    local r1_431 = cclass.lua_Layers:create()
    if r0_431.MenuInf.enabled == true then
      return r1_431:isTransition(r0_431.MenuInf.SetName)
    else
      return r1_431:isTransition(r0_431.MenuInf.SetName)
    end
  end
  function r2_429.startAfter(r0_432)
    -- line: [12519, 12528] id: 432
    if g_menuExecute == false then
      layers:setSnap("system", true)
    end
    cclass.lua_Layers:create():copySnap("AfterMenu", "system")
    r0_432:MenuEffectStart(500, 0)
    r0_432.MenuInf.enabled = true
    r0_432.MenuInf.effect = true
  end
  local r3_429 = r2_429:MenuInit("AfterBace", "SYS_After.pna")
  if res == false then
    return false
  end
  cclass.lua_Layers:create():initSubLayer("AfterMenu", "AfterBace", 19, 1)
  r2_429.MenuButtonData.SC01 = r2_429.MenuButton:ButtonCreate("SC01", 0, "AfterBace", 11, 11, 5, -1, 17, 1, 0, "SYS01.ogg", "SYS03.ogg", 0)
  r2_429.MenuButtonData.SC02 = r2_429.MenuButton:ButtonCreate("SC02", 0, "AfterBace", 10, 10, 4, -1, 16, 2, 0, "SYS01.ogg", "SYS03.ogg", 0)
  r2_429.MenuButtonData.SC03 = r2_429.MenuButton:ButtonCreate("SC03", 0, "AfterBace", 9, 9, 3, -1, 15, 3, 0, "SYS01.ogg", "SYS03.ogg", 0)
  r2_429.MenuButtonData.SC04 = r2_429.MenuButton:ButtonCreate("SC04", 0, "AfterBace", 8, 8, 2, -1, 14, 4, 0, "SYS01.ogg", "SYS03.ogg", 0)
  r2_429.MenuButton:SetList("MenuButtonData", r2_429.MenuButtonData)
  r2_429:MenuButtonInit()
  if cfunc.LegacyGame__lua_GetFlag(1001) == false then
    r2_429.MenuButtonData.SC01:bt_SetActive(2)
  end
  if cfunc.LegacyGame__lua_GetFlag(1003) == false then
    r2_429.MenuButtonData.SC02:bt_SetActive(2)
  end
  if cfunc.LegacyGame__lua_GetFlag(1004) == false then
    r2_429.MenuButtonData.SC03:bt_SetActive(2)
  end
  local r8_429 = cfunc.LegacyGame__lua_GetFlag(1002)
  local r9_429 = cfunc.LegacyGame__lua_GetFlag(1005)
  if r8_429 == false or r9_429 == false then
    r2_429.MenuButtonData.SC04:bt_SetActive(2)
  end
  r2_429:startAfter()
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function onMouseMoveAfterMenu(r0_433, r1_433, r2_433, r3_433, r4_433, r5_433)
  -- line: [12592, 12596] id: 433
  if g_AfterMenu ~= nil and r0_433 == g_AfterMenu.MenuInf.SetName then
    g_AfterMenu:MenuMouseMove(r0_433, r1_433, r2_433, r3_433, r4_433, r5_433)
  end
end
function onLButtonDownAfterMenu(r0_434, r1_434, r2_434, r3_434, r4_434, r5_434)
  -- line: [12599, 12603] id: 434
  if g_AfterMenu ~= nil and r0_434 == g_AfterMenu.MenuInf.SetName then
    g_AfterMenu:MenuLButtonDown(r0_434, r1_434, r2_434, r3_434, r4_434, r5_434)
  end
end
function onLButtonUpAfterMenu(r0_435, r1_435, r2_435, r3_435, r4_435, r5_435)
  -- line: [12606, 12610] id: 435
  if g_AfterMenu ~= nil and r0_435 == g_AfterMenu.MenuInf.SetName then
    g_AfterMenu:MenuLButtonUp(r0_435, r1_435, r2_435, r3_435, r4_435, r5_435)
  end
end
function onRButtonUpAfterMenu(r0_436, r1_436, r2_436, r3_436, r4_436, r5_436)
  -- line: [12613, 12617] id: 436
  if g_AfterMenu ~= nil and r0_436 == g_AfterMenu.MenuInf.SetName then
    g_AfterMenu:MenuRButtonUp(r0_436, r1_436, r2_436, r3_436, r4_436, r5_436)
  end
end
g_StoryMenu = nil
function openStory(r0_437, r1_437)
  -- line: [12626, 13062] id: 437
  g_StoryMenu = Menu.new("StoryMenu")
  function g_StoryMenu.MenuButtonJob(r0_438, r1_438, r2_438)
    -- line: [12632, 12674] id: 438
    local r3_438 = cclass.lua_Layers:create()
    if r1_438 ~= 0 and r2_438 == "LD" then
      if r1_438 == 99 then
        cfunc.LegacyGame__lua_SetVariable(98, 0)
        r0_438:MenuEffectToMenu(500)
        r0_438.MenuInf.enabled = false
        r0_438.MenuInf.effect = true
      else
        r3_438:removeSnap("system")
        cfunc.LegacyGame__lua_SetVariable(98, r1_438)
        g_menuExecute = false
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_438:MenuEffectEnd(0)
        r0_438.MenuInf.enabled = false
        r0_438.MenuInf.effect = true
        local r4_438 = cclass.lua_Sounds:new()
        r4_438:BgmStop("systembgm", 500)
        r4_438:delete()
      end
    end
    if r2_438 == "RU" then
      cfunc.LegacyGame__lua_SetVariable(98, 0)
      r0_438:MenuEffectToMenu(500)
      r0_438.MenuInf.enabled = false
      r0_438.MenuInf.effect = true
    end
    if r2_438 == "LD" then
      r0_438:CancelMenuEffect()
    end
  end
  function g_StoryMenu.MenuEffect(r0_439)
    -- line: [12676, 12685] id: 439
    local r1_439 = false
    r1_439 = r0_439:MenuEffectTransJob()
    if r0_439.MenuInf.effect == true and r1_439 == false then
      r0_439:MenuEffectEndJob()
      r0_439.MenuInf.effect = false
    end
    return r1_439
  end
  function g_StoryMenu.MenuEffectTransJob(r0_440)
    -- line: [12688, 12697] id: 440
    local r1_440 = cclass.lua_Layers:create()
    if r0_440.MenuInf.enabled == true then
      return r1_440:isEffect(r0_440.MenuInf.SetName, "StoryDisp")
    else
      return r1_440:isTransition(r0_440.MenuInf.SetName)
    end
  end
  function g_StoryMenu.MenuEffectEndJob(r0_441)
    -- line: [12699, 12728] id: 441
    local r1_441 = cclass.lua_Layers:create()
    if r0_441.MenuInf.enabled == true then
      r0_441.MenuButton:ResetColor(r0_441.MenuButtonData)
      local r2_441 = 0
      local r3_441 = 0
      local r4_441 = cclass.lua_AutoCursor:new()
      r2_441, r3_441 = r4_441:GetCursorPos(r2_441, r3_441)
      r4_441:delete()
      r0_441.MenuButton:changeButton(r0_441.MenuInf.SetName, r1_441:getCursorPos(r0_441.MenuInf.SetName, r2_441, r3_441, 0) - 1, r2_441, r3_441)
    else
      if g_menuExecute == false then
        r1_441:removeSnap("system")
      end
      r1_441:remove(r0_441.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_441.MenuInf.ButtonLayer = ""
      r0_441.MenuInf.ButtonPna = ""
    end
  end
  function g_StoryMenu.MenuEffectStart(r0_442, r1_442, r2_442)
    -- line: [12730, 12904] id: 442
    local r3_442 = cclass.lua_Layers:create()
    local r4_442 = cclass.lua_MeasureTime:new()
    local r5_442 = getEffectRate()
    local r6_442 = r2_442 * r4_442:diff()
    r4_442:delete()
    r0_442.EffectButtonKeyList = {}
    local r7_442 = 0
    local function r8_442(r0_443, r1_443, r2_443)
      -- line: [12739, 12746] id: 443
      local r3_443 = {
        key = r0_443,
        x = r1_443,
        y = r2_443,
      }
      r7_442 = r7_442 + 1
      r0_442.EffectButtonKeyList[r7_442] = r3_443
    end
    for r12_442 = 22, 28, 1 do
      r3_442:setSubLayerVisible("StoryMenu", "StoryBace", r12_442, 0)
    end
    local r9_442 = r6_442
    local r10_442 = 200
    r3_442:setSubLayerParam("StoryMenu", "StoryBace", 41, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_442:setSubLayerParam("StoryMenu", "StoryBace", 42, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_442:setSubLayerParam("StoryMenu", "StoryBace", 43, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_442:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 41, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, r10_442 * r5_442, 0, r9_442 * r5_442)
    r3_442:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 42, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, r10_442 * r5_442, 0, r9_442 * r5_442)
    r3_442:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 43, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, r10_442 * r5_442, 0, r9_442 * r5_442)
    r3_442:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 41, 0)
    r3_442:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 42, 0)
    r3_442:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", 43, 0)
    for r14_442 = 31, 39, 1 do
      r3_442:setSubLayerVisible("StoryMenu", "StoryBace", r14_442, 1)
      r3_442:setSubLayerParam("StoryMenu", "StoryBace", r14_442, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r3_442:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r14_442, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, r10_442 * r5_442, 0, r9_442 * r5_442)
      r3_442:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r14_442, 0)
    end
    r9_442 = r9_442 + 100
    local r11_442 = 0
    local r12_442 = 0
    local r13_442 = 0
    local r14_442 = 0
    local r15_442 = -1
    local r16_442 = 0
    local r17_442 = r9_442
    local r18_442 = 200
    for r22_442 = 1, 7, 1 do
      r15_442 = r0_442.MenuButtonData["SC" .. tostring(r22_442)]:bt_getNowKey()
      r11_442, r12_442, r13_442, r14_442 = r3_442:getSubLayerParam("StoryMenu", "StoryBace", r15_442, LUA_PARAM_POS, r11_442, r12_442, r13_442, r14_442)
      r3_442:setSubLayerParam("StoryMenu", "StoryBace", r15_442, LUA_PARAM_POS, r11_442 - 100, r12_442 - 100, 0, 0)
      r3_442:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_442, LUA_EFFECT_POS, 100, 100, 0, 0, 2, r18_442 * r5_442, 0, r17_442 * r5_442)
      r3_442:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_442, 0)
      r8_442(r15_442, r11_442, r12_442)
      r17_442 = r17_442 + r16_442
    end
    r15_442 = r0_442.MenuButtonData.Return:bt_getNowKey()
    r11_442, r12_442, r13_442, r14_442 = r3_442:getSubLayerParam("StoryMenu", "StoryBace", r15_442, LUA_PARAM_POS, r11_442, r12_442, r13_442, r14_442)
    r3_442:setSubLayerParam("StoryMenu", "StoryBace", r15_442, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_442:setSubLayerParam("StoryMenu", "StoryBace", r15_442, LUA_PARAM_POS, r11_442 + 80, r12_442, 0, 0)
    r3_442:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_442, LUA_EFFECT_OPACITY, 1, 1, 1, 1, 0, 100 * r5_442, 0, r9_442 * r5_442)
    r3_442:setSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_442, LUA_EFFECT_POS, -80, 0, 0, 0, 0, 100 * r5_442, 0, r9_442 * r5_442)
    r3_442:startSubLayerEffect("StoryMenu", "StoryBace", "StoryDisp", r15_442, 0)
    r8_442(r15_442, r11_442, r12_442)
  end
  g_StoryMenu.EffectButtonKeyList = {}
  function g_StoryMenu.CancelMenuEffect(r0_444)
    -- line: [12909, 12935] id: 444
    if r0_444.MenuInf.effect == true and r0_444.MenuInf.enabled == true then
      local r1_444 = cclass.lua_Layers:create()
      r1_444:cancelEffect("StoryMenu", "StoryBace", "StoryDisp")
      for r5_444, r6_444 in pairs(r0_444.EffectButtonKeyList) do
        r1_444:cancelSubLayerEffect("StoryMenu", "StoryBace", r6_444.key, "StoryDisp")
        r1_444:setSubLayerParam("StoryMenu", "StoryBace", r6_444.key, LUA_PARAM_POS, r6_444.x, r6_444.y, 1, 1)
        r1_444:setSubLayerParam("StoryMenu", "StoryBace", r6_444.key, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
      for r5_444 = 31, 39, 1 do
        r1_444:cancelSubLayerEffect("StoryMenu", "StoryBace", r5_444, "StoryDisp")
        r1_444:setSubLayerVisible("StoryMenu", "StoryBace", r5_444, 1)
        r1_444:setSubLayerParam("StoryMenu", "StoryBace", r5_444, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
  end
  g_StoryMenu.defaultMenuMouseMove = g_StoryMenu.MenuMouseMove
  function g_StoryMenu.MenuMouseMove(r0_445, r1_445, r2_445, r3_445, r4_445, r5_445, r6_445)
    -- line: [12939, 12949] id: 445
    r0_445:defaultMenuMouseMove(r1_445, r2_445, r3_445, r4_445, r5_445, r6_445)
    local r7_445 = 0
    if r0_445.MenuButton.selCursor ~= -1 then
      r7_445 = r0_445.MenuButton.selListKey[r0_445.MenuButton.selCursor].bt_l
    end
    r0_445:StorySelCursor(r0_445.MenuButton.selCursor, r7_445, r4_445, r5_445)
  end
  function g_StoryMenu.startStoryMenu(r0_446)
    -- line: [12954, 12964] id: 446
    if g_menuExecute == false then
      layers:setSnap("system", true)
    end
    cclass.lua_Layers:create():copySnap("StoryMenu", "system")
    r0_446:MenuEffectStart(500, 0)
    r0_446.MenuInf.enabled = true
    r0_446.MenuInf.effect = true
  end
  function g_StoryMenu.StoryMenuInit(r0_447)
    -- line: [12967, 13010] id: 447
    local r1_447 = cclass.lua_Layers:create()
    r1_447:initSubLayer("StoryMenu", "StoryBace", 22, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 23, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 24, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 25, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 26, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 27, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 28, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 31, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 32, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 33, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 34, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 35, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 36, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 37, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 38, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 39, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 41, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 42, 1)
    r1_447:initSubLayer("StoryMenu", "StoryBace", 43, 1)
    for r5_447 = 1, 7, 1 do
      local r7_447 = 6 + (r5_447 - 1) * 2
      r0_447:MenuButtonSet(r0_447.MenuButtonData, "SC" .. tostring(r5_447), 0, "StoryBace", r7_447, r7_447, 5 + (r5_447 - 1) * 2, -1, -1, 100 + r5_447, 0, 0)
    end
    r0_447:MenuButtonSet(r0_447.MenuButtonData, "Return", 0, "StoryBace", 2, 2, 1, -1, -1, 99, 0, 0)
    r0_447:MenuButtonInit()
  end
  function g_StoryMenu.StorySelCursor(r0_448, r1_448, r2_448, r3_448, r4_448)
    -- line: [13014, 13037] id: 448
    local r5_448 = cclass.lua_Layers:create()
    for r9_448 = 22, 28, 1 do
      r5_448:setSubLayerVisible("StoryMenu", "StoryBace", r9_448, 0)
    end
    if 101 <= r2_448 and r2_448 <= 107 then
      r5_448:setSubLayerVisible("StoryMenu", "StoryBace", 22 + r2_448 - 100 - 1, 1)
      for r9_448 = 31, 39, 1 do
        r5_448:setSubLayerVisible("StoryMenu", "StoryBace", r9_448, 0)
      end
    else
      for r9_448 = 31, 39, 1 do
        r5_448:setSubLayerVisible("StoryMenu", "StoryBace", r9_448, 1)
      end
    end
  end
  local r2_437 = g_StoryMenu:MenuInit("StoryBace", "SYS_Story.pna")
  if res == false then
    return false
  end
  g_StoryMenu:StoryMenuInit()
  g_StoryMenu:startStoryMenu()
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function onMouseMoveStoryMenu(r0_449, r1_449, r2_449, r3_449, r4_449, r5_449)
  -- line: [13066, 13070] id: 449
  if g_StoryMenu ~= nil and r0_449 == g_StoryMenu.MenuInf.SetName then
    g_StoryMenu:MenuMouseMove(r0_449, r1_449, r2_449, r3_449, r4_449, r5_449)
  end
end
function onLButtonDownStoryMenu(r0_450, r1_450, r2_450, r3_450, r4_450, r5_450)
  -- line: [13073, 13077] id: 450
  if g_StoryMenu ~= nil and r0_450 == g_StoryMenu.MenuInf.SetName then
    g_StoryMenu:MenuLButtonDown(r0_450, r1_450, r2_450, r3_450, r4_450, r5_450)
  end
end
function onLButtonUpStoryMenu(r0_451, r1_451, r2_451, r3_451, r4_451, r5_451)
  -- line: [13080, 13084] id: 451
  if g_StoryMenu ~= nil and r0_451 == g_StoryMenu.MenuInf.SetName then
    g_StoryMenu:MenuLButtonUp(r0_451, r1_451, r2_451, r3_451, r4_451, r5_451)
  end
end
function onRButtonUpStoryMenu(r0_452, r1_452, r2_452, r3_452, r4_452, r5_452)
  -- line: [13087, 13091] id: 452
  if g_StoryMenu ~= nil and r0_452 == g_StoryMenu.MenuInf.SetName then
    g_StoryMenu:MenuRButtonUp(r0_452, r1_452, r2_452, r3_452, r4_452, r5_452)
  end
end
g_DisableGestureFlag = false
g_DisableDataBackup = false
function DisableSC(r0_453, r1_453)
  -- line: [13098, 13112] id: 453
  local r2_453 = r1_453 == 1
  return true
end
