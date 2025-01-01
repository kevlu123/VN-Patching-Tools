-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
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
g_MenuMsgWin = nil
g_MenuDialog = nil
function makeMenuList(r0_1)
  -- line: [73, 76] id: 1
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
g_DATAPAGEMAX = 21
g_TrialFlag = 0
g_P1Renew = 0
g_SysSEName = {
  cursor = "SYS01.ogg",
  ok = "SYS03.ogg",
  cancel = "SYS02.ogg",
  qsave = "SYS03.ogg",
  qload = "SYS03.ogg",
  error = "SYS02.ogg",
}
g_ArrowMax = 14
g_MSWTxtSize = {
  lWidth = 980,
  lHeight = 200,
  lMarginLeft = 100,
  lMarginTop = 5,
  lMarginRight = 20,
  lMarginBottom = 5,
  fLineMargin = 0,
}
g_MSWTxtSizeN = {
  lWidth = 980,
  lHeight = 684,
  lMarginLeft = 4,
  lMarginTop = 36,
  lMarginRight = 24,
  lMarginBottom = 5,
  fLineMargin = 0,
}
g_LogTxtSize = {
  lWidth = 1060,
  lHeight = 620,
  lMarginLeft = 100,
  lMarginTop = 20,
  lMarginRight = 100,
  lMarginBottom = 20,
  fLineMargin = 0,
}
g_MSWTxtPos = {
  x = 180,
  y = 579,
}
g_MSWTxtPosN = {
  x = 180,
  y = 0,
}
g_MSWNamePos = {
  x = 180,
  y = 544,
}
g_selectTextColor = {
  normal = 4294967295,
  normalEdge = 4307199,
  oncursor = 4294967295,
  oncursorEdge = 4271961087,
  already = 4294967215,
  alreadyEdge = 4307199,
  selected = 4294919423,
  selectedEdge = 3422604543,
  disabled = 128,
  disabledEdge = 0,
}
g_SelectTextColorState = {}
g_UseTips = false
g_TipsPos = {
  x = 1014,
  y = 428,
  move = 267,
  flag = -1,
}
g_message1Color = {
  normal = 4294967295,
  normalEdge = 1657087,
  already = 3486515183,
  alreadyEdge = 1656985,
}
g_message2Color = {
  normal = 4294967295,
  normalEdge = 1657087,
  already = 3486515183,
  alreadyEdge = 1656985,
}
g_name1Color = {
  normal = 4294967295,
  normalEdge = 443992319,
  already = 4294967295,
  alreadyEdge = 443992319,
}
g_name2Color = {
  normal = 4294967295,
  normalEdge = 443992319,
  already = 4294967295,
  alreadyEdge = 443992319,
}
g_messageAlready = -1
g_logTextColor = {
  normal = 4294967295,
  normalEdge = 1657087,
  voice = 3922362111,
  voiceEdge = 153,
}
g_logNameColor = {
  normal = 4294967295,
  normalEdge = 477677567,
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
g_UseArrowViewBase = true
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
    name = "charHIKA",
    vol = 0,
    mute = false,
  },
  {
    name = "charC_HIKA",
    vol = 0,
    mute = false,
  },
  {
    name = "charSAYA",
    vol = 0,
    mute = false,
  },
  {
    name = "charC_SAYA",
    vol = 0,
    mute = false,
  },
  {
    name = "charORI",
    vol = 0,
    mute = false,
  },
  {
    name = "charKORO",
    vol = 0,
    mute = false,
  },
  {
    name = "charC_KORO",
    vol = 0,
    mute = false,
  },
  {
    name = "charMIHA",
    vol = 0,
    mute = false,
  },
  {
    name = "charTAKE",
    vol = 0,
    mute = false,
  },
  {
    name = "charC_TAKE",
    vol = 0,
    mute = false,
  },
  {
    name = "charYOSHI",
    vol = 0,
    mute = false,
  },
  {
    name = "charKANO",
    vol = 0,
    mute = false,
  },
  {
    name = "charJINNO",
    vol = 0,
    mute = false,
  },
  {
    name = "charTAJI",
    vol = 0,
    mute = false,
  },
  {
    name = "charCHAMP",
    vol = 0,
    mute = false,
  },
  {
    name = "charKOTA",
    vol = 0,
    mute = false,
  },
  {
    name = "charHINA",
    vol = 0,
    mute = false,
  },
  {
    name = "charTOYO",
    vol = 0,
    mute = false,
  },
  {
    name = "charKAWA",
    vol = 0,
    mute = false,
  },
  {
    name = "charMORI",
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
  "charHIKA",
  "charC_HIKA",
  "charSAYA",
  "charC_SAYA",
  "charORI",
  "charKORO",
  "charC_KORO",
  "charMIHA",
  "charTAKE",
  "charC_TAKE",
  "charYOSHI",
  "charKANO",
  "charJINNO",
  "charTAJI",
  "charCHAMP",
  "charKOTA",
  "charHINA",
  "charTOYO",
  "charKAWA",
  "charMORI"
}
g_charKeysOtherM = {
  "charMOB01",
  "charMOB03",
  "charMOB04",
  "charMOB10",
  "charMOB11",
  "charMOB13",
  "charMOB14",
  "charMOB20",
  "charMOB24",
  "charMOB25",
  "charMOB26",
  "charMOB27",
  "charMOB30",
  "charMOB31",
  "charMOB33",
  "charMOB37",
  "charMOB42",
  "charMOB43",
  "charMOB44",
  "charMOB47",
  "charMOB48",
  "charMOB49",
  "charMOB51",
  "charMOB53",
  "charYOUTA",
  nil
}
g_charKeysOtherF = {
  "charMOB02",
  "charMOB05",
  "charMOB06",
  "charMOB07",
  "charMOB08",
  "charMOB09",
  "charMOB12",
  "charMOB15",
  "charMOB16",
  "charMOB17",
  "charMOB18",
  "charMOB19",
  "charMOB21",
  "charMOB22",
  "charMOB23",
  "charMOB28",
  "charMOB29",
  "charMOB32",
  "charMOB34",
  "charMOB35",
  "charMOB36",
  "charMOB38",
  "charMOB39",
  "charMOB40",
  "charMOB41",
  "charMOB45",
  "charMOB46",
  "charMOB50",
  "charMOB52",
  "charMOB54",
  "charMOB55",
  "charMOB56",
  "charMOB57",
  "charTSUKI",
  "charMIKO",
  nil
}
g_charKeysOtherMAN = {}
g_charKeysOtherWOMAN = {}
g_BgvKeyToVolkey = {}
function getUItype()
  -- line: [299, 308] id: 2
  return 1
end
function changeLanguage()
  -- line: [312, 342] id: 3
  initFontInformation()
  if g_MenuMsgWin.SelectCount > 0 then
    local r0_3 = cclass.CLegacyFontInfo:create()
    local r1_3 = g_fonts.name
    local r2_3 = g_fontSize.selectSize
    if getLangPatchFlag() and getAltLanguage() then
      r1_3 = g_fonts2.name
      r2_3 = g_fontSize2.selectSize
    end
    for r6_3 = 1, g_MenuMsgWin.SelectCount, 1 do
      local r7_3 = getLocalSelectText(r6_3)
      r0_3:remove("system", r7_3)
      r0_3:add("system", r7_3, r1_3, r2_3, 1, 0, g_selectTextColor.normal, g_selectTextColor.normalEdge)
    end
  end
  local r0_3 = cclass.lua_Layers:create()
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:MenuLoadTips(true)
  end
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_CHANGELANGUAGE, 0)
  changeMessageWindow(-1, true)
  r0_3:setForceBG(true)
  g_P1Renew = 3
end
function getGameEngineVersion()
  -- line: [345, 347] id: 4
  return 1.722
end
function resetGame()
  -- line: [350, 357] id: 5
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:ReleaseMessageWindow()
  end
  return true
end
function resetSkipIcon()
  -- line: [360, 367] id: 6
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:resetSkipIcon()
    g_MenuMsgWin:resetAutoIcon()
  end
  return true
end
g_checkInit = false
function checkInitVersion()
  -- line: [372, 374] id: 7
  g_checkInit = true
end
function resetMouseCursor()
  -- line: [376, 380] id: 8
  local r0_8 = cclass.lua_AutoCursor:new()
  r0_8:SetCursor(0)
  r0_8:delete()
end
function initLegacyGame(r0_9)
  -- line: [384, 628] id: 9
  -- notice: unreachable block#70
  -- notice: unreachable block#31
  -- notice: unreachable block#79
  -- notice: unreachable block#101
  -- notice: unreachable block#40
  -- notice: unreachable block#108
  -- notice: unreachable block#47
  -- notice: unreachable block#115
  -- notice: unreachable block#122
  -- notice: unreachable block#133
  -- notice: unreachable block#63
  -- notice: unreachable block#54
  -- notice: unreachable block#146
  -- notice: unreachable block#17
  -- notice: unreachable block#24
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
    g_msgspeed = 95
  end
  r1_9 = r2_9:IsKeyDWORD("messageAlpha")
  g_messagealpha = r2_9:GetDWORD("messageAlpha")
  if r1_9 == false then
    g_messagealpha = 80
  end
  r1_9 = r2_9:IsKeyDWORD("autoSpeed")
  g_autospeed = r2_9:GetDWORD("autoSpeed")
  if r1_9 == false then
    g_autospeed = 80
  end
  local r3_9 = 0
  r1_9 = r2_9:IsKeyDWORD("allSkip")
  local r4_9 = r2_9:GetDWORD("allSkip")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 0
  end
  if r3_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
  end
  g_allskip = r4_9
  r1_9 = r2_9:IsKeyDWORD("selectReleaseSkip")
  r4_9 = r2_9:GetDWORD("selectReleaseSkip")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 0
  end
  if r3_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
  end
  g_selectReleaseSkip = r4_9
  r1_9 = r2_9:IsKeyDWORD("selectReleaseAuto")
  r4_9 = r2_9:GetDWORD("selectReleaseAuto")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 0
  end
  if r3_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
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
    r4_9 = true
  else
    r4_9 = false
  end
  g_drawSkipIcon = r4_9
  r1_9 = r2_9:IsKeyDWORD("mouseAutoMove")
  r4_9 = r2_9:GetDWORD("mouseAutoMove")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 1
  end
  if r3_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
  end
  g_mouseAutoMove = r4_9
  r1_9 = r2_9:IsKeyDWORD("skipConfirm")
  r4_9 = r2_9:GetDWORD("skipConfirm")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 0
  end
  if r3_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
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
    r4_9 = true
  else
    r4_9 = false
  end
  g_hideCursorOn = r4_9
  r1_9 = r2_9:IsKeyDWORD("deactiveMode")
  r4_9 = r2_9:GetDWORD("deactiveMode")
  r3_9 = r4_9
  if r1_9 == false then
    r3_9 = 1
  end
  if r3_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
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
    r4_9 = true
  else
    r4_9 = false
  end
  g_ReadColorChange = r4_9
  for r7_9, r8_9 in pairs(g_volume) do
    r1_9 = r2_9:IsKeyDWORD(r8_9.name .. "Volume")
    r8_9.vol = r2_9:GetDWORD(r8_9.name .. "Volume")
    if r1_9 == false then
      if r8_9.name == "bgm" then
        r8_9.vol = 500
      elseif r8_9.name == "systemse" then
        r8_9.vol = 600
      elseif r8_9.name == "se" then
        r8_9.vol = 700
      elseif r8_9.name == "movie" then
        r8_9.vol = 800
      elseif r8_9.name == "char" then
        r8_9.vol = 900
      elseif r8_9.name == "charC_SAYA" then
        r8_9.vol = 950
      else
        r8_9.vol = 900
      end
    end
    r1_9 = r2_9:IsKeyDWORD(r8_9.name .. "Mute")
    local r9_9 = r2_9:GetDWORD(r8_9.name .. "Mute")
    r3_9 = r9_9
    if r1_9 == false then
      r3_9 = 0
    end
    if r3_9 == 1 then
      r9_9 = true
    else
      r9_9 = false
    end
    r8_9.mute = r9_9
  end
  r1_9 = r2_9:IsKeyDWORD("clickVoice")
  r4_9 = r2_9:GetDWORD("clickVoice")
  if r4_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
  end
  g_clickVoice = r4_9
  if r1_9 == false then
    g_clickVoice = false
  end
  r1_9 = r2_9:IsKeyDWORD("enablePan")
  r4_9 = r2_9:GetDWORD("enablePan")
  if r4_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
  end
  g_enablePan = r4_9
  if r1_9 == false then
    g_enablePan = true
  end
  r1_9 = r2_9:IsKeyDWORD("bgvVoiceMute")
  r4_9 = r2_9:GetDWORD("bgvVoiceMute")
  if r4_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
  end
  g_bgvVoiceMute = r4_9
  if r1_9 == false then
    g_bgvVoiceMute = true
  end
  for r7_9 = 1, #g_gestureFunc, 1 do
    if r2_9:IsKeyDWORD("gesture" .. tostring(r7_9)) == true then
      g_gestureFunc[r7_9] = r2_9:GetDWORD("gesture" .. tostring(r7_9))
    end
  end
  r1_9 = r2_9:IsKeyDWORD("DisableGes")
  r4_9 = r2_9:GetDWORD("DisableGes")
  if r4_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
  end
  g_gestureDisable = r4_9
  if r1_9 == false then
    g_gestureDisable = false
  end
  r1_9 = r2_9:IsKeyDWORD("bgmCutPer")
  g_bgmCutPer = r2_9:GetDWORD("bgmCutPer")
  if r1_9 == false then
    g_bgmCutPer = 90
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
  r4_9 = r2_9:GetDWORD("altLanguage")
  if r4_9 == 1 then
    r4_9 = true
  else
    r4_9 = false
  end
  g_altLanguage = r4_9
  setInitLang()
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
function finalizeLegacyGame(r0_10)
  -- line: [631, 715] id: 10
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
    r1_10:SetDWORD("gesture" .. tostring(r6_10), g_gestureFunc[r6_10])
  end
  r1_10:SetDWORD("bgmCutPer", g_bgmCutPer)
  r1_10:SetDWORD("messageWindowType", g_messageWindowType)
  r1_10:SetDWORD("sysVoiceChar", g_sysVoiceChar)
  if g_gestureDisable == true then
    r2_10 = 1 or 0
  else
    goto label_220	-- block#47 is visited secondly
  end
  r1_10:SetDWORD("DisableGes", r2_10)
  if g_altLanguage == true then
    r2_10 = 1 or 0
  else
    goto label_231	-- block#50 is visited secondly
  end
  r1_10:SetDWORD("altLanguage", r2_10)
  g_mixer:delete()
  r1_10:delete()
  NmsMenuSaveBookMark()
end
function changeMessageColor()
  -- line: [720, 724] id: 11
  local r0_11 = cclass.lua_Layers:create()
  r0_11:updateTextColor("system", "Txt01")
  r0_11:updateTextColor("system", "Name01")
end
function setMessageColor(r0_12)
  -- line: [726, 758] id: 12
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
function changeMessageWindow(r0_13, r1_13)
  -- line: [762, 769] id: 13
  if g_MenuMsgWin ~= nil then
    return g_MenuMsgWin:changeMessageWindow(r0_13, r1_13)
  end
  return true
end
function getMessageWindowID()
  -- line: [771, 774] id: 14
  return g_windowID
end
function isUseNameWindow()
  -- line: [776, 782] id: 15
  if g_windowID == 2 then
    return false
  end
  return true
