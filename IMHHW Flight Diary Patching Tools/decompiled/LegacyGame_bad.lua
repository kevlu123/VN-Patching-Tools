-- filename: 
-- version: lua53
-- line: [0, 0] id: 0
g_SetDefaultLangJP = false
APP_INTERNAL_WIDTH = 1280
APP_INTERNAL_HEIGHT = 720
SELECT_WINDOW_PITCH = 20
LUA_CONFIRM_CHANGESCN = 20
LUA_CONFIRM_NMSSAVE = 21
LUA_CONFIRM_SCNTOP = 22
LUA_CONFIRM_DELETEGAME = 23
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
SYSVOICE_TITLESTART = 15
SYSVOICE_EYECATCH = 16
SYSVOICE_ROLLBACK = 17
SYSVOICE_RETURNPRECHOICE = 18
g_refreshCursor = false
g_menuExecute = false
g_mixer = nil
g_CASTOFF = false
g_cmdLineInfo = {
  enabled = false,
  effect = false,
}
g_sortData = nil
g_sortType = DATA_SORT_UPDATEDATE
g_sortOrder = DATA_ORDER_DESC
g_SavedDataUpdateWeight = false
g_EnableNMS = false
g_EnableTips = false
g_OverlayArrowDisp = false
g_MenuMsgWin = nil
g_MenuDialog = nil
makeMenuList = function(r0_1)
  -- line: [78, 81] id: 1
  return {
    name = r0_1,
    ptr = nil,
  }
end
g_Menu = {
  GameTitle = makeMenuList("GameTitle"),
  GalleryTitle = makeMenuList("GalleryTitle"),
  GalleryMenu = makeMenuList("GalleryMenu"),
  Config = makeMenuList("Config"),
  BackLog = makeMenuList("BackLog"),
  CgBrowser = makeMenuList("CgBrowser"),
  NmsSaveLoad = makeMenuList("NmsSaveLoad"),
  CharSelect = makeMenuList("CharSelect"),
  SceneSelect = makeMenuList("SceneSelect"),
  MoveBrowser = makeMenuList("MoveBrowser"),
  StoryMenu = makeMenuList("StoryMenu"),
}
g_sysMenuNormal = {}
g_sysMenuSelect = {}
g_sysMenuAll = {
  g_sysMenuNormal,
  g_sysMenuSelect
}
g_confirmDialog = 0
g_configPage = 0
g_dataInfo = {
  init = false,
  page = 1,
  data_no = -1,
  tab = 1,
}
g_quickOrder = {}
g_autoOrder = {}
g_DATAPAGEMAX = 11
g_TrialFlag = 0
g_P1Renew = 0
g_SysSEName = {
  cursor = "SYS03.ogg",
  ok = "SYS01.ogg",
  cancel = "SYS02.ogg",
  qsave = "SYS03.ogg",
  qload = "SYS03.ogg",
  error = "SYS02.ogg",
}
g_ArrowMax = 13
g_MSWTxtSize = {
  lWidth = 840,
  lHeight = 140,
  lMarginLeft = 100,
  lMarginTop = 10,
  lMarginRight = 24,
  lMarginBottom = 5,
  fLineMargin = 0,
}
g_MSWTxtSizeN = {
  lWidth = 840,
  lHeight = 684,
  lMarginLeft = 100,
  lMarginTop = 36,
  lMarginRight = 24,
  lMarginBottom = 36,
  fLineMargin = 0,
}
g_LogTxtSize = {
  lWidth = 744,
  lHeight = 700,
  lMarginLeft = 4,
  lMarginTop = 36,
  lMarginRight = 24,
  lMarginBottom = 36,
  fLineMargin = 0,
}
g_MSWTxtPos = {
  x = 180,
  y = 595,
}
g_MSWTxtPosN = {
  x = 180,
  y = 0,
}
g_MSWNamePos = {
  x = 226,
  y = 558,
}
g_selectTextColor = {
  normal = 4294967295,
  normalEdge = 558856703,
  oncursor = 1717987071,
  oncursorEdge = 4294967295,
  already = 4294967295,
  alreadyEdge = 2123803647,
  selected = 4294967295,
  selectedEdge = 558856703,
  disabled = 3351758791,
  disabledEdge = 4294967239,
}
g_SelectTextColorState = {}
g_UseTips = true
g_TipsPos = {
  x = 1014,
  y = 428,
  move = 267,
  flag = -1,
}
g_message1Color = {
  normal = 558856703,
  normalEdge = 4294967295,
  already = 2022679807,
  alreadyEdge = 4294967295,
}
g_message2Color = {
  normal = 558856703,
  normalEdge = 4294967295,
  already = 2022679807,
  alreadyEdge = 4294967295,
}
g_name1Color = {
  normal = 1136718079,
  normalEdge = 4294967295,
  already = 1136718079,
  alreadyEdge = 4294967295,
}
g_name2Color = {
  normal = 1136718079,
  normalEdge = 4294967295,
  already = 1136718079,
  alreadyEdge = 4294967295,
}
g_messageAlready = -1
g_logTextColor = {
  normal = 4294967295,
  normalEdge = 255,
  voice = 4227509247,
  voiceEdge = 255,
}
g_logNameColor = {
  normal = 4294967295,
  normalEdge = 255,
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
g_hideCursorOn = true
g_deactiveMode = true
g_altLanguage = false
g_MouseRButton = 0
g_ReadColorChange = true
g_UseArrowViewBase = false
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
    name = "systemse",
    vol = 0,
    mute = false,
  },
  {
    name = "movie",
    vol = 0,
    mute = false,
  },
  {
    name = "systemVoice",
    vol = 0,
    mute = false,
  },
  {
    name = "bgv",
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
  }
}
g_ConfigVoiceVolume = 0
g_ConfigSeVolume = 0
g_volumeID_MAN = {}
g_volumeID_WOMAN = {}
g_clickVoice = true
g_enablePan = true
g_bgvVoiceMute = true
g_gestureFunc = {
  6,
  0,
  5,
  2
}
g_gestureDisable = false
g_bgmCutPer = 90
g_messageWindowType = 0
g_sysVoiceChar = 999
g_GameType = 0
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
g_charKeysOtherMAN = {}
g_charKeysOtherWOMAN = {}
g_BgvKeyToVolkey = {}
getUItype = function()
  -- line: [283, 293] id: 2
  if g_SetDefaultLangJP then
    return 2
  end
  local r0_2 = 0
  if getAltLanguage() then
    r0_2 = 1
  end
  return r0_2
end
changeLanguage = function()
  -- line: [297, 349] id: 3
  initFontInformation()
  if g_MenuMsgWin.SelectCount > 0 then
    local r0_3 = getUItype()
    local r1_3 = cclass.CLegacyFontInfo:create()
    local r2_3 = g_fonts0.name
    local r3_3 = g_fontSize0.selectSize
    if r0_3 == 2 then
      r2_3 = g_fonts2.name
      r3_3 = g_fontSize2.selectSize
    elseif getLangPatchFlag() and getAltLanguage() then
      r2_3 = g_fonts1.name
      r3_3 = g_fontSize1.selectSize
    end
    for r7_3 = 1, g_MenuMsgWin.SelectCount, 1 do
      local r8_3 = getLocalSelectText(r7_3)
      r1_3:remove("system", r8_3)
      r1_3:add("system", r8_3, r2_3, r3_3, 1, 0, g_selectTextColor.normal, g_selectTextColor.normalEdge, 1, 1)
    end
  end
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_CHANGELANGUAGE, 0)
  local r0_3 = cclass.lua_Layers:create()
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:MenuLoadTips(true)
    resetSkipIcon()
    g_MenuMsgWin:LoadSkipAutoIcon()
    g_MenuMsgWin:SetSelectButPos()
  end
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:InitGesture(false)
  end
  changeMessageWindow(-1, true)
  r0_3:setForceBG(true)
  g_P1Renew = 3
end
getGameEngineVersion = function()
  -- line: [352, 354] id: 4
  return 1.94
end
resetGame = function()
  -- line: [357, 364] id: 5
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:ReleaseMessageWindow()
  end
  return true
end
resetSkipIcon = function()
  -- line: [367, 374] id: 6
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:resetSkipIcon()
    g_MenuMsgWin:resetAutoIcon()
  end
  return true
end
g_checkInit = false
checkInitVersion = function()
  -- line: [379, 381] id: 7
  g_checkInit = true
end
resetMouseCursor = function()
  -- line: [383, 387] id: 8
  local r0_8 = cclass.lua_AutoCursor:new()
  r0_8:SetCursor(0)
  r0_8:delete()
end
initLegacyGame = function(r0_9)
  -- line: [391, 639] id: 9
  if g_checkInit == false then
    return false
  end
  if g_CASTOFF then
    cfunc.LegacyGame__lua_SetLoadProc("CastOffCall")
  end
  if g_UseTips then
    cfunc.LegacyGame__lua_SetLoadProc("LoadTipsCall")
  end
  local r1_9 = nil
  local r2_9 = cclass.lua_Registry:new(r0_9)
  g_screenMode = r2_9:GetDWORD("ScreenMode")
  g_zoomMode = r2_9:GetDWORD("KeepAspectRatio")
  r1_9 = r2_9:IsKeyDWORD("messageSpeed")
  g_msgspeed = r2_9:GetDWORD("messageSpeed")
  if r1_9 == false then
    g_msgspeed = 80
  end
  r1_9 = r2_9:IsKeyDWORD("messageAlpha")
  g_messagealpha = r2_9:GetDWORD("messageAlpha")
  if r1_9 == false then
    g_messagealpha = 70
  end
  r1_9 = r2_9:IsKeyDWORD("autoSpeed")
  g_autospeed = r2_9:GetDWORD("autoSpeed")
  if r1_9 == false then
    g_autospeed = 50
  end
  local r3_9 = 0
  r1_9 = r2_9:IsKeyDWORD("allSkip")
  local r4_9 = r2_9:GetDWORD("allSkip")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 0
  end
  if r3_9 == 1 then
    r4_9 = true or false
  else
    goto label_83	-- block#16 is visited secondly
  end
  g_allskip = r4_9
  r1_9 = r2_9:IsKeyDWORD("selectReleaseSkip")
  r4_9 = r2_9:GetDWORD("selectReleaseSkip")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 0
  end
  if r3_9 == 1 then
    r4_9 = true or false
  else
    goto label_101	-- block#21 is visited secondly
  end
  g_selectReleaseSkip = r4_9
  r1_9 = r2_9:IsKeyDWORD("selectReleaseAuto")
  r4_9 = r2_9:GetDWORD("selectReleaseAuto")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 0
  end
  if r3_9 == 1 then
    r4_9 = true or false
  else
    goto label_119	-- block#26 is visited secondly
  end
  g_selectReleaseAuto = r4_9
  r1_9 = r2_9:IsKeyDWORD("effectSpeed")
  g_effectSpeed = r2_9:GetDWORD("effectSpeed")
  if r1_9 == false then
    g_effectSpeed = 0
  end
  r1_9 = r2_9:IsKeyDWORD("drawSkipIcon")
  r4_9 = r2_9:GetDWORD("drawSkipIcon")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 1
  end
  if r3_9 == 1 then
    r4_9 = true or false
  else
    goto label_148	-- block#33 is visited secondly
  end
  g_drawSkipIcon = r4_9
  r1_9 = r2_9:IsKeyDWORD("mouseAutoMove")
  r4_9 = r2_9:GetDWORD("mouseAutoMove")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 1
  end
  if r3_9 == 1 then
    r4_9 = true or false
  else
    goto label_166	-- block#38 is visited secondly
  end
  g_mouseAutoMove = r4_9
  r1_9 = r2_9:IsKeyDWORD("skipConfirm")
  r4_9 = r2_9:GetDWORD("skipConfirm")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 0
  end
  if r3_9 == 1 then
    r4_9 = true or false
  else
    goto label_184	-- block#43 is visited secondly
  end
  g_skipConfirm = r4_9
  r1_9 = r2_9:IsKeyDWORD("hideCursor")
  g_hideCursor = r2_9:GetDWORD("hideCursor")
  if r1_9 == false then
    g_hideCursor = 0
  end
  r1_9 = r2_9:IsKeyDWORD("hideCursorOn")
  r4_9 = r2_9:GetDWORD("hideCursorOn")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 1
  end
  if r3_9 == 1 then
    r4_9 = true or false
  else
    goto label_213	-- block#50 is visited secondly
  end
  g_hideCursorOn = r4_9
  r1_9 = r2_9:IsKeyDWORD("deactiveMode")
  r4_9 = r2_9:GetDWORD("deactiveMode")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 1
  end
  if r3_9 == 1 then
    r4_9 = true or false
  else
    goto label_231	-- block#55 is visited secondly
  end
  g_deactiveMode = r4_9
  r1_9 = r2_9:IsKeyDWORD("MouseRButton")
  g_MouseRButton = r2_9:GetDWORD("MouseRButton")
  if r1_9 == false then
    g_MouseRButton = 0
  end
  r1_9 = r2_9:IsKeyDWORD("ReadColorChange")
  r4_9 = r2_9:GetDWORD("ReadColorChange")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 1
  end
  if r3_9 == 1 then
    r4_9 = true or false
  else
    goto label_260	-- block#62 is visited secondly
  end
  g_ReadColorChange = r4_9
  for r7_9, r8_9 in pairs(g_volume) do
    r1_9 = r2_9:IsKeyDWORD(r8_9.name .. "Volume")
    r8_9.vol = r2_9:GetDWORD(r8_9.name .. "Volume")
    if r1_9 == false then
      if r8_9.name == "bgm" then
        r8_9.vol = 600
      elseif r8_9.name == "se" then
        r8_9.vol = 900
      else
        r8_9.vol = 1000
      end
    end
    r1_9 = r2_9:IsKeyDWORD(r8_9.name .. "Mute")
    local r9_9 = r2_9:GetDWORD(r8_9.name .. "Mute")
    r3_9 = r9_9
    if r1_9 == false then
      r3_9 = 0
    end
    if r3_9 == 1 then
      r9_9 = true or false
    else
      goto label_311	-- block#74 is visited secondly
    end
    r8_9.mute = r9_9
  end
  r1_9 = r2_9:IsKeyDWORD("clickVoice")
  r4_9 = r2_9:GetDWORD("clickVoice")
  if r4_9 == 1 then
    r4_9 = true or false
  else
    goto label_328	-- block#79 is visited secondly
  end
  g_clickVoice = r4_9
  if r1_9 == false then
    g_clickVoice = false
  end
  r1_9 = r2_9:IsKeyDWORD("enablePan")
  r4_9 = r2_9:GetDWORD("enablePan")
  if r4_9 == 1 then
    r4_9 = true or false
  else
    goto label_346	-- block#84 is visited secondly
  end
  g_enablePan = r4_9
  if r1_9 == false then
    g_enablePan = true
  end
  r1_9 = r2_9:IsKeyDWORD("bgvVoiceMute")
  r4_9 = r2_9:GetDWORD("bgvVoiceMute")
  if r4_9 == 1 then
    r4_9 = true or false
  else
    goto label_364	-- block#89 is visited secondly
  end
  g_bgvVoiceMute = r4_9
  if r1_9 == false then
    g_bgvVoiceMute = true
  end
  for r7_9 = 1, #g_gestureFunc, 1 do
    local r8_9 = string.format("gesture%d", r7_9)
    if r2_9:IsKeyDWORD(r8_9) == true then
      g_gestureFunc[r7_9] = r2_9:GetDWORD(r8_9)
    end
  end
  r1_9 = r2_9:IsKeyDWORD("DisableGes")
  r4_9 = r2_9:GetDWORD("DisableGes")
  if r4_9 == 1 then
    r4_9 = true or false
  else
    goto label_404	-- block#98 is visited secondly
  end
  g_gestureDisable = r4_9
  if r1_9 == false then
    g_gestureDisable = false
  end
  r1_9 = r2_9:IsKeyDWORD("bgmCutPer")
  g_bgmCutPer = r2_9:GetDWORD("bgmCutPer")
  if r1_9 == false then
    g_bgmCutPer = 75
  end
  r1_9 = r2_9:IsKeyDWORD("messageWindowType")
  g_messageWindowType = r2_9:GetDWORD("messageWindowType")
  if r1_9 == false then
    g_messageWindowType = 0
  end
  r1_9 = r2_9:IsKeyDWORD("sysVoiceChar")
  g_sysVoiceChar = r2_9:GetDWORD("sysVoiceChar")
  if r1_9 == false then
    g_sysVoiceChar = 999
  end
  if getLangPatchFlag() then
    if r2_9:IsKeyDWORD("altLanguageSet") then
      r4_9 = r2_9:GetDWORD("altLanguage")
      if r4_9 == 1 then
        r4_9 = true or false
      else
        goto label_460	-- block#111 is visited secondly
      end
      g_altLanguage = r4_9
    else
      r2_9:SetDWORD("altLanguageSet", 0)
      g_altLanguage = false
    end
  else
    g_altLanguage = false
  end
  r1_9 = r2_9:IsKeyDWORD("GameType")
  g_GameType = r2_9:GetDWORD("GameType")
  if r1_9 == false then
    g_GameType = 0
  end
  r2_9:delete()
  g_mixer = cclass.lua_Mixer:new()
  math.randomseed(os.time())
  LoadGameFont()
  return true
end
finalizeLegacyGame = function(r0_10)
  -- line: [642, 727] id: 10
  local r1_10 = cclass.lua_Registry:new(r0_10)
  r1_10:SetDWORD("messageSpeed", g_msgspeed)
  r1_10:SetDWORD("messageAlpha", g_messagealpha)
  r1_10:SetDWORD("autoSpeed", g_autospeed)
  local r2_10 = 0
  if g_allskip == true then
    r2_10 = 1 or 0
  else
    goto label_24	-- block#2 is visited secondly
  end
  r1_10:SetDWORD("allSkip", r2_10)
  if g_selectReleaseSkip == true then
    r2_10 = 1 or 0
  else
    goto label_35	-- block#5 is visited secondly
  end
  r1_10:SetDWORD("selectReleaseSkip", r2_10)
  if g_selectReleaseAuto == true then
    r2_10 = 1 or 0
  else
    goto label_46	-- block#8 is visited secondly
  end
  r1_10:SetDWORD("selectReleaseAuto", r2_10)
  r1_10:SetDWORD("effectSpeed", g_effectSpeed)
  if g_drawSkipIcon == true then
    r2_10 = 1 or 0
  else
    goto label_61	-- block#11 is visited secondly
  end
  r1_10:SetDWORD("drawSkipIcon", r2_10)
  if g_mouseAutoMove == true then
    r2_10 = 1 or 0
  else
    goto label_72	-- block#14 is visited secondly
  end
  r1_10:SetDWORD("mouseAutoMove", r2_10)
  if g_skipConfirm == true then
    r2_10 = 1 or 0
  else
    goto label_83	-- block#17 is visited secondly
  end
  r1_10:SetDWORD("skipConfirm", r2_10)
  r1_10:SetDWORD("hideCursor", g_hideCursor)
  if g_hideCursorOn == true then
    r2_10 = 1 or 0
  else
    goto label_98	-- block#20 is visited secondly
  end
  r1_10:SetDWORD("hideCursorOn", r2_10)
  if g_deactiveMode == true then
    r2_10 = 1 or 0
  else
    goto label_109	-- block#23 is visited secondly
  end
  r1_10:SetDWORD("deactiveMode", r2_10)
  r1_10:SetDWORD("MouseRButton", g_MouseRButton)
  if g_ReadColorChange == true then
    r2_10 = 1 or 0
  else
    goto label_124	-- block#26 is visited secondly
  end
  r1_10:SetDWORD("ReadColorChange", r2_10)
  for r6_10, r7_10 in pairs(g_volume) do
    r1_10:SetDWORD(r7_10.name .. "Volume", r7_10.vol)
    if r7_10.mute == true then
      r2_10 = 1 or 0
    else
      goto label_145	-- block#30 is visited secondly
    end
    r1_10:SetDWORD(r7_10.name .. "Mute", r2_10)
  end
  if g_clickVoice == true then
    r2_10 = 1 or 0
  else
    goto label_160	-- block#35 is visited secondly
  end
  r1_10:SetDWORD("clickVoice", r2_10)
  if g_enablePan == true then
    r2_10 = 1 or 0
  else
    goto label_171	-- block#38 is visited secondly
  end
  r1_10:SetDWORD("enablePan", r2_10)
  if g_bgvVoiceMute == true then
    r2_10 = 1 or 0
  else
    goto label_182	-- block#41 is visited secondly
  end
  r1_10:SetDWORD("bgvVoiceMute", r2_10)
  for r6_10 = 1, #g_gestureFunc, 1 do
    r1_10:SetDWORD(string.format("gesture%d", r6_10), g_gestureFunc[r6_10])
  end
  r1_10:SetDWORD("bgmCutPer", g_bgmCutPer)
  r1_10:SetDWORD("messageWindowType", g_messageWindowType)
  r1_10:SetDWORD("sysVoiceChar", g_sysVoiceChar)
  if g_gestureDisable == true then
    r2_10 = 1 or 0
  else
    goto label_221	-- block#47 is visited secondly
  end
  r1_10:SetDWORD("DisableGes", r2_10)
  if g_altLanguage == true then
    r2_10 = 1 or 0
  else
    goto label_232	-- block#50 is visited secondly
  end
  r1_10:SetDWORD("altLanguage", r2_10)
  g_mixer:delete()
  r1_10:delete()
end
changeMessageColor = function()
  -- line: [732, 736] id: 11
  local r0_11 = cclass.lua_Layers:create()
  r0_11:updateTextColor("system", "Txt01")
  r0_11:updateTextColor("system", "Name01")
end
setMessageColor = function(r0_12)
  -- line: [738, 770] id: 12
  local r1_12 = cclass.CLegacyFontInfo:create()
  local r2_12 = {
    [1] = g_message1Color,
    [2] = g_message2Color,
  }
  local r3_12 = {
    [1] = g_name1Color,
    [2] = g_name2Color,
  }
  local r4_12 = r0_12
  g_messageAlready = r0_12
  if g_ReadColorChange == false then
    r4_12 = 0
    g_messageAlready = -1
  end
  if r4_12 == 0 then
    r1_12:changeColor("system", "Txt01", r2_12[g_messageWindowType + 1].normal, r2_12[g_messageWindowType + 1].normalEdge)
    r1_12:changeColor("system", "Name01", r3_12[g_messageWindowType + 1].normal, r3_12[g_messageWindowType + 1].normalEdge)
  else
    r1_12:changeColor("system", "Txt01", r2_12[g_messageWindowType + 1].already, r2_12[g_messageWindowType + 1].alreadyEdge)
    r1_12:changeColor("system", "Name01", r3_12[g_messageWindowType + 1].already, r3_12[g_messageWindowType + 1].alreadyEdge)
  end
  changeMessageColor()
end
changeMessageWindow = function(r0_13, r1_13)
  -- line: [774, 781] id: 13
  if g_MenuMsgWin ~= nil then
    return g_MenuMsgWin:changeMessageWindow(r0_13, r1_13)
  end
  return true
end
getMessageWindowID = function()
  -- line: [783, 786] id: 14
  return g_windowID
end
isUseNameWindow = function()
  -- line: [788, 794] id: 15
  if g_windowID == 2 then
    return false
  end
  return true
end
initSystemScreen = function()
  -- line: [804, 3797] id: 16
  g_MenuMsgWin = Menu.new("system")
  g_MenuMsgWin.MenuEffect = function(r0_17)
    -- line: [813, 832] id: 17
    local r1_17 = false
    r1_17 = cclass.lua_Layers:create():isEffect("system", "WndDisp")
    if r0_17.MenuInf.effect == true and r1_17 == false then
      r0_17:MenuEffectEndJob()
      r0_17.MenuInf.effect = false
      g_refreshCursor = true
    end
    r0_17:IconEffect()
    r0_17:TipsEffect()
    return r1_17
  end
  g_MenuMsgWin.MenuEffectEndJob = function(r0_18)
    -- line: [835, 877] id: 18
    local r1_18 = cclass.lua_Layers:create()
    if r0_18.MenuInf.enabled == true then
      r1_18:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_18:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_18:setParam("system", "Msg01", LUA_PARAM_SCALE, 1, 1, 1, 0)
      local r2_18 = g_windowID
      if r2_18 == -1 then
        r2_18 = g_messageWindowType
      end
      if r2_18 == 2 then
        r1_18:setParam("system", "Msg01", LUA_PARAM_POS, r0_18.MswPosN.x, r0_18.MswPosN.y, 0, 0)
        r1_18:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPosN.x, g_MSWTxtPosN.y, 0, 0)
      else
        r1_18:setParam("system", "Msg01", LUA_PARAM_POS, r0_18.MswPos.x, r0_18.MswPos.y, 0, 0)
        r1_18:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPos.x, g_MSWTxtPos.y, 0, 0)
      end
      r1_18:setParam("system", "Name01", LUA_PARAM_POS, g_MSWNamePos.x, g_MSWNamePos.y, 0, 0)
      for r6_18, r7_18 in pairs(r0_18.openEffSubKey) do
        r1_18:setSubLayerParam("system", "Msg01", r7_18, LUA_PARAM_SCALE, 1, 1, 1, 0)
      end
      local r3_18 = 0
      local r4_18 = 0
      local r5_18 = cclass.lua_AutoCursor:new()
      r3_18, r4_18 = r5_18:GetCursorPos(r3_18, r4_18)
      r5_18:delete()
      r0_18.MenuButton:changeButton(r0_18.MenuInf.SetName, r1_18:getCursorPos(r0_18.MenuInf.SetName, r3_18, r4_18, 0) - 1, r3_18, r4_18)
    end
  end
  g_MenuMsgWin.MenuButtonJobPos = function(r0_19, r1_19, r2_19, r3_19, r4_19)
    -- line: [881, 985] id: 19
    if r1_19 ~= 0 and r2_19 == "LU" then
      if r1_19 == 1 then
        openConfig(0, false)
      end
      if r1_19 == 2 then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
      end
      if r1_19 == 3 then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGAUTO)
      end
      if r1_19 == 4 then
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_VOICEREPEAT, 0)
      end
      if r1_19 == 5 then
        openMessageLog()
      end
      if r1_19 == 6 and hideMessageWindow(1) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGHIDE)
      end
      if r1_19 == 7 then
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
      end
      if r1_19 == 8 then
        openConfirm(LUA_CONFIRM_QUICKLOAD)
      end
      if r1_19 == 9 then
        openConfig(4, false)
      end
      if r1_19 == 10 then
        openConfig(5, false)
      end
      if r1_19 == 11 then
        openConfirm(LUA_CONFIRM_SELECTLOAD)
      end
      if 101 <= r1_19 and r1_19 < 200 then
        local r5_19 = cclass.lua_Layers:create()
        setSelectTextColor(r1_19 - 101, 2)
        cfunc.LegacyGame__lua_SelectItem(r1_19 - 101)
        r0_19:closeSelect(r1_19 - 100)
      end
      if r1_19 >= 200 then
        r0_19:TipsNextJob()
      end
    end
    if r2_19 == "RD" and r0_19:GetMenuMouseEnable() then
      if g_MouseRButton == 0 then
        local r5_19 = nil
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
          r5_19 = 0
        else
          r5_19 = 1
        end
        if hideMessageWindow(r5_19) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGHIDE)
        end
      elseif g_MouseRButton == 1 and not cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        openConfig(0, false)
      elseif g_MouseRButton == 2 and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) ~= true and not cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        openConfig(4, false)
      elseif g_MouseRButton == 3 and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) ~= true and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) ~= false and not cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        openConfig(5, false)
      end
    end
  end
  g_MenuMsgWin.defaultMenuMouseMove = g_MenuMsgWin.MenuMouseMove
  g_MenuMsgWin.MenuMouseMove = function(r0_20, r1_20, r2_20, r3_20, r4_20, r5_20, r6_20)
    -- line: [989, 1040] id: 20
    r0_20:defaultMenuMouseMove(r1_20, r2_20, r3_20, r4_20, r5_20, r6_20)
    if r0_20:GetMenuMouseEnable() then
      local r7_20 = cclass.lua_Layers:create()
      for r11_20 = 1, r0_20.SelectCount, 1 do
        local r12_20 = getLocalSelectKey(r11_20)
        local r13_20 = getLocalSelectText(r11_20)
        if r0_20.MenuButton.selCursor == r12_20 then
          cclass.CLegacyFontInfo:create():changeColor("system", r13_20, g_selectTextColor.oncursor, g_selectTextColor.oncursorEdge)
          r7_20:updateTextColor("system", r13_20)
          if r0_20.ActiveSelect[r12_20] == 0 then
          end
        else
          setSelectTextColor(r11_20 - 1, g_SelectTextColorState[r11_20])
          r7_20:updateTextColor("system", r13_20)
          if r0_20.ActiveSelect[r12_20] == 0 then
          end
        end
      end
      for r12_20, r13_20 in pairs({
        "CONFIG",
        "SKIP",
        "AUTO",
        "REPEAT",
        "BACKLOG",
        "QSAVE",
        "QLOAD",
        "SAVE",
        "LOAD",
        "RtpC"
      }) do
        local r14_20 = r0_20.MenuButtonData[r13_20]
        if r14_20 ~= nil then
          r14_20 = r0_20.MenuButtonData[r13_20].active
          if r14_20 == 0 then
            r14_20 = r0_20.MenuItem[r13_20]
            if r14_20 ~= nil then
              r14_20 = r0_20.MenuButtonData[r13_20].focusflag
              if r14_20 then
                r0_20.MenuItem[r13_20]:SetAct("on")
              else
                r0_20.MenuItem[r13_20]:SetAct("def")
              end
            end
          end
        end
      end
    end
  end
  g_MenuMsgWin.GetMenuActive = function(r0_21)
    -- line: [1044, 1055] id: 21
    local r1_21 = false
    if r0_21.MenuInf.enabled == true or r0_21.MenuInf.effect == true then
      r1_21 = true
    end
    if r0_21.MenuInf.select_enabled == true or r0_21.MenuInf.select_effect == true then
      r1_21 = true
    end
    return r1_21
  end
  g_MenuMsgWin.GetMenuMouseEnable = function(r0_22)
    -- line: [1059, 1077] id: 22
    local r1_22 = false
    if r0_22.MenuInf.enabled == true and r0_22.MenuInf.effect == false and r0_22.MenuInf.select_effect == false and r0_22.MenuInf.tips_effect == false and r0_22.MenuInf.tips_wineffect == false and r0_22.buttonEffect.effect_auto == false and r0_22.buttonEffect.effect_skip == false and r0_22.MenuButton ~= nil then
      r1_22 = true
    end
    return r1_22
  end
  g_MenuMsgWin.MenuKeyDown = function(r0_23, r1_23, r2_23, r3_23, r4_23)
    -- line: [1080, 1179] id: 23
    if r4_23 == true then
      return 
    end
    if r0_23.MenuInf.select_enabled == true and r0_23.MenuInf.select_effect == false then
      local r5_23 = cclass.lua_Layers:create()
      local r6_23 = r0_23.MenuButton.selCursor
      local r7_23 = -1
      for r11_23 = 1, r0_23.SelectCount, 1 do
        if getLocalSelectKey(r11_23) == r6_23 then
          r7_23 = r11_23
          break
        end
      end
      if r0_23.SelectType ~= true then
        if r3_23 == LUA_KEYCODE_ENTER and r7_23 ~= -1 then
          setSelectTextColor(r7_23 - 1, 2)
          cfunc.LegacyGame__lua_SelectItem(r7_23 - 1)
          r0_23:closeSelect(r7_23)
        elseif r3_23 == LUA_KEYCODE_UP then
          if r7_23 == -1 then
            local r8_23 = 1
            for r12_23 = 1, r0_23.SelectCount, 1 do
              if r0_23.ActiveSelect[getLocalSelectKey(r12_23)] == 0 then
                r8_23 = r12_23
                break
              end
            end
            SetAutoOncursor("system", getLocalSelectKey(r8_23), 1, 100)
          elseif r7_23 > 1 then
            local r8_23 = -1
            for r12_23 = r7_23 - 1, 1, -1 do
              if r0_23.ActiveSelect[getLocalSelectKey(r12_23)] == 0 then
                r8_23 = r12_23
                break
              end
            end
            if r8_23 >= 1 then
              SetAutoOncursor("system", getLocalSelectKey(r8_23), 1, 100)
            end
          end
        elseif r3_23 == LUA_KEYCODE_DOWN then
          if r7_23 == -1 then
            local r8_23 = 1
            for r12_23 = 1, r0_23.SelectCount, 1 do
              if r0_23.ActiveSelect[getLocalSelectKey(r12_23)] == 0 then
                r8_23 = r12_23
                break
              end
            end
            SetAutoOncursor("system", getLocalSelectKey(r8_23), 1, 100)
          elseif r7_23 < r0_23.SelectCount then
            local r8_23 = -1
            for r12_23 = r7_23 + 1, r0_23.SelectCount, 1 do
              if r0_23.ActiveSelect[getLocalSelectKey(r12_23)] == 0 then
                r8_23 = r12_23
                break
              end
            end
            if r8_23 >= 1 then
              SetAutoOncursor("system", getLocalSelectKey(r8_23), 1, 100)
            end
          end
        end
      end
    end
  end
  g_MenuMsgWin.MenuButtonInit = function(r0_24)
    -- line: [1183, 1199] id: 24
    if r0_24.MenuButton ~= nil then
      r0_24.MenuButton:SetList("MenuButtonData", r0_24.MenuButtonData)
      r0_24.MenuButton:InitButton()
      if r0_24.SelectButtonData ~= nil then
        r0_24.MenuButton:SetList("SelectButtonData", r0_24.SelectButtonData)
      end
      if r0_24.TipsButton ~= nil then
        r0_24.MenuButton:SetList("TipsButton", r0_24.TipsButton)
      end
    end
  end
  g_MenuMsgWin.TipsButton = {}
  g_MenuMsgWin.TipsNo = 0
  g_MenuMsgWin.TipsCount = 0
  g_MenuMsgWin.TipsNext = 0
  g_MenuMsgWin.TipsOut = false
  g_MenuMsgWin.TipsCloseCount = 0
  if g_UseTips then
    cfunc.LegacyGame__lua_SetVariable(140, g_MenuMsgWin.TipsNo)
    cfunc.LegacyGame__lua_SetVariable(141, g_MenuMsgWin.TipsCount)
    cfunc.LegacyGame__lua_SetVariable(142, g_MenuMsgWin.TipsNext)
    cfunc.LegacyGame__lua_SetVariable(143, g_MenuMsgWin.TipsCloseCount)
    cfunc.LegacyGame__lua_SetFlag(143, g_MenuMsgWin.TipsOut)
  end
  g_MenuMsgWin.TipsEffect = function(r0_25)
    -- line: [1217, 1233] id: 25
    local r1_25 = cclass.lua_Layers:create()
    if r0_25.MenuInf.tips_effect == true and r1_25:isEffect("system", "TipsDisp") == false then
      r0_25:TipsEffectEndJob()
      r0_25.MenuInf.tips_effect = false
    end
    if r0_25.MenuInf.tips_wineffect == true and r1_25:isEffect("system", "TipsWindow") == false then
      r0_25:TipsEffectEndJob()
      r0_25.MenuInf.tips_wineffect = false
    end
    return r0_25.MenuInf.tips_effect
  end
  g_MenuMsgWin.TipsEffectEndJob = function(r0_26)
    -- line: [1235, 1272] id: 26
    if r0_26.MenuInf.tips_enabled == true then
      local r1_26 = cclass.lua_Layers:create()
      if r0_26.TipsOut == false then
        r1_26:setSubLayerVisible("system", "Tips01", 1, 1)
        r0_26:SetTipsPos()
        local r2_26 = 0
        local r3_26 = 0
        local r4_26 = cclass.lua_AutoCursor:new()
        r2_26, r3_26 = r4_26:GetCursorPos(r2_26, r3_26)
        r4_26:delete()
        r0_26.MenuButton:changeButton(r0_26.MenuInf.SetName, r1_26:getCursorPos(r0_26.MenuInf.SetName, r2_26, r3_26, 0) - 1, r2_26, r3_26)
      end
    else
      r0_26:TipsRemoveLayer()
      r0_26.TipsNo = 0
      r0_26.TipsCount = 0
      r0_26.TipsNext = 0
      r0_26.TipsOut = false
      r0_26.TipsCloseCount = 0
      cfunc.LegacyGame__lua_SetVariable(140, r0_26.TipsNo)
      cfunc.LegacyGame__lua_SetVariable(141, r0_26.TipsCount)
      cfunc.LegacyGame__lua_SetVariable(142, r0_26.TipsNext)
      cfunc.LegacyGame__lua_SetVariable(143, r0_26.TipsCloseCount)
      cfunc.LegacyGame__lua_SetFlag(143, r0_26.TipsOut)
    end
  end
  g_MenuMsgWin.onResetTips = function(r0_27)
    -- line: [1274, 1295] id: 27
    if r0_27.MenuInf.tips_enabled == true or r0_27.MenuInf.tips_effect == true then
      r0_27:cancelTipsEffect()
      r0_27:TipsRemoveLayer()
      r0_27.MenuInf.tips_enabled = false
      r0_27.MenuInf.tips_effect = false
      r0_27.TipsNo = 0
      r0_27.TipsCount = 0
      r0_27.TipsNext = 0
      r0_27.TipsOut = false
      cfunc.LegacyGame__lua_SetVariable(140, r0_27.TipsNo)
      cfunc.LegacyGame__lua_SetVariable(141, r0_27.TipsCount)
      cfunc.LegacyGame__lua_SetVariable(142, r0_27.TipsNext)
      cfunc.LegacyGame__lua_SetVariable(143, r0_27.TipsCloseCount)
      cfunc.LegacyGame__lua_SetFlag(143, r0_27.TipsOut)
    end
  end
  g_MenuMsgWin.cancelTipsEffect = function(r0_28)
    -- line: [1298, 1323] id: 28
    local r1_28 = false
    local r2_28 = cclass.lua_Layers:create()
    if r0_28.MenuInf.tips_effect == true then
      r2_28:cancelEffect("system", "Tips01", "TipsDisp")
      r2_28:cancelEffect("system", "TipsTxt", "TipsDisp")
      r0_28.MenuInf.tips_effect = false
      r1_28 = true
    end
    if r0_28.MenuInf.tips_wineffect == true then
      r2_28:cancelEffect("system", "Tips01", "TipsWindow")
      r2_28:cancelEffect("system", "TipsTxt", "TipsWindow")
      r0_28.MenuInf.tips_wineffect = false
      r1_28 = true
    end
    if r1_28 == true then
      r0_28:SetTipsPos()
      return true
    end
    return false
  end
  g_MenuMsgWin.SetTipsPos = function(r0_29)
    -- line: [1326, 1349] id: 29
    local r1_29 = cclass.lua_Layers:create()
    if r0_29.MenuInf.tips_enabled == true then
      r1_29:setParam("system", "Tips01", LUA_PARAM_POS, g_TipsPos.x, g_TipsPos.y, 0, 0)
      r1_29:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_29:setParam("system", "TipsTxt", LUA_PARAM_POS, g_TipsPos.x, g_TipsPos.y, 0, 0)
      r1_29:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 1)
    else
      r1_29:setParam("system", "Tips01", LUA_PARAM_POS, g_TipsPos.x + g_TipsPos.move, g_TipsPos.y, 0, 0)
      r1_29:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      local r2_29 = 0
      local r3_29 = 0
      local r4_29 = 0
      local r5_29 = 0
      r1_29:setParam("system", "TipsTxt", LUA_PARAM_POS, g_TipsPos.x + g_TipsPos.move, g_TipsPos.y, 0, 0)
      r1_29:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
  g_MenuMsgWin.TipsTxtName = function(r0_30, r1_30)
    -- line: [1353, 1357] id: 30
    return "SYS_TIPSTXT.pna"
  end
  if g_SetDefaultLangJP then
  end
  g_MenuMsgWin.TipsTxtLayer = {
    {
      34,
      70
    },
    {
      33,
      69
    },
    {
      32,
      68
    },
    {
      31,
      67
    },
    {
      30,
      66
    },
    {
      29,
      65
    },
    {
      28,
      64
    },
    {
      27,
      63
    },
    {
      26,
      62
    },
    {
      25,
      61
    },
    {
      24,
      60
    },
    {
      23,
      59
    },
    {
      22,
      58
    },
    {
      21,
      57
    },
    {
      20,
      56
    },
    {
      19,
      55
    },
    {
      18,
      54
    },
    {
      17,
      53
    },
    {
      16,
      52
    },
    {
      15,
      51
    },
    {
      14,
      50
    },
    {
      13,
      49
    },
    {
      12,
      48
    },
    {
      11,
      47
    },
    {
      10,
      46
    },
    {
      9,
      45
    },
    {
      8,
      44
    },
    {
      7,
      43
    },
    {
      6,
      42
    },
    {
      5,
      41
    },
    {
      4,
      40
    },
    {
      3,
      39
    },
    {
      2,
      38
    },
    {
      1,
      37
    },
    nil,
    nil
  }
  g_MenuMsgWin.MenuInitTips = function(r0_31, r1_31)
    -- line: [1407, 1429] id: 31
    if r0_31:cancelTipsEffect() == true then
      r0_31:TipsEffectEndJob()
    end
    r0_31.TipsNo = r1_31
    r0_31.TipsCount = #r0_31.TipsTxtLayer[r1_31]
    r0_31.TipsNext = 1
    r0_31.TipsOut = false
    r0_31.TipsCloseCount = 0
    cfunc.LegacyGame__lua_SetVariable(140, r0_31.TipsNo)
    cfunc.LegacyGame__lua_SetVariable(141, r0_31.TipsCount)
    cfunc.LegacyGame__lua_SetVariable(142, r0_31.TipsNext)
    cfunc.LegacyGame__lua_SetVariable(143, r0_31.TipsCloseCount)
    cfunc.LegacyGame__lua_SetFlag(143, r0_31.TipsOut)
    r0_31:MenuMakeTipsLayer()
    r0_31:startTipsMenu()
  end
  g_MenuMsgWin.MenuLoadTips = function(r0_32)
    -- line: [1432, 1446] id: 32
    r0_32.TipsNo = cfunc.LegacyGame__lua_GetVariable(140)
    r0_32.TipsCloseCount = cfunc.LegacyGame__lua_GetVariable(143)
    if r0_32.TipsNo ~= 0 and r0_32.TipsCloseCount ~= 0 then
      r0_32.TipsCount = cfunc.LegacyGame__lua_GetVariable(141)
      r0_32.TipsNext = cfunc.LegacyGame__lua_GetVariable(142)
      r0_32.TipsOut = cfunc.LegacyGame__lua_GetFlag(143)
      r0_32:MenuMakeTipsLayer()
      r0_32:startTipsMenu()
    else
      r0_32.TipsNo = 0
      r0_32.TipsCloseCount = 0
    end
  end
  g_MenuMsgWin.MenuMakeTipsLayer = function(r0_33)
    -- line: [1449, 1489] id: 33
    local r1_33 = cclass.lua_Layers:create()
    r0_33:MenuLoadLayer("Tips01", "SYS_TIPS.pna")
    r0_33:MenuLoadLayer("TipsTxt", r0_33:TipsTxtName())
    r0_33.TipsButton = {}
    r0_33:MenuButtonSet(r0_33.TipsButton, "TipsNext", 1, "Tips01", 0, -1, -1, -1, -1, 200, 0, 0)
    r0_33.TipsButton.TipsNext.se_click = -1
    r0_33.TipsButton.TipsNext.se_on = -1
    r0_33.MenuButton:InitList()
    r0_33.MenuButton:SetList("TipsButton", r0_33.TipsButton)
    r0_33.MenuButton:InitButton()
    r1_33:initSubLayer("system", "Tips01", 1, 1)
    r1_33:setParam("system", "Tips01", LUA_PARAM_POS, g_TipsPos.x, g_TipsPos.y, 0, 0)
    for r6_33 = 1, #r0_33.TipsTxtLayer, 1 do
      for r10_33 = 1, r0_33.TipsCount, 1 do
        r1_33:initSubLayer("system", "TipsTxt", r0_33.TipsTxtLayer[r6_33][r10_33], 0)
      end
    end
    r0_33:ActTipsTxt()
    if r0_33.MenuButtonData ~= nil then
      r0_33.MenuButton:SetList("MenuButtonData", r0_33.MenuButtonData)
    end
    if r0_33.SelectButtonData ~= nil then
      r0_33.MenuButton:SetList("SelectButtonData", r0_33.SelectButtonData)
    end
  end
  g_MenuMsgWin.ActTipsTxt = function(r0_34)
    -- line: [1492, 1509] id: 34
    local r1_34 = cclass.lua_Layers:create()
    for r5_34 = 1, r0_34.TipsCount, 1 do
      local r6_34 = r0_34.TipsNext
      if r6_34 == r5_34 - 1 then
        r6_34 = 1 or 0
      else
        goto label_15	-- block#3 is visited secondly
      end
      if r5_34 == 1 then
        r6_34 = 1
      end
      r1_34:setSubLayerVisible("system", "TipsTxt", r0_34.TipsTxtLayer[r0_34.TipsNo][r5_34], r6_34)
    end
    if g_SetDefaultLangJP then
    end
  end
  g_MenuMsgWin.TipsNextJob = function(r0_35)
    -- line: [1512, 1520] id: 35
    r0_35.TipsNext = r0_35.TipsNext + 1
    cfunc.LegacyGame__lua_SetVariable(142, r0_35.TipsNext)
    if r0_35.TipsCount > r0_35.TipsNext then
      r0_35:ActTipsTxt()
    end
  end
  g_MenuMsgWin.startTipsMenu = function(r0_36)
    -- line: [1523, 1599] id: 36
    r0_36:onResetTips()
    local r2_36 = nil	-- notice: implicit variable refs by block#[3]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r2_36 = 1
      if not r2_36 then
        ::label_11::
        r2_36 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_11	-- block#2 is visited secondly
    end
    local r3_36 = 0
    local r4_36 = cclass.lua_Layers:create()
    r4_36:setSubLayerVisible("system", "Tips01", 1, 1)
    r4_36:setParam("system", "TipsTxt", LUA_PARAM_POS, g_TipsPos.x, g_TipsPos.y, 0, 0)
    r4_36:setParam("system", "Tips01", LUA_PARAM_POS, g_TipsPos.x, g_TipsPos.y, 0, 0)
    r4_36:setParam("system", "Tips01", LUA_PARAM_POS, g_TipsPos.x + g_TipsPos.move, g_TipsPos.y, 0, 0)
    r4_36:setEffect("system", "Tips01", "TipsDisp", LUA_EFFECT_POS, 0 - g_TipsPos.move, 0, 0, 0, 2, 400 * r2_36, 0, r3_36 * r2_36)
    r4_36:startEffect("system", "Tips01", "TipsDisp", 0)
    r4_36:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_36:setEffect("system", "TipsTxt", "TipsDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 200 * r2_36, 0, r3_36 * r2_36)
    r4_36:setParam("system", "TipsTxt", LUA_PARAM_POS, g_TipsPos.x + g_TipsPos.move, g_TipsPos.y, 0, 0)
    r4_36:setEffect("system", "TipsTxt", "TipsDisp", LUA_EFFECT_POS, 0 - g_TipsPos.move, 0, 0, 0, 2, 400 * r2_36, 0, r3_36 * r2_36)
    r4_36:startEffect("system", "TipsTxt", "TipsDisp", 0)
    if g_SysSEName.TipsOpen ~= nil then
      local r5_36 = cclass.lua_Sounds:new()
      r5_36:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.TipsOpen), g_SysSEName.TipsOpen, getSoundVolume("systemse"))
      r5_36:delete()
    end
    r0_36.MenuInf.tips_enabled = true
    r0_36.MenuInf.tips_effect = true
  end
  g_MenuMsgWin.hideTips = function(r0_37, r1_37)
    -- line: [1602, 1616] id: 37
    if r0_37:cancelTipsEffect() == true then
      r0_37:TipsEffectEndJob()
    end
    local r2_37 = r0_37.MenuInf.tips_enabled
    if r2_37 == true then
      if r1_37 == 1 then
        r2_37 = 0 or 1
      else
        goto label_15	-- block#5 is visited secondly
      end
      local r3_37 = cclass.lua_Layers:create()
      r3_37:setVisible("system", "Tips01", r2_37)
      r3_37:setVisible("system", "TipsTxt", r2_37)
      if r1_37 == 1 then
        r2_37 = 3 or 0
      else
        goto label_35	-- block#8 is visited secondly
      end
      r0_37.TipsButton.TipsNext:bt_SetActive(r2_37)
    end
  end
  g_MenuMsgWin.windowCloseTips = function(r0_38)
    -- line: [1619, 1665] id: 38
    if r0_38.MenuInf.tips_enabled == false then
      return 
    end
    if r0_38:cancelTipsEffect() == true then
      r0_38:TipsEffectEndJob()
    end
    if r0_38.TipsNo ~= 0 then
      local r2_38 = r0_38.TipsNext
      if r2_38 < r0_38.TipsCount then
        r0_38.TipsOut = true
        cfunc.LegacyGame__lua_SetFlag(143, r0_38.TipsOut)
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
          r2_38 = 1 or LUA_SKIPSPEED_NONE
        else
          goto label_33	-- block#8 is visited secondly
        end
        local r3_38 = 0
        local r4_38 = cclass.lua_Layers:create()
        r4_38:setParam("system", "Tips01", LUA_PARAM_POS, g_TipsPos.x, g_TipsPos.y, 0, 0)
        r4_38:setEffect("system", "Tips01", "TipsWindow", LUA_EFFECT_POS, g_TipsPos.move, 0, 0, 0, 0, 300 * r2_38, 0, r3_38 * r2_38)
        r4_38:startEffect("system", "Tips01", "TipsWindow", 0)
        r4_38:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_38:setEffect("system", "Tips01", "TipsWindow", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r2_38, 0, r3_38 * r2_38)
        r4_38:startEffect("system", "Tips01", "TipsWindow", 0)
        r4_38:setParam("system", "TipsTxt", LUA_PARAM_POS, g_TipsPos.x, g_TipsPos.y, 0, 0)
        r4_38:setEffect("system", "TipsTxt", "TipsWindow", LUA_EFFECT_POS, g_TipsPos.move, 0, 0, 0, 0, 300 * r2_38, 0, r3_38 * r2_38)
        r4_38:startEffect("system", "TipsTxt", "TipsWindow", 0)
        r4_38:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_38:setEffect("system", "TipsTxt", "TipsWindow", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r2_38, 0, r3_38 * r2_38)
        r4_38:startEffect("system", "TipsTxt", "TipsWindow", 0)
        r0_38.TipsButton.TipsNext:bt_SetActive(3)
        r0_38.MenuInf.tips_wineffect = true
      end
    end
  end
  g_MenuMsgWin.windowOpenTips = function(r0_39)
    -- line: [1668, 1707] id: 39
    if r0_39.MenuInf.tips_enabled == false then
      return 
    end
    if r0_39.TipsOut == true then
      r0_39.TipsOut = false
      cfunc.LegacyGame__lua_SetFlag(143, r0_39.TipsOut)
      local r2_39 = nil	-- notice: implicit variable refs by block#[6]
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
        r2_39 = 1
        if not r2_39 then
          ::label_23::
          r2_39 = LUA_SKIPSPEED_NONE
        end
      else
        goto label_23	-- block#5 is visited secondly
      end
      local r3_39 = 0
      local r4_39 = cclass.lua_Layers:create()
      r4_39:setParam("system", "Tips01", LUA_PARAM_POS, g_TipsPos.x + g_TipsPos.move, g_TipsPos.y, 0, 0)
      r4_39:setEffect("system", "Tips01", "TipsWindow", LUA_EFFECT_POS, 0 - g_TipsPos.move, 0, 0, 0, 0, 300 * r2_39, 0, r3_39 * r2_39)
      r4_39:startEffect("system", "Tips01", "TipsWindow", 0)
      r4_39:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_39:setEffect("system", "Tips01", "TipsWindow", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r2_39, 0, r3_39 * r2_39)
      r4_39:startEffect("system", "Tips01", "TipsWindow", 0)
      r4_39:setParam("system", "TipsTxt", LUA_PARAM_POS, g_TipsPos.x + g_TipsPos.move, g_TipsPos.y, 0, 0)
      r4_39:setEffect("system", "TipsTxt", "TipsWindow", LUA_EFFECT_POS, 0 - g_TipsPos.move, 0, 0, 0, 0, 300 * r2_39, 0, r3_39 * r2_39)
      r4_39:startEffect("system", "TipsTxt", "TipsWindow", 0)
      r4_39:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_39:setEffect("system", "TipsTxt", "TipsWindow", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r2_39, 0, r3_39 * r2_39)
      r4_39:startEffect("system", "TipsTxt", "TipsWindow", 0)
      r0_39.TipsButton.TipsNext:bt_SetActive(0)
      r0_39.MenuInf.tips_wineffect = true
    end
  end
  g_MenuMsgWin.TipsCloseCount = 0
  g_MenuMsgWin.SetTipsCloseCount = function(r0_40, r1_40)
    -- line: [1711, 1717] id: 40
    g_MenuMsgWin.TipsCloseCount = r1_40
    cfunc.LegacyGame__lua_SetVariable(143, r0_40.TipsCloseCount)
  end
  g_MenuMsgWin.TipsNextCount = function(r0_41)
    -- line: [1719, 1732] id: 41
    if r0_41.TipsCloseCount >= 1 then
      r0_41.TipsCloseCount = r0_41.TipsCloseCount - 1
      cfunc.LegacyGame__lua_SetVariable(143, r0_41.TipsCloseCount)
    end
    if r0_41.TipsCloseCount == 0 then
      r0_41:closeTips()
    end
  end
  g_MenuMsgWin.closeTips = function(r0_42)
    -- line: [1736, 1777] id: 42
    if r0_42.MenuInf.tips_enabled == false then
      return 
    end
    if r0_42:cancelTipsEffect() == true then
      r0_42:TipsEffectEndJob()
      r0_42.MenuInf.tips_effect = false
    end
    local r2_42 = nil	-- notice: implicit variable refs by block#[7]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r2_42 = 1
      if not r2_42 then
        ::label_22::
        r2_42 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_22	-- block#6 is visited secondly
    end
    local r3_42 = 0
    local r4_42 = cclass.lua_Layers:create()
    r4_42:setParam("system", "Tips01", LUA_PARAM_POS, g_TipsPos.x, g_TipsPos.y, 0, 0)
    r4_42:setEffect("system", "Tips01", "TipsDisp", LUA_EFFECT_POS, g_TipsPos.move, 0, 0, 0, 0, 500 * r2_42, 0, r3_42 * r2_42)
    r4_42:startEffect("system", "Tips01", "TipsDisp", 0)
    r4_42:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r4_42:setEffect("system", "Tips01", "TipsDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 500 * r2_42, 0, r3_42 * r2_42)
    r4_42:startEffect("system", "Tips01", "TipsDisp", 0)
    r4_42:setParam("system", "TipsTxt", LUA_PARAM_POS, g_TipsPos.x, g_TipsPos.y, 0, 0)
    r4_42:setEffect("system", "TipsTxt", "TipsDisp", LUA_EFFECT_POS, g_TipsPos.move, 0, 0, 0, 0, 500 * r2_42, 0, r3_42 * r2_42)
    r4_42:startEffect("system", "TipsTxt", "TipsDisp", 0)
    r4_42:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r4_42:setEffect("system", "TipsTxt", "TipsDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 500 * r2_42, 0, r3_42 * r2_42)
    r4_42:startEffect("system", "TipsTxt", "TipsDisp", 0)
    r0_42.MenuInf.tips_enabled = false
    r0_42.MenuInf.tips_effect = true
  end
  g_MenuMsgWin.TipsRemoveLayer = function(r0_43)
    -- line: [1780, 1784] id: 43
    local r1_43 = cclass.lua_Layers:create()
    r1_43:removeLayer("system", "Tips01")
    r1_43:removeLayer("system", "TipsTxt")
  end
  g_MenuMsgWin.SelectType = false
  g_MenuMsgWin.SelectEffect = function(r0_44)
    -- line: [1793, 1802] id: 44
    if r0_44.MenuInf.select_effect == true and cclass.lua_Layers:create():isEffect("system", "SelDisp") == false then
      r0_44:SelectEffectEndJob()
      r0_44.MenuInf.select_effect = false
    end
    return r0_44.MenuInf.select_effect
  end
  g_MenuMsgWin.SelectEffectEndJob = function(r0_45)
    -- line: [1804, 1840] id: 45
    if r0_45.MenuInf.select_enabled == true then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SELECTSAVEGAME, 0)
      local r1_45 = cclass.lua_Layers:create()
      local r2_45 = 1
      for r6_45 = 1, r0_45.SelectCount, 1 do
        if r0_45.ActiveSelect[getLocalSelectKey(r6_45)] == 0 then
          r2_45 = r6_45
          break
        end
      end
      local r3_45 = getLocalSelectKey(r2_45)
      local r4_45 = r0_45.SelectButtonData[r3_45].SubLayer.hit.no
      if r0_45.SelectType ~= true then
        SetAutoOncursor("system", r3_45, r4_45, 0)
      end
      local r5_45 = 0
      local r6_45 = 0
      local r7_45 = cclass.lua_AutoCursor:new()
      r5_45, r6_45 = r7_45:GetCursorPos(r5_45, r6_45)
      r7_45:delete()
      r0_45.MenuButton:changeButton(r0_45.MenuInf.SetName, r1_45:getCursorPos(r0_45.MenuInf.SetName, r5_45, r6_45, 0) - 1, r5_45, r6_45)
    else
      r0_45:SelectRemoveLayer()
      r0_45.SelectCount = 0
    end
  end
  g_MenuMsgWin.onResetSelect = function(r0_46)
    -- line: [1843, 1853] id: 46
    if r0_46.MenuInf.select_enabled == true or r0_46.MenuInf.select_effect == true then
      r0_46:cancelSelectEffect()
      r0_46:SelectRemoveLayer()
      r0_46.MenuInf.select_enabled = false
      r0_46.MenuInf.select_effect = false
      r0_46.SelectCount = 0
    end
  end
  g_MenuMsgWin.GetMapPos = function(r0_47, r1_47, r2_47)
    -- line: [1856, 1865] id: 47
    local r3_47 = cclass.lua_Layers:create()
    local r4_47 = 25 + r2_47 * 8 + r1_47 - 1
    local r5_47 = 0
    local r6_47 = 0
    local r7_47 = 0
    local r8_47 = 0
    local r9_47 = getLocalSelectKey(0)
    r3_47:initSubLayer("system", r9_47, r4_47, 0)
    r5_47, r6_47, r7_47, r8_47 = r3_47:getSubLayerParam("system", r9_47, r4_47, LUA_PARAM_POS, r5_47, r6_47, r7_47, r8_47)
    return r5_47, r6_47
  end
  g_MenuMsgWin.MenuMakeSelectLayer = function(r0_48)
    -- line: [1869, 1930] id: 48
    r0_48.SelectType = cfunc.LegacyGame__lua_GetFlag(10)
    g_SelectTextColorState = {}
    local r1_48 = cclass.lua_Layers:create()
    if r0_48.SelectType == true then
      r0_48:MenuLoadLayer(getLocalSelectKey(0), "Sys_Map.pna")
    else
      local r2_48 = true
      local r3_48 = cclass.CLegacyFontInfo:create()
      for r7_48 = 1, r0_48.SelectCount, 1 do
        local r8_48 = getLocalSelectKey(r7_48)
        r0_48:MenuLoadLayer(r8_48, "Sys_Select.pna")
        local r9_48 = 0
        local r10_48 = 0
        r9_48, r10_48, r11_48, r12_48 = r1_48:getParam("system", r8_48, LUA_PARAM_SIZE, r9_48, r10_48, 0, 0)
        local r13_48 = getLocalSelectText(r7_48)
        r1_48:insertTextLayer("system", r13_48, r9_48, r10_48 + 10, 1, 8, 1, 1, 0, 1)
        local r14_48 = getUItype()
        local r15_48 = g_fonts0.name
        local r16_48 = g_fontSize0.selectSize
        if r14_48 == 2 then
          r15_48 = g_fonts2.name
          r16_48 = g_fontSize2.selectSize
        elseif getLangPatchFlag() and getAltLanguage() then
          r15_48 = g_fonts1.name
          r16_48 = g_fontSize1.selectSize
        end
        r3_48:add("system", r13_48, r15_48, r16_48, 1, 0, g_selectTextColor.normal, g_selectTextColor.normalEdge, 1, 1)
        g_SelectTextColorState[r7_48] = 0
      end
    end
  end
  g_MenuMsgWin.SetSelectButPos = function(r0_49)
    -- line: [1933, 2019] id: 49
    if r0_49.SelectType == true then
      local r1_49 = cclass.lua_Layers:create()
      local r2_49 = {
        52,
        53,
        54,
        55,
        56,
        57
      }
      for r6_49 = 1, 6, 1 do
        local r7_49 = cfunc.LegacyGame__lua_GetVariable(r2_49[r6_49])
        local r8_49 = 0
        local r9_49 = 0
        r8_49, r9_49 = r0_49:GetMapPos(r6_49, r7_49)
        r0_49.SelectButtonData[getLocalSelectKey(r6_49)]:bt_SetPos(r8_49, r9_49)
      end
    else
      local r1_49 = 0
      for r5_49 = 1, r0_49.SelectCount, 1 do
        if r0_49.ActiveSelect[getLocalSelectKey(r5_49)] == 0 then
          r1_49 = r1_49 + 1
        end
      end
      local r2_49 = 0
      for r6_49 = 1, r0_49.SelectCount, 1 do
        local r7_49 = cclass.lua_Layers:create()
        local r8_49 = getLocalSelectKey(r6_49)
        local r9_49 = getLocalSelectText(r6_49)
        local r10_49 = SELECT_WINDOW_PITCH
        if r1_49 >= 5 then
          r10_49 = SELECT_WINDOW_PITCH / 2
        end
        if r0_49.ActiveSelect[r8_49] == 0 or r0_49.ActiveSelect[r8_49] == 2 then
          local r11_49 = 0
          local r12_49 = 0
          r11_49, r12_49, r13_49, r14_49 = r7_49:getParam("system", r8_49, LUA_PARAM_SIZE, r11_49, r12_49, 0, 0)
          local r15_49 = math.floor((APP_INTERNAL_WIDTH - r11_49) / 2)
          local r16_49 = math.floor(APP_INTERNAL_HEIGHT / 2 - r1_49 * r12_49 / 2 - (r1_49 - 1) * r10_49 / 2 - 100 + r2_49 * r12_49 + r2_49 * r10_49)
          r0_49.SelectButtonData[r8_49]:bt_SetPos(r15_49, r16_49)
          local r17_49 = r15_49 + g_selectTextPos0.add_x
          local r18_49 = r16_49 + g_selectTextPos0.add_y
          if getUItype() == 2 then
            r17_49 = r15_49 + g_selectTextPos2.add_x
            r18_49 = r16_49 + g_selectTextPos2.add_y
          elseif getLangPatchFlag() and getAltLanguage() then
            r17_49 = r15_49 + g_selectTextPos1.add_x
            r18_49 = r16_49 + g_selectTextPos1.add_y
          end
          r7_49:setParam("system", r9_49, LUA_PARAM_POS, r17_49, r18_49, 0, 0)
          r2_49 = r2_49 + 1
        end
      end
    end
  end
  g_MenuMsgWin.SelectRemoveLayer = function(r0_50)
    -- line: [2022, 2042] id: 50
    local r1_50 = cclass.lua_Layers:create()
    if r0_50.SelectType == true then
      r1_50:removeLayer("system", getLocalSelectKey(0))
    else
      local r2_50 = cclass.CLegacyFontInfo:create()
      for r6_50 = 1, r0_50.SelectCount, 1 do
        local r7_50 = getLocalSelectKey(r6_50)
        local r8_50 = getLocalSelectText(r6_50)
        r2_50:remove("system", r8_50)
        r1_50:removeLayer("system", r7_50)
        r1_50:removeLayer("system", r8_50)
      end
    end
    r0_50.MenuButton:SetList("SelectButtonData", nil)
    r0_50.SelectButtonData = {}
  end
  g_MenuMsgWin.ActiveSelect = {}
  g_MenuMsgWin.MakeSelectBut = function(r0_51)
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
      for r4_51 = 1, r0_51.SelectCount, 1 do
        local r5_51 = getLocalSelectKey(r4_51)
        r0_51:MenuButtonSet(r0_51.SelectButtonData, r5_51, 1, r5_51, 1, 1, 0, -1, 2, r4_51 + 100, 0, 0)
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
  g_MenuMsgWin.startSelectMenu = function(r0_52)
    -- line: [2102, 2161] id: 52
    local r1_52 = cclass.lua_Layers:create()
    local r3_52 = nil	-- notice: implicit variable refs by block#[4, 6]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r3_52 = 1
      if not r3_52 then
        ::label_13::
        r3_52 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_13	-- block#2 is visited secondly
    end
    local r4_52 = 0
    if r0_52.SelectType == true then
      local r5_52 = getLocalSelectKey(0)
      r1_52:setParam("system", r5_52, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_52:setEffect("system", r5_52, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r3_52, 0, r4_52 * r3_52)
      r1_52:startEffect("system", r5_52, "SelDisp", 0)
    else
      local r5_52 = 300
      for r9_52 = 1, r0_52.SelectCount, 1 do
        local r10_52 = getLocalSelectKey(r9_52)
        local r11_52 = getLocalSelectText(r9_52)
        r4_52 = 0
        r1_52:setParam("system", r10_52, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_52:setParam("system", r11_52, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_52:setEffect("system", r10_52, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_52 * r3_52, 0, r4_52 * r3_52)
        r1_52:setEffect("system", r11_52, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_52 * r3_52, 0, r4_52 * r3_52)
        local r12_52 = 0
        local r13_52 = 0
        local r14_52 = 0
        local r15_52 = 0
        r12_52, r13_52, r14_52, r15_52 = r1_52:getParam("system", r10_52, LUA_PARAM_POS, r12_52, r13_52, r14_52, r15_52)
        local r16_52 = r12_52
        r4_52 = 100 * (r9_52 - 1)
        r1_52:setParam("system", r10_52, LUA_PARAM_POS, APP_INTERNAL_WIDTH, r13_52, 0, 0)
        r12_52, r13_52, r14_52, r15_52 = r1_52:getParam("system", r10_52, LUA_PARAM_SIZE, r12_52, r13_52, r14_52, r15_52)
        local r18_52 = r16_52 - APP_INTERNAL_WIDTH
        r1_52:setEffect("system", r10_52, "SelDisp", LUA_EFFECT_POS, r18_52, 0, 0, 0, 0, r5_52 * r3_52, 0, r4_52 * r3_52)
        r12_52, r13_52, r14_52, r15_52 = r1_52:getParam("system", r11_52, LUA_PARAM_POS, r12_52, r13_52, r14_52, r15_52)
        r1_52:setParam("system", r11_52, LUA_PARAM_POS, r12_52 - r18_52, r13_52, 0, 0)
        r1_52:setEffect("system", r11_52, "SelDisp", LUA_EFFECT_POS, r18_52, 0, 0, 0, 0, r5_52 * r3_52, 0, r4_52 * r3_52)
        r1_52:startEffect("system", r10_52, "SelDisp", 0)
        r1_52:startEffect("system", r11_52, "SelDisp", 0)
      end
    end
    r0_52.MenuInf.select_enabled = true
    r0_52.MenuInf.select_effect = true
  end
  g_MenuMsgWin.closeSelect = function(r0_53, r1_53)
    -- line: [2164, 2245] id: 53
    -- notice: unreachable block#9
    local r3_53 = nil	-- notice: implicit variable refs by block#[4, 7, 8]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r3_53 = 1
      if not r3_53 then
        ::label_9::
        r3_53 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_9	-- block#2 is visited secondly
    end
    local r4_53 = cclass.lua_Layers:create()
    local r5_53 = 0
    if r0_53.SelectType == true then
      local r6_53 = getLocalSelectKey(0)
      r4_53:setParam("system", r6_53, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_53:setEffect("system", r6_53, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r3_53, 0, r5_53 * r3_53)
      r4_53:startEffect("system", r6_53, "SelDisp", 0)
    else
      local r6_53 = 0
      for r10_53 = 1, r0_53.SelectCount, 1 do
        local r11_53 = getLocalSelectKey(r10_53)
        local r12_53 = getLocalSelectText(r10_53)
        r4_53:setParam("system", r11_53, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_53:setParam("system", r12_53, LUA_PARAM_COLOR, 1, 1, 1, 1)
        if r10_53 == r1_53 then
          r4_53:setBlurCount("system", r11_53, 5)
          local r13_53 = 0
          local r14_53 = 0
          local r15_53 = 0
          local r16_53 = 0
          local r17_53 = 0
          local r18_53 = 0
          r17_53, r18_53 = r0_53.SelectButtonData[r11_53]:bt_GetPos()
          r13_53, r14_53, r15_53, r16_53 = r4_53:getParam("system", r11_53, LUA_PARAM_SIZE, r13_53, r14_53, r15_53, r16_53)
          r4_53:setParam("system", r11_53, LUA_PARAM_CENTERZ, r17_53 + math.floor(r13_53 / 2), r18_53 + math.floor(r14_53 / 2), 0, 0)
          r13_53, r14_53, r15_53, r16_53 = r4_53:getParam("system", r12_53, LUA_PARAM_SIZE, r13_53, r14_53, r15_53, r16_53)
          r4_53:setParam("system", r12_53, LUA_PARAM_CENTERZ, math.floor(r13_53 / 2), math.floor(r14_53 / 2), 0, 0)
          r4_53:setEffect("system", r11_53, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 200 * r3_53, 0, (300 + 100 * (r0_53.SelectCount - 1)) * r3_53)
          r4_53:setEffect("system", r11_53, "SelDisp", LUA_EFFECT_SCALE, 0.25, 0.25, 0, 0, 0, 300 * r3_53, 0, (300 + 100 * (r0_53.SelectCount - 1)) * r3_53)
          r4_53:setEffect("system", r12_53, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 200 * r3_53, 0, (300 + 100 * (r0_53.SelectCount - 1)) * r3_53)
          r4_53:setEffect("system", r12_53, "SelDisp", LUA_EFFECT_SCALE, 0.25, 0.25, 0, 0, 0, 300 * r3_53, 0, (300 + 100 * (r0_53.SelectCount - 1)) * r3_53)
        else
          local r13_53 = r0_53.SelectCount - 1 - r6_53
          r4_53:setEffect("system", r11_53, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r3_53, 0, 100 * r13_53 * r3_53)
          r4_53:setEffect("system", r12_53, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r3_53, 0, 100 * r13_53 * r3_53)
          local r14_53 = 0
          r14_53, r15_53, r16_53, r17_53 = r4_53:getParam("system", r11_53, LUA_PARAM_SIZE, r14_53, 0, 0, 0)
          local r18_53 = (250 + r14_53) * -1
          r4_53:setEffect("system", r11_53, "SelDisp", LUA_EFFECT_POS, r18_53, 0, 0, 0, 0, 300 * r3_53, 0, 100 * r13_53 * r3_53)
          r4_53:setEffect("system", r12_53, "SelDisp", LUA_EFFECT_POS, r18_53, 0, 0, 0, 0, 300 * r3_53, 0, 100 * r13_53 * r3_53)
          r6_53 = r6_53 + 1
        end
        r4_53:startEffect("system", r11_53, "SelDisp", 0)
        r4_53:startEffect("system", r12_53, "SelDisp", 0)
      end
    end
    r0_53.MenuInf.select_enabled = false
    r0_53.MenuInf.select_effect = true
  end
  g_MenuMsgWin.cancelSelectEffect = function(r0_54)
    -- line: [2248, 2297] id: 54
    if r0_54.MenuInf.select_effect == true then
      local r1_54 = cclass.lua_Layers:create()
      if r0_54.SelectType == true then
        local r2_54 = getLocalSelectKey(0)
        r1_54:cancelEffect("system", r2_54, "SelDisp")
        if r0_54.MenuInf.select_enabled == true then
          r1_54:setParam("system", r2_54, LUA_PARAM_COLOR, 1, 1, 1, 1)
        else
          r1_54:setParam("system", r2_54, LUA_PARAM_COLOR, 1, 1, 1, 0)
        end
      else
        for r5_54 = 1, r0_54.SelectCount, 1 do
          local r6_54 = getLocalSelectKey(r5_54)
          local r7_54 = getLocalSelectText(r5_54)
          r1_54:cancelEffect("system", r6_54, "SelDisp")
          r1_54:cancelEffect("system", r7_54, "SelDisp")
          if r0_54.MenuInf.select_enabled == true then
            r1_54:setParam("system", r6_54, LUA_PARAM_COLOR, 1, 1, 1, 1)
            r1_54:setParam("system", r7_54, LUA_PARAM_COLOR, 1, 1, 1, 1)
            r1_54:setParam("system", r6_54, LUA_PARAM_SCALE, 1, 1, 1, 0)
            r1_54:setParam("system", r7_54, LUA_PARAM_SCALE, 1, 1, 1, 0)
          else
            r1_54:setParam("system", r6_54, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r1_54:setParam("system", r7_54, LUA_PARAM_COLOR, 1, 1, 1, 0)
          end
        end
        r0_54:SetSelectButPos()
      end
      return true
    end
    return false
  end
  g_MenuMsgWin.MapActive = function(r0_55, r1_55)
    -- line: [2299, 2313] id: 55
    local r2_55 = cclass.lua_Layers:create()
    for r6_55 = 1, 6, 1 do
      local r7_55 = getLocalSelectKey(r6_55)
      local r8_55 = 0
      if r1_55 == 1 then
        r8_55 = 3
      else
        r8_55 = r0_55.ActiveSelect[r7_55]
      end
      r0_55.SelectButtonData[r7_55]:bt_SetActive(r8_55)
    end
  end
  g_MenuMsgWin.hideSelect = function(r0_56, r1_56)
    -- line: [2317, 2357] id: 56
    if r0_56:cancelSelectEffect() == true then
      r0_56:SelectEffectEndJob()
      r0_56.MenuInf.select_effect = false
    end
    if r0_56.MenuInf.select_enabled == true then
      if r0_56.SelectType == true then
        r0_56:MapActive(r1_56)
      else
        local r2_56 = cclass.lua_Layers:create()
        for r6_56 = 1, r0_56.SelectCount, 1 do
          local r7_56 = getLocalSelectKey(r6_56)
          local r8_56 = 0
          local r9_56 = 1
          if r1_56 == 1 then
            r8_56 = 3
            r9_56 = 0
          elseif r0_56.ActiveSelect[r7_56] ~= 0 then
            r8_56 = r0_56.ActiveSelect[r7_56]
            if r0_56.ActiveSelect[r7_56] == 2 then
              r9_56 = 1
            else
              r9_56 = 0
            end
          end
          r0_56.SelectButtonData[r7_56]:bt_SetActive(r8_56)
          r2_56:setVisible("system", getLocalSelectText(r6_56), r9_56)
        end
      end
    end
  end
  g_MenuMsgWin.DisableSelect = function(r0_57, r1_57)
    -- line: [2360, 2386] id: 57
    -- notice: unreachable block#4
    if r0_57.SelectType ~= true then
      local r2_57 = getLocalSelectKey(r1_57 + 1)
      if r0_57.SelectButtonData[r2_57] ~= nil then
        r0_57.SelectButtonData[r2_57]:bt_SetActive(2)
        r0_57.ActiveSelect[r2_57] = 2
        if false then
          r0_57:SetSelectButPos()
        end
      end
    end
  end
  g_MenuMsgWin.MenuInit = function(r0_58)
    -- line: [2389, 2436] id: 58
    local r1_58 = true
    r0_58.MenuInf.enabled = false
    r0_58.MenuInf.effect = false
    r0_58.SelectCount = 0
    r0_58.MenuInf.select_enabled = false
    r0_58.MenuInf.select_effect = false
    r0_58.SelectButtonData = {}
    r0_58.MenuInf.tips_enabled = false
    r0_58.MenuInf.tips_effect = false
    r0_58.MenuInf.tips_winenabled = false
    r0_58.MenuInf.tips_wineffect = false
    r0_58.buttonEffect = {}
    r0_58.buttonEffect.auto = false
    r0_58.buttonEffect.skip = false
    r0_58.buttonEffect.effect_auto = false
    r0_58.buttonEffect.effect_skip = false
    r0_58.MenuInf.nameWindow = 1
    r0_58.MenuInf.msgWindow = 1
    if cclass.lua_Layers:create():add(r0_58.MenuInf.SetName) == false then
      return false
    end
    r0_58.MenuButton = Button.new(r0_58.MenuInf.SetName)
    r0_58.MenuButton:InitList()
    r0_58.MenuButtonData = {}
    return r1_58
  end
  g_MenuMsgWin.MswLay = {
    win1 = -1,
    back1 = 90,
    win2 = -1,
    back2 = 91,
    name1 = -1,
    nameback1 = -1,
    name2 = -1,
    nameback2 = -1,
    N_back = 92,
  }
  g_MenuMsgWin.MswPos = {
    x = 0,
    y = 558,
    move = 162,
  }
  g_MenuMsgWin.MswPosN = {
    x = 0,
    y = 0,
    move = 0,
  }
  g_MenuMsgWin.changeMessageWindow = function(r0_59, r1_59, r2_59)
    -- line: [2451, 2663] id: 59
    -- notice: unreachable block#60
    local r3_59 = g_windowID
    if r3_59 == r1_59 then
      if r1_59 == -1 then
        r3_59 = r2_59 == true
      else
        goto label_7	-- block#3 is visited secondly
      end
      if r3_59 == false then
        return true
      end
    end
    if r2_59 and g_windowID == 2 then
      return true
    end
    r3_59 = r1_59
    if r3_59 == -1 then
      r3_59 = g_messageWindowType
    end
    local r4_59 = cclass.lua_Layers:create()
    r4_59:removeLayer("system", "Msg01")
    local r5_59 = getUItype()
    local r6_59 = false
    if r3_59 == 2 then
      local r7_59 = "Sys_MessageWindow_N.pna"
      if r5_59 == 1 then
        r7_59 = "Sys_c_MessageWindow_N.pna"
      end
      r6_59 = r0_59:MenuLoadLayer("Msg01", r7_59)
      r4_59:setParam("system", "Msg01", LUA_PARAM_POS, r0_59.MswPosN.x, r0_59.MswPosN.y, 0, 0)
    else
      local r7_59 = "Sys_MessageWindow.pna"
      if r5_59 == 1 then
        r7_59 = "Sys_c_MessageWindow.pna"
      end
      r6_59 = r0_59:MenuLoadLayer("Msg01", r7_59)
      r4_59:setParam("system", "Msg01", LUA_PARAM_POS, r0_59.MswPos.x, r0_59.MswPos.y, 0, 0)
    end
    if r6_59 == false then
      return false
    end
    r4_59:clearHitTestAll("system", "Msg01")
    r4_59:setVisible("system", "Msg01", 1)
    if r0_59.MswLay.win1 ~= -1 then
      r4_59:initSubLayer("system", "Msg01", r0_59.MswLay.win1, 1)
    end
    if r0_59.MswLay.back1 ~= -1 then
      r4_59:initSubLayer("system", "Msg01", r0_59.MswLay.back1, 1)
    end
    if r0_59.MswLay.win2 ~= -1 then
      r4_59:initSubLayer("system", "Msg01", r0_59.MswLay.win2, 1)
    end
    if r0_59.MswLay.back2 ~= -1 then
      r4_59:initSubLayer("system", "Msg01", r0_59.MswLay.back2, 1)
    end
    if r3_59 == 2 and r0_59.MswLay.N_back ~= -1 then
      r4_59:initSubLayer("system", "Msg01", r0_59.MswLay.N_back, 1)
    end
    if r0_59.MswLay.name1 ~= -1 then
      r4_59:initSubLayer("system", "Msg01", r0_59.MswLay.name1, 0)
    end
    if r0_59.MswLay.nameback1 ~= -1 then
      r4_59:initSubLayer("system", "Msg01", r0_59.MswLay.nameback1, 0)
    end
    if r0_59.MswLay.name2 ~= -1 then
      r4_59:initSubLayer("system", "Msg01", r0_59.MswLay.name2, 0)
    end
    if r0_59.MswLay.nameback2 ~= -1 then
      r4_59:initSubLayer("system", "Msg01", r0_59.MswLay.nameback2, 0)
    end
    r0_59.MenuButton:InitList()
    r0_59:MakeWindowBut(r3_59)
    r0_59.MenuButton:SetList("MenuButtonData", r0_59.MenuButtonData)
    r0_59.MenuButton:InitButton()
    if r0_59.SelectButtonData ~= nil then
      r0_59.MenuButton:SetList("SelectButtonData", r0_59.SelectButtonData)
    end
    if r0_59.TipsButton ~= nil then
      r0_59.MenuButton:SetList("TipsButton", r0_59.TipsButton)
    end
    if r2_59 == false then
      r4_59:removeLayer("system", "Txt01")
      r4_59:removeLayer("system", "Name01")
      if r3_59 == 2 then
        r4_59:insertTextLayer("system", "Txt01", g_MSWTxtSizeN.lWidth, g_MSWTxtSizeN.lHeight, g_MSWTxtSizeN.lMarginLeft, g_MSWTxtSizeN.lMarginTop, g_MSWTxtSizeN.lMarginRight, g_MSWTxtSizeN.lMarginBottom, g_MSWTxtSizeN.fLineMargin, 1)
        r4_59:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPosN.x, g_MSWTxtPosN.y, 0, 0)
      else
        r4_59:insertTextLayer("system", "Txt01", g_MSWTxtSize.lWidth, g_MSWTxtSize.lHeight, g_MSWTxtSize.lMarginLeft, g_MSWTxtSize.lMarginTop, g_MSWTxtSize.lMarginRight, g_MSWTxtSize.lMarginBottom, g_MSWTxtSize.fLineMargin, 1)
        r4_59:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPos.x, g_MSWTxtPos.y, 0, 0)
      end
      r4_59:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_59:insertTextLayer("system", "Name01", 250, 33, 4, 4, 4, 4, 0, 0)
      r4_59:setParam("system", "Name01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_59:swapLayerOrder("system", "Msg01", "Auto01")
      r4_59:swapLayerOrder("system", "Msg01", "Skip01")
    else
      r4_59:swapLayerOrder("system", "Msg01", "Auto01")
      r4_59:swapLayerOrder("system", "Msg01", "Skip01")
      r4_59:swapLayerOrder("system", "Msg01", "Name01")
      r4_59:swapLayerOrder("system", "Msg01", "Txt01")
    end
    if r3_59 == 1 then
      r4_59:setSubLayerParam("system", "Skip01", 6, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_59:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_COLOR, 1, 1, 1, 0)
    else
      r4_59:setSubLayerParam("system", "Skip01", 6, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_59:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_COLOR, 1, 1, 1, 1)
    end
    r4_59:setParam("system", "Name01", LUA_PARAM_POS, g_MSWNamePos.x, g_MSWNamePos.y, 0, 0)
    local r7_59 = cclass.CLegacyFontInfo:create()
    local r8_59 = r4_59:getAnimationState("system", "Clk01", "CL_Wait")
    r4_59:removeLayer("system", "Clk01")
    if r3_59 == 0 then
      r0_59:MenuLoadLayer("Clk01", "Sys_ClickWait.pna")
    else
      r0_59:MenuLoadLayer("Clk01", "Sys_ClickWait_S.pna")
    end
    for r12_59 = 0, 14, 1 do
      r4_59:setAnimation("system", "Clk01", "CL_Wait", r12_59, 0.06666666666666667 * r12_59, 0)
    end
    local r9_59 = 0
    if g_messageAlready ~= -1 then
      r9_59 = g_messageAlready
    end
    local r10_59 = {
      [1] = g_message1Color,
      [2] = g_message2Color,
    }
    local r11_59 = {
      [1] = g_name1Color,
      [2] = g_name2Color,
    }
    if r9_59 == 0 then
      r7_59:changeColor("system", "Txt01", r10_59[g_messageWindowType + 1].normal, r10_59[g_messageWindowType + 1].normalEdge)
      r7_59:changeColor("system", "Name01", r11_59[g_messageWindowType + 1].normal, r11_59[g_messageWindowType + 1].normalEdge)
    else
      r7_59:changeColor("system", "Txt01", r10_59[g_messageWindowType + 1].already, r10_59[g_messageWindowType + 1].alreadyEdge)
      r7_59:changeColor("system", "Name01", r11_59[g_messageWindowType + 1].already, r11_59[g_messageWindowType + 1].alreadyEdge)
    end
    g_windowID = r1_59
    if r2_59 == true then
      r4_59:updateTextColor("system", "Txt01")
      r4_59:updateTextColor("system", "Name01")
      if r8_59 == true then
        startClickWaitAnimation()
      end
      if r0_59.MenuInf.enabled == true then
        openMessageWindowWoEffect()
      else
        resetMessageWindow(false)
      end
    else
      resetMessageWindow(false)
    end
    r0_59:changeMessageWindowOpacity()
    return true
  end
  g_MenuMsgWin.MakeWindowBut = function(r0_60, r1_60)
    -- line: [2667, 2712] id: 60
    -- notice: unreachable block#1
    r0_60.MenuButton:ResetButtonActive(r0_60.MenuButtonData)
    r0_60.MenuButtonData = {}
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "CONFIG", 1, "Msg01", 79, 3, 2, -1, 4, 1, 0, 0)
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "REPEAT", 1, "Msg01", 80, 15, 14, -1, 16, 4, 0, 0)
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "SKIP", 1, "Msg01", 81, 27, 26, -1, 28, 2, 0, 0)
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "AUTO", 1, "Msg01", 82, 39, 38, -1, 40, 3, 0, 0)
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "CLOSE", 1, "Msg01", 83, 50, 49, -1, 51, 6, 0, 0)
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "BACKLOG", 1, "Msg01", 84, 55, 54, -1, 56, 5, 0, 0)
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "SAVE", 1, "Msg01", 85, 60, 59, -1, 61, 9, 0, 0)
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "LOAD", 1, "Msg01", 86, 65, 64, -1, 66, 10, 0, 0)
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "QSAVE", 1, "Msg01", 87, 70, 69, -1, 71, 7, 0, 0)
    r0_60:MenuAnimButtonSet("btnState", r0_60.MenuButtonData, "QLOAD", 1, "Msg01", 88, 75, 74, -1, 76, 8, 0, 0)
    r0_60.MenuItem = {}
    if r1_60 == 2 then
      r0_60.MenuItem.WAKUWAKU = MsgMenuItem.new("system", "Msg01", 91, 9, -1)
    end
    if r1_60 == 0 then
      r0_60.MenuItem.CONFIG = MsgMenuItem.new("system", "Msg01", 8, 7, 9)
      r0_60.MenuItem.REPEAT = MsgMenuItem.new("system", "Msg01", 20, 19, 21)
      r0_60.MenuItem.SKIP = MsgMenuItem.new("system", "Msg01", 32, 31, 33)
      r0_60.MenuItem.AUTO = MsgMenuItem.new("system", "Msg01", 44, 43, 45)
    end
  end
  g_MenuMsgWin.setButtonActive = function(r0_61)
    -- line: [2717, 2756] id: 61
    for r5_61, r6_61 in pairs({
      "CONFIG",
      "SKIP",
      "AUTO",
      "REPEAT",
      "BACKLOG",
      "QSAVE",
      "QLOAD",
      "SAVE",
      "LOAD",
      "RtpC"
    }) do
      local r7_61 = r0_61.MenuButtonData[r6_61]
      if r7_61 ~= nil then
        r7_61 = 0
        local r8_61 = r0_61:checkMessageFocus(r6_61)
        if r8_61 then
          r7_61 = 0
          if r6_61 == "SKIP" then
            r8_61 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP)
            if r8_61 then
            end
          end
          if r6_61 == "AUTO" then
            r8_61 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGAUTO)
            if r8_61 then
            end
          end
        else
          r7_61 = 2
        end
        r8_61 = r0_61.MenuButtonData[r6_61].active
        if r8_61 ~= r7_61 then
          r0_61.MenuButtonData[r6_61]:bt_SetActive(r7_61)
          r8_61 = r0_61.MenuItem[r6_61]
          if r8_61 ~= nil then
            if r7_61 == 0 then
              r0_61.MenuItem[r6_61]:SetAct("def")
            else
              r0_61.MenuItem[r6_61]:SetAct("dis")
            end
          end
        end
      end
    end
  end
  g_MenuMsgWin.setButtonState = function(r0_62)
    -- line: [2758, 2764] id: 62
    if r0_62:GetMenuActive() == true then
      r0_62:setButtonActive()
    end
    r0_62:SetSkipAutoState()
  end
  g_MenuMsgWin.checkMessageFocus = function(r0_63, r1_63)
    -- line: [2767, 2816] id: 63
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true and (r1_63 == "CONFIG" or r1_63 == "QSAVE" or r1_63 == "QLOAD" or r1_63 == "SAVE" or r1_63 == "LOAD") then
      return false
    end
    if r1_63 == "CONFIG" then
      return checkOverlayFunction(4)
    end
    if r1_63 == "SKIP" then
      return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLESKIP) or g_allskip
    end
    if r1_63 == "REPEAT" then
      return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLEVOICEREPEAT)
    end
    if r1_63 == "BACKLOG" then
      return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOG)
    end
    if r1_63 == "QSAVE" then
      return checkOverlayFunction(5)
    end
    if r1_63 == "QLOAD" then
      return checkOverlayFunction(6)
    end
    if r1_63 == "SAVE" then
      return checkOverlayFunction(7)
    end
    if r1_63 == "LOAD" then
      return checkOverlayFunction(8)
    end
    if r1_63 == "RtpC" then
      return checkOverlayFunction(13)
    end
    return true
  end
  g_MenuMsgWin.resetMessageWindow = function(r0_64, r1_64)
    -- line: [2820, 2832] id: 64
    if r1_64 == true then
      if getSystemSet() == "system" then
        cfunc.D3DApp__lua_PostMouseMove()
      end
    else
      r0_64:onResetMessageWindow()
    end
  end
  g_MenuMsgWin.nameWindowVisible = function(r0_65, r1_65)
    -- line: [2835, 2913] id: 65
    local r2_65 = cclass.lua_Layers:create()
    local r3_65 = 0
    if r1_65 then
      r3_65 = 1
    end
    local r4_65 = g_windowID
    if r4_65 == -1 then
      r4_65 = g_messageWindowType
    end
    local r6_65 = nil	-- notice: implicit variable refs by block#[27]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r6_65 = 1
      if not r6_65 then
        ::label_21::
        r6_65 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_21	-- block#6 is visited secondly
    end
    if r0_65.MenuInf.nameWindow == 1 then
      local r7_65 = g_messagealpha / 100
      if r4_65 == 0 then
        if r0_65.MswLay.nameback1 ~= -1 then
          r2_65:setSubLayerVisible("system", "Msg01", r0_65.MswLay.nameback1, r3_65)
          r2_65:setSubLayerParam("system", "Msg01", r0_65.MswLay.nameback1, LUA_PARAM_COLOR, 1, 1, 1, r7_65)
        end
        if r0_65.MswLay.name1 ~= -1 then
          r2_65:setSubLayerVisible("system", "Msg01", r0_65.MswLay.name1, r3_65)
        end
        if r0_65.MswLay.nameback2 ~= -1 then
          r2_65:setSubLayerVisible("system", "Msg01", r0_65.MswLay.nameback2, 0)
        end
        if r0_65.MswLay.name2 ~= -1 then
          r2_65:setSubLayerVisible("system", "Msg01", r0_65.MswLay.name2, 0)
        end
      else
        if r0_65.MswLay.nameback2 ~= -1 then
          r2_65:setSubLayerVisible("system", "Msg01", r0_65.MswLay.nameback2, r3_65)
          r2_65:setSubLayerParam("system", "Msg01", r0_65.MswLay.nameback2, LUA_PARAM_COLOR, 1, 1, 1, r7_65)
        end
        if r0_65.MswLay.name2 ~= -1 then
          r2_65:setSubLayerVisible("system", "Msg01", r0_65.MswLay.name2, r3_65)
        end
        if r0_65.MswLay.nameback1 ~= -1 then
          r2_65:setSubLayerVisible("system", "Msg01", r0_65.MswLay.nameback1, 0)
        end
        if r0_65.MswLay.name1 ~= -1 then
          r2_65:setSubLayerVisible("system", "Msg01", r0_65.MswLay.name1, 0)
        end
      end
      r2_65:setVisible("system", "Name01", r3_65)
      if r0_65.MenuInf.effect == true and r3_65 == 1 then
        local r8_65 = 1
        r2_65:setParam("system", "Name01", LUA_PARAM_COLOR, 1, 1, 1, 0)
        r2_65:setEffect("system", "Name01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, r8_65, 0, 300 * r6_65, 0, 0)
        r2_65:startEffect("system", "Name01", "WndDisp", 0)
      end
    end
    g_namedisp = r3_65
  end
  g_MenuMsgWin.openEffSubKey = {}
  g_MenuMsgWin.openMessageWindow = function(r0_66, r1_66)
    -- line: [2918, 2996] id: 66
    local r2_66 = nil
    if g_windowID >= 0 then
      r2_66 = g_windowID
    elseif g_messageWindowType == 1 then
      r2_66 = 1 or 0
    else
      goto label_12	-- block#4 is visited secondly
    end
    local r3_66 = cclass.lua_Layers:create()
    r3_66:cancelEffect("system", "Msg01", "WndDisp")
    r3_66:cancelEffect("system", "Txt01", "WndDisp")
    local r4_66 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP)
    local r5_66 = 1
    if r4_66 or r1_66 then
      r5_66 = LUA_SKIPSPEED_NONE
    end
    r0_66:setButtonActive()
    local r6_66 = 200 * r5_66
    r3_66:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_66:setEffect("system", "Msg01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r6_66, 0, 0)
    r3_66:startEffect("system", "Msg01", "WndDisp", 0)
    r3_66:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_66:setEffect("system", "Txt01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r6_66, 0, 0)
    if r2_66 == 2 then
      r3_66:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPosN.x, g_MSWTxtPosN.y, 0, 0)
    else
      r3_66:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPos.x, g_MSWTxtPos.y, 0, 0)
    end
    r3_66:startEffect("system", "Txt01", "WndDisp", 0)
    local r7_66 = r6_66
    r0_66.openEffSubKey = {}
    local r8_66 = 1
    for r13_66, r14_66 in pairs({
      "CONFIG",
      "SKIP",
      "AUTO",
      "REPEAT",
      "BACKLOG",
      "QSAVE",
      "QLOAD",
      "SAVE",
      "LOAD",
      "RtpC"
    }) do
      local r15_66 = r0_66.MenuButtonData[r14_66]
      if r15_66 ~= nil then
        r15_66 = r0_66.MenuButtonData[r14_66].SubLayer.def.no
        r3_66:setSubLayerEffect("system", "Msg01", "WndDisp", r15_66, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 200 * r5_66, 0, r7_66 * r5_66)
        r3_66:setSubLayerEffect("system", "Msg01", "WndDisp", r15_66, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 100 * r5_66, 0, 0)
        r3_66:startSubLayerEffect("system", "Msg01", "WndDisp", r15_66, 0)
        r0_66.openEffSubKey[r8_66] = r15_66
        r8_66 = r8_66 + 1
        r15_66 = r0_66.MenuButtonData[r14_66].SubLayer.dis.no
        r3_66:setSubLayerEffect("system", "Msg01", "WndDisp", r15_66, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 200 * r5_66, 0, r7_66 * r5_66)
        r3_66:setSubLayerEffect("system", "Msg01", "WndDisp", r15_66, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 100 * r5_66, 0, 0)
        r3_66:startSubLayerEffect("system", "Msg01", "WndDisp", r15_66, 0)
        local r16_66 = r0_66.openEffSubKey
        r16_66[r8_66] = r15_66
        r8_66 = r8_66 + 1
      end
    end
    r0_66.MenuInf.enabled = true
    r0_66.MenuInf.effect = true
    r0_66:windowOpenTips()
  end
  g_MenuMsgWin.closeMessageWindow = function(r0_67, r1_67)
    -- line: [2999, 3051] id: 67
    local r2_67 = g_windowID
    if r2_67 == -1 then
      r2_67 = g_messageWindowType
    end
    local r3_67 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP)
    local r4_67 = 1
    if r3_67 or r1_67 then
      r4_67 = LUA_SKIPSPEED_NONE
    end
    local r5_67 = cclass.lua_Layers:create()
    r5_67:cancelEffect("system", "Msg01", "WndDisp")
    r5_67:cancelEffect("system", "Txt01", "WndDisp")
    r0_67:nameWindowVisible(false)
    r0_67:setButtonActive()
    local r6_67 = 200 * r4_67
    r5_67:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r5_67:setEffect("system", "Msg01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r6_67, 0, 0)
    r5_67:startEffect("system", "Msg01", "WndDisp", 0)
    r5_67:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 1)
    if r2_67 == 2 then
      r5_67:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPosN.x, g_MSWTxtPosN.y, 0, 0)
    else
      r5_67:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPos.x, g_MSWTxtPos.y, 0, 0)
    end
    r5_67:setEffect("system", "Txt01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r6_67, 0, 0)
    r5_67:startEffect("system", "Txt01", "WndDisp", 0)
    r0_67.openEffSubKey = {}
    r0_67.MenuInf.enabled = false
    r0_67.MenuInf.effect = true
    r0_67:windowCloseTips()
  end
  g_MenuMsgWin.hideMessageWindow = function(r0_68, r1_68)
    -- line: [3055, 3117] id: 68
    local r2_68 = cclass.lua_Layers:create()
    if r2_68:isEffect("system", "Msg01") == true then
      return false
    end
    if g_DisableGestureFlag == true then
      return false
    end
    local r4_68 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE)
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false and r1_68 == 1 then
      return false
    end
    if r1_68 == 0 and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
    end
    local r6_68 = 0
    if r1_68 == 0 then
      r6_68 = 1
      local r7_68 = cclass.lua_Sounds:new()
      r7_68:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.ok), g_SysSEName.ok, getSoundVolume("systemse"))
      r7_68:delete()
      g_refreshCursor = true
    end
    r2_68:setVisible("system", "Msg01", r6_68)
    r2_68:setVisible("system", "Txt01", r6_68)
    r2_68:setVisible("system", "Clk01", r6_68)
    if g_namedisp == 1 then
      r2_68:setVisible("system", "Name01", r6_68)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) then
      r2_68:setVisible("system", "Skip01", r6_68)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGAUTO) then
      r2_68:setVisible("system", "Auto01", r6_68)
    end
    r0_68:hideSelect(r1_68)
    r0_68:hideTips(r1_68)
    return true
  end
  g_MenuMsgWin.startClickWaitAnimation = function(r0_69)
    -- line: [3121, 3152] id: 69
    -- notice: unreachable block#4
    local r1_69 = cclass.lua_Layers:create()
    if g_windowID == 2 then
      local r2_69 = 0
      local r3_69 = 0
      r2_69, r3_69 = r1_69:getLastTextPos("system", "Txt01", r2_69, r3_69)
      r1_69:setParam("system", "Clk01", LUA_PARAM_POS, r2_69, r3_69 - 45, 0, 0)
    else
      r1_69:setParam("system", "Clk01", LUA_PARAM_POS, r0_69.ClikPos.x, r0_69.ClikPos.y, 0, 0)
    end
    r1_69:setVisible("system", "Clk01", 1)
    r1_69:startAnimation("system", "Clk01", "CL_Wait", 800, -1, 0)
  end
  g_MenuMsgWin.stopClickWaitAnimation = function(r0_70)
    -- line: [3155, 3175] id: 70
    -- notice: unreachable block#1
    local r1_70 = cclass.lua_Layers:create()
    r1_70:setVisible("system", "Clk01", 0)
    r1_70:stopAnimation("system", "Clk01", "CL_Wait")
  end
  g_MenuMsgWin.changeMessageWindowOpacity = function(r0_71)
    -- line: [3178, 3251] id: 71
    local r1_71 = cclass.lua_Layers:create()
    local r2_71 = g_messagealpha / 100
    local r3_71 = g_namedisp
    if r3_71 == 1 then
      r3_71 = true or false
    else
      goto label_12	-- block#2 is visited secondly
    end
    r0_71:nameWindowVisible(r3_71)
    local r4_71 = g_windowID
    if r4_71 == -1 then
      r4_71 = g_messageWindowType
    end
    if r4_71 == 0 then
      if r0_71.MswLay.win1 ~= -1 then
        r1_71:setSubLayerVisible("system", "Msg01", r0_71.MswLay.win1, 1)
      end
      if r0_71.MswLay.back1 ~= -1 then
        r1_71:setSubLayerVisible("system", "Msg01", r0_71.MswLay.back1, 1)
        r1_71:setSubLayerParam("system", "Msg01", r0_71.MswLay.back1, LUA_PARAM_COLOR, 1, 1, 1, r2_71)
      end
      if r0_71.MswLay.win2 ~= -1 then
        r1_71:setSubLayerVisible("system", "Msg01", r0_71.MswLay.win2, 0)
      end
      if r0_71.MswLay.back2 ~= -1 then
        r1_71:setSubLayerVisible("system", "Msg01", r0_71.MswLay.back2, 0)
      end
      if r0_71.MswLay.nameback1 ~= -1 then
        r1_71:setSubLayerParam("system", "Msg01", r0_71.MswLay.nameback1, LUA_PARAM_COLOR, 1, 1, 1, r2_71)
      end
    else
      if r0_71.MswLay.win2 ~= -1 then
        r1_71:setSubLayerVisible("system", "Msg01", r0_71.MswLay.win2, 1)
      end
      if r0_71.MswLay.back2 ~= -1 then
        r1_71:setSubLayerVisible("system", "Msg01", r0_71.MswLay.back2, 1)
        r1_71:setSubLayerParam("system", "Msg01", r0_71.MswLay.back2, LUA_PARAM_COLOR, 1, 1, 1, r2_71)
      end
      if r0_71.MswLay.win1 ~= -1 then
        r1_71:setSubLayerVisible("system", "Msg01", r0_71.MswLay.win1, 0)
      end
      if r0_71.MswLay.back1 ~= -1 then
        r1_71:setSubLayerVisible("system", "Msg01", r0_71.MswLay.back1, 0)
      end
      if r0_71.MswLay.nameback2 ~= -1 then
        r1_71:setSubLayerParam("system", "Msg01", r0_71.MswLay.nameback2, LUA_PARAM_COLOR, 1, 1, 1, r2_71)
      end
    end
    if r1_71:isVisible("system", "Auto01") == true then
    end
    if r1_71:isVisible("system", "Skip01") == true then
    end
    if nil and not nil then
      goto label_180	-- block#29 is visited secondly
    end
  end
  g_MenuMsgWin.onResetMessageWindow = function(r0_72)
    -- line: [3254, 3298] id: 72
    local r1_72 = g_windowID
    if r1_72 == -1 then
      r1_72 = g_messageWindowType
    end
    local r2_72 = cclass.lua_Layers:create()
    r0_72:stopClickWaitAnimation()
    if r0_72.MenuInf.effect == true then
      r2_72:cancelEffect("system", "Msg01", "WndDisp")
      r2_72:cancelEffect("system", "Txt01", "WndDisp")
      r2_72:cancelEffect("system", "Name01", "WndDisp")
      r2_72:cancelEffect("system", "Clk01", "WndDisp")
      r0_72.openEffSubKey = {}
      r0_72.MenuInf.effect = false
    end
    r0_72:nameWindowVisible(false)
    r2_72:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r2_72:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    if r1_72 == 2 then
      r2_72:setParam("system", "Msg01", LUA_PARAM_POS, r0_72.MswPosN.x, r0_72.MswPosN.y, 0, 0)
      r2_72:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPosN.x, g_MSWTxtPosN.y, 0, 0)
    else
      r2_72:setParam("system", "Msg01", LUA_PARAM_POS, r0_72.MswPos.x, r0_72.MswPos.y, 0, 0)
      r2_72:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPos.x, g_MSWTxtPos.y, 0, 0)
    end
    for r7_72, r8_72 in pairs({
      "CONFIG",
      "SKIP",
      "AUTO",
      "REPEAT",
      "BACKLOG",
      "QSAVE",
      "QLOAD",
      "SAVE",
      "LOAD",
      "RtpC"
    }) do
      local r9_72 = r0_72.MenuButtonData[r8_72]
      if r9_72 ~= nil then
        r0_72.MenuButtonData[r8_72]:bt_StopAnim()
      end
    end
    resetSkipIcon()
  end
  g_MenuMsgWin.ReleaseMessageWindow = function(r0_73)
    -- line: [3301, 3304] id: 73
    r0_73:onResetMessageWindow()
    r0_73:onResetSelect()
  end
  g_MenuMsgWin.SkipPos = {
    x = 34,
    y = 644,
    move = 0,
  }
  g_MenuMsgWin.AutoPos = {
    x = 34,
    y = 560,
    move = 0,
  }
  g_MenuMsgWin.ClikPos = {
    x = 1007,
    y = 658,
    move = 162,
  }
  g_MenuMsgWin.resetSkipIcon = function(r0_74)
    -- line: [3310, 3324] id: 74
    r0_74.buttonEffect.skip = false
    local r1_74 = cclass.lua_Layers:create()
    r1_74:setVisible("system", "Skip01", 0)
    if r0_74.buttonEffect.effect_skip == true then
      r0_74.buttonEffect.effect_skip = false
      r1_74:cancelEffect("system", "Skip01", "SkipDisp")
      r1_74:cancelSubLayerEffect("system", "Skip01", 1, "SkipEffect")
      r1_74:setSubLayerParam("system", "Skip01", 1, LUA_PARAM_SCALE, 1, 1, 1, 0)
    end
    return true
  end
  g_MenuMsgWin.resetAutoIcon = function(r0_75)
    -- line: [3325, 3339] id: 75
    r0_75.buttonEffect.auto = false
    local r1_75 = cclass.lua_Layers:create()
    r1_75:setVisible("system", "Auto01", 0)
    if r0_75.buttonEffect.effect_auto == true then
      r0_75.buttonEffect.effect_auto = false
      r1_75:cancelEffect("system", "Auto01", "AutoDisp")
      r1_75:cancelSubLayerEffect("system", "Auto01", 1, "AutoEffect")
      r1_75:setSubLayerParam("system", "Auto01", 1, LUA_PARAM_SCALE, 1, 1, 1, 0)
    end
    return true
  end
  g_MenuMsgWin.LoadSkipAutoIcon = function(r0_76)
    -- line: [3343, 3386] id: 76
    local r1_76 = cclass.lua_Layers:create()
    r1_76:removeLayer("system", "Skip01")
    r1_76:removeLayer("system", "Auto01")
    local r2_76 = getUItype()
    local r3_76 = "Sys_Skip.pna"
    if r2_76 == 1 then
      r3_76 = "Sys_c_Skip.pna"
    end
    r0_76:MenuLoadLayer("Skip01", r3_76)
    r1_76:setVisible("system", "Skip01", 0)
    r1_76:setParam("system", "Skip01", LUA_PARAM_POS, r0_76.SkipPos.x, r0_76.SkipPos.y, 0, 0)
    for r8_76, r9_76 in pairs({
      1,
      2,
      3,
      4
    }) do
      r1_76:initSubLayer("system", "Skip01", r9_76, 0)
    end
    r3_76 = "Sys_Auto.pna"
    if r2_76 == 1 then
      r3_76 = "Sys_c_Auto.pna"
    end
    r0_76:MenuLoadLayer("Auto01", r3_76)
    r1_76:setVisible("system", "Auto01", 0)
    r1_76:setParam("system", "Auto01", LUA_PARAM_POS, r0_76.AutoPos.x, r0_76.AutoPos.y, 0, 0)
    for r9_76, r10_76 in pairs({
      1,
      2
    }) do
      r1_76:initSubLayer("system", "Auto01", r10_76, 0)
    end
    if g_messageWindowType == 1 then
      r1_76:setSubLayerParam("system", "Skip01", 4, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_76:setSubLayerParam("system", "Auto01", 2, LUA_PARAM_COLOR, 1, 1, 1, 0)
    else
      r1_76:setSubLayerParam("system", "Skip01", 4, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_76:setSubLayerParam("system", "Auto01", 2, LUA_PARAM_COLOR, 1, 1, 1, 1)
    end
  end
  g_MenuMsgWin.SetSkipAutoState = function(r0_77)
    -- line: [3390, 3578] id: 77
    local r1_77 = 10
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) ~= false or not 1 then
      local r3_77 = LUA_SKIPSPEED_NONE
    end
    local r4_77 = cclass.lua_Layers:create()
    if g_drawSkipIcon == false then
      if r4_77:isVisible("system", "Skip01") == true and r0_77.buttonEffect.effect_skip == false then
        r4_77:cancelEffect("system", "Skip01", "SkipDisp")
        r4_77:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_77:setParam("system", "Skip01", LUA_PARAM_POS, r0_77.SkipPos.x, r0_77.SkipPos.y, 0, 0)
        r4_77:setParam("system", "Skip01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_77:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_77, 0, 0)
        r4_77:startEffect("system", "Skip01", "SkipDisp", 0)
        r0_77.buttonEffect.skip = false
        r0_77.buttonEffect.effect_skip = true
      end
      if r4_77:isVisible("system", "Auto01") == true and r0_77.buttonEffect.effect_auto == false then
        r4_77:cancelEffect("system", "Auto01", "AutoDisp")
        r4_77:setParam("system", "Auto01", LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_77:setParam("system", "Auto01", LUA_PARAM_POS, r0_77.AutoPos.x, r0_77.AutoPos.y, 0, 0)
        r4_77:setParam("system", "Auto01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_77:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_77, 0, 0)
        r4_77:startEffect("system", "Auto01", "AutoDisp", 0)
        r0_77.buttonEffect.auto = false
        r0_77.buttonEffect.effect_auto = true
      end
      return 
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) and r0_77.MenuInf.enabled == true then
      if g_allskip == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) then
        r4_77:setSubLayerVisible("system", "Skip01", 2, 1)
        r4_77:setSubLayerVisible("system", "Skip01", 3, 0)
      else
        r4_77:setSubLayerVisible("system", "Skip01", 2, 0)
        r4_77:setSubLayerVisible("system", "Skip01", 3, 1)
      end
      if g_selectReleaseSkip then
      end
      r4_77:setSubLayerVisible("system", "Skip01", 4, 1)
      r4_77:setSubLayerVisible("system", "Skip01", 1, 1)
      if r4_77:isVisible("system", "Skip01") == false then
        r4_77:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_77:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r1_77, 0, 0)
        r4_77:setParam("system", "Skip01", LUA_PARAM_POS, r0_77.SkipPos.x, r0_77.SkipPos.y, 0, 0)
        r4_77:setVisible("system", "Skip01", 1)
        r4_77:setParam("system", "Skip01", LUA_PARAM_ROTATE, 0, 90, 0, 0)
        r4_77:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r1_77, 0, 0)
        r4_77:startEffect("system", "Skip01", "SkipDisp", 0)
        r4_77:cancelSubLayerEffect("system", "Skip01", 1, "SkipEffect")
        r4_77:setSubLayerParam("system", "Skip01", 1, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r4_77:setSubLayerEffect("system", "Skip01", "SkipEffect", 1, LUA_EFFECT_SCALE, 0.5, 0.5, 0, 0, 0, 200, 0, 0)
        r4_77:setSubLayerEffect("system", "Skip01", "SkipEffect", 1, LUA_EFFECT_SCALE, -0.5, -0.5, 0, 0, 0, 100, 0, 200)
        r4_77:startSubLayerEffect("system", "Skip01", "SkipEffect", 1, -1)
        r0_77.buttonEffect.skip = true
        r0_77.buttonEffect.effect_skip = true
      end
    elseif r4_77:isVisible("system", "Skip01") == true and r0_77.buttonEffect.effect_skip == false then
      r4_77:cancelEffect("system", "Skip01", "SkipDisp")
      r4_77:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_77:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r1_77, 0, 0)
      r4_77:setParam("system", "Skip01", LUA_PARAM_POS, r0_77.SkipPos.x, r0_77.SkipPos.y, 0, 0)
      r4_77:startEffect("system", "Skip01", "SkipDisp", 0)
      r0_77.buttonEffect.skip = false
      r0_77.buttonEffect.effect_skip = true
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGAUTO) and r0_77.MenuInf.enabled == true then
      if g_selectReleaseAuto then
      end
      r4_77:setSubLayerVisible("system", "Auto01", 2, 1)
      r4_77:setSubLayerVisible("system", "Auto01", 1, 1)
      if r4_77:isVisible("system", "Auto01") == false then
        r4_77:setVisible("system", "Auto01", 1)
        r4_77:setParam("system", "Auto01", LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_77:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r1_77, 0, 0)
        r4_77:setParam("system", "Auto01", LUA_PARAM_POS, r0_77.AutoPos.x, r0_77.AutoPos.y, 0, 0)
        r4_77:setParam("system", "Auto01", LUA_PARAM_ROTATE, 0, 90, 0, 0)
        r4_77:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r1_77, 0, 0)
        r4_77:startEffect("system", "Auto01", "AutoDisp", 0)
        r4_77:cancelSubLayerEffect("system", "Auto01", 1, "AutoEffect")
        r4_77:setSubLayerParam("system", "Auto01", 1, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r4_77:setSubLayerEffect("system", "Auto01", "AutoEffect", 1, LUA_EFFECT_SCALE, 0.5, 0.5, 0, 0, 0, 500, 0, 0)
        r4_77:setSubLayerEffect("system", "Auto01", "AutoEffect", 1, LUA_EFFECT_SCALE, -0.5, -0.5, 0, 0, 0, 250, 0, 500)
        r4_77:startSubLayerEffect("system", "Auto01", "AutoEffect", 1, -1)
        r0_77.buttonEffect.auto = true
        r0_77.buttonEffect.effect_auto = true
      end
    elseif r4_77:isVisible("system", "Auto01") == true and r0_77.buttonEffect.effect_auto == false then
      r4_77:cancelEffect("system", "Auto01", "AutoDisp")
      r4_77:setParam("system", "Auto01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_77:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r1_77, 0, 0)
      r4_77:setParam("system", "Auto01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r4_77:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_77, 0, 0)
      r4_77:startEffect("system", "Auto01", "AutoDisp", 0)
      r0_77.buttonEffect.auto = false
      r0_77.buttonEffect.effect_auto = true
    end
    r0_77:IconEffect()
  end
  g_MenuMsgWin.IconEffect = function(r0_78)
    -- line: [3581, 3602] id: 78
    local r1_78 = cclass.lua_Layers:create()
    if r0_78.buttonEffect.effect_skip == true and r1_78:isEffect("system", "SkipDisp") == false then
      if r0_78.buttonEffect.skip ~= true then
        r1_78:setVisible("system", "Skip01", 0)
      end
      r0_78.buttonEffect.effect_skip = false
    end
    if r0_78.buttonEffect.effect_auto == true and r1_78:isEffect("system", "AutoDisp") == false then
      if r0_78.buttonEffect.auto ~= true then
        r1_78:setVisible("system", "Auto01", 0)
      end
      r0_78.buttonEffect.effect_auto = false
    end
  end
  if g_MenuMsgWin:MenuInit() == false then
    return false
  end
  local r1_16 = cclass.lua_Layers:create()
  changeMessageWindow(-1, false)
  g_MenuMsgWin:LoadSkipAutoIcon()
  g_MenuMsgWin.InitGesture = function(r0_79, r1_79)
    -- line: [3642, 3718] id: 79
    -- notice: unreachable block#15
    -- notice: unreachable block#16
    -- notice: unreachable block#17
    local r2_79 = cclass.lua_Layers:create()
    if r1_79 == false then
      if g_UseArrowViewBase then
        r2_79:removeLayer("overlay", "ArrowView")
      end
      r2_79:removeLayer("overlay", "Arrow")
    end
    if g_UseArrowViewBase then
      r2_79:insertLayer("overlay", "ArrowView", LUA_LAYER_PNA, getGraphicsArcFileName("overlay", "Sys_ArrowView.pna"), "Sys_ArrowView.pna", 0)
    end
    local r3_79 = getUItype()
    local r4_79 = "Sys_Arrow.pna"
    if r3_79 == 1 then
      r4_79 = "Sys_C_Arrow.pna"
    end
    r2_79:insertLayer("overlay", "Arrow", LUA_LAYER_PNA, getGraphicsArcFileName("overlay", r4_79), r4_79, 0)
    local r6_79 = 0
    local r7_79 = 0
    local r8_79 = 0
    local r9_79 = 0
    r6_79, r7_79, r8_79, r9_79 = r2_79:getParam("overlay", "Arrow", LUA_PARAM_SIZE, 0, 0, 0, 0)
    local r10_79 = math.floor((1280 - r6_79) / 2)
    local r11_79 = math.floor((720 - r7_79) / 2) - 100
    r2_79:setParam("overlay", "Arrow", LUA_PARAM_POS, r10_79, r11_79, 0, 0)
    for r15_79 = 0, 3, 1 do
      r2_79:initSubLayer("overlay", "Arrow", r15_79, 0)
    end
    for r15_79 = 0, g_ArrowMax - 1, 1 do
      r2_79:initSubLayer("overlay", "Arrow", 19 - r15_79, 0)
    end
    if g_UseArrowViewBase then
      local r12_79 = 0
      local r13_79 = 0
      local r14_79 = 0
      local r15_79 = 0
      r12_79, r13_79, r14_79, r15_79 = r2_79:getParam("overlay", "ArrowView", LUA_PARAM_SIZE, 0, 0, 0, 0)
      local r16_79 = math.floor((1280 - r12_79) / 2)
      local r17_79 = math.floor((720 - r13_79) / 2) - 100
      r2_79:setParam("overlay", "ArrowView", LUA_PARAM_POS, r16_79, r17_79, 0, 0)
      r2_79:initSubLayer("overlay", "ArrowView", 0, 0)
      r2_79:initSubLayer("overlay", "ArrowView", 1, 0)
      r2_79:initSubLayer("overlay", "ArrowView", 2, 0)
      r2_79:initSubLayer("overlay", "ArrowView", 3, 0)
      r12_79, r13_79, r14_79, r15_79 = r2_79:getSubLayerParam("overlay", "ArrowView", 0, LUA_PARAM_POS, 0, 0, 0, 0)
      g_ArrowViewPos[1].x = r16_79 - r10_79 + r12_79
      g_ArrowViewPos[1].y = r17_79 - r11_79 + r13_79
      r12_79, r13_79, r14_79, r15_79 = r2_79:getSubLayerParam("overlay", "ArrowView", 1, LUA_PARAM_POS, 0, 0, 0, 0)
      g_ArrowViewPos[2].x = r16_79 - r10_79 + r12_79
      g_ArrowViewPos[2].y = r17_79 - r11_79 + r13_79
      r12_79, r13_79, r14_79, r15_79 = r2_79:getSubLayerParam("overlay", "ArrowView", 2, LUA_PARAM_POS, 0, 0, 0, 0)
      g_ArrowViewPos[3].x = r16_79 - r10_79 + r12_79
      g_ArrowViewPos[3].y = r17_79 - r11_79 + r13_79
      r12_79, r13_79, r14_79, r15_79 = r2_79:getSubLayerParam("overlay", "ArrowView", 3, LUA_PARAM_POS, 0, 0, 0, 0)
      g_ArrowViewPos[4].x = r16_79 - r10_79 + r12_79
      g_ArrowViewPos[4].y = r17_79 - r11_79 + r13_79
      r2_79:initSubLayer("overlay", "ArrowView", 4, 1)
    end
  end
  r1_16:add("overlay")
  r1_16:setOverlaySet("overlay")
  g_MenuMsgWin:InitGesture(true)
  return true
end
g_ArrowViewPos = {
  {
    x = 0,
    y = -100,
  },
  {
    x = 100,
    y = 0,
  },
  {
    x = 0,
    y = 100,
  },
  {
    x = -100,
    y = 0,
  }
}
checkOverlayFunction = function(r0_80)
  -- line: [3809, 3950] id: 80
  if r0_80 == 0 then
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
  elseif r0_80 == 1 then
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) == false and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
      return false
    end
    return true
  elseif r0_80 ~= 10 and r0_80 ~= 11 then
    if r0_80 == 12 then
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
      if (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) == true) and g_MenuMsgWin ~= nil and g_MenuMsgWin.MenuInf.select_effect == false then
        return false
      end
      if r0_80 == 3 then
        return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOG)
      elseif r0_80 == 6 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLEQLOAD) == false) then
        return false
      elseif r0_80 == 5 then
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
          return false
        end
      elseif r0_80 == 4 then
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
          return false
        end
      elseif r0_80 == 8 then
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
          return false
        end
      elseif r0_80 == 7 then
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
          return false
        end
      elseif r0_80 == 13 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLESELECTLOAD) == false) then
        return false
      end
    end
  end
  return true