end
function initSystemScreen()
  -- line: [792, 3813] id: 16
  -- notice: unreachable block#15
  -- notice: unreachable block#16
  -- notice: unreachable block#18
  -- notice: unreachable block#19
  -- notice: unreachable block#14
  -- notice: unreachable block#17
  g_MenuMsgWin = Menu.new("system")
  function g_MenuMsgWin.MenuEffect(r0_17)
    -- line: [801, 820] id: 17
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
  function g_MenuMsgWin.MenuEffectEndJob(r0_18)
    -- line: [823, 874] id: 18
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
      r1_18:setParam("system", "Msg02", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_18:setParam("system", "Msg02", LUA_PARAM_POS, r0_18.MswPos2.x, r0_18.MswPos2.y, 0, 0)
      r1_18:setParam("system", "Msg03", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_18:setParam("system", "Msg03", LUA_PARAM_POS, r0_18.MswPos3.x, r0_18.MswPos3.y, 0, 0)
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
  function g_MenuMsgWin.MenuButtonJobPos(r0_19, r1_19, r2_19, r3_19, r4_19)
    -- line: [878, 982] id: 19
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
  function g_MenuMsgWin.MenuMouseMove(r0_20, r1_20, r2_20, r3_20, r4_20, r5_20, r6_20)
    -- line: [986, 1055] id: 20
    -- notice: unreachable block#11
    -- notice: unreachable block#12
    -- notice: unreachable block#13
    -- notice: unreachable block#10
    -- notice: unreachable block#14
    -- notice: unreachable block#9
    -- notice: unreachable block#15
    -- notice: unreachable block#8
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
      local r8_20 = 0
      if r0_20.MenuButton.selCursor ~= -1 then
        r8_20 = r0_20.MenuButton.selListKey[r0_20.MenuButton.selCursor].arg
      end
      local r9_20 = {
        "CLOSE",
        "AUTO",
        "SKIP",
        "REPEAT",
        "CONFIG"
      }
      for r14_20, r15_20 in pairs({
        31,
        32,
        33,
        34,
        35
      }) do
        if r8_20 == r9_20[r14_20] then
          r7_20:setSubLayerVisible("system", "Msg02", r15_20, 1)
        else
          r7_20:setSubLayerVisible("system", "Msg02", r15_20, 0)
        end
      end
    end
  end
  function g_MenuMsgWin.GetMenuActive(r0_21)
    -- line: [1059, 1070] id: 21
    local r1_21 = false
    if r0_21.MenuInf.enabled == true or r0_21.MenuInf.effect == true then
      r1_21 = true
    end
    if r0_21.MenuInf.select_enabled == true or r0_21.MenuInf.select_effect == true then
      r1_21 = true
    end
    return r1_21
  end
  function g_MenuMsgWin.GetMenuMouseEnable(r0_22)
    -- line: [1074, 1092] id: 22
    local r1_22 = false
    if r0_22.MenuInf.enabled == true and r0_22.MenuInf.effect == false and r0_22.MenuInf.select_effect == false and r0_22.MenuInf.tips_effect == false and r0_22.MenuInf.tips_wineffect == false and r0_22.buttonEffect.effect_auto == false and r0_22.buttonEffect.effect_skip == false and r0_22.MenuButton ~= nil then
      r1_22 = true
    end
    return r1_22
  end
  function g_MenuMsgWin.MenuKeyDown(r0_23, r1_23, r2_23, r3_23, r4_23)
    -- line: [1095, 1194] id: 23
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
  function g_MenuMsgWin.MenuButtonInit(r0_24)
    -- line: [1198, 1214] id: 24
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
  function g_MenuMsgWin.TipsEffect(r0_25)
    -- line: [1232, 1248] id: 25
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
  function g_MenuMsgWin.TipsEffectEndJob(r0_26)
    -- line: [1250, 1287] id: 26
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
  function g_MenuMsgWin.onResetTips(r0_27)
    -- line: [1289, 1310] id: 27
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
  function g_MenuMsgWin.cancelTipsEffect(r0_28)
    -- line: [1313, 1338] id: 28
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
  function g_MenuMsgWin.SetTipsPos(r0_29)
    -- line: [1341, 1364] id: 29
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
  function g_MenuMsgWin.TipsTxtName(r0_30, r1_30)
    -- line: [1368, 1372] id: 30
    return "SYS_TIPSTXT.pna"
  end
  g_MenuMsgWin.TipsTxtLayer = {
    {
      34,
      70
    }
  }
  function g_MenuMsgWin.MenuInitTips(r0_31, r1_31)
    -- line: [1383, 1405] id: 31
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
  function g_MenuMsgWin.MenuLoadTips(r0_32)
    -- line: [1408, 1422] id: 32
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
  function g_MenuMsgWin.MenuMakeTipsLayer(r0_33)
    -- line: [1425, 1465] id: 33
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
  function g_MenuMsgWin.ActTipsTxt(r0_34)
    -- line: [1468, 1479] id: 34
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
  end
  function g_MenuMsgWin.TipsNextJob(r0_35)
    -- line: [1482, 1490] id: 35
    r0_35.TipsNext = r0_35.TipsNext + 1
    cfunc.LegacyGame__lua_SetVariable(142, r0_35.TipsNext)
    if r0_35.TipsCount > r0_35.TipsNext then
      r0_35:ActTipsTxt()
    end
  end
  function g_MenuMsgWin.startTipsMenu(r0_36)
    -- line: [1493, 1569] id: 36
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
  function g_MenuMsgWin.hideTips(r0_37, r1_37)
    -- line: [1572, 1586] id: 37
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
  function g_MenuMsgWin.windowCloseTips(r0_38)
    -- line: [1589, 1635] id: 38
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
  function g_MenuMsgWin.windowOpenTips(r0_39)
    -- line: [1638, 1677] id: 39
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
  function g_MenuMsgWin.SetTipsCloseCount(r0_40, r1_40)
    -- line: [1681, 1687] id: 40
    g_MenuMsgWin.TipsCloseCount = r1_40
    cfunc.LegacyGame__lua_SetVariable(143, r0_40.TipsCloseCount)
  end
  function g_MenuMsgWin.TipsNextCount(r0_41)
    -- line: [1689, 1702] id: 41
    if r0_41.TipsCloseCount >= 1 then
      r0_41.TipsCloseCount = r0_41.TipsCloseCount - 1
      cfunc.LegacyGame__lua_SetVariable(143, r0_41.TipsCloseCount)
    end
    if r0_41.TipsCloseCount == 0 then
      r0_41:closeTips()
    end
  end
  function g_MenuMsgWin.closeTips(r0_42)
    -- line: [1706, 1747] id: 42
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
  function g_MenuMsgWin.TipsRemoveLayer(r0_43)
    -- line: [1750, 1754] id: 43
    local r1_43 = cclass.lua_Layers:create()
    r1_43:removeLayer("system", "Tips01")
    r1_43:removeLayer("system", "TipsTxt")
  end
  g_MenuMsgWin.SelectType = false
  function g_MenuMsgWin.SelectEffect(r0_44)
    -- line: [1763, 1772] id: 44
    if r0_44.MenuInf.select_effect == true and cclass.lua_Layers:create():isEffect("system", "SelDisp") == false then
      r0_44:SelectEffectEndJob()
      r0_44.MenuInf.select_effect = false
    end
    return r0_44.MenuInf.select_effect
  end
  function g_MenuMsgWin.SelectEffectEndJob(r0_45)
    -- line: [1774, 1810] id: 45
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
  function g_MenuMsgWin.onResetSelect(r0_46)
    -- line: [1813, 1823] id: 46
    if r0_46.MenuInf.select_enabled == true or r0_46.MenuInf.select_effect == true then
      r0_46:cancelSelectEffect()
      r0_46:SelectRemoveLayer()
      r0_46.MenuInf.select_enabled = false
      r0_46.MenuInf.select_effect = false
      r0_46.SelectCount = 0
    end
  end
  function g_MenuMsgWin.GetMapPos(r0_47, r1_47, r2_47)
    -- line: [1826, 1835] id: 47
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
  function g_MenuMsgWin.MenuMakeSelectLayer(r0_48)
    -- line: [1839, 1894] id: 48
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
        r1_48:insertTextLayer("system", r13_48, r9_48, r10_48, 1, 8, 1, 1, 0, 1)
        local r14_48 = g_fonts.name
        local r15_48 = g_fontSize.selectSize
        if getLangPatchFlag() and getAltLanguage() then
          r14_48 = g_fonts2.name
          r15_48 = g_fontSize2.selectSize
        end
        r3_48:add("system", r13_48, r14_48, r15_48, 1, 0, g_selectTextColor.normal, g_selectTextColor.normalEdge)
        g_SelectTextColorState[r7_48] = 0
      end
    end
  end
  function g_MenuMsgWin.SetSelectButPos(r0_49)
    -- line: [1897, 1985] id: 49
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
          r10_49 = SELECT_WINDOW_PITCH / 4
        end
        if r0_49.ActiveSelect[r8_49] == 0 or r0_49.ActiveSelect[r8_49] == 2 then
          local r11_49 = 0
          local r12_49 = 0
          r11_49, r12_49, r13_49, r14_49 = r7_49:getParam("system", r8_49, LUA_PARAM_SIZE, r11_49, r12_49, 0, 0)
          local r15_49 = math.floor((APP_INTERNAL_WIDTH - r11_49) / 2)
          local r16_49 = math.floor(APP_INTERNAL_HEIGHT / 2 - r1_49 * r12_49 / 2 - (r1_49 - 1) * r10_49 / 2 - 100 + r2_49 * r12_49 + r2_49 * r10_49)
          r0_49.SelectButtonData[r8_49]:bt_SetPos(r15_49, r16_49)
          local r17_49 = r15_49 + g_selectTextPos.add_x
          local r18_49 = r16_49 + g_selectTextPos.add_y
          local r19_49 = getUItype()
          if r19_49 == 0 then
            r17_49 = r15_49 + g_selectTextPos2.add_x
            r18_49 = r16_49 + g_selectTextPos2.add_y
          end
          if r19_49 == 1 then
            r17_49 = r15_49 + g_selectTextPos.add_x
            r18_49 = r16_49 + g_selectTextPos.add_y
          end
          if r19_49 == 2 then
            r17_49 = r15_49 + g_selectTextPos2.add_x
            r18_49 = r16_49 + g_selectTextPos2.add_y
          end
          r7_49:setParam("system", r9_49, LUA_PARAM_POS, r17_49, r18_49, 0, 0)
          r2_49 = r2_49 + 1
        end
      end
    end
  end
  function g_MenuMsgWin.SelectRemoveLayer(r0_50)
    -- line: [1988, 2008] id: 50
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
  function g_MenuMsgWin.MakeSelectBut(r0_51)
    -- line: [2012, 2065] id: 51
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
        r0_51:MenuButtonSet(r0_51.SelectButtonData, r5_51, 1, r5_51, 0, 0, 1, -1, 2, r4_51 + 100, 0, 0)
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
  function g_MenuMsgWin.startSelectMenu(r0_52)
    -- line: [2068, 2127] id: 52
    -- notice: unreachable block#7
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
        r1_52:startEffect("system", r10_52, "SelDisp", 0)
        r1_52:startEffect("system", r11_52, "SelDisp", 0)
      end
    end
    r0_52.MenuInf.select_enabled = true
    r0_52.MenuInf.select_effect = true
  end
  function g_MenuMsgWin.closeSelect(r0_53, r1_53)
    -- line: [2130, 2211] id: 53
    -- notice: unreachable block#7
    -- notice: unreachable block#8
    -- notice: unreachable block#9
    local r3_53 = nil	-- notice: implicit variable refs by block#[4, 10]
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
        r4_53:setEffect("system", r11_53, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r3_53, 0, r5_53 * r3_53)
        r4_53:setEffect("system", r12_53, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r3_53, 0, r5_53 * r3_53)
        r4_53:startEffect("system", r11_53, "SelDisp", 0)
        r4_53:startEffect("system", r12_53, "SelDisp", 0)
      end
    end
    r0_53.MenuInf.select_enabled = false
    r0_53.MenuInf.select_effect = true
  end
  function g_MenuMsgWin.cancelSelectEffect(r0_54)
    -- line: [2214, 2263] id: 54
    -- notice: unreachable block#11
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
      end
      return true
    end
    return false
  end
  function g_MenuMsgWin.MapActive(r0_55, r1_55)
    -- line: [2265, 2279] id: 55
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
  function g_MenuMsgWin.hideSelect(r0_56, r1_56)
    -- line: [2283, 2323] id: 56
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
  function g_MenuMsgWin.DisableSelect(r0_57, r1_57)
    -- line: [2326, 2352] id: 57
    -- notice: unreachable block#4
    -- notice: unreachable block#5
    if r0_57.SelectType ~= true then
      local r2_57 = getLocalSelectKey(r1_57 + 1)
      if r0_57.SelectButtonData[r2_57] ~= nil then
        r0_57.SelectButtonData[r2_57]:bt_SetActive(2)
        r0_57.ActiveSelect[r2_57] = 2
      end
    end
  end
  function g_MenuMsgWin.MenuInit(r0_58)
    -- line: [2355, 2402] id: 58
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
    back1 = 2,
    win2 = -1,
    back2 = 5,
    name1 = -1,
    nameback1 = -1,
    name2 = -1,
    nameback2 = -1,
    N_back = -1,
  }
  g_MenuMsgWin.MswPosN = {
    x = 0,
    y = 0,
    move = 0,
  }
  g_MenuMsgWin.MswPos = {
    x = 0,
    y = 520,
    move = 200,
  }
  g_MenuMsgWin.MswPos2 = {
    x = 1147,
    y = 536,
    move = 200,
  }
  g_MenuMsgWin.MswPos3 = {
    x = 0,
    y = 625,
    move = 200,
  }
  function g_MenuMsgWin.changeMessageWindow(r0_59, r1_59, r2_59)
    -- line: [2421, 2656] id: 59
    -- notice: unreachable block#56
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
    r4_59:removeLayer("system", "Msg02")
    r4_59:removeLayer("system", "Msg03")
    local r5_59 = false
    if r3_59 ~= 2 then
      r5_59 = r0_59:MenuLoadLayer("Msg01", "Sys_Msw.pna")
      if r5_59 == false then
        return false
      end
      r5_59 = r0_59:MenuLoadLayer("Msg03", "Sys_Msw3.pna")
      if r5_59 == false then
        return false
      end
      r5_59 = r0_59:MenuLoadLayer("Msg02", "Sys_Msw2.pna")
      if r5_59 == false then
        return false
      end
      r4_59:clearHitTestAll("system", "Msg02")
      r4_59:setVisible("system", "Msg02", 1)
      r4_59:setParam("system", "Msg02", LUA_PARAM_POS, r0_59.MswPos2.x, r0_59.MswPos2.y, 0, 0)
      r4_59:clearHitTestAll("system", "Msg03")
      r4_59:setVisible("system", "Msg03", 1)
      r4_59:setParam("system", "Msg03", LUA_PARAM_POS, r0_59.MswPos3.x, r0_59.MswPos3.y, 0, 0)
      r4_59:initSubLayer("system", "Msg02", 37, 1)
      r4_59:initSubLayer("system", "Msg03", 28, 1)
      r4_59:initSubLayer("system", "Msg03", 29, 1)
      r4_59:setParam("system", "Msg01", LUA_PARAM_POS, r0_59.MswPos.x, r0_59.MswPos.y, 0, 0)
    end
    if r5_59 == false then
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
      r4_59:insertTextLayer("system", "Name01", 740, 33, 100, 4, 4, 4, 0, 0)
      r4_59:setParam("system", "Name01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_59:swapLayerOrder("system", "Msg01", "Auto01")
      r4_59:swapLayerOrder("system", "Msg01", "Skip01")
    else
      r4_59:swapLayerOrder("system", "Msg01", "Auto01")
      r4_59:swapLayerOrder("system", "Msg01", "Skip01")
      r4_59:swapLayerOrder("system", "Msg03", "Auto01")
      r4_59:swapLayerOrder("system", "Msg03", "Skip01")
      r4_59:swapLayerOrder("system", "Msg01", "Name01")
      r4_59:swapLayerOrder("system", "Msg01", "Txt01")
    end
    r4_59:setParam("system", "Name01", LUA_PARAM_POS, g_MSWNamePos.x, g_MSWNamePos.y, 0, 0)
    local r6_59 = cclass.CLegacyFontInfo:create()
    local r7_59 = r4_59:getAnimationState("system", "Clk01", "CL_Wait")
    r4_59:removeLayer("system", "Clk01")
    r0_59:MenuLoadLayer("Clk01", "Sys_ClickWait.pna")
    r4_59:setVisible("system", "Clk01", 1)
    for r11_59 = 0, 65, 1 do
      r4_59:setAnimation("system", "Clk01", "CL_Wait", r11_59, 0.015151515151515152 * r11_59, 0)
    end
    local r8_59 = 0
    if g_messageAlready ~= -1 then
      r8_59 = g_messageAlready
    end
    local r9_59 = {
      [1] = g_message1Color,
      [2] = g_message2Color,
    }
    local r10_59 = {
      [1] = g_name1Color,
      [2] = g_name2Color,
    }
    if r8_59 == 0 then
      r6_59:changeColor("system", "Txt01", r9_59[g_messageWindowType + 1].normal, r9_59[g_messageWindowType + 1].normalEdge)
      r6_59:changeColor("system", "Name01", r10_59[g_messageWindowType + 1].normal, r10_59[g_messageWindowType + 1].normalEdge)
    else
      r6_59:changeColor("system", "Txt01", r9_59[g_messageWindowType + 1].already, r9_59[g_messageWindowType + 1].alreadyEdge)
      r6_59:changeColor("system", "Name01", r10_59[g_messageWindowType + 1].already, r10_59[g_messageWindowType + 1].alreadyEdge)
    end
    g_windowID = r1_59
    if r2_59 == true then
      r4_59:updateTextColor("system", "Txt01")
      r4_59:updateTextColor("system", "Name01")
      if r7_59 == true then
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
  function g_MenuMsgWin.MakeWindowBut(r0_60, r1_60)
    -- line: [2660, 2703] id: 60
    -- notice: unreachable block#1
    r0_60.MenuButton:ResetButtonActive(r0_60.MenuButtonData)
    r0_60.MenuButtonData = {}
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "CLOSE", 1, "Msg02", 16, 16, 9, -1, 23, 6, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "AUTO", 1, "Msg02", 17, 17, 10, -1, 24, 3, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "SKIP", 1, "Msg02", 18, 18, 11, -1, 25, 2, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "REPEAT", 1, "Msg02", 19, 19, 12, -1, 26, 4, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "CONFIG", 1, "Msg02", 20, 20, 13, -1, 27, 1, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "BACKLOG", 1, "Msg03", 14, 14, 7, -1, 21, 5, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "SAVE", 1, "Msg03", 15, 15, 8, -1, 22, 9, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "LOAD", 1, "Msg03", 16, 16, 9, -1, 23, 10, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "QSAVE", 1, "Msg03", 17, 17, 10, -1, 24, 7, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "QLOAD", 1, "Msg03", 18, 18, 11, -1, 25, 8, 0, 0)
    r0_60:MenuButtonSet(r0_60.MenuButtonData, "RtpC", 1, "Msg03", 2, 2, 1, -1, 3, 11, 0, 0)
    r0_60.MenuItem = {}
    local r2_60 = cclass.lua_Layers:create()
    for r7_60, r8_60 in pairs({
      31,
      32,
      33,
      34,
      35
    }) do
      r2_60:initSubLayer("system", "Msg02", r8_60, 0)
    end
  end
  function g_MenuMsgWin.setButtonActive(r0_61)
    -- line: [2708, 2746] id: 61
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
  function g_MenuMsgWin.setButtonState(r0_62)
    -- line: [2748, 2754] id: 62
    if r0_62:GetMenuActive() == true then
      r0_62:setButtonActive()
    end
    r0_62:SetSkipAutoState()
  end
  function g_MenuMsgWin.checkMessageFocus(r0_63, r1_63)
    -- line: [2757, 2806] id: 63
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
  function g_MenuMsgWin.resetMessageWindow(r0_64, r1_64)
    -- line: [2810, 2822] id: 64
    if r1_64 == true then
      if getSystemSet() == "system" then
        cfunc.D3DApp__lua_PostMouseMove()
      end
    else
      r0_64:onResetMessageWindow()
    end
  end
  function g_MenuMsgWin.nameWindowVisible(r0_65, r1_65)
    -- line: [2825, 2902] id: 65
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
  function g_MenuMsgWin.openMessageWindow(r0_66, r1_66)
    -- line: [2907, 2991] id: 66
    local r2_66 = nil	-- notice: implicit variable refs by block#[8, 10, 12]
    if g_windowID >= 0 then
      r2_66 = g_windowID
    elseif g_messageWindowType == 1 then
      r2_66 = 1
      if r2_66 then
        ::label_11::
        r2_66 = 0
      end
    else
      goto label_11	-- block#4 is visited secondly
    end
    local r3_66 = cclass.lua_Layers:create()
    r3_66:cancelEffect("system", "Msg01", "WndDisp")
    r3_66:cancelEffect("system", "Txt01", "WndDisp")
    r3_66:cancelEffect("system", "Msg02", "WndDisp")
    r3_66:cancelEffect("system", "Msg03", "WndDisp")
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
    r3_66:setParam("system", "Msg02", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_66:setEffect("system", "Msg02", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r6_66, 0, 0)
    if r2_66 == 0 then
      r3_66:setParam("system", "Msg02", LUA_PARAM_ROTATE, -90, 0, 90, 0)
      r3_66:setEffect("system", "Msg02", "WndDisp", LUA_EFFECT_ROTATE, 90, 0, -90, 0, 0, r6_66, 0, 0)
    end
    r3_66:startEffect("system", "Msg02", "WndDisp", 0)
    r3_66:setParam("system", "Msg03", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_66:setEffect("system", "Msg03", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r6_66, 0, 0)
    if r2_66 == 0 then
      r3_66:setParam("system", "Msg03", LUA_PARAM_ROTATE, 0, 90, 0, 0)
      r3_66:setEffect("system", "Msg03", "WndDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r6_66, 0, 0)
    end
    r3_66:startEffect("system", "Msg03", "WndDisp", 0)
    r3_66:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_66:setEffect("system", "Txt01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r6_66, 0, 0)
    if r2_66 == 2 then
      r3_66:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPosN.x, g_MSWTxtPosN.y, 0, 0)
    else
      r3_66:setParam("system", "Txt01", LUA_PARAM_POS, g_MSWTxtPos.x, g_MSWTxtPos.y, 0, 0)
    end
    r3_66:startEffect("system", "Txt01", "WndDisp", 0)
    r0_66.MenuInf.enabled = true
    r0_66.MenuInf.effect = true
    r0_66:windowOpenTips()
  end
  function g_MenuMsgWin.closeMessageWindow(r0_67, r1_67)
    -- line: [2994, 3076] id: 67
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
    r5_67:cancelEffect("system", "Msg02", "WndDisp")
    r5_67:cancelEffect("system", "Msg03", "WndDisp")
    r0_67:nameWindowVisible(false)
    r0_67:setButtonActive()
    local r6_67 = 200 * r4_67
    r5_67:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r5_67:setEffect("system", "Msg01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r6_67, 0, 0)
    r5_67:startEffect("system", "Msg01", "WndDisp", 0)
    r5_67:setParam("system", "Msg02", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r5_67:setEffect("system", "Msg02", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r6_67, 0, 0)
    if r2_67 == 0 then
      r5_67:setParam("system", "Msg02", LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r5_67:setEffect("system", "Msg02", "WndDisp", LUA_EFFECT_ROTATE, -90, 0, 90, -1, 0, r6_67, 0, 0)
    end
    r5_67:setParam("system", "Msg02", LUA_PARAM_POS, r0_67.MswPos2.x, r0_67.MswPos2.y, 0, 0)
    r5_67:startEffect("system", "Msg02", "WndDisp", 0)
    r5_67:setParam("system", "Msg03", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r5_67:setEffect("system", "Msg03", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r6_67, 0, 0)
    if r2_67 == 0 then
      r5_67:setParam("system", "Msg03", LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r5_67:setEffect("system", "Msg03", "WndDisp", LUA_EFFECT_ROTATE, 0, 90, 0, -1, 0, r6_67, 0, 0)
    end
    r5_67:setParam("system", "Msg03", LUA_PARAM_POS, r0_67.MswPos3.x, r0_67.MswPos3.y, 0, 0)
    r5_67:startEffect("system", "Msg03", "WndDisp", 0)
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
  end
  function g_MenuMsgWin.hideMessageWindow(r0_68, r1_68)
    -- line: [3080, 3159] id: 68
    local r2_68 = cclass.lua_Layers:create()
    if r2_68:isEffect("system", "Msg01") == true then
      return false
    end
    if g_DisableGestureFlag == true then
      return false
    end
    if r2_68:isEffect("system", "Msg02") == true then
      return false
    end
    if r2_68:isEffect("system", "Msg03") == true then
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
    r2_68:setVisible("system", "Msg02", r6_68)
    r2_68:setVisible("system", "Msg03", r6_68)
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
  function g_MenuMsgWin.startClickWaitAnimation(r0_69)
    -- line: [3163, 3197] id: 69
    -- notice: unreachable block#6
    local r1_69 = cclass.lua_Layers:create()
    if g_windowID == 2 then
      local r2_69 = 0
      local r3_69 = 0
      r2_69, r3_69 = r1_69:getLastTextPos("system", "Txt01", r2_69, r3_69)
      r1_69:setParam("system", "Clk01", LUA_PARAM_POS, r2_69, r3_69 - 45, 0, 0)
    else
      r1_69:setParam("system", "Clk01", LUA_PARAM_POS, r0_69.ClikPos.x, r0_69.ClikPos.y, 0, 0)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
    end
    r1_69:startAnimation("system", "Clk01", "CL_Wait", 2600, -1, 0)
  end
  function g_MenuMsgWin.stopClickWaitAnimation(r0_70)
    -- line: [3200, 3220] id: 70
    -- notice: unreachable block#1
    cclass.lua_Layers:create():stopAnimation("system", "Clk01", "CL_Wait")
  end
  function g_MenuMsgWin.changeMessageWindowOpacity(r0_71)
    -- line: [3223, 3311] id: 71
    -- notice: unreachable block#3
    local r1_71 = cclass.lua_Layers:create()
    local r2_71 = g_messagealpha / 100
    local r3_71 = g_namedisp
    if r3_71 == 1 then
      r3_71 = true
    else
      r3_71 = false
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
      r1_71:setSubLayerVisible("system", "Msg02", 37, 1)
      r1_71:setSubLayerVisible("system", "Msg03", 28, 1)
      r1_71:setSubLayerVisible("system", "Msg03", 29, 1)
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
      r1_71:setSubLayerVisible("system", "Msg02", 37, 0)
      r1_71:setSubLayerVisible("system", "Msg03", 28, 0)
      r1_71:setSubLayerVisible("system", "Msg03", 29, 0)
    end
    if r1_71:isVisible("system", "Auto01") == true then
    end
    if r1_71:isVisible("system", "Skip01") == true then
    end
    if nil and not nil then
      goto label_217	-- block#33 is visited secondly
    end
  end
  function g_MenuMsgWin.onResetMessageWindow(r0_72)
    -- line: [3314, 3377] id: 72
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
      r2_72:cancelEffect("system", "Msg02", "WndDisp")
      r2_72:cancelEffect("system", "Msg03", "WndDisp")
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
    r2_72:setParam("system", "Msg02", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r2_72:setParam("system", "Msg02", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r2_72:setParam("system", "Msg02", LUA_PARAM_POS, r0_72.MswPos2.x, r0_72.MswPos2.y, 0, 0)
    r2_72:setParam("system", "Msg03", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r2_72:setParam("system", "Msg03", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r2_72:setParam("system", "Msg03", LUA_PARAM_POS, r0_72.MswPos3.x, r0_72.MswPos3.y, 0, 0)
    resetSkipIcon()
  end
  function g_MenuMsgWin.ReleaseMessageWindow(r0_73)
    -- line: [3380, 3383] id: 73
    r0_73:onResetMessageWindow()
    r0_73:onResetSelect()
  end
  g_MenuMsgWin.SkipPos = {
    x = 21,
    y = 646,
    move = 0,
  }
  g_MenuMsgWin.AutoPos = {
    x = 21,
    y = 603,
    move = 0,
  }
  g_MenuMsgWin.ClikPos = {
    x = 1063,
    y = 659,
    move = 200,
  }
  function g_MenuMsgWin.resetSkipIcon(r0_74)
    -- line: [3389, 3406] id: 74
    r0_74.buttonEffect.skip = false
    local r1_74 = cclass.lua_Layers:create()
    r1_74:setVisible("system", "Skip01", 0)
    if r0_74.buttonEffect.effect_skip == true then
      r0_74.buttonEffect.effect_skip = false
      r1_74:cancelEffect("system", "Skip01", "SkipDisp")
      r1_74:cancelSubLayerEffect("system", "Skip01", 4, "SkipEffect")
      r1_74:setSubLayerParam("system", "Skip01", 4, LUA_PARAM_SCALE, 1, 1, 1, 0)
      r1_74:cancelSubLayerEffect("system", "Skip01", 2, "SkipEffect")
      r1_74:setSubLayerParam("system", "Skip01", 2, LUA_PARAM_ROTATE, 0, 0, 0, 0)
    end
    return true
  end
  function g_MenuMsgWin.resetAutoIcon(r0_75)
    -- line: [3407, 3423] id: 75
    r0_75.buttonEffect.auto = false
    local r1_75 = cclass.lua_Layers:create()
    r1_75:setVisible("system", "Auto01", 0)
    if r0_75.buttonEffect.effect_auto == true then
      r0_75.buttonEffect.effect_auto = false
      r1_75:cancelEffect("system", "Auto01", "AutoDisp")
      r1_75:cancelSubLayerEffect("system", "Auto01", 4, "AutoEffect")
      r1_75:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_SCALE, 1, 1, 1, 0)
      r1_75:cancelSubLayerEffect("system", "Auto01", 2, "AutoEffect")
      r1_75:setSubLayerParam("system", "Auto01", 2, LUA_PARAM_ROTATE, 0, 0, 0, 0)
    end
    return true
  end
  function g_MenuMsgWin.LoadSkipAutoIcon(r0_76)
    -- line: [3427, 3456] id: 76
    local r1_76 = cclass.lua_Layers:create()
    r0_76:MenuLoadLayer("Skip01", "Sys_Skip.pna")
    r1_76:setVisible("system", "Skip01", 0)
    r1_76:setParam("system", "Skip01", LUA_PARAM_POS, r0_76.SkipPos.x, r0_76.SkipPos.y, 0, 0)
    for r6_76, r7_76 in pairs({
      2,
      3,
      4,
      5,
      7,
      8,
      9,
      10
    }) do
      r1_76:initSubLayer("system", "Skip01", r7_76, 0)
    end
    r0_76:MenuLoadLayer("Auto01", "Sys_Auto.pna")
    r1_76:setVisible("system", "Auto01", 0)
    r1_76:setParam("system", "Auto01", LUA_PARAM_POS, r0_76.AutoPos.x, r0_76.AutoPos.y, 0, 0)
    for r7_76, r8_76 in pairs({
      2,
      3,
      4,
      5,
      7,
      8
    }) do
      r1_76:initSubLayer("system", "Auto01", r8_76, 0)
    end
    if g_messageWindowType == 1 then
    end
  end
  function g_MenuMsgWin.SetSkipAutoState(r0_77)
    -- line: [3460, 3667] id: 77
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
        r4_77:setSubLayerVisible("system", "Skip01", 7, 1)
        r4_77:setSubLayerVisible("system", "Skip01", 8, 0)
      else
        r4_77:setSubLayerVisible("system", "Skip01", 7, 0)
        r4_77:setSubLayerVisible("system", "Skip01", 8, 1)
      end
      if g_selectReleaseSkip then
        r4_77:setSubLayerVisible("system", "Skip01", 9, 1)
        r4_77:setSubLayerVisible("system", "Skip01", 10, 0)
      else
        r4_77:setSubLayerVisible("system", "Skip01", 9, 0)
        r4_77:setSubLayerVisible("system", "Skip01", 10, 1)
      end
      r4_77:setSubLayerVisible("system", "Skip01", 2, 1)
      r4_77:setSubLayerVisible("system", "Skip01", 3, 1)
      r4_77:setSubLayerVisible("system", "Skip01", 4, 1)
      r4_77:setSubLayerVisible("system", "Skip01", 5, 1)
      if r4_77:isVisible("system", "Skip01") == false then
        r4_77:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_77:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r1_77, 0, 0)
        r4_77:setParam("system", "Skip01", LUA_PARAM_POS, r0_77.SkipPos.x, r0_77.SkipPos.y, 0, 0)
        r4_77:setVisible("system", "Skip01", 1)
        r4_77:setParam("system", "Skip01", LUA_PARAM_ROTATE, 0, 90, 0, 0)
        r4_77:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r1_77, 0, 0)
        r4_77:startEffect("system", "Skip01", "SkipDisp", 0)
        r4_77:startEffect("system", "Skip01", "SkipDisp", 0)
        r4_77:cancelSubLayerEffect("system", "Skip01", 4, "SkipEffect")
        r4_77:setSubLayerParam("system", "Skip01", 4, LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_77:setSubLayerParam("system", "Skip01", 4, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r4_77:setSubLayerEffect("system", "Skip01", "SkipEffect", 4, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 500, 0, 0)
        r4_77:setSubLayerEffect("system", "Skip01", "SkipEffect", 4, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 250, 0, 500)
        r4_77:startSubLayerEffect("system", "Skip01", "SkipEffect", 4, -1)
        r4_77:cancelSubLayerEffect("system", "Skip01", 2, "SkipEffect")
        r4_77:setSubLayerParam("system", "Skip01", 2, LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_77:setSubLayerEffect("system", "Skip01", "SkipEffect", 2, LUA_EFFECT_ROTATE, 0, 0, -360, 0, 0, 2000, 0, 0)
        r4_77:startSubLayerEffect("system", "Skip01", "SkipEffect", 2, -1)
        r0_77.buttonEffect.skip = true
        r0_77.buttonEffect.effect_skip = true
      end
    elseif r4_77:isVisible("system", "Skip01") == true and r0_77.buttonEffect.effect_skip == false then
      r4_77:cancelEffect("system", "Skip01", "SkipDisp")
      r4_77:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_77:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r1_77, 0, 0)
      r4_77:setParam("system", "Skip01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r4_77:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_77, 0, 0)
      r4_77:startEffect("system", "Skip01", "SkipDisp", 0)
      r0_77.buttonEffect.skip = false
      r0_77.buttonEffect.effect_skip = true
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGAUTO) and r0_77.MenuInf.enabled == true then
      if g_selectReleaseAuto then
        r4_77:setSubLayerVisible("system", "Auto01", 8, 1)
        r4_77:setSubLayerVisible("system", "Auto01", 7, 0)
      else
        r4_77:setSubLayerVisible("system", "Auto01", 8, 0)
        r4_77:setSubLayerVisible("system", "Auto01", 7, 1)
      end
      r4_77:setSubLayerVisible("system", "Auto01", 2, 1)
      r4_77:setSubLayerVisible("system", "Auto01", 3, 1)
      r4_77:setSubLayerVisible("system", "Auto01", 4, 1)
      r4_77:setSubLayerVisible("system", "Auto01", 5, 1)
      if r4_77:isVisible("system", "Auto01") == false then
        r4_77:setVisible("system", "Auto01", 1)
        r4_77:setParam("system", "Auto01", LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_77:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r1_77, 0, 0)
        r4_77:setParam("system", "Auto01", LUA_PARAM_POS, r0_77.AutoPos.x, r0_77.AutoPos.y, 0, 0)
        r4_77:setParam("system", "Auto01", LUA_PARAM_ROTATE, 0, 90, 0, 0)
        r4_77:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r1_77, 0, 0)
        r4_77:startEffect("system", "Auto01", "AutoDisp", 0)
        r4_77:cancelSubLayerEffect("system", "Auto01", 4, "AutoEffect")
        r4_77:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_77:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r4_77:setSubLayerEffect("system", "Auto01", "AutoEffect", 4, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 500, 0, 0)
        r4_77:setSubLayerEffect("system", "Auto01", "AutoEffect", 4, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 250, 0, 500)
        r4_77:startSubLayerEffect("system", "Auto01", "AutoEffect", 4, -1)
        r4_77:cancelSubLayerEffect("system", "Auto01", 2, "AutoEffect")
        r4_77:setSubLayerParam("system", "Auto01", 2, LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_77:setSubLayerParam("system", "Auto01", 2, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r4_77:setSubLayerEffect("system", "Auto01", "AutoEffect", 2, LUA_EFFECT_ROTATE, 0, 0, -360, 0, 0, 2000, 0, 0)
        r4_77:startSubLayerEffect("system", "Auto01", "AutoEffect", 2, -1)
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
  function g_MenuMsgWin.IconEffect(r0_78)
    -- line: [3670, 3691] id: 78
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
  r1_16:add("overlay")
  r1_16:setOverlaySet("overlay")
  local r2_16 = getUItype()
  if r2_16 == 0 then
    if g_UseArrowViewBase then
      r1_16:insertLayer("overlay", "ArrowView", LUA_LAYER_PNA, getGraphicsArcFileName("overlay", "Sys_ArrowView.pna"), "Sys_ArrowView.pna", 0)
    end
    r1_16:insertLayer("overlay", "Arrow", LUA_LAYER_PNA, getGraphicsArcFileName("overlay", "Sys_Arrow.pna"), "Sys_Arrow.pna", 0)
  end
  if r2_16 == 1 then
    if g_UseArrowViewBase then
      r1_16:insertLayer("overlay", "ArrowView", LUA_LAYER_PNA, getGraphicsArcFileName("overlay", "Sys_ArrowView.pna"), "Sys_ArrowView.pna", 0)
    end
    r1_16:insertLayer("overlay", "Arrow", LUA_LAYER_PNA, getGraphicsArcFileName("overlay", "Sys_Arrow.pna"), "Sys_Arrow.pna", 0)
  end
  if r2_16 == 2 then
  end
  local r3_16 = 0
  local r4_16 = 0
  local r5_16 = 0
  local r6_16 = 0
  r3_16, r4_16, r5_16, r6_16 = r1_16:getParam("overlay", "Arrow", LUA_PARAM_SIZE, 0, 0, 0, 0)
  local r7_16 = math.floor((1280 - r3_16) / 2)
  local r8_16 = math.floor((720 - r4_16) / 2) - 100
  r1_16:setParam("overlay", "Arrow", LUA_PARAM_POS, r7_16, r8_16, 0, 0)
  for r12_16 = 0, g_ArrowMax - 1, 1 do
    r1_16:initSubLayer("overlay", "Arrow", 14 - r12_16, 0)
    r1_16:initSubLayer("overlay", "Arrow", 30 - r12_16, 0)
  end
  if g_UseArrowViewBase then
    local r9_16 = 0
    local r10_16 = 0
    local r11_16 = 0
    local r12_16 = 0
    r9_16, r10_16, r11_16, r12_16 = r1_16:getParam("overlay", "ArrowView", LUA_PARAM_SIZE, 0, 0, 0, 0)
    local r13_16 = math.floor((1280 - r9_16) / 2)
    local r14_16 = math.floor((720 - r10_16) / 2) - 100
    r1_16:setParam("overlay", "ArrowView", LUA_PARAM_POS, r13_16, r14_16, 0, 0)
    r1_16:initSubLayer("overlay", "ArrowView", 0, 0)
    r1_16:initSubLayer("overlay", "ArrowView", 1, 0)
    r1_16:initSubLayer("overlay", "ArrowView", 2, 0)
    r1_16:initSubLayer("overlay", "ArrowView", 3, 0)
    r9_16, r10_16, r11_16, r12_16 = r1_16:getSubLayerParam("overlay", "ArrowView", 0, LUA_PARAM_POS, 0, 0, 0, 0)
    g_ArrowViewPos[1].x = r13_16 - r7_16 + r9_16
    g_ArrowViewPos[1].y = r14_16 - r8_16 + r10_16
    r9_16, r10_16, r11_16, r12_16 = r1_16:getSubLayerParam("overlay", "ArrowView", 1, LUA_PARAM_POS, 0, 0, 0, 0)
    g_ArrowViewPos[2].x = r13_16 - r7_16 + r9_16
    g_ArrowViewPos[2].y = r14_16 - r8_16 + r10_16
    r9_16, r10_16, r11_16, r12_16 = r1_16:getSubLayerParam("overlay", "ArrowView", 2, LUA_PARAM_POS, 0, 0, 0, 0)
    g_ArrowViewPos[3].x = r13_16 - r7_16 + r9_16
    g_ArrowViewPos[3].y = r14_16 - r8_16 + r10_16
    r9_16, r10_16, r11_16, r12_16 = r1_16:getSubLayerParam("overlay", "ArrowView", 3, LUA_PARAM_POS, 0, 0, 0, 0)
    g_ArrowViewPos[4].x = r13_16 - r7_16 + r9_16
    g_ArrowViewPos[4].y = r14_16 - r8_16 + r10_16
    r1_16:initSubLayer("overlay", "ArrowView", 4, 1)
  end
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
function checkOverlayFunction(r0_79)
  -- line: [3825, 3966] id: 79
  if r0_79 == 0 then
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
  elseif r0_79 == 1 then
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) == false and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
      return false
    end
    return true
  elseif r0_79 ~= 10 and r0_79 ~= 11 then
    if r0_79 == 12 then
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
      if r0_79 == 3 then
        return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOG)
      elseif r0_79 == 6 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLEQLOAD) == false) then
        return false
      elseif r0_79 == 5 then
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
          return false
        end
      elseif r0_79 == 4 then
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
          return false
        end
      elseif r0_79 == 8 then
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
          return false
        end
      elseif r0_79 == 7 then
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
          return false
        end
      elseif r0_79 == 13 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLESELECTLOAD) == false) then
        return false
      end
    end
  end
  return true
end
function getLongPressTime()
  -- line: [3971, 3973] id: 80
  return 300
end
function updateOverlay(r0_81, r1_81, r2_81)
  -- line: [3976, 4146] id: 81
  -- notice: unreachable block#21
  -- notice: unreachable block#22
  -- notice: unreachable block#61
  -- notice: unreachable block#64
  -- notice: unreachable block#62
  -- notice: unreachable block#18
  -- notice: unreachable block#19
  -- notice: unreachable block#23
  -- notice: unreachable block#28
  -- notice: unreachable block#27
  -- notice: unreachable block#16
  -- notice: unreachable block#24
  -- notice: unreachable block#29
  -- notice: unreachable block#11
  -- notice: unreachable block#13
  -- notice: unreachable block#14
  -- notice: unreachable block#17
  -- notice: unreachable block#25
  -- notice: unreachable block#59
  -- notice: unreachable block#9
  -- notice: unreachable block#60
  -- notice: unreachable block#10
  -- notice: unreachable block#6
  -- notice: unreachable block#15
  -- notice: unreachable block#12
  -- notice: unreachable block#58
  -- notice: unreachable block#63
  -- notice: unreachable block#5
  -- notice: unreachable block#8
  -- notice: unreachable block#56
  -- notice: unreachable block#20
  -- notice: unreachable block#57
  -- notice: unreachable block#26
  -- notice: unreachable block#7
  if getSystemSet() ~= "system" then
    r1_81 = false
  end
  local r4_81 = cclass.lua_Layers:create()
  if r1_81 == false then
    if getLongPressTime() < r2_81 then
      for r8_81 = 0, g_ArrowMax - 1, 1 do
        local r9_81 = false
        local r10_81 = 14 - r8_81
        local r11_81 = 30 - r8_81
        for r15_81 = 1, 4, 1 do
          if r8_81 == g_gestureFunc[r15_81] then
            if r15_81 == 1 then
              r4_81:setSubLayerParam("overlay", "Arrow", r10_81, LUA_PARAM_POS, g_ArrowViewPos[1].x, g_ArrowViewPos[1].y, 0, 0)
              r4_81:setSubLayerParam("overlay", "Arrow", r11_81, LUA_PARAM_POS, g_ArrowViewPos[1].x, g_ArrowViewPos[1].y, 0, 0)
            elseif r15_81 == 2 then
              r4_81:setSubLayerParam("overlay", "Arrow", r10_81, LUA_PARAM_POS, g_ArrowViewPos[2].x, g_ArrowViewPos[2].y, 0, 0)
              r4_81:setSubLayerParam("overlay", "Arrow", r11_81, LUA_PARAM_POS, g_ArrowViewPos[2].x, g_ArrowViewPos[2].y, 0, 0)
            elseif r15_81 == 3 then
              r4_81:setSubLayerParam("overlay", "Arrow", r10_81, LUA_PARAM_POS, g_ArrowViewPos[3].x, g_ArrowViewPos[3].y, 0, 0)
              r4_81:setSubLayerParam("overlay", "Arrow", r11_81, LUA_PARAM_POS, g_ArrowViewPos[3].x, g_ArrowViewPos[3].y, 0, 0)
            elseif r15_81 == 4 then
              r4_81:setSubLayerParam("overlay", "Arrow", r10_81, LUA_PARAM_POS, g_ArrowViewPos[4].x, g_ArrowViewPos[4].y, 0, 0)
              r4_81:setSubLayerParam("overlay", "Arrow", r11_81, LUA_PARAM_POS, g_ArrowViewPos[4].x, g_ArrowViewPos[4].y, 0, 0)
            end
            r9_81 = true
            break
          end
        end
        if r9_81 then
          if checkOverlayFunction(r8_81) then
            r4_81:setSubLayerVisible("overlay", "Arrow", r10_81, 1)
            r4_81:setSubLayerVisible("overlay", "Arrow", r11_81, 0)
          else
            r4_81:setSubLayerVisible("overlay", "Arrow", r10_81, 0)
            r4_81:setSubLayerVisible("overlay", "Arrow", r11_81, 1)
          end
        else
          r4_81:setSubLayerVisible("overlay", "Arrow", r10_81, 0)
          r4_81:setSubLayerVisible("overlay", "Arrow", r11_81, 0)
        end
      end
      r4_81:setVisible("overlay", "Arrow", 1)
      if g_UseArrowViewBase then
        r4_81:setVisible("overlay", "ArrowView", 1)
      end
    else
      r4_81:setVisible("overlay", "Arrow", 0)
      if g_UseArrowViewBase then
        r4_81:setVisible("overlay", "ArrowView", 0)
      end
    end
  else
    r4_81:setVisible("overlay", "Arrow", 1)
    if g_UseArrowViewBase then
      r4_81:setVisible("overlay", "ArrowView", 0)
    end
    for r8_81 = 0, g_ArrowMax - 1, 1 do
      r4_81:setSubLayerVisible("overlay", "Arrow", 14 - r8_81, 0)
      r4_81:setSubLayerVisible("overlay", "Arrow", 30 - r8_81, 0)
      r4_81:setSubLayerParam("overlay", "Arrow", 14 - r8_81, LUA_PARAM_POS, 0, 0, 0, 0)
      r4_81:setSubLayerParam("overlay", "Arrow", 30 - r8_81, LUA_PARAM_POS, 0, 0, 0, 0)
    end
    local r5_81 = g_gestureFunc[r0_81 + 1]
    if checkOverlayFunction(r5_81) == false then
      r4_81:setSubLayerVisible("overlay", "Arrow", 30 - r5_81, 1)
    else
      r4_81:setSubLayerVisible("overlay", "Arrow", 14 - r5_81, 1)
    end
  end
end
function getSystemSet()
  -- line: [4154, 4171] id: 82
  if g_confirmDialog > 0 then
    return "dialog"
  elseif g_cmdLineInfo.enabled == true or g_cmdLineInfo.effect == true then
    return "cmdLine"
  end
  for r3_82, r4_82 in pairs(g_Menu) do
    if r4_82.ptr ~= nil and r4_82.ptr:GetMenuActive() == true then
      return r4_82.ptr.MenuInf.SetName
    end
  end
  return "system"
end
function getMessageWindowKey(r0_83)
  -- line: [4174, 4177] id: 83
  return "system", "Txt01"
end
function getNameWindowKey(r0_84)
  -- line: [4179, 4185] id: 84
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin.MenuInf.nameWindow = 1
  end
  return "system", "Name01"
end
function getMessageWindowState()
  -- line: [4187, 4192] id: 85
  if g_MenuMsgWin ~= nil and g_MenuMsgWin.MenuInf.nameWindow == 1 then
    return g_namedisp, g_MenuMsgWin.MenuInf.nameWindow, g_MenuMsgWin.MenuInf.msgWindow, "system", "Name01"
  end
end
function setMessageWindowState(r0_86, r1_86)
  -- line: [4194, 4200] id: 86
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin.MenuInf.nameWindow = r0_86
    g_MenuMsgWin.MenuInf.msgWindow = r1_86
  end
end
function nameWindowVisible(r0_87)
  -- line: [4203, 4209] id: 87
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:nameWindowVisible(r0_87)
  end
end
function openMessageWindowWoEffect()
  -- line: [4212, 4230] id: 88
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
function openMessageWindow(r0_89)
  -- line: [4232, 4237] id: 89
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:openMessageWindow(r0_89)
  end
end
function closeMessageWindow(r0_90)
  -- line: [4239, 4244] id: 90
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:closeMessageWindow(r0_90)
  end
end
function resetMessageWindow(r0_91)
  -- line: [4246, 4250] id: 91
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:resetMessageWindow(r0_91)
  end
end
function isMessageWindowEffect()
  -- line: [4252, 4263] id: 92
  if g_MenuMsgWin ~= nil then
    local r0_92 = g_MenuMsgWin:MenuEffect()
    if nil and not nil then
      goto label_8	-- block#2 is visited secondly
    end
    return r0_92
  end
  return false
end
function hideMessageWindow(r0_93)
  -- line: [4266, 4272] id: 93
  if g_MenuMsgWin ~= nil then
    return g_MenuMsgWin:hideMessageWindow(r0_93)
  end
  return true
end
function startClickWaitAnimation()
  -- line: [4274, 4279] id: 94
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:startClickWaitAnimation()
  end
end
function stopClickWaitAnimation()
  -- line: [4281, 4287] id: 95
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:stopClickWaitAnimation()
    g_MenuMsgWin:TipsNextCount()
  end
end
function getDefaultFont()
  -- line: [4289, 4301] id: 96
  local r0_96 = getGameEngineVersion()
  if getLangPatchFlag() then
    if getAltLanguage() then
      return g_fonts2.name
    else
      return g_fonts.name
    end
  else
    return g_fonts.name
  end
end
function getAltLanguage()
  -- line: [4303, 4305] id: 97
  return g_altLanguage
end
function LoadGameFont()
  -- line: [4308, 4322] id: 98
  local r0_98 = cclass.CLegacyFontInfo:create()
  if 1.4 <= getGameEngineVersion() and g_fonts ~= nil then
    if g_fonts.file ~= nil and g_fonts.name ~= nil then
      local r2_98 = r0_98:extention("Fonts.arc", g_fonts.file, g_fonts.name, g_fonts.CharSet)
    end
    if getLangPatchFlag() and g_fonts2.file ~= nil and g_fonts2.name ~= nil then
      local r2_98 = r0_98:extention("Fonts.arc", g_fonts2.file, g_fonts2.name, g_fonts2.CharSet)
    end
  end
end
function initFontInformation()
  -- line: [4324, 4360] id: 99
  local r0_99 = cclass.CLegacyFontInfo:create()
  r0_99:remove("system", "Name01")
  r0_99:remove("system", "Txt01")
  r0_99:remove("messageLog", "LogText01")
  r0_99:remove("dialog", "inputLine")
  r0_99:remove("cmdLine", "inputLine")
  local r1_99 = g_fonts.name
  r0_99:add("system", "Name01", r1_99, g_fontSize.NameSize, 1, 0, g_name1Color.normal, g_name1Color.normalEdge)
  r0_99:add("system", "Txt01", r1_99, g_fontSize.MsgSize, 1, 0, g_message1Color.normal, g_message1Color.normalEdge)
  r0_99:add("messageLog", "LogText01", r1_99, g_fontSize.LogSize, 1, 0, g_logTextColor.normal, g_logTextColor.normalEdge)
  r0_99:add("cmdLine", "inputLine", r1_99, g_fontSize.inputSize, 1, 0, g_message1Color.normal, g_message1Color.normalEdge)
  if getLangPatchFlag() and g_fonts2.name ~= nil then
    r1_99 = g_fonts2.name
    r0_99:add("system", "Name01", r1_99, g_fontSize2.NameSize, 1, 0, g_name1Color.normal, g_name1Color.normalEdge)
    r0_99:add("system", "Txt01", r1_99, g_fontSize2.MsgSize, 1, 0, g_message1Color.normal, g_message1Color.normalEdge)
    r0_99:add("messageLog", "LogText01", r1_99, g_fontSize2.LogSize, 1, 0, g_logTextColor.normal, g_logTextColor.normalEdge)
    r0_99:add("cmdLine", "inputLine", r1_99, g_fontSize2.inputSize, 1, 0, g_message1Color.normal, g_message1Color.normalEdge)
  end
end
function getAllSkip()
  -- line: [4363, 4366] id: 100
  return g_allskip
end
function getSelectReleaseSkip()
  -- line: [4369, 4372] id: 101
  return g_selectReleaseSkip
end
function getSelectReleaseAuto()
  -- line: [4375, 4378] id: 102
  return g_selectReleaseAuto
end
function getEffectSpeed()
  -- line: [4381, 4384] id: 103
  return g_effectSpeed
end
function getUseBGMCut()
  -- line: [4387, 4390] id: 104
  return g_bgmCutPer
end
function getEffectRate()
  -- line: [4393, 4402] id: 105
  local r0_105 = 1
  local r1_105 = getEffectSpeed()
  if r1_105 == 2 then
    r0_105 = LUA_SKIPSPEED_NONE
  elseif r1_105 == 1 then
    r0_105 = LUA_SKIPSPEED_OMIT
  end
  return r0_105
end
function getSoundIndex(r0_106)
  -- line: [4405, 4416] id: 106
  for r4_106, r5_106 in pairs(g_volume) do
    local r6_106 = nil
    local r7_106 = nil
    r6_106, r7_106 = string.find(string.lower(r0_106), string.lower(r5_106.name))
    if r6_106 == 1 then
      return r4_106
    end
  end
  return 0
end
function checkOtherVoice(r0_107)
  -- line: [4418, 4436] id: 107
  for r4_107 = 1, #g_charKeysOtherM, 1 do
    local r5_107 = nil
    local r6_107 = nil
    r5_107, r6_107 = string.find(string.lower(r0_107), string.lower(g_charKeysOtherM[r4_107]))
    if r5_107 ~= nil then
      return 1
    end
  end
  for r4_107 = 1, #g_charKeysOtherF, 1 do
    local r5_107 = nil
    local r6_107 = nil
    r5_107, r6_107 = string.find(string.lower(r0_107), string.lower(g_charKeysOtherF[r4_107]))
    if r5_107 ~= nil then
      return 2
    end
  end
  return 0
end
function checkBgvKey(r0_108)
  -- line: [4439, 4444] id: 108
  return g_BgvKeyToVolkey[r0_108]
end
function getSoundVolume(r0_109)
  -- line: [4447, 4527] id: 109
  local r1_109 = checkOtherVoice(r0_109)
  if r1_109 == 1 then
    r0_109 = "charOtherM"
  elseif r1_109 == 2 then
    r0_109 = "charOtherF"
  end
  if r0_109 == "ConfTestVoice" then
    return g_ConfigVoiceVolume
  end
  if r0_109 == "charTestVoice" then
    return g_ConfigVoiceVolume
  end
  if r0_109 == "ConfTestSE" then
    return g_ConfigSeVolume
  end
  local r2_109 = checkBgvKey(r0_109)
  local r3_109 = getBGVAllKey()
  local r4_109 = 1
  if r2_109 ~= nil then
    r0_109 = r2_109
    for r8_109, r9_109 in pairs(g_volume) do
      if r9_109.name == r3_109 then
        r4_109 = r9_109.vol / 1000
        break
      end
    end
  end
  local r5_109 = false
  local r6_109 = 0
  if r0_109 == "systemVoice" then
    r0_109 = "char"
  end
  for r10_109, r11_109 in pairs(g_volume) do
    local r12_109 = nil
    local r13_109 = nil
    r12_109, r13_109 = string.find(string.lower(r0_109), string.lower(r11_109.name))
    if r12_109 ~= nil and r12_109 == 1 then
      local r14_109 = math.floor(r11_109.vol * r4_109)
      if r11_109.mute == true then
        r14_109 = 0
      end
      if r11_109.name == getVoiceAllKey() then
        r5_109 = true
        r6_109 = r14_109
      else
        return r14_109
      end
    end
  end
  if r5_109 == true then
    return r6_109
  end
  return 0
end
function getMessageSpeed()
  -- line: [4530, 4536] id: 110
  return math.floor(350 - 350 * g_msgspeed / 100)
end
function getAutoWaitTime()
  -- line: [4539, 4543] id: 111
  return g_autospeed * 2
end
function getVoiceAllKey()
  -- line: [4548, 4551] id: 112
  return "char"
end
function getBGVAllKey()
  -- line: [4554, 4557] id: 113
  return "bgv"
end
function getBGMAllKey()
  -- line: [4560, 4563] id: 114
  return "bgm"
end
function getBGVCharKey(r0_115)
  -- line: [4566, 4578] id: 115
  key = checkBgvKey(r0_115)
  if key == nil then
    return getBGVAllKey()
  end
  return key
end
function getMouseAutoMove()
  -- line: [4581, 4584] id: 116
  return g_mouseAutoMove
end
function getHideCursor()
  -- line: [4587, 4597] id: 117
  local r0_117 = 0
  if g_hideCursorOn == true then
    r0_117 = g_hideCursor
  else
    r0_117 = 2
  end
  return r0_117
end
function getClickVoice()
  -- line: [4600, 4603] id: 118
  return g_clickVoice
end
function getEnablePan()
  -- line: [4606, 4609] id: 119
  return g_enablePan
end
function getBGVVoiceMute()
  -- line: [4612, 4617] id: 120
  return g_bgvVoiceMute
end
function getDeactiveMode()
  -- line: [4620, 4623] id: 121
  return g_deactiveMode
end
function isGesture(r0_122)
  -- line: [4626, 4654] id: 122
  if g_gestureDisable then
    return false
  end
  if g_DisableGestureFlag == true then
    return false
  end
  local r1_122 = cclass.lua_AutoCursor:new()
  local r2_122 = r1_122:IsMove()
  r1_122:delete()
  if r2_122 then
    return false
  end
  if r0_122 == "system" then
    return true
  end
  return false
end
function onGesture(r0_123, r1_123, r2_123, r3_123, r4_123, r5_123)
  -- line: [4657, 4710] id: 123
  if r0_123 == "system" then
    local r6_123 = g_gestureFunc[r2_123 + 1]
    if checkOverlayFunction(r6_123) == false then
      return 
    end
    if r6_123 == 0 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
    elseif r6_123 == 1 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGCTRLSKIP)
    elseif r6_123 == 2 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGAUTO)
    elseif r6_123 == 3 then
      openMessageLog()
    elseif r6_123 == 4 then
      openConfig(0, false)
    elseif r6_123 == 5 then
      local r8_123 = cclass.lua_Sounds:new()
      r8_123:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.qsave), g_SysSEName.qsave, getSoundVolume("systemse"))
      r8_123:delete()
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
    elseif r6_123 == 6 then
      openConfirm(LUA_CONFIRM_QUICKLOAD)
    elseif r6_123 == 7 then
      openConfig(4, false)
    elseif r6_123 == 8 then
      openConfig(5, false)
    elseif r6_123 == 9 then
      openConfirm(LUA_CONFIRM_TITLE)
    elseif r6_123 == 10 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_MINIMIZED, 0)
    elseif r6_123 == 11 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SCREENMODE, 0)
    elseif r6_123 == 12 then
      local r8_123 = nil
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        r8_123 = 0
      else
        r8_123 = 1
      end
      if hideMessageWindow(r8_123) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGHIDE)
      end
    elseif r6_123 == 13 then
      openConfirm(LUA_CONFIRM_SELECTLOAD)
    elseif r6_123 == 14 then
    end
  end