end
getLongPressTime = function()
  -- line: [3955, 3957] id: 81
  return 300
end
updateOverlay = function(r0_82, r1_82, r2_82)
  -- line: [3960, 4132] id: 82
  -- notice: unreachable block#36
  -- notice: unreachable block#33
  -- notice: unreachable block#35
  -- notice: unreachable block#45
  -- notice: unreachable block#48
  -- notice: unreachable block#65
  -- notice: unreachable block#67
  -- notice: unreachable block#30
  -- notice: unreachable block#34
  -- notice: unreachable block#68
  -- notice: unreachable block#42
  -- notice: unreachable block#31
  -- notice: unreachable block#40
  -- notice: unreachable block#64
  -- notice: unreachable block#44
  -- notice: unreachable block#37
  -- notice: unreachable block#41
  -- notice: unreachable block#66
  -- notice: unreachable block#46
  -- notice: unreachable block#47
  -- notice: unreachable block#69
  -- notice: unreachable block#38
  -- notice: unreachable block#32
  -- notice: unreachable block#39
  -- notice: unreachable block#43
  if getSystemSet() ~= "system" then
    r1_82 = false
  end
  local r4_82 = cclass.lua_Layers:create()
  if r1_82 == false then
    if getLongPressTime() < r2_82 then
      for r8_82 = 0, g_ArrowMax - 1, 1 do
        local r9_82 = false
        local r10_82 = 19 - r8_82
        local r11_82 = checkOverlayFunction(r8_82)
        for r15_82 = 1, 4, 1 do
          if r8_82 == g_gestureFunc[r15_82] then
            if r15_82 == 1 then
              r4_82:setSubLayerParam("overlay", "Arrow", r10_82, LUA_PARAM_POS, g_ArrowViewPos[1].x, g_ArrowViewPos[1].y, 0, 0)
              r4_82:setSubLayerParam("overlay", "Arrow", r15_82 - 1, LUA_PARAM_POS, g_ArrowViewPos[r15_82].x, g_ArrowViewPos[r15_82].y, 0, 0)
              if r11_82 then
                r4_82:setSubLayerVisible("overlay", "Arrow", r15_82 - 1, 0)
              else
                r4_82:setSubLayerVisible("overlay", "Arrow", r15_82 - 1, 1)
              end
            elseif r15_82 == 2 then
              r4_82:setSubLayerParam("overlay", "Arrow", r10_82, LUA_PARAM_POS, g_ArrowViewPos[2].x, g_ArrowViewPos[2].y, 0, 0)
              r4_82:setSubLayerParam("overlay", "Arrow", r15_82 - 1, LUA_PARAM_POS, g_ArrowViewPos[r15_82].x, g_ArrowViewPos[r15_82].y, 0, 0)
              if r11_82 then
                r4_82:setSubLayerVisible("overlay", "Arrow", r15_82 - 1, 0)
              else
                r4_82:setSubLayerVisible("overlay", "Arrow", r15_82 - 1, 1)
              end
            elseif r15_82 == 3 then
              r4_82:setSubLayerParam("overlay", "Arrow", r10_82, LUA_PARAM_POS, g_ArrowViewPos[3].x, g_ArrowViewPos[3].y, 0, 0)
              r4_82:setSubLayerParam("overlay", "Arrow", r15_82 - 1, LUA_PARAM_POS, g_ArrowViewPos[r15_82].x, g_ArrowViewPos[r15_82].y, 0, 0)
              if r11_82 then
                r4_82:setSubLayerVisible("overlay", "Arrow", r15_82 - 1, 0)
              else
                r4_82:setSubLayerVisible("overlay", "Arrow", r15_82 - 1, 1)
              end
            elseif r15_82 == 4 then
              r4_82:setSubLayerParam("overlay", "Arrow", r10_82, LUA_PARAM_POS, g_ArrowViewPos[4].x, g_ArrowViewPos[4].y, 0, 0)
              r4_82:setSubLayerParam("overlay", "Arrow", r15_82 - 1, LUA_PARAM_POS, g_ArrowViewPos[r15_82].x, g_ArrowViewPos[r15_82].y, 0, 0)
              if r11_82 then
                r4_82:setSubLayerVisible("overlay", "Arrow", r15_82 - 1, 0)
              else
                r4_82:setSubLayerVisible("overlay", "Arrow", r15_82 - 1, 1)
              end
            end
            r9_82 = true
            break
          end
        end
        if r9_82 then
          r4_82:setSubLayerVisible("overlay", "Arrow", r10_82, 1)
        else
          r4_82:setSubLayerVisible("overlay", "Arrow", r10_82, 0)
        end
      end
      r4_82:setVisible("overlay", "Arrow", 1)
      if g_UseArrowViewBase then
        r4_82:setVisible("overlay", "ArrowView", 1)
      end
    else
      r4_82:setVisible("overlay", "Arrow", 0)
      g_OverlayArrowDisp = false
      if g_UseArrowViewBase then
        r4_82:setVisible("overlay", "ArrowView", 0)
      end
    end
  else
    r4_82:setVisible("overlay", "Arrow", 1)
    if g_UseArrowViewBase then
      r4_82:setVisible("overlay", "ArrowView", 0)
    end
    g_OverlayArrowDisp = true
    for r8_82 = 0, g_ArrowMax - 1, 1 do
      r4_82:setSubLayerVisible("overlay", "Arrow", 19 - r8_82, 0)
      r4_82:setSubLayerParam("overlay", "Arrow", 19 - r8_82, LUA_PARAM_POS, 0, 0, 0, 0)
    end
    for r8_82 = 0, 3, 1 do
      r4_82:setSubLayerVisible("overlay", "Arrow", r8_82, 0)
      r4_82:setSubLayerParam("overlay", "Arrow", r8_82, LUA_PARAM_POS, 0, 0, 0, 0)
    end
    local r5_82 = g_gestureFunc[r0_82 + 1]
    if checkOverlayFunction(r5_82) == false then
      r4_82:setSubLayerVisible("overlay", "Arrow", 0, 1)
    end
    r4_82:setSubLayerVisible("overlay", "Arrow", 19 - r5_82, 1)
  end
end
getSystemSet = function()
  -- line: [4140, 4157] id: 83
  if g_confirmDialog > 0 then
    return "dialog"
  elseif g_cmdLineInfo.enabled == true or g_cmdLineInfo.effect == true then
    return "cmdLine"
  end
  for r3_83, r4_83 in pairs(g_Menu) do
    if r4_83.ptr ~= nil and r4_83.ptr:GetMenuActive() == true then
      return r4_83.ptr.MenuInf.SetName
    end
  end
  return "system"
end
getMessageWindowKey = function(r0_84)
  -- line: [4160, 4163] id: 84
  return "system", "Txt01"
end
getNameWindowKey = function(r0_85)
  -- line: [4165, 4171] id: 85
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin.MenuInf.nameWindow = 1
  end
  return "system", "Name01"
end
getMessageWindowState = function()
  -- line: [4173, 4178] id: 86
  if g_MenuMsgWin ~= nil and g_MenuMsgWin.MenuInf.nameWindow == 1 then
    return g_namedisp, g_MenuMsgWin.MenuInf.nameWindow, g_MenuMsgWin.MenuInf.msgWindow, "system", "Name01"
  end
end
setMessageWindowState = function(r0_87, r1_87)
  -- line: [4180, 4186] id: 87
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin.MenuInf.nameWindow = r0_87
    g_MenuMsgWin.MenuInf.msgWindow = r1_87
  end
end
nameWindowVisible = function(r0_88)
  -- line: [4189, 4195] id: 88
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:nameWindowVisible(r0_88)
  end
end
openMessageWindowWoEffect = function()
  -- line: [4198, 4216] id: 89
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin.MenuButton:InitList()
    g_MenuMsgWin:MakeWindowBut(g_windowID)
    g_MenuMsgWin.MenuButton:SetList("MenuButtonData", g_MenuMsgWin.MenuButtonData)
    g_MenuMsgWin.MenuButton:InitButton()
    if g_MenuMsgWin.SelectButtonData ~= nil then
      g_MenuMsgWin.MenuButton:SetList("SelectButtonData", g_MenuMsgWin.SelectButtonData)
    end
    if g_MenuMsgWin.TipsButton ~= nil then
      g_MenuMsgWin.MenuButton:SetList("TipsButton", g_MenuMsgWin.TipsButton)
    end
  end
  setButtonState()
end
openMessageWindow = function(r0_90)
  -- line: [4218, 4223] id: 90
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:openMessageWindow(r0_90)
  end
end
closeMessageWindow = function(r0_91)
  -- line: [4225, 4230] id: 91
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:closeMessageWindow(r0_91)
  end
end
resetMessageWindow = function(r0_92)
  -- line: [4232, 4236] id: 92
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:resetMessageWindow(r0_92)
  end
end
isMessageWindowEffect = function()
  -- line: [4238, 4249] id: 93
  if g_MenuMsgWin ~= nil then
    local r0_93 = g_MenuMsgWin:MenuEffect()
    if nil and not nil then
      goto label_8	-- block#2 is visited secondly
    end
    return r0_93
  end
  return false
end
hideMessageWindow = function(r0_94)
  -- line: [4252, 4258] id: 94
  if g_MenuMsgWin ~= nil then
    return g_MenuMsgWin:hideMessageWindow(r0_94)
  end
  return true
end
startClickWaitAnimation = function()
  -- line: [4260, 4265] id: 95
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:startClickWaitAnimation()
  end
end
stopClickWaitAnimation = function()
  -- line: [4267, 4273] id: 96
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:stopClickWaitAnimation()
    g_MenuMsgWin:TipsNextCount()
  end
end
getDefaultFont = function()
  -- line: [4275, 4293] id: 97
  local r0_97 = getGameEngineVersion()
  if getUItype() == 2 then
    return g_fonts2.name
  elseif getLangPatchFlag() then
    if getAltLanguage() then
      return g_fonts1.name
    else
      return g_fonts0.name
    end
  else
    return g_fonts0.name
  end
end
getAltLanguage = function()
  -- line: [4295, 4297] id: 98
  return g_altLanguage
end
LoadGameFont = function()
  -- line: [4300, 4322] id: 99
  local r0_99 = cclass.CLegacyFontInfo:create()
  local r1_99 = getGameEngineVersion()
  local r2_99 = getUItype()
  if r1_99 >= 1.4 then
    if g_fonts0.file ~= nil and g_fonts0.name ~= nil then
      local r3_99 = r0_99:extention("Fonts.arc", g_fonts0.file, g_fonts0.name, g_fonts0.CharSet)
    end
    if getLangPatchFlag() and g_fonts1.file ~= nil and g_fonts1.name ~= nil then
      local r3_99 = r0_99:extention("Fonts.arc", g_fonts1.file, g_fonts1.name, g_fonts1.CharSet)
    end
  end
  -- warn: not visited block [4]
  -- block#4:
  -- r3_99 = r0_99:extention("Fonts.arc", _u0.g_fonts2.file, _u0.g_fonts2.name, _u0.g_fonts2.CharSet)
  -- goto label_68