end
function onLButtonDown(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124)
  -- line: [4718, 4735] id: 124
  if r0_124 == "system" then
    onLButtonDownMessageWindow(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124)
  elseif r0_124 == "dialog" then
    onLButtonDownDialog(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124)
  else
    for r9_124, r10_124 in pairs(g_Menu) do
      if r10_124.ptr ~= nil and r0_124 == r10_124.ptr.MenuInf.SetName then
        r10_124.ptr:MenuLButtonDown(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124)
        break
      end
    end
  end
end
function onLButtonUp(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
  -- line: [4738, 4755] id: 125
  if r0_125 == "system" then
    onLButtonUpMessageWindow(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
  elseif r0_125 == "dialog" then
    onLButtonUpDialog(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
  else
    for r9_125, r10_125 in pairs(g_Menu) do
      if r10_125.ptr ~= nil and r0_125 == r10_125.ptr.MenuInf.SetName then
        r10_125.ptr:MenuLButtonUp(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
        break
      end
    end
  end
end
function onRButtonUp(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
  -- line: [4759, 4776] id: 126
  if r0_126 == "system" then
    onRButtonDownMessageWindow(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
  elseif r0_126 == "dialog" then
    onRButtonUpDialog(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
  else
    for r9_126, r10_126 in pairs(g_Menu) do
      if r10_126.ptr ~= nil and r0_126 == r10_126.ptr.MenuInf.SetName then
        r10_126.ptr:MenuRButtonUp(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
        break
      end
    end
  end
end
function onMButtonDown(r0_127, r1_127, r2_127, r3_127, r4_127, r5_127)
  -- line: [4779, 4792] id: 127
  if r0_127 ~= "system" then
    for r9_127, r10_127 in pairs(g_Menu) do
      if r10_127.ptr ~= nil and r0_127 == r10_127.ptr.MenuInf.SetName then
        r10_127.ptr:MenuMButtonDown(r0_127, r1_127, r2_127, r3_127, r4_127, r5_127)
        break
      end
    end
  end
end
function onMButtonUp(r0_128, r1_128, r2_128, r3_128, r4_128, r5_128)
  -- line: [4795, 4807] id: 128
  if r0_128 ~= "system" then
    for r9_128, r10_128 in pairs(g_Menu) do
      if r10_128.ptr ~= nil and r0_128 == r10_128.ptr.MenuInf.SetName then
        r10_128.ptr:MenuMButtonUp(r0_128, r1_128, r2_128, r3_128, r4_128, r5_128)
        break
      end
    end
  end
end
function onX1ButtonDown(r0_129, r1_129, r2_129, r3_129, r4_129, r5_129)
  -- line: [4811, 4825] id: 129
  if r0_129 ~= "system" and r0_129 ~= "dialog" then
    for r9_129, r10_129 in pairs(g_Menu) do
      if r10_129.ptr ~= nil and r0_129 == r10_129.ptr.MenuInf.SetName then
        r10_129.ptr:MenuX1ButtonDown(r0_129, r1_129, r2_129, r3_129, r4_129, r5_129)
        break
      end
    end
  end
end
function onX1ButtonUp(r0_130, r1_130, r2_130, r3_130, r4_130, r5_130)
  -- line: [4828, 4842] id: 130
  if r0_130 ~= "system" and r0_130 ~= "dialog" then
    for r9_130, r10_130 in pairs(g_Menu) do
      if r10_130.ptr ~= nil and r0_130 == r10_130.ptr.MenuInf.SetName then
        r10_130.ptr:MenuX1ButtonUp(r0_130, r1_130, r2_130, r3_130, r4_130, r5_130)
        break
      end
    end
  end
end
function onX2ButtonDown(r0_131, r1_131, r2_131, r3_131, r4_131, r5_131)
  -- line: [4845, 4859] id: 131
  if r0_131 ~= "system" and r0_131 ~= "dialog" then
    for r9_131, r10_131 in pairs(g_Menu) do
      if r10_131.ptr ~= nil and r0_131 == r10_131.ptr.MenuInf.SetName then
        r10_131.ptr:MenuX2ButtonDown(r0_131, r1_131, r2_131, r3_131, r4_131, r5_131)
        break
      end
    end
  end
end
function onX2ButtonUp(r0_132, r1_132, r2_132, r3_132, r4_132, r5_132)
  -- line: [4862, 4876] id: 132
  if r0_132 ~= "system" and r0_132 ~= "dialog" then
    for r9_132, r10_132 in pairs(g_Menu) do
      if r10_132.ptr ~= nil and r0_132 == r10_132.ptr.MenuInf.SetName then
        r10_132.ptr:MenuX2ButtonUp(r0_132, r1_132, r2_132, r3_132, r4_132, r5_132)
        break
      end
    end
  end
end
function onMouseMove(r0_133, r1_133, r2_133, r3_133, r4_133, r5_133)
  -- line: [4879, 4899] id: 133
  if r0_133 == "system" then
    onMouseMoveMessageWindow(r0_133, r1_133, r2_133, r3_133, r4_133, r5_133)
  elseif r0_133 == "dialog" then
    onMouseMoveDialog(r0_133, r1_133, r2_133, r3_133, r4_133, r5_133)
  else
    for r9_133, r10_133 in pairs(g_Menu) do
      if r10_133.ptr ~= nil and r0_133 == r10_133.ptr.MenuInf.SetName then
        r10_133.ptr:MenuMouseMove(r0_133, r1_133, r2_133, r3_133, r4_133, r5_133)
        break
      end
    end
  end
end
function onMouseWheel(r0_134, r1_134)
  -- line: [4902, 4918] id: 134
  if r0_134 ~= "system" and r0_134 ~= "dialog" then
    for r5_134, r6_134 in pairs(g_Menu) do
      if r6_134.ptr ~= nil and r0_134 == r6_134.ptr.MenuInf.SetName then
        r6_134.ptr:MenuMouseWheel(r0_134, r1_134)
        break
      end
    end
  end
end
function onKeyDown(r0_135, r1_135, r2_135, r3_135)
  -- line: [4921, 4935] id: 135
  if r0_135 == "system" then
    onKeyDownMessageWindow(r0_135, r1_135, r2_135, r3_135)
  elseif r0_135 == "dialog" then
    onKeyDownDialog(r0_135, r1_135, r2_135, r3_135)
  else
    for r7_135, r8_135 in pairs(g_Menu) do
      if r8_135.ptr ~= nil and r0_135 == r8_135.ptr.MenuInf.SetName then
        r8_135.ptr:MenuKeyDown(r0_135, r1_135, r2_135, r3_135)
      end
    end
  end
end
function onIMEnd(r0_136, r1_136, r2_136)
  -- line: [4948, 4961] id: 136
  if r0_136 == "cmdLine" then
    if r2_136 == false then
      cfunc.LegacyGame__lua_SetString("@FIRST", r1_136, false)
      cfunc.LegacyGame__lua_SetString("@FIRST", r1_136, true)
    end
    local r3_136 = cclass.lua_Layers:create()
    r3_136:removeLayer("cmdLine", "inputLine")
    r3_136:removeLayer("cmdLine", "CmdLine01")
    g_cmdLineInfo.enabled = false
    g_cmdLineInfo.effect = false
  end
end
function faceRead(r0_137)
  -- line: [4965, 4980] id: 137
  local r1_137 = cclass.lua_Layers:create()
  if string.lower(r0_137) == ".png" then
    r1_137:removeLayer("system", "MsgFace")
    return true
  else
    local r3_137 = r1_137:insertLayer("system", "MsgFace", LUA_LAYER_STD, getGraphicsArcFileName("system", r0_137), r0_137, 1)
    r1_137:setParam("system", "MsgFace", LUA_PARAM_POS, 89, 511, 0, 0)
    return r3_137
  end
end
function getTipsFocus()
  -- line: [4983, 4985] id: 138
  return g_TipsPos.flag
end
function onTipsClick(r0_139)
  -- line: [4986, 4996] id: 139
end
function onMouseMoveMessageWindow(r0_140, r1_140, r2_140, r3_140, r4_140, r5_140)
  -- line: [5002, 5008] id: 140
  if g_MenuMsgWin ~= nil and r0_140 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuMouseMove(r0_140, r1_140, r2_140, r3_140, r4_140, r5_140)
  end
end
function onLButtonDownMessageWindow(r0_141, r1_141, r2_141, r3_141, r4_141, r5_141)
  -- line: [5011, 5015] id: 141
  if g_MenuMsgWin ~= nil and r0_141 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuLButtonDown(r0_141, r1_141, r2_141, r3_141, r4_141, r5_141)
  end
end
function onLButtonUpMessageWindow(r0_142, r1_142, r2_142, r3_142, r4_142, r5_142)
  -- line: [5018, 5022] id: 142
  if g_MenuMsgWin ~= nil and r0_142 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuLButtonUp(r0_142, r1_142, r2_142, r3_142, r4_142, r5_142)
  end
end
function onRButtonDownMessageWindow(r0_143, r1_143, r2_143, r3_143, r4_143, r5_143)
  -- line: [5025, 5029] id: 143
  if g_MenuMsgWin ~= nil and r0_143 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuRButtonDown(r0_143, r1_143, r2_143, r3_143, r4_143, r5_143)
  end
end
function onKeyDownMessageWindow(r0_144, r1_144, r2_144, r3_144)
  -- line: [5035, 5039] id: 144
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:MenuKeyDown(r0_144, r1_144, r2_144, r3_144)
  end
end
function setButtonState()
  -- line: [5043, 5048] id: 145
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:setButtonState()
  end
end
function refreshCursorPos()
  -- line: [5051, 5058] id: 146
  if g_refreshCursor then
    cfunc.D3DApp__lua_PostMouseMove()
    g_refreshCursor = false
  end
end
function willChangeVariable()
  -- line: [5061, 5063] id: 147
end
function didChangeVariable()
  -- line: [5066, 5068] id: 148
end
function getCharacterKeyCount()
  -- line: [5071, 5074] id: 149
  return #g_charKeys + #g_charKeysOtherM + #g_charKeysOtherF
end
function getCharacterKey(r0_150)
  -- line: [5077, 5088] id: 150
  r0_150 = r0_150 + 1
  if #g_charKeys + #g_charKeysOtherM < r0_150 then
    return g_charKeysOtherF[r0_150 - #g_charKeys + #g_charKeysOtherM]
  elseif #g_charKeys < r0_150 then
    return g_charKeysOtherM[r0_150 - #g_charKeys]
  else
    return g_charKeys[r0_150]
  end
end
function executeQuickSave()
  -- line: [5091, 5099] id: 151
  local r0_151 = cclass.lua_Sounds:new()
  r0_151:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.qsave), g_SysSEName.qsave, getSoundVolume("systemse"))
  r0_151:delete()
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
end
function executeQuickLoad()
  -- line: [5102, 5108] id: 152
  local r0_152 = cclass.lua_Sounds:new()
  r0_152:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.qload), g_SysSEName.qload, getSoundVolume("systemse"))
  openConfirm(LUA_CONFIRM_QUICKLOAD)
  r0_152:delete()
end
function getMessageWindowEffect()
  -- line: [5111, 5117] id: 153
  if g_MenuMsgWin ~= nil then
    return g_MenuMsgWin.MenuInf.effect
  end
  return false
end
function initSelect(r0_154)
  -- line: [5120, 5133] id: 154
  g_MenuMsgWin.SelectCount = r0_154
  g_MenuMsgWin:MenuMakeSelectLayer()
  g_MenuMsgWin:MakeSelectBut()
  g_MenuMsgWin:SetSelectButPos()
  g_MenuMsgWin:startSelectMenu()
end
function getLocalSelectText(r0_155)
  -- line: [5139, 5143] id: 155
  return string.format("SelTxt%03d", r0_155)
end
function getLocalSelectKey(r0_156)
  -- line: [5148, 5152] id: 156
  return string.format("SelWnd%03d", r0_156)
end
function disableSelectItem(r0_157)
  -- line: [5158, 5174] id: 157
  if g_MenuMsgWin ~= nil then
    setSelectTextColor(r0_157, -1)
    g_MenuMsgWin:DisableSelect(r0_157)
  end
end
function getSelectTextKey(r0_158)
  -- line: [5179, 5183] id: 158
  return "system", getLocalSelectText(r0_158 + 1)
end
function isSelectEffect()
  -- line: [5186, 5193] id: 159
  local r0_159 = false
  if g_MenuMsgWin ~= nil then
    r0_159 = g_MenuMsgWin:SelectEffect()
  end
  return r0_159
end
function setSelectTextColor(r0_160, r1_160)
  -- line: [5196, 5219] id: 160
  if g_SelectTextColorState[r0_160 + 1] == -1 then
    r1_160 = -1
  end
  local r2_160 = getLocalSelectText(r0_160 + 1)
  local r3_160 = cclass.CLegacyFontInfo:create()
  if r1_160 == 0 then
    r3_160:changeColor("system", r2_160, g_selectTextColor.normal, g_selectTextColor.normalEdge)
  elseif r1_160 == 1 then
    r3_160:changeColor("system", r2_160, g_selectTextColor.already, g_selectTextColor.alreadyEdge)
  elseif r1_160 == 2 then
    r3_160:changeColor("system", r2_160, g_selectTextColor.selected, g_selectTextColor.selectedEdge)
  else
    r3_160:changeColor("system", r2_160, g_selectTextColor.disabled, g_selectTextColor.disabledEdge)
  end
  cclass.lua_Layers:create():updateTextColor("system", r2_160)
  g_SelectTextColorState[r0_160 + 1] = r1_160
end
function isSystemEffect(r0_161)
  -- line: [5222, 5250] id: 161
  -- notice: unreachable block#17
  local r1_161 = false
  if g_MenuDialog ~= nil then
    local r2_161 = g_MenuDialog:MenuEffect()
    if r2_161 == false and g_MenuDialog.MenuInf.enabled == false then
      g_MenuDialog = nil
    end
    if not r1_161 then
      r1_161 = r2_161
    end
  end
  for r5_161, r6_161 in pairs(g_Menu) do
    if r6_161.ptr ~= nil then
      local r7_161 = r6_161.ptr:MenuEffect()
      if r7_161 == false and r6_161.ptr.MenuInf.enabled == false then
        r6_161.ptr = nil
      end
      if not r1_161 then
        r1_161 = r7_161
      end
    end
  end
  local r2_161 = isCmdLineEffect()
  if r2_161 == true then
    r2_161 = true
  else
    r2_161 = false
  end
  if not r1_161 then
    r1_161 = r2_161
  end
  return r1_161
end
function openCmdLine(r0_162, r1_162, r2_162, r3_162, r4_162)
  -- line: [5262, 5293] id: 162
  if r3_162 == false or r4_162 then
    r2_162 = r2_162 * -1 or r2_162
  end
  local r5_162 = cclass.lua_Layers:create()
  if r5_162:add("cmdLine") == false then
    return false
  end
  r5_162:insertLayer("cmdLine", "CmdLine01", LUA_LAYER_PNA, getGraphicsArcFileName("cmdLine", "Sys_CmdLine.pna"), "Sys_CmdLine.pna", 1)
  for r11_162 = 1, 13, 1 do
    local r6_162 = r5_162:initSubLayer("cmdLine", "CmdLine01", r11_162, 1)
  end
  local r8_162 = 0
  local r9_162 = 0
  local r10_162 = 0
  local r11_162 = 0
  r8_162, r9_162, r10_162, r11_162 = r5_162:getSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_SIZE, r8_162, r9_162, r10_162, r11_162)
  r5_162:insertCommandLineLayer("cmdLine", "inputLine", r1_162, r8_162, r9_162, 8, 1, 8, 1, 0.25, 1, r2_162, r4_162)
  r8_162, r9_162, r10_162, r11_162 = r5_162:getSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_POS, r8_162, r9_162, r10_162, r11_162)
  r5_162:setParam("cmdLine", "inputLine", LUA_PARAM_POS, r8_162, r9_162, r10_162, r11_162)
  local r12_162 = getEffectRate()
  local r13_162 = 0
  r5_162:setSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_POS, r8_162, r9_162 + 48, r10_162, r11_162)
  r5_162:setParam("cmdLine", "CmdLine01", LUA_PARAM_COLOR, 1, 1, 1, 0)
  r5_162:setSubLayerEffect("cmdLine", "CmdLine01", "CmdEffect", 13, LUA_EFFECT_POS, 0, -48, 0, 0, 0, 100 * r12_162, 0, r13_162)
  r5_162:setEffect("cmdLine", "CmdLine01", "CmdEffect", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 100 * r12_162, 0, r13_162)
  r5_162:startSubLayerEffect("cmdLine", "CmdLine01", "CmdEffect", 13, 0)
  r5_162:startEffect("cmdLine", "CmdLine01", "CmdEffect", 0)
  g_cmdLineInfo.beforeSet = r0_162
  g_cmdLineInfo.enabled = true
  g_cmdLineInfo.effect = true
end
function isCmdLineEffect()
  -- line: [5295, 5309] id: 163
  local r0_163 = cclass.lua_Layers:create()
  local r1_163 = r0_163:isEffect("cmdLine", "CmdEffect")
  if g_cmdLineInfo.effect == true and r1_163 == false then
    if g_cmdLineInfo.enabled == false then
      r0_163:remove("cmdLine")
      cfunc.D3DApp__lua_PostMouseMove()
    end
    g_cmdLineInfo.effect = false
  end
  return r1_163
end
function setIMState()
  -- line: [5311, 5352] id: 164
  local r0_164 = cclass.lua_Layers:create()
  local r1_164 = 0
  local r2_164 = 0
  local r3_164 = 0
  local r4_164 = 0
  r1_164, r2_164, r3_164, r4_164 = r0_164:getIMStatus("cmdLine", "inputLine", r1_164, r2_164, r3_164, r4_164)
  if r1_164 == 0 and r2_164 ~= 5 then
    r2_164 = 0
  end
  if r2_164 == 1 or r2_164 == 2 or r2_164 == 3 then
    r0_164:setSubLayerVisible("cmdLine", "CmdLine01", 10, 0)
    r0_164:setSubLayerVisible("cmdLine", "CmdLine01", 11, 1)
  else
    r0_164:setSubLayerVisible("cmdLine", "CmdLine01", 10, 1)
    r0_164:setSubLayerVisible("cmdLine", "CmdLine01", 11, 0)
  end
  local r5_164 = 5
  if r2_164 == 1 then
    r5_164 = 9
  elseif r2_164 == 2 then
    r5_164 = 8
  elseif r2_164 == 3 then
    r5_164 = 7
  elseif r2_164 == 4 then
    r5_164 = 6
  end
  local r15_164 = nil	-- notice: implicit variable refs by block#[20]
  for r9_164 = 5, 9, 1 do
    local r12_164 = "cmdLine"
    local r13_164 = "CmdLine01"
    local r14_164 = r9_164
    if r9_164 == r5_164 then
      r15_164 = 1
      if not r15_164 then
        ::label_85::
        r15_164 = 0
      end
    else
      goto label_85	-- block#19 is visited secondly
    end
    r0_164:setSubLayerVisible(r12_164, r13_164, r14_164, r15_164)
  end
  local r8_164 = "cmdLine"
  local r9_164 = "CmdLine01"
  local r10_164 = 1
  local r11_164 = nil	-- notice: implicit variable refs by block#[25, 28, 31, 34]
  if r3_164 == 1 then
    r11_164 = 0
    if not r11_164 then
      ::label_97::
      r11_164 = 1
    end
  else
    goto label_97	-- block#24 is visited secondly
  end
  r0_164:setSubLayerVisible(r8_164, r9_164, r10_164, r11_164)
  r8_164 = "cmdLine"
  r9_164 = "CmdLine01"
  r10_164 = 2
  if r3_164 == 1 then
    r11_164 = 1
    if not r11_164 then
      ::label_108::
      r11_164 = 0
    end
  else
    goto label_108	-- block#27 is visited secondly
  end
  r0_164:setSubLayerVisible(r8_164, r9_164, r10_164, r11_164)
  r8_164 = "cmdLine"
  r9_164 = "CmdLine01"
  r10_164 = 3
  if r4_164 == 1 then
    r11_164 = 0
    if not r11_164 then
      ::label_119::
      r11_164 = 1
    end
  else
    goto label_119	-- block#30 is visited secondly
  end
  r0_164:setSubLayerVisible(r8_164, r9_164, r10_164, r11_164)
  r8_164 = "cmdLine"
  r9_164 = "CmdLine01"
  r10_164 = 4
  if r4_164 == 1 then
    r11_164 = 1
    if not r11_164 then
      ::label_130::
      r11_164 = 0
    end
  else
    goto label_130	-- block#33 is visited secondly
  end
  r0_164:setSubLayerVisible(r8_164, r9_164, r10_164, r11_164)
  for r9_164 = 1, 12, 1 do
    local r12_164 = "cmdLine"
    local r13_164 = "CmdLine01"
    local r14_164 = r9_164
    r15_164 = LUA_PARAM_COLOR
    local r16_164 = 1
    local r17_164 = 1
    local r18_164 = 1
    local r19_164 = nil	-- notice: implicit variable refs by block#[38]
    if r1_164 == 1 then
      r19_164 = 1
      if not r19_164 then
        ::label_149::
        r19_164 = 0.5
      end
    else
      goto label_149	-- block#37 is visited secondly
    end
    r0_164:setSubLayerParam(r12_164, r13_164, r14_164, r15_164, r16_164, r17_164, r18_164, r19_164)
  end
end
function openConfirm(r0_165)
  -- line: [5357, 5610] id: 165
  if cfunc.LegacyGame__lua_GetFlag(127) == true and r0_165 == LUA_CONFIRM_TITLE then
    r0_165 = LUA_CONFIRM_ALBUM
  end
  if g_confirmDialog == 0 then
    g_MenuDialog = Menu.new("dialog")
    g_confirmDialog = r0_165
    local r2_165 = 0
    local r3_165 = 0
    local r4_165 = cclass.lua_AutoCursor:new()
    r2_165, r3_165 = r4_165:GetCursorPos(r2_165, r3_165)
    r4_165:delete()
    g_MenuDialog.InitCursorX = r2_165
    g_MenuDialog.InitCursorY = r3_165
    function g_MenuDialog.MenuButtonJobPos(r0_166, r1_166, r2_166, r3_166, r4_166)
      -- line: [5381, 5397] id: 166
      if r1_166 ~= 0 and r2_166 == "LU" then
        if r1_166 == 1 then
          executeProcess(true)
        end
        if r1_166 == 2 then
          executeProcess(false)
        end
      end
      if r2_166 == "RU" and r0_166:GetMenuMouseEnable() then
        r0_166:SystemSePlay(g_SysSEName.cancel)
        executeProcess(false)
      end
    end
    function g_MenuDialog.MenuEffectTransJob(r0_167)
      -- line: [5401, 5404] id: 167
      return cclass.lua_Layers:create():isEffect("dialog", "DialogDisp")
    end
    function g_MenuDialog.MenuEffectEndJob(r0_168)
      -- line: [5406, 5441] id: 168
      local r1_168 = cclass.lua_Layers:create()
      if r0_168.MenuInf.enabled == true then
        local r2_168 = 0
        local r3_168 = 0
        local r4_168 = cclass.lua_AutoCursor:new()
        r2_168, r3_168 = r4_168:GetCursorPos(r2_168, r3_168)
        r4_168:delete()
        r0_168.MenuButton:changeButton(r0_168.MenuInf.SetName, r1_168:getCursorPos(r0_168.MenuInf.SetName, r2_168, r3_168, 0) - 1, r2_168, r3_168)
      else
        if g_skipConfirm == true then
          executeProcess(true)
          r1_168:remove(r0_168.MenuInf.SetName)
          return 
        end
        r1_168:remove(r0_168.MenuInf.SetName)
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
        r0_168.MenuInf.ButtonLayer = ""
        r0_168.MenuInf.ButtonPna = ""
        g_confirmDialog = 0
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_MOUSEMOVE, 0)
      end
    end
    function g_MenuDialog.startMenu(r0_169)
      -- line: [5447, 5460] id: 169
      local r1_169 = cclass.lua_Layers:create()
      local r2_169 = getEffectRate()
      local r3_169 = 0
      r1_169:setParam("dialog", "Dialog01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_169:setEffect("dialog", "Dialog01", "DialogDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 250 * r2_169, 0, r3_169)
      r1_169:startEffect("dialog", "Dialog01", "DialogDisp", 0)
      r0_169.MenuInf.enabled = true
      r0_169.MenuInf.effect = true
    end
    function g_MenuDialog.closeConfirm(r0_170, r1_170)
      -- line: [5463, 5489] id: 170
      if g_skipConfirm == true then
        g_confirmDialog = 0
        return 
      end
      local r2_170 = cclass.lua_Layers:create()
      local r3_170 = getEffectRate()
      local r4_170 = 0
      r2_170:setParam("dialog", "Dialog01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_170:setEffect("dialog", "Dialog01", "DialogDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 250 * r3_170, 0, r4_170)
      r2_170:startEffect("dialog", "Dialog01", "DialogDisp", 0)
      r0_170.MenuInf.enabled = false
      r0_170.MenuInf.effect = true
      if r1_170 == true then
        SetAutoOncursorPos(r0_170.InitCursorX, r0_170.InitCursorY, 100)
      end
    end
    local r5_165 = getUItype()
    local r6_165 = "Sys_Dialog.pna"
    if r5_165 == 0 then
      r6_165 = "Sys_Dialog.pna"
    end
    if r5_165 == 1 then
      r6_165 = "Sys_Dialog.pna"
    end
    if r5_165 == 2 then
    end
    local r7_165 = g_MenuDialog:MenuInit("Dialog01", r6_165)
    if res == false then
      return false
    end
    if g_skipConfirm == true then
      g_MenuDialog.MenuInf.effect = true
      g_MenuDialog.MenuInf.enabled = false
      return true
    end
    local r8_165 = cclass.lua_Layers:create()
    r8_165:initSubLayer("dialog", "Dialog01", 20, 1)
    if r0_165 == LUA_CONFIRM_TITLE then
      r8_165:initSubLayer("dialog", "Dialog01", 4, 1)
    elseif r0_165 == LUA_CONFIRM_ALBUM then
      r8_165:initSubLayer("dialog", "Dialog01", 5, 1)
    elseif r0_165 == LUA_CONFIRM_OVERWRITE then
      r8_165:initSubLayer("dialog", "Dialog01", 6, 1)
    elseif r0_165 == LUA_CONFIRM_LOAD then
      r8_165:initSubLayer("dialog", "Dialog01", 7, 1)
    elseif r0_165 == LUA_CONFIRM_QUICKLOAD then
      r8_165:initSubLayer("dialog", "Dialog01", 8, 1)
    elseif r0_165 == LUA_CONFIRM_QUIT then
      r8_165:initSubLayer("dialog", "Dialog01", 9, 1)
    elseif r0_165 == LUA_CONFIRM_DEFAULT then
      r8_165:initSubLayer("dialog", "Dialog01", 10, 1)
    elseif r0_165 == LUA_CONFIRM_MEMLOAD then
      r8_165:initSubLayer("dialog", "Dialog01", 3, 1)
    elseif r0_165 == LUA_CONFIRM_SELECTLOAD then
      r8_165:initSubLayer("dialog", "Dialog01", 2, 1)
    end
    g_MenuDialog:MenuButtonSet(g_MenuDialog.MenuButtonData, "YES", 1, "Dialog01", 17, 17, 13, -1, -1, 1, 0, 0)
    g_MenuDialog:MenuButtonSet(g_MenuDialog.MenuButtonData, "NO", 1, "Dialog01", 18, 18, 14, -1, -1, 2, 0, 0)
    g_MenuDialog.MenuButtonData.NO.se_click = g_SysSEName.cancel
    g_MenuDialog:MenuButtonInit()
    if r0_165 == LUA_CONFIRM_DELETEGAME then
      SetAutoOncursor("dialog", "Dialog01", 18, 250)
    else
      SetAutoOncursor("dialog", "Dialog01", 17, 250)
    end
    local r9_165 = {
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
    if r9_165[g_confirmDialog] ~= nil then
      playSystemVoice(r9_165[g_confirmDialog])
    end
    g_MenuDialog:startMenu()
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  end
  return true
end
function onMouseMoveDialog(r0_171, r1_171, r2_171, r3_171, r4_171, r5_171)
  -- line: [5614, 5618] id: 171
  if g_MenuDialog ~= nil and r0_171 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuMouseMove(r0_171, r1_171, r2_171, r3_171, r4_171, r5_171)
  end
end
function onLButtonDownDialog(r0_172, r1_172, r2_172, r3_172, r4_172, r5_172)
  -- line: [5620, 5624] id: 172
  if g_MenuDialog ~= nil and r0_172 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuLButtonDown(r0_172, r1_172, r2_172, r3_172, r4_172, r5_172)
  end
end
function onLButtonUpDialog(r0_173, r1_173, r2_173, r3_173, r4_173, r5_173)
  -- line: [5626, 5630] id: 173
  if g_MenuDialog ~= nil and r0_173 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuLButtonUp(r0_173, r1_173, r2_173, r3_173, r4_173, r5_173)
  end
end
function onRButtonDownDialog(r0_174, r1_174, r2_174, r3_174, r4_174, r5_174)
  -- line: [5632, 5636] id: 174
  if g_MenuDialog ~= nil and r0_174 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuRButtonDown(r0_174, r1_174, r2_174, r3_174, r4_174, r5_174)
  end
end
function onRButtonUpDialog(r0_175, r1_175, r2_175, r3_175, r4_175, r5_175)
  -- line: [5638, 5642] id: 175
  if g_MenuDialog ~= nil and r0_175 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuRButtonUp(r0_175, r1_175, r2_175, r3_175, r4_175, r5_175)
  end
end
function onKeyDownDialog(r0_176, r1_176, r2_176, r3_176)
  -- line: [5645, 5683] id: 176
  if r3_176 == true then
    return 
  end
  if g_MenuDialog ~= nil and r0_176 == g_MenuDialog.MenuInf.SetName and g_MenuDialog.MenuInf.effect == false then
    local r4_176 = g_MenuDialog.MenuButton.selCursor
    if r2_176 == LUA_KEYCODE_LEFT and r4_176 ~= "YES" then
      SetAutoOncursor("dialog", "Dialog01", 17, 100)
    elseif r2_176 == LUA_KEYCODE_RIGHT and r4_176 ~= "NO" then
      SetAutoOncursor("dialog", "Dialog01", 18, 100)
    elseif r2_176 == LUA_KEYCODE_ENTER then
      local r5_176 = g_MenuDialog.MenuButton.selListKey
      if r4_176 == "YES" and r5_176[r4_176].focusflag == true then
        executeProcess(true)
      elseif r4_176 == "NO" and r5_176[r4_176].focusflag == true then
        executeProcess(false)
      end
    elseif r2_176 == LUA_KEYCODE_SPACE then
      executeProcess(false)
    end
  end
end
function closeConfirm(r0_177)
  -- line: [5686, 5690] id: 177
  if g_MenuDialog ~= nil then
    g_MenuDialog:closeConfirm(r0_177)
  end
end
function executeProcess(r0_178)
  -- line: [5693, 5829] id: 178
  if r0_178 == true then
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
      local r1_178 = cclass.lua_Sounds:new()
      r1_178:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.qload), g_SysSEName.qload, getSoundVolume("systemse"))
      r1_178:delete()
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
      local r2_178 = cclass.lua_Sounds:new()
      r2_178:BgmStop("systembgm", 500)
      r2_178:delete()
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
function changeDialogFocus(r0_179)
  -- line: [5833, 5835] id: 179
end
g_logWindowDisable = true
g_logSnapUpdate = false
g_logTest = 0
function openMessageLog()
  -- line: [5845, 6774] id: 180
  g_Menu.BackLog.ptr = Menu.new("messageLog")
  function g_Menu.BackLog.ptr.MenuButtonJobPos(r0_181, r1_181, r2_181, r3_181, r4_181)
    -- line: [5853, 5928] id: 181
    if r2_181 == "LD" and r0_181.textCursor ~= -1 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_LOG_VOICEPLAY, r0_181.textCursor)
    end
    if r2_181 == "LD" and r1_181 ~= 0 and r1_181 == 10 then
      r0_181.SliderMoveNo = 1
      r0_181.SliderParam = r0_181.ButtonSlide.SlideBar:bt_GetParamY()
    end
    if r2_181 == "LU" and r0_181.SliderMoveNo == 1 then
      local r5_181 = r0_181.ButtonSlide.SlideBar:bt_GetParamY()
      if r0_181.SliderParam ~= r5_181 then
        r0_181:MenuMouseWheelEx("messageLog", r0_181.SliderParam - r5_181, false)
        r0_181.SliderParam = r5_181
        r0_181:SetActive()
      end
      r0_181.ButtonSlide.SlideBar:bt_SetParamY(r5_181)
      r0_181.SliderParam = 0
      r0_181.SliderMoveNo = -1
    end
    if r2_181 == "LU" and r1_181 ~= 0 then
      if r1_181 == 1 then
        closeMessageLog()
      end
      if r1_181 == 2 then
        r0_181:MenuMouseWheelEx("messageLog", 1, false)
      end
      if r1_181 == 3 then
        r0_181:MenuMouseWheelEx("messageLog", -1, false)
      end
      if r1_181 == 11 then
        local r5_181 = r0_181.ButtonSlide.BarBack.EVENT_RECT.h / (r0_181.ButtonSlide.SlideBar.MOVABLE.PAR_MAX_Y + 1 - r0_181.ButtonSlide.SlideBar.MOVABLE.PSIZE_Y)
        local r6_181 = r4_181 - r0_181.ButtonSlide.BarBack.DRAW_POS.y
        if r6_181 < 0 then
          r6_181 = 0
        end
        local r7_181 = math.floor(r6_181 / r5_181)
        r0_181:MenuMouseWheelEx("messageLog", r0_181.ButtonSlide.SlideBar:bt_GetParamY() - r7_181, false)
        r0_181.ButtonSlide.SlideBar:bt_SetParamY(r7_181)
        r0_181:SetActive()
        r0_181.SliderParam = 0
      end
      if 100 < r1_181 and r1_181 <= 150 then
        r0_181.selLine = r0_181.iconID[r1_181 - 100]
        openConfirm(LUA_CONFIRM_MEMLOAD)
      end
    end
    if r2_181 == "RU" and r0_181:GetMenuMouseEnable() then
      r0_181:SystemSePlay(g_SysSEName.cancel)
      closeMessageLog()
    end
  end
  function g_Menu.BackLog.ptr.MenuMouseWheel(r0_182, r1_182, r2_182)
    -- line: [5930, 5932] id: 182
    r0_182:MenuMouseWheelEx(r1_182, r2_182, true)
  end
  function g_Menu.BackLog.ptr.MenuMouseWheelEx(r0_183, r1_183, r2_183, r3_183)
    -- line: [5934, 5960] id: 183
    if r0_183.MenuInf.effect == true then
      return 
    end
    if cclass.lua_Layers:create():onWheelMouseLogLayer("messageLog", "LogText01", r2_183, r3_183) == true and r3_183 == true then
      closeMessageLog()
      return 
    end
    r0_183.FocusAfterCallFlag = 0
  end
  g_Menu.BackLog.ptr.FocusAfterCallFlag = -1
  function g_Menu.BackLog.ptr.FocusAfterCall(r0_184)
    -- line: [5964, 5980] id: 184
    if r0_184.FocusAfterCallFlag >= 1 then
      r0_184.FocusAfterCallFlag = r0_184.FocusAfterCallFlag - 1
    end
    if r0_184.FocusAfterCallFlag == 0 then
      r0_184.FocusAfterCallFlag = -1
      local r1_184 = 0
      local r2_184 = 0
      local r3_184 = cclass.lua_AutoCursor:new()
      r1_184, r2_184 = r3_184:GetCursorPos(r1_184, r2_184)
      r3_184:delete()
      r0_184:defaultMenuMouseMove(setname, -1, -1, r1_184, r2_184, false)
      r0_184:TextFocus(r1_184, r2_184)
    end
  end
  g_Menu.BackLog.ptr.defaultMenuMouseMove = g_Menu.BackLog.ptr.MenuMouseMove
  function g_Menu.BackLog.ptr.MenuMouseMove(r0_185, r1_185, r2_185, r3_185, r4_185, r5_185, r6_185)
    -- line: [5984, 6018] id: 185
    r0_185:defaultMenuMouseMove(r1_185, r2_185, r3_185, r4_185, r5_185, r6_185)
    if r0_185.SliderMoveNo == 1 then
      local r7_185 = r0_185.ButtonSlide.SlideBar:bt_GetParamY()
      if r0_185.SliderParam ~= r7_185 then
        r0_185:MenuMouseWheelEx("messageLog", r0_185.SliderParam - r7_185, false)
        r0_185.SliderParam = r7_185
        r0_185:SetActive()
      end
    end
    if r0_185.MenuButton.selCursor == -1 and r0_185.Item.SlideBase ~= nil then
      r0_185.Item.SlideBase:SetAct("def")
    end
    if (r0_185.MenuButton.selCursor == "Up" or r0_185.MenuButton.selCursor == "Down" or r0_185.MenuButton.selCursor == "SlideBar" or r0_185.MenuButton.selCursor == "BarBack") and r0_185.Item.SlideBase ~= nil then
      r0_185.Item.SlideBase:SetAct("on")
    end
    r0_185.FocusAfterCallFlag = 0
  end
  function g_Menu.BackLog.ptr.MenuInit(r0_186)
    -- line: [6021, 6041] id: 186
    local r1_186 = true
    r0_186.MenuInf.enabled = false
    r0_186.MenuInf.effect = false
    r0_186.MenuInf.ButtonLayer = ""
    r0_186.MenuInf.ButtonPna = ""
    if cclass.lua_Layers:create():add(r0_186.MenuInf.SetName) == false then
      return false
    end
    r0_186.MenuButton = Button.new(r0_186.MenuInf.SetName)
    r0_186.MenuButton:InitList()
    r0_186.MenuButtonData = {}
    return r1_186
  end
  function g_Menu.BackLog.ptr.MenuEffect(r0_187)
    -- line: [6044, 6078] id: 187
    local r1_187 = false
    r1_187 = r0_187:MenuEffectTransJob()
    if g_logWindowDisable then
      local r2_187 = cclass.lua_Layers:create()
      if r0_187.MenuInf.effect == true and r1_187 == true and g_logSnapUpdate == false then
        g_logTest = g_logTest + 1
        if g_logTest == 2 then
          r2_187:setSnap("system", true)
          g_logSnapUpdate = true
        end
      end
    end
    if r0_187.MenuInf.effect == true and r1_187 == false then
      r0_187:MenuEffectEndJob()
      r0_187.MenuInf.effect = false
    end
    return r1_187
    -- warn: not visited block [5, 6]
    -- block#5:
    -- g_logTest = g_logTest + 1
    -- if g_logTest == 2
    -- block#6:
    -- r2_187:setSnap2("system", true)
    -- g_logSnapUpdate = true
    -- goto label_52
  end
  function g_Menu.BackLog.ptr.MenuEffectEndJob(r0_188)
    -- line: [6081, 6120] id: 188
    local r1_188 = cclass.lua_Layers:create()
    if r0_188.MenuInf.enabled == true then
      if g_logWindowDisable then
      end
      r0_188:InitSlideBar()
      local r2_188 = 0
      local r3_188 = 0
      local r4_188 = cclass.lua_AutoCursor:new()
      r2_188, r3_188 = r4_188:GetCursorPos(r2_188, r3_188)
      r4_188:delete()
      r0_188.MenuButton:changeButton(r0_188.MenuInf.SetName, r1_188:getCursorPos(r0_188.MenuInf.SetName, r2_188, r3_188, 0) - 1, r2_188, r3_188)
      r0_188:TextFocus(r2_188, r3_188)
    else
      r1_188:removeSnap("system")
      r1_188:remove(r0_188.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_188.MenuInf.ButtonLayer = ""
      r0_188.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.BackLog.ptr.MenuKeyDown(r0_189, r1_189, r2_189, r3_189, r4_189)
    -- line: [6123, 6178] id: 189
    if r0_189.MenuInf.effect == false and r3_189 == LUA_KEYCODE_DOWN and r0_189.MenuButtonData.Down.active == 0 and r0_189.FocusAfterCallFlag == -1 then
      r0_189:MenuMouseWheelEx(r1_189, -1, false)
    end
    if r4_189 == true then
      return 
    end
    if r0_189.MenuInf.effect == false then
      local r5_189 = cclass.lua_Layers:create()
      local r6_189 = r5_189:getLogTextDrawCount("messageLog", "LogText01", 0)
      local r7_189 = 0
      local r8_189 = 0
      r7_189, r8_189 = r5_189:getLogTextLine("messageLog", "LogText01", r7_189, r8_189)
      if r3_189 == LUA_KEYCODE_HOME and r0_189.MenuButtonData.Up.active == 0 then
        r0_189:MenuMouseWheelEx(r1_189, r8_189, false)
      elseif r3_189 == LUA_KEYCODE_END and r0_189.MenuButtonData.Down.active == 0 then
        r0_189:MenuMouseWheelEx(r1_189, -(r7_189 - r6_189 - r8_189), false)
      elseif r3_189 == LUA_KEYCODE_PAGEUP then
        r0_189:MenuMouseWheelEx(r1_189, r5_189:pageUpLogText("messageLog", "LogText01"), false)
      elseif r3_189 == LUA_KEYCODE_PAGEDOWN then
        if r7_189 < r6_189 + r6_189 + r8_189 then
          r6_189 = r7_189 - r6_189 - r8_189
        end
        r0_189:MenuMouseWheelEx(r1_189, -r6_189, false)
      elseif r3_189 ~= LUA_KEYCODE_ENTER and r3_189 == LUA_KEYCODE_SPACE then
        closeMessageLog()
      end
    end
    -- warn: not visited block [4]
    -- block#4:
    -- r0_189:MenuMouseWheelEx(r1_189, 1, false)
    -- goto label_37
  end
  function g_Menu.BackLog.ptr.initBackLog(r0_190)
    -- line: [6186, 6271] id: 190
    r0_190:MenuLoadLayer("Log01", "Sys_BackLog.pna")
    local r1_190 = cclass.lua_Layers:create()
    r0_190:MenuLoadLayer("LogPrevBase", "Sys_Preview.pna")
    r1_190:initSubLayer("messageLog", "LogPrevBase", 0, 0)
    r1_190:insertLogLayer("messageLog", "LogText01", g_LogTxtSize.lWidth, g_LogTxtSize.lHeight, g_LogTxtSize.lMarginLeft, g_LogTxtSize.lMarginTop, g_LogTxtSize.lMarginRight, g_LogTxtSize.lMarginBottom, g_LogTxtSize.fLineMargin, 1)
    local r2_190 = 0
    r2_190, r3_190, r4_190, r5_190 = r1_190:getParam("system", "Msg01", LUA_PARAM_POS, r2_190, 0, 0, 0)
    r1_190:setParam("messageLog", "LogText01", LUA_PARAM_POS, r2_190 + 230, 50, 0, 0)
    r0_190.MenuButton:InitList()
    r0_190.MenuButtonData = {}
    r0_190.ButtonSlide = {}
    r1_190:initSubLayer("messageLog", "Log01", 35, 1)
    r1_190:initSubLayer("messageLog", "Log01", 9, 0)
    r1_190:initSubLayer("messageLog", "Log01", 10, 0)
    r1_190:initSubLayer("messageLog", "Log01", 11, 0)
    r0_190:MenuButtonSet(r0_190.MenuButtonData, "Close", 1, "Log01", 15, 15, 14, -1, -1, 1, 0, 0)
    r0_190:MenuButtonSet(r0_190.MenuButtonData, "Up", 1, "Log01", 19, 19, 18, -1, -1, 2, 0, 0)
    r0_190:MenuButtonSet(r0_190.MenuButtonData, "Down", 1, "Log01", 23, 23, 22, -1, -1, 3, 0, 0)
    r1_190:insertPNARefLayer("messageLog", "VoiceUpper", "Log01", 9, 0)
    r1_190:setCameraLayer("messageLog", "VoiceUpper", true)
    r1_190:insertPNARefLayer("messageLog", "VoiceMid", "Log01", 10, 0)
    r1_190:setCameraLayer("messageLog", "VoiceMid", true)
    r1_190:insertPNARefLayer("messageLog", "VoiceLower", "Log01", 11, 0)
    r1_190:setCameraLayer("messageLog", "VoiceLower", true)
    r1_190:initSubLayer("messageLog", "Log01", 5, 0)
    r1_190:initSubLayer("messageLog", "Log01", 6, 0)
    r1_190:insertPNARefLayer("messageLog", "IconHover", "Log01", 5, 0)
    r1_190:setCameraLayer("messageLog", "IconHover", true)
    for r9_190 = 1, 50, 1 do
      local r10_190 = r0_190:GetJumpIcon(r9_190)
      local r11_190 = r0_190:GetJumpButton(r9_190)
      r1_190:insertPNARefLayer("messageLog", r10_190, "Log01", 6, 0)
      r1_190:setCameraLayer("messageLog", r10_190, true)
      r0_190:MenuButtonSet(r0_190.MenuButtonData, r11_190, 1, "Log01", 6, -1, -1, -1, -1, r9_190 + 100, 0, 0)
    end
    r0_190.MenuButton:SetList("MenuButtonData", r0_190.MenuButtonData)
    r0_190.MenuButton:InitButton()
    for r9_190 = 1, 50, 1 do
      r0_190.MenuButtonData[r0_190:GetJumpButton(r9_190)]:bt_SetActive(3)
    end
    r0_190.Item = {}
    r0_190.Item.SlideBase = MenuItem.new("messageLog", "Log01", 33, 32)
    r0_190:SetActive()
  end
  function g_Menu.BackLog.ptr.SetActive(r0_191)
    -- line: [6274, 6320] id: 191
    if r0_191.SlideInit == true then
      local r1_191 = cclass.lua_Layers:create()
      local r2_191 = r1_191:getLogTextDrawCount("messageLog", "LogText01", 0)
      local r3_191 = 0
      local r4_191 = 0
      r3_191, r4_191 = r1_191:getLogTextLine("messageLog", "LogText01", r3_191, r4_191)
      r0_191.ButtonSlide.SlideBar:bt_SetMovableInit(true, 0, r3_191, 0, r2_191, 0, 0)
      if r3_191 < 2 then
        r0_191.MenuButtonData.Up:bt_SetActive(2)
        r0_191.MenuButtonData.Down:bt_SetActive(2)
      else
        if r4_191 > 0 then
          if r0_191.MenuButtonData.Up.active ~= 0 then
            r0_191.MenuButtonData.Up:bt_SetActive(0)
          end
        else
          r0_191.MenuButtonData.Up:bt_SetActive(2)
        end
        if r4_191 + r2_191 < r3_191 then
          if r0_191.MenuButtonData.Down.active ~= 0 then
            r0_191.MenuButtonData.Down:bt_SetActive(0)
          end
        else
          r0_191.MenuButtonData.Down:bt_SetActive(2)
        end
      end
      if r0_191.SliderMoveNo == -1 then
        r0_191.ButtonSlide.SlideBar:bt_SetParamY(r4_191)
      end
    else
      r0_191.MenuButtonData.Up:bt_SetActive(3)
      r0_191.MenuButtonData.Down:bt_SetActive(3)
      local r1_191 = cclass.lua_Layers:create()
    end
  end
  function g_Menu.BackLog.ptr.InitSlideBar(r0_192)
    -- line: [6324, 6367] id: 192
    if r0_192.SlideInit == true then
      return 
    end
    local r1_192 = cclass.lua_Layers:create()
    local r2_192 = r1_192:getLogTextDrawCount("messageLog", "LogText01", 0)
    local r3_192 = 0
    local r4_192 = 0
    r3_192, r4_192 = r1_192:getLogTextLine("messageLog", "LogText01", r3_192, r4_192)
    if r3_192 < 2 then
      return 
    end
    if r3_192 <= r2_192 then
      return 
    end
    r0_192:MenuMoveButtonSet(r0_192.ButtonSlide, "SlideBar", 1, "Log01", 27, 27, 26, -1, -1, 10, 0, 0)
    r0_192:MenuButtonSet(r0_192.ButtonSlide, "BarBack", 1, "Log01", 28, -1, -1, -1, -1, 11, 0, -1)
    r0_192.ButtonSlide.SlideBar.se_click = -1
    r0_192.ButtonSlide.BarBack.se_click = -1
    r0_192.MenuButton:SetList("ButtonSlide", r0_192.ButtonSlide)
    r0_192.MenuButton:InitButton()
    r0_192.MenuButton:SetList("MenuButtonData", r0_192.MenuButtonData)
    r0_192:SetSliderParam(r0_192.ButtonSlide.SlideBar, 28, 29, r3_192, r2_192, r4_192)
    r0_192.SlideInit = true
    r0_192:SetActive()
  end
  function g_Menu.BackLog.ptr.SetSliderParam(r0_193, r1_193, r2_193, r3_193, r4_193, r5_193, r6_193)
    -- line: [6370, 6387] id: 193
    r1_193:bt_SetMoveRangeRectLayer(r2_193)
    r1_193:bt_SetEventRangeRectLayer(r3_193)
    r1_193:bt_SetMovableInit(true, 0, r4_193, 0, r5_193, 0, 0)
    r1_193.initpos.x = r1_193.MOVERANGE.x
    r1_193.initpos.y = r1_193.MOVERANGE.y
    r1_193.initrect.x = r1_193.MOVERANGE.x
    r1_193.initrect.y = r1_193.MOVERANGE.y
    r1_193.initrect.w = r1_193.EVENT_RECT.w
    r1_193.initrect.h = r1_193.EVENT_RECT.h
    r1_193:bt_SetParamY(r6_193)
  end
  function g_Menu.BackLog.ptr.GetJumpIcon(r0_194, r1_194)
    -- line: [6390, 6394] id: 194
    return string.format("dataIcon%03d", r1_194)
  end
  function g_Menu.BackLog.ptr.GetJumpButton(r0_195, r1_195)
    -- line: [6396, 6400] id: 195
    return string.format("Jump%03d", r1_195)
  end
  function g_Menu.BackLog.ptr.addFrame(r0_196, r1_196)
    -- line: [6402, 6436] id: 196
    if r0_196.selLine ~= -1 and r0_196.selButton ~= nil and r0_196.MenuInf.enabled == true and r0_196.MenuInf.effect == false and r0_196.focusTimer ~= -1 then
      r0_196.focusTimer = r0_196.focusTimer - r1_196
      if r0_196.focusTimer <= 0 then
        local r2_196 = cclass.lua_Layers:create()
        local r3_196 = r2_196:getIndexLogLayerText("messageLog", "LogText01", r0_196.selLine)
        r2_196:insertPNARefLayer("messageLog", "LogPrevBaseR", "LogPrevBase", 0, 1)
        r2_196:setCameraLayer("messageLog", "LogPrevBaseR", true)
        r2_196:insertLogPreviewLayer("messageLog", "LogPreview", r3_196, 172, 98, 1)
        r2_196:setCameraLayer("messageLog", "LogPreview", true)
        local r4_196 = 60
        local r5_196 = r0_196.selButton.DRAW_POS.y + r0_196.selButton.EVENT_RECT.h - 64
        local r7_196 = 0
        r6_196, r7_196, r8_196, r9_196 = r2_196:getParam("messageLog", "LogPrevBaseR", LUA_PARAM_SIZE, 0, r7_196, 0, 0)
        if APP_INTERNAL_HEIGHT < r5_196 + r7_196 then
          r5_196 = r0_196.selButton.DRAW_POS.y - r7_196 + 50
        end
        if r5_196 < 0 then
          r5_196 = 0
        end
        r2_196:setParam("messageLog", "LogPrevBaseR", LUA_PARAM_POS, r4_196, r5_196, 0, 0)
        r2_196:setParam("messageLog", "LogPreview", LUA_PARAM_POS, r4_196 + 1, r5_196 + 1, 0, 0)
        r0_196.selButton = nil
        r0_196.focusTimer = -1
      end
    end
  end
  function g_Menu.BackLog.ptr.TextFocus(r0_197, r1_197, r2_197)
    -- line: [6440, 6587] id: 197
    if r0_197.SliderMoveNo ~= -1 then
      return 
    end
    if r0_197.MenuButton.selDownCursor ~= -1 then
      return 
    end
    local r3_197 = cclass.lua_Layers:create()
    r3_197:setVisible("messageLog", "IconHover", 0)
    local r4_197 = -1
    local r5_197 = -1
    for r9_197 = 1, r0_197.iconCount, 1 do
      local r10_197 = r0_197:GetJumpIcon(r9_197)
      local r11_197 = r0_197:GetJumpButton(r9_197)
      if r11_197 == r0_197.MenuButton.selCursor then
        local r12_197 = 0
        local r13_197 = 0
        local r14_197 = 0
        local r15_197 = 0
        r12_197, r13_197 = r0_197.MenuButtonData[r11_197]:bt_GetPos()
        r3_197:setParam("messageLog", "IconHover", LUA_PARAM_POS, r12_197 - 8, r13_197 - 8, 0, 0)
        r3_197:setParam("messageLog", r10_197, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_197 = r9_197 - 1
        r5_197 = r0_197.MenuButtonData[r11_197]
      else
        r3_197:setParam("messageLog", r10_197, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
    if r4_197 == -1 then
      r3_197:removeLayer("messageLog", "LogPrevBaseR")
      r3_197:removeLayer("messageLog", "LogPreview")
      r0_197.selButton = nil
      r0_197.focusTimer = -1
      r0_197.selLine = -1
    else
      local r6_197 = r0_197.iconID[r4_197 + 1]
      if r0_197.selLine ~= r6_197 then
        r0_197.focusTimer = 500
        r0_197.selButton = r5_197
      end
      r3_197:setVisible("messageLog", "IconHover", 1)
      r0_197.selLine = r6_197
    end
    if r0_197.selLine == -1 then
      r4_197 = r3_197:hitTestLogLayerText("messageLog", "LogText01", r1_197, r2_197)
      if r4_197 >= 0 then
        r3_197:setVisible("messageLog", "VoiceUpper", 1)
        r3_197:setVisible("messageLog", "VoiceMid", 1)
        r3_197:setVisible("messageLog", "VoiceLower", 1)
        local r6_197 = 0
        local r8_197 = 0
        r5_197, r6_197, r7_197, r8_197 = r3_197:getLogTextRect("messageLog", "LogText01", 0, r6_197, 0, r8_197)
        r6_197 = r6_197 + 10
        r8_197 = math.ceil((r8_197 - 20) / 10) * 10
        local r9_197 = 0
        local r10_197 = 0
        local r11_197 = 0
        local r12_197 = 0
        r9_197, r10_197, r11_197, r12_197 = r3_197:getSubLayerParam("messageLog", "Log01", 10, LUA_PARAM_SIZE, r9_197, r10_197, r11_197, r12_197)
        local r13_197 = 0
        local r16_197 = 0
        r13_197, r14_197, r15_197, r16_197 = r3_197:getSubLayerParam("messageLog", "Log01", 10, LUA_PARAM_POS, r13_197, 0, 0, r16_197)
        r3_197:setParam("messageLog", "VoiceMid", LUA_PARAM_POS, r13_197, r6_197, 0, 0)
        r3_197:setParam("messageLog", "VoiceMid", LUA_PARAM_CENTERZ, 0, 0, 0, 0)
        r3_197:setParam("messageLog", "VoiceMid", LUA_PARAM_SCALE, 1, r8_197 / r10_197, 1, 0)
        if r8_197 <= 0 then
          r3_197:setVisible("messageLog", "VoiceMid", 0)
        end
        r9_197, r10_197, r11_197, r12_197 = r3_197:getParam("messageLog", "VoiceUpper", LUA_PARAM_SIZE, r9_197, r10_197, r11_197, r12_197)
        r3_197:setParam("messageLog", "VoiceUpper", LUA_PARAM_POS, r13_197, r6_197 - r10_197, r13_197, r16_197)
        r3_197:setParam("messageLog", "VoiceLower", LUA_PARAM_POS, r13_197, r6_197 + r8_197, r13_197, r16_197)
        if nose == false then
          local r17_197 = cclass.lua_Sounds:new()
          r17_197:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.cursor), g_SysSEName.cursor, getSoundVolume("systemse"))
          r17_197:delete()
        end
      else
        r3_197:setVisible("messageLog", "VoiceUpper", 0)
        r3_197:setVisible("messageLog", "VoiceMid", 0)
        r3_197:setVisible("messageLog", "VoiceLower", 0)
      end
      r0_197.textCursor = r4_197
    else
      r3_197:setVisible("messageLog", "VoiceUpper", 0)
      r3_197:setVisible("messageLog", "VoiceMid", 0)
      r3_197:setVisible("messageLog", "VoiceLower", 0)
      r0_197.textCursor = -1
    end
    r0_197:SetActive()
  end
  function g_Menu.BackLog.ptr.drawSceneJumpIcon(r0_198)
    -- line: [6590, 6667] id: 198
    local r1_198 = cclass.lua_Layers:create()
    local r2_198 = r1_198:getLogTextDrawCount("messageLog", "LogText01", 0)
    if r2_198 <= 0 then
      r0_198.iconCount = 0
      return 
    end
    local r4_198 = 0
    r3_198, r4_198 = r1_198:getLogTextLine("messageLog", "LogText01", 0, r4_198)
    local r5_198 = -1
    local r6_198 = 0
    r0_198.iconID = {}
    for r10_198 = r4_198, r4_198 + r2_198 - 1, 1 do
      local r11_198 = r1_198:getLogLineToIndex("messageLog", "LogText01", r10_198)
      r0_198.iconID[r6_198 + 1] = r11_198
      local r12_198 = 0
      r12_198 = r1_198:getIndexLogLayerText("messageLog", "LogText01", r11_198)
      if r5_198 ~= r12_198 then
        if r12_198 >= 0 then
          r6_198 = r6_198 + 1
        end
        r5_198 = r12_198
      end
    end
    if r0_198.iconCount ~= r6_198 then
      for r10_198 = 1, 50, 1 do
        local r11_198 = r0_198:GetJumpIcon(r10_198)
        if r6_198 < r10_198 then
          r1_198:setVisible("messageLog", r11_198, 0)
          r0_198.MenuButtonData[r0_198:GetJumpButton(r10_198)]:bt_SetActive(3)
        else
          r1_198:setVisible("messageLog", r11_198, 1)
          r0_198.MenuButtonData[r0_198:GetJumpButton(r10_198)]:bt_SetActive(0)
        end
      end
      r0_198.iconCount = r6_198
    end
    local r7_198 = 0
    local r9_198 = 0
    local r10_198 = 0
    r7_198, r8_198, r9_198, r10_198 = r1_198:getSubLayerParam("messageLog", "Log01", 6, LUA_PARAM_POS, r7_198, 0, r9_198, r10_198)
    local r12_198 = 0
    r11_198, r12_198, r13_198, r14_198 = r1_198:getSubLayerParam("messageLog", "Log01", 6, LUA_PARAM_SIZE, 0, r12_198, 0, 0)
    for r18_198 = 1, r0_198.iconCount, 1 do
      local r20_198 = 0
      local r22_198 = 0
      r19_198, r20_198, r21_198, r22_198 = r1_198:getLogTextRectIndex("messageLog", "LogText01", r0_198.iconID[r18_198], 0, r20_198, 0, r22_198)
      local r8_198 = math.floor(r20_198 + r22_198 / 2 - r12_198 / 2)
      r1_198:setParam("messageLog", r0_198:GetJumpIcon(r18_198), LUA_PARAM_POS, r7_198, r8_198, r9_198, r10_198)
      r0_198.MenuButtonData[r0_198:GetJumpButton(r18_198)]:bt_SetPos(r7_198, r8_198)
    end
    r0_198:FocusAfterCall()
    r0_198:InitSlideBar()
  end
  function g_Menu.BackLog.ptr.StartEffect(r0_199)
    -- line: [6669, 6698] id: 199
    local r1_199 = cclass.lua_Layers:create()
    if g_logWindowDisable then
      g_logSnapUpdate = false
      g_logTest = 0
    end
    r1_199:setSnap("system", true)
    r1_199:copySnap("messageLog", "system")
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
    r0_199.MenuInf.enabled = true
  end
  function g_Menu.BackLog.ptr.MenuEffectStart(r0_200, r1_200, r2_200)
    -- line: [6701, 6708] id: 200
    local r3_200 = cclass.lua_Layers:create()
    local r4_200 = cclass.lua_MeasureTime:new()
    local r5_200 = getEffectRate()
    r3_200:startTransition(r0_200.MenuInf.SetName, 0, 1, r1_200 * r5_200, r2_200 * r4_200:diff() * r5_200, LUA_TRANSITION_NORMAL)
    r4_200:delete()
  end
  function g_Menu.BackLog.ptr.EndEffect(r0_201)
    -- line: [6711, 6738] id: 201
    local r1_201 = cclass.lua_Layers:create()
    r1_201:stopLogVoice("messageLog", "LogText01")
    if g_logWindowDisable then
      g_logSnapUpdate = false
      g_logTest = 0
      r1_201:setSnap("messageLog", false)
    end
    r1_201:startTransition(r0_201.MenuInf.SetName, 0, 1, 300 * getEffectRate(), 0, LUA_TRANSITION_ERASE)
    r0_201.MenuInf.enabled = false
    r0_201.MenuInf.effect = true
  end
  local r0_180 = g_Menu.BackLog.ptr:MenuInit()
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
function closeMessageLog()
  -- line: [6779, 6786] id: 202
  if g_Menu.BackLog.ptr ~= nil and g_Menu.BackLog.ptr.MenuInf.enabled == true and g_Menu.BackLog.ptr.MenuInf.effect == false then
    g_Menu.BackLog.ptr:EndEffect()
  end
end
function drawSceneJumpIcon()
  -- line: [6790, 6794] id: 203
  if g_Menu.BackLog.ptr ~= nil then
    g_Menu.BackLog.ptr:drawSceneJumpIcon()
  end
end
function getMessageLogTextColor(r0_204)
  -- line: [6797, 6805] id: 204
  if r0_204 == 0 then
    return g_logNameColor.normal, g_logNameColor.normalEdge
  else
    return g_logTextColor.voice, g_logTextColor.voiceEdge
  end
end
function getMessageLogKey()
  -- line: [6808, 6811] id: 205
  return "messageLog", "LogText01"
end
function onUpdateDataState()
  -- line: [6815, 6831] id: 206
  -- notice: unreachable block#7
  local r0_206 = math.floor(g_sortData:size() / 10)
  if g_sortData:size() % 10 ~= 0 then
    r0_206 = r0_206 + 1
    if r0_206 then
      r0_206 = r0_206
    end
  end
  if r0_206 == 0 then
    r0_206 = 1
    if r0_206 then
      r0_206 = r0_206
    end
  end
  local r1_206 = math.floor((r0_206 - 1) / 10)
  g_dataInfo.mode = 0
  g_dataInfo.presspos = 0
  local r2_206 = g_configPage
  if r2_206 == 4 then
    r2_206 = true
  else
    r2_206 = false
  end
  g_Menu.Config.ptr:DataPage_SetActive(ConfigGetPageKeyName(g_configPage), r2_206, -1)
  g_SavedDataUpdateWeight = false
end
function onInitLogLayer()
  -- line: [6834, 6838] id: 207
  if g_Menu.BackLog.ptr ~= nil and g_Menu.BackLog.ptr.MenuInf.enabled == true then
    drawSceneJumpIcon()
  end
end
function screenChangeNotification()
  -- line: [6841, 6851] id: 208
  local r0_208 = g_screenMode
  if r0_208 == 0 then
    r0_208 = 1 or 0
  else
    goto label_6	-- block#2 is visited secondly
  end
  g_screenMode = r0_208
  if getSystemSet() == "configBase" and g_Menu.Config.ptr ~= nil and g_configPage == 1 then
    g_Menu.Config.ptr:updatePreviewSize(ConfigGetPageKeyName(g_configPage))
    g_Menu.Config.ptr:Page1_SetActive()
  end
end
function aspectChangeNotification(r0_209)
  -- line: [6852, 6862] id: 209
  g_zoomMode = r0_209
  if getSystemSet() == "configBase" and g_Menu.Config.ptr ~= nil and g_configPage == 1 then
    g_Menu.Config.ptr:updatePreviewSize(ConfigGetPageKeyName(g_configPage))
    g_Menu.Config.ptr:Page1_SetActive()
  end
end
function onMessageOutEnd(r0_210)
  -- line: [6863, 6883] id: 210
  if r0_210 == "configBase" and g_Menu.Config.ptr ~= nil and g_Menu.Config.ptr:GetMenuActive() and g_configPage == 2 then
    local r1_210 = cclass.lua_Layers:create()
    local r2_210 = nil
    local r3_210 = nil
    r2_210, r3_210 = getConfigText()
    g_Menu.Config.ptr.autoModeTimer:start(r1_210:messageLength("configBase", r2_210))
    local r5_210 = ConfigGetPageKeyName(g_configPage)
    g_Menu.Config.ptr:StartClkWait()
  end
end
function addFrame(r0_211, r1_211)
  -- line: [6885, 7072] id: 211
  -- notice: unreachable block#27
  -- notice: unreachable block#25
  -- notice: unreachable block#52
  -- notice: unreachable block#24
  -- notice: unreachable block#26
  -- notice: unreachable block#22
  -- notice: unreachable block#23
  if g_Menu.Config.ptr == nil and g_P1Renew ~= 0 then
    g_P1Renew = 0
    cclass.lua_Layers:create():setForceBG(false)
  end
  if r0_211 == "configBase" and g_Menu.Config.ptr ~= nil and g_Menu.Config.ptr:GetMenuActive() then
    if g_P1Renew ~= 0 then
      if g_P1Renew == 3 then
        g_P1Renew = 2
      elseif g_P1Renew == 2 then
        g_P1Renew = 1
        local r2_211 = cclass.lua_Layers:create()
        r2_211:removeSnap("system")
        r2_211:setSnap("system", true)
        if g_configPage == 1 then
          local r3_211 = cclass.lua_Layers:create()
          r3_211:clearHitTestAll("configBase", "configBase01")
          r3_211:removeLayer("configBase", "configBase01")
          local r4_211 = "sys_config_base.pna"
          local r5_211 = getUItype()
          if r5_211 == 0 then
            r4_211 = "sys_config_base.pna"
          end
          if r5_211 == 1 then
            r4_211 = "sys_config_base.pna"
          end
          if r5_211 == 2 then
          end
          g_Menu.Config.ptr:MenuLoadLayer("configBase01", r4_211)
          g_Menu.Config.ptr:initConfigButton()
          g_Menu.Config.ptr:SetConfigButtonActive(g_configPage)
          g_Menu.Config.ptr:ConfigLogo(g_configPage, -1, 0, 0)
          g_Menu.Config.ptr:DashboardMove(g_configPage, 0)
          g_Menu.Config.ptr:UpButtonMove(g_configPage, 0)
          r4_211 = ConfigGetPageFileName(g_configPage)
          r5_211 = ConfigGetPageKeyName(g_configPage)
          r3_211:clearHitTestAll("configBase", r5_211)
          r3_211:removeLayer("configBase", r5_211)
          local r6_211 = ConfigGetPageFileName(g_configPage)
          local r7_211 = ConfigGetPageKeyName(g_configPage)
          g_Menu.Config.ptr:MenuLoadLayer(r7_211, r6_211)
          g_Menu.Config.ptr:P1MenuInit(r7_211)
          g_Menu.Config.ptr:updatePreviewSize(r7_211)
          g_Menu.Config.ptr:Page1_SetActive()
          g_Menu.Config.ptr.MenuButton:SetList("MenuButtonData", g_Menu.Config.ptr.MenuButtonData)
          g_Menu.Config.ptr:SetConfigButtonActive(g_configPage)
          if g_menuExecute == false then
            for r11_211, r12_211 in pairs(g_Menu.Config.ptr.PreviewList) do
              if r12_211 ~= nil then
                cfunc.LegacyGame__lua_NeedPreview("configBase", r12_211)
                r3_211:swapLayerOrder("configBase", "configBase01", r12_211)
                r3_211:swapLayerOrder("configBase", r7_211, r12_211)
              end
            end
          end
          g_Menu.Config.ptr:updatePreviewSize(r7_211)
          g_Menu.Config.ptr:Page1_SetActive()
        end
      else
        g_P1Renew = 0
        cclass.lua_Layers:create():setForceBG(false)
      end
    end
    if g_configPage == 2 and g_Menu.Config.ptr.autoModeTimer:addFrame(r1_211) == true and g_msgspeed ~= 100 then
      startCfg2Preview()
    end
    if g_configPage == 3 and g_Menu.Config.ptr.SliderMoveNo == -1 then
      local r2_211 = g_mixer:getMasterVolume()
      if g_mixer:getMasterMute() ~= false or not r2_211 then
        r2_211 = 0
      end
      if g_Menu.Config.ptr.ButtonP3.SL_MasterVol:bt_GetParamX() ~= r2_211 then
        g_Menu.Config.ptr.ButtonP3.SL_MasterVol:bt_SetParamX(r2_211)
        g_Menu.Config.ptr:SetSlideActP3(g_Menu.Config.ptr.MenuButton.selCursor)
      end
    end
    if g_configPage == 4 or g_configPage == 5 then
      local r2_211 = false
      if g_Menu.Config.ptr.SaveJob == 4 then
        r2_211 = true
      end
      if g_Menu.Config.ptr.SaveJob == 1 or g_Menu.Config.ptr.SaveJob == 4 then
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEDATA, -1)
        if g_sortData ~= nil then
        end
        g_Menu.Config.ptr.SaveJob = 5
      end
      if g_Menu.Config.ptr.SaveJob == 5 then
        g_Menu.Config.ptr.SaveJob = 0
        local r3_211 = ConfigGetPageKeyName(g_configPage)
        local r4_211 = g_configPage
        if r4_211 == 4 then
          r4_211 = true
        else
          r4_211 = false
        end
        g_Menu.Config.ptr:deleteThumbnail(r4_211)
        for r8_211 = 1, 10, 1 do
          if r2_211 and r8_211 == g_dataInfo.data_no + 1 then
            initThumbnail(r4_211, r8_211 + (g_dataInfo.page - 1) * 10, true)
          else
            initThumbnail(r4_211, r8_211 + (g_dataInfo.page - 1) * 10, false)
          end
        end
        g_Menu.Config.ptr:DataPage_SetActive(r3_211, r4_211, -1)
      end
      if g_Menu.Config.ptr.SaveJob == 2 or g_Menu.Config.ptr.SaveJob == 3 then
        g_Menu.Config.ptr.SaveJob = 5
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEDATA, -1)
      end
    end
  elseif r0_211 == "messageLog" and g_Menu.BackLog.ptr ~= nil then
    g_Menu.BackLog.ptr:addFrame(r1_211)
  elseif r0_211 == "cmdLine" then
    setIMState()
  end