end
initFontInformation = function()
  -- line: [4324, 4355] id: 100
  local r0_100 = cclass.CLegacyFontInfo:create()
  r0_100:remove("system", "Name01")
  r0_100:remove("system", "Txt01")
  r0_100:remove("messageLog", "LogText01")
  r0_100:remove("dialog", "inputLine")
  r0_100:remove("cmdLine", "inputLine")
  local r1_100 = getDefaultFont()
  local r2_100 = g_fontSize0
  if getUItype() == 2 then
    r2_100 = g_fontSize2
  else
    r2_100 = g_fontSize0
    if getLangPatchFlag() and getAltLanguage() then
      r2_100 = g_fontSize1
    end
  end
  r0_100:add("system", "Name01", r1_100, r2_100.NameSize, 1, 0, g_name1Color.normal, g_name1Color.normalEdge, 1, 1)
  r0_100:add("system", "Txt01", r1_100, r2_100.MsgSize, 1, 0, g_message1Color.normal, g_message1Color.normalEdge, r2_100.msw_Y, r2_100.msw_R)
  r0_100:add("messageLog", "LogText01", r1_100, r2_100.LogSize, 1, 0, g_logTextColor.normal, g_logTextColor.normalEdge, 1, 1)
  r0_100:add("cmdLine", "inputLine", r1_100, r2_100.inputSize, 1, 0, g_message1Color.normal, g_message1Color.normalEdge, 1, 1)
end
getAllSkip = function()
  -- line: [4358, 4361] id: 101
  return g_allskip
end
getSelectReleaseSkip = function()
  -- line: [4364, 4367] id: 102
  return g_selectReleaseSkip
end
getSelectReleaseAuto = function()
  -- line: [4370, 4373] id: 103
  return g_selectReleaseAuto
end
getEffectSpeed = function()
  -- line: [4376, 4379] id: 104
  return g_effectSpeed
end
getUseBGMCut = function()
  -- line: [4382, 4385] id: 105
  return g_bgmCutPer
end
getEffectRate = function()
  -- line: [4388, 4397] id: 106
  local r0_106 = 1
  local r1_106 = getEffectSpeed()
  if r1_106 == 2 then
    r0_106 = LUA_SKIPSPEED_NONE
  elseif r1_106 == 1 then
    r0_106 = LUA_SKIPSPEED_OMIT
  end
  return r0_106
end
getSoundIndex = function(r0_107)
  -- line: [4400, 4411] id: 107
  for r4_107, r5_107 in pairs(g_volume) do
    local r6_107 = nil
    local r7_107 = nil
    r6_107, r7_107 = string.find(string.lower(r0_107), string.lower(r5_107.name))
    if r6_107 == 1 then
      return r4_107
    end
  end
  return 0
end
checkOtherVoice = function(r0_108)
  -- line: [4413, 4431] id: 108
  for r4_108 = 1, #g_charKeysOtherM, 1 do
    local r5_108 = nil
    local r6_108 = nil
    r5_108, r6_108 = string.find(string.lower(r0_108), string.lower(g_charKeysOtherM[r4_108]))
    if r5_108 ~= nil then
      return 1
    end
  end
  for r4_108 = 1, #g_charKeysOtherF, 1 do
    local r5_108 = nil
    local r6_108 = nil
    r5_108, r6_108 = string.find(string.lower(r0_108), string.lower(g_charKeysOtherF[r4_108]))
    if r5_108 ~= nil then
      return 2
    end
  end
  return 0
end
checkBgvKey = function(r0_109)
  -- line: [4434, 4439] id: 109
  return g_BgvKeyToVolkey[r0_109]
end
getSoundVolume = function(r0_110)
  -- line: [4442, 4522] id: 110
  local r1_110 = checkOtherVoice(r0_110)
  if r1_110 == 1 then
    r0_110 = "charOtherM"
  elseif r1_110 == 2 then
    r0_110 = "charOtherF"
  end
  if r0_110 == "ConfTestVoice" then
    return g_ConfigVoiceVolume
  end
  if r0_110 == "charTestVoice" then
    return g_ConfigVoiceVolume
  end
  if r0_110 == "ConfTestSE" then
    return g_ConfigSeVolume
  end
  local r2_110 = checkBgvKey(r0_110)
  local r3_110 = getBGVAllKey()
  local r4_110 = 1
  if r2_110 ~= nil then
    r0_110 = r2_110
    for r8_110, r9_110 in pairs(g_volume) do
      if r9_110.name == r3_110 then
        r4_110 = r9_110.vol / 1000
        break
      end
    end
  end
  local r5_110 = false
  local r6_110 = 0
  if r0_110 == "systemse" then
    r0_110 = "se"
  end
  if r0_110 == "systemVoice" then
    r0_110 = "char"
  end
  for r10_110, r11_110 in pairs(g_volume) do
    local r12_110 = nil
    local r13_110 = nil
    r12_110, r13_110 = string.find(string.lower(r0_110), string.lower(r11_110.name))
    if r12_110 ~= nil and r12_110 == 1 then
      local r14_110 = math.floor(r11_110.vol * r4_110)
      if r11_110.mute == true then
        r14_110 = 0
      end
      if r11_110.name == getVoiceAllKey() then
        r5_110 = true
        r6_110 = r14_110
      else
        return r14_110
      end
    end
  end
  if r5_110 == true then
    return r6_110
  end
  return 0
end
getMessageSpeed = function()
  -- line: [4525, 4531] id: 111
  return math.floor(350 - 350 * g_msgspeed / 100)
end
getAutoWaitTime = function()
  -- line: [4534, 4538] id: 112
  return g_autospeed * 2
end
getVoiceAllKey = function()
  -- line: [4543, 4546] id: 113
  return "char"
end
getBGVAllKey = function()
  -- line: [4549, 4552] id: 114
  return "bgv"
end
getBGMAllKey = function()
  -- line: [4555, 4558] id: 115
  return "bgm"
end
getBGVCharKey = function(r0_116)
  -- line: [4561, 4573] id: 116
  key = checkBgvKey(r0_116)
  if key == nil then
    return getBGVAllKey()
  end
  return key
end
getMouseAutoMove = function()
  -- line: [4576, 4579] id: 117
  return g_mouseAutoMove
end
getHideCursor = function()
  -- line: [4582, 4592] id: 118
  local r0_118 = 0
  if g_hideCursorOn == true then
    r0_118 = g_hideCursor
  else
    r0_118 = 2
  end
  return r0_118
end
getClickVoice = function()
  -- line: [4595, 4598] id: 119
  return g_clickVoice
end
getEnablePan = function()
  -- line: [4601, 4604] id: 120
  return g_enablePan
end
getBGVVoiceMute = function()
  -- line: [4607, 4612] id: 121
  return g_bgvVoiceMute
end
getDeactiveMode = function()
  -- line: [4615, 4618] id: 122
  return g_deactiveMode
end
isGesture = function(r0_123)
  -- line: [4621, 4649] id: 123
  if g_gestureDisable then
    return false
  end
  if g_DisableGestureFlag == true then
    return false
  end
  local r1_123 = cclass.lua_AutoCursor:new()
  local r2_123 = r1_123:IsMove()
  r1_123:delete()
  if r2_123 then
    return false
  end
  if r0_123 == "system" then
    return true
  end
  return false
end
onGesture = function(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124)
  -- line: [4652, 4710] id: 124
  if r0_124 == "system" then
    if not g_OverlayArrowDisp then
      return 
    end
    local r6_124 = g_gestureFunc[r2_124 + 1]
    if checkOverlayFunction(r6_124) == false then
      return 
    end
    if r6_124 == 0 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
    elseif r6_124 == 1 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGCTRLSKIP)
    elseif r6_124 == 2 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGAUTO)
    elseif r6_124 == 3 then
      openMessageLog()
    elseif r6_124 == 4 then
      openConfig(0, false)
    elseif r6_124 == 5 then
      local r8_124 = cclass.lua_Sounds:new()
      r8_124:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.qsave), g_SysSEName.qsave, getSoundVolume("systemse"))
      r8_124:delete()
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
    elseif r6_124 == 6 then
      openConfirm(LUA_CONFIRM_QUICKLOAD)
    elseif r6_124 == 7 then
      openConfig(4, false)
    elseif r6_124 == 8 then
      openConfig(5, false)
    elseif r6_124 == 9 then
      openConfirm(LUA_CONFIRM_TITLE)
    elseif r6_124 == 10 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_MINIMIZED, 0)
    elseif r6_124 == 11 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SCREENMODE, 0)
    elseif r6_124 == 12 then
      local r8_124 = nil
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        r8_124 = 0
      else
        r8_124 = 1
      end
      if hideMessageWindow(r8_124) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGHIDE)
      end
    elseif r6_124 == 13 then
      openConfirm(LUA_CONFIRM_SELECTLOAD)
    elseif r6_124 == 14 then
    end
  end