end
function onLogDraw()
  -- line: [7074, 7076] id: 212
  drawSceneJumpIcon()
end
function playSystemVoice(r0_213)
  -- line: [7080, 7086] id: 213
  playSystemVoiceNo(r0_213, getSystemvoiceNo())
end
function getSystemvoiceNo()
  -- line: [7088, 7104] id: 214
  local r0_214 = math.random(1, 9)
  r0_214 = os.time() % 9 + 1
  if g_sysVoiceChar ~= 999 then
    r0_214 = g_sysVoiceChar
  end
  return r0_214
end
function playSystemVoiceNo(r0_215, r1_215)
  -- line: [7107, 7640] id: 215
  -- notice: unreachable block#1
  -- notice: unreachable block#10
  local r2_215 = {
    "charHIKA",
    "charC_HIKA",
    "charSAYA",
    "charC_SAYA",
    "charORI",
    "charKORO",
    "charC_KORO",
    "charMIHA",
    "charTAKE",
    "charC_TAKE",
    "charYOSHI",
    "charKANO",
    "charJINNO",
    "charTAJI",
    "charCHAMP",
    "charKOTA",
    "charHINA",
    "charTOYO",
    "charKAWA",
    "charMORI"
  }
  if r2_215[r1_215] == nil then
    return 
  end
  local r3_215 = {
    [1] = {
      "HIKA_INF_0186.ogg",
      "HIKA_INF_0187.ogg",
      "HIKA_INF_0188.ogg",
      "HIKA_INF_0189.ogg",
      "HIKA_INF_0190.ogg",
      "HIKA_INF_0191.ogg",
      "HIKA_INF_0192.ogg",
      "HIKA_INF_0193.ogg",
      "HIKA_INF_0194.ogg",
      "HIKA_INF_0195.ogg",
      "HIKA_INF_0196.ogg",
      "HIKA_INF_0197.ogg",
      nil,
      nil,
      "HIKA_INF_0185.ogg",
      nil,
      nil,
      nil
    },
    [2] = {
      "C_HIKA_INF_0199.ogg",
      "C_HIKA_INF_0200.ogg",
      "C_HIKA_INF_0201.ogg",
      "C_HIKA_INF_0202.ogg",
      "C_HIKA_INF_0203.ogg",
      "C_HIKA_INF_0204.ogg",
      "C_HIKA_INF_0205.ogg",
      "C_HIKA_INF_0206.ogg",
      "C_HIKA_INF_0207.ogg",
      "C_HIKA_INF_0208.ogg",
      "C_HIKA_INF_0209.ogg",
      "C_HIKA_INF_0210.ogg",
      nil,
      nil,
      "C_HIKA_INF_0198.ogg",
      nil,
      nil,
      nil
    },
    [3] = {
      "SAYA_INF_0173.ogg",
      "SAYA_INF_0174.ogg",
      "SAYA_INF_0175.ogg",
      "SAYA_INF_0176.ogg",
      "SAYA_INF_0177.ogg",
      "SAYA_INF_0178.ogg",
      "SAYA_INF_0179.ogg",
      "SAYA_INF_0180.ogg",
      "SAYA_INF_0181.ogg",
      "SAYA_INF_0182.ogg",
      "SAYA_INF_0183.ogg",
      "SAYA_INF_0184.ogg",
      nil,
      nil,
      "SAYA_INF_0172.ogg",
      nil,
      nil,
      nil
    },
    [4] = {
      "C_SAYA_INF_0186.ogg",
      "C_SAYA_INF_0187.ogg",
      "C_SAYA_INF_0188.ogg",
      "C_SAYA_INF_0189.ogg",
      "C_SAYA_INF_0190.ogg",
      "C_SAYA_INF_0191.ogg",
      "C_SAYA_INF_0192.ogg",
      "C_SAYA_INF_0193.ogg",
      "C_SAYA_INF_0194.ogg",
      "C_SAYA_INF_0195.ogg",
      "C_SAYA_INF_0196.ogg",
      "C_SAYA_INF_0197.ogg",
      nil,
      nil,
      "C_SAYA_INF_0185.ogg",
      nil,
      nil,
      nil
    },
    [5] = {
      "ORI_INF_0134.ogg",
      "ORI_INF_0135.ogg",
      "ORI_INF_0136.ogg",
      "ORI_INF_0137.ogg",
      "ORI_INF_0138.ogg",
      "ORI_INF_0139.ogg",
      "ORI_INF_0140.ogg",
      "ORI_INF_0141.ogg",
      "ORI_INF_0142.ogg",
      "ORI_INF_0143.ogg",
      "ORI_INF_0144.ogg",
      "ORI_INF_0145.ogg",
      nil,
      nil,
      "ORI_INF_0133.ogg",
      nil,
      nil,
      nil
    },
    [6] = {
      "KORO_INF_0142.ogg",
      "KORO_INF_0143.ogg",
      "KORO_INF_0144.ogg",
      "KORO_INF_0145.ogg",
      "KORO_INF_0146.ogg",
      "KORO_INF_0147.ogg",
      "KORO_INF_0148.ogg",
      "KORO_INF_0149.ogg",
      "KORO_INF_0150.ogg",
      "KORO_INF_0151.ogg",
      "KORO_INF_0152.ogg",
      "KORO_INF_0153.ogg",
      nil,
      nil,
      "KORO_INF_0141.ogg",
      nil,
      nil,
      nil
    },
    [7] = {
      "C_KORO_INF_0155.ogg",
      "C_KORO_INF_0156.ogg",
      "C_KORO_INF_0157.ogg",
      "C_KORO_INF_0158.ogg",
      "C_KORO_INF_0159.ogg",
      "C_KORO_INF_0160.ogg",
      "C_KORO_INF_0161.ogg",
      "C_KORO_INF_0162.ogg",
      "C_KORO_INF_0163.ogg",
      "C_KORO_INF_0164.ogg",
      "C_KORO_INF_0165.ogg",
      "C_KORO_INF_0166.ogg",
      nil,
      nil,
      "C_KORO_INF_0154.ogg",
      nil,
      nil,
      nil
    },
    [8] = {
      "MIHA_INF_0045.ogg",
      "MIHA_INF_0046.ogg",
      "MIHA_INF_0047.ogg",
      "MIHA_INF_0048.ogg",
      "MIHA_INF_0049.ogg",
      "MIHA_INF_0050.ogg",
      "MIHA_INF_0051.ogg",
      "MIHA_INF_0052.ogg",
      "MIHA_INF_0053.ogg",
      "MIHA_INF_0054.ogg",
      "MIHA_INF_0055.ogg",
      "MIHA_INF_0056.ogg",
      nil,
      nil,
      "MIHA_INF_0044.ogg",
      nil,
      nil,
      nil
    },
    [9] = {
      "TAKE_INF_0023.ogg",
      "TAKE_INF_0024.ogg",
      "TAKE_INF_0025.ogg",
      "TAKE_INF_0026.ogg",
      "TAKE_INF_0027.ogg",
      "TAKE_INF_0028.ogg",
      "TAKE_INF_0029.ogg",
      "TAKE_INF_0030.ogg",
      "TAKE_INF_0031.ogg",
      "TAKE_INF_0032.ogg",
      "TAKE_INF_0033.ogg",
      "TAKE_INF_0034.ogg",
      nil,
      nil,
      "TAKE_INF_0022.ogg",
      nil,
      nil,
      nil
    },
    [10] = {
      "C_TAKE_INF_0002.ogg",
      "C_TAKE_INF_0003.ogg",
      "C_TAKE_INF_0004.ogg",
      "C_TAKE_INF_0005.ogg",
      "C_TAKE_INF_0006.ogg",
      "C_TAKE_INF_0007.ogg",
      "C_TAKE_INF_0008.ogg",
      "C_TAKE_INF_0009.ogg",
      "C_TAKE_INF_0010.ogg",
      "C_TAKE_INF_0011.ogg",
      "C_TAKE_INF_0012.ogg",
      "C_TAKE_INF_0013.ogg",
      nil,
      nil,
      "C_TAKE_INF_0001.ogg",
      nil,
      nil,
      nil
    },
    [11] = {
      "YOSHI_INF_0019.ogg",
      "YOSHI_INF_0020.ogg",
      "YOSHI_INF_0021.ogg",
      "YOSHI_INF_0022.ogg",
      "YOSHI_INF_0023.ogg",
      "YOSHI_INF_0024.ogg",
      "YOSHI_INF_0025.ogg",
      "YOSHI_INF_0026.ogg",
      "YOSHI_INF_0027.ogg",
      "YOSHI_INF_0028.ogg",
      "YOSHI_INF_0029.ogg",
      "YOSHI_INF_0030.ogg",
      nil,
      nil,
      "YOSHI_INF_0018.ogg",
      nil,
      nil,
      nil
    },
    [12] = {
      "KANO_INF_0018.ogg",
      "KANO_INF_0019.ogg",
      "KANO_INF_0020.ogg",
      "KANO_INF_0021.ogg",
      "KANO_INF_0022.ogg",
      "KANO_INF_0023.ogg",
      "KANO_INF_0024.ogg",
      "KANO_INF_0025.ogg",
      "KANO_INF_0026.ogg",
      "KANO_INF_0027.ogg",
      "KANO_INF_0028.ogg",
      "KANO_INF_0029.ogg",
      nil,
      nil,
      "KANO_INF_0017.ogg",
      nil,
      nil,
      nil
    },
    [13] = {
      "JINNO_INF_0021.ogg",
      "JINNO_INF_0022.ogg",
      "JINNO_INF_0023.ogg",
      "JINNO_INF_0024.ogg",
      "JINNO_INF_0025.ogg",
      "JINNO_INF_0026.ogg",
      "JINNO_INF_0027.ogg",
      "JINNO_INF_0028.ogg",
      "JINNO_INF_0029.ogg",
      "JINNO_INF_0030.ogg",
      "JINNO_INF_0031.ogg",
      "JINNO_INF_0032.ogg",
      nil,
      nil,
      "JINNO_INF_0020.ogg",
      nil,
      nil,
      nil
    },
    [14] = {
      "TAJI_INF_0008.ogg",
      "TAJI_INF_0009.ogg",
      "TAJI_INF_0010.ogg",
      "TAJI_INF_0011.ogg",
      "TAJI_INF_0012.ogg",
      "TAJI_INF_0013.ogg",
      "TAJI_INF_0014.ogg",
      "TAJI_INF_0015.ogg",
      "TAJI_INF_0016.ogg",
      "TAJI_INF_0017.ogg",
      "TAJI_INF_0018.ogg",
      "TAJI_INF_0019.ogg",
      nil,
      nil,
      "TAJI_INF_0007.ogg",
      nil,
      nil,
      nil
    },
    [15] = {
      "CHAMP_INF_0002.ogg",
      "CHAMP_INF_0003.ogg",
      "CHAMP_INF_0004.ogg",
      "CHAMP_INF_0005.ogg",
      "CHAMP_INF_0006.ogg",
      "CHAMP_INF_0007.ogg",
      "CHAMP_INF_0008.ogg",
      "CHAMP_INF_0009.ogg",
      "CHAMP_INF_0010.ogg",
      "CHAMP_INF_0011.ogg",
      "CHAMP_INF_0012.ogg",
      "CHAMP_INF_0013.ogg",
      nil,
      nil,
      "CHAMP_INF_0001.ogg",
      nil,
      nil,
      nil
    },
    [16] = {
      "KOTA_INF_0027.ogg",
      "KOTA_INF_0028.ogg",
      "KOTA_INF_0029.ogg",
      "KOTA_INF_0030.ogg",
      "KOTA_INF_0031.ogg",
      "KOTA_INF_0032.ogg",
      "KOTA_INF_0033.ogg",
      "KOTA_INF_0034.ogg",
      "KOTA_INF_0035.ogg",
      "KOTA_INF_0036.ogg",
      "KOTA_INF_0037.ogg",
      "KOTA_INF_0038.ogg",
      nil,
      nil,
      "KOTA_INF_0026.ogg",
      nil,
      nil,
      nil
    },
    [17] = {
      "HINA_INF_0011.ogg",
      "HINA_INF_0012.ogg",
      "HINA_INF_0013.ogg",
      "HINA_INF_0014.ogg",
      "HINA_INF_0015.ogg",
      "HINA_INF_0016.ogg",
      "HINA_INF_0017.ogg",
      "HINA_INF_0018.ogg",
      "HINA_INF_0019.ogg",
      "HINA_INF_0020.ogg",
      "HINA_INF_0021.ogg",
      "HINA_INF_0022.ogg",
      nil,
      nil,
      "HINA_INF_0010.ogg",
      nil,
      nil,
      nil
    },
    [18] = {
      "TOYO_INF_0002.ogg",
      "TOYO_INF_0003.ogg",
      "TOYO_INF_0004.ogg",
      "TOYO_INF_0005.ogg",
      "TOYO_INF_0006.ogg",
      "TOYO_INF_0007.ogg",
      "TOYO_INF_0008.ogg",
      "TOYO_INF_0009.ogg",
      "TOYO_INF_0010.ogg",
      "TOYO_INF_0011.ogg",
      "TOYO_INF_0012.ogg",
      "TOYO_INF_0013.ogg",
      nil,
      nil,
      "TOYO_INF_0001.ogg",
      nil,
      nil,
      nil
    },
    [19] = {
      "KAWA_INF_0002.ogg",
      "KAWA_INF_0003.ogg",
      "KAWA_INF_0004.ogg",
      "KAWA_INF_0005.ogg",
      "KAWA_INF_0006.ogg",
      "KAWA_INF_0007.ogg",
      "KAWA_INF_0008.ogg",
      "KAWA_INF_0009.ogg",
      "KAWA_INF_0010.ogg",
      "KAWA_INF_0011.ogg",
      "KAWA_INF_0012.ogg",
      "KAWA_INF_0013.ogg",
      nil,
      nil,
      "KAWA_INF_0001.ogg",
      nil,
      nil,
      nil
    },
    [20] = {
      "MORI_INF_0002.ogg",
      "MORI_INF_0003.ogg",
      "MORI_INF_0004.ogg",
      "MORI_INF_0005.ogg",
      "MORI_INF_0006.ogg",
      "MORI_INF_0007.ogg",
      "MORI_INF_0008.ogg",
      "MORI_INF_0009.ogg",
      "MORI_INF_0010.ogg",
      "MORI_INF_0011.ogg",
      "MORI_INF_0012.ogg",
      "MORI_INF_0013.ogg",
      nil,
      nil,
      "MORI_INF_0001.ogg",
      nil,
      nil,
      nil
    },
  }
  local r4_215 = cclass.lua_Sounds:new()
  for r8_215, r9_215 in pairs(r2_215) do
    local r10_215 = r9_215 .. "SysVoice"
    local r13_215 = "SndStop"
    r13_215 = r10_215
    r4_215:[r13_215](r13_215)
  end
  r4_215:delete()
  local r5_215 = r3_215[r1_215][r0_215]
  if r5_215 == nil then
    return 
  end
  local r6_215 = cclass.lua_Sounds:new()
  local r10_215 = "SndPlay"
  r10_215 = r2_215[r1_215] .. "SysVoice"
  r6_215:[r10_215](r10_215, getSoundArcFileName("systemvoice", r5_215), r5_215, getSoundVolume("systemVoice"))
  r6_215:delete()