end
onLButtonDown = function(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
  -- line: [4718, 4735] id: 125
  if r0_125 == "system" then
    onLButtonDownMessageWindow(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
  elseif r0_125 == "dialog" then
    onLButtonDownDialog(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
  else
    for r9_125, r10_125 in pairs(g_Menu) do
      if r10_125.ptr ~= nil and r0_125 == r10_125.ptr.MenuInf.SetName then
        r10_125.ptr:MenuLButtonDown(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
        break
      end
    end
  end
end
onLButtonUp = function(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
  -- line: [4738, 4755] id: 126
  if r0_126 == "system" then
    onLButtonUpMessageWindow(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
  elseif r0_126 == "dialog" then
    onLButtonUpDialog(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
  else
    for r9_126, r10_126 in pairs(g_Menu) do
      if r10_126.ptr ~= nil and r0_126 == r10_126.ptr.MenuInf.SetName then
        r10_126.ptr:MenuLButtonUp(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
        break
      end
    end
  end
end
onRButtonUp = function(r0_127, r1_127, r2_127, r3_127, r4_127, r5_127)
  -- line: [4759, 4776] id: 127
  if r0_127 == "system" then
    onRButtonDownMessageWindow(r0_127, r1_127, r2_127, r3_127, r4_127, r5_127)
  elseif r0_127 == "dialog" then
    onRButtonUpDialog(r0_127, r1_127, r2_127, r3_127, r4_127, r5_127)
  else
    for r9_127, r10_127 in pairs(g_Menu) do
      if r10_127.ptr ~= nil and r0_127 == r10_127.ptr.MenuInf.SetName then
        r10_127.ptr:MenuRButtonUp(r0_127, r1_127, r2_127, r3_127, r4_127, r5_127)
        break
      end
    end
  end
end
onMButtonDown = function(r0_128, r1_128, r2_128, r3_128, r4_128, r5_128)
  -- line: [4779, 4792] id: 128
  if r0_128 ~= "system" then
    for r9_128, r10_128 in pairs(g_Menu) do
      if r10_128.ptr ~= nil and r0_128 == r10_128.ptr.MenuInf.SetName then
        r10_128.ptr:MenuMButtonDown(r0_128, r1_128, r2_128, r3_128, r4_128, r5_128)
        break
      end
    end
  end
end
onMButtonUp = function(r0_129, r1_129, r2_129, r3_129, r4_129, r5_129)
  -- line: [4795, 4807] id: 129
  if r0_129 ~= "system" then
    for r9_129, r10_129 in pairs(g_Menu) do
      if r10_129.ptr ~= nil and r0_129 == r10_129.ptr.MenuInf.SetName then
        r10_129.ptr:MenuMButtonUp(r0_129, r1_129, r2_129, r3_129, r4_129, r5_129)
        break
      end
    end
  end
end
onX1ButtonDown = function(r0_130, r1_130, r2_130, r3_130, r4_130, r5_130)
  -- line: [4811, 4825] id: 130
  if r0_130 ~= "system" and r0_130 ~= "dialog" then
    for r9_130, r10_130 in pairs(g_Menu) do
      if r10_130.ptr ~= nil and r0_130 == r10_130.ptr.MenuInf.SetName then
        r10_130.ptr:MenuX1ButtonDown(r0_130, r1_130, r2_130, r3_130, r4_130, r5_130)
        break
      end
    end
  end
end
onX1ButtonUp = function(r0_131, r1_131, r2_131, r3_131, r4_131, r5_131)
  -- line: [4828, 4842] id: 131
  if r0_131 ~= "system" and r0_131 ~= "dialog" then
    for r9_131, r10_131 in pairs(g_Menu) do
      if r10_131.ptr ~= nil and r0_131 == r10_131.ptr.MenuInf.SetName then
        r10_131.ptr:MenuX1ButtonUp(r0_131, r1_131, r2_131, r3_131, r4_131, r5_131)
        break
      end
    end
  end
end
onX2ButtonDown = function(r0_132, r1_132, r2_132, r3_132, r4_132, r5_132)
  -- line: [4845, 4859] id: 132
  if r0_132 ~= "system" and r0_132 ~= "dialog" then
    for r9_132, r10_132 in pairs(g_Menu) do
      if r10_132.ptr ~= nil and r0_132 == r10_132.ptr.MenuInf.SetName then
        r10_132.ptr:MenuX2ButtonDown(r0_132, r1_132, r2_132, r3_132, r4_132, r5_132)
        break
      end
    end
  end
end
onX2ButtonUp = function(r0_133, r1_133, r2_133, r3_133, r4_133, r5_133)
  -- line: [4862, 4876] id: 133
  if r0_133 ~= "system" and r0_133 ~= "dialog" then
    for r9_133, r10_133 in pairs(g_Menu) do
      if r10_133.ptr ~= nil and r0_133 == r10_133.ptr.MenuInf.SetName then
        r10_133.ptr:MenuX2ButtonUp(r0_133, r1_133, r2_133, r3_133, r4_133, r5_133)
        break
      end
    end
  end
end
onMouseMove = function(r0_134, r1_134, r2_134, r3_134, r4_134, r5_134)
  -- line: [4879, 4899] id: 134
  if r0_134 == "system" then
    onMouseMoveMessageWindow(r0_134, r1_134, r2_134, r3_134, r4_134, r5_134)
  elseif r0_134 == "dialog" then
    onMouseMoveDialog(r0_134, r1_134, r2_134, r3_134, r4_134, r5_134)
  else
    for r9_134, r10_134 in pairs(g_Menu) do
      if r10_134.ptr ~= nil and r0_134 == r10_134.ptr.MenuInf.SetName then
        r10_134.ptr:MenuMouseMove(r0_134, r1_134, r2_134, r3_134, r4_134, r5_134)
        break
      end
    end
  end
end
onMouseWheel = function(r0_135, r1_135)
  -- line: [4902, 4918] id: 135
  if r0_135 ~= "system" and r0_135 ~= "dialog" then
    for r5_135, r6_135 in pairs(g_Menu) do
      if r6_135.ptr ~= nil and r0_135 == r6_135.ptr.MenuInf.SetName then
        r6_135.ptr:MenuMouseWheel(r0_135, r1_135)
        break
      end
    end
  end
end
onKeyDown = function(r0_136, r1_136, r2_136, r3_136)
  -- line: [4921, 4935] id: 136
  if r0_136 == "system" then
    onKeyDownMessageWindow(r0_136, r1_136, r2_136, r3_136)
  elseif r0_136 == "dialog" then
    onKeyDownDialog(r0_136, r1_136, r2_136, r3_136)
  else
    for r7_136, r8_136 in pairs(g_Menu) do
      if r8_136.ptr ~= nil and r0_136 == r8_136.ptr.MenuInf.SetName then
        r8_136.ptr:MenuKeyDown(r0_136, r1_136, r2_136, r3_136)
      end
    end
  end
end
onIMEnd = function(r0_137, r1_137, r2_137)
  -- line: [4948, 4961] id: 137
  if r0_137 == "cmdLine" then
    if r2_137 == false then
      cfunc.LegacyGame__lua_SetString("@FIRST", r1_137, false)
      cfunc.LegacyGame__lua_SetString("@FIRST", r1_137, true)
    end
    local r3_137 = cclass.lua_Layers:create()
    r3_137:removeLayer("cmdLine", "inputLine")
    r3_137:removeLayer("cmdLine", "CmdLine01")
    g_cmdLineInfo.enabled = false
    g_cmdLineInfo.effect = false
  end
end
faceRead = function(r0_138)
  -- line: [4965, 4980] id: 138
  local r1_138 = cclass.lua_Layers:create()
  if string.lower(r0_138) == ".png" then
    r1_138:removeLayer("system", "MsgFace")
    return true
  else
    local r3_138 = r1_138:insertLayer("system", "MsgFace", LUA_LAYER_STD, getGraphicsArcFileName("system", r0_138), r0_138, 1)
    r1_138:setParam("system", "MsgFace", LUA_PARAM_POS, 89, 511, 0, 0)
    return r3_138
  end
end
getTipsFocus = function()
  -- line: [4983, 4985] id: 139
  return g_TipsPos.flag
end
onTipsClick = function(r0_140)
  -- line: [4986, 4996] id: 140
end
onMouseMoveMessageWindow = function(r0_141, r1_141, r2_141, r3_141, r4_141, r5_141)
  -- line: [5002, 5008] id: 141
  if g_MenuMsgWin ~= nil and r0_141 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuMouseMove(r0_141, r1_141, r2_141, r3_141, r4_141, r5_141)
  end
end
onLButtonDownMessageWindow = function(r0_142, r1_142, r2_142, r3_142, r4_142, r5_142)
  -- line: [5011, 5015] id: 142
  if g_MenuMsgWin ~= nil and r0_142 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuLButtonDown(r0_142, r1_142, r2_142, r3_142, r4_142, r5_142)
  end
end
onLButtonUpMessageWindow = function(r0_143, r1_143, r2_143, r3_143, r4_143, r5_143)
  -- line: [5018, 5022] id: 143
  if g_MenuMsgWin ~= nil and r0_143 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuLButtonUp(r0_143, r1_143, r2_143, r3_143, r4_143, r5_143)
  end
end
onRButtonDownMessageWindow = function(r0_144, r1_144, r2_144, r3_144, r4_144, r5_144)
  -- line: [5025, 5029] id: 144
  if g_MenuMsgWin ~= nil and r0_144 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuRButtonDown(r0_144, r1_144, r2_144, r3_144, r4_144, r5_144)
  end
end
onKeyDownMessageWindow = function(r0_145, r1_145, r2_145, r3_145)
  -- line: [5035, 5039] id: 145
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:MenuKeyDown(r0_145, r1_145, r2_145, r3_145)
  end
end
setButtonState = function()
  -- line: [5043, 5048] id: 146
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:setButtonState()
  end
end
refreshCursorPos = function()
  -- line: [5051, 5058] id: 147
  if g_refreshCursor then
    cfunc.D3DApp__lua_PostMouseMove()
    g_refreshCursor = false
  end
end
willChangeVariable = function()
  -- line: [5061, 5063] id: 148
end
didChangeVariable = function()
  -- line: [5066, 5068] id: 149
end
getCharacterKeyCount = function()
  -- line: [5071, 5074] id: 150
  return #g_charKeys + #g_charKeysOtherM + #g_charKeysOtherF
end
getCharacterKey = function(r0_151)
  -- line: [5077, 5088] id: 151
  r0_151 = r0_151 + 1
  if #g_charKeys + #g_charKeysOtherM < r0_151 then
    return g_charKeysOtherF[r0_151 - #g_charKeys + #g_charKeysOtherM]
  elseif #g_charKeys < r0_151 then
    return g_charKeysOtherM[r0_151 - #g_charKeys]
  else
    return g_charKeys[r0_151]
  end
end
executeQuickSave = function()
  -- line: [5091, 5099] id: 152
  local r0_152 = cclass.lua_Sounds:new()
  r0_152:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.qsave), g_SysSEName.qsave, getSoundVolume("systemse"))
  r0_152:delete()
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
end
executeQuickLoad = function()
  -- line: [5102, 5108] id: 153
  local r0_153 = cclass.lua_Sounds:new()
  r0_153:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.qload), g_SysSEName.qload, getSoundVolume("systemse"))
  openConfirm(LUA_CONFIRM_QUICKLOAD)
  r0_153:delete()
end
getMessageWindowEffect = function()
  -- line: [5111, 5117] id: 154
  if g_MenuMsgWin ~= nil then
    return g_MenuMsgWin.MenuInf.effect
  end
  return false
end
initSelect = function(r0_155)
  -- line: [5120, 5133] id: 155
  g_MenuMsgWin.SelectCount = r0_155
  g_MenuMsgWin:MenuMakeSelectLayer()
  g_MenuMsgWin:MakeSelectBut()
  g_MenuMsgWin:SetSelectButPos()
  g_MenuMsgWin:startSelectMenu()
end
getLocalSelectText = function(r0_156)
  -- line: [5139, 5143] id: 156
  return string.format("SelTxt%03d", r0_156)
end
getLocalSelectKey = function(r0_157)
  -- line: [5148, 5152] id: 157
  return string.format("SelWnd%03d", r0_157)
end
disableSelectItem = function(r0_158)
  -- line: [5158, 5174] id: 158
  if g_MenuMsgWin ~= nil then
    setSelectTextColor(r0_158, -1)
    g_MenuMsgWin:DisableSelect(r0_158)
  end
end
getSelectTextKey = function(r0_159)
  -- line: [5179, 5183] id: 159
  return "system", getLocalSelectText(r0_159 + 1)
end
isSelectEffect = function()
  -- line: [5186, 5193] id: 160
  local r0_160 = false
  if g_MenuMsgWin ~= nil then
    r0_160 = g_MenuMsgWin:SelectEffect()
  end
  return r0_160
end
setSelectTextColor = function(r0_161, r1_161)
  -- line: [5196, 5219] id: 161
  if g_SelectTextColorState[r0_161 + 1] == -1 then
    r1_161 = -1
  end
  local r2_161 = getLocalSelectText(r0_161 + 1)
  local r3_161 = cclass.CLegacyFontInfo:create()
  if r1_161 == 0 then
    r3_161:changeColor("system", r2_161, g_selectTextColor.normal, g_selectTextColor.normalEdge)
  elseif r1_161 == 1 then
    r3_161:changeColor("system", r2_161, g_selectTextColor.already, g_selectTextColor.alreadyEdge)
  elseif r1_161 == 2 then
    r3_161:changeColor("system", r2_161, g_selectTextColor.selected, g_selectTextColor.selectedEdge)
  else
    r3_161:changeColor("system", r2_161, g_selectTextColor.disabled, g_selectTextColor.disabledEdge)
  end
  cclass.lua_Layers:create():updateTextColor("system", r2_161)
  g_SelectTextColorState[r0_161 + 1] = r1_161
end
isSystemEffect = function(r0_162)
  -- line: [5222, 5250] id: 162
  local r1_162 = false
  if g_MenuDialog ~= nil then
    local r2_162 = g_MenuDialog:MenuEffect()
    if r2_162 == false and g_MenuDialog.MenuInf.enabled == false then
      g_MenuDialog = nil
    end
    if not r1_162 then
      r1_162 = r2_162
    end
  end
  for r5_162, r6_162 in pairs(g_Menu) do
    if r6_162.ptr ~= nil then
      local r7_162 = r6_162.ptr:MenuEffect()
      if r7_162 == false and r6_162.ptr.MenuInf.enabled == false then
        r6_162.ptr = nil
      end
      if not r1_162 then
        r1_162 = r7_162
      end
    end
  end
  local r2_162 = isCmdLineEffect()
  if r2_162 == true then
    r2_162 = true or false
  else
    goto label_48	-- block#16 is visited secondly
  end
  if not r1_162 then
    r1_162 = r2_162
  end
  return r1_162
end
openCmdLine = function(r0_163, r1_163, r2_163, r3_163, r4_163)
  -- line: [5262, 5293] id: 163
  if r3_163 == false or r4_163 then
    r2_163 = r2_163 * -1 or r2_163
  end
  local r5_163 = cclass.lua_Layers:create()
  if r5_163:add("cmdLine") == false then
    return false
  end
  r5_163:insertLayer("cmdLine", "CmdLine01", LUA_LAYER_PNA, getGraphicsArcFileName("cmdLine", "Sys_CmdLine.pna"), "Sys_CmdLine.pna", 1)
  for r11_163 = 1, 13, 1 do
    local r6_163 = r5_163:initSubLayer("cmdLine", "CmdLine01", r11_163, 1)
  end
  local r8_163 = 0
  local r9_163 = 0
  local r10_163 = 0
  local r11_163 = 0
  r8_163, r9_163, r10_163, r11_163 = r5_163:getSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_SIZE, r8_163, r9_163, r10_163, r11_163)
  r5_163:insertCommandLineLayer("cmdLine", "inputLine", r1_163, r8_163, r9_163, 8, 1, 8, 1, 0.25, 1, r2_163, r4_163)
  r8_163, r9_163, r10_163, r11_163 = r5_163:getSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_POS, r8_163, r9_163, r10_163, r11_163)
  r5_163:setParam("cmdLine", "inputLine", LUA_PARAM_POS, r8_163, r9_163, r10_163, r11_163)
  local r12_163 = getEffectRate()
  local r13_163 = 0
  r5_163:setSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_POS, r8_163, r9_163 + 48, r10_163, r11_163)
  r5_163:setParam("cmdLine", "CmdLine01", LUA_PARAM_COLOR, 1, 1, 1, 0)
  r5_163:setSubLayerEffect("cmdLine", "CmdLine01", "CmdEffect", 13, LUA_EFFECT_POS, 0, -48, 0, 0, 0, 100 * r12_163, 0, r13_163)
  r5_163:setEffect("cmdLine", "CmdLine01", "CmdEffect", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 100 * r12_163, 0, r13_163)
  r5_163:startSubLayerEffect("cmdLine", "CmdLine01", "CmdEffect", 13, 0)
  r5_163:startEffect("cmdLine", "CmdLine01", "CmdEffect", 0)
  g_cmdLineInfo.beforeSet = r0_163
  g_cmdLineInfo.enabled = true
  g_cmdLineInfo.effect = true
end
isCmdLineEffect = function()
  -- line: [5295, 5309] id: 164
  local r0_164 = cclass.lua_Layers:create()
  local r1_164 = r0_164:isEffect("cmdLine", "CmdEffect")
  if g_cmdLineInfo.effect == true and r1_164 == false then
    if g_cmdLineInfo.enabled == false then
      r0_164:remove("cmdLine")
      cfunc.D3DApp__lua_PostMouseMove()
    end
    g_cmdLineInfo.effect = false
  end
  return r1_164
end
setIMState = function()
  -- line: [5311, 5352] id: 165
  local r0_165 = cclass.lua_Layers:create()
  local r1_165 = 0
  local r2_165 = 0
  local r3_165 = 0
  local r4_165 = 0
  r1_165, r2_165, r3_165, r4_165 = r0_165:getIMStatus("cmdLine", "inputLine", r1_165, r2_165, r3_165, r4_165)
  if r1_165 == 0 and r2_165 ~= 5 then
    r2_165 = 0
  end
  if r2_165 == 1 or r2_165 == 2 or r2_165 == 3 then
    r0_165:setSubLayerVisible("cmdLine", "CmdLine01", 10, 0)
    r0_165:setSubLayerVisible("cmdLine", "CmdLine01", 11, 1)
  else
    r0_165:setSubLayerVisible("cmdLine", "CmdLine01", 10, 1)
    r0_165:setSubLayerVisible("cmdLine", "CmdLine01", 11, 0)
  end
  local r5_165 = 5
  if r2_165 == 1 then
    r5_165 = 9
  elseif r2_165 == 2 then
    r5_165 = 8
  elseif r2_165 == 3 then
    r5_165 = 7
  elseif r2_165 == 4 then
    r5_165 = 6
  end
  local r15_165 = nil	-- notice: implicit variable refs by block#[20]
  for r9_165 = 5, 9, 1 do
    local r12_165 = "cmdLine"
    local r13_165 = "CmdLine01"
    local r14_165 = r9_165
    if r9_165 == r5_165 then
      r15_165 = 1
      if not r15_165 then
        ::label_85::
        r15_165 = 0
      end
    else
      goto label_85	-- block#19 is visited secondly
    end
    r0_165:setSubLayerVisible(r12_165, r13_165, r14_165, r15_165)
  end
  local r8_165 = "cmdLine"
  local r9_165 = "CmdLine01"
  local r10_165 = 1
  local r11_165 = nil	-- notice: implicit variable refs by block#[25, 28, 31, 34]
  if r3_165 == 1 then
    r11_165 = 0
    if not r11_165 then
      ::label_97::
      r11_165 = 1
    end
  else
    goto label_97	-- block#24 is visited secondly
  end
  r0_165:setSubLayerVisible(r8_165, r9_165, r10_165, r11_165)
  r8_165 = "cmdLine"
  r9_165 = "CmdLine01"
  r10_165 = 2
  if r3_165 == 1 then
    r11_165 = 1
    if not r11_165 then
      ::label_108::
      r11_165 = 0
    end
  else
    goto label_108	-- block#27 is visited secondly
  end
  r0_165:setSubLayerVisible(r8_165, r9_165, r10_165, r11_165)
  r8_165 = "cmdLine"
  r9_165 = "CmdLine01"
  r10_165 = 3
  if r4_165 == 1 then
    r11_165 = 0
    if not r11_165 then
      ::label_119::
      r11_165 = 1
    end
  else
    goto label_119	-- block#30 is visited secondly
  end
  r0_165:setSubLayerVisible(r8_165, r9_165, r10_165, r11_165)
  r8_165 = "cmdLine"
  r9_165 = "CmdLine01"
  r10_165 = 4
  if r4_165 == 1 then
    r11_165 = 1
    if not r11_165 then
      ::label_130::
      r11_165 = 0
    end
  else
    goto label_130	-- block#33 is visited secondly
  end
  r0_165:setSubLayerVisible(r8_165, r9_165, r10_165, r11_165)
  for r9_165 = 1, 12, 1 do
    local r12_165 = "cmdLine"
    local r13_165 = "CmdLine01"
    local r14_165 = r9_165
    r15_165 = LUA_PARAM_COLOR
    local r16_165 = 1
    local r17_165 = 1
    local r18_165 = 1
    local r19_165 = nil	-- notice: implicit variable refs by block#[38]
    if r1_165 == 1 then
      r19_165 = 1
      if not r19_165 then
        ::label_149::
        r19_165 = 0.5
      end
    else
      goto label_149	-- block#37 is visited secondly
    end
    r0_165:setSubLayerParam(r12_165, r13_165, r14_165, r15_165, r16_165, r17_165, r18_165, r19_165)
  end
end
openConfirm = function(r0_166)
  -- line: [5357, 5604] id: 166
  if cfunc.LegacyGame__lua_GetFlag(127) == true and r0_166 == LUA_CONFIRM_TITLE then
    r0_166 = LUA_CONFIRM_ALBUM
  end
  if g_confirmDialog == 0 then
    g_MenuDialog = Menu.new("dialog")
    g_confirmDialog = r0_166
    local r2_166 = 0
    local r3_166 = 0
    local r4_166 = cclass.lua_AutoCursor:new()
    r2_166, r3_166 = r4_166:GetCursorPos(r2_166, r3_166)
    r4_166:delete()
    g_MenuDialog.InitCursorX = r2_166
    g_MenuDialog.InitCursorY = r3_166
    g_MenuDialog.MenuButtonJobPos = function(r0_167, r1_167, r2_167, r3_167, r4_167)
      -- line: [5381, 5397] id: 167
      if r1_167 ~= 0 and r2_167 == "LU" then
        if r1_167 == 1 then
          executeProcess(true)
        end
        if r1_167 == 2 then
          executeProcess(false)
        end
      end
      if r2_167 == "RU" and r0_167:GetMenuMouseEnable() then
        r0_167:SystemSePlay(g_SysSEName.cancel)
        executeProcess(false)
      end
    end
    g_MenuDialog.MenuEffectTransJob = function(r0_168)
      -- line: [5401, 5404] id: 168
      return cclass.lua_Layers:create():isEffect("dialog", "DialogDisp")
    end
    g_MenuDialog.MenuEffectEndJob = function(r0_169)
      -- line: [5406, 5441] id: 169
      local r1_169 = cclass.lua_Layers:create()
      if r0_169.MenuInf.enabled == true then
        local r2_169 = 0
        local r3_169 = 0
        local r4_169 = cclass.lua_AutoCursor:new()
        r2_169, r3_169 = r4_169:GetCursorPos(r2_169, r3_169)
        r4_169:delete()
        r0_169.MenuButton:changeButton(r0_169.MenuInf.SetName, r1_169:getCursorPos(r0_169.MenuInf.SetName, r2_169, r3_169, 0) - 1, r2_169, r3_169)
      else
        if g_skipConfirm == true then
          executeProcess(true)
          r1_169:remove(r0_169.MenuInf.SetName)
          return 
        end
        r1_169:remove(r0_169.MenuInf.SetName)
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
        r0_169.MenuInf.ButtonLayer = ""
        r0_169.MenuInf.ButtonPna = ""
        g_confirmDialog = 0
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_MOUSEMOVE, 0)
      end
    end
    g_MenuDialog.startMenu = function(r0_170)
      -- line: [5447, 5460] id: 170
      local r1_170 = cclass.lua_Layers:create()
      local r2_170 = getEffectRate()
      local r3_170 = 0
      r1_170:setParam("dialog", "Dialog01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_170:setEffect("dialog", "Dialog01", "DialogDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 250 * r2_170, 0, r3_170)
      r1_170:startEffect("dialog", "Dialog01", "DialogDisp", 0)
      r0_170.MenuInf.enabled = true
      r0_170.MenuInf.effect = true
    end
    g_MenuDialog.closeConfirm = function(r0_171, r1_171)
      -- line: [5463, 5489] id: 171
      if g_skipConfirm == true then
        g_confirmDialog = 0
        return 
      end
      local r2_171 = cclass.lua_Layers:create()
      local r3_171 = getEffectRate()
      local r4_171 = 0
      r2_171:setParam("dialog", "Dialog01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_171:setEffect("dialog", "Dialog01", "DialogDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 250 * r3_171, 0, r4_171)
      r2_171:startEffect("dialog", "Dialog01", "DialogDisp", 0)
      r0_171.MenuInf.enabled = false
      r0_171.MenuInf.effect = true
      if r1_171 == true then
        SetAutoOncursorPos(r0_171.InitCursorX, r0_171.InitCursorY, 100)
      end
    end
    local r5_166 = getUItype()
    local r6_166 = "Sys_Dialog.pna"
    if r5_166 == 1 then
      r6_166 = "Sys_c_Dialog.pna"
    end
    local r7_166 = g_MenuDialog:MenuInit("Dialog01", r6_166)
    if res == false then
      return false
    end
    if g_skipConfirm == true then
      g_MenuDialog.MenuInf.effect = true
      g_MenuDialog.MenuInf.enabled = false
      return true
    end
    local r8_166 = cclass.lua_Layers:create()
    r8_166:initSubLayer("dialog", "Dialog01", 14, 1)
    if r0_166 == LUA_CONFIRM_TITLE then
      r8_166:initSubLayer("dialog", "Dialog01", 6, 1)
    elseif r0_166 == LUA_CONFIRM_ALBUM then
      r8_166:initSubLayer("dialog", "Dialog01", 7, 1)
    elseif r0_166 == LUA_CONFIRM_OVERWRITE then
      r8_166:initSubLayer("dialog", "Dialog01", 8, 1)
    elseif r0_166 == LUA_CONFIRM_LOAD then
      r8_166:initSubLayer("dialog", "Dialog01", 9, 1)
    elseif r0_166 == LUA_CONFIRM_QUICKLOAD then
      r8_166:initSubLayer("dialog", "Dialog01", 10, 1)
    elseif r0_166 == LUA_CONFIRM_QUIT then
      r8_166:initSubLayer("dialog", "Dialog01", 11, 1)
    elseif r0_166 == LUA_CONFIRM_DEFAULT then
      r8_166:initSubLayer("dialog", "Dialog01", 12, 1)
    elseif r0_166 == LUA_CONFIRM_MEMLOAD then
      r8_166:initSubLayer("dialog", "Dialog01", 5, 1)
    end
    g_MenuDialog:MenuButtonSet(g_MenuDialog.MenuButtonData, "YES", 0, "Dialog01", 3, 3, 1, -1, -1, 1, 0, 0)
    g_MenuDialog:MenuButtonSet(g_MenuDialog.MenuButtonData, "NO", 0, "Dialog01", 2, 2, 0, -1, -1, 2, 0, 0)
    g_MenuDialog.MenuButtonData.NO.se_click = g_SysSEName.cancel
    g_MenuDialog:MenuButtonInit()
    if r0_166 == LUA_CONFIRM_DELETEGAME then
      SetAutoOncursor("dialog", "Dialog01", 2, 250)
    else
      SetAutoOncursor("dialog", "Dialog01", 3, 250)
    end
    local r9_166 = {
      SYSVOICE_CONFIRMTITLE,
      SYSVOICE_CONFIRMGALLERY,
      SYSVOICE_CONFIRMOVERWRITE,
      SYSVOICE_CONFIRMLOAD,
      SYSVOICE_CONFIRMQUICK,
      SYSVOICE_CONFIRMQUIT,
      SYSVOICE_CONFIRMDEFAULT,
      SYSVOICE_ROLLBACK,
      SYSVOICE_RETURNPRECHOICE
    }
    if r9_166[g_confirmDialog] ~= nil then
      playSystemVoice(r9_166[g_confirmDialog])
    end
    g_MenuDialog:startMenu()
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  end
  return true
end
onMouseMoveDialog = function(r0_172, r1_172, r2_172, r3_172, r4_172, r5_172)
  -- line: [5608, 5612] id: 172
  if g_MenuDialog ~= nil and r0_172 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuMouseMove(r0_172, r1_172, r2_172, r3_172, r4_172, r5_172)
  end
end
onLButtonDownDialog = function(r0_173, r1_173, r2_173, r3_173, r4_173, r5_173)
  -- line: [5614, 5618] id: 173
  if g_MenuDialog ~= nil and r0_173 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuLButtonDown(r0_173, r1_173, r2_173, r3_173, r4_173, r5_173)
  end
end
onLButtonUpDialog = function(r0_174, r1_174, r2_174, r3_174, r4_174, r5_174)
  -- line: [5620, 5624] id: 174
  if g_MenuDialog ~= nil and r0_174 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuLButtonUp(r0_174, r1_174, r2_174, r3_174, r4_174, r5_174)
  end
end
onRButtonDownDialog = function(r0_175, r1_175, r2_175, r3_175, r4_175, r5_175)
  -- line: [5626, 5630] id: 175
  if g_MenuDialog ~= nil and r0_175 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuRButtonDown(r0_175, r1_175, r2_175, r3_175, r4_175, r5_175)
  end
end
onRButtonUpDialog = function(r0_176, r1_176, r2_176, r3_176, r4_176, r5_176)
  -- line: [5632, 5636] id: 176
  if g_MenuDialog ~= nil and r0_176 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuRButtonUp(r0_176, r1_176, r2_176, r3_176, r4_176, r5_176)
  end
end
onKeyDownDialog = function(r0_177, r1_177, r2_177, r3_177)
  -- line: [5639, 5677] id: 177
  if r3_177 == true then
    return 
  end
  if g_MenuDialog ~= nil and r0_177 == g_MenuDialog.MenuInf.SetName and g_MenuDialog.MenuInf.effect == false then
    local r4_177 = g_MenuDialog.MenuButton.selCursor
    if r2_177 == LUA_KEYCODE_LEFT and r4_177 ~= "YES" then
      SetAutoOncursor("dialog", "Dialog01", 3, 100)
    elseif r2_177 == LUA_KEYCODE_RIGHT and r4_177 ~= "NO" then
      SetAutoOncursor("dialog", "Dialog01", 2, 100)
    elseif r2_177 == LUA_KEYCODE_ENTER then
      local r5_177 = g_MenuDialog.MenuButton.selListKey
      if r4_177 == "YES" and r5_177[r4_177].focusflag == true then
        executeProcess(true)
      elseif r4_177 == "NO" and r5_177[r4_177].focusflag == true then
        executeProcess(false)
      end
    elseif r2_177 == LUA_KEYCODE_SPACE then
      executeProcess(false)
    end
  end
end
closeConfirm = function(r0_178)
  -- line: [5680, 5684] id: 178
  if g_MenuDialog ~= nil then
    g_MenuDialog:closeConfirm(r0_178)
  end
end
executeProcess = function(r0_179)
  -- line: [5687, 5823] id: 179
  if r0_179 == true then
    if g_confirmDialog == LUA_CONFIRM_QUIT then
      if g_sortData ~= null then
        g_sortData:delete()
        g_sortData = nil
      end
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUIT, 0)
    elseif g_confirmDialog == LUA_CONFIRM_QUICKLOAD then
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin.MenuInf.enabled = false
        g_MenuMsgWin.MenuInf.effect = false
      end
      local r1_179 = cclass.lua_Sounds:new()
      r1_179:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.qload), g_SysSEName.qload, getSoundVolume("systemse"))
      r1_179:delete()
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKLOADGAME, -1)
      closeConfirm(false)
      g_MenuMsgWin:onResetTips()
    elseif g_confirmDialog == LUA_CONFIRM_LOAD then
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin.MenuInf.enabled = false
        g_MenuMsgWin.MenuInf.effect = false
      end
      if g_dataInfo.page == g_DATAPAGEMAX then
        if g_dataInfo.data_no < 5 then
          cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_AUTOLOADGAME, g_autoOrder[g_dataInfo.data_no + 1])
        else
          cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKLOADGAME, g_quickOrder[g_dataInfo.data_no - 5 + 1])
        end
      else
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_LOADGAME, (g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1)
      end
      closeConfirm(false)
      g_MenuMsgWin:onResetTips()
      cclass.lua_Layers:create():removeSnap("system")
      local r2_179 = cclass.lua_Sounds:new()
      r2_179:BgmStop("systembgm", 500)
      r2_179:delete()
      g_menuExecute = false
      closeConfig()
    elseif g_confirmDialog == LUA_CONFIRM_OVERWRITE then
      cfunc.LegacyGame__lua_SetSaveComment(g_saveComment)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SAVEGAME, (g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1)
      g_SavedDataUpdateWeight = true
      closeConfirm(true)
    elseif g_confirmDialog == LUA_CONFIRM_TITLE or g_confirmDialog == LUA_CONFIRM_ALBUM then
      cclass.lua_Layers:create():removeSnap("system")
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_TITLE, 0)
      closeConfirm(false)
      g_MenuMsgWin:onResetTips()
      if g_Menu.Config.ptr ~= nil and g_Menu.Config.ptr.MenuInf.enabled == true then
        closeConfig()
      end
    elseif g_confirmDialog == LUA_CONFIRM_DEFAULT then
      closeConfirm(false)
      defaultSetting()
    elseif g_confirmDialog == LUA_CONFIRM_MEMLOAD then
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin.MenuInf.enabled = false
        g_MenuMsgWin.MenuInf.effect = false
      end
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_BACKGAME, cclass.lua_Layers:create():getIndexLogLayerText("messageLog", "LogText01", g_Menu.BackLog.ptr.selLine))
      closeConfirm(false)
      g_MenuMsgWin:onResetTips()
      cclass.lua_Layers:create():removeSnap("system")
      g_menuExecute = false
      closeMessageLog()
    elseif g_confirmDialog == LUA_CONFIRM_SELECTLOAD then
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin.MenuInf.enabled = false
        g_MenuMsgWin.MenuInf.effect = false
      end
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SELECTLOADGAME, -1)
      closeConfirm(false)
      g_MenuMsgWin:onResetTips()
    elseif g_confirmDialog ~= LUA_CONFIRM_CHANGESCN and g_confirmDialog ~= LUA_CONFIRM_NMSSAVE and g_confirmDialog ~= LUA_CONFIRM_SCNTOP and g_confirmDialog == LUA_CONFIRM_DELETEGAME then
      g_sortData:Toggle((g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1)
      g_sortData:DeleteData()
      g_Menu.Config.ptr.SaveJob = 1
      closeConfirm(true)
    end
  else
    if g_confirmDialog == LUA_CONFIRM_CHANGESCN and g_Menu.Config.ptr ~= nil and g_Menu.Config.ptr.MenuInf.enabled == true then
      g_NmsPlay.Act = g_Menu.Config.ptr.P8ChangeSceneNo
      closeConfig()
    end
    closeConfirm(true)
  end
end
changeDialogFocus = function(r0_180)
  -- line: [5827, 5829] id: 180
end
g_logWindowDisable = true
g_logSnapUpdate = false
g_logTest = 0
openMessageLog = function()
  -- line: [5839, 6777] id: 181
  g_Menu.BackLog.ptr = Menu.new("messageLog")
  g_Menu.BackLog.ptr.MenuButtonJobPos = function(r0_182, r1_182, r2_182, r3_182, r4_182)
    -- line: [5847, 5924] id: 182
    if r0_182.MenuInf.effect then
      return 
    end
    if r2_182 == "LD" and r0_182.textCursor ~= -1 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_LOG_VOICEPLAY, r0_182.textCursor)
    end
    if r2_182 == "LD" and r1_182 ~= 0 and r1_182 == 10 then
      r0_182.SliderMoveNo = 1
      r0_182.SliderParam = r0_182.ButtonSlide.SlideBar:bt_GetParamY()
    end
    if r2_182 == "LU" and r0_182.SliderMoveNo == 1 then
      local r5_182 = r0_182.ButtonSlide.SlideBar:bt_GetParamY()
      if r0_182.SliderParam ~= r5_182 then
        r0_182:MenuMouseWheelEx("messageLog", r0_182.SliderParam - r5_182, false)
        r0_182.SliderParam = r5_182
        r0_182:SetActive()
      end
      r0_182.ButtonSlide.SlideBar:bt_SetParamY(r5_182)
      r0_182.SliderParam = 0
      r0_182.SliderMoveNo = -1
    end
    if r2_182 == "LU" and r1_182 ~= 0 then
      if r1_182 == 1 then
        closeMessageLog()
      end
      if r1_182 == 2 then
        r0_182:MenuMouseWheelEx("messageLog", 1, false)
      end
      if r1_182 == 3 then
        r0_182:MenuMouseWheelEx("messageLog", -1, false)
      end
      if r1_182 == 11 then
        local r5_182 = r0_182.ButtonSlide.BarBack.EVENT_RECT.h / (r0_182.ButtonSlide.SlideBar.MOVABLE.PAR_MAX_Y + 1 - r0_182.ButtonSlide.SlideBar.MOVABLE.PSIZE_Y)
        local r6_182 = r4_182 - r0_182.ButtonSlide.BarBack.DRAW_POS.y
        if r6_182 < 0 then
          r6_182 = 0
        end
        local r7_182 = math.floor(r6_182 / r5_182)
        r0_182:MenuMouseWheelEx("messageLog", r0_182.ButtonSlide.SlideBar:bt_GetParamY() - r7_182, false)
        r0_182.ButtonSlide.SlideBar:bt_SetParamY(r7_182)
        r0_182:SetActive()
        r0_182.SliderParam = 0
      end
      if 100 < r1_182 and r1_182 <= 150 then
        r0_182.selLine = r0_182.iconID[r1_182 - 100]
        openConfirm(LUA_CONFIRM_MEMLOAD)
      end
    end
    if r2_182 == "RU" and r0_182:GetMenuMouseEnable() then
      r0_182:SystemSePlay(g_SysSEName.cancel)
      closeMessageLog()
    end
  end
  g_Menu.BackLog.ptr.MenuMouseWheel = function(r0_183, r1_183, r2_183)
    -- line: [5926, 5928] id: 183
    r0_183:MenuMouseWheelEx(r1_183, r2_183, true)
  end
  g_Menu.BackLog.ptr.MenuMouseWheelEx = function(r0_184, r1_184, r2_184, r3_184)
    -- line: [5930, 5956] id: 184
    if r0_184.MenuInf.effect == true then
      return 
    end
    if cclass.lua_Layers:create():onWheelMouseLogLayer("messageLog", "LogText01", r2_184, r3_184) == true and r3_184 == true then
      closeMessageLog()
      return 
    end
    r0_184.FocusAfterCallFlag = 0
  end
  g_Menu.BackLog.ptr.FocusAfterCallFlag = -1
  g_Menu.BackLog.ptr.FocusAfterCall = function(r0_185)
    -- line: [5960, 5976] id: 185
    if r0_185.FocusAfterCallFlag >= 1 then
      r0_185.FocusAfterCallFlag = r0_185.FocusAfterCallFlag - 1
    end
    if r0_185.FocusAfterCallFlag == 0 then
      r0_185.FocusAfterCallFlag = -1
      local r1_185 = 0
      local r2_185 = 0
      local r3_185 = cclass.lua_AutoCursor:new()
      r1_185, r2_185 = r3_185:GetCursorPos(r1_185, r2_185)
      r3_185:delete()
      r0_185:defaultMenuMouseMove(setname, -1, -1, r1_185, r2_185, false)
      r0_185:TextFocus(r1_185, r2_185)
    end
  end
  g_Menu.BackLog.ptr.defaultMenuMouseMove = g_Menu.BackLog.ptr.MenuMouseMove
  g_Menu.BackLog.ptr.MenuMouseMove = function(r0_186, r1_186, r2_186, r3_186, r4_186, r5_186, r6_186)
    -- line: [5980, 6014] id: 186
    r0_186:defaultMenuMouseMove(r1_186, r2_186, r3_186, r4_186, r5_186, r6_186)
    if r0_186.SliderMoveNo == 1 then
      local r7_186 = r0_186.ButtonSlide.SlideBar:bt_GetParamY()
      if r0_186.SliderParam ~= r7_186 then
        r0_186:MenuMouseWheelEx("messageLog", r0_186.SliderParam - r7_186, false)
        r0_186.SliderParam = r7_186
        r0_186:SetActive()
      end
    end
    if r0_186.MenuButton.selCursor == -1 and r0_186.Item.SlideBase ~= nil then
      r0_186.Item.SlideBase:SetAct("def")
    end
    if (r0_186.MenuButton.selCursor == "Up" or r0_186.MenuButton.selCursor == "Down" or r0_186.MenuButton.selCursor == "SlideBar" or r0_186.MenuButton.selCursor == "BarBack") and r0_186.Item.SlideBase ~= nil then
      r0_186.Item.SlideBase:SetAct("on")
    end
    r0_186.FocusAfterCallFlag = 0
  end
  g_Menu.BackLog.ptr.MenuInit = function(r0_187)
    -- line: [6017, 6037] id: 187
    local r1_187 = true
    r0_187.MenuInf.enabled = false
    r0_187.MenuInf.effect = false
    r0_187.MenuInf.ButtonLayer = ""
    r0_187.MenuInf.ButtonPna = ""
    if cclass.lua_Layers:create():add(r0_187.MenuInf.SetName) == false then
      return false
    end
    r0_187.MenuButton = Button.new(r0_187.MenuInf.SetName)
    r0_187.MenuButton:InitList()
    r0_187.MenuButtonData = {}
    return r1_187
  end
  g_Menu.BackLog.ptr.MenuEffect = function(r0_188)
    -- line: [6040, 6074] id: 188
    local r1_188 = false
    r1_188 = r0_188:MenuEffectTransJob()
    if g_logWindowDisable then
      local r2_188 = cclass.lua_Layers:create()
      if r0_188.MenuInf.effect == true and r1_188 == true and g_logSnapUpdate == false then
        g_logTest = g_logTest + 1
        if g_logTest == 2 then
          r2_188:setSnap("system", true)
          g_logSnapUpdate = true
        end
      end
    end
    if r0_188.MenuInf.effect == true and r1_188 == false then
      r0_188:MenuEffectEndJob()
      r0_188.MenuInf.effect = false
    end
    return r1_188
    -- warn: not visited block [5, 6]
    -- block#5:
    -- _u0.g_logTest = _u0.g_logTest + 1
    -- if _u0.g_logTest == 2
    -- block#6:
    -- r2_188:setSnap2("system", true)
    -- _u0.g_logSnapUpdate = true
    -- goto label_50
  end
  g_Menu.BackLog.ptr.MenuEffectEndJob = function(r0_189)
    -- line: [6077, 6116] id: 189
    local r1_189 = cclass.lua_Layers:create()
    if r0_189.MenuInf.enabled == true then
      if g_logWindowDisable then
      end
      r0_189:InitSlideBar()
      local r2_189 = 0
      local r3_189 = 0
      local r4_189 = cclass.lua_AutoCursor:new()
      r2_189, r3_189 = r4_189:GetCursorPos(r2_189, r3_189)
      r4_189:delete()
      r0_189.MenuButton:changeButton(r0_189.MenuInf.SetName, r1_189:getCursorPos(r0_189.MenuInf.SetName, r2_189, r3_189, 0) - 1, r2_189, r3_189)
      r0_189:TextFocus(r2_189, r3_189)
    else
      r1_189:removeSnap("system")
      r1_189:remove(r0_189.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_189.MenuInf.ButtonLayer = ""
      r0_189.MenuInf.ButtonPna = ""
    end
  end
  g_Menu.BackLog.ptr.MenuKeyDown = function(r0_190, r1_190, r2_190, r3_190, r4_190)
    -- line: [6119, 6174] id: 190
    if r0_190.MenuInf.effect == false and r3_190 == LUA_KEYCODE_DOWN and r0_190.MenuButtonData.Down.active == 0 and r0_190.FocusAfterCallFlag == -1 then
      r0_190:MenuMouseWheelEx(r1_190, -1, false)
    end
    if r4_190 == true then
      return 
    end
    if r0_190.MenuInf.effect == false then
      local r5_190 = cclass.lua_Layers:create()
      local r6_190 = r5_190:getLogTextDrawCount("messageLog", "LogText01", 0)
      local r7_190 = 0
      local r8_190 = 0
      r7_190, r8_190 = r5_190:getLogTextLine("messageLog", "LogText01", r7_190, r8_190)
      if r3_190 == LUA_KEYCODE_HOME and r0_190.MenuButtonData.Up.active == 0 then
        r0_190:MenuMouseWheelEx(r1_190, r8_190, false)
      elseif r3_190 == LUA_KEYCODE_END and r0_190.MenuButtonData.Down.active == 0 then
        r0_190:MenuMouseWheelEx(r1_190, -(r7_190 - r6_190 - r8_190), false)
      elseif r3_190 == LUA_KEYCODE_PAGEUP then
        r0_190:MenuMouseWheelEx(r1_190, r5_190:pageUpLogText("messageLog", "LogText01"), false)
      elseif r3_190 == LUA_KEYCODE_PAGEDOWN then
        if r7_190 < r6_190 + r6_190 + r8_190 then
          r6_190 = r7_190 - r6_190 - r8_190
        end
        r0_190:MenuMouseWheelEx(r1_190, -r6_190, false)
      elseif r3_190 ~= LUA_KEYCODE_ENTER and r3_190 == LUA_KEYCODE_SPACE then
        closeMessageLog()
      end
    end
    -- warn: not visited block [4]
    -- block#4:
    -- r0_190:MenuMouseWheelEx(r1_190, 1, false)
    -- goto label_37
  end
  g_Menu.BackLog.ptr.initBackLog = function(r0_191)
    -- line: [6182, 6275] id: 191
    local r1_191 = getUItype()
    local r2_191 = "Sys_BackLog.pna"
    if r1_191 == 1 then
      r2_191 = "Sys_c_BackLog.pna"
    end
    r0_191:MenuLoadLayer("Log01", r2_191)
    local r3_191 = cclass.lua_Layers:create()
    g_OverlayArrowDisp = false
    r0_191:MenuLoadLayer("LogPrevBase", "Sys_Preview.pna")
    r3_191:initSubLayer("messageLog", "LogPrevBase", 0, 0)
    r3_191:insertLogLayer("messageLog", "LogText01", g_LogTxtSize.lWidth, g_LogTxtSize.lHeight, g_LogTxtSize.lMarginLeft, g_LogTxtSize.lMarginTop, g_LogTxtSize.lMarginRight, g_LogTxtSize.lMarginBottom, g_LogTxtSize.fLineMargin, 1)
    local r4_191 = 0
    r4_191, r5_191, r6_191, r7_191 = r3_191:getParam("system", "Msg01", LUA_PARAM_POS, r4_191, 0, 0, 0)
    r3_191:setParam("messageLog", "LogText01", LUA_PARAM_POS, r4_191 + 240, 0, 0, 0)
    r0_191.MenuButton:InitList()
    r0_191.MenuButtonData = {}
    r0_191.ButtonSlide = {}
    r3_191:initSubLayer("messageLog", "Log01", 35, 1)
    r3_191:initSubLayer("messageLog", "Log01", 31, 0)
    r3_191:initSubLayer("messageLog", "Log01", 32, 0)
    r3_191:initSubLayer("messageLog", "Log01", 33, 0)
    r0_191:MenuButtonSet(r0_191.MenuButtonData, "Close", 0, "Log01", 2, 2, 3, -1, -1, 1, 0, 0)
    r0_191:MenuButtonSet(r0_191.MenuButtonData, "Up", 0, "Log01", 9, 9, 10, -1, 8, 2, 0, 0)
    r0_191:MenuButtonSet(r0_191.MenuButtonData, "Down", 0, "Log01", 14, 14, 15, -1, 13, 3, 0, 0)
    r3_191:insertPNARefLayer("messageLog", "VoiceUpper", "Log01", 31, 0)
    r3_191:setCameraLayer("messageLog", "VoiceUpper", true)
    r3_191:insertPNARefLayer("messageLog", "VoiceMid", "Log01", 32, 0)
    r3_191:setCameraLayer("messageLog", "VoiceMid", true)
    r3_191:insertPNARefLayer("messageLog", "VoiceLower", "Log01", 33, 0)
    r3_191:setCameraLayer("messageLog", "VoiceLower", true)
    r3_191:initSubLayer("messageLog", "Log01", 27, 0)
    r3_191:initSubLayer("messageLog", "Log01", 28, 0)
    r3_191:insertPNARefLayer("messageLog", "IconHover", "Log01", 27, 0)
    r3_191:setCameraLayer("messageLog", "IconHover", true)
    for r11_191 = 1, 50, 1 do
      local r12_191 = r0_191:GetJumpIcon(r11_191)
      local r13_191 = r0_191:GetJumpButton(r11_191)
      r3_191:insertPNARefLayer("messageLog", r12_191, "Log01", 28, 0)
      r3_191:setCameraLayer("messageLog", r12_191, true)
      r0_191:MenuButtonSet(r0_191.MenuButtonData, r13_191, 1, "Log01", 28, -1, -1, -1, -1, r11_191 + 100, 0, 0)
    end
    r0_191.MenuButton:SetList("MenuButtonData", r0_191.MenuButtonData)
    r0_191.MenuButton:InitButton()
    for r11_191 = 1, 50, 1 do
      r0_191.MenuButtonData[r0_191:GetJumpButton(r11_191)]:bt_SetActive(3)
    end
    r0_191.Item = {}
    r0_191.Item.SlideBase = MenuItem.new("messageLog", "Log01", 24, 23)
    r0_191:SetActive()
  end
  g_Menu.BackLog.ptr.SetActive = function(r0_192)
    -- line: [6278, 6324] id: 192
    if r0_192.SlideInit == true then
      local r1_192 = cclass.lua_Layers:create()
      local r2_192 = r1_192:getLogTextDrawCount("messageLog", "LogText01", 0)
      local r3_192 = 0
      local r4_192 = 0
      r3_192, r4_192 = r1_192:getLogTextLine("messageLog", "LogText01", r3_192, r4_192)
      r0_192.ButtonSlide.SlideBar:bt_SetMovableInit(true, 0, r3_192, 0, r2_192, 0, 0)
      if r3_192 < 2 then
        r0_192.MenuButtonData.Up:bt_SetActive(2)
        r0_192.MenuButtonData.Down:bt_SetActive(2)
      else
        if r4_192 > 0 then
          if r0_192.MenuButtonData.Up.active ~= 0 then
            r0_192.MenuButtonData.Up:bt_SetActive(0)
          end
        else
          r0_192.MenuButtonData.Up:bt_SetActive(2)
        end
        if r4_192 + r2_192 < r3_192 then
          if r0_192.MenuButtonData.Down.active ~= 0 then
            r0_192.MenuButtonData.Down:bt_SetActive(0)
          end
        else
          r0_192.MenuButtonData.Down:bt_SetActive(2)
        end
      end
      if r0_192.SliderMoveNo == -1 then
        r0_192.ButtonSlide.SlideBar:bt_SetParamY(r4_192)
      end
    else
      r0_192.MenuButtonData.Up:bt_SetActive(3)
      r0_192.MenuButtonData.Down:bt_SetActive(3)
      local r1_192 = cclass.lua_Layers:create()
    end
  end
  g_Menu.BackLog.ptr.InitSlideBar = function(r0_193)
    -- line: [6328, 6371] id: 193
    if r0_193.SlideInit == true then
      return 
    end
    local r1_193 = cclass.lua_Layers:create()
    local r2_193 = r1_193:getLogTextDrawCount("messageLog", "LogText01", 0)
    local r3_193 = 0
    local r4_193 = 0
    r3_193, r4_193 = r1_193:getLogTextLine("messageLog", "LogText01", r3_193, r4_193)
    if r3_193 < 2 then
      return 
    end
    if r3_193 <= r2_193 then
      return 
    end
    r0_193:MenuMoveButtonSet(r0_193.ButtonSlide, "SlideBar", 1, "Log01", 6, 6, -1, -1, -1, 10, 0, 0)
    r0_193:MenuButtonSet(r0_193.ButtonSlide, "BarBack", 1, "Log01", 18, -1, -1, -1, -1, 11, 0, -1)
    r0_193.ButtonSlide.SlideBar.se_click = -1
    r0_193.ButtonSlide.BarBack.se_click = -1
    r0_193.MenuButton:SetList("ButtonSlide", r0_193.ButtonSlide)
    r0_193.MenuButton:InitButton()
    r0_193.MenuButton:SetList("MenuButtonData", r0_193.MenuButtonData)
    r0_193:SetSliderParam(r0_193.ButtonSlide.SlideBar, 18, 19, r3_193, r2_193, r4_193)
    r0_193.SlideInit = true
    r0_193:SetActive()
  end
  g_Menu.BackLog.ptr.SetSliderParam = function(r0_194, r1_194, r2_194, r3_194, r4_194, r5_194, r6_194)
    -- line: [6374, 6391] id: 194
    r1_194:bt_SetMoveRangeRectLayer(r2_194)
    r1_194:bt_SetEventRangeRectLayer(r3_194)
    r1_194:bt_SetMovableInit(true, 0, r4_194, 0, r5_194, 0, 0)
    r1_194.initpos.x = r1_194.MOVERANGE.x
    r1_194.initpos.y = r1_194.MOVERANGE.y
    r1_194.initrect.x = r1_194.MOVERANGE.x
    r1_194.initrect.y = r1_194.MOVERANGE.y
    r1_194.initrect.w = r1_194.EVENT_RECT.w
    r1_194.initrect.h = r1_194.EVENT_RECT.h
    r1_194:bt_SetParamY(r6_194)
  end
  g_Menu.BackLog.ptr.GetJumpIcon = function(r0_195, r1_195)
    -- line: [6394, 6398] id: 195
    return string.format("dataIcon%03d", r1_195)
  end
  g_Menu.BackLog.ptr.GetJumpButton = function(r0_196, r1_196)
    -- line: [6400, 6404] id: 196
    return string.format("Jump%03d", r1_196)
  end
  g_Menu.BackLog.ptr.addFrame = function(r0_197, r1_197)
    -- line: [6406, 6440] id: 197
    if r0_197.selLine ~= -1 and r0_197.selButton ~= nil and r0_197.MenuInf.enabled == true and r0_197.MenuInf.effect == false and r0_197.focusTimer ~= -1 then
      r0_197.focusTimer = r0_197.focusTimer - r1_197
      if r0_197.focusTimer <= 0 then
        local r2_197 = cclass.lua_Layers:create()
        local r3_197 = r2_197:getIndexLogLayerText("messageLog", "LogText01", r0_197.selLine)
        r2_197:insertPNARefLayer("messageLog", "LogPrevBaseR", "LogPrevBase", 0, 1)
        r2_197:setCameraLayer("messageLog", "LogPrevBaseR", true)
        r2_197:insertLogPreviewLayer("messageLog", "LogPreview", r3_197, 210, 119, 1)
        r2_197:setCameraLayer("messageLog", "LogPreview", true)
        local r4_197 = 5
        local r5_197 = r0_197.selButton.DRAW_POS.y + r0_197.selButton.EVENT_RECT.h + 8
        local r7_197 = 0
        r6_197, r7_197, r8_197, r9_197 = r2_197:getParam("messageLog", "LogPrevBaseR", LUA_PARAM_SIZE, 0, r7_197, 0, 0)
        if APP_INTERNAL_HEIGHT < r5_197 + r7_197 then
          r5_197 = r0_197.selButton.DRAW_POS.y - r7_197
        end
        if r5_197 < 0 then
          r5_197 = 0
        end
        r2_197:setParam("messageLog", "LogPrevBaseR", LUA_PARAM_POS, r4_197, r5_197, 0, 0)
        r2_197:setParam("messageLog", "LogPreview", LUA_PARAM_POS, r4_197 + 8, r5_197 + 7, 0, 0)
        r0_197.selButton = nil
        r0_197.focusTimer = -1
      end
    end
  end
  g_Menu.BackLog.ptr.TextFocus = function(r0_198, r1_198, r2_198)
    -- line: [6444, 6590] id: 198
    if r0_198.SliderMoveNo ~= -1 then
      return 
    end
    if r0_198.MenuButton.selDownCursor ~= -1 then
      return 
    end
    local r3_198 = cclass.lua_Layers:create()
    r3_198:setVisible("messageLog", "IconHover", 0)
    local r4_198 = -1
    local r5_198 = -1
    for r9_198 = 1, r0_198.iconCount, 1 do
      local r10_198 = r0_198:GetJumpIcon(r9_198)
      local r11_198 = r0_198:GetJumpButton(r9_198)
      if r11_198 == r0_198.MenuButton.selCursor then
        local r12_198 = 0
        local r13_198 = 0
        local r14_198 = 0
        local r15_198 = 0
        r12_198, r13_198 = r0_198.MenuButtonData[r11_198]:bt_GetPos()
        r3_198:setParam("messageLog", "IconHover", LUA_PARAM_POS, r12_198, r13_198, 0, 0)
        r3_198:setParam("messageLog", r10_198, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_198 = r9_198 - 1
        r5_198 = r0_198.MenuButtonData[r11_198]
      else
        r3_198:setParam("messageLog", r10_198, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
    if r4_198 == -1 then
      r3_198:removeLayer("messageLog", "LogPrevBaseR")
      r3_198:removeLayer("messageLog", "LogPreview")
      r0_198.selButton = nil
      r0_198.focusTimer = -1
      r0_198.selLine = -1
    else
      local r6_198 = r0_198.iconID[r4_198 + 1]
      if r0_198.selLine ~= r6_198 then
        r0_198.focusTimer = 500
        r0_198.selButton = r5_198
      end
      r3_198:setVisible("messageLog", "IconHover", 1)
      r0_198.selLine = r6_198
    end
    if r0_198.selLine == -1 then
      r4_198 = r3_198:hitTestLogLayerText("messageLog", "LogText01", r1_198, r2_198)
      if r4_198 >= 0 then
        r3_198:setVisible("messageLog", "VoiceUpper", 1)
        r3_198:setVisible("messageLog", "VoiceMid", 1)
        r3_198:setVisible("messageLog", "VoiceLower", 1)
        local r6_198 = 0
        local r8_198 = 0
        r5_198, r6_198, r7_198, r8_198 = r3_198:getLogTextRect("messageLog", "LogText01", 0, r6_198, 0, r8_198)
        r6_198 = r6_198 + 10
        r8_198 = math.ceil((r8_198 - 20) / 10) * 10
        local r9_198 = 0
        local r10_198 = 0
        local r11_198 = 0
        local r12_198 = 0
        r9_198, r10_198, r11_198, r12_198 = r3_198:getSubLayerParam("messageLog", "Log01", 32, LUA_PARAM_SIZE, r9_198, r10_198, r11_198, r12_198)
        local r13_198 = 0
        local r16_198 = 0
        r13_198, r14_198, r15_198, r16_198 = r3_198:getSubLayerParam("messageLog", "Log01", 32, LUA_PARAM_POS, r13_198, 0, 0, r16_198)
        r3_198:setParam("messageLog", "VoiceMid", LUA_PARAM_POS, r13_198, r6_198, 0, 0)
        r3_198:setParam("messageLog", "VoiceMid", LUA_PARAM_CENTERZ, 0, 0, 0, 0)
        r3_198:setParam("messageLog", "VoiceMid", LUA_PARAM_SCALE, 1, r8_198 / r10_198, 1, 0)
        if r8_198 <= 0 then
          r3_198:setVisible("messageLog", "VoiceMid", 0)
        end
        r9_198, r10_198, r11_198, r12_198 = r3_198:getParam("messageLog", "VoiceUpper", LUA_PARAM_SIZE, r9_198, r10_198, r11_198, r12_198)
        r3_198:setParam("messageLog", "VoiceUpper", LUA_PARAM_POS, r13_198, r6_198 - r10_198, r13_198, r16_198)
        r3_198:setParam("messageLog", "VoiceLower", LUA_PARAM_POS, r13_198, r6_198 + r8_198, r13_198, r16_198)
        if nose == false then
          local r17_198 = cclass.lua_Sounds:new()
          r17_198:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.cursor), g_SysSEName.cursor, getSoundVolume("systemse"))
          r17_198:delete()
        end
      else
        r3_198:setVisible("messageLog", "VoiceUpper", 0)
        r3_198:setVisible("messageLog", "VoiceMid", 0)
        r3_198:setVisible("messageLog", "VoiceLower", 0)
      end
      r0_198.textCursor = r4_198
    else
      r3_198:setVisible("messageLog", "VoiceUpper", 0)
      r3_198:setVisible("messageLog", "VoiceMid", 0)
      r3_198:setVisible("messageLog", "VoiceLower", 0)
      r0_198.textCursor = -1
    end
    r0_198:SetActive()
  end
  g_Menu.BackLog.ptr.drawSceneJumpIcon = function(r0_199)
    -- line: [6593, 6670] id: 199
    local r1_199 = cclass.lua_Layers:create()
    local r2_199 = r1_199:getLogTextDrawCount("messageLog", "LogText01", 0)
    if r2_199 <= 0 then
      r0_199.iconCount = 0
      return 
    end
    local r4_199 = 0
    r3_199, r4_199 = r1_199:getLogTextLine("messageLog", "LogText01", 0, r4_199)
    local r5_199 = -1
    local r6_199 = 0
    r0_199.iconID = {}
    for r10_199 = r4_199, r4_199 + r2_199 - 1, 1 do
      local r11_199 = r1_199:getLogLineToIndex("messageLog", "LogText01", r10_199)
      r0_199.iconID[r6_199 + 1] = r11_199
      local r12_199 = 0
      r12_199 = r1_199:getIndexLogLayerText("messageLog", "LogText01", r11_199)
      if r5_199 ~= r12_199 then
        if r12_199 >= 0 then
          r6_199 = r6_199 + 1
        end
        r5_199 = r12_199
      end
    end
    if r0_199.iconCount ~= r6_199 then
      for r10_199 = 1, 50, 1 do
        local r11_199 = r0_199:GetJumpIcon(r10_199)
        if r6_199 < r10_199 then
          r1_199:setVisible("messageLog", r11_199, 0)
          r0_199.MenuButtonData[r0_199:GetJumpButton(r10_199)]:bt_SetActive(3)
        else
          r1_199:setVisible("messageLog", r11_199, 1)
          r0_199.MenuButtonData[r0_199:GetJumpButton(r10_199)]:bt_SetActive(0)
        end
      end
      r0_199.iconCount = r6_199
    end
    local r7_199 = 0
    local r9_199 = 0
    local r10_199 = 0
    r7_199, r8_199, r9_199, r10_199 = r1_199:getSubLayerParam("messageLog", "Log01", 28, LUA_PARAM_POS, r7_199, 0, r9_199, r10_199)
    local r12_199 = 0
    r11_199, r12_199, r13_199, r14_199 = r1_199:getSubLayerParam("messageLog", "Log01", 28, LUA_PARAM_SIZE, 0, r12_199, 0, 0)
    for r18_199 = 1, r0_199.iconCount, 1 do
      local r20_199 = 0
      local r22_199 = 0
      r19_199, r20_199, r21_199, r22_199 = r1_199:getLogTextRectIndex("messageLog", "LogText01", r0_199.iconID[r18_199], 0, r20_199, 0, r22_199)
      local r8_199 = math.floor(r20_199 + r22_199 / 2 - r12_199 / 2)
      r1_199:setParam("messageLog", r0_199:GetJumpIcon(r18_199), LUA_PARAM_POS, r7_199, r8_199, r9_199, r10_199)
      r0_199.MenuButtonData[r0_199:GetJumpButton(r18_199)]:bt_SetPos(r7_199, r8_199)
    end
    r0_199:FocusAfterCall()
    r0_199:InitSlideBar()
  end
  g_Menu.BackLog.ptr.StartEffect = function(r0_200)
    -- line: [6672, 6701] id: 200
    local r1_200 = cclass.lua_Layers:create()
    if g_logWindowDisable then
      g_logSnapUpdate = false
      g_logTest = 0
    end
    r1_200:setSnap("system", true)
    r1_200:copySnap("messageLog", "system")
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
    r0_200.MenuInf.enabled = true
  end
  g_Menu.BackLog.ptr.MenuEffectStart = function(r0_201, r1_201, r2_201)
    -- line: [6704, 6711] id: 201
    local r3_201 = cclass.lua_Layers:create()
    local r4_201 = cclass.lua_MeasureTime:new()
    local r5_201 = getEffectRate()
    r3_201:startTransition(r0_201.MenuInf.SetName, 0, 1, r1_201 * r5_201, r2_201 * r4_201:diff() * r5_201, LUA_TRANSITION_NORMAL)
    r4_201:delete()
  end
  g_Menu.BackLog.ptr.EndEffect = function(r0_202)
    -- line: [6714, 6741] id: 202
    local r1_202 = cclass.lua_Layers:create()
    r1_202:stopLogVoice("messageLog", "LogText01")
    if g_logWindowDisable then
      g_logSnapUpdate = false
      g_logTest = 0
      r1_202:setSnap("messageLog", false)
    end
    r1_202:startTransition(r0_202.MenuInf.SetName, 0, 1, 300 * getEffectRate(), 0, LUA_TRANSITION_ERASE)
    r0_202.MenuInf.enabled = false
    r0_202.MenuInf.effect = true
  end
  local r0_181 = g_Menu.BackLog.ptr:MenuInit()
  if res == false then
    return false
  end
  g_Menu.BackLog.ptr.Item = {}
  g_Menu.BackLog.ptr.ButtonSlide = {}
  g_Menu.BackLog.ptr.iconCount = 0
  g_Menu.BackLog.ptr.iconID = {}
  g_Menu.BackLog.ptr.focusTimer = -1
  g_Menu.BackLog.ptr.selButton = nil
  g_Menu.BackLog.ptr.selLine = -1
  g_Menu.BackLog.ptr.textCursor = -1
  g_Menu.BackLog.ptr.SlideInit = false
  g_Menu.BackLog.ptr.SliderMoveNo = -1
  g_Menu.BackLog.ptr.SliderParam = 0
  g_Menu.BackLog.ptr:StartEffect()
  g_Menu.BackLog.ptr:initBackLog()
  g_Menu.BackLog.ptr:MenuEffectStart(300, 0)
  g_Menu.BackLog.ptr.MenuInf.effect = true
end
closeMessageLog = function()
  -- line: [6782, 6789] id: 203
  if g_Menu.BackLog.ptr ~= nil and g_Menu.BackLog.ptr.MenuInf.enabled == true and g_Menu.BackLog.ptr.MenuInf.effect == false then
    g_Menu.BackLog.ptr:EndEffect()
  end
end
drawSceneJumpIcon = function()
  -- line: [6793, 6797] id: 204
  if g_Menu.BackLog.ptr ~= nil then
    g_Menu.BackLog.ptr:drawSceneJumpIcon()
  end
end
getMessageLogTextColor = function(r0_205)
  -- line: [6800, 6808] id: 205
  if r0_205 == 0 then
    return g_logNameColor.normal, g_logNameColor.normalEdge
  else
    return g_logTextColor.voice, g_logTextColor.voiceEdge
  end
end
getMessageLogKey = function()
  -- line: [6811, 6814] id: 206
  return "messageLog", "LogText01"
end
onUpdateDataState = function()
  -- line: [6818, 6834] id: 207
  local r0_207 = math.floor(g_sortData:size() / 10)
  if g_sortData:size() % 10 ~= 0 then
    r0_207 = r0_207 + 1
    if r0_207 then
      r0_207 = r0_207
    end
  end
  if r0_207 == 0 then
    r0_207 = 1
    if r0_207 then
      r0_207 = r0_207
    end
  end
  local r1_207 = math.floor((r0_207 - 1) / 10)
  g_dataInfo.mode = 0
  g_dataInfo.presspos = 0
  local r2_207 = g_configPage
  if r2_207 == 4 then
    r2_207 = true or false
  else
    goto label_36	-- block#6 is visited secondly
  end
  g_Menu.Config.ptr:DataPage_SetActive(ConfigGetPageKeyName(g_configPage), r2_207, -1)
  g_SavedDataUpdateWeight = false
end
onInitLogLayer = function()
  -- line: [6837, 6841] id: 208
  if g_Menu.BackLog.ptr ~= nil and g_Menu.BackLog.ptr.MenuInf.enabled == true then
    drawSceneJumpIcon()
  end
end
screenChangeNotification = function()
  -- line: [6844, 6854] id: 209
  local r0_209 = g_screenMode
  if r0_209 == 0 then
    r0_209 = 1 or 0
  else
    goto label_6	-- block#2 is visited secondly
  end
  g_screenMode = r0_209
  if getSystemSet() == "configBase" and g_Menu.Config.ptr ~= nil and g_configPage == 1 then
    g_Menu.Config.ptr:updatePreviewSize(ConfigGetPageKeyName(g_configPage))
    g_Menu.Config.ptr:Page1_SetActive()
  end
end
aspectChangeNotification = function(r0_210)
  -- line: [6855, 6865] id: 210
  g_zoomMode = r0_210
  if getSystemSet() == "configBase" and g_Menu.Config.ptr ~= nil and g_configPage == 1 then
    g_Menu.Config.ptr:updatePreviewSize(ConfigGetPageKeyName(g_configPage))
    g_Menu.Config.ptr:Page1_SetActive()
  end
end
onMessageOutEnd = function(r0_211)
  -- line: [6866, 6886] id: 211
  if r0_211 == "configBase" and g_Menu.Config.ptr ~= nil and g_Menu.Config.ptr:GetMenuActive() and g_configPage == 2 then
    local r1_211 = cclass.lua_Layers:create()
    local r2_211 = nil
    local r3_211 = nil
    r2_211, r3_211 = getConfigText()
    g_Menu.Config.ptr.autoModeTimer:start(r1_211:messageLength("configBase", r2_211))
    local r5_211 = ConfigGetPageKeyName(g_configPage)
    g_Menu.Config.ptr:StartClkWait()
  end
end
addFrame = function(r0_212, r1_212)
  -- line: [6888, 7073] id: 212
  -- notice: unreachable block#38
  -- notice: unreachable block#39
  if g_Menu.Config.ptr == nil and g_P1Renew ~= 0 then
    g_P1Renew = 0
    cclass.lua_Layers:create():setForceBG(false)
  end
  if r0_212 == "configBase" and g_Menu.Config.ptr ~= nil and g_Menu.Config.ptr:GetMenuActive() then
    if g_P1Renew ~= 0 then
      if g_P1Renew == 3 then
        g_P1Renew = 2
      elseif g_P1Renew == 2 then
        g_P1Renew = 1
        local r2_212 = cclass.lua_Layers:create()
        r2_212:removeSnap("system")
        r2_212:setSnap("system", true)
        if g_configPage == 1 then
          local r3_212 = cclass.lua_Layers:create()
          r3_212:clearHitTestAll("configBase", "configBase01")
          r3_212:removeLayer("configBase", "configBase01")
          local r4_212 = "sys_config_base.pna"
          if getUItype() == 1 then
            r4_212 = "sys_c_config_base.pna"
          end
          g_Menu.Config.ptr:MenuLoadLayer("configBase01", r4_212)
          g_Menu.Config.ptr:initConfigButton()
          g_Menu.Config.ptr:SetConfigButtonActive(g_configPage)
          g_Menu.Config.ptr:ConfigLogo(g_configPage, -1, 0, 0)
          g_Menu.Config.ptr:DashboardMove(g_configPage, 0)
          g_Menu.Config.ptr:UpButtonMove(g_configPage, 0)
          for r7_212, r8_212 in pairs(g_Menu.Config.ptr.PreviewList) do
            if r8_212 ~= nil then
              r3_212:removeLayer("configBase", r8_212)
            end
          end
          r4_212 = ConfigGetPageFileName(g_configPage)
          local r5_212 = ConfigGetPageKeyName(g_configPage)
          r3_212:clearHitTestAll("configBase", r5_212)
          r3_212:removeLayer("configBase", r5_212)
          local r6_212 = ConfigGetPageFileName(g_configPage)
          local r7_212 = ConfigGetPageKeyName(g_configPage)
          g_Menu.Config.ptr:MenuLoadLayer(r7_212, r6_212)
          if g_windowID == 2 then
            local r8_212 = 0
            local r9_212 = 0
            r8_212, r9_212 = r3_212:getLastTextPos("system", "Txt01", r8_212, r9_212)
            r3_212:setParam("system", "Clk01", LUA_PARAM_POS, r8_212, r9_212 - 45, 0, 0)
          else
            r3_212:setParam("system", "Clk01", LUA_PARAM_POS, g_MenuMsgWin.ClikPos.x, g_MenuMsgWin.ClikPos.y, 0, 0)
          end
          g_Menu.Config.ptr:initConfigP1(r7_212, true)
          g_Menu.Config.ptr.MenuButton:SetList("MenuButtonData", g_Menu.Config.ptr.MenuButtonData)
          g_Menu.Config.ptr:SetConfigButtonActive(g_configPage)
          if g_menuExecute == false then
            for r11_212, r12_212 in pairs(g_Menu.Config.ptr.PreviewList) do
              if r12_212 ~= nil then
                cfunc.LegacyGame__lua_NeedPreview("configBase", r12_212)
              end
            end
          end
          g_Menu.Config.ptr:updatePreviewSize(r7_212)
          g_Menu.Config.ptr:Page1_SetActive()
        end
      else
        g_P1Renew = 0
        cclass.lua_Layers:create():setForceBG(false)
      end
    end
    if g_configPage == 2 and g_Menu.Config.ptr.autoModeTimer:addFrame(r1_212) == true and g_msgspeed ~= 100 then
      startCfg2Preview()
    end
    if g_configPage == 3 and g_Menu.Config.ptr.SliderMoveNo == -1 then
      local r2_212 = g_mixer:getMasterVolume()
      if g_mixer:getMasterMute() ~= false or not r2_212 then
        r2_212 = 0
      end
      if g_Menu.Config.ptr.GaugeBarP3.SL_MasterVol.param ~= r2_212 then
        g_Menu.Config.ptr.GaugeBarP3.SL_MasterVol:GaugeSetParam(r2_212)
      end
    end
    if g_configPage == 4 or g_configPage == 5 then
      local r2_212 = false
      if g_Menu.Config.ptr.SaveJob == 4 then
        r2_212 = true
      end
      if g_Menu.Config.ptr.SaveJob == 1 or g_Menu.Config.ptr.SaveJob == 4 then
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEDATA, -1)
        if g_sortData ~= nil then
        end
        g_Menu.Config.ptr.SaveJob = 5
      end
      if g_Menu.Config.ptr.SaveJob == 5 then
        g_Menu.Config.ptr.SaveJob = 0
        local r3_212 = ConfigGetPageKeyName(g_configPage)
        local r4_212 = g_configPage
        if r4_212 == 4 then
          r4_212 = true or false
        else
          goto label_395	-- block#51 is visited secondly
        end
        g_Menu.Config.ptr:deleteThumbnail(r4_212)
        for r8_212 = 1, 10, 1 do
          if r2_212 and r8_212 == g_dataInfo.data_no + 1 then
            initThumbnail(r4_212, r8_212 + (g_dataInfo.page - 1) * 10, true)
          else
            initThumbnail(r4_212, r8_212 + (g_dataInfo.page - 1) * 10, false)
          end
        end
        g_Menu.Config.ptr:DataPage_SetActive(r3_212, r4_212, -1)
      end
      if g_Menu.Config.ptr.SaveJob == 2 or g_Menu.Config.ptr.SaveJob == 3 then
        g_Menu.Config.ptr.SaveJob = 5
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEDATA, -1)
      end
    end
  elseif r0_212 == "messageLog" and g_Menu.BackLog.ptr ~= nil then
    g_Menu.BackLog.ptr:addFrame(r1_212)
  elseif r0_212 == "cmdLine" then
    setIMState()
  end
end
onLogDraw = function()
  -- line: [7075, 7077] id: 213
  drawSceneJumpIcon()
end
playSystemVoice = function(r0_214)
  -- line: [7081, 7087] id: 214
  playSystemVoiceNo(r0_214, getSystemvoiceNo())
end
getSystemvoiceNo = function()
  -- line: [7089, 7105] id: 215
  local r0_215 = math.random(1, 9)
  r0_215 = os.time() % 9 + 1
  if g_sysVoiceChar ~= 999 then
    r0_215 = g_sysVoiceChar
  end
  return r0_215
end
playSystemVoiceNo = function(r0_216, r1_216)
  -- line: [7108, 7206] id: 216
  -- notice: unreachable block#12
  if false then
    return 
  end
  local r2_216 = {
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
  if g_charKeys[r1_216] == nil then
    return 
  end
  local r3_216 = {}
  local r4_216 = getUItype()
  local r5_216 = cclass.lua_Sounds:new()
  for r9_216, r10_216 in pairs(g_charKeys) do
    local r11_216 = r10_216 .. "SysVoice"
    r5_216:SndStop(r11_216)
  end
  r5_216:delete()
  local r6_216 = {
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
  if r6_216[r0_216] == nil then
    return 
  end
  local r7_216 = string.format("%s%02d.ogg", r6_216[r0_216], r1_216)
  if r7_216 == nil then
    return 
  end
  local r8_216 = cclass.lua_Sounds:new()
  r8_216:SndPlay(g_charKeys[r1_216] .. "SysVoice", getSoundArcFileName("systemvoice", r7_216), r7_216, getSoundVolume("systemVoice"))
  r8_216:delete()
end
AutoModeTimer = {}
AutoModeTimer.new = function()
  -- line: [7217, 7249] id: 217
  return {
    textLength = 0,
    waitLength = 0,
    carryTime = 0,
    enable = false,
    start = function(r0_218, r1_218)
      -- line: [7224, 7229] id: 218
      r0_218.enable = true
      r0_218.textLength = r1_218
      r0_218.waitLength = 0
      r0_218.carryTime = 0
    end,
    addFrame = function(r0_219, r1_219)
      -- line: [7231, 7243] id: 219
      if r0_219.enable == true then
        local r2_219 = getAutoWaitTime()
        local r3_219 = math.floor((r1_219 + r0_219.carryTime) / r2_219)
        r0_219.carryTime = r1_219 + r0_219.carryTime - r2_219 * r3_219
        r0_219.waitLength = r0_219.waitLength + r3_219
        if r0_219.textLength <= r0_219.waitLength then
          return true
        end
      end
      return false
    end,
    reset = function(r0_220)
      -- line: [7245, 7247] id: 220
      r0_220.enable = false
    end,
  }
end
GraphBar = {}
GraphBar.new = function(r0_221, r1_221, r2_221, r3_221, r4_221, r5_221, r6_221)
  -- line: [7255, 7347] id: 221
  return {
    now = 0,
    max = r2_221,
    layerset = r0_221,
    layerkey = r1_221,
    memberLayer = {
      r3_221,
      r4_221,
      r5_221,
      r6_221
    },
    init = function(r0_222, r1_222)
      -- line: [7263, 7279] id: 222
      local r2_222 = cclass.lua_Layers:create()
      for r6_222 = 1, #r0_222.memberLayer, 1 do
        r2_222:initSubLayer(r0_222.layerset, r0_222.layerkey, r0_222.memberLayer[r6_222], 1)
        if r6_222 == 1 then
          r2_222:setSubLayerParam(r0_222.layerset, r0_222.layerkey, r0_222.memberLayer[r6_222], LUA_PARAM_COLOR, 1, 1, 1, 0)
          r2_222:setSubLayerHitTest(r0_222.layerset, r0_222.layerkey, r0_222.memberLayer[r6_222], 1, 0.01)
        elseif r6_222 == 2 then
          r0_222:updateBar(r1_222)
        elseif r6_222 == 4 then
          r2_222:setSubLayerParam(r0_222.layerset, r0_222.layerkey, r0_222.memberLayer[r6_222], LUA_PARAM_COLOR, 1, 1, 1, 0)
        end
      end
    end,
    updateBar = function(r0_223, r1_223)
      -- line: [7281, 7295] id: 223
      if r0_223.max > 0 then
        local r2_223 = cclass.lua_Layers:create()
        if r1_223 == 0 then
          r2_223:setSubLayerParam(r0_223.layerset, r0_223.layerkey, r0_223.memberLayer[2], LUA_PARAM_COLOR, 1, 1, 1, 0)
        else
          r2_223:setSubLayerParam(r0_223.layerset, r0_223.layerkey, r0_223.memberLayer[2], LUA_PARAM_COLOR, 1, 1, 1, 1)
          local r3_223 = 0
          local r4_223 = 0
          r3_223, r4_223, r5_223, r6_223 = r2_223:getSubLayerParam(r0_223.layerset, r0_223.layerkey, r0_223.memberLayer[2], LUA_PARAM_SIZE, r3_223, r4_223, 0, 0)
          r2_223:setSubLayerParam(r0_223.layerset, r0_223.layerkey, r0_223.memberLayer[2], LUA_PARAM_RECT, 0, 0, r3_223 * r1_223 / r0_223.max, r4_223)
        end
      end
      r0_223.now = r1_223
    end,
    changeFocus = function(r0_224, r1_224, r2_224)
      -- line: [7297, 7311] id: 224
      local r3_224 = cclass.lua_Layers:create()
      if r2_224 == r0_224:getInput() then
        local r4_224 = cclass.lua_Sounds:new()
        r4_224:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.ok), g_SysSEName.ok, getSoundVolume("systemse"))
        r4_224:delete()
        r3_224:setSubLayerParam(r0_224.layerset, r0_224.layerkey, r0_224.memberLayer[3], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_224:setSubLayerParam(r0_224.layerset, r0_224.layerkey, r0_224.memberLayer[4], LUA_PARAM_COLOR, 1, 1, 1, 1)
      elseif r1_224 == r0_224:getInput() then
        r3_224:setSubLayerParam(r0_224.layerset, r0_224.layerkey, r0_224.memberLayer[3], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_224:setSubLayerParam(r0_224.layerset, r0_224.layerkey, r0_224.memberLayer[4], LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
    end,
    onLButtonDown = function(r0_225, r1_225, r2_225, r3_225, r4_225)
      -- line: [7313, 7337] id: 225
      if r1_225 == r0_225:getInput() then
        local r5_225 = cclass.lua_Layers:create()
        local r6_225 = 0
        r6_225, r7_225, r8_225, r9_225 = r5_225:getSubLayerParam(r0_225.layerset, r0_225.layerkey, r0_225.memberLayer[2], LUA_PARAM_SIZE, r6_225, 0, 0, 0)
        local r10_225 = 0
        r10_225, r11_225, r12_225, r13_225 = r5_225:getSubLayerParam(r0_225.layerset, r0_225.layerkey, r0_225.memberLayer[2], LUA_PARAM_POS, r10_225, 0, 0, 0)
        local r14_225 = r4_225
        if r2_225 <= r10_225 then
          r14_225 = 0
        elseif r10_225 + r6_225 <= r2_225 then
          r14_225 = r2_221
        else
          r14_225 = math.modf(r2_221 * (r2_225 - r10_225) / r6_225)
        end
        if r4_225 ~= r14_225 then
          r0_225:updateBar(r14_225)
        end
        return r14_225
      end
      return r4_225
    end,
    getInput = function(r0_226)
      -- line: [7339, 7341] id: 226
      return r0_226.memberLayer[1]
    end,
    getValue = function(r0_227)
      -- line: [7343, 7345] id: 227
      return r0_227.now
    end,
  }
end
GetLayerRect = function(r0_228, r1_228, r2_228)
  -- line: [7355, 7377] id: 228
  local r3_228 = 0
  local r4_228 = 0
  local r5_228 = 0
  local r6_228 = 0
  local r7_228 = 0
  local r8_228 = 0
  local r9_228 = 0
  local r10_228 = 0
  local r11_228 = cclass.lua_Layers:create()
  local r12_228 = nil
  local r13_228 = nil
  r12_228, r13_228, r9_228, r10_228 = r11_228:getParam(r0_228, r1_228, LUA_PARAM_POS, r7_228, r8_228, r9_228, r10_228)
  if r1_228 ~= -1 and r2_228 ~= -1 then
    r7_228, r8_228, r9_228, r10_228 = r11_228:getSubLayerParam(r0_228, r1_228, r2_228, LUA_PARAM_POS, r7_228, r8_228, r9_228, r10_228)
    r7_228 = r7_228 + r12_228
    r8_228 = r8_228 + r13_228
    r3_228 = r7_228
    r4_228 = r8_228
    r7_228, r8_228, r9_228, r10_228 = r11_228:getSubLayerParam(r0_228, r1_228, r2_228, LUA_PARAM_SIZE, r7_228, r8_228, r9_228, r10_228)
    r5_228 = r7_228 + r3_228
    r6_228 = r8_228 + r4_228
  end
  return r3_228, r4_228, r5_228, r6_228
end
SetAutoOncursor = function(r0_229, r1_229, r2_229, r3_229)
  -- line: [7380, 7390] id: 229
  local r4_229 = cclass.lua_Layers:create()
  local r5_229 = 0
  local r6_229 = 0
  local r7_229 = 0
  local r8_229 = 0
  r5_229, r6_229, r7_229, r8_229 = r4_229:getSubLayerParam(r0_229, r1_229, r2_229, LUA_PARAM_SIZE, r5_229, r6_229, r7_229, r8_229)
  local r9_229 = 0
  local r10_229 = 0
  r9_229, r10_229, r7_229, r8_229 = r4_229:getSubLayerParam(r0_229, r1_229, r2_229, LUA_PARAM_POS, r9_229, r10_229, r7_229, r8_229)
  SetAutoOncursorPos(r9_229 + r5_229 / 2, r10_229 + r6_229 / 2, r3_229)
end
SetAutoOncursorPos = function(r0_230, r1_230, r2_230)
  -- line: [7393, 7398] id: 230
  local r3_230 = cclass.lua_AutoCursor:new()
  r3_230:AutoCursor(r0_230, r1_230, r2_230)
  r3_230:SetCursor(0)
  r3_230:delete()
end
split = function(r0_231, r1_231)
  -- line: [7402, 7416] id: 231
  if string.find(r0_231, r1_231) == nil then
    return {
      r0_231
    }
  end
  local r2_231 = {}
  local r4_231 = nil
  for r8_231, r9_231 in string.gfind(r0_231, "(.-)" .. r1_231 .. "()") do
    table.insert(r2_231, r8_231)
    r4_231 = r9_231
  end
  table.insert(r2_231, string.sub(r0_231, r4_231))
  return r2_231
end
openTestMenu = function(r0_232, r1_232)
  -- line: [7421, 7424] id: 232
end
g_TitleInit = false
openTitle = function()
  -- line: [7469, 8077] id: 233
  g_Menu.GameTitle.ptr = Menu.new("titleMenu")
  local r0_233 = cclass.lua_AutoCursor:new()
  r0_233:SetCursor(0)
  r0_233:delete()
  g_Menu.GameTitle.ptr.MenuEffect = function(r0_234)
    -- line: [7491, 7501] id: 234
    local r1_234 = false
    r1_234 = r0_234:MenuEffectTransJob()
    if r0_234.MenuInf.effect == true and r1_234 == false then
      r0_234:MenuEffectEndJob()
      r0_234.MenuInf.effect = false
    end
    return r1_234
  end
  g_Menu.GameTitle.ptr.MenuEffectTransJob = function(r0_235)
    -- line: [7503, 7513] id: 235
    local r1_235 = cclass.lua_Layers:create()
    if r0_235.MenuInf.enabled == true then
      return r1_235:isEffect(r0_235.MenuInf.SetName, "TitleDisp")
    else
      return r1_235:isTransition(r0_235.MenuInf.SetName)
    end
  end
  g_Menu.GameTitle.ptr.MenuEffectEndJob = function(r0_236)
    -- line: [7515, 7569] id: 236
    local r1_236 = cclass.lua_Layers:create()
    if r0_236.MenuInf.enabled == true then
      r0_236.MenuButton:ResetColor(r0_236.MenuButtonData)
      local r2_236 = 0
      local r3_236 = 0
      local r4_236 = cclass.lua_AutoCursor:new()
      r2_236, r3_236 = r4_236:GetCursorPos(r2_236, r3_236)
      r4_236:delete()
      r0_236.MenuButton:changeButton(r0_236.MenuInf.SetName, r1_236:getCursorPos(r0_236.MenuInf.SetName, r2_236, r3_236, 0) - 1, r2_236, r3_236)
      local r6_236 = 0
      if r0_236.MenuButton.selCursor ~= -1 then
        r6_236 = r0_236.MenuButton.selListKey[r0_236.MenuButton.selCursor].bt_l
      end
      r0_236:TitleSelCursor(r0_236.MenuButton.selCursor, r6_236, r2_236, r3_236)
      if g_TitleInit == false then
        playSystemVoice(SYSVOICE_TITLECALL)
      end
      g_TitleInit = true
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin.MenuInf.enabled = false
        g_MenuMsgWin.MenuInf.effect = false
      end
    else
      r1_236:remove(r0_236.MenuInf.SetName)
      local r2_236 = cclass.lua_AutoCursor:new()
      r2_236:SetCursor(0)
      r2_236:delete()
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_236.MenuInf.ButtonLayer = ""
      r0_236.MenuInf.ButtonPna = ""
    end
  end
  g_Menu.GameTitle.ptr.MenuEffectStart = function(r0_237, r1_237, r2_237, r3_237)
    -- line: [7573, 7690] id: 237
    if r3_237 == 0 then
      local r4_237 = cclass.lua_Sounds:new()
      r4_237:BgmPlay("systembgm", getSoundArcFileName("BGM", ".ogg"), "BGM34.ogg", getSoundVolume("BGM"))
      cfunc.LegacyGame__lua_SetVariable(112, 30)
      r4_237:delete()
    end
    r0_237.MenuInf.effect = true
    r0_237.MenuInf.enabled = true
    local r4_237 = cclass.lua_Layers:create()
    local r5_237 = cclass.lua_MeasureTime:new()
    local r6_237 = getEffectRate()
    local r7_237 = r2_237 * r5_237:diff() * r6_237
    r5_237:delete()
    r4_237:setVisible("titleMenu", "titleBack", 1)
    local r8_237 = 1800
    local r9_237 = r8_237 - 500
    local r10_237 = 300
    local r11_237 = 100
    local r12_237 = 200
    local r13_237 = 150
    if r3_237 == 0 then
      r4_237:setParam("titleMenu", "titleBack", LUA_PARAM_POS, 0, 0, 0, 0)
      r4_237:setEffect("titleMenu", "titleBack", "TitleDisp", LUA_EFFECT_POS, 0, -378, 0, 0, 2, r8_237 * r6_237, 0, 0)
    else
      r8_237 = 500
      r9_237 = 500
      r4_237:setParam("titleMenu", "titleBack", LUA_PARAM_POS, 0, -378, 0, 0)
    end
    r4_237:setParam("titleMenu", "titleBack", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_237:setEffect("titleMenu", "titleBack", "TitleDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r8_237 * r6_237, 0, 0)
    r4_237:startEffect("titleMenu", "titleBack", "TitleDisp", 0)
    r4_237:setVisible("titleMenu", "titleBase01", 1)
    r4_237:setSubLayerVisible("titleMenu", "titleBase01", 1, 1)
    r4_237:setSubLayerParam("titleMenu", "titleBase01", 1, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_237:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", 1, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 500 * r6_237, 0, r9_237 * r6_237)
    r4_237:startSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", 1, 0)
    r0_237.MenuButton:SetColor(r0_237.MenuButtonData, 1, 1, 1, 0)
    r0_237.EffectButtonKeyList = {}
    local r14_237 = 0
    local function r15_237(r0_238, r1_238, r2_238)
      -- line: [7637, 7644] id: 238
      local r3_238 = {
        key = r0_238,
        x = r1_238,
        y = r2_238,
      }
      r14_237 = r14_237 + 1
      r0_237.EffectButtonKeyList[r14_237] = r3_238
    end
    local r16_237 = r9_237
    local r17_237 = -1
    local r18_237 = 0
    local r19_237 = 0
    local r20_237 = 0
    local r21_237 = 0
    for r25_237, r26_237 in pairs(r0_237.ButtonName) do
      r25_237 = r0_237.MenuButtonData[r26_237]:bt_getNowKey()
      r18_237, r19_237, r20_237, r21_237 = r4_237:getSubLayerParam("titleMenu", "titleBase01", r25_237, LUA_PARAM_POS, r18_237, r19_237, r20_237, r21_237)
      r4_237:setSubLayerParam("titleMenu", "titleBase01", r25_237, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_237:setSubLayerParam("titleMenu", "titleBase01", r25_237, LUA_PARAM_POS, r18_237 - 100, r19_237 + 25, r20_237, r21_237)
      r4_237:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r25_237, LUA_EFFECT_POS, 100, -25, 0, 0, 3, r10_237 * r6_237, 0, r16_237 * r6_237)
      r4_237:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r25_237, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r10_237 * r6_237, 0, r16_237 * r6_237)
      r4_237:startSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r25_237, 0)
      r15_237(r25_237, r18_237, r19_237)
      if r0_237.TitleItem[r26_237].Active == 0 then
        r25_237 = r0_237.TitleItem[r26_237].Layer.def.no
      else
        r25_237 = r0_237.TitleItem[r26_237].Layer.dis.no
      end
      r18_237, r19_237, r20_237, r21_237 = r4_237:getSubLayerParam("titleMenu", "titleBase01", r25_237, LUA_PARAM_POS, r18_237, r19_237, r20_237, r21_237)
      r4_237:setSubLayerParam("titleMenu", "titleBase01", r25_237, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_237:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r25_237, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r11_237 * r6_237, 0, (r16_237 + r10_237) * r6_237)
      r4_237:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r25_237, LUA_EFFECT_SCALE, 0.3, 0.3, 0, 0, 0, r11_237 * r6_237, 0, (r16_237 + r10_237) * r6_237)
      r4_237:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r25_237, LUA_EFFECT_SCALE, -0.3, -0.3, 0, 0, 0, r12_237 * r6_237, 0, 0)
      r4_237:startSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", r25_237, 0)
      r16_237 = r16_237 + r13_237
      r15_237(r25_237, r18_237, r19_237)
    end
    r4_237:setSubLayerVisible("titleMenu", "titleBase01", 2, 1)
    r4_237:setSubLayerParam("titleMenu", "titleBase01", 2, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_237:setSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", 2, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 500 * r6_237, 0, r16_237 * r6_237)
    r4_237:startSubLayerEffect("titleMenu", "titleBase01", "TitleDisp", 2, 0)
  end
  g_Menu.GameTitle.ptr.EffectButtonKeyList = {}
  g_Menu.GameTitle.ptr.CancelMenuEffect = function(r0_239)
    -- line: [7694, 7729] id: 239
    if r0_239.MenuInf.effect == true and r0_239.MenuInf.enabled == true then
      local r1_239 = cclass.lua_Layers:create()
      r1_239:cancelEffect("titleMenu", "titleBase01", "TitleDisp")
      r1_239:cancelSubLayerEffect("titleMenu", "titleBase01", 1, "TitleDisp")
      r1_239:cancelSubLayerEffect("titleMenu", "titleBase01", 2, "TitleDisp")
      for r5_239, r6_239 in pairs(r0_239.EffectButtonKeyList) do
        r1_239:cancelSubLayerEffect("titleMenu", "titleBase01", r6_239.key, "TitleDisp")
        r1_239:setSubLayerParam("titleMenu", "titleBase01", r6_239.key, LUA_PARAM_POS, r6_239.x, r6_239.y, 1, 1)
        r1_239:setSubLayerParam("titleMenu", "titleBase01", r6_239.key, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r1_239:setSubLayerParam("titleMenu", "titleBase01", r6_239.key, LUA_PARAM_SCALE, 1, 1, 1, 0)
      end
      r1_239:setSubLayerParam("titleMenu", "titleBase01", 1, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_239:setSubLayerParam("titleMenu", "titleBase01", 2, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_239:cancelEffect("titleMenu", "titleBack", "TitleDisp")
      r1_239:setParam("titleMenu", "titleBack", LUA_PARAM_POS, 0, -378, 0, 0)
      r1_239:setParam("titleMenu", "titleBack", LUA_PARAM_COLOR, 1, 1, 1, 1)
    end
  end
  g_Menu.GameTitle.ptr.MenuButtonJob = function(r0_240, r1_240, r2_240)
    -- line: [7733, 7804] id: 240
    if r1_240 ~= 0 and r2_240 == "LU" then
      if r1_240 == 500 then
        if g_AnketoURL ~= nil then
          cfunc.LegacyGame__lua_NeedShell(g_AnketoURL)
        end
        return 
      end
      local r3_240 = cclass.lua_Layers:create()
      r3_240:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_240)
      if r1_240 == 100 or r1_240 == 120 or r1_240 == 121 or r1_240 == 130 then
        playSystemVoice(SYSVOICE_TITLESTART)
      end
      if r1_240 == 100 or r1_240 == 104 or r1_240 == 105 or r1_240 == 106 or r1_240 == 107 or r1_240 == 108 or r1_240 == 109 or r1_240 == 120 or r1_240 == 121 or r1_240 == 130 then
        r3_240:removeSnap("system")
        if r1_240 == 104 then
          cfunc.LegacyGame__lua_SetVariable(90, getSystemvoiceNo())
        elseif cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_240:MenuEffectEnd(0)
        g_menuExecute = false
      else
        if r1_240 == 103 then
        end
        r3_240:rtSnap("system")
      end
      r0_240.MenuInf.enabled = false
      r0_240.MenuInf.effect = true
    end
    if r2_240 == "LD" then
      r0_240:CancelMenuEffect()
    end
  end
  g_Menu.GameTitle.ptr.MenuKeyDown = function(r0_241, r1_241, r2_241, r3_241, r4_241)
    -- line: [7807, 7814] id: 241
    if r4_241 == true then
      return 
    end
    if r0_241.MenuInf.effect == false then
      local r5_241 = r0_241.MenuButton.selCursor
    end
  end
  g_Menu.GameTitle.ptr.defaultMenuMouseMove = g_Menu.GameTitle.ptr.MenuMouseMove
  g_Menu.GameTitle.ptr.MenuMouseMove = function(r0_242, r1_242, r2_242, r3_242, r4_242, r5_242, r6_242)
    -- line: [7819, 7827] id: 242
    r0_242:defaultMenuMouseMove(r1_242, r2_242, r3_242, r4_242, r5_242, r6_242)
    local r7_242 = 0
    if r0_242.MenuButton.selCursor ~= -1 then
      r7_242 = r0_242.MenuButton.selListKey[r0_242.MenuButton.selCursor].bt_l
    end
    r0_242:TitleSelCursor(r0_242.MenuButton.selCursor, r7_242, r4_242, r5_242)
  end
  g_Menu.GameTitle.ptr.TitleItem = {}
  g_Menu.GameTitle.ptr.ButtonName = {
    "start",
    "load",
    "config",
    "gallery",
    "exit"
  }
  g_Menu.GameTitle.ptr.ItemSetInit = function(r0_243)
    -- line: [7835, 7840] id: 243
    return {
      selCursor_Item = -1,
      selCursor_selName = -1,
    }
  end
  g_Menu.GameTitle.ptr.ItemSet = function(r0_244, r1_244, r2_244, r3_244)
    -- line: [7843, 7871] id: 244
    if r1_244.selCursor_selName ~= r3_244 then
      local r4_244 = cclass.lua_Layers:create()
      if r1_244.selCursor_Item ~= -1 then
        r4_244:cancelSubLayerEffect("titleMenu", "titleBase01", r1_244.selCursor_Item.Layer.on.no, "TitleOn")
        r4_244:setSubLayerParam("titleMenu", "titleBase01", r1_244.selCursor_Item.Layer.on.no, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r1_244.selCursor_Item:SetAct("def")
        r1_244.selCursor_Item = -1
      end
      if r3_244 ~= -1 then
        r1_244.selCursor_Item = r1_244[r3_244]
        r1_244.selCursor_Item:SetAct("on")
        r4_244:cancelSubLayerEffect("titleMenu", "titleBase01", r1_244.selCursor_Item.Layer.on.no, "TitleOn")
        r4_244:setSubLayerEffect("titleMenu", "titleBase01", "TitleOn", r1_244.selCursor_Item.Layer.on.no, LUA_EFFECT_SCALE, 0.05, 0.05, 0, 0, 0, 300, 0, 100)
        r4_244:setSubLayerEffect("titleMenu", "titleBase01", "TitleOn", r1_244.selCursor_Item.Layer.on.no, LUA_EFFECT_SCALE, -0.05, -0.05, 0, 0, 0, 300, 0, 0)
        r4_244:startSubLayerEffect("titleMenu", "titleBase01", "TitleOn", r1_244.selCursor_Item.Layer.on.no, -1)
      end
    end
    r1_244.selCursor_selName = r2_244
  end
  g_Menu.GameTitle.ptr.MenuItemTitle = function(r0_245, r1_245, r2_245, r3_245, r4_245, r5_245)
    -- line: [7872, 7883] id: 245
    local r6_245 = MenuItem.new(r1_245, r2_245, r3_245, r4_245)
    r6_245:addLayer("dis", r5_245)
    r6_245:addLayer("erase", -1)
    r6_245:SetAct("erase")
    r6_245.Active = 0
    return r6_245
  end
  g_Menu.GameTitle.ptr.TitleMenuInit = function(r0_246)
    -- line: [7886, 7994] id: 246
    -- notice: unreachable block#15
    -- notice: unreachable block#16
    -- notice: unreachable block#14
    local r1_246 = getUItype()
    local r2_246 = "SYS_FDTitle.pna"
    if r1_246 == 1 then
      r2_246 = "SYS_C_FDTitle.pna"
    end
    local r3_246 = g_Menu.GameTitle.ptr:MenuInit("titleBase01", r2_246)
    if res == false then
      return false
    end
    local r4_246 = cclass.lua_Layers:create()
    r0_246:MenuLoadLayer("titleBack", "bg01_01s.png")
    r4_246:setVisible("titleMenu", "titleBack", 1)
    r4_246:forwardLayerOrder("titleMenu", "titleBase01", "titleBack")
    r4_246:initSubLayer("titleMenu", "titleBase01", 1, 0)
    r4_246:initSubLayer("titleMenu", "titleBase01", 2, 0)
    if g_TrialFlag == 0 then
    end
    if g_TrialFlag == 1 then
    end
    local r5_246 = r0_246.MenuButtonData
    local r6_246 = 100
    if g_TrialFlag == 1 then
      r6_246 = 120
    end
    if g_TrialFlag == 2 then
      r6_246 = 121
    end
    r0_246.TitleItem = r0_246:ItemSetInit()
    for r10_246, r11_246 in pairs(r0_246.ButtonName) do
      local r12_246 = 19 + (r10_246 - 1) * 2
      r0_246:MenuButtonSet(r0_246.MenuButtonData, r11_246, 0, "titleBase01", r12_246, r12_246, 7 + (r10_246 - 1) * 2, -1, 31 + (r10_246 - 1) * 2, 100 + r10_246 - 1, 0, 0)
      r0_246.TitleItem[r11_246] = r0_246:MenuItemTitle("titleMenu", "titleBase01", 18 + (r10_246 - 1) * 2, 6 + (r10_246 - 1) * 2, 30 + (r10_246 - 1) * 2)
    end
    r0_246:MenuButtonInit()
    if g_TrialFlag == 0 then
      r0_246.MenuButtonData.gallery:bt_SetActive(0)
    else
      r0_246.MenuButtonData.gallery:bt_SetActive(2)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
      r0_246.MenuButtonData.load:bt_SetActive(2)
    end
    r0_246.MenuButton:SetColor(r0_246.MenuButtonData, 0, 0, 0, 0)
    return true
  end
  g_Menu.GameTitle.ptr.TitleSelCursor = function(r0_247, r1_247, r2_247, r3_247, r4_247)
    -- line: [7997, 8008] id: 247
    if r1_247 == -1 then
      r0_247:ItemSet(r0_247.TitleItem, -1, -1)
    elseif 100 <= r2_247 and r2_247 <= 105 then
      r0_247:ItemSet(r0_247.TitleItem, r1_247, r0_247.ButtonName[r2_247 - 100 + 1])
    else
      r0_247:ItemSet(r0_247.TitleItem, -1, -1)
    end
  end
  g_Menu.GameTitle.ptr.PatchFlag = cfunc.LegacyGame__lua_GetFlag(1005)
  g_Menu.GameTitle.ptr.PatchFlag = false
  local r1_233 = g_Menu.GameTitle.ptr:TitleMenuInit()
  if r1_233 == false then
    return r1_233
  end
  local r2_233 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r2_233:setSnap("system", true)
    r2_233:copySnap("titleMenu", "system")
    g_Menu.GameTitle.ptr:MenuEffectStart(300, 0, 0)
  else
    r2_233:copySnap("titleMenu", "system")
    g_Menu.GameTitle.ptr:MenuEffectStart(300, 0, 1)
  end
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
openGalleryTitle = function(r0_248, r1_248)
  -- line: [8084, 8217] id: 248
  cfunc.LegacyGame__lua_SetVariable(103, 1)
  return 
  g_Menu.GalleryTitle.ptr = Menu.new("GalleryTitle")
  g_Menu.GalleryTitle.ptr.MenuButtonJob = function(r0_249, r1_249, r2_249)
    -- line: [8098, 8150] id: 249
    if r1_249 ~= 0 and r2_249 == "LU" then
      local r3_249 = cclass.lua_Layers:create()
      r3_249:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(103, r1_249)
      if r1_249 == 6 then
        r3_249:removeSnap("system")
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_249:MenuEffectEnd(0)
        local r4_249 = cclass.lua_Sounds:new()
        r4_249:BgmStop("systembgm", 500)
        r4_249:delete()
        g_menuExecute = false
      elseif r1_249 == 7 then
        r3_249:removeSnap("system")
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_249:MenuEffectEnd(0)
        local r4_249 = cclass.lua_Sounds:new()
        r4_249:BgmStop("systembgm", 500)
        r4_249:delete()
        g_menuExecute = false
      else
        r3_249:rtSnap("system")
      end
      r0_249.MenuInf.enabled = false
      r0_249.MenuInf.effect = true
    end
    if r2_249 == "RU" and r0_249:GetMenuMouseEnable() and r1_249 == 0 then
      r0_249:SystemSePlay(g_SysSEName.cancel)
      local r3_249 = cclass.lua_Layers:create()
      r3_249:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(103, -1)
      r3_249:rtSnap("system")
      r0_249.MenuInf.enabled = false
      r0_249.MenuInf.effect = true
    end
  end
  g_Menu.GalleryTitle.ptr.PatchFlag = false
  local r2_248 = g_Menu.GalleryTitle.ptr:MenuInit("GTitle01", "Sys_Title.pna")
  if res == false then
    return false
  end
  local r3_248 = cclass.lua_Layers:create()
  if g_TrialFlag == 0 then
    r3_248:initSubLayer("GalleryTitle", "GTitle01", 15, 1)
  end
  if g_TrialFlag == 1 then
    r3_248:initSubLayer("GalleryTitle", "GTitle01", 16, 1)
  end
  r3_248:initSubLayer("GalleryTitle", "GTitle01", 17, 1)
  r3_248:initSubLayer("GalleryTitle", "GTitle01", 18, 1)
  r3_248:initSubLayer("GalleryTitle", "GTitle01", 72, 1)
  r3_248:initSubLayer("GalleryTitle", "GTitle01", 74, 1)
  r3_248:initSubLayer("GalleryTitle", "GTitle01", 75, 1)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Cg", 1, "GTitle01", 5, 70, 69, -1, 68, 1, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Replay", 1, "GTitle01", 4, 65, 64, -1, 63, 2, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Bgm", 1, "GTitle01", 3, 60, 59, -1, 58, 3, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Ret", 1, "GTitle01", 2, 55, 54, -1, 53, -1, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonInit()
  r3_248:copySnap("GalleryTitle", "system")
  g_Menu.GalleryTitle.ptr:MenuEffectStart(300, 0)
  g_Menu.GalleryTitle.ptr.MenuInf.effect = true
  g_Menu.GalleryTitle.ptr.MenuInf.enabled = true
  g_menuExecute = true
  return true
end
openTips = function(r0_250, r1_250)
  -- line: [8230, 8233] id: 250
  g_MenuMsgWin:MenuInitTips(r1_250)
end
closeTips = function(r0_251, r1_251)
  -- line: [8235, 8241] id: 251
  if r1_251 == 0 then
    g_MenuMsgWin:closeTips()
  else
    g_MenuMsgWin:SetTipsCloseCount(r1_251)
  end
end
LoadTips = function(r0_252, r1_252)
  -- line: [8245, 8247] id: 252
  g_MenuMsgWin:MenuLoadTips()
end
g_DisableGestureFlag = false
g_DisableDataBackup = false
DisableSC = function(r0_253, r1_253)
  -- line: [8256, 8269] id: 253
  if r1_253 == 1 then
    g_DisableGestureFlag = true
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      g_DisableDataBackup = true
    end
  else
    g_DisableGestureFlag = false
    if g_DisableDataBackup then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
    end
  end
end
openCharSelect = function(r0_254, r1_254)
  -- line: [8275, 8408] id: 254
  g_Menu.CharSelect.ptr = Menu.new("CharSelect")
  g_Menu.CharSelect.ptr.MenuEffectEndJob = function(r0_255)
    -- line: [8283, 8310] id: 255
    local r1_255 = cclass.lua_Layers:create()
    if r0_255.MenuInf.enabled == true then
      local r2_255 = 0
      local r3_255 = 0
      local r4_255 = cclass.lua_AutoCursor:new()
      r2_255, r3_255 = r4_255:GetCursorPos(r2_255, r3_255)
      r4_255:delete()
      r0_255.MenuButton:changeButton(r0_255.MenuInf.SetName, r1_255:getCursorPos(r0_255.MenuInf.SetName, r2_255, r3_255, 0) - 1, r2_255, r3_255)
    else
      if g_menuExecute == false then
        r1_255:removeSnap("system")
      end
      r1_255:remove(r0_255.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_255.MenuInf.ButtonLayer = ""
      r0_255.MenuInf.ButtonPna = ""
    end
  end
  g_Menu.CharSelect.ptr.MenuButtonJob = function(r0_256, r1_256, r2_256)
    -- line: [8313, 8350] id: 256
    if r1_256 ~= 0 and r2_256 == "LU" then
      local r3_256 = cclass.lua_Layers:create()
      r3_256:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_256)
      r3_256:removeSnap("system")
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      r0_256:MenuEffectEnd(0)
      local r4_256 = cclass.lua_Sounds:new()
      r4_256:BgmStop("systembgm", 500)
      r4_256:delete()
      g_menuExecute = false
      r0_256.MenuInf.enabled = false
      r0_256.MenuInf.effect = true
    end
    if r2_256 == "RU" and r0_256:GetMenuMouseEnable() and r1_256 == 0 then
      r0_256:SystemSePlay(g_SysSEName.cancel)
      local r3_256 = cclass.lua_Layers:create()
      r3_256:removeSnap("system")
      r3_256:rtSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_256.MenuInf.enabled = false
      r0_256.MenuInf.effect = true
    end
  end
  g_Menu.CharSelect.ptr.CharSelectInit = function(r0_257, r1_257, r2_257)
    -- line: [8352, 8373] id: 257
    cclass.lua_Layers:create():initSubLayer("CharSelect", "CharSel01", 20, 1)
    for r7_257 = 1, 7, 1 do
      local r8_257 = string.format("CharSelect%d", r7_257)
      local r9_257 = 2 + r7_257 - 1
      r0_257:MenuButtonSet(r0_257.MenuButtonData, r8_257, 0, "CharSel01", r9_257, r9_257, 11 + r7_257 - 1, -1, -1, r7_257, 0, 0)
    end
    r0_257:MenuButtonInit()
  end
  local r2_254 = g_Menu.CharSelect.ptr:MenuInit("CharSel01", "Sys_CharSelect.pna")
  if res == false then
    return false
  end
  g_Menu.CharSelect.ptr:CharSelectInit()
  local r3_254 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r3_254:setSnap("system", true)
    r3_254:copySnap("CharSelect", "system")
    g_Menu.CharSelect.ptr:MenuEffectStart(300, 0, 0)
  else
    r3_254:copySnap("CharSelect", "system")
    g_Menu.CharSelect.ptr:MenuEffectStart(300, 0, 1)
  end
  cfunc.LegacyGame__lua_SetVariable(99, -1)
  g_Menu.CharSelect.ptr.MenuInf.effect = true
  g_Menu.CharSelect.ptr.MenuInf.enabled = true
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
openSceneSelect = function(r0_258, r1_258)
  -- line: [8419, 8574] id: 258
  g_Menu.SceneSelect.ptr = Menu.new("SceneSelect")
  g_Menu.SceneSelect.ptr.MenuEffectEndJob = function(r0_259)
    -- line: [8427, 8454] id: 259
    local r1_259 = cclass.lua_Layers:create()
    if r0_259.MenuInf.enabled == true then
      local r2_259 = 0
      local r3_259 = 0
      local r4_259 = cclass.lua_AutoCursor:new()
      r2_259, r3_259 = r4_259:GetCursorPos(r2_259, r3_259)
      r4_259:delete()
      r0_259.MenuButton:changeButton(r0_259.MenuInf.SetName, r1_259:getCursorPos(r0_259.MenuInf.SetName, r2_259, r3_259, 0) - 1, r2_259, r3_259)
    else
      if g_menuExecute == false then
        r1_259:removeSnap("system")
      end
      r1_259:remove(r0_259.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_259.MenuInf.ButtonLayer = ""
      r0_259.MenuInf.ButtonPna = ""
    end
  end
  g_Menu.SceneSelect.ptr.MenuButtonJob = function(r0_260, r1_260, r2_260)
    -- line: [8457, 8494] id: 260
    if r1_260 ~= 0 and r2_260 == "LU" then
      local r3_260 = cclass.lua_Layers:create()
      r3_260:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_260)
      r3_260:removeSnap("system")
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      r0_260:MenuEffectEnd(0)
      local r4_260 = cclass.lua_Sounds:new()
      r4_260:BgmStop("systembgm", 500)
      r4_260:delete()
      g_menuExecute = false
      r0_260.MenuInf.enabled = false
      r0_260.MenuInf.effect = true
    end
    if r2_260 == "RU" and r0_260:GetMenuMouseEnable() and r1_260 == 0 then
      r0_260:SystemSePlay(g_SysSEName.cancel)
      local r3_260 = cclass.lua_Layers:create()
      r3_260:removeSnap("system")
      r3_260:rtSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_260.MenuInf.enabled = false
      r0_260.MenuInf.effect = true
    end
  end
  g_Menu.SceneSelect.ptr.TrialInit = function(r0_261, r1_261, r2_261)
    -- line: [8496, 8538] id: 261
    cclass.lua_Layers:create():initSubLayer("SceneSelect", "SceneSelect01", 19, 1)
    for r7_261 = 1, 4, 1 do
      local r8_261 = string.format("Scene%d", r7_261)
      local r9_261 = 11 - r7_261 - 1
      r0_261:MenuButtonSet(r0_261.MenuButtonData, r8_261, 0, "SceneSelect01", r9_261, r9_261, 5 - r7_261 - 1, -1, 17 - r7_261 - 1, r7_261, 0, 0)
    end
    r0_261:MenuButtonInit()
    if cfunc.LegacyGame__lua_GetFlag(1001) == false then
      r0_261.MenuButtonData.Scene1:bt_SetActive(2)
    end
    if cfunc.LegacyGame__lua_GetFlag(1003) == false then
      r0_261.MenuButtonData.Scene2:bt_SetActive(2)
    end
    if cfunc.LegacyGame__lua_GetFlag(1004) == false then
      r0_261.MenuButtonData.Scene3:bt_SetActive(2)
    end
    local r7_261 = cfunc.LegacyGame__lua_GetFlag(1002)
    local r8_261 = cfunc.LegacyGame__lua_GetFlag(1005)
    if r7_261 == false or r8_261 == false then
      r0_261.MenuButtonData.Scene4:bt_SetActive(2)
    end
  end
  local r2_258 = g_Menu.SceneSelect.ptr:MenuInit("SceneSelect01", "SYS_After.pna")
  if res == false then
    return false
  end
  g_Menu.SceneSelect.ptr:TrialInit()
  local r3_258 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r3_258:setSnap("system", true)
    r3_258:copySnap("SceneSelect", "system")
    g_Menu.SceneSelect.ptr:MenuEffectStart(300, 0, 0)
  else
    r3_258:copySnap("SceneSelect", "system")
    g_Menu.SceneSelect.ptr:MenuEffectStart(300, 0, 1)
  end
  g_Menu.SceneSelect.ptr.MenuInf.effect = true
  g_Menu.SceneSelect.ptr.MenuInf.enabled = true
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
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
    for r12_267 = 20, 25, 1 do
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
    for r22_267 = 1, 6, 1 do
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
      103,
      104,
      105,
      106,
      107
    }
    for r8_272 = 1, 6, 1 do
      local r10_272 = 6 + (r8_272 - 1) * 2
      r0_272:MenuButtonSet(r0_272.MenuButtonData, "SC" .. tostring(r8_272), 0, "StoryBace", r10_272, r10_272, 5 + (r8_272 - 1) * 2, -1, -1, r4_272[r8_272], 0, 0)
    end
    r0_272:MenuButtonSet(r0_272.MenuButtonData, "Return", 0, "StoryBace", 2, 2, 1, -1, -1, 99, 0, 0)
    r0_272:MenuButtonInit()
  end
  g_Menu.StoryMenu.ptr.StorySelCursor = function(r0_273, r1_273, r2_273, r3_273, r4_273)
    -- line: [8876, 8902] id: 273
    local r5_273 = cclass.lua_Layers:create()
    for r9_273 = 20, 25, 1 do
      r5_273:setSubLayerVisible("StoryMenu", "StoryBace", r9_273, 0)
    end
    if 101 <= r2_273 and r2_273 <= 107 then
      if r2_273 >= 103 then
        r2_273 = r2_273 - 1
      end
      r5_273:setSubLayerVisible("StoryMenu", "StoryBace", 20 + r2_273 - 100 - 1, 1)
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
openMoveBrowser = function(r0_274, r1_274)
  -- line: [8939, 9111] id: 274
  g_Menu.MoveBrowser.ptr = Menu.new("MoveBrowser")
  g_Menu.MoveBrowser.ptr.MenuInit = function(r0_275)
    -- line: [8951, 8963] id: 275
    local r1_275 = true
    r0_275.MenuInf.enabled = true
    r0_275.MenuInf.effect = true
    if cclass.lua_Layers:create():add(r0_275.MenuInf.SetName) == false then
      return false
    end
    return r1_275
  end
  g_Menu.MoveBrowser.ptr.MenuEffectEndJob = function(r0_276)
    -- line: [8966, 8980] id: 276
    local r1_276 = cclass.lua_Layers:create()
    if r0_276.MenuInf.enabled ~= true then
      r1_276:removeLayer(r0_276.MenuInf.SetName, "%EventMove%")
      r1_276:remove(r0_276.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_276.MenuInf.ButtonLayer = ""
      r0_276.MenuInf.ButtonPna = ""
    end
  end
  g_Menu.MoveBrowser.ptr.MenuEffectStart = function(r0_277, r1_277)
    -- line: [8983, 8991] id: 277
    cclass.lua_Layers:create():startTransition(r0_277.MenuInf.SetName, 0, 1, r1_277 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_277.MenuInf.enabled = true
    r0_277.MenuInf.effect = true
  end
  g_Menu.MoveBrowser.ptr.GetMenuMouseEnable = function(r0_278)
    -- line: [8993, 9004] id: 278
    local r1_278 = false
    if r0_278.MenuInf.enabled == true and r0_278.MenuInf.effect == false then
      r1_278 = true
    end
    return r1_278
  end
  g_Menu.MoveBrowser.ptr.MenuMouseMove = function(r0_279, r1_279, r2_279, r3_279, r4_279, r5_279, r6_279)
    -- line: [9010, 9016] id: 279
    if r6_279 == true then
      return 
    end
    if r0_279:GetMenuMouseEnable() then
    end
  end
  g_Menu.MoveBrowser.ptr.MenuLButtonDown = function(r0_280, r1_280, r2_280, r3_280, r4_280, r5_280, r6_280)
    -- line: [9018, 9029] id: 280
    local r7_280 = 0
    if r6_280 == true then
      return r7_280
    end
    if r0_280:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, 0)
      r0_280:closeBrowser()
    end
    return r7_280
  end
  g_Menu.MoveBrowser.ptr.MenuLButtonUp = function(r0_281, r1_281, r2_281, r3_281, r4_281, r5_281, r6_281)
    -- line: [9031, 9037] id: 281
    local r7_281 = 0
    if r6_281 == true then
      return r7_281
    end
    return r7_281
  end
  g_Menu.MoveBrowser.ptr.MenuRButtonDown = function(r0_282, r1_282, r2_282, r3_282, r4_282, r5_282, r6_282)
    -- line: [9039, 9047] id: 282
    local r7_282 = 0
    if r6_282 == true then
      return r7_282
    end
    if r0_282:GetMenuMouseEnable() then
    end
    return r7_282
  end
  g_Menu.MoveBrowser.ptr.MenuRButtonUp = function(r0_283, r1_283, r2_283, r3_283, r4_283, r5_283, r6_283)
    -- line: [9049, 9062] id: 283
    local r7_283 = 0
    if r6_283 == true then
      return r7_283
    end
    if r0_283:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_283:closeBrowser()
    end
    return r7_283
  end
  g_Menu.MoveBrowser.ptr.LoadMove = function(r0_284, r1_284, r2_284)
    -- line: [9068, 9073] id: 284
    return cclass.lua_Layers:create():insertMovieLayer(r0_284.MenuInf.SetName, r1_284, r2_284, 1)
  end
  g_Menu.MoveBrowser.ptr.closeBrowser = function(r0_285)
    -- line: [9077, 9085] id: 285
    r0_285:MenuEffectToMenu(0)
    r0_285.MenuInf.enabled = false
    r0_285.MenuInf.effect = true
    cclass.lua_Layers:create():rtSnap("system")
  end
  local r2_274 = g_Menu.MoveBrowser.ptr:MenuInit()
  if res == false then
    return false
  end
  g_Menu.MoveBrowser.ptr._number = r1_274
  if g_Menu.MoveBrowser.ptr:LoadMove("%EventMove%", r0_274) == false then
    print("\x83t\x83@\x83C\x83\x8b\x82\xaa\x96\xb3\x82\xa9\x82\xc1\x82\xbd")
  end
  cclass.lua_Layers:create():copySnap("MoveBrowser", "system")
  g_Menu.MoveBrowser.ptr:MenuEffectStart(200)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
getLanguageParam = function(r0_286, r1_286)
  -- line: [9118, 9122] id: 286
  cfunc.LegacyGame__lua_SetVariable(r1_286, getUItype())
end