end
AutoModeTimer = {}
function AutoModeTimer.new()
  -- line: [7651, 7683] id: 216
  return {
    textLength = 0,
    waitLength = 0,
    carryTime = 0,
    enable = false,
    start = function(r0_217, r1_217)
      -- line: [7658, 7663] id: 217
      r0_217.enable = true
      r0_217.textLength = r1_217
      r0_217.waitLength = 0
      r0_217.carryTime = 0
    end,
    addFrame = function(r0_218, r1_218)
      -- line: [7665, 7677] id: 218
      if r0_218.enable == true then
        local r2_218 = getAutoWaitTime()
        local r3_218 = math.floor((r1_218 + r0_218.carryTime) / r2_218)
        r0_218.carryTime = r1_218 + r0_218.carryTime - r2_218 * r3_218
        r0_218.waitLength = r0_218.waitLength + r3_218
        if r0_218.textLength <= r0_218.waitLength then
          return true
        end
      end
      return false
    end,
    reset = function(r0_219)
      -- line: [7679, 7681] id: 219
      r0_219.enable = false
    end,
  }
end
GraphBar = {}
function GraphBar.new(r0_220, r1_220, r2_220, r3_220, r4_220, r5_220, r6_220)
  -- line: [7689, 7781] id: 220
  return {
    now = 0,
    max = r2_220,
    layerset = r0_220,
    layerkey = r1_220,
    memberLayer = {
      r3_220,
      r4_220,
      r5_220,
      r6_220
    },
    init = function(r0_221, r1_221)
      -- line: [7697, 7713] id: 221
      local r2_221 = cclass.lua_Layers:create()
      for r6_221 = 1, #r0_221.memberLayer, 1 do
        r2_221:initSubLayer(r0_221.layerset, r0_221.layerkey, r0_221.memberLayer[r6_221], 1)
        if r6_221 == 1 then
          r2_221:setSubLayerParam(r0_221.layerset, r0_221.layerkey, r0_221.memberLayer[r6_221], LUA_PARAM_COLOR, 1, 1, 1, 0)
          r2_221:setSubLayerHitTest(r0_221.layerset, r0_221.layerkey, r0_221.memberLayer[r6_221], 1, 0.01)
        elseif r6_221 == 2 then
          r0_221:updateBar(r1_221)
        elseif r6_221 == 4 then
          r2_221:setSubLayerParam(r0_221.layerset, r0_221.layerkey, r0_221.memberLayer[r6_221], LUA_PARAM_COLOR, 1, 1, 1, 0)
        end
      end
    end,
    updateBar = function(r0_222, r1_222)
      -- line: [7715, 7729] id: 222
      if r0_222.max > 0 then
        local r2_222 = cclass.lua_Layers:create()
        if r1_222 == 0 then
          r2_222:setSubLayerParam(r0_222.layerset, r0_222.layerkey, r0_222.memberLayer[2], LUA_PARAM_COLOR, 1, 1, 1, 0)
        else
          r2_222:setSubLayerParam(r0_222.layerset, r0_222.layerkey, r0_222.memberLayer[2], LUA_PARAM_COLOR, 1, 1, 1, 1)
          local r3_222 = 0
          local r4_222 = 0
          r3_222, r4_222, r5_222, r6_222 = r2_222:getSubLayerParam(r0_222.layerset, r0_222.layerkey, r0_222.memberLayer[2], LUA_PARAM_SIZE, r3_222, r4_222, 0, 0)
          r2_222:setSubLayerParam(r0_222.layerset, r0_222.layerkey, r0_222.memberLayer[2], LUA_PARAM_RECT, 0, 0, r3_222 * r1_222 / r0_222.max, r4_222)
        end
      end
      r0_222.now = r1_222
    end,
    changeFocus = function(r0_223, r1_223, r2_223)
      -- line: [7731, 7745] id: 223
      local r3_223 = cclass.lua_Layers:create()
      if r2_223 == r0_223:getInput() then
        local r4_223 = cclass.lua_Sounds:new()
        r4_223:SndPlay("systemse", getSoundArcFileName("systemse", g_SysSEName.ok), g_SysSEName.ok, getSoundVolume("systemse"))
        r4_223:delete()
        r3_223:setSubLayerParam(r0_223.layerset, r0_223.layerkey, r0_223.memberLayer[3], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_223:setSubLayerParam(r0_223.layerset, r0_223.layerkey, r0_223.memberLayer[4], LUA_PARAM_COLOR, 1, 1, 1, 1)
      elseif r1_223 == r0_223:getInput() then
        r3_223:setSubLayerParam(r0_223.layerset, r0_223.layerkey, r0_223.memberLayer[3], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_223:setSubLayerParam(r0_223.layerset, r0_223.layerkey, r0_223.memberLayer[4], LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
    end,
    onLButtonDown = function(r0_224, r1_224, r2_224, r3_224, r4_224)
      -- line: [7747, 7771] id: 224
      if r1_224 == r0_224:getInput() then
        local r5_224 = cclass.lua_Layers:create()
        local r6_224 = 0
        r6_224, r7_224, r8_224, r9_224 = r5_224:getSubLayerParam(r0_224.layerset, r0_224.layerkey, r0_224.memberLayer[2], LUA_PARAM_SIZE, r6_224, 0, 0, 0)
        local r10_224 = 0
        r10_224, r11_224, r12_224, r13_224 = r5_224:getSubLayerParam(r0_224.layerset, r0_224.layerkey, r0_224.memberLayer[2], LUA_PARAM_POS, r10_224, 0, 0, 0)
        local r14_224 = r4_224
        if r2_224 <= r10_224 then
          r14_224 = 0
        elseif r10_224 + r6_224 <= r2_224 then
          r14_224 = r2_220
        else
          r14_224 = math.modf(r2_220 * (r2_224 - r10_224) / r6_224)
        end
        if r4_224 ~= r14_224 then
          r0_224:updateBar(r14_224)
        end
        return r14_224
      end
      return r4_224
    end,
    getInput = function(r0_225)
      -- line: [7773, 7775] id: 225
      return r0_225.memberLayer[1]
    end,
    getValue = function(r0_226)
      -- line: [7777, 7779] id: 226
      return r0_226.now
    end,
  }
end
function GetLayerRect(r0_227, r1_227, r2_227)
  -- line: [7789, 7811] id: 227
  local r3_227 = 0
  local r4_227 = 0
  local r5_227 = 0
  local r6_227 = 0
  local r7_227 = 0
  local r8_227 = 0
  local r9_227 = 0
  local r10_227 = 0
  local r11_227 = cclass.lua_Layers:create()
  local r12_227 = nil
  local r13_227 = nil
  r12_227, r13_227, r9_227, r10_227 = r11_227:getParam(r0_227, r1_227, LUA_PARAM_POS, r7_227, r8_227, r9_227, r10_227)
  if r1_227 ~= -1 and r2_227 ~= -1 then
    r7_227, r8_227, r9_227, r10_227 = r11_227:getSubLayerParam(r0_227, r1_227, r2_227, LUA_PARAM_POS, r7_227, r8_227, r9_227, r10_227)
    r7_227 = r7_227 + r12_227
    r8_227 = r8_227 + r13_227
    r3_227 = r7_227
    r4_227 = r8_227
    r7_227, r8_227, r9_227, r10_227 = r11_227:getSubLayerParam(r0_227, r1_227, r2_227, LUA_PARAM_SIZE, r7_227, r8_227, r9_227, r10_227)
    r5_227 = r7_227 + r3_227
    r6_227 = r8_227 + r4_227
  end
  return r3_227, r4_227, r5_227, r6_227
end
function SetAutoOncursor(r0_228, r1_228, r2_228, r3_228)
  -- line: [7814, 7824] id: 228
  local r4_228 = cclass.lua_Layers:create()
  local r5_228 = 0
  local r6_228 = 0
  local r7_228 = 0
  local r8_228 = 0
  r5_228, r6_228, r7_228, r8_228 = r4_228:getSubLayerParam(r0_228, r1_228, r2_228, LUA_PARAM_SIZE, r5_228, r6_228, r7_228, r8_228)
  local r9_228 = 0
  local r10_228 = 0
  r9_228, r10_228, r7_228, r8_228 = r4_228:getSubLayerParam(r0_228, r1_228, r2_228, LUA_PARAM_POS, r9_228, r10_228, r7_228, r8_228)
  SetAutoOncursorPos(r9_228 + r5_228 / 2, r10_228 + r6_228 / 2, r3_228)
end
function SetAutoOncursorPos(r0_229, r1_229, r2_229)
  -- line: [7827, 7832] id: 229
  local r3_229 = cclass.lua_AutoCursor:new()
  r3_229:AutoCursor(r0_229, r1_229, r2_229)
  r3_229:SetCursor(0)
  r3_229:delete()
end
function split(r0_230, r1_230)
  -- line: [7836, 7850] id: 230
  if string.find(r0_230, r1_230) == nil then
    return {
      r0_230
    }
  end
  local r2_230 = {}
  local r4_230 = nil
  for r8_230, r9_230 in string.gfind(r0_230, "(.-)" .. r1_230 .. "()") do
    table.insert(r2_230, r8_230)
    r4_230 = r9_230
  end
  table.insert(r2_230, string.sub(r0_230, r4_230))
  return r2_230
end
function openTestMenu(r0_231, r1_231)
  -- line: [7855, 7858] id: 231
end
g_TitleInit = false
function openTitle()
  -- line: [7903, 8320] id: 232
  g_Menu.GameTitle.ptr = Menu.new("titleMenu")
  local r0_232 = cclass.lua_AutoCursor:new()
  r0_232:SetCursor(0)
  r0_232:delete()
  function g_Menu.GameTitle.ptr.MenuEffect(r0_233)
    -- line: [7925, 7935] id: 233
    local r1_233 = false
    r1_233 = r0_233:MenuEffectTransJob()
    if r0_233.MenuInf.effect == true and r1_233 == false then
      r0_233:MenuEffectEndJob()
      r0_233.MenuInf.effect = false
    end
    return r1_233
  end
  function g_Menu.GameTitle.ptr.MenuEffectTransJob(r0_234)
    -- line: [7937, 7947] id: 234
    local r1_234 = cclass.lua_Layers:create()
    if r0_234.MenuInf.enabled == true then
      return r1_234:isEffect(r0_234.MenuInf.SetName, "TitleDisp")
    else
      return r1_234:isTransition(r0_234.MenuInf.SetName)
    end
  end
  function g_Menu.GameTitle.ptr.MenuEffectEndJob(r0_235)
    -- line: [7949, 8003] id: 235
    local r1_235 = cclass.lua_Layers:create()
    if r0_235.MenuInf.enabled == true then
      r0_235.MenuButton:ResetColor(r0_235.MenuButtonData)
      local r2_235 = 0
      local r3_235 = 0
      local r4_235 = cclass.lua_AutoCursor:new()
      r2_235, r3_235 = r4_235:GetCursorPos(r2_235, r3_235)
      r4_235:delete()
      r0_235.MenuButton:changeButton(r0_235.MenuInf.SetName, r1_235:getCursorPos(r0_235.MenuInf.SetName, r2_235, r3_235, 0) - 1, r2_235, r3_235)
      local r6_235 = 0
      if r0_235.MenuButton.selCursor ~= -1 then
        r6_235 = r0_235.MenuButton.selListKey[r0_235.MenuButton.selCursor].bt_l
      end
      r0_235:TitleSelCursor(r0_235.MenuButton.selCursor, r6_235, r2_235, r3_235)
      if g_TitleInit == false then
        playSystemVoice(SYSVOICE_TITLECALL)
      end
      g_TitleInit = true
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin.MenuInf.enabled = false
        g_MenuMsgWin.MenuInf.effect = false
      end
    else
      r1_235:remove(r0_235.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_235.MenuInf.ButtonLayer = ""
      r0_235.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.GameTitle.ptr.MenuEffectStart(r0_236, r1_236, r2_236, r3_236)
    -- line: [8007, 8033] id: 236
    if r3_236 == 0 then
      local r4_236 = cclass.lua_Sounds:new()
      if r0_236.CompFlag then
        r4_236:BgmPlay("systembgm", getSoundArcFileName("BGM", ".ogg"), "bgm26.ogg", getSoundVolume("BGM"))
        cfunc.LegacyGame__lua_SetVariable(120, 26)
      else
        r4_236:BgmPlay("systembgm", getSoundArcFileName("BGM", ".ogg"), "bgm01.ogg", getSoundVolume("BGM"))
        cfunc.LegacyGame__lua_SetVariable(120, 2)
      end
      r4_236:delete()
    end
    r0_236.MenuInf.effect = true
    r0_236.MenuInf.enabled = true
    local r4_236 = cclass.lua_Layers:create()
    local r5_236 = cclass.lua_MeasureTime:new()
    local r6_236 = getEffectRate()
    r4_236:startTransition(r0_236.MenuInf.SetName, 0, 1, r1_236 * r6_236, r2_236 * r5_236:diff() * r6_236, LUA_TRANSITION_NORMAL)
    r5_236:delete()
  end
  g_Menu.GameTitle.ptr.EffectButtonKeyList = {}
  function g_Menu.GameTitle.ptr.CancelMenuEffect(r0_237)
    -- line: [8037, 8049] id: 237
    if r0_237.MenuInf.effect == true and r0_237.MenuInf.enabled == true then
      local r1_237 = cclass.lua_Layers:create()
      for r5_237, r6_237 in pairs(r0_237.EffectButtonKeyList) do
        r1_237:cancelSubLayerEffect("titleMenu", "titleBase01", r6_237, "TitleDisp")
        r1_237:setSubLayerParam("titleMenu", "titleBase01", r6_237, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r1_237:setSubLayerParam("titleMenu", "titleBase01", r6_237, LUA_PARAM_SCALE, 1, 1, 1, 0)
        if r6_237.flag == true then
          r1_237:setSubLayerParam("titleMenu", "titleBase01", r5_237, LUA_PARAM_POS, r6_237.x, r6_237.y, 0, 0)
        end
      end
    end
  end
  function g_Menu.GameTitle.ptr.MenuButtonJob(r0_238, r1_238, r2_238)
    -- line: [8053, 8124] id: 238
    if r1_238 ~= 0 and r2_238 == "LU" then
      if r1_238 == 500 then
        if g_AnketoURL ~= nil then
          cfunc.LegacyGame__lua_NeedShell(g_AnketoURL)
        end
        return 
      end
      local r3_238 = cclass.lua_Layers:create()
      r3_238:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_238)
      if r1_238 == 100 or r1_238 == 120 or r1_238 == 121 or r1_238 == 130 then
        playSystemVoice(SYSVOICE_TITLESTART)
      end
      if r1_238 == 100 or r1_238 == 104 or r1_238 == 105 or r1_238 == 106 or r1_238 == 107 or r1_238 == 108 or r1_238 == 109 or r1_238 == 120 or r1_238 == 121 or r1_238 == 130 then
        r3_238:removeSnap("system")
        if r1_238 == 104 then
          cfunc.LegacyGame__lua_SetVariable(90, getSystemvoiceNo())
        elseif cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_238:MenuEffectEnd(0)
        g_menuExecute = false
      else
        if r1_238 == 103 then
        end
        r3_238:rtSnap("system")
      end
      r0_238.MenuInf.enabled = false
      r0_238.MenuInf.effect = true
    end
    if r2_238 == "LD" then
      r0_238:CancelMenuEffect()
    end
  end
  function g_Menu.GameTitle.ptr.MenuKeyDown(r0_239, r1_239, r2_239, r3_239, r4_239)
    -- line: [8127, 8134] id: 239
    if r4_239 == true then
      return 
    end
    if r0_239.MenuInf.effect == false then
      local r5_239 = r0_239.MenuButton.selCursor
    end
  end
  g_Menu.GameTitle.ptr.defaultMenuMouseMove = g_Menu.GameTitle.ptr.MenuMouseMove
  function g_Menu.GameTitle.ptr.MenuMouseMove(r0_240, r1_240, r2_240, r3_240, r4_240, r5_240, r6_240)
    -- line: [8139, 8147] id: 240
    r0_240:defaultMenuMouseMove(r1_240, r2_240, r3_240, r4_240, r5_240, r6_240)
    local r7_240 = 0
    if r0_240.MenuButton.selCursor ~= -1 then
      r7_240 = r0_240.MenuButton.selListKey[r0_240.MenuButton.selCursor].bt_l
    end
    r0_240:TitleSelCursor(r0_240.MenuButton.selCursor, r7_240, r4_240, r5_240)
  end
  function g_Menu.GameTitle.ptr.MenuInit(r0_241, r1_241, r2_241)
    -- line: [8153, 8182] id: 241
    local r3_241 = true
    r0_241.MenuInf.enabled = false
    r0_241.MenuInf.effect = false
    r0_241.MenuInf.ButtonLayer = r1_241
    r0_241.MenuInf.ButtonPna = r2_241
    local r4_241 = cclass.lua_Layers:create()
    if r4_241:add(r0_241.MenuInf.SetName) == false then
      return false
    end
    if r0_241.CompFlag == true then
      r4_241:insertMovieLayer(r0_241.MenuInf.SetName, "%MovieTitle%", "EFmov_04_lp.dat", 1)
    end
    r0_241:MenuLoadLayer(r1_241, r2_241)
    r0_241.MenuButton = Button.new(r0_241.MenuInf.SetName)
    r0_241.MenuButton:InitList()
    r0_241.MenuButtonData = {}
    return r3_241
  end
  function g_Menu.GameTitle.ptr.TitleMenuInit(r0_242)
    -- line: [8184, 8267] id: 242
    -- notice: unreachable block#11
    local r1_242 = g_Menu.GameTitle.ptr:MenuInit("titleBase01", "Sys_Title.pna")
    if res == false then
      return false
    end
    local r2_242 = cclass.lua_Layers:create()
    if g_TrialFlag >= 1 then
      r2_242:initSubLayer("titleMenu", "titleBase01", 27, 1)
    end
    r2_242:initSubLayer("titleMenu", "titleBase01", 28, 1)
    r2_242:initSubLayer("titleMenu", "titleBase01", 29, 1)
    r2_242:initSubLayer("titleMenu", "titleBase01", 32, 1)
    r2_242:initSubLayer("titleMenu", "titleBase01", 33, 1)
    r2_242:initSubLayer("titleMenu", "titleBase01", 34, 1)
    r2_242:initSubLayer("titleMenu", "titleBase01", 35, 1)
    r2_242:initSubLayer("titleMenu", "titleBase01", 36, 1)
    if r0_242.CompFlag == false then
      r2_242:initSubLayer("titleMenu", "titleBase01", 38, 1)
      r2_242:initSubLayer("titleMenu", "titleBase01", 39, 1)
    end
    local r3_242 = r0_242.MenuButtonData
    local r4_242 = 100
    if g_TrialFlag == 1 then
      r4_242 = 120
    end
    if g_TrialFlag == 2 then
      r4_242 = 121
    end
    r0_242:MenuButtonSet(r0_242.MenuButtonData, "start", 0, "titleBase01", 7, 7, 15, -1, 23, r4_242, 0, 0)
    r0_242:MenuButtonSet(r0_242.MenuButtonData, "load", 0, "titleBase01", 6, 6, 14, -1, 22, 101, 0, 0)
    r0_242:MenuButtonSet(r0_242.MenuButtonData, "exit", 0, "titleBase01", 5, 5, 13, -1, 21, 104, 0, 0)
    r0_242:MenuButtonSet(r0_242.MenuButtonData, "config", 0, "titleBase01", 4, 4, 12, -1, 20, 102, 0, 0)
    r0_242:MenuButtonSet(r0_242.MenuButtonData, "gallery", 0, "titleBase01", 3, 3, 11, -1, 19, 103, 0, 0)
    r0_242:MenuButtonInit()
    if g_TrialFlag ~= 0 then
      r0_242.MenuButtonData.gallery:bt_SetActive(2)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
      r0_242.MenuButtonData.load:bt_SetActive(2)
    end
    r0_242.MenuButton:SetColor(r0_242.MenuButtonData, 0, 0, 0, 0)
    return true
  end
  function g_Menu.GameTitle.ptr.TitleSelCursor(r0_243, r1_243, r2_243, r3_243, r4_243)
    -- line: [8270, 8271] id: 243
  end
  g_Menu.GameTitle.ptr.CompFlag = cfunc.LegacyGame__lua_GetFlag(1000)
  if g_TrialFlag >= 1 then
    g_Menu.GameTitle.ptr.CompFlag = false
  end
  local r1_232 = g_Menu.GameTitle.ptr:TitleMenuInit()
  if r1_232 == false then
    return r1_232
  end
  local r2_232 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r2_232:setSnap("system", true)
    r2_232:copySnap("titleMenu", "system")
    g_Menu.GameTitle.ptr:MenuEffectStart(300, 0, 0)
  else
    r2_232:copySnap("titleMenu", "system")
    g_Menu.GameTitle.ptr:MenuEffectStart(300, 0, 1)
  end
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function openGalleryTitle(r0_244, r1_244)
  -- line: [8327, 8460] id: 244
  cfunc.LegacyGame__lua_SetVariable(103, 1)
  return 
  g_Menu.GalleryTitle.ptr = Menu.new("GalleryTitle")
  function g_Menu.GalleryTitle.ptr.MenuButtonJob(r0_245, r1_245, r2_245)
    -- line: [8341, 8393] id: 245
    if r1_245 ~= 0 and r2_245 == "LU" then
      local r3_245 = cclass.lua_Layers:create()
      r3_245:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(103, r1_245)
      if r1_245 == 6 then
        r3_245:removeSnap("system")
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_245:MenuEffectEnd(0)
        local r4_245 = cclass.lua_Sounds:new()
        r4_245:BgmStop("systembgm", 500)
        r4_245:delete()
        g_menuExecute = false
      elseif r1_245 == 7 then
        r3_245:removeSnap("system")
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_245:MenuEffectEnd(0)
        local r4_245 = cclass.lua_Sounds:new()
        r4_245:BgmStop("systembgm", 500)
        r4_245:delete()
        g_menuExecute = false
      else
        r3_245:rtSnap("system")
      end
      r0_245.MenuInf.enabled = false
      r0_245.MenuInf.effect = true
    end
    if r2_245 == "RU" and r0_245:GetMenuMouseEnable() and r1_245 == 0 then
      r0_245:SystemSePlay(g_SysSEName.cancel)
      local r3_245 = cclass.lua_Layers:create()
      r3_245:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(103, -1)
      r3_245:rtSnap("system")
      r0_245.MenuInf.enabled = false
      r0_245.MenuInf.effect = true
    end
  end
  g_Menu.GalleryTitle.ptr.PatchFlag = false
  local r2_244 = g_Menu.GalleryTitle.ptr:MenuInit("GTitle01", "Sys_Title.pna")
  if res == false then
    return false
  end
  local r3_244 = cclass.lua_Layers:create()
  if g_TrialFlag == 0 then
    r3_244:initSubLayer("GalleryTitle", "GTitle01", 15, 1)
  end
  if g_TrialFlag == 1 then
    r3_244:initSubLayer("GalleryTitle", "GTitle01", 16, 1)
  end
  r3_244:initSubLayer("GalleryTitle", "GTitle01", 17, 1)
  r3_244:initSubLayer("GalleryTitle", "GTitle01", 18, 1)
  r3_244:initSubLayer("GalleryTitle", "GTitle01", 72, 1)
  r3_244:initSubLayer("GalleryTitle", "GTitle01", 74, 1)
  r3_244:initSubLayer("GalleryTitle", "GTitle01", 75, 1)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Cg", 1, "GTitle01", 5, 70, 69, -1, 68, 1, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Replay", 1, "GTitle01", 4, 65, 64, -1, 63, 2, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Bgm", 1, "GTitle01", 3, 60, 59, -1, 58, 3, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Ret", 1, "GTitle01", 2, 55, 54, -1, 53, -1, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonInit()
  r3_244:copySnap("GalleryTitle", "system")
  g_Menu.GalleryTitle.ptr:MenuEffectStart(300, 0)
  g_Menu.GalleryTitle.ptr.MenuInf.effect = true
  g_Menu.GalleryTitle.ptr.MenuInf.enabled = true
  g_menuExecute = true
  return true
end
function openTips(r0_246, r1_246)
  -- line: [8473, 8476] id: 246
  g_MenuMsgWin:MenuInitTips(r1_246)
end
function closeTips(r0_247, r1_247)
  -- line: [8478, 8484] id: 247
  if r1_247 == 0 then
    g_MenuMsgWin:closeTips()
  else
    g_MenuMsgWin:SetTipsCloseCount(r1_247)
  end
end
function LoadTips(r0_248, r1_248)
  -- line: [8488, 8490] id: 248
  g_MenuMsgWin:MenuLoadTips()
end
g_DisableGestureFlag = false
g_DisableDataBackup = false
function DisableSC(r0_249, r1_249)
  -- line: [8499, 8512] id: 249
  if r1_249 == 1 then
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
function openCharSelect(r0_250, r1_250)
  -- line: [8518, 8650] id: 250
  g_Menu.CharSelect.ptr = Menu.new("CharSelect")
  function g_Menu.CharSelect.ptr.MenuEffectEndJob(r0_251)
    -- line: [8526, 8553] id: 251
    local r1_251 = cclass.lua_Layers:create()
    if r0_251.MenuInf.enabled == true then
      local r2_251 = 0
      local r3_251 = 0
      local r4_251 = cclass.lua_AutoCursor:new()
      r2_251, r3_251 = r4_251:GetCursorPos(r2_251, r3_251)
      r4_251:delete()
      r0_251.MenuButton:changeButton(r0_251.MenuInf.SetName, r1_251:getCursorPos(r0_251.MenuInf.SetName, r2_251, r3_251, 0) - 1, r2_251, r3_251)
    else
      if g_menuExecute == false then
        r1_251:removeSnap("system")
      end
      r1_251:remove(r0_251.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_251.MenuInf.ButtonLayer = ""
      r0_251.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.CharSelect.ptr.MenuButtonJob(r0_252, r1_252, r2_252)
    -- line: [8556, 8593] id: 252
    if r1_252 ~= 0 and r2_252 == "LU" then
      local r3_252 = cclass.lua_Layers:create()
      r3_252:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_252)
      r3_252:removeSnap("system")
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      r0_252:MenuEffectEnd(0)
      local r4_252 = cclass.lua_Sounds:new()
      r4_252:BgmStop("systembgm", 500)
      r4_252:delete()
      g_menuExecute = false
      r0_252.MenuInf.enabled = false
      r0_252.MenuInf.effect = true
    end
    if r2_252 == "RU" and r0_252:GetMenuMouseEnable() and r1_252 == 0 then
      r0_252:SystemSePlay(g_SysSEName.cancel)
      local r3_252 = cclass.lua_Layers:create()
      r3_252:removeSnap("system")
      r3_252:rtSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_252.MenuInf.enabled = false
      r0_252.MenuInf.effect = true
    end
  end
  function g_Menu.CharSelect.ptr.CharSelectInit(r0_253, r1_253, r2_253)
    -- line: [8595, 8615] id: 253
    cclass.lua_Layers:create():initSubLayer("CharSelect", "CharSel01", 20, 1)
    for r7_253 = 1, 7, 1 do
      local r9_253 = 2 + r7_253 - 1
      r0_253:MenuButtonSet(r0_253.MenuButtonData, "CharSelect" .. tostring(r7_253), 0, "CharSel01", r9_253, r9_253, 11 + r7_253 - 1, -1, -1, r7_253, 0, 0)
    end
    r0_253:MenuButtonInit()
  end
  local r2_250 = g_Menu.CharSelect.ptr:MenuInit("CharSel01", "Sys_CharSelect.pna")
  if res == false then
    return false
  end
  g_Menu.CharSelect.ptr:CharSelectInit()
  local r3_250 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r3_250:setSnap("system", true)
    r3_250:copySnap("CharSelect", "system")
    g_Menu.CharSelect.ptr:MenuEffectStart(300, 0, 0)
  else
    r3_250:copySnap("CharSelect", "system")
    g_Menu.CharSelect.ptr:MenuEffectStart(300, 0, 1)
  end
  cfunc.LegacyGame__lua_SetVariable(99, -1)
  g_Menu.CharSelect.ptr.MenuInf.effect = true
  g_Menu.CharSelect.ptr.MenuInf.enabled = true
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function openSceneSelect(r0_254, r1_254)
  -- line: [8661, 8815] id: 254
  g_Menu.SceneSelect.ptr = Menu.new("SceneSelect")
  function g_Menu.SceneSelect.ptr.MenuEffectEndJob(r0_255)
    -- line: [8669, 8696] id: 255
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
  function g_Menu.SceneSelect.ptr.MenuButtonJob(r0_256, r1_256, r2_256)
    -- line: [8699, 8736] id: 256
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
  function g_Menu.SceneSelect.ptr.TrialInit(r0_257, r1_257, r2_257)
    -- line: [8738, 8779] id: 257
    cclass.lua_Layers:create():initSubLayer("SceneSelect", "SceneSelect01", 19, 1)
    for r7_257 = 1, 4, 1 do
      local r9_257 = 11 - r7_257 - 1
      r0_257:MenuButtonSet(r0_257.MenuButtonData, "Scene" .. tostring(r7_257), 0, "SceneSelect01", r9_257, r9_257, 5 - r7_257 - 1, -1, 17 - r7_257 - 1, r7_257, 0, 0)
    end
    r0_257:MenuButtonInit()
    if cfunc.LegacyGame__lua_GetFlag(1001) == false then
      r0_257.MenuButtonData.Scene1:bt_SetActive(2)
    end
    if cfunc.LegacyGame__lua_GetFlag(1003) == false then
      r0_257.MenuButtonData.Scene2:bt_SetActive(2)
    end
    if cfunc.LegacyGame__lua_GetFlag(1004) == false then
      r0_257.MenuButtonData.Scene3:bt_SetActive(2)
    end
    local r7_257 = cfunc.LegacyGame__lua_GetFlag(1002)
    local r8_257 = cfunc.LegacyGame__lua_GetFlag(1005)
    if r7_257 == false or r8_257 == false then
      r0_257.MenuButtonData.Scene4:bt_SetActive(2)
    end
  end
  local r2_254 = g_Menu.SceneSelect.ptr:MenuInit("SceneSelect01", "SYS_After.pna")
  if res == false then
    return false
  end
  g_Menu.SceneSelect.ptr:TrialInit()
  local r3_254 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r3_254:setSnap("system", true)
    r3_254:copySnap("SceneSelect", "system")
    g_Menu.SceneSelect.ptr:MenuEffectStart(300, 0, 0)
  else
    r3_254:copySnap("SceneSelect", "system")
    g_Menu.SceneSelect.ptr:MenuEffectStart(300, 0, 1)
  end
  g_Menu.SceneSelect.ptr.MenuInf.effect = true
  g_Menu.SceneSelect.ptr.MenuInf.enabled = true
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function openMoveBrowser(r0_258, r1_258)
  -- line: [8823, 8995] id: 258
  g_Menu.MoveBrowser.ptr = Menu.new("MoveBrowser")
  function g_Menu.MoveBrowser.ptr.MenuInit(r0_259)
    -- line: [8835, 8847] id: 259
    local r1_259 = true
    r0_259.MenuInf.enabled = true
    r0_259.MenuInf.effect = true
    if cclass.lua_Layers:create():add(r0_259.MenuInf.SetName) == false then
      return false
    end
    return r1_259
  end
  function g_Menu.MoveBrowser.ptr.MenuEffectEndJob(r0_260)
    -- line: [8850, 8864] id: 260
    local r1_260 = cclass.lua_Layers:create()
    if r0_260.MenuInf.enabled ~= true then
      r1_260:removeLayer(r0_260.MenuInf.SetName, "%EventMove%")
      r1_260:remove(r0_260.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_260.MenuInf.ButtonLayer = ""
      r0_260.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.MoveBrowser.ptr.MenuEffectStart(r0_261, r1_261)
    -- line: [8867, 8875] id: 261
    cclass.lua_Layers:create():startTransition(r0_261.MenuInf.SetName, 0, 1, r1_261 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_261.MenuInf.enabled = true
    r0_261.MenuInf.effect = true
  end
  function g_Menu.MoveBrowser.ptr.GetMenuMouseEnable(r0_262)
    -- line: [8877, 8888] id: 262
    local r1_262 = false
    if r0_262.MenuInf.enabled == true and r0_262.MenuInf.effect == false then
      r1_262 = true
    end
    return r1_262
  end
  function g_Menu.MoveBrowser.ptr.MenuMouseMove(r0_263, r1_263, r2_263, r3_263, r4_263, r5_263, r6_263)
    -- line: [8894, 8900] id: 263
    if r6_263 == true then
      return 
    end
    if r0_263:GetMenuMouseEnable() then
    end
  end
  function g_Menu.MoveBrowser.ptr.MenuLButtonDown(r0_264, r1_264, r2_264, r3_264, r4_264, r5_264, r6_264)
    -- line: [8902, 8913] id: 264
    local r7_264 = 0
    if r6_264 == true then
      return r7_264
    end
    if r0_264:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, 0)
      r0_264:closeBrowser()
    end
    return r7_264
  end
  function g_Menu.MoveBrowser.ptr.MenuLButtonUp(r0_265, r1_265, r2_265, r3_265, r4_265, r5_265, r6_265)
    -- line: [8915, 8921] id: 265
    local r7_265 = 0
    if r6_265 == true then
      return r7_265
    end
    return r7_265
  end
  function g_Menu.MoveBrowser.ptr.MenuRButtonDown(r0_266, r1_266, r2_266, r3_266, r4_266, r5_266, r6_266)
    -- line: [8923, 8931] id: 266
    local r7_266 = 0
    if r6_266 == true then
      return r7_266
    end
    if r0_266:GetMenuMouseEnable() then
    end
    return r7_266
  end
  function g_Menu.MoveBrowser.ptr.MenuRButtonUp(r0_267, r1_267, r2_267, r3_267, r4_267, r5_267, r6_267)
    -- line: [8933, 8946] id: 267
    local r7_267 = 0
    if r6_267 == true then
      return r7_267
    end
    if r0_267:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_267:closeBrowser()
    end
    return r7_267
  end
  function g_Menu.MoveBrowser.ptr.LoadMove(r0_268, r1_268, r2_268)
    -- line: [8952, 8957] id: 268
    return cclass.lua_Layers:create():insertMovieLayer(r0_268.MenuInf.SetName, r1_268, r2_268, 1)
  end
  function g_Menu.MoveBrowser.ptr.closeBrowser(r0_269)
    -- line: [8961, 8969] id: 269
    r0_269:MenuEffectToMenu(0)
    r0_269.MenuInf.enabled = false
    r0_269.MenuInf.effect = true
    cclass.lua_Layers:create():rtSnap("system")
  end
  local r2_258 = g_Menu.MoveBrowser.ptr:MenuInit()
  if res == false then
    return false
  end
  g_Menu.MoveBrowser.ptr._number = r1_258
  if g_Menu.MoveBrowser.ptr:LoadMove("%EventMove%", r0_258) == false then
    print("\x83t\x83@\x83C\x83\x8b\x82\xaa\x96\xb3\x82\xa9\x82\xc1\x82\xbd")
  end
  cclass.lua_Layers:create():copySnap("MoveBrowser", "system")
  g_Menu.MoveBrowser.ptr:MenuEffectStart(200)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
