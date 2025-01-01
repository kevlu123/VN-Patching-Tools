-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
APP_INTERNAL_WIDTH = 1280
APP_INTERNAL_HEIGHT = 720
SELECT_WINDOW_PITCH = 70
LUA_CONFIRM_CHANGESCN = 20
LUA_CONFIRM_NMSSAVE = 21
LUA_CONFIRM_SCNTOP = 22
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
g_refreshCursor = false
g_menuExecute = false
g_mixer = nil
g_CASTOFF = false
g_cmdLineInfo = {
  enabled = false,
  effect = false,
}
g_MenuMsgWin = nil
g_MenuDialog = nil
function makeMenuList(r0_1)
  -- line: [56, 59] id: 1
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
}
g_sysMenuNormal = {}
g_sysMenuSelect = {}
g_sysMenuAll = {
  g_sysMenuNormal,
  g_sysMenuSelect
}
g_GalleryInfo = {
  Page = 1,
  CgPage = 1,
  ScenePage = 1,
  BgmPage = 1,
  CgPageMax = 1,
  ScenePageMax = 1,
  BgmPageMax = 2,
}
g_confirmDialog = 0
g_configPage = 0
g_dataInfo = {
  init = false,
  page = 1,
  data_no = -1,
}
g_quickOrder = {}
g_autoOrder = {}
local r0_0 = 21
function makeNmsList()
  -- line: [121, 129] id: 2
  return {
    Slide = 0,
    List = {},
    Act = -1,
    Param = 0,
  }
end
g_NmsPlay = makeNmsList()
g_NmsData = makeNmsList()
g_NmsData.MAX_THUMB = 128
g_NmsData.THP_Slide = 0
g_NmsData.THP_Param = 0
g_NmsData.THP_BookMark = {}
g_NmsData.THP_List = {}
g_NmsData.THP_ListEnable = {}
g_NmsData.THP_EnableCount = 0
g_NmsData.RetFlag = -1
g_NmsData.OneInit = false
g_NmsSLDataMax = 8
g_NmsSLData = {}
g_TrialFlag = 0
g_P1Renew = 0
g_fonts = {
  name = "FOT-\x83\x8d\x83_\x83\x93 Pro DB",
  file = "FOT-RodinPro-DB.PTF",
}
g_MSWTxtSize = {
  lWidth = 780,
  lHeight = 200,
  lMarginLeft = 100,
  lMarginTop = 5,
  lMarginRight = 20,
  lMarginBottom = 5,
  fLineMargin = 0.25,
}
g_LogTxtSize = {
  lWidth = 860,
  lHeight = 620,
  lMarginLeft = 100,
  lMarginTop = 20,
  lMarginRight = 100,
  lMarginBottom = 20,
  fLineMargin = 0.25,
}
g_selectTextColor = {
  normal = 4294967295,
  normalEdge = 4307199,
  already = 4294967215,
  alreadyEdge = 4307199,
  selected = 4294919423,
  selectedEdge = 3422604543,
  disabled = 128,
  disabledEdge = 0,
  defsize = 16,
}
g_selectTextOnColor = {
  normal = 4294967295,
  normalEdge = 4271961087,
}
g_SelectTextColorState = {}
g_message1Color = {
  normal = 4294967295,
  normalEdge = 1657087,
  already = 3486515183,
  alreadyEdge = 1656985,
  defsize = 16,
}
g_message2Color = {
  normal = 4294967295,
  normalEdge = 1657087,
  already = 3486515183,
  alreadyEdge = 1656985,
  defsize = 16,
}
g_name1Color = {
  normal = 4294967295,
  normalEdge = 443992319,
  already = 4294967295,
  alreadyEdge = 443992319,
  defsize = 16,
}
g_name2Color = {
  normal = 4294967295,
  normalEdge = 443992319,
  already = 4294967295,
  alreadyEdge = 443992319,
  defsize = 16,
}
g_messageAlready = -1
g_saveTextColor = {
  normal = 4294967295,
  normalEdge = 255,
  time = 4294967295,
  timeEdge = 255,
  No = 4294967295,
  NoEdge = 255,
  time2 = 4294967295,
  timeEdge2 = 255,
}
g_logTextColor = {
  normal = 4294967295,
  normalEdge = 1657087,
  voice = 3922362111,
  voiceEdge = 153,
  defsize = 16,
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
g_MouseRButton = 0
g_ReadColorChange = true
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
  "charTSUKI",
  "charMIKO",
  nil,
  nil
}
g_charKeysOtherMAN = {}
g_charKeysOtherWOMAN = {}
g_BgvKeyToVolkey = {}
function getGameEngineVersion()
  -- line: [311, 313] id: 3
  return 1.4
end
function resetGame()
  -- line: [316, 323] id: 4
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:ReleaseMessageWindow()
  end
  return true
end
function resetSkipIcon()
  -- line: [326, 333] id: 5
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:resetSkipIcon()
    g_MenuMsgWin:resetAutoIcon()
  end
  return true
end
g_checkInit = false
function checkInitVersion()
  -- line: [338, 340] id: 6
  g_checkInit = true
end
function initLegacyGame(r0_7)
  -- line: [342, 574] id: 7
  if g_checkInit == false then
    return false
  end
  if g_CASTOFF then
    cfunc.LegacyGame__lua_SetLoadProc("CastOffCall")
  end
  local r1_7 = nil
  local r2_7 = cclass.lua_Registry:new(r0_7)
  g_screenMode = r2_7:GetDWORD("ScreenMode")
  g_zoomMode = r2_7:GetDWORD("KeepAspectRatio")
  r1_7 = r2_7:IsKeyDWORD("messageSpeed")
  g_msgspeed = r2_7:GetDWORD("messageSpeed")
  if r1_7 == false then
    g_msgspeed = 95
  end
  r1_7 = r2_7:IsKeyDWORD("messageAlpha")
  g_messagealpha = r2_7:GetDWORD("messageAlpha")
  if r1_7 == false then
    g_messagealpha = 80
  end
  r1_7 = r2_7:IsKeyDWORD("autoSpeed")
  g_autospeed = r2_7:GetDWORD("autoSpeed")
  if r1_7 == false then
    g_autospeed = 80
  end
  local r3_7 = 0
  r1_7 = r2_7:IsKeyDWORD("allSkip")
  local r4_7 = r2_7:GetDWORD("allSkip")
  r3_7 = r4_7
  if r1_7 == false then
    r3_7 = 0
  end
  if r3_7 == 1 then
    r4_7 = true or false
  else
    goto label_79	-- block#14 is visited secondly
  end
  g_allskip = r4_7
  r1_7 = r2_7:IsKeyDWORD("selectReleaseSkip")
  r4_7 = r2_7:GetDWORD("selectReleaseSkip")
  r3_7 = r4_7
  if r1_7 == false then
    r3_7 = 0
  end
  if r3_7 == 1 then
    r4_7 = true or false
  else
    goto label_97	-- block#19 is visited secondly
  end
  g_selectReleaseSkip = r4_7
  r1_7 = r2_7:IsKeyDWORD("selectReleaseAuto")
  r4_7 = r2_7:GetDWORD("selectReleaseAuto")
  r3_7 = r4_7
  if r1_7 == false then
    r3_7 = 0
  end
  if r3_7 == 1 then
    r4_7 = true or false
  else
    goto label_115	-- block#24 is visited secondly
  end
  g_selectReleaseAuto = r4_7
  r1_7 = r2_7:IsKeyDWORD("effectSpeed")
  g_effectSpeed = r2_7:GetDWORD("effectSpeed")
  if r1_7 == false then
    g_effectSpeed = 0
  end
  r1_7 = r2_7:IsKeyDWORD("drawSkipIcon")
  r4_7 = r2_7:GetDWORD("drawSkipIcon")
  r3_7 = r4_7
  if r1_7 == false then
    r3_7 = 1
  end
  if r3_7 == 1 then
    r4_7 = true or false
  else
    goto label_145	-- block#31 is visited secondly
  end
  g_drawSkipIcon = r4_7
  r1_7 = r2_7:IsKeyDWORD("mouseAutoMove")
  r4_7 = r2_7:GetDWORD("mouseAutoMove")
  r3_7 = r4_7
  if r1_7 == false then
    r3_7 = 1
  end
  if r3_7 == 1 then
    r4_7 = true or false
  else
    goto label_163	-- block#36 is visited secondly
  end
  g_mouseAutoMove = r4_7
  r1_7 = r2_7:IsKeyDWORD("skipConfirm")
  r4_7 = r2_7:GetDWORD("skipConfirm")
  r3_7 = r4_7
  if r1_7 == false then
    r3_7 = 0
  end
  if r3_7 == 1 then
    r4_7 = true or false
  else
    goto label_181	-- block#41 is visited secondly
  end
  g_skipConfirm = r4_7
  r1_7 = r2_7:IsKeyDWORD("hideCursor")
  g_hideCursor = r2_7:GetDWORD("hideCursor")
  if r1_7 == false then
    g_hideCursor = 0
  end
  r1_7 = r2_7:IsKeyDWORD("hideCursorOn")
  r4_7 = r2_7:GetDWORD("hideCursorOn")
  r3_7 = r4_7
  if r1_7 == false then
    r3_7 = 1
  end
  if r3_7 == 1 then
    r4_7 = true or false
  else
    goto label_211	-- block#48 is visited secondly
  end
  g_hideCursorOn = r4_7
  r1_7 = r2_7:IsKeyDWORD("deactiveMode")
  r4_7 = r2_7:GetDWORD("deactiveMode")
  r3_7 = r4_7
  if r1_7 == false then
    r3_7 = 1
  end
  if r3_7 == 1 then
    r4_7 = true or false
  else
    goto label_229	-- block#53 is visited secondly
  end
  g_deactiveMode = r4_7
  r1_7 = r2_7:IsKeyDWORD("MouseRButton")
  g_MouseRButton = r2_7:GetDWORD("MouseRButton")
  if r1_7 == false then
    g_MouseRButton = 0
  end
  r1_7 = r2_7:IsKeyDWORD("ReadColorChange")
  r4_7 = r2_7:GetDWORD("ReadColorChange")
  r3_7 = r4_7
  if r1_7 == false then
    r3_7 = 1
  end
  if r3_7 == 1 then
    r4_7 = true or false
  else
    goto label_259	-- block#60 is visited secondly
  end
  g_ReadColorChange = r4_7
  for r7_7, r8_7 in pairs(g_volume) do
    r1_7 = r2_7:IsKeyDWORD(r8_7.name .. "Volume")
    r8_7.vol = r2_7:GetDWORD(r8_7.name .. "Volume")
    if r1_7 == false then
      if r8_7.name == "bgm" then
        r8_7.vol = 500
      elseif r8_7.name == "systemse" then
        r8_7.vol = 600
      elseif r8_7.name == "se" then
        r8_7.vol = 700
      elseif r8_7.name == "movie" then
        r8_7.vol = 800
      elseif r8_7.name == "char" then
        r8_7.vol = 900
      elseif r8_7.name == "charC_SAYA" then
        r8_7.vol = 950
      else
        r8_7.vol = 900
      end
    end
    r1_7 = r2_7:IsKeyDWORD(r8_7.name .. "Mute")
    local r9_7 = r2_7:GetDWORD(r8_7.name .. "Mute")
    r3_7 = r9_7
    if r1_7 == false then
      r3_7 = 0
    end
    if r3_7 == 1 then
      r9_7 = true or false
    else
      goto label_330	-- block#80 is visited secondly
    end
    r8_7.mute = r9_7
  end
  r1_7 = r2_7:IsKeyDWORD("clickVoice")
  r4_7 = r2_7:GetDWORD("clickVoice")
  if r4_7 == 1 then
    r4_7 = true or false
  else
    goto label_347	-- block#85 is visited secondly
  end
  g_clickVoice = r4_7
  if r1_7 == false then
    g_clickVoice = false
  end
  r1_7 = r2_7:IsKeyDWORD("enablePan")
  r4_7 = r2_7:GetDWORD("enablePan")
  if r4_7 == 1 then
    r4_7 = true or false
  else
    goto label_366	-- block#90 is visited secondly
  end
  g_enablePan = r4_7
  if r1_7 == false then
    g_enablePan = true
  end
  r1_7 = r2_7:IsKeyDWORD("bgvVoiceMute")
  r4_7 = r2_7:GetDWORD("bgvVoiceMute")
  if r4_7 == 1 then
    r4_7 = true or false
  else
    goto label_385	-- block#95 is visited secondly
  end
  g_bgvVoiceMute = r4_7
  if r1_7 == false then
    g_bgvVoiceMute = true
  end
  for r7_7 = 1, #g_gestureFunc, 1 do
    if r2_7:IsKeyDWORD("gesture" .. tostring(r7_7)) == true then
      g_gestureFunc[r7_7] = r2_7:GetDWORD("gesture" .. tostring(r7_7))
    end
  end
  r1_7 = r2_7:IsKeyDWORD("DisableGes")
  r4_7 = r2_7:GetDWORD("DisableGes")
  if r4_7 == 1 then
    r4_7 = true or false
  else
    goto label_429	-- block#104 is visited secondly
  end
  g_gestureDisable = r4_7
  if r1_7 == false then
    g_gestureDisable = false
  end
  r1_7 = r2_7:IsKeyDWORD("bgmCutPer")
  g_bgmCutPer = r2_7:GetDWORD("bgmCutPer")
  if r1_7 == false then
    g_bgmCutPer = 90
  end
  r1_7 = r2_7:IsKeyDWORD("messageWindowType")
  g_messageWindowType = r2_7:GetDWORD("messageWindowType")
  if r1_7 == false then
    g_messageWindowType = 0
  end
  r1_7 = r2_7:IsKeyDWORD("sysVoiceChar")
  g_sysVoiceChar = r2_7:GetDWORD("sysVoiceChar")
  if r1_7 == false then
    g_sysVoiceChar = 999
  end
  r2_7:delete()
  g_mixer = cclass.lua_Mixer:new()
  math.randomseed(os.time())
  LoadGameFont()
  NmsMenuLoadBookMark()
  return true
end
function finalizeLegacyGame(r0_8)
  -- line: [577, 657] id: 8
  local r1_8 = cclass.lua_Registry:new(r0_8)
  r1_8:SetDWORD("messageSpeed", g_msgspeed)
  r1_8:SetDWORD("messageAlpha", g_messagealpha)
  r1_8:SetDWORD("autoSpeed", g_autospeed)
  local r2_8 = 0
  if g_allskip == true then
    r2_8 = 1 or 0
  else
    goto label_24	-- block#2 is visited secondly
  end
  r1_8:SetDWORD("allSkip", r2_8)
  if g_selectReleaseSkip == true then
    r2_8 = 1 or 0
  else
    goto label_35	-- block#5 is visited secondly
  end
  r1_8:SetDWORD("selectReleaseSkip", r2_8)
  if g_selectReleaseAuto == true then
    r2_8 = 1 or 0
  else
    goto label_46	-- block#8 is visited secondly
  end
  r1_8:SetDWORD("selectReleaseAuto", r2_8)
  r1_8:SetDWORD("effectSpeed", g_effectSpeed)
  if g_drawSkipIcon == true then
    r2_8 = 1 or 0
  else
    goto label_61	-- block#11 is visited secondly
  end
  r1_8:SetDWORD("drawSkipIcon", r2_8)
  if g_mouseAutoMove == true then
    r2_8 = 1 or 0
  else
    goto label_72	-- block#14 is visited secondly
  end
  r1_8:SetDWORD("mouseAutoMove", r2_8)
  if g_skipConfirm == true then
    r2_8 = 1 or 0
  else
    goto label_83	-- block#17 is visited secondly
  end
  r1_8:SetDWORD("skipConfirm", r2_8)
  r1_8:SetDWORD("hideCursor", g_hideCursor)
  if g_hideCursorOn == true then
    r2_8 = 1 or 0
  else
    goto label_98	-- block#20 is visited secondly
  end
  r1_8:SetDWORD("hideCursorOn", r2_8)
  if g_deactiveMode == true then
    r2_8 = 1 or 0
  else
    goto label_109	-- block#23 is visited secondly
  end
  r1_8:SetDWORD("deactiveMode", r2_8)
  r1_8:SetDWORD("MouseRButton", g_MouseRButton)
  if g_ReadColorChange == true then
    r2_8 = 1 or 0
  else
    goto label_124	-- block#26 is visited secondly
  end
  r1_8:SetDWORD("ReadColorChange", r2_8)
  for r6_8, r7_8 in pairs(g_volume) do
    r1_8:SetDWORD(r7_8.name .. "Volume", r7_8.vol)
    if r7_8.mute == true then
      r2_8 = 1 or 0
    else
      goto label_145	-- block#30 is visited secondly
    end
    r1_8:SetDWORD(r7_8.name .. "Mute", r2_8)
  end
  if g_clickVoice == true then
    r2_8 = 1 or 0
  else
    goto label_160	-- block#35 is visited secondly
  end
  r1_8:SetDWORD("clickVoice", r2_8)
  if g_enablePan == true then
    r2_8 = 1 or 0
  else
    goto label_171	-- block#38 is visited secondly
  end
  r1_8:SetDWORD("enablePan", r2_8)
  if g_bgvVoiceMute == true then
    r2_8 = 1 or 0
  else
    goto label_182	-- block#41 is visited secondly
  end
  r1_8:SetDWORD("bgvVoiceMute", r2_8)
  for r6_8 = 1, #g_gestureFunc, 1 do
    r1_8:SetDWORD("gesture" .. tostring(r6_8), g_gestureFunc[r6_8])
  end
  r1_8:SetDWORD("bgmCutPer", g_bgmCutPer)
  r1_8:SetDWORD("messageWindowType", g_messageWindowType)
  r1_8:SetDWORD("sysVoiceChar", g_sysVoiceChar)
  if g_gestureDisable == true then
    r2_8 = 1 or 0
  else
    goto label_220	-- block#47 is visited secondly
  end
  r1_8:SetDWORD("DisableGes", r2_8)
  g_mixer:delete()
  r1_8:delete()
  NmsMenuSaveBookMark()
end
function changeMessageColor()
  -- line: [662, 666] id: 9
  local r0_9 = cclass.lua_Layers:create()
  r0_9:updateTextColor("system", "Txt01")
  r0_9:updateTextColor("system", "Name01")
end
function setMessageColor(r0_10)
  -- line: [668, 700] id: 10
  local r1_10 = cclass.CLegacyFontInfo:create()
  local r2_10 = {
    [1] = g_message1Color,
    [2] = g_message2Color,
  }
  local r3_10 = {
    [1] = g_name1Color,
    [2] = g_name2Color,
  }
  local r4_10 = r0_10
  g_messageAlready = r0_10
  if g_ReadColorChange == false then
    r4_10 = 0
    g_messageAlready = -1
  end
  if r4_10 == 0 then
    r1_10:changeColor("system", "Txt01", r2_10[g_messageWindowType + 1].normal, r2_10[g_messageWindowType + 1].normalEdge)
    r1_10:changeColor("system", "Name01", r3_10[g_messageWindowType + 1].normal, r3_10[g_messageWindowType + 1].normalEdge)
  else
    r1_10:changeColor("system", "Txt01", r2_10[g_messageWindowType + 1].already, r2_10[g_messageWindowType + 1].alreadyEdge)
    r1_10:changeColor("system", "Name01", r3_10[g_messageWindowType + 1].already, r3_10[g_messageWindowType + 1].alreadyEdge)
  end
  changeMessageColor()
end
function changeMessageWindow(r0_11, r1_11)
  -- line: [704, 711] id: 11
  if g_MenuMsgWin ~= nil then
    return g_MenuMsgWin:changeMessageWindow(r0_11, r1_11)
  end
  return true
end
function getMessageWindowID()
  -- line: [713, 716] id: 12
  return g_windowID
end
function isUseNameWindow()
  -- line: [718, 724] id: 13
  if g_windowID == 2 then
    return false
  end
  return true
end
function initSystemScreen()
  -- line: [734, 3668] id: 14
  g_MenuMsgWin = Menu.new("system")
  function g_MenuMsgWin.MenuEffect(r0_15)
    -- line: [743, 762] id: 15
    local r1_15 = false
    r1_15 = cclass.lua_Layers:create():isEffect("system", "WndDisp")
    if r0_15.MenuInf.effect == true and r1_15 == false then
      r0_15:MenuEffectEndJob()
      r0_15.MenuInf.effect = false
      g_refreshCursor = true
    end
    r0_15:IconEffect()
    r0_15:TipsEffect()
    return r1_15
  end
  function g_MenuMsgWin.MenuEffectEndJob(r0_16)
    -- line: [765, 801] id: 16
    local r1_16 = cclass.lua_Layers:create()
    if r0_16.MenuInf.enabled == true then
      r1_16:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_16:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_16:setParam("system", "Msg01", LUA_PARAM_POS, r0_16.MswPos.x, r0_16.MswPos.y, 0, 0)
      r1_16:setParam("system", "Txt01", LUA_PARAM_POS, r0_16.TxtPos.x, r0_16.TxtPos.y, 0, 0)
      r1_16:setParam("system", "Name01", LUA_PARAM_POS, r0_16.NamePos.x, r0_16.NamePos.y, 0, 0)
      r1_16:setParam("system", "Msg02", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_16:setParam("system", "Msg02", LUA_PARAM_POS, r0_16.MswPos2.x, r0_16.MswPos2.y, 0, 0)
      r1_16:setParam("system", "Msg03", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r1_16:setParam("system", "Msg03", LUA_PARAM_POS, r0_16.MswPos3.x, r0_16.MswPos3.y, 0, 0)
      local r2_16 = 0
      local r3_16 = 0
      local r4_16 = cclass.lua_AutoCursor:new()
      r2_16, r3_16 = r4_16:GetCursorPos(r2_16, r3_16)
      r4_16:delete()
      r0_16.MenuButton:changeButton(r0_16.MenuInf.SetName, r1_16:getCursorPos(r0_16.MenuInf.SetName, r2_16, r3_16, 0) - 1, r2_16, r3_16)
    end
  end
  function g_MenuMsgWin.MenuButtonJobPos(r0_17, r1_17, r2_17, r3_17, r4_17)
    -- line: [805, 909] id: 17
    if r1_17 ~= 0 and r2_17 == "LU" then
      if r1_17 == 1 then
        openConfig(0, false)
      end
      if r1_17 == 2 then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
      end
      if r1_17 == 3 then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGAUTO)
      end
      if r1_17 == 4 then
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_VOICEREPEAT, 0)
      end
      if r1_17 == 5 then
        openMessageLog()
      end
      if r1_17 == 6 and hideMessageWindow(1) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGHIDE)
      end
      if r1_17 == 7 then
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
      end
      if r1_17 == 8 then
        openConfirm(LUA_CONFIRM_QUICKLOAD)
      end
      if r1_17 == 9 then
        openConfig(4, false)
      end
      if r1_17 == 10 then
        openConfig(5, false)
      end
      if r1_17 == 11 then
        openConfirm(LUA_CONFIRM_SELECTLOAD)
      end
      if 101 <= r1_17 and r1_17 < 200 then
        local r5_17 = cclass.lua_Layers:create()
        setSelectTextColor(r1_17 - 101, 2)
        cfunc.LegacyGame__lua_SelectItem(r1_17 - 101)
        r0_17:closeSelect()
      end
      if r1_17 >= 200 then
        r0_17:TipsNextJob()
      end
    end
    if r2_17 == "RD" and r0_17:GetMenuMouseEnable() then
      if g_MouseRButton == 0 then
        local r5_17 = nil
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
          r5_17 = 0
        else
          r5_17 = 1
        end
        if hideMessageWindow(r5_17) == true then
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
  function g_MenuMsgWin.MenuMouseMove(r0_18, r1_18, r2_18, r3_18, r4_18, r5_18, r6_18)
    -- line: [913, 957] id: 18
    r0_18:defaultMenuMouseMove(r1_18, r2_18, r3_18, r4_18, r5_18, r6_18)
    if r0_18:GetMenuMouseEnable() then
      local r7_18 = cclass.lua_Layers:create()
      for r11_18 = 1, r0_18.SelectCount, 1 do
        local r12_18 = getLocalSelectKey(r11_18)
        local r13_18 = getLocalSelectText(r11_18)
        if r0_18.MenuButton.selCursor == r12_18 then
          cclass.CLegacyFontInfo:create():changeColor("system", r13_18, g_selectTextOnColor.normal, g_selectTextOnColor.normalEdge)
          r7_18:updateTextColor("system", r13_18)
        else
          setSelectTextColor(r11_18 - 1, g_SelectTextColorState[r11_18])
          r7_18:updateTextColor("system", r13_18)
        end
      end
      local r8_18 = 0
      if r0_18.MenuButton.selCursor ~= -1 then
        r8_18 = r0_18.MenuButton.selListKey[r0_18.MenuButton.selCursor].arg
      end
      local r9_18 = {
        "CLOSE",
        "AUTO",
        "SKIP",
        "REPEAT",
        "CONFIG"
      }
      for r14_18, r15_18 in pairs({
        31,
        32,
        33,
        34,
        35
      }) do
        if r8_18 == r9_18[r14_18] then
          r7_18:setSubLayerVisible("system", "Msg02", r15_18, 1)
        else
          r7_18:setSubLayerVisible("system", "Msg02", r15_18, 0)
        end
      end
    end
  end
  function g_MenuMsgWin.GetMenuActive(r0_19)
    -- line: [961, 972] id: 19
    local r1_19 = false
    if r0_19.MenuInf.enabled == true or r0_19.MenuInf.effect == true then
      r1_19 = true
    end
    if r0_19.MenuInf.select_enabled == true or r0_19.MenuInf.select_effect == true then
      r1_19 = true
    end
    return r1_19
  end
  function g_MenuMsgWin.GetMenuMouseEnable(r0_20)
    -- line: [976, 994] id: 20
    local r1_20 = false
    if r0_20.MenuInf.enabled == true and r0_20.MenuInf.effect == false and r0_20.MenuInf.select_effect == false and r0_20.MenuInf.tips_effect == false and r0_20.MenuInf.tips_wineffect == false and r0_20.buttonEffect.effect_auto == false and r0_20.buttonEffect.effect_skip == false and r0_20.MenuButton ~= nil then
      r1_20 = true
    end
    return r1_20
  end
  function g_MenuMsgWin.MenuKeyDown(r0_21, r1_21, r2_21, r3_21, r4_21)
    -- line: [997, 1146] id: 21
    if r4_21 == true then
      return 
    end
    if r0_21.MenuInf.select_enabled == true and r0_21.MenuInf.select_effect == false then
      local r5_21 = cclass.lua_Layers:create()
      local r6_21 = r0_21.MenuButton.selCursor
      local r7_21 = -1
      for r11_21 = 1, r0_21.SelectCount, 1 do
        if getLocalSelectKey(r11_21) == r6_21 then
          r7_21 = r11_21
          break
        end
      end
      if r0_21.SelectType == true and r3_21 == LUA_KEYCODE_ENTER and r7_21 ~= -1 then
        cfunc.LegacyGame__lua_SelectItem(r7_21 - 1)
        r0_21:closeSelect()
      elseif r3_21 == LUA_KEYCODE_ENTER and r7_21 ~= -1 then
        setSelectTextColor(r7_21 - 1, 2)
        cfunc.LegacyGame__lua_SelectItem(r7_21 - 1)
        r0_21:closeSelect()
      elseif r3_21 == LUA_KEYCODE_UP then
        if r7_21 == -1 then
          local r8_21 = 1
          for r12_21 = 1, r0_21.SelectCount, 1 do
            if r0_21.ActiveSelect[getLocalSelectKey(r12_21)] == 0 then
              r8_21 = r12_21
              break
            end
          end
          SetAutoOncursor("system", getLocalSelectKey(r8_21), 1, 100)
        elseif r7_21 > 1 then
          local r8_21 = -1
          for r12_21 = r7_21 - 1, 1, -1 do
            if r0_21.ActiveSelect[getLocalSelectKey(r12_21)] == 0 then
              r8_21 = r12_21
              break
            end
          end
          if r8_21 >= 1 then
            SetAutoOncursor("system", getLocalSelectKey(r8_21), 1, 100)
          end
        end
      elseif r3_21 == LUA_KEYCODE_DOWN then
        if r7_21 == -1 then
          local r8_21 = 1
          for r12_21 = 1, r0_21.SelectCount, 1 do
            if r0_21.ActiveSelect[getLocalSelectKey(r12_21)] == 0 then
              r8_21 = r12_21
              break
            end
          end
          SetAutoOncursor("system", getLocalSelectKey(r8_21), 1, 100)
        elseif r7_21 < r0_21.SelectCount then
          local r8_21 = -1
          for r12_21 = r7_21 + 1, r0_21.SelectCount, 1 do
            if r0_21.ActiveSelect[getLocalSelectKey(r12_21)] == 0 then
              r8_21 = r12_21
              break
            end
          end
          if r8_21 >= 1 then
            SetAutoOncursor("system", getLocalSelectKey(r8_21), 1, 100)
          end
        end
      end
    end
  end
  function g_MenuMsgWin.MenuButtonInit(r0_22)
    -- line: [1150, 1166] id: 22
    if r0_22.MenuButton ~= nil then
      r0_22.MenuButton:SetList("MenuButtonData", r0_22.MenuButtonData)
      r0_22.MenuButton:InitButton()
      if r0_22.SelectButtonData ~= nil then
        r0_22.MenuButton:SetList("SelectButtonData", r0_22.SelectButtonData)
      end
      if r0_22.TipsButton ~= nil then
        r0_22.MenuButton:SetList("TipsButton", r0_22.TipsButton)
      end
    end
  end
  g_MenuMsgWin.TipsButton = {}
  g_MenuMsgWin.TipsNo = 0
  g_MenuMsgWin.TipsCount = 0
  g_MenuMsgWin.TipsNext = 0
  g_MenuMsgWin.TipsOut = false
  function g_MenuMsgWin.TipsEffect(r0_23)
    -- line: [1181, 1197] id: 23
    local r1_23 = cclass.lua_Layers:create()
    if r0_23.MenuInf.tips_effect == true and r1_23:isEffect("system", "TipsDisp") == false then
      r0_23:TipsEffectEndJob()
      r0_23.MenuInf.tips_effect = false
    end
    if r0_23.MenuInf.tips_wineffect == true and r1_23:isEffect("system", "TipsWindow") == false then
      r0_23:TipsEffectEndJob()
      r0_23.MenuInf.tips_wineffect = false
    end
    return r0_23.MenuInf.tips_effect
  end
  function g_MenuMsgWin.TipsEffectEndJob(r0_24)
    -- line: [1199, 1240] id: 24
    if r0_24.MenuInf.tips_enabled == true then
      local r1_24 = cclass.lua_Layers:create()
      if r0_24.TipsOut == false then
        r1_24:setSubLayerVisible("system", "Tips01", 2, 1)
        r1_24:setSubLayerVisible("system", "Tips01", 3, 0)
        r1_24:setSubLayerVisible("system", "Tips01", 4, 0)
        r1_24:setSubLayerVisible("system", "Tips01", 5, 0)
        r1_24:setSubLayerVisible("system", "Tips01", 6, 1)
        r0_24:SetTipsPos()
        local r2_24 = 0
        local r3_24 = 0
        local r4_24 = cclass.lua_AutoCursor:new()
        r2_24, r3_24 = r4_24:GetCursorPos(r2_24, r3_24)
        r4_24:delete()
        r0_24.MenuButton:changeButton(r0_24.MenuInf.SetName, r1_24:getCursorPos(r0_24.MenuInf.SetName, r2_24, r3_24, 0) - 1, r2_24, r3_24)
      end
    else
      r0_24:TipsRemoveLayer()
      r0_24.TipsNo = 0
      r0_24.TipsCount = 0
      r0_24.TipsNext = 0
      r0_24.TipsOut = false
      r0_24.TipsCloseCount = 0
      cfunc.LegacyGame__lua_SetVariable(140, r0_24.TipsNo)
      cfunc.LegacyGame__lua_SetVariable(141, r0_24.TipsCount)
      cfunc.LegacyGame__lua_SetVariable(142, r0_24.TipsNext)
      cfunc.LegacyGame__lua_SetVariable(143, r0_24.TipsCloseCount)
      cfunc.LegacyGame__lua_SetFlag(143, r0_24.TipsOut)
    end
  end
  function g_MenuMsgWin.onResetTips(r0_25)
    -- line: [1242, 1263] id: 25
    if r0_25.MenuInf.tips_enabled == true or r0_25.MenuInf.tips_effect == true then
      r0_25:cancelTipsEffect()
      r0_25:TipsRemoveLayer()
      r0_25.MenuInf.tips_enabled = false
      r0_25.MenuInf.tips_effect = false
      r0_25.TipsNo = 0
      r0_25.TipsCount = 0
      r0_25.TipsNext = 0
      r0_25.TipsOut = false
      cfunc.LegacyGame__lua_SetVariable(140, r0_25.TipsNo)
      cfunc.LegacyGame__lua_SetVariable(141, r0_25.TipsCount)
      cfunc.LegacyGame__lua_SetVariable(142, r0_25.TipsNext)
      cfunc.LegacyGame__lua_SetVariable(143, r0_25.TipsCloseCount)
      cfunc.LegacyGame__lua_SetFlag(143, r0_25.TipsOut)
    end
  end
  function g_MenuMsgWin.cancelTipsEffect(r0_26)
    -- line: [1266, 1291] id: 26
    local r1_26 = false
    local r2_26 = cclass.lua_Layers:create()
    if r0_26.MenuInf.tips_effect == true then
      r2_26:cancelEffect("system", "Tips01", "TipsDisp")
      r2_26:cancelEffect("system", "TipsTxt", "TipsDisp")
      r0_26.MenuInf.tips_effect = false
      r1_26 = true
    end
    if r0_26.MenuInf.tips_wineffect == true then
      r2_26:cancelEffect("system", "Tips01", "TipsWindow")
      r2_26:cancelEffect("system", "TipsTxt", "TipsWindow")
      r0_26.MenuInf.tips_wineffect = false
      r1_26 = true
    end
    if r1_26 == true then
      r0_26:SetTipsPos()
      return true
    end
    return false
  end
  function g_MenuMsgWin.SetTipsPos(r0_27)
    -- line: [1294, 1316] id: 27
    local r1_27 = cclass.lua_Layers:create()
    if r0_27.MenuInf.tips_enabled == true then
      r1_27:setParam("system", "Tips01", LUA_PARAM_POS, 0, 0, 0, 0)
      r1_27:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      local r2_27 = 0
      local r3_27 = 0
      r2_27, r3_27, r4_27, r5_27 = r1_27:getSubLayerParam("system", "Tips01", 6, LUA_PARAM_POS, r2_27, r3_27, 0, 0)
      r1_27:setParam("system", "TipsTxt", LUA_PARAM_POS, r2_27, r3_27, 0, 0)
      r1_27:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 1)
    else
      r1_27:setParam("system", "Tips01", LUA_PARAM_POS, 300, 0, 0, 0)
      r1_27:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      local r2_27 = 0
      local r3_27 = 0
      r2_27, r3_27, r4_27, r5_27 = r1_27:getSubLayerParam("system", "Tips01", 6, LUA_PARAM_POS, r2_27, r3_27, 0, 0)
      r1_27:setParam("system", "TipsTxt", LUA_PARAM_POS, r2_27 + 300, r3_27, 0, 0)
      r1_27:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 0)
    end
  end
  function g_MenuMsgWin.TipsTxtName(r0_28, r1_28)
    -- line: [1320, 1324] id: 28
    return "SYS_TIPSTXT.pna"
  end
  g_MenuMsgWin.TipsTxtLayer = {
    {
      1,
      2
    }
  }
  function g_MenuMsgWin.MenuInitTips(r0_29, r1_29)
    -- line: [1332, 1354] id: 29
    if r0_29:cancelTipsEffect() == true then
      r0_29:TipsEffectEndJob()
    end
    r0_29.TipsNo = r1_29
    r0_29.TipsCount = #r0_29.TipsTxtLayer[r1_29]
    r0_29.TipsNext = 1
    r0_29.TipsOut = false
    r0_29.TipsCloseCount = 0
    cfunc.LegacyGame__lua_SetVariable(140, r0_29.TipsNo)
    cfunc.LegacyGame__lua_SetVariable(141, r0_29.TipsCount)
    cfunc.LegacyGame__lua_SetVariable(142, r0_29.TipsNext)
    cfunc.LegacyGame__lua_SetVariable(143, r0_29.TipsCloseCount)
    cfunc.LegacyGame__lua_SetFlag(143, r0_29.TipsOut)
    r0_29:MenuMakeTipsLayer()
    r0_29:startTipsMenu()
  end
  function g_MenuMsgWin.MenuLoadTips(r0_30)
    -- line: [1357, 1371] id: 30
    r0_30.TipsNo = cfunc.LegacyGame__lua_GetVariable(140)
    r0_30.TipsCloseCount = cfunc.LegacyGame__lua_GetVariable(143)
    if r0_30.TipsNo ~= 0 and 1 <= r0_30.TipsCloseCount then
      r0_30.TipsCount = cfunc.LegacyGame__lua_GetVariable(141)
      r0_30.TipsNext = cfunc.LegacyGame__lua_GetVariable(142)
      r0_30.TipsOut = cfunc.LegacyGame__lua_GetFlag(143)
      r0_30:MenuMakeTipsLayer()
      r0_30:startTipsMenu()
    else
      r0_30.TipsNo = 0
      r0_30.TipsCloseCount = 0
    end
  end
  function g_MenuMsgWin.MenuMakeTipsLayer(r0_31)
    -- line: [1374, 1416] id: 31
    local r1_31 = cclass.lua_Layers:create()
    r0_31:MenuLoadLayer("Tips01", "SYS_TIPS.pna")
    r0_31:MenuLoadLayer("TipsTxt", r0_31:TipsTxtName())
    r0_31.TipsButton = {}
    r0_31:MenuButtonSet(r0_31.TipsButton, "TipsNext", 1, "Tips01", 7, -1, -1, -1, -1, 200, 0, 0)
    r0_31.TipsButton.TipsNext.se_click = -1
    r0_31.TipsButton.TipsNext.se_on = -1
    r0_31.MenuButton:InitList()
    r0_31.MenuButton:SetList("TipsButton", r0_31.TipsButton)
    r0_31.MenuButton:InitButton()
    r1_31:initSubLayer("system", "Tips01", 2, 0)
    r1_31:initSubLayer("system", "Tips01", 3, 0)
    r1_31:initSubLayer("system", "Tips01", 4, 0)
    r1_31:initSubLayer("system", "Tips01", 5, 0)
    r1_31:initSubLayer("system", "Tips01", 6, 0)
    for r6_31 = 1, #r0_31.TipsTxtLayer, 1 do
      for r10_31 = 1, r0_31.TipsCount, 1 do
        r1_31:initSubLayer("system", "TipsTxt", r0_31.TipsTxtLayer[r6_31][r10_31], 0)
      end
    end
    r0_31:ActTipsTxt()
    if r0_31.MenuButtonData ~= nil then
      r0_31.MenuButton:SetList("MenuButtonData", r0_31.MenuButtonData)
    end
    if r0_31.SelectButtonData ~= nil then
      r0_31.MenuButton:SetList("SelectButtonData", r0_31.SelectButtonData)
    end
  end
  function g_MenuMsgWin.ActTipsTxt(r0_32)
    -- line: [1419, 1430] id: 32
    local r1_32 = cclass.lua_Layers:create()
    for r5_32 = 1, r0_32.TipsCount, 1 do
      local r6_32 = r0_32.TipsNext
      if r6_32 == r5_32 - 1 then
        r6_32 = 1 or 0
      else
        goto label_15	-- block#3 is visited secondly
      end
      if r5_32 == 1 then
        r6_32 = 1
      end
      r1_32:setSubLayerVisible("system", "TipsTxt", r0_32.TipsTxtLayer[r0_32.TipsNo][r5_32], r6_32)
    end
  end
  function g_MenuMsgWin.TipsNextJob(r0_33)
    -- line: [1433, 1441] id: 33
    r0_33.TipsNext = r0_33.TipsNext + 1
    cfunc.LegacyGame__lua_SetVariable(142, r0_33.TipsNext)
    if r0_33.TipsCount > r0_33.TipsNext then
      r0_33:ActTipsTxt()
    end
  end
  function g_MenuMsgWin.startTipsMenu(r0_34)
    -- line: [1444, 1516] id: 34
    r0_34:onResetTips()
    local r2_34 = nil	-- notice: implicit variable refs by block#[3]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r2_34 = 1
      if not r2_34 then
        ::label_11::
        r2_34 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_11	-- block#2 is visited secondly
    end
    local r3_34 = 0
    local r4_34 = cclass.lua_Layers:create()
    r4_34:setSubLayerVisible("system", "Tips01", 2, 1)
    r4_34:setSubLayerVisible("system", "Tips01", 3, 1)
    r4_34:setSubLayerVisible("system", "Tips01", 4, 1)
    r4_34:setSubLayerVisible("system", "Tips01", 5, 1)
    r4_34:setSubLayerVisible("system", "Tips01", 6, 0)
    local r5_34 = 0
    local r6_34 = 0
    r5_34, r6_34, r7_34, r8_34 = r4_34:getSubLayerParam("system", "Tips01", 6, LUA_PARAM_POS, r5_34, r6_34, 0, 0)
    r4_34:setParam("system", "TipsTxt", LUA_PARAM_POS, r5_34, r6_34, 0, 0)
    r4_34:setParam("system", "Tips01", LUA_PARAM_POS, 300, 0, 0, 0)
    r4_34:setEffect("system", "Tips01", "TipsDisp", LUA_EFFECT_POS, -300, 0, 0, 0, 2, 400 * r2_34, 0, r3_34 * r2_34)
    r4_34:startEffect("system", "Tips01", "TipsDisp", 0)
    r4_34:setSubLayerParam("system", "Tips01", 2, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_34:setSubLayerEffect("system", "Tips01", "TipsDisp", 2, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 400 * r2_34, 0, r3_34 * r2_34)
    r4_34:startSubLayerEffect("system", "Tips01", "TipsDisp", 2, 0)
    r4_34:setSubLayerParam("system", "Tips01", 3, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_34:setSubLayerEffect("system", "Tips01", "TipsDisp", 3, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 400 * r2_34, 0, r3_34 * r2_34)
    r4_34:startSubLayerEffect("system", "Tips01", "TipsDisp", 3, 0)
    r3_34 = 400
    r4_34:setSubLayerParam("system", "Tips01", 4, LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_34:setSubLayerEffect("system", "Tips01", "TipsDisp", 4, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 100 * r2_34, 0, r3_34 * r2_34)
    r4_34:startSubLayerEffect("system", "Tips01", "TipsDisp", 4, 0)
    r3_34 = r3_34 + 100
    r4_34:setSubLayerParam("system", "Tips01", 5, LUA_PARAM_POS, 1001, 379, 0, 0)
    r4_34:setSubLayerEffect("system", "Tips01", "TipsDisp", 5, LUA_EFFECT_POS, 0, 57, 0, 0, 0, 200 * r2_34, 0, r3_34 * r2_34)
    r4_34:setSubLayerParam("system", "Tips01", 5, LUA_PARAM_SCALE, 1, 0, 1, 0)
    r4_34:setSubLayerEffect("system", "Tips01", "TipsDisp", 5, LUA_EFFECT_SCALE, 0, 1, 0, 0, 0, 200 * r2_34, 0, r3_34 * r2_34)
    r4_34:startSubLayerEffect("system", "Tips01", "TipsDisp", 5, 0)
    r3_34 = r3_34 + 200
    r4_34:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r4_34:setEffect("system", "TipsTxt", "TipsDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 200 * r2_34, 0, r3_34 * r2_34)
    r4_34:startEffect("system", "TipsTxt", "TipsDisp", 0)
    local r9_34 = cclass.lua_Sounds:new()
    r9_34:SndPlay("systemse", getSoundArcFileName("systemse", "CRSE_008.ogg"), "CRSE_008.ogg", getSoundVolume("systemse"))
    r9_34:delete()
    r0_34.MenuInf.tips_enabled = true
    r0_34.MenuInf.tips_effect = true
  end
  function g_MenuMsgWin.hideTips(r0_35, r1_35)
    -- line: [1519, 1533] id: 35
    if r0_35:cancelTipsEffect() == true then
      r0_35:TipsEffectEndJob()
    end
    local r2_35 = r0_35.MenuInf.tips_enabled
    if r2_35 == true then
      if r1_35 == 1 then
        r2_35 = 0 or 1
      else
        goto label_15	-- block#5 is visited secondly
      end
      local r3_35 = cclass.lua_Layers:create()
      r3_35:setVisible("system", "Tips01", r2_35)
      r3_35:setVisible("system", "TipsTxt", r2_35)
      if r1_35 == 1 then
        r2_35 = 3 or 0
      else
        goto label_35	-- block#8 is visited secondly
      end
      r0_35.TipsButton.TipsNext:bt_SetActive(r2_35)
    end
  end
  function g_MenuMsgWin.windowCloseTips(r0_36)
    -- line: [1536, 1580] id: 36
    if r0_36.MenuInf.tips_enabled == false then
      return 
    end
    if r0_36:cancelTipsEffect() == true then
      r0_36:TipsEffectEndJob()
    end
    if r0_36.TipsNo ~= 0 then
      local r2_36 = r0_36.TipsNext
      if r2_36 < r0_36.TipsCount then
        r0_36.TipsOut = true
        cfunc.LegacyGame__lua_SetFlag(143, r0_36.TipsOut)
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
          r2_36 = 1 or LUA_SKIPSPEED_NONE
        else
          goto label_33	-- block#8 is visited secondly
        end
        local r3_36 = 0
        local r4_36 = cclass.lua_Layers:create()
        r4_36:setParam("system", "Tips01", LUA_PARAM_POS, 0, 0, 0, 0)
        r4_36:setEffect("system", "Tips01", "TipsWindow", LUA_EFFECT_POS, 300, 0, 0, 0, 0, 300 * r2_36, 0, r3_36 * r2_36)
        r4_36:startEffect("system", "Tips01", "TipsWindow", 0)
        r4_36:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_36:setEffect("system", "Tips01", "TipsWindow", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r2_36, 0, r3_36 * r2_36)
        r4_36:startEffect("system", "Tips01", "TipsWindow", 0)
        local r5_36 = 0
        local r6_36 = 0
        r5_36, r6_36, r7_36, r8_36 = r4_36:getSubLayerParam("system", "Tips01", 6, LUA_PARAM_POS, r5_36, r6_36, 0, 0)
        r4_36:setParam("system", "TipsTxt", LUA_PARAM_POS, r5_36, r6_36, 0, 0)
        r4_36:setEffect("system", "TipsTxt", "TipsWindow", LUA_EFFECT_POS, 300, 0, 0, 0, 0, 300 * r2_36, 0, r3_36 * r2_36)
        r4_36:startEffect("system", "TipsTxt", "TipsWindow", 0)
        r4_36:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_36:setEffect("system", "TipsTxt", "TipsWindow", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r2_36, 0, r3_36 * r2_36)
        r4_36:startEffect("system", "TipsTxt", "TipsWindow", 0)
        r0_36.TipsButton.TipsNext:bt_SetActive(3)
        r0_36.MenuInf.tips_wineffect = true
      end
    end
  end
  function g_MenuMsgWin.windowOpenTips(r0_37)
    -- line: [1583, 1621] id: 37
    if r0_37.MenuInf.tips_enabled == false then
      return 
    end
    if r0_37.TipsOut == true then
      r0_37.TipsOut = false
      cfunc.LegacyGame__lua_SetFlag(143, r0_37.TipsOut)
      local r2_37 = nil	-- notice: implicit variable refs by block#[6]
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
        r2_37 = 1
        if not r2_37 then
          ::label_23::
          r2_37 = LUA_SKIPSPEED_NONE
        end
      else
        goto label_23	-- block#5 is visited secondly
      end
      local r3_37 = 0
      local r4_37 = cclass.lua_Layers:create()
      r4_37:setParam("system", "Tips01", LUA_PARAM_POS, 300, 0, 0, 0)
      r4_37:setEffect("system", "Tips01", "TipsWindow", LUA_EFFECT_POS, -300, 0, 0, 0, 0, 300 * r2_37, 0, r3_37 * r2_37)
      r4_37:startEffect("system", "Tips01", "TipsWindow", 0)
      r4_37:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_37:setEffect("system", "Tips01", "TipsWindow", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r2_37, 0, r3_37 * r2_37)
      r4_37:startEffect("system", "Tips01", "TipsWindow", 0)
      local r5_37 = 0
      local r6_37 = 0
      r5_37, r6_37, r7_37, r8_37 = r4_37:getSubLayerParam("system", "Tips01", 6, LUA_PARAM_POS, r5_37, r6_37, 0, 0)
      r4_37:setParam("system", "TipsTxt", LUA_PARAM_POS, r5_37 + 300, r6_37, 0, 0)
      r4_37:setEffect("system", "TipsTxt", "TipsWindow", LUA_EFFECT_POS, -300, 0, 0, 0, 0, 300 * r2_37, 0, r3_37 * r2_37)
      r4_37:startEffect("system", "TipsTxt", "TipsWindow", 0)
      r4_37:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_37:setEffect("system", "TipsTxt", "TipsWindow", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r2_37, 0, r3_37 * r2_37)
      r4_37:startEffect("system", "TipsTxt", "TipsWindow", 0)
      r0_37.TipsButton.TipsNext:bt_SetActive(0)
      r0_37.MenuInf.tips_wineffect = true
    end
  end
  g_MenuMsgWin.TipsCloseCount = 0
  function g_MenuMsgWin.SetTipsCloseCount(r0_38, r1_38)
    -- line: [1625, 1631] id: 38
    g_MenuMsgWin.TipsCloseCount = r1_38
    cfunc.LegacyGame__lua_SetVariable(143, r0_38.TipsCloseCount)
  end
  function g_MenuMsgWin.TipsNextCount(r0_39)
    -- line: [1633, 1646] id: 39
    if r0_39.TipsCloseCount >= 1 then
      r0_39.TipsCloseCount = r0_39.TipsCloseCount - 1
      cfunc.LegacyGame__lua_SetVariable(143, r0_39.TipsCloseCount)
    end
    if r0_39.TipsCloseCount <= 0 then
      r0_39:closeTips()
    end
  end
  function g_MenuMsgWin.closeTips(r0_40)
    -- line: [1650, 1689] id: 40
    if r0_40.MenuInf.tips_enabled == false then
      return 
    end
    if r0_40:cancelTipsEffect() == true then
      r0_40:TipsEffectEndJob()
      r0_40.MenuInf.tips_effect = false
    end
    local r2_40 = nil	-- notice: implicit variable refs by block#[7]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r2_40 = 1
      if not r2_40 then
        ::label_22::
        r2_40 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_22	-- block#6 is visited secondly
    end
    local r3_40 = 0
    local r4_40 = cclass.lua_Layers:create()
    r4_40:setParam("system", "Tips01", LUA_PARAM_POS, 0, 0, 0, 0)
    r4_40:setEffect("system", "Tips01", "TipsDisp", LUA_EFFECT_POS, 300, 0, 0, 0, 0, 500 * r2_40, 0, r3_40 * r2_40)
    r4_40:startEffect("system", "Tips01", "TipsDisp", 0)
    r4_40:setParam("system", "Tips01", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r4_40:setEffect("system", "Tips01", "TipsDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 500 * r2_40, 0, r3_40 * r2_40)
    r4_40:startEffect("system", "Tips01", "TipsDisp", 0)
    local r5_40 = 0
    local r6_40 = 0
    r5_40, r6_40, r7_40, r8_40 = r4_40:getSubLayerParam("system", "Tips01", 6, LUA_PARAM_POS, r5_40, r6_40, 0, 0)
    r4_40:setParam("system", "TipsTxt", LUA_PARAM_POS, r5_40, r6_40, 0, 0)
    r4_40:setEffect("system", "TipsTxt", "TipsDisp", LUA_EFFECT_POS, 300, 0, 0, 0, 0, 500 * r2_40, 0, r3_40 * r2_40)
    r4_40:startEffect("system", "TipsTxt", "TipsDisp", 0)
    r4_40:setParam("system", "TipsTxt", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r4_40:setEffect("system", "TipsTxt", "TipsDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 500 * r2_40, 0, r3_40 * r2_40)
    r4_40:startEffect("system", "TipsTxt", "TipsDisp", 0)
    r0_40.MenuInf.tips_enabled = false
    r0_40.MenuInf.tips_effect = true
  end
  function g_MenuMsgWin.TipsRemoveLayer(r0_41)
    -- line: [1692, 1696] id: 41
    local r1_41 = cclass.lua_Layers:create()
    r1_41:removeLayer("system", "Tips01")
    r1_41:removeLayer("system", "TipsTxt")
  end
  g_MenuMsgWin.SelectType = false
  function g_MenuMsgWin.SelectEffect(r0_42)
    -- line: [1705, 1714] id: 42
    if r0_42.MenuInf.select_effect == true and cclass.lua_Layers:create():isEffect("system", "SelDisp") == false then
      r0_42:SelectEffectEndJob()
      r0_42.MenuInf.select_effect = false
    end
    return r0_42.MenuInf.select_effect
  end
  function g_MenuMsgWin.SelectEffectEndJob(r0_43)
    -- line: [1716, 1737] id: 43
    if r0_43.MenuInf.select_enabled == true then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SELECTSAVEGAME, 0)
      local r1_43 = cclass.lua_Layers:create()
      local r2_43 = 0
      local r3_43 = 0
      local r4_43 = cclass.lua_AutoCursor:new()
      r2_43, r3_43 = r4_43:GetCursorPos(r2_43, r3_43)
      r4_43:delete()
      r0_43.MenuButton:changeButton(r0_43.MenuInf.SetName, r1_43:getCursorPos(r0_43.MenuInf.SetName, r2_43, r3_43, 0) - 1, r2_43, r3_43)
    else
      r0_43:SelectRemoveLayer()
      r0_43.SelectCount = 0
    end
  end
  function g_MenuMsgWin.onResetSelect(r0_44)
    -- line: [1740, 1750] id: 44
    if r0_44.MenuInf.select_enabled == true or r0_44.MenuInf.select_effect == true then
      r0_44:cancelSelectEffect()
      r0_44:SelectRemoveLayer()
      r0_44.MenuInf.select_enabled = false
      r0_44.MenuInf.select_effect = false
      r0_44.SelectCount = 0
    end
  end
  function g_MenuMsgWin.MenuMakeSelectLayer(r0_45)
    -- line: [1753, 1802] id: 45
    r0_45.SelectType = cfunc.LegacyGame__lua_GetFlag(10)
    g_SelectTextColorState = {}
    local r1_45 = cclass.lua_Layers:create()
    if r0_45.SelectType == true then
      local r2_45 = getLocalSelectKey(0)
      r0_45:MenuLoadLayer(r2_45, "Sys_Map.pna")
      for r6_45 = 0, 6, 1 do
        r1_45:initSubLayer("system", r2_45, 75 + r6_45, 0)
      end
    else
      local r2_45 = true
      local r3_45 = cclass.CLegacyFontInfo:create()
      for r7_45 = 1, r0_45.SelectCount, 1 do
        local r8_45 = getLocalSelectKey(r7_45)
        r0_45:MenuLoadLayer(r8_45, "Sys_Select.pna")
        local r9_45 = 0
        local r10_45 = 0
        r9_45, r10_45, r11_45, r12_45 = r1_45:getParam("system", r8_45, LUA_PARAM_SIZE, r9_45, r10_45, 0, 0)
        local r13_45 = getLocalSelectText(r7_45)
        r1_45:insertTextLayer("system", r13_45, r9_45, r10_45, 1, 8, 1, 1, 0, 1)
        r3_45:add("system", r13_45, getDefaultFont(), g_selectTextColor.defsize, 1, 0, g_selectTextColor.normal, g_selectTextColor.normalEdge)
        g_SelectTextColorState[r7_45] = 0
      end
    end
  end
  function g_MenuMsgWin.SetSelectButPos(r0_46)
    -- line: [1805, 1956] id: 46
    if r0_46.SelectType == true then
      local r1_46 = cclass.lua_Layers:create()
      local r2_46 = getLocalSelectKey(0)
      local r3_46 = {}
      for r7_46 = 1, 7, 1 do
        r3_46[r7_46] = cfunc.LegacyGame__lua_GetVariable(30 + r7_46 - 1)
      end
      local r4_46 = {
        {
          0,
          0,
          0,
          4,
          0,
          4,
          0,
          0,
          0,
          0
        },
        {
          0,
          0,
          1,
          2,
          4,
          4,
          1,
          2,
          2,
          2
        },
        {
          0,
          0,
          0,
          0,
          3,
          0,
          0,
          0,
          0,
          0
        },
        {
          0,
          0,
          0,
          0,
          4,
          4,
          0,
          0,
          0,
          4
        },
        {
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          7
        },
        {
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0
        },
        {
          0,
          0,
          0,
          0,
          0,
          0,
          7,
          2,
          2,
          2
        }
      }
      local r5_46 = {
        1,
        3,
        2,
        6,
        5,
        4,
        0
      }
      local r6_46 = {
        0,
        0,
        0,
        0,
        0,
        0,
        0
      }
      for r10_46 = 7, 1, -1 do
        local r11_46 = r4_46[r10_46][r3_46[r10_46]]
        if r11_46 > 0 then
          r5_46[r10_46] = 0
          if r6_46[r11_46] == 0 then
            r6_46[r11_46] = r10_46
          elseif r3_46[r10_46] < r3_46[r6_46[r11_46]] then
            r6_46[r11_46] = r10_46
          end
        end
      end
      local r7_46 = {
        0,
        0,
        0,
        0,
        0,
        0,
        0
      }
      for r11_46 = 1, 7, 1 do
        local r12_46 = r5_46[r11_46]
        if r12_46 > 0 then
          r7_46[r12_46] = r11_46
        end
      end
      for r11_46 = 7, 1, -1 do
        if r6_46[r11_46] > 0 then
          r7_46[r11_46] = r6_46[r11_46]
        end
      end
      for r11_46 = 1, 7, 1 do
        local r12_46 = getLocalSelectKey(r11_46)
        r0_46.SelectButtonData[r12_46]:bt_SetDefPos()
        r0_46.SelectButtonData[r12_46]:bt_SetActive(3)
        r0_46.ActiveSelect[r12_46] = 3
      end
      for r11_46 = 1, 7, 1 do
        local r12_46 = r7_46[r11_46]
        if r12_46 > 0 then
          local r13_46 = getLocalSelectKey(r12_46)
          local r14_46 = 0
          local r15_46 = 0
          r14_46, r15_46, r16_46, r17_46 = r1_46:getSubLayerParam("system", r2_46, 75 + r11_46 - 1, LUA_PARAM_POS, r14_46, r15_46, 0, 0)
          r0_46.SelectButtonData[r13_46]:bt_SetPos(r14_46, r15_46)
          r0_46.SelectButtonData[r13_46]:bt_SetActive(0)
          r0_46.ActiveSelect[r13_46] = 0
        end
        local r13_46 = getLocalSelectKey(r11_46)
      end
      local r8_46 = getLocalSelectKey(8)
      if r3_46[7] <= 6 then
        r0_46.SelectButtonData[r8_46]:bt_SetActive(0)
        r0_46.ActiveSelect[r8_46] = 0
      else
        r0_46.SelectButtonData[r8_46]:bt_SetActive(3)
        r0_46.ActiveSelect[r8_46] = 3
      end
    else
      local r1_46 = 0
      for r5_46 = 1, r0_46.SelectCount, 1 do
        if r0_46.ActiveSelect[getLocalSelectKey(r5_46)] == 0 then
          r1_46 = r1_46 + 1
        end
      end
      local r2_46 = 0
      for r6_46 = 1, r0_46.SelectCount, 1 do
        local r7_46 = cclass.lua_Layers:create()
        local r8_46 = getLocalSelectKey(r6_46)
        local r9_46 = getLocalSelectText(r6_46)
        local r10_46 = SELECT_WINDOW_PITCH
        if r1_46 >= 5 then
          r10_46 = SELECT_WINDOW_PITCH / 4
        end
        if r0_46.ActiveSelect[r8_46] == 0 then
          local r11_46 = 0
          local r12_46 = 0
          r11_46, r12_46, r13_46, r14_46 = r7_46:getParam("system", r8_46, LUA_PARAM_SIZE, r11_46, r12_46, 0, 0)
          local r15_46 = math.floor((APP_INTERNAL_WIDTH - r11_46) / 2)
          local r16_46 = math.floor(APP_INTERNAL_HEIGHT / 2 - r1_46 * r12_46 / 2 - (r1_46 - 1) * r10_46 / 2 - 100 + r2_46 * r12_46 + r2_46 * r10_46)
          r0_46.SelectButtonData[r8_46]:bt_SetPos(r15_46, r16_46)
          r7_46:setParam("system", r9_46, LUA_PARAM_POS, r15_46 + 0, r16_46 + 0, 0, 0)
          r2_46 = r2_46 + 1
        end
      end
    end
  end
  function g_MenuMsgWin.SelectRemoveLayer(r0_47)
    -- line: [1959, 1979] id: 47
    local r1_47 = cclass.lua_Layers:create()
    if r0_47.SelectType == true then
      r1_47:removeLayer("system", getLocalSelectKey(0))
    else
      local r2_47 = cclass.CLegacyFontInfo:create()
      for r6_47 = 1, r0_47.SelectCount, 1 do
        local r7_47 = getLocalSelectKey(r6_47)
        local r8_47 = getLocalSelectText(r6_47)
        r2_47:remove("system", r8_47)
        r1_47:removeLayer("system", r7_47)
        r1_47:removeLayer("system", r8_47)
      end
    end
    r0_47.MenuButton:SetList("SelectButtonData", nil)
    r0_47.SelectButtonData = {}
  end
  g_MenuMsgWin.ActiveSelect = {}
  function g_MenuMsgWin.MakeSelectBut(r0_48)
    -- line: [1983, 2096] id: 48
    r0_48.ActiveSelect = {}
    if r0_48.SelectType == true then
      local r1_48 = {}
      for r5_48 = 1, 7, 1 do
        r1_48[r5_48] = cfunc.LegacyGame__lua_GetVariable(30 + r5_48 - 1)
      end
      local r2_48 = getLocalSelectKey(0)
      for r6_48 = 1, 7, 1 do
        local r7_48 = getLocalSelectKey(r6_48)
        local r8_48 = 32 - (r6_48 - 1) * 4
        local r9_48 = 62 - (r6_48 - 1) * 4
        local r10_48 = false
        if r6_48 == 1 then
          if r1_48[1] == 6 and 6 <= r1_48[2] and 6 <= r1_48[7] then
            r10_48 = true
          end
          if r1_48[1] >= 7 then
            r10_48 = true
          end
        end
        if r6_48 == 2 then
          if r1_48[2] == 6 and 6 <= r1_48[1] and 6 <= r1_48[7] then
            r10_48 = true
          end
          if r1_48[2] >= 7 then
            r10_48 = true
          end
        end
        if r6_48 == 3 and 7 <= r1_48[3] then
          r10_48 = true
        end
        if r6_48 == 4 and 7 <= r1_48[4] then
          r10_48 = true
        end
        if r6_48 == 5 and 7 <= r1_48[5] then
          r10_48 = true
        end
        if r6_48 == 6 and 7 <= r1_48[6] then
          r10_48 = true
        end
        if r6_48 == 7 then
          if r1_48[7] == 6 and 6 <= r1_48[1] and 6 <= r1_48[2] then
            r10_48 = true
          end
          if r1_48[7] >= 6 then
            r10_48 = true
          end
        end
        if r10_48 == true then
          r8_48 = r8_48 - 1
          r9_48 = r9_48 - 1
        end
        r0_48:MenuButtonSet(r0_48.SelectButtonData, r7_48, 1, r2_48, r8_48, r8_48, r9_48, -1, -1, r6_48 + 100, 0, 0)
      end
      r0_48:MenuButtonSet(r0_48.SelectButtonData, getLocalSelectKey(8), 1, r2_48, 2, 2, 1, -1, -1, 108, 0, 0)
    else
      for r4_48 = 1, r0_48.SelectCount, 1 do
        local r5_48 = getLocalSelectKey(r4_48)
        r0_48:MenuButtonSet(r0_48.SelectButtonData, r5_48, 1, r5_48, 0, 0, 1, -1, 2, r4_48 + 100, 0, 0)
        r0_48.ActiveSelect[r5_48] = 0
      end
    end
    r0_48.MenuButton:InitList()
    r0_48.MenuButton:SetList("SelectButtonData", r0_48.SelectButtonData)
    r0_48.MenuButton:InitButton()
    if r0_48.SelectType == true then
      r0_48:MapActive(0)
    end
    if r0_48.MenuButtonData ~= nil then
      r0_48.MenuButton:SetList("MenuButtonData", r0_48.MenuButtonData)
    end
    if r0_48.TipsButton ~= nil then
      r0_48.MenuButton:SetList("TipsButton", r0_48.TipsButton)
    end
  end
  function g_MenuMsgWin.startSelectMenu(r0_49)
    -- line: [2099, 2135] id: 49
    local r1_49 = cclass.lua_Layers:create()
    local r3_49 = nil	-- notice: implicit variable refs by block#[4, 6]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r3_49 = 1
      if not r3_49 then
        ::label_13::
        r3_49 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_13	-- block#2 is visited secondly
    end
    local r4_49 = 0
    if r0_49.SelectType == true then
      local r5_49 = getLocalSelectKey(0)
      r1_49:setParam("system", r5_49, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_49:setEffect("system", r5_49, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r3_49, 0, r4_49 * r3_49)
      r1_49:startEffect("system", r5_49, "SelDisp", 0)
    else
      for r8_49 = 1, r0_49.SelectCount, 1 do
        local r9_49 = getLocalSelectKey(r8_49)
        local r10_49 = getLocalSelectText(r8_49)
        r1_49:setParam("system", r9_49, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_49:setParam("system", r10_49, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_49:setEffect("system", r9_49, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r3_49, 0, r4_49 * r3_49)
        r1_49:setEffect("system", r10_49, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 300 * r3_49, 0, r4_49 * r3_49)
        r1_49:startEffect("system", r9_49, "SelDisp", 0)
        r1_49:startEffect("system", r10_49, "SelDisp", 0)
      end
    end
    r0_49.MenuInf.select_enabled = true
    r0_49.MenuInf.select_effect = true
  end
  function g_MenuMsgWin.closeSelect(r0_50)
    -- line: [2138, 2171] id: 50
    local r2_50 = nil	-- notice: implicit variable refs by block#[4, 6]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r2_50 = 1
      if not r2_50 then
        ::label_9::
        r2_50 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_9	-- block#2 is visited secondly
    end
    local r3_50 = cclass.lua_Layers:create()
    local r4_50 = 0
    if r0_50.SelectType == true then
      local r5_50 = getLocalSelectKey(0)
      r3_50:setParam("system", r5_50, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r3_50:setEffect("system", r5_50, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r2_50, 0, r4_50 * r2_50)
      r3_50:startEffect("system", r5_50, "SelDisp", 0)
    else
      for r8_50 = 1, r0_50.SelectCount, 1 do
        local r9_50 = getLocalSelectKey(r8_50)
        local r10_50 = getLocalSelectText(r8_50)
        r3_50:setParam("system", r9_50, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_50:setParam("system", r10_50, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_50:setEffect("system", r9_50, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r2_50, 0, r4_50 * r2_50)
        r3_50:setEffect("system", r10_50, "SelDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 300 * r2_50, 0, r4_50 * r2_50)
        r3_50:startEffect("system", r9_50, "SelDisp", 0)
        r3_50:startEffect("system", r10_50, "SelDisp", 0)
      end
    end
    r0_50.MenuInf.select_enabled = false
    r0_50.MenuInf.select_effect = true
  end
  function g_MenuMsgWin.cancelSelectEffect(r0_51)
    -- line: [2174, 2214] id: 51
    if r0_51.MenuInf.select_effect == true then
      local r1_51 = cclass.lua_Layers:create()
      if r0_51.SelectType == true then
        local r2_51 = getLocalSelectKey(0)
        r1_51:cancelEffect("system", r2_51, "SelDisp")
        if r0_51.MenuInf.select_enabled == true then
          r1_51:setParam("system", r2_51, LUA_PARAM_COLOR, 1, 1, 1, 1)
        else
          r1_51:setParam("system", r2_51, LUA_PARAM_COLOR, 1, 1, 1, 0)
        end
      else
        for r5_51 = 1, r0_51.SelectCount, 1 do
          local r6_51 = getLocalSelectKey(r5_51)
          local r7_51 = getLocalSelectText(r5_51)
          r1_51:cancelEffect("system", r6_51, "SelDisp")
          r1_51:cancelEffect("system", r7_51, "SelDisp")
          if r0_51.MenuInf.select_enabled == true then
            r1_51:setParam("system", r6_51, LUA_PARAM_COLOR, 1, 1, 1, 1)
            r1_51:setParam("system", r7_51, LUA_PARAM_COLOR, 1, 1, 1, 1)
          else
            r1_51:setParam("system", r6_51, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r1_51:setParam("system", r7_51, LUA_PARAM_COLOR, 1, 1, 1, 0)
          end
        end
      end
      return true
    end
    return false
  end
  function g_MenuMsgWin.MapActive(r0_52, r1_52)
    -- line: [2216, 2229] id: 52
    local r2_52 = cclass.lua_Layers:create()
    for r6_52 = 1, 8, 1 do
      local r7_52 = getLocalSelectKey(r6_52)
      local r8_52 = 0
      if r1_52 == 1 then
        r8_52 = 3
      else
        r8_52 = r0_52.ActiveSelect[r7_52]
      end
      r0_52.SelectButtonData[r7_52]:bt_SetActive(r8_52)
    end
  end
  function g_MenuMsgWin.hideSelect(r0_53, r1_53)
    -- line: [2233, 2268] id: 53
    if r0_53:cancelSelectEffect() == true then
      r0_53:SelectEffectEndJob()
      r0_53.MenuInf.select_effect = false
    end
    if r0_53.MenuInf.select_enabled == true then
      if r0_53.SelectType == true then
        r0_53:MapActive(r1_53)
      else
        local r2_53 = cclass.lua_Layers:create()
        for r6_53 = 1, r0_53.SelectCount, 1 do
          local r7_53 = getLocalSelectKey(r6_53)
          local r8_53 = 0
          local r9_53 = 1
          if r1_53 == 1 then
            r8_53 = 3
            r9_53 = 0
          elseif r0_53.ActiveSelect[r7_53] ~= 0 then
            r8_53 = r0_53.ActiveSelect[r7_53]
            r9_53 = 0
          end
          r0_53.SelectButtonData[r7_53]:bt_SetActive(r8_53)
          r2_53:setVisible("system", getLocalSelectText(r6_53), r9_53)
        end
      end
    end
  end
  function g_MenuMsgWin.DisableSelect(r0_54, r1_54)
    -- line: [2271, 2284] id: 54
    if r0_54.SelectType ~= true then
      local r2_54 = getLocalSelectKey(r1_54 + 1)
      if r0_54.SelectButtonData[r2_54] ~= nil then
        r0_54.SelectButtonData[r2_54]:bt_SetActive(2)
        local r3_54 = getLocalSelectText(r1_54 + 1)
        local r4_54 = cclass.lua_Layers:create()
        r0_54.ActiveSelect[r2_54] = 2
        r0_54:SetSelectButPos()
      end
    end
  end
  function g_MenuMsgWin.MenuInit(r0_55)
    -- line: [2287, 2334] id: 55
    local r1_55 = true
    r0_55.MenuInf.enabled = false
    r0_55.MenuInf.effect = false
    r0_55.SelectCount = 0
    r0_55.MenuInf.select_enabled = false
    r0_55.MenuInf.select_effect = false
    r0_55.SelectButtonData = {}
    r0_55.MenuInf.tips_enabled = false
    r0_55.MenuInf.tips_effect = false
    r0_55.MenuInf.tips_winenabled = false
    r0_55.MenuInf.tips_wineffect = false
    r0_55.buttonEffect = {}
    r0_55.buttonEffect.auto = false
    r0_55.buttonEffect.skip = false
    r0_55.buttonEffect.effect_auto = false
    r0_55.buttonEffect.effect_skip = false
    r0_55.MenuInf.nameWindow = 1
    r0_55.MenuInf.msgWindow = 1
    if cclass.lua_Layers:create():add(r0_55.MenuInf.SetName) == false then
      return false
    end
    r0_55.MenuButton = Button.new(r0_55.MenuInf.SetName)
    r0_55.MenuButton:InitList()
    r0_55.MenuButtonData = {}
    return r1_55
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
  }
  g_MenuMsgWin.MswWin1LayEx = {
    1
  }
  g_MenuMsgWin.MswWin1LayPos = {}
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
  g_MenuMsgWin.TxtPos = {
    x = 200,
    y = 579,
    move = 200,
  }
  g_MenuMsgWin.NamePos = {
    x = 200,
    y = 544,
    move = 200,
  }
  function g_MenuMsgWin.changeMessageWindow(r0_56, r1_56, r2_56)
    -- line: [2358, 2555] id: 56
    local r3_56 = g_windowID
    if r3_56 == r1_56 then
      if r1_56 == -1 then
        r3_56 = r2_56 == true
      else
        goto label_7	-- block#3 is visited secondly
      end
      if r3_56 == false then
        return true
      end
    end
    if r1_56 == -1 then
      r3_56 = g_messageWindowType
    end
    local r4_56 = cclass.lua_Layers:create()
    if r0_56:MenuLoadLayer("Msg01", "Sys_Msw.pna") == false then
      return false
    end
    r4_56:clearHitTestAll("system", "Msg01")
    r4_56:setVisible("system", "Msg01", 1)
    r4_56:setParam("system", "Msg01", LUA_PARAM_POS, r0_56.MswPos.x, r0_56.MswPos.y, 0, 0)
    if r0_56:MenuLoadLayer("Msg03", "Sys_Msw3.pna") == false then
      return false
    end
    if r0_56:MenuLoadLayer("Msg02", "Sys_Msw2.pna") == false then
      return false
    end
    r4_56:clearHitTestAll("system", "Msg02")
    r4_56:setVisible("system", "Msg02", 1)
    r4_56:setParam("system", "Msg02", LUA_PARAM_POS, r0_56.MswPos2.x, r0_56.MswPos2.y, 0, 0)
    r4_56:clearHitTestAll("system", "Msg03")
    r4_56:setVisible("system", "Msg03", 1)
    r4_56:setParam("system", "Msg03", LUA_PARAM_POS, r0_56.MswPos3.x, r0_56.MswPos3.y, 0, 0)
    r4_56:initSubLayer("system", "Msg02", 37, 1)
    r4_56:initSubLayer("system", "Msg03", 28, 1)
    r4_56:initSubLayer("system", "Msg03", 29, 1)
    if r0_56.MswLay.win1 ~= -1 then
      r4_56:initSubLayer("system", "Msg01", r0_56.MswLay.win1, 1)
    end
    for r9_56, r10_56 in pairs(r0_56.MswWin1LayEx) do
      r4_56:initSubLayer("system", "Msg01", r10_56, 1)
      local r11_56 = 0
      local r12_56 = 0
      r11_56, r12_56, r13_56, r14_56 = r4_56:getSubLayerParam("system", "Msg01", r10_56, LUA_PARAM_POS, r11_56, r12_56, 0, 0)
      r0_56.MswWin1LayPos[r9_56] = {
        r11_56,
        r12_56
      }
    end
    if r0_56.MswLay.back1 ~= -1 then
      r4_56:initSubLayer("system", "Msg01", r0_56.MswLay.back1, 1)
    end
    if r0_56.MswLay.win2 ~= -1 then
      r4_56:initSubLayer("system", "Msg01", r0_56.MswLay.win2, 1)
    end
    if r0_56.MswLay.back2 ~= -1 then
      r4_56:initSubLayer("system", "Msg01", r0_56.MswLay.back2, 1)
    end
    if r0_56.MswLay.name1 ~= -1 then
      r4_56:initSubLayer("system", "Msg01", r0_56.MswLay.name1, 0)
    end
    if r0_56.MswLay.nameback1 ~= -1 then
      r4_56:initSubLayer("system", "Msg01", r0_56.MswLay.nameback1, 0)
    end
    if r0_56.MswLay.name2 ~= -1 then
      r4_56:initSubLayer("system", "Msg01", r0_56.MswLay.name2, 0)
    end
    if r0_56.MswLay.nameback2 ~= -1 then
      r4_56:initSubLayer("system", "Msg01", r0_56.MswLay.nameback2, 0)
    end
    r0_56.MenuButton:InitList()
    r0_56:MakeWindowBut()
    r0_56.MenuButton:SetList("MenuButtonData", r0_56.MenuButtonData)
    r0_56.MenuButton:InitButton()
    if r0_56.SelectButtonData ~= nil then
      r0_56.MenuButton:SetList("SelectButtonData", r0_56.SelectButtonData)
    end
    if r0_56.TipsButton ~= nil then
      r0_56.MenuButton:SetList("TipsButton", r0_56.TipsButton)
    end
    if r2_56 == false then
      r4_56:removeLayer("system", "Txt01")
      r4_56:removeLayer("system", "Name01")
      r4_56:insertTextLayer("system", "Txt01", g_MSWTxtSize.lWidth, g_MSWTxtSize.lHeight, g_MSWTxtSize.lMarginLeft, g_MSWTxtSize.lMarginTop, g_MSWTxtSize.lMarginRight, g_MSWTxtSize.lMarginBottom, g_MSWTxtSize.fLineMargin, 1)
      r4_56:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r4_56:insertTextLayer("system", "Name01", 740, 33, 100, 4, 4, 4, 0, 0)
      r4_56:setParam("system", "Name01", LUA_PARAM_COLOR, 1, 1, 1, 1)
    end
    r4_56:setParam("system", "Txt01", LUA_PARAM_POS, r0_56.TxtPos.x, r0_56.TxtPos.y, 0, 0)
    r4_56:setParam("system", "Name01", LUA_PARAM_POS, r0_56.NamePos.x, r0_56.NamePos.y, 0, 0)
    local r6_56 = cclass.CLegacyFontInfo:create()
    local r7_56 = r4_56:getAnimationState("system", "Clk01", "CL_Wait")
    r4_56:removeLayer("system", "Clk01")
    r0_56:MenuLoadLayer("Clk01", "Sys_ClickWait.pna")
    r4_56:setVisible("system", "Clk01", 1)
    local r8_56 = 0
    if g_messageAlready ~= -1 then
      r8_56 = g_messageAlready
    end
    local r9_56 = {
      [1] = g_message1Color,
      [2] = g_message2Color,
    }
    local r10_56 = {
      [1] = g_name1Color,
      [2] = g_name2Color,
    }
    if r8_56 == 0 then
      r6_56:changeColor("system", "Txt01", r9_56[g_messageWindowType + 1].normal, r9_56[g_messageWindowType + 1].normalEdge)
      r6_56:changeColor("system", "Name01", r10_56[g_messageWindowType + 1].normal, r10_56[g_messageWindowType + 1].normalEdge)
    else
      r6_56:changeColor("system", "Txt01", r9_56[g_messageWindowType + 1].already, r9_56[g_messageWindowType + 1].alreadyEdge)
      r6_56:changeColor("system", "Name01", r10_56[g_messageWindowType + 1].already, r10_56[g_messageWindowType + 1].alreadyEdge)
    end
    for r14_56 = 0, 65, 1 do
      r4_56:setAnimation("system", "Clk01", "CL_Wait", r14_56, 0.015151515151515152 * r14_56, 0)
    end
    r4_56:setParam("system", "Clk01", LUA_PARAM_POS, r0_56.ClikPos.x, r0_56.ClikPos.y, 0, 0)
    if r2_56 == true then
      r4_56:updateTextColor("system", "Txt01")
      r4_56:updateTextColor("system", "Name01")
      if r7_56 == true then
        startClickWaitAnimation()
      end
      if r0_56.MenuInf.enabled == true then
        openMessageWindowWoEffect()
      else
        resetMessageWindow(false)
      end
    else
      resetMessageWindow(false)
    end
    g_windowID = r1_56
    r0_56:changeMessageWindowOpacity()
    return true
  end
  function g_MenuMsgWin.MakeWindowBut(r0_57)
    -- line: [2559, 2605] id: 57
    r0_57.MenuButton:ResetButtonActive(r0_57.MenuButtonData)
    r0_57.MenuButtonData = {}
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "CLOSE", 1, "Msg02", 16, 16, 9, -1, 23, 6, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "AUTO", 1, "Msg02", 17, 17, 10, -1, 24, 3, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "SKIP", 1, "Msg02", 18, 18, 11, -1, 25, 2, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "REPEAT", 1, "Msg02", 19, 19, 12, -1, 26, 4, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "CONFIG", 1, "Msg02", 20, 20, 13, -1, 27, 1, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "BACKLOG", 1, "Msg03", 14, 14, 7, -1, 21, 5, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "SAVE", 1, "Msg03", 15, 15, 8, -1, 22, 9, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "LOAD", 1, "Msg03", 16, 16, 9, -1, 23, 10, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "QSAVE", 1, "Msg03", 17, 17, 10, -1, 24, 7, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "QLOAD", 1, "Msg03", 18, 18, 11, -1, 25, 8, 0, 0)
    r0_57:MenuButtonSet(r0_57.MenuButtonData, "RtpC", 1, "Msg03", 2, 2, 1, -1, 3, 11, 0, 0)
    local r1_57 = cclass.lua_Layers:create()
    for r6_57, r7_57 in pairs({
      31,
      32,
      33,
      34,
      35
    }) do
      r1_57:initSubLayer("system", "Msg02", r7_57, 0)
    end
  end
  function g_MenuMsgWin.setButtonActive(r0_58)
    -- line: [2610, 2625] id: 58
    for r5_58, r6_58 in pairs({
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
      local r7_58 = 0
      local r8_58 = r0_58:checkMessageFocus(r6_58)
      if r8_58 then
        r7_58 = 0
      else
        r7_58 = 2
      end
      r8_58 = r0_58.MenuButtonData[r6_58].active
      if r8_58 ~= r7_58 then
        r0_58.MenuButtonData[r6_58]:bt_SetActive(r7_58)
      end
    end
  end
  function g_MenuMsgWin.setButtonState(r0_59)
    -- line: [2627, 2633] id: 59
    if r0_59:GetMenuActive() == true then
      r0_59:setButtonActive()
    end
    r0_59:SetSkipAutoState()
  end
  function g_MenuMsgWin.checkMessageFocus(r0_60, r1_60)
    -- line: [2636, 2685] id: 60
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true and (r1_60 == "CONFIG" or r1_60 == "QSAVE" or r1_60 == "QLOAD" or r1_60 == "SAVE" or r1_60 == "LOAD") then
      return false
    end
    if r1_60 == "CONFIG" then
      return checkOverlayFunction(4)
    end
    if r1_60 == "SKIP" then
      return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLESKIP) or g_allskip
    end
    if r1_60 == "REPEAT" then
      return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLEVOICEREPEAT)
    end
    if r1_60 == "BACKLOG" then
      return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOG)
    end
    if r1_60 == "QSAVE" then
      return checkOverlayFunction(5)
    end
    if r1_60 == "QLOAD" then
      return checkOverlayFunction(6)
    end
    if r1_60 == "SAVE" then
      return checkOverlayFunction(7)
    end
    if r1_60 == "LOAD" then
      return checkOverlayFunction(8)
    end
    if r1_60 == "RtpC" then
      return checkOverlayFunction(13)
    end
    return true
  end
  function g_MenuMsgWin.resetMessageWindow(r0_61, r1_61)
    -- line: [2689, 2701] id: 61
    if r1_61 == true then
      if getSystemSet() == "system" then
        cfunc.D3DApp__lua_PostMouseMove()
      end
    else
      r0_61:onResetMessageWindow()
    end
  end
  function g_MenuMsgWin.nameWindowVisible(r0_62, r1_62)
    -- line: [2704, 2783] id: 62
    local r2_62 = cclass.lua_Layers:create()
    local r3_62 = 0
    if r1_62 then
      r3_62 = 1
    end
    local r4_62 = g_windowID
    if r4_62 == -1 then
      r4_62 = g_messageWindowType
    end
    local r6_62 = nil	-- notice: implicit variable refs by block#[27]
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false then
      r6_62 = 1
      if not r6_62 then
        ::label_21::
        r6_62 = LUA_SKIPSPEED_NONE
      end
    else
      goto label_21	-- block#6 is visited secondly
    end
    if r0_62.MenuInf.nameWindow == 1 then
      local r7_62 = g_messagealpha / 100
      if r4_62 == 0 then
        if r0_62.MswLay.nameback1 ~= -1 then
          r2_62:setSubLayerVisible("system", "Msg01", r0_62.MswLay.nameback1, r3_62)
          r2_62:setSubLayerParam("system", "Msg01", r0_62.MswLay.nameback1, LUA_PARAM_COLOR, 1, 1, 1, r7_62)
        end
        if r0_62.MswLay.name1 ~= -1 then
          r2_62:setSubLayerVisible("system", "Msg01", r0_62.MswLay.name1, r3_62)
        end
        if r0_62.MswLay.nameback2 ~= -1 then
          r2_62:setSubLayerVisible("system", "Msg01", r0_62.MswLay.nameback2, 0)
        end
        if r0_62.MswLay.name2 ~= -1 then
          r2_62:setSubLayerVisible("system", "Msg01", r0_62.MswLay.name2, 0)
        end
      else
        if r0_62.MswLay.nameback2 ~= -1 then
          r2_62:setSubLayerVisible("system", "Msg01", r0_62.MswLay.nameback2, r3_62)
          r2_62:setSubLayerParam("system", "Msg01", r0_62.MswLay.nameback2, LUA_PARAM_COLOR, 1, 1, 1, r7_62)
        end
        if r0_62.MswLay.name2 ~= -1 then
          r2_62:setSubLayerVisible("system", "Msg01", r0_62.MswLay.name2, r3_62)
        end
        if r0_62.MswLay.nameback1 ~= -1 then
          r2_62:setSubLayerVisible("system", "Msg01", r0_62.MswLay.nameback1, 0)
        end
        if r0_62.MswLay.name1 ~= -1 then
          r2_62:setSubLayerVisible("system", "Msg01", r0_62.MswLay.name1, 0)
        end
      end
      r2_62:setVisible("system", "Name01", r3_62)
      if r0_62.MenuInf.effect == true and r3_62 == 1 then
        local r8_62 = 1
        r2_62:setParam("system", "Name01", LUA_PARAM_COLOR, 1, 1, 1, 0)
        r2_62:setEffect("system", "Name01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, r8_62, 0, 300 * r6_62, 0, 0)
        r2_62:startEffect("system", "Name01", "WndDisp", 0)
      end
    end
    g_namedisp = r3_62
  end
  g_MenuMsgWin.MswEffButtonParam = {}
  function g_MenuMsgWin.openMessageWindow(r0_63, r1_63)
    -- line: [2788, 2907] id: 63
    local r2_63 = nil	-- notice: implicit variable refs by block#[8, 9, 11]
    if g_windowID >= 0 then
      r2_63 = g_windowID
    elseif g_messageWindowType == 1 then
      r2_63 = 1
      if r2_63 then
        ::label_11::
        r2_63 = 0
      end
    else
      goto label_11	-- block#4 is visited secondly
    end
    local r3_63 = cclass.lua_Layers:create()
    r3_63:cancelEffect("system", "Msg01", "WndDisp")
    r3_63:cancelEffect("system", "Txt01", "WndDisp")
    r3_63:cancelEffect("system", "Msg02", "WndDisp")
    r3_63:cancelEffect("system", "Msg03", "WndDisp")
    local r4_63 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP)
    local r5_63 = 1
    if r4_63 == false and r1_63 == false then
      r5_63 = LUA_SKIPSPEED_NONE
    end
    r0_63:setButtonActive()
    local r6_63 = 300 * r5_63
    if r2_63 == 0 then
    end
    r3_63:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_63:setEffect("system", "Msg01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r6_63, 0, 0)
    r3_63:startEffect("system", "Msg01", "WndDisp", 0)
    r3_63:setParam("system", "Msg02", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_63:setEffect("system", "Msg02", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r6_63, 0, 0)
    if r2_63 == 0 then
      r3_63:setParam("system", "Msg02", LUA_PARAM_ROTATE, -90, 0, 90, 0)
      r3_63:setEffect("system", "Msg02", "WndDisp", LUA_EFFECT_ROTATE, 90, 0, -90, 0, 0, r6_63, 0, 0)
    end
    r3_63:startEffect("system", "Msg02", "WndDisp", 0)
    r3_63:setParam("system", "Msg03", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_63:setEffect("system", "Msg03", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r6_63, 0, 0)
    if r2_63 == 0 then
      r3_63:setParam("system", "Msg03", LUA_PARAM_ROTATE, 0, 90, 0, 0)
      r3_63:setEffect("system", "Msg03", "WndDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r6_63, 0, 0)
    end
    r3_63:startEffect("system", "Msg03", "WndDisp", 0)
    r3_63:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r3_63:setParam("system", "Txt01", LUA_PARAM_POS, r0_63.TxtPos.x, r0_63.TxtPos.y, 0, 0)
    r3_63:setEffect("system", "Txt01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r6_63, 0, 0)
    r3_63:startEffect("system", "Txt01", "WndDisp", 0)
    r3_63:setParam("system", "Clk01", LUA_PARAM_POS, r0_63.ClikPos.x, r0_63.ClikPos.y, 0, 0)
    r0_63.MenuInf.enabled = true
    r0_63.MenuInf.effect = true
    r0_63:windowOpenTips()
  end
  function g_MenuMsgWin.closeMessageWindow(r0_64, r1_64)
    -- line: [2910, 3024] id: 64
    local r2_64 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP)
    local r3_64 = 1
    if r2_64 == false and r1_64 == false then
      r3_64 = LUA_SKIPSPEED_NONE
    end
    local r4_64 = cclass.lua_Layers:create()
    r4_64:cancelEffect("system", "Msg01", "WndDisp")
    r4_64:cancelEffect("system", "Txt01", "WndDisp")
    r4_64:cancelEffect("system", "Msg02", "WndDisp")
    r4_64:cancelEffect("system", "Msg03", "WndDisp")
    r0_64:nameWindowVisible(false)
    r0_64:setButtonActive()
    local r5_64 = 300 * r3_64
    local r6_64 = nil
    if g_windowID >= 0 then
      r6_64 = g_windowID
    elseif g_messageWindowType == 1 then
      r6_64 = 1 or 0
    else
      goto label_52	-- block#7 is visited secondly
    end
    if r6_64 == 0 then
    end
    r4_64:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r4_64:setEffect("system", "Msg01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_64, 0, 0)
    r4_64:setParam("system", "Msg01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r4_64:setParam("system", "Msg01", LUA_PARAM_POS, r0_64.MswPos.x, r0_64.MswPos.y, 0, 0)
    r4_64:startEffect("system", "Msg01", "WndDisp", 0)
    r4_64:setParam("system", "Msg02", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r4_64:setEffect("system", "Msg02", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_64, 0, 0)
    if r6_64 == 0 then
      r4_64:setParam("system", "Msg02", LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r4_64:setEffect("system", "Msg02", "WndDisp", LUA_EFFECT_ROTATE, -90, 0, 90, -1, 0, r5_64, 0, 0)
    end
    r4_64:setParam("system", "Msg02", LUA_PARAM_POS, r0_64.MswPos2.x, r0_64.MswPos2.y, 0, 0)
    r4_64:startEffect("system", "Msg02", "WndDisp", 0)
    r4_64:setParam("system", "Msg03", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r4_64:setEffect("system", "Msg03", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_64, 0, 0)
    if r6_64 == 0 then
      r4_64:setParam("system", "Msg03", LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r4_64:setEffect("system", "Msg03", "WndDisp", LUA_EFFECT_ROTATE, 0, 90, 0, -1, 0, r5_64, 0, 0)
    end
    r4_64:setParam("system", "Msg03", LUA_PARAM_POS, r0_64.MswPos3.x, r0_64.MswPos3.y, 0, 0)
    r4_64:startEffect("system", "Msg03", "WndDisp", 0)
    r4_64:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 1)
    r4_64:setEffect("system", "Txt01", "WndDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_64, 0, 0)
    r4_64:setParam("system", "Txt01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r4_64:setParam("system", "Txt01", LUA_PARAM_POS, r0_64.TxtPos.x, r0_64.TxtPos.y, 0, 0)
    r4_64:startEffect("system", "Txt01", "WndDisp", 0)
    r0_64.MenuInf.enabled = false
    r0_64.MenuInf.effect = true
    r0_64:windowCloseTips()
  end
  function g_MenuMsgWin.hideMessageWindow(r0_65, r1_65)
    -- line: [3028, 3105] id: 65
    local r2_65 = cclass.lua_Layers:create()
    if r2_65:isEffect("system", "Msg01") == true then
      return false
    end
    if r2_65:isEffect("system", "Msg02") == true then
      return false
    end
    if r2_65:isEffect("system", "Msg03") == true then
      return false
    end
    if g_DisableGestureFlag == true then
      return false
    end
    local r4_65 = cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE)
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false and r1_65 == 1 then
      return false
    end
    if r1_65 == 0 and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
    end
    local r6_65 = 0
    if r1_65 == 0 then
      r6_65 = 1
      local r7_65 = cclass.lua_Sounds:new()
      r7_65:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
      r7_65:delete()
      g_refreshCursor = true
    end
    r2_65:setVisible("system", "Msg01", r6_65)
    r2_65:setVisible("system", "Msg02", r6_65)
    r2_65:setVisible("system", "Msg03", r6_65)
    r2_65:setVisible("system", "Txt01", r6_65)
    r2_65:setVisible("system", "Clk01", r6_65)
    if g_namedisp == 1 then
      r2_65:setVisible("system", "Name01", r6_65)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) then
      r2_65:setVisible("system", "Skip01", r6_65)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGAUTO) then
      r2_65:setVisible("system", "Auto01", r6_65)
    end
    r0_65:hideSelect(r1_65)
    r0_65:hideTips(r1_65)
    return true
  end
  function g_MenuMsgWin.startClickWaitAnimation(r0_66)
    -- line: [3109, 3116] id: 66
    cclass.lua_Layers:create():startAnimation("system", "Clk01", "CL_Wait", 2600, -1, 0)
  end
  function g_MenuMsgWin.stopClickWaitAnimation(r0_67)
    -- line: [3119, 3128] id: 67
    cclass.lua_Layers:create():stopAnimation("system", "Clk01", "CL_Wait")
  end
  function g_MenuMsgWin.changeMessageWindowOpacity(r0_68)
    -- line: [3131, 3208] id: 68
    local r1_68 = cclass.lua_Layers:create()
    local r2_68 = g_messagealpha / 100
    local r3_68 = g_namedisp
    if r3_68 == 1 then
      r3_68 = true or false
    else
      goto label_12	-- block#2 is visited secondly
    end
    r0_68:nameWindowVisible(r3_68)
    local r4_68 = g_windowID
    if r4_68 == -1 then
      r4_68 = g_messageWindowType
    end
    if r4_68 == 0 then
      if r0_68.MswLay.win1 ~= -1 then
        r1_68:setSubLayerVisible("system", "Msg01", r0_68.MswLay.win1, 1)
      end
      if r0_68.MswLay.back1 ~= -1 then
        r1_68:setSubLayerVisible("system", "Msg01", r0_68.MswLay.back1, 1)
        r1_68:setSubLayerParam("system", "Msg01", r0_68.MswLay.back1, LUA_PARAM_COLOR, 1, 1, 1, r2_68)
      end
      for r8_68, r9_68 in pairs(r0_68.MswWin1LayEx) do
        r1_68:setSubLayerVisible("system", "Msg01", r9_68, 1)
      end
      if r0_68.MswLay.win2 ~= -1 then
        r1_68:setSubLayerVisible("system", "Msg01", r0_68.MswLay.win2, 0)
      end
      if r0_68.MswLay.back2 ~= -1 then
        r1_68:setSubLayerVisible("system", "Msg01", r0_68.MswLay.back2, 0)
      end
      if r0_68.MswLay.nameback1 ~= -1 then
        r1_68:setSubLayerParam("system", "Msg01", r0_68.MswLay.nameback1, LUA_PARAM_COLOR, 1, 1, 1, r2_68)
      end
      r1_68:setSubLayerVisible("system", "Msg02", 37, 1)
      r1_68:setSubLayerVisible("system", "Msg03", 28, 1)
      r1_68:setSubLayerVisible("system", "Msg03", 29, 1)
    else
      if r0_68.MswLay.win2 ~= -1 then
        r1_68:setSubLayerVisible("system", "Msg01", r0_68.MswLay.win2, 1)
      end
      if r0_68.MswLay.back2 ~= -1 then
        r1_68:setSubLayerVisible("system", "Msg01", r0_68.MswLay.back2, 1)
        r1_68:setSubLayerParam("system", "Msg01", r0_68.MswLay.back2, LUA_PARAM_COLOR, 1, 1, 1, r2_68)
      end
      if r0_68.MswLay.win1 ~= -1 then
        r1_68:setSubLayerVisible("system", "Msg01", r0_68.MswLay.win1, 0)
      end
      for r8_68, r9_68 in pairs(r0_68.MswWin1LayEx) do
        r1_68:setSubLayerVisible("system", "Msg01", r9_68, 0)
      end
      if r0_68.MswLay.back1 ~= -1 then
        r1_68:setSubLayerVisible("system", "Msg01", r0_68.MswLay.back1, 0)
      end
      if r0_68.MswLay.nameback2 ~= -1 then
        r1_68:setSubLayerParam("system", "Msg01", r0_68.MswLay.nameback2, LUA_PARAM_COLOR, 1, 1, 1, r2_68)
      end
      r1_68:setSubLayerVisible("system", "Msg02", 37, 0)
      r1_68:setSubLayerVisible("system", "Msg03", 28, 0)
      r1_68:setSubLayerVisible("system", "Msg03", 29, 0)
    end
  end
  function g_MenuMsgWin.onResetMessageWindow(r0_69)
    -- line: [3211, 3280] id: 69
    local r1_69 = cclass.lua_Layers:create()
    r0_69:stopClickWaitAnimation()
    if r0_69.MenuInf.effect == true then
      r1_69:cancelEffect("system", "Msg01", "WndDisp")
      r1_69:cancelEffect("system", "Txt01", "WndDisp")
      r1_69:cancelEffect("system", "Name01", "WndDisp")
      r1_69:cancelEffect("system", "Clk01", "WndDisp")
      r1_69:cancelEffect("system", "Msg02", "WndDisp")
      r1_69:cancelEffect("system", "Msg03", "WndDisp")
      local r2_69 = nil
      if g_windowID >= 0 then
        r2_69 = g_windowID
      elseif g_messageWindowType == 1 then
        r2_69 = 1 or 0
      else
        goto label_52	-- block#5 is visited secondly
      end
      if r2_69 == 0 then
      end
      r0_69.MenuInf.effect = false
    end
    r0_69:nameWindowVisible(false)
    r1_69:setParam("system", "Msg01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r1_69:setParam("system", "Msg01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r1_69:setParam("system", "Msg01", LUA_PARAM_POS, r0_69.MswPos.x, r0_69.MswPos.y, 0, 0)
    r1_69:setParam("system", "Msg02", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r1_69:setParam("system", "Msg02", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r1_69:setParam("system", "Msg02", LUA_PARAM_POS, r0_69.MswPos2.x, r0_69.MswPos2.y, 0, 0)
    r1_69:setParam("system", "Msg03", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r1_69:setParam("system", "Msg03", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r1_69:setParam("system", "Msg03", LUA_PARAM_POS, r0_69.MswPos3.x, r0_69.MswPos3.y, 0, 0)
    r1_69:setParam("system", "Txt01", LUA_PARAM_COLOR, 1, 1, 1, 0)
    r1_69:setParam("system", "Txt01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
    r1_69:setParam("system", "Txt01", LUA_PARAM_POS, r0_69.TxtPos.x, r0_69.TxtPos.y, 0, 0)
    resetSkipIcon()
  end
  function g_MenuMsgWin.ReleaseMessageWindow(r0_70)
    -- line: [3283, 3286] id: 70
    r0_70:onResetMessageWindow()
    r0_70:onResetSelect()
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
  function g_MenuMsgWin.resetSkipIcon(r0_71)
    -- line: [3292, 3308] id: 71
    r0_71.buttonEffect.skip = false
    local r1_71 = cclass.lua_Layers:create()
    r1_71:setVisible("system", "Skip01", 0)
    if r0_71.buttonEffect.effect_skip == true then
      r0_71.buttonEffect.effect_skip = false
      r1_71:cancelEffect("system", "Skip01", "SkipDisp")
      r1_71:cancelSubLayerEffect("system", "Skip01", 4, "SkipEffect")
      r1_71:setSubLayerParam("system", "Skip01", 4, LUA_PARAM_SCALE, 1, 1, 1, 0)
      r1_71:cancelSubLayerEffect("system", "Skip01", 2, "SkipEffect")
      r1_71:setSubLayerParam("system", "Skip01", 2, LUA_PARAM_ROTATE, 0, 0, 0, 0)
    end
    return true
  end
  function g_MenuMsgWin.resetAutoIcon(r0_72)
    -- line: [3309, 3325] id: 72
    r0_72.buttonEffect.auto = false
    local r1_72 = cclass.lua_Layers:create()
    r1_72:setVisible("system", "Auto01", 0)
    if r0_72.buttonEffect.effect_auto == true then
      r0_72.buttonEffect.effect_auto = false
      r1_72:cancelEffect("system", "Auto01", "AutoDisp")
      r1_72:cancelSubLayerEffect("system", "Auto01", 4, "AutoEffect")
      r1_72:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_SCALE, 1, 1, 1, 0)
      r1_72:cancelSubLayerEffect("system", "Auto01", 2, "AutoEffect")
      r1_72:setSubLayerParam("system", "Auto01", 2, LUA_PARAM_ROTATE, 0, 0, 0, 0)
    end
    return true
  end
  function g_MenuMsgWin.LoadSkipAutoIcon(r0_73)
    -- line: [3329, 3349] id: 73
    local r1_73 = cclass.lua_Layers:create()
    r0_73:MenuLoadLayer("Skip01", "Sys_Skip.pna")
    r1_73:setVisible("system", "Skip01", 0)
    r1_73:setParam("system", "Skip01", LUA_PARAM_POS, r0_73.SkipPos.x, r0_73.SkipPos.y, 0, 0)
    for r6_73, r7_73 in pairs({
      2,
      3,
      4,
      5,
      7,
      8,
      9,
      10
    }) do
      r1_73:initSubLayer("system", "Skip01", r7_73, 0)
    end
    r0_73:MenuLoadLayer("Auto01", "Sys_Auto.pna")
    r1_73:setVisible("system", "Auto01", 0)
    r1_73:setParam("system", "Auto01", LUA_PARAM_POS, r0_73.AutoPos.x, r0_73.AutoPos.y, 0, 0)
    for r7_73, r8_73 in pairs({
      2,
      3,
      4,
      5,
      7,
      8
    }) do
      r1_73:initSubLayer("system", "Auto01", r8_73, 0)
    end
  end
  function g_MenuMsgWin.SetSkipAutoState(r0_74)
    -- line: [3353, 3544] id: 74
    local r1_74 = 100
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) ~= false or not 1 then
      local r3_74 = LUA_SKIPSPEED_NONE
    end
    local r4_74 = cclass.lua_Layers:create()
    if g_drawSkipIcon == false then
      if r4_74:isVisible("system", "Skip01") == true and r0_74.buttonEffect.effect_skip == false then
        r4_74:cancelEffect("system", "Skip01", "SkipDisp")
        r4_74:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_74:setParam("system", "Skip01", LUA_PARAM_POS, r0_74.SkipPos.x, r0_74.SkipPos.y, 0, 0)
        r4_74:setParam("system", "Skip01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_74:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_74, 0, 0)
        r4_74:startEffect("system", "Skip01", "SkipDisp", 0)
        r0_74.buttonEffect.skip = false
        r0_74.buttonEffect.effect_skip = true
      end
      if r4_74:isVisible("system", "Auto01") == true and r0_74.buttonEffect.effect_auto == false then
        r4_74:cancelEffect("system", "Auto01", "AutoDisp")
        r4_74:setParam("system", "Auto01", LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_74:setParam("system", "Auto01", LUA_PARAM_POS, r0_74.AutoPos.x, r0_74.AutoPos.y, 0, 0)
        r4_74:setParam("system", "Auto01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_74:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_74, 0, 0)
        r4_74:startEffect("system", "Auto01", "AutoDisp", 0)
        r0_74.buttonEffect.auto = false
        r0_74.buttonEffect.effect_auto = true
      end
      return 
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) and r0_74.MenuInf.enabled == true then
      if g_allskip == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) then
        r4_74:setSubLayerVisible("system", "Skip01", 7, 1)
        r4_74:setSubLayerVisible("system", "Skip01", 8, 0)
      else
        r4_74:setSubLayerVisible("system", "Skip01", 7, 0)
        r4_74:setSubLayerVisible("system", "Skip01", 8, 1)
      end
      if g_selectReleaseSkip then
        r4_74:setSubLayerVisible("system", "Skip01", 9, 1)
        r4_74:setSubLayerVisible("system", "Skip01", 10, 0)
      else
        r4_74:setSubLayerVisible("system", "Skip01", 9, 0)
        r4_74:setSubLayerVisible("system", "Skip01", 10, 1)
      end
      r4_74:setSubLayerVisible("system", "Skip01", 2, 1)
      r4_74:setSubLayerVisible("system", "Skip01", 3, 1)
      r4_74:setSubLayerVisible("system", "Skip01", 4, 1)
      r4_74:setSubLayerVisible("system", "Skip01", 5, 1)
      if r4_74:isVisible("system", "Skip01") == false then
        r4_74:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_74:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r1_74, 0, 0)
        r4_74:setParam("system", "Skip01", LUA_PARAM_POS, r0_74.SkipPos.x, r0_74.SkipPos.y, 0, 0)
        r4_74:setVisible("system", "Skip01", 1)
        r4_74:setParam("system", "Skip01", LUA_PARAM_ROTATE, 0, 90, 0, 0)
        r4_74:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r1_74, 0, 0)
        r4_74:startEffect("system", "Skip01", "SkipDisp", 0)
        r4_74:setSubLayerParam("system", "Skip01", 4, LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_74:setSubLayerParam("system", "Skip01", 4, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r4_74:setSubLayerEffect("system", "Skip01", "SkipEffect", 4, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 500, 0, 0)
        r4_74:setSubLayerEffect("system", "Skip01", "SkipEffect", 4, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 250, 0, 0)
        r4_74:startSubLayerEffect("system", "Skip01", "SkipEffect", 4, -1)
        r4_74:setSubLayerParam("system", "Skip01", 2, LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_74:setSubLayerEffect("system", "Skip01", "SkipEffect", 2, LUA_EFFECT_ROTATE, 0, 0, -360, 0, 0, 2000, 0, 0)
        r4_74:startSubLayerEffect("system", "Skip01", "SkipEffect", 2, -1)
        r0_74.buttonEffect.skip = true
        r0_74.buttonEffect.effect_skip = true
      end
    elseif r4_74:isVisible("system", "Skip01") == true and r0_74.buttonEffect.effect_skip == false then
      r4_74:cancelEffect("system", "Skip01", "SkipDisp")
      r4_74:setParam("system", "Skip01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_74:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r1_74, 0, 0)
      r4_74:setParam("system", "Skip01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r4_74:setEffect("system", "Skip01", "SkipDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_74, 0, 0)
      r4_74:startEffect("system", "Skip01", "SkipDisp", 0)
      r0_74.buttonEffect.skip = false
      r0_74.buttonEffect.effect_skip = true
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGAUTO) and r0_74.MenuInf.enabled == true then
      if g_selectReleaseAuto then
        r4_74:setSubLayerVisible("system", "Auto01", 8, 1)
        r4_74:setSubLayerVisible("system", "Auto01", 7, 0)
      else
        r4_74:setSubLayerVisible("system", "Auto01", 8, 0)
        r4_74:setSubLayerVisible("system", "Auto01", 7, 1)
      end
      r4_74:setSubLayerVisible("system", "Auto01", 2, 1)
      r4_74:setSubLayerVisible("system", "Auto01", 3, 1)
      r4_74:setSubLayerVisible("system", "Auto01", 4, 1)
      r4_74:setSubLayerVisible("system", "Auto01", 5, 1)
      if r4_74:isVisible("system", "Auto01") == false then
        r4_74:setVisible("system", "Auto01", 1)
        r4_74:setParam("system", "Auto01", LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_74:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r1_74, 0, 0)
        r4_74:setParam("system", "Auto01", LUA_PARAM_POS, r0_74.AutoPos.x, r0_74.AutoPos.y, 0, 0)
        r4_74:setParam("system", "Auto01", LUA_PARAM_ROTATE, 0, 90, 0, 0)
        r4_74:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_ROTATE, 0, -90, 0, 0, 0, r1_74, 0, 0)
        r4_74:startEffect("system", "Auto01", "AutoDisp", 0)
        r4_74:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_74:setSubLayerParam("system", "Auto01", 4, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r4_74:setSubLayerEffect("system", "Auto01", "AutoEffect", 4, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 500, 0, 0)
        r4_74:setSubLayerEffect("system", "Auto01", "AutoEffect", 4, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 250, 0, 0)
        r4_74:startSubLayerEffect("system", "Auto01", "AutoEffect", 4, -1)
        r4_74:setSubLayerParam("system", "Auto01", 2, LUA_PARAM_ROTATE, 0, 0, 0, 0)
        r4_74:setSubLayerParam("system", "Auto01", 2, LUA_PARAM_SCALE, 1, 1, 1, 0)
        r4_74:setSubLayerEffect("system", "Auto01", "AutoEffect", 2, LUA_EFFECT_ROTATE, 0, 0, -360, 0, 0, 2000, 0, 0)
        r4_74:startSubLayerEffect("system", "Auto01", "AutoEffect", 2, -1)
        r0_74.buttonEffect.auto = true
        r0_74.buttonEffect.effect_auto = true
      end
    elseif r4_74:isVisible("system", "Auto01") == true and r0_74.buttonEffect.effect_auto == false then
      r4_74:cancelEffect("system", "Auto01", "AutoDisp")
      r4_74:setParam("system", "Auto01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r4_74:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r1_74, 0, 0)
      r4_74:setParam("system", "Auto01", LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r4_74:setEffect("system", "Auto01", "AutoDisp", LUA_EFFECT_ROTATE, 0, 90, 0, 0, 0, r1_74, 0, 0)
      r4_74:startEffect("system", "Auto01", "AutoDisp", 0)
      r0_74.buttonEffect.auto = false
      r0_74.buttonEffect.effect_auto = true
    end
    r0_74:IconEffect()
  end
  function g_MenuMsgWin.IconEffect(r0_75)
    -- line: [3547, 3568] id: 75
    local r1_75 = cclass.lua_Layers:create()
    if r0_75.buttonEffect.effect_skip == true and r1_75:isEffect("system", "SkipDisp") == false then
      if r0_75.buttonEffect.skip ~= true then
        r1_75:setVisible("system", "Skip01", 0)
      end
      r0_75.buttonEffect.effect_skip = false
    end
    if r0_75.buttonEffect.effect_auto == true and r1_75:isEffect("system", "AutoDisp") == false then
      if r0_75.buttonEffect.auto ~= true then
        r1_75:setVisible("system", "Auto01", 0)
      end
      r0_75.buttonEffect.effect_auto = false
    end
  end
  if g_MenuMsgWin:MenuInit() == false then
    return false
  end
  local r1_14 = cclass.lua_Layers:create()
  changeMessageWindow(-1, false)
  g_MenuMsgWin:LoadSkipAutoIcon()
  r1_14:add("overlay")
  r1_14:setOverlaySet("overlay")
  r1_14:insertLayer("overlay", "ArrowView", LUA_LAYER_PNA, getGraphicsArcFileName("overlay", "Sys_ArrowView.pna"), "Sys_ArrowView.pna", 0)
  r1_14:insertLayer("overlay", "Arrow", LUA_LAYER_PNA, getGraphicsArcFileName("overlay", "Sys_Arrow.pna"), "Sys_Arrow.pna", 0)
  local r3_14 = 0
  local r4_14 = 0
  local r5_14 = 0
  local r6_14 = 0
  r3_14, r4_14, r5_14, r6_14 = r1_14:getParam("overlay", "Arrow", LUA_PARAM_SIZE, 0, 0, 0, 0)
  local r7_14 = math.floor((1280 - r3_14) / 2)
  local r8_14 = math.floor((720 - r4_14) / 2) - 100
  r1_14:setParam("overlay", "Arrow", LUA_PARAM_POS, r7_14, r8_14, 0, 0)
  for r12_14 = 0, 13, 1 do
    r1_14:initSubLayer("overlay", "Arrow", 14 - r12_14, 0)
    r1_14:initSubLayer("overlay", "Arrow", 30 - r12_14, 0)
  end
  local r9_14 = 0
  local r10_14 = 0
  local r11_14 = 0
  local r12_14 = 0
  r9_14, r10_14, r11_14, r12_14 = r1_14:getParam("overlay", "ArrowView", LUA_PARAM_SIZE, 0, 0, 0, 0)
  local r13_14 = math.floor((1280 - r9_14) / 2)
  local r14_14 = math.floor((720 - r10_14) / 2) - 100
  r1_14:setParam("overlay", "ArrowView", LUA_PARAM_POS, r13_14, r14_14, 0, 0)
  r1_14:initSubLayer("overlay", "ArrowView", 0, 0)
  r1_14:initSubLayer("overlay", "ArrowView", 1, 0)
  r1_14:initSubLayer("overlay", "ArrowView", 2, 0)
  r1_14:initSubLayer("overlay", "ArrowView", 3, 0)
  r9_14, r10_14, r11_14, r12_14 = r1_14:getSubLayerParam("overlay", "ArrowView", 0, LUA_PARAM_POS, 0, 0, 0, 0)
  g_ArrowViewPos[1].x = r13_14 - r7_14 + r9_14
  g_ArrowViewPos[1].y = r14_14 - r8_14 + r10_14
  r9_14, r10_14, r11_14, r12_14 = r1_14:getSubLayerParam("overlay", "ArrowView", 1, LUA_PARAM_POS, 0, 0, 0, 0)
  g_ArrowViewPos[2].x = r13_14 - r7_14 + r9_14
  g_ArrowViewPos[2].y = r14_14 - r8_14 + r10_14
  r9_14, r10_14, r11_14, r12_14 = r1_14:getSubLayerParam("overlay", "ArrowView", 2, LUA_PARAM_POS, 0, 0, 0, 0)
  g_ArrowViewPos[3].x = r13_14 - r7_14 + r9_14
  g_ArrowViewPos[3].y = r14_14 - r8_14 + r10_14
  r9_14, r10_14, r11_14, r12_14 = r1_14:getSubLayerParam("overlay", "ArrowView", 3, LUA_PARAM_POS, 0, 0, 0, 0)
  g_ArrowViewPos[4].x = r13_14 - r7_14 + r9_14
  g_ArrowViewPos[4].y = r14_14 - r8_14 + r10_14
  r1_14:initSubLayer("overlay", "ArrowView", 4, 1)
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
function checkOverlayFunction(r0_76)
  -- line: [3679, 3801] id: 76
  if r0_76 == 0 then
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
  elseif r0_76 == 1 then
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGSKIP) == false and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGCTRLSKIP) == false and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
      return false
    end
    return true
  elseif r0_76 ~= 10 and r0_76 ~= 11 then
    if r0_76 == 12 then
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
      if r0_76 == 3 then
        return cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOG)
      elseif r0_76 == 6 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLEQLOAD) == false) then
        return false
      elseif r0_76 == 5 then
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_TRANSITION) == true then
          return false
        end
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGOPEN) == false then
          return false
        end
      elseif r0_76 == 8 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false) then
        return false
      elseif r0_76 == 7 and cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        return false
      elseif r0_76 == 13 and (cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLESELECTLOAD) == false) then
        return false
      end
    end
  end
  return true
end
function getLongPressTime()
  -- line: [3806, 3808] id: 77
  return 300
end
function updateOverlay(r0_78, r1_78, r2_78)
  -- line: [3811, 3880] id: 78
  if getSystemSet() ~= "system" then
    r1_78 = false
  end
  local r4_78 = cclass.lua_Layers:create()
  if r1_78 == false then
    if getLongPressTime() < r2_78 then
      for r8_78 = 0, 13, 1 do
        local r9_78 = 0
        for r13_78 = 1, 4, 1 do
          if r8_78 == g_gestureFunc[r13_78] then
            if r13_78 == 1 then
              r4_78:setSubLayerParam("overlay", "Arrow", 14 - r8_78, LUA_PARAM_POS, g_ArrowViewPos[1].x, g_ArrowViewPos[1].y, 0, 0)
            elseif r13_78 == 2 then
              r4_78:setSubLayerParam("overlay", "Arrow", 14 - r8_78, LUA_PARAM_POS, g_ArrowViewPos[2].x, g_ArrowViewPos[2].y, 0, 0)
            elseif r13_78 == 3 then
              r4_78:setSubLayerParam("overlay", "Arrow", 14 - r8_78, LUA_PARAM_POS, g_ArrowViewPos[3].x, g_ArrowViewPos[3].y, 0, 0)
            elseif r13_78 == 4 then
              r4_78:setSubLayerParam("overlay", "Arrow", 14 - r8_78, LUA_PARAM_POS, g_ArrowViewPos[4].x, g_ArrowViewPos[4].y, 0, 0)
            end
            r9_78 = 1
            break
          end
        end
        r4_78:setSubLayerVisible("overlay", "Arrow", 14 - r8_78, r9_78)
        r4_78:setSubLayerVisible("overlay", "Arrow", 30 - r8_78, 0)
      end
      r4_78:setVisible("overlay", "Arrow", 1)
      r4_78:setVisible("overlay", "ArrowView", 1)
    else
      r4_78:setVisible("overlay", "Arrow", 0)
      r4_78:setVisible("overlay", "ArrowView", 0)
    end
  else
    r4_78:setVisible("overlay", "Arrow", 1)
    r4_78:setVisible("overlay", "ArrowView", 0)
    for r8_78 = 0, 13, 1 do
      r4_78:setSubLayerVisible("overlay", "Arrow", 14 - r8_78, 0)
      r4_78:setSubLayerVisible("overlay", "Arrow", 30 - r8_78, 0)
      r4_78:setSubLayerParam("overlay", "Arrow", 14 - r8_78, LUA_PARAM_POS, 0, 0, 0, 0)
      r4_78:setSubLayerParam("overlay", "Arrow", 30 - r8_78, LUA_PARAM_POS, 0, 0, 0, 0)
    end
    local r5_78 = g_gestureFunc[r0_78 + 1]
    if checkOverlayFunction(r5_78) == false then
      r4_78:setSubLayerVisible("overlay", "Arrow", 30 - r5_78, 1)
    else
      r4_78:setSubLayerVisible("overlay", "Arrow", 14 - r5_78, 1)
    end
  end
end
function getSystemSet()
  -- line: [3888, 3905] id: 79
  if g_confirmDialog > 0 then
    return "dialog"
  elseif g_cmdLineInfo.enabled == true or g_cmdLineInfo.effect == true then
    return "cmdLine"
  end
  for r3_79, r4_79 in pairs(g_Menu) do
    if r4_79.ptr ~= nil and r4_79.ptr:GetMenuActive() == true then
      return r4_79.ptr.MenuInf.SetName
    end
  end
  return "system"
end
function getMessageWindowKey(r0_80)
  -- line: [3908, 3911] id: 80
  return "system", "Txt01"
end
function getNameWindowKey(r0_81)
  -- line: [3913, 3919] id: 81
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin.MenuInf.nameWindow = 1
  end
  return "system", "Name01"
end
function getMessageWindowState()
  -- line: [3921, 3926] id: 82
  if g_MenuMsgWin ~= nil and g_MenuMsgWin.MenuInf.nameWindow == 1 then
    return g_namedisp, g_MenuMsgWin.MenuInf.nameWindow, g_MenuMsgWin.MenuInf.msgWindow, "system", "Name01"
  end
end
function setMessageWindowState(r0_83, r1_83)
  -- line: [3928, 3934] id: 83
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin.MenuInf.nameWindow = r0_83
    g_MenuMsgWin.MenuInf.msgWindow = r1_83
  end
end
function nameWindowVisible(r0_84)
  -- line: [3937, 3943] id: 84
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:nameWindowVisible(r0_84)
  end
end
function openMessageWindowWoEffect()
  -- line: [3946, 3964] id: 85
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin.MenuButton:InitList()
    g_MenuMsgWin:MakeWindowBut()
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
function openMessageWindow(r0_86)
  -- line: [3966, 3971] id: 86
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:openMessageWindow(r0_86)
  end
end
function closeMessageWindow(r0_87)
  -- line: [3973, 3978] id: 87
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:closeMessageWindow(r0_87)
  end
end
function resetMessageWindow(r0_88)
  -- line: [3980, 3984] id: 88
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:resetMessageWindow(r0_88)
  end
end
function isMessageWindowEffect()
  -- line: [3986, 3997] id: 89
  if g_MenuMsgWin ~= nil then
    local r0_89 = g_MenuMsgWin:MenuEffect()
    if nil and not nil then
      goto label_8	-- block#2 is visited secondly
    end
    return r0_89
  end
  return false
end
function hideMessageWindow(r0_90)
  -- line: [4000, 4006] id: 90
  if g_MenuMsgWin ~= nil then
    return g_MenuMsgWin:hideMessageWindow(r0_90)
  end
  return true
end
function startClickWaitAnimation()
  -- line: [4008, 4013] id: 91
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:startClickWaitAnimation()
  end
end
function stopClickWaitAnimation()
  -- line: [4015, 4021] id: 92
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:stopClickWaitAnimation()
    g_MenuMsgWin:TipsNextCount()
  end
end
function getDefaultFont()
  -- line: [4023, 4032] id: 93
  local r0_93 = getGameEngineVersion()
  if g_fonts ~= nil then
    return g_fonts.name
  else
    return "\x82l\x82r \x83S\x83V\x83b\x83N"
  end
end
function LoadGameFont()
  -- line: [4035, 4042] id: 94
  local r0_94 = cclass.CLegacyFontInfo:create()
  local r1_94 = getDefaultFont()
  if getGameEngineVersion() == 1.4 and g_fonts ~= nil then
    r0_94:extention("Fonts.arc", g_fonts.file, r1_94)
  end
end
function initFontInformation()
  -- line: [4044, 4066] id: 95
  local r0_95 = cclass.CLegacyFontInfo:create()
  local r1_95 = getDefaultFont()
  if g_name1Color.normalEdge ~= -1 then
    r0_95:add("system", "Name01", r1_95, g_name1Color.defsize, 1, 0, g_name1Color.normal, g_name1Color.normalEdge)
  else
    r0_95:add("system", "Name01", r1_95, g_name1Color.defsize, 0, 0, g_name1Color.normal, 0)
  end
  if g_message1Color.normalEdge ~= -1 then
    r0_95:add("system", "Txt01", r1_95, g_message1Color.defsize, 1, 0, g_message1Color.normal, g_message1Color.normalEdge)
  else
    r0_95:add("system", "Txt01", r1_95, g_message1Color.defsize, 0, 0, g_message1Color.normal, 0)
  end
  r0_95:add("messageLog", "LogText01", r1_95, g_logTextColor.defsize, 1, 0, g_logTextColor.normal, g_logTextColor.normalEdge)
  r0_95:add("cmdLine", "inputLine", r1_95, 17, 2, 0, g_message1Color.normal, g_message1Color.normalEdge)
end
function getAllSkip()
  -- line: [4069, 4072] id: 96
  return g_allskip
end
function getSelectReleaseSkip()
  -- line: [4075, 4078] id: 97
  return g_selectReleaseSkip
end
function getSelectReleaseAuto()
  -- line: [4081, 4084] id: 98
  return g_selectReleaseAuto
end
function getEffectSpeed()
  -- line: [4087, 4090] id: 99
  return g_effectSpeed
end
function getUseBGMCut()
  -- line: [4093, 4096] id: 100
  return g_bgmCutPer
end
function getEffectRate()
  -- line: [4099, 4108] id: 101
  local r0_101 = 1
  local r1_101 = getEffectSpeed()
  if r1_101 == 2 then
    r0_101 = LUA_SKIPSPEED_NONE
  elseif r1_101 == 1 then
    r0_101 = LUA_SKIPSPEED_OMIT
  end
  return r0_101
end
function getSoundIndex(r0_102)
  -- line: [4111, 4122] id: 102
  for r4_102, r5_102 in pairs(g_volume) do
    local r6_102 = nil
    local r7_102 = nil
    r6_102, r7_102 = string.find(string.lower(r0_102), string.lower(r5_102.name))
    if r6_102 == 1 then
      return r4_102
    end
  end
  return 0
end
function checkOtherVoice(r0_103)
  -- line: [4124, 4142] id: 103
  for r4_103 = 1, #g_charKeysOtherM, 1 do
    local r5_103 = nil
    local r6_103 = nil
    r5_103, r6_103 = string.find(string.lower(r0_103), string.lower(g_charKeysOtherM[r4_103]))
    if r5_103 ~= nil then
      return 1
    end
  end
  for r4_103 = 1, #g_charKeysOtherF, 1 do
    local r5_103 = nil
    local r6_103 = nil
    r5_103, r6_103 = string.find(string.lower(r0_103), string.lower(g_charKeysOtherF[r4_103]))
    if r5_103 ~= nil then
      return 2
    end
  end
  return 0
end
function checkBgvKey(r0_104)
  -- line: [4145, 4150] id: 104
  return g_BgvKeyToVolkey[r0_104]
end
function getSoundVolume(r0_105)
  -- line: [4153, 4230] id: 105
  local r1_105 = checkOtherVoice(r0_105)
  if r1_105 == 1 then
    r0_105 = "charOtherM"
  elseif r1_105 == 2 then
    r0_105 = "charOtherF"
  end
  if r0_105 == "ConfTestVoice" then
    return g_ConfigVoiceVolume
  end
  if r0_105 == "ConfTestSE" then
    return g_ConfigSeVolume
  end
  local r2_105 = checkBgvKey(r0_105)
  local r3_105 = getBGVAllKey()
  local r4_105 = 1
  if r2_105 ~= nil then
    r0_105 = r2_105
    for r8_105, r9_105 in pairs(g_volume) do
      if r9_105.name == r3_105 then
        r4_105 = r9_105.vol / 1000
        break
      end
    end
  end
  local r5_105 = false
  local r6_105 = 0
  if r0_105 == "systemVoice" then
    r0_105 = "char"
  end
  for r10_105, r11_105 in pairs(g_volume) do
    local r12_105 = nil
    local r13_105 = nil
    r12_105, r13_105 = string.find(string.lower(r0_105), string.lower(r11_105.name))
    if r12_105 ~= nil and r12_105 == 1 then
      local r14_105 = math.floor(r11_105.vol * r4_105)
      if r11_105.mute == true then
        r14_105 = 0
      end
      if r11_105.name == getVoiceAllKey() then
        r5_105 = true
        r6_105 = r14_105
      else
        return r14_105
      end
    end
  end
  if r5_105 == true then
    return r6_105
  end
  return 0
end
function getMessageSpeed()
  -- line: [4233, 4239] id: 106
  return math.floor(350 - 350 * g_msgspeed / 100)
end
function getAutoWaitTime()
  -- line: [4242, 4246] id: 107
  return g_autospeed * 2
end
function getGraphicsArcFileName(r0_108, r1_108)
  -- line: [4249, 4500] id: 108
  -- notice: unreachable block#46
  -- notice: unreachable block#49
  -- notice: unreachable block#84
  -- notice: unreachable block#85
  -- notice: unreachable block#58
  -- notice: unreachable block#70
  -- notice: unreachable block#57
  -- notice: unreachable block#52
  -- notice: unreachable block#53
  -- notice: unreachable block#50
  -- notice: unreachable block#48
  -- notice: unreachable block#51
  -- notice: unreachable block#55
  -- notice: unreachable block#62
  -- notice: unreachable block#69
  -- notice: unreachable block#72
  -- notice: unreachable block#68
  -- notice: unreachable block#82
  -- notice: unreachable block#83
  -- notice: unreachable block#47
  -- notice: unreachable block#61
  -- notice: unreachable block#66
  -- notice: unreachable block#56
  -- notice: unreachable block#63
  -- notice: unreachable block#78
  -- notice: unreachable block#86
  -- notice: unreachable block#71
  -- notice: unreachable block#60
  -- notice: unreachable block#65
  -- notice: unreachable block#73
  -- notice: unreachable block#76
  -- notice: unreachable block#44
  -- notice: unreachable block#79
  -- notice: unreachable block#81
  -- notice: unreachable block#80
  -- notice: unreachable block#64
  -- notice: unreachable block#77
  -- notice: unreachable block#87
  -- notice: unreachable block#74
  -- notice: unreachable block#45
  -- notice: unreachable block#67
  -- notice: unreachable block#59
  -- notice: unreachable block#75
  -- notice: unreachable block#54
  local r2_108 = nil
  local r3_108 = nil
  local r4_108 = nil
  local r5_108 = nil
  local r6_108 = cfunc.LegacyGame__lua_GetFlag(1005)
  if string.lower(string.sub(r1_108, 1, 4)) == "sys_" then
    return "SysGraphic.arc"
  end
  if string.lower(string.sub(r1_108, 1, 5)) == "efmsk" then
    return "Graphic.arc"
  end
  if string.lower(string.sub(r1_108, 1, 5)) == "layer" then
    return "Graphic.arc"
  end
  if string.lower(string.sub(r1_108, 1, 6)) == "cutin_" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_108, 1, 6)) == "hoshi_" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_108, 1, 6)) == "appli_" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_108, 1, 2)) == "bg" then
    if string.lower(string.sub(r1_108, -6)) == "_l.png" then
      return "Chip1A.arc"
    end
    return "Chip1.arc"
  end
  if string.lower(string.sub(r1_108, 1, 3)) == "sky" then
    return "Chip1.arc"
  end
  if string.lower(string.sub(r1_108, 1, 4)) == "com_" then
    return "Chip3.arc"
  end
  if string.lower(string.sub(r1_108, 1, 4)) == "hik_" then
    return "Chip3.arc"
  end
  if string.lower(string.sub(r1_108, 1, 4)) == "kor_" then
    return "Chip3A.arc"
  end
  if string.lower(string.sub(r1_108, 1, 4)) == "ori_" then
    return "Chip3A.arc"
  end
  if string.lower(string.sub(r1_108, 1, 4)) == "say_" then
    return "Chip3B.arc"
  end
  if string.lower(string.sub(r1_108, 1, 5)) == "sdev_" then
    return "Chip4.arc"
  end
  if string.lower(string.sub(r1_108, 1, 2)) == "ef" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_108, 1, 3)) == "est" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_108, 1, 2)) == "im" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_108, 1, 5)) == "noise" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_108, 1, 4)) == "hand" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_108, 1, 4)) == "fall" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_108, 1, 5)) == "grass" then
    return "Chip2.arc"
  end
  return "Graphic.arc"
end
function getModelArcFileName(r0_109, r1_109)
  -- line: [4503, 4505] id: 109
  return "Model.arc"
end
function getSoundArcFileName(r0_110, r1_110)
  -- line: [4508, 4651] id: 110
  -- notice: unreachable block#23
  -- notice: unreachable block#16
  -- notice: unreachable block#21
  -- notice: unreachable block#17
  -- notice: unreachable block#19
  -- notice: unreachable block#22
  -- notice: unreachable block#18
  -- notice: unreachable block#20
  local r2_110 = nil
  local r3_110 = nil
  for r8_110, r9_110 in pairs({
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
  }) do
    local r10_110 = r9_110 .. "SysVoice"
    local r12_110 = string.lower(r0_110)
    r2_110, r3_110 = string.find(r12_110, string.lower(r10_110))
    if r2_110 ~= nil then
      local r11_110 = "SysVoice.arc"
      return r11_110
    end
  end
  r2_110, r3_110 = string.find(string.lower(r0_110), "char")
  if r2_110 ~= nil then
    s = string.sub(r1_110, 1, 4)
    if string.lower(s) == "ori_" then
      return "Voice1.arc"
    end
    s = string.sub(r1_110, 1, 5)
    if string.lower(s) == "saya_" then
      return "Voice1.arc"
    end
    return "Voice.arc"
  end
  r2_110, r3_110 = string.find(string.lower(r0_110), "bgv")
  if r2_110 ~= nil then
    return "Se.arc"
  end
  r2_110, r3_110 = string.find(string.lower(r0_110), "bgm")
  if r2_110 ~= nil then
    return "Bgm.arc"
  end
  r2_110, r3_110 = string.find(string.lower(r0_110), "systemvoice")
  if r2_110 ~= nil then
    return "SysVoice.arc"
  end
  return "Se.arc"
end
function getVoiceAllKey()
  -- line: [4654, 4657] id: 111
  return "char"
end
function getBGVAllKey()
  -- line: [4660, 4663] id: 112
  return "bgv"
end
function getBGMAllKey()
  -- line: [4666, 4669] id: 113
  return "bgm"
end
function getBGVCharKey(r0_114)
  -- line: [4672, 4684] id: 114
  key = checkBgvKey(r0_114)
  if key == nil then
    return getBGVAllKey()
  end
  return key
end
function getMouseAutoMove()
  -- line: [4687, 4690] id: 115
  return g_mouseAutoMove
end
function getHideCursor()
  -- line: [4693, 4703] id: 116
  local r0_116 = 0
  if g_hideCursorOn == true then
    r0_116 = g_hideCursor
  else
    r0_116 = 2
  end
  return r0_116
end
function getClickVoice()
  -- line: [4706, 4709] id: 117
  return g_clickVoice
end
function getEnablePan()
  -- line: [4712, 4715] id: 118
  return g_enablePan
end
function getBGVVoiceMute()
  -- line: [4718, 4723] id: 119
  return g_bgvVoiceMute
end
function getDeactiveMode()
  -- line: [4726, 4729] id: 120
  return g_deactiveMode
end
function isGesture(r0_121)
  -- line: [4732, 4752] id: 121
  if g_gestureDisable then
    return false
  end
  if g_DisableGestureFlag == true then
    return false
  end
  if r0_121 == "system" then
    return true
  end
  return false
end
function onGesture(r0_122, r1_122, r2_122, r3_122, r4_122, r5_122)
  -- line: [4755, 4808] id: 122
  if r0_122 == "system" then
    local r6_122 = g_gestureFunc[r2_122 + 1]
    if checkOverlayFunction(r6_122) == false then
      return 
    end
    if r6_122 == 0 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGSKIP)
    elseif r6_122 == 1 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGCTRLSKIP)
    elseif r6_122 == 2 then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGAUTO)
    elseif r6_122 == 3 then
      openMessageLog()
    elseif r6_122 == 4 then
      openConfig(0, false)
    elseif r6_122 == 5 then
      local r8_122 = cclass.lua_Sounds:new()
      r8_122:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
      r8_122:delete()
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
    elseif r6_122 == 6 then
      openConfirm(LUA_CONFIRM_QUICKLOAD)
    elseif r6_122 == 7 then
      openConfig(4, false)
    elseif r6_122 == 8 then
      openConfig(5, false)
    elseif r6_122 == 9 then
      openConfirm(LUA_CONFIRM_TITLE)
    elseif r6_122 == 10 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_MINIMIZED, 0)
    elseif r6_122 == 11 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SCREENMODE, 0)
    elseif r6_122 == 12 then
      local r8_122 = nil
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) then
        r8_122 = 0
      else
        r8_122 = 1
      end
      if hideMessageWindow(r8_122) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_MSGHIDE)
      end
    elseif r6_122 == 13 then
      openConfirm(LUA_CONFIRM_SELECTLOAD)
    elseif r6_122 == 14 then
    end
  end
end
function onLButtonDown(r0_123, r1_123, r2_123, r3_123, r4_123, r5_123)
  -- line: [4816, 4833] id: 123
  if r0_123 == "system" then
    onLButtonDownMessageWindow(r0_123, r1_123, r2_123, r3_123, r4_123, r5_123)
  elseif r0_123 == "dialog" then
    onLButtonDownDialog(r0_123, r1_123, r2_123, r3_123, r4_123, r5_123)
  else
    for r9_123, r10_123 in pairs(g_Menu) do
      if r10_123.ptr ~= nil and r0_123 == r10_123.ptr.MenuInf.SetName then
        r10_123.ptr:MenuLButtonDown(r0_123, r1_123, r2_123, r3_123, r4_123, r5_123)
        break
      end
    end
  end
end
function onLButtonUp(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124)
  -- line: [4836, 4853] id: 124
  if r0_124 == "system" then
    onLButtonUpMessageWindow(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124)
  elseif r0_124 == "dialog" then
    onLButtonUpDialog(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124)
  else
    for r9_124, r10_124 in pairs(g_Menu) do
      if r10_124.ptr ~= nil and r0_124 == r10_124.ptr.MenuInf.SetName then
        r10_124.ptr:MenuLButtonUp(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124)
        break
      end
    end
  end
end
function onRButtonUp(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
  -- line: [4857, 4874] id: 125
  if r0_125 == "system" then
    onRButtonDownMessageWindow(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
  elseif r0_125 == "dialog" then
    onRButtonUpDialog(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
  else
    for r9_125, r10_125 in pairs(g_Menu) do
      if r10_125.ptr ~= nil and r0_125 == r10_125.ptr.MenuInf.SetName then
        r10_125.ptr:MenuRButtonUp(r0_125, r1_125, r2_125, r3_125, r4_125, r5_125)
        break
      end
    end
  end
end
function onMButtonDown(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
  -- line: [4877, 4890] id: 126
  if r0_126 ~= "system" then
    for r9_126, r10_126 in pairs(g_Menu) do
      if r10_126.ptr ~= nil and r0_126 == r10_126.ptr.MenuInf.SetName then
        r10_126.ptr:MenuMButtonDown(r0_126, r1_126, r2_126, r3_126, r4_126, r5_126)
        break
      end
    end
  end
end
function onMButtonUp(r0_127, r1_127, r2_127, r3_127, r4_127, r5_127)
  -- line: [4893, 4905] id: 127
  if r0_127 ~= "system" then
    for r9_127, r10_127 in pairs(g_Menu) do
      if r10_127.ptr ~= nil and r0_127 == r10_127.ptr.MenuInf.SetName then
        r10_127.ptr:MenuMButtonUp(r0_127, r1_127, r2_127, r3_127, r4_127, r5_127)
        break
      end
    end
  end
end
function onMouseMove(r0_128, r1_128, r2_128, r3_128, r4_128, r5_128)
  -- line: [4908, 4928] id: 128
  if r0_128 == "system" then
    onMouseMoveMessageWindow(r0_128, r1_128, r2_128, r3_128, r4_128, r5_128)
  elseif r0_128 == "dialog" then
    onMouseMoveDialog(r0_128, r1_128, r2_128, r3_128, r4_128, r5_128)
  else
    for r9_128, r10_128 in pairs(g_Menu) do
      if r10_128.ptr ~= nil and r0_128 == r10_128.ptr.MenuInf.SetName then
        r10_128.ptr:MenuMouseMove(r0_128, r1_128, r2_128, r3_128, r4_128, r5_128)
        break
      end
    end
  end
end
function onMouseWheel(r0_129, r1_129)
  -- line: [4931, 4947] id: 129
  if r0_129 ~= "system" and r0_129 ~= "dialog" then
    for r5_129, r6_129 in pairs(g_Menu) do
      if r6_129.ptr ~= nil and r0_129 == r6_129.ptr.MenuInf.SetName then
        r6_129.ptr:MenuMouseWheel(r0_129, r1_129)
        break
      end
    end
  end
end
function onKeyDown(r0_130, r1_130, r2_130, r3_130)
  -- line: [4950, 4964] id: 130
  if r0_130 == "system" then
    onKeyDownMessageWindow(r0_130, r1_130, r2_130, r3_130)
  elseif r0_130 == "dialog" then
    onKeyDownDialog(r0_130, r1_130, r2_130, r3_130)
  else
    for r7_130, r8_130 in pairs(g_Menu) do
      if r8_130.ptr ~= nil and r0_130 == r8_130.ptr.MenuInf.SetName then
        r8_130.ptr:MenuKeyDown(r0_130, r1_130, r2_130, r3_130)
      end
    end
  end
end
function onIMEnd(r0_131, r1_131, r2_131)
  -- line: [4977, 4990] id: 131
  if r0_131 == "cmdLine" then
    if r2_131 == false then
      cfunc.LegacyGame__lua_SetString("@FIRST", r1_131, false)
      cfunc.LegacyGame__lua_SetString("@FIRST", r1_131, true)
    end
    local r3_131 = cclass.lua_Layers:create()
    r3_131:removeLayer("cmdLine", "inputLine")
    r3_131:removeLayer("cmdLine", "CmdLine01")
    g_cmdLineInfo.enabled = false
    g_cmdLineInfo.effect = false
  end
end
function faceRead(r0_132)
  -- line: [4994, 5009] id: 132
  local r1_132 = cclass.lua_Layers:create()
  if string.lower(r0_132) == ".png" then
    r1_132:removeLayer("system", "MsgFace")
    return true
  else
    local r3_132 = r1_132:insertLayer("system", "MsgFace", LUA_LAYER_STD, getGraphicsArcFileName("system", r0_132), r0_132, 1)
    r1_132:setParam("system", "MsgFace", LUA_PARAM_POS, 89, 511, 0, 0)
    return r3_132
  end
end
function onMouseMoveMessageWindow(r0_133, r1_133, r2_133, r3_133, r4_133, r5_133)
  -- line: [5016, 5022] id: 133
  if g_MenuMsgWin ~= nil and r0_133 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuMouseMove(r0_133, r1_133, r2_133, r3_133, r4_133, r5_133)
  end
end
function onLButtonDownMessageWindow(r0_134, r1_134, r2_134, r3_134, r4_134, r5_134)
  -- line: [5025, 5029] id: 134
  if g_MenuMsgWin ~= nil and r0_134 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuLButtonDown(r0_134, r1_134, r2_134, r3_134, r4_134, r5_134)
  end
end
function onLButtonUpMessageWindow(r0_135, r1_135, r2_135, r3_135, r4_135, r5_135)
  -- line: [5032, 5036] id: 135
  if g_MenuMsgWin ~= nil and r0_135 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuLButtonUp(r0_135, r1_135, r2_135, r3_135, r4_135, r5_135)
  end
end
function onRButtonDownMessageWindow(r0_136, r1_136, r2_136, r3_136, r4_136, r5_136)
  -- line: [5039, 5043] id: 136
  if g_MenuMsgWin ~= nil and r0_136 == g_MenuMsgWin.MenuInf.SetName then
    g_MenuMsgWin:MenuRButtonDown(r0_136, r1_136, r2_136, r3_136, r4_136, r5_136)
  end
end
function onKeyDownMessageWindow(r0_137, r1_137, r2_137, r3_137)
  -- line: [5049, 5053] id: 137
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:MenuKeyDown(r0_137, r1_137, r2_137, r3_137)
  end
end
function setButtonState()
  -- line: [5057, 5062] id: 138
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:setButtonState()
  end
end
function refreshCursorPos()
  -- line: [5065, 5072] id: 139
  if g_refreshCursor then
    cfunc.D3DApp__lua_PostMouseMove()
    g_refreshCursor = false
  end
end
function willChangeVariable()
  -- line: [5075, 5077] id: 140
end
function didChangeVariable()
  -- line: [5080, 5082] id: 141
end
function getCharacterKeyCount()
  -- line: [5085, 5088] id: 142
  return #g_charKeys + #g_charKeysOtherM + #g_charKeysOtherF
end
function getCharacterKey(r0_143)
  -- line: [5091, 5102] id: 143
  r0_143 = r0_143 + 1
  if #g_charKeys + #g_charKeysOtherM < r0_143 then
    return g_charKeysOtherF[r0_143 - #g_charKeys + #g_charKeysOtherM]
  elseif #g_charKeys < r0_143 then
    return g_charKeysOtherM[r0_143 - #g_charKeys]
  else
    return g_charKeys[r0_143]
  end
end
function executeQuickSave()
  -- line: [5105, 5113] id: 144
  local r0_144 = cclass.lua_Sounds:new()
  r0_144:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  r0_144:delete()
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKSAVEGAME, 0)
end
function executeQuickLoad()
  -- line: [5116, 5122] id: 145
  local r0_145 = cclass.lua_Sounds:new()
  r0_145:SndPlay("systemse", getSoundArcFileName("systemse", "SYS03.ogg"), "SYS03.ogg", getSoundVolume("systemse"))
  openConfirm(LUA_CONFIRM_QUICKLOAD)
  r0_145:delete()
end
function getMessageWindowEffect()
  -- line: [5125, 5131] id: 146
  if g_MenuMsgWin ~= nil then
    return g_MenuMsgWin.MenuInf.effect
  end
  return false
end
function initSelect(r0_147)
  -- line: [5134, 5147] id: 147
  g_MenuMsgWin.SelectCount = r0_147
  g_MenuMsgWin:MenuMakeSelectLayer()
  g_MenuMsgWin:MakeSelectBut()
  g_MenuMsgWin:SetSelectButPos()
  g_MenuMsgWin:startSelectMenu()
end
function getLocalSelectText(r0_148)
  -- line: [5153, 5157] id: 148
  return string.format("SelTxt%03d", r0_148)
end
function getLocalSelectKey(r0_149)
  -- line: [5162, 5166] id: 149
  return string.format("SelWnd%03d", r0_149)
end
function disableSelectItem(r0_150)
  -- line: [5172, 5188] id: 150
  if g_MenuMsgWin ~= nil then
    setSelectTextColor(r0_150, -1)
    g_MenuMsgWin:DisableSelect(r0_150)
  end
end
function getSelectTextKey(r0_151)
  -- line: [5193, 5197] id: 151
  return "system", getLocalSelectText(r0_151 + 1)
end
function isSelectEffect()
  -- line: [5200, 5207] id: 152
  local r0_152 = false
  if g_MenuMsgWin ~= nil then
    r0_152 = g_MenuMsgWin:SelectEffect()
  end
  return r0_152
end
function setSelectTextColor(r0_153, r1_153)
  -- line: [5210, 5227] id: 153
  local r2_153 = getLocalSelectText(r0_153 + 1)
  local r3_153 = cclass.CLegacyFontInfo:create()
  if r1_153 == 0 then
    r3_153:changeColor("system", r2_153, g_selectTextColor.normal, g_selectTextColor.normalEdge)
  elseif r1_153 == 1 then
    r3_153:changeColor("system", r2_153, g_selectTextColor.already, g_selectTextColor.alreadyEdge)
  elseif r1_153 == 2 then
    r3_153:changeColor("system", r2_153, g_selectTextColor.selected, g_selectTextColor.selectedEdge)
  else
    r3_153:changeColor("system", r2_153, g_selectTextColor.disabled, g_selectTextColor.disabledEdge)
  end
  cclass.lua_Layers:create():updateTextColor("system", r2_153)
  g_SelectTextColorState[r0_153 + 1] = r1_153
end
function isSystemEffect(r0_154)
  -- line: [5230, 5258] id: 154
  local r1_154 = false
  if g_MenuDialog ~= nil then
    local r2_154 = g_MenuDialog:MenuEffect()
    if r2_154 == false and g_MenuDialog.MenuInf.enabled == false then
      g_MenuDialog = nil
    end
    if not r1_154 then
      r1_154 = r2_154
    end
  end
  for r5_154, r6_154 in pairs(g_Menu) do
    if r6_154.ptr ~= nil then
      local r7_154 = r6_154.ptr:MenuEffect()
      if r7_154 == false and r6_154.ptr.MenuInf.enabled == false then
        r6_154.ptr = nil
      end
      if not r1_154 then
        r1_154 = r7_154
      end
    end
  end
  local r2_154 = isCmdLineEffect()
  if r2_154 == true then
    r2_154 = true or false
  else
    goto label_49	-- block#16 is visited secondly
  end
  if not r1_154 then
    r1_154 = r2_154
  end
  return r1_154
end
function openCmdLine()
  -- line: [5268, 5289] id: 155
  local r0_155 = cclass.lua_Layers:create()
  if r0_155:add("cmdLine") == false then
    return false
  end
  r0_155:insertLayer("cmdLine", "CmdLine01", LUA_LAYER_PNA, getGraphicsArcFileName("cmdLine", "Sys_CmdLine.pna"), "Sys_CmdLine.pna", 1)
  for r6_155 = 1, 13, 1 do
    local r1_155 = r0_155:initSubLayer("cmdLine", "CmdLine01", r6_155, 1)
  end
  local r3_155 = 0
  local r4_155 = 0
  local r5_155 = 0
  local r6_155 = 0
  r3_155, r4_155, r5_155, r6_155 = r0_155:getSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_SIZE, r3_155, r4_155, r5_155, r6_155)
  r0_155:insertCommandLineLayer("cmdLine", "inputLine", cfunc.LegacyGame__lua_GetString("@FIRST", true), r3_155, r4_155, 8, 1, 8, 1, 0.25, 1, 5)
  r3_155, r4_155, r5_155, r6_155 = r0_155:getSubLayerParam("cmdLine", "CmdLine01", 13, LUA_PARAM_POS, r3_155, r4_155, r5_155, r6_155)
  r0_155:setParam("cmdLine", "inputLine", LUA_PARAM_POS, r3_155, r4_155, r5_155, r6_155)
  g_cmdLineInfo.enabled = true
  g_cmdLineInfo.effect = false
  cfunc.LegacyGame__lua_NeedShell("http://www.will-japan.co.jp/")
end
function isCmdLineEffect()
  -- line: [5291, 5293] id: 156
  return false
end
function setIMState()
  -- line: [5295, 5336] id: 157
  local r0_157 = cclass.lua_Layers:create()
  local r1_157 = 0
  local r2_157 = 0
  local r3_157 = 0
  local r4_157 = 0
  r1_157, r2_157, r3_157, r4_157 = r0_157:getIMStatus("cmdLine", "inputLine", r1_157, r2_157, r3_157, r4_157)
  if r1_157 == 0 and r2_157 ~= 5 then
    r2_157 = 0
  end
  if r2_157 == 1 or r2_157 == 2 or r2_157 == 3 then
    r0_157:setSubLayerVisible("cmdLine", "CmdLine01", 10, 0)
    r0_157:setSubLayerVisible("cmdLine", "CmdLine01", 11, 1)
  else
    r0_157:setSubLayerVisible("cmdLine", "CmdLine01", 10, 1)
    r0_157:setSubLayerVisible("cmdLine", "CmdLine01", 11, 0)
  end
  local r5_157 = 5
  if r2_157 == 1 then
    r5_157 = 9
  elseif r2_157 == 2 then
    r5_157 = 8
  elseif r2_157 == 3 then
    r5_157 = 7
  elseif r2_157 == 4 then
    r5_157 = 6
  end
  local r15_157 = nil	-- notice: implicit variable refs by block#[20]
  for r9_157 = 5, 9, 1 do
    local r12_157 = "cmdLine"
    local r13_157 = "CmdLine01"
    local r14_157 = r9_157
    if r9_157 == r5_157 then
      r15_157 = 1
      if not r15_157 then
        ::label_85::
        r15_157 = 0
      end
    else
      goto label_85	-- block#19 is visited secondly
    end
    r0_157:setSubLayerVisible(r12_157, r13_157, r14_157, r15_157)
  end
  local r8_157 = "cmdLine"
  local r9_157 = "CmdLine01"
  local r10_157 = 1
  local r11_157 = nil	-- notice: implicit variable refs by block#[25, 28, 31, 34]
  if r3_157 == 1 then
    r11_157 = 0
    if not r11_157 then
      ::label_97::
      r11_157 = 1
    end
  else
    goto label_97	-- block#24 is visited secondly
  end
  r0_157:setSubLayerVisible(r8_157, r9_157, r10_157, r11_157)
  r8_157 = "cmdLine"
  r9_157 = "CmdLine01"
  r10_157 = 2
  if r3_157 == 1 then
    r11_157 = 1
    if not r11_157 then
      ::label_108::
      r11_157 = 0
    end
  else
    goto label_108	-- block#27 is visited secondly
  end
  r0_157:setSubLayerVisible(r8_157, r9_157, r10_157, r11_157)
  r8_157 = "cmdLine"
  r9_157 = "CmdLine01"
  r10_157 = 3
  if r4_157 == 1 then
    r11_157 = 0
    if not r11_157 then
      ::label_119::
      r11_157 = 1
    end
  else
    goto label_119	-- block#30 is visited secondly
  end
  r0_157:setSubLayerVisible(r8_157, r9_157, r10_157, r11_157)
  r8_157 = "cmdLine"
  r9_157 = "CmdLine01"
  r10_157 = 4
  if r4_157 == 1 then
    r11_157 = 1
    if not r11_157 then
      ::label_130::
      r11_157 = 0
    end
  else
    goto label_130	-- block#33 is visited secondly
  end
  r0_157:setSubLayerVisible(r8_157, r9_157, r10_157, r11_157)
  for r9_157 = 1, 12, 1 do
    local r12_157 = "cmdLine"
    local r13_157 = "CmdLine01"
    local r14_157 = r9_157
    r15_157 = LUA_PARAM_COLOR
    local r16_157 = 1
    local r17_157 = 1
    local r18_157 = 1
    local r19_157 = nil	-- notice: implicit variable refs by block#[38]
    if r1_157 == 1 then
      r19_157 = 1
      if not r19_157 then
        ::label_149::
        r19_157 = 0.5
      end
    else
      goto label_149	-- block#37 is visited secondly
    end
    r0_157:setSubLayerParam(r12_157, r13_157, r14_157, r15_157, r16_157, r17_157, r18_157, r19_157)
  end
end
function openConfirm(r0_158)
  -- line: [5342, 5576] id: 158
  if cfunc.LegacyGame__lua_GetFlag(127) == true and r0_158 == LUA_CONFIRM_TITLE then
    r0_158 = LUA_CONFIRM_ALBUM
  end
  if g_confirmDialog == 0 then
    g_MenuDialog = Menu.new("dialog")
    g_confirmDialog = r0_158
    local r2_158 = 0
    local r3_158 = 0
    local r4_158 = cclass.lua_AutoCursor:new()
    r2_158, r3_158 = r4_158:GetCursorPos(r2_158, r3_158)
    r4_158:delete()
    g_MenuDialog.InitCursorX = r2_158
    g_MenuDialog.InitCursorY = r3_158
    function g_MenuDialog.MenuButtonJobPos(r0_159, r1_159, r2_159, r3_159, r4_159)
      -- line: [5366, 5382] id: 159
      if r1_159 ~= 0 and r2_159 == "LU" then
        if r1_159 == 1 then
          executeProcess(true)
        end
        if r1_159 == 2 then
          executeProcess(false)
        end
      end
      if r2_159 == "RU" and r0_159:GetMenuMouseEnable() then
        r0_159:SystemSePlay("SYS02.ogg")
        executeProcess(false)
      end
    end
    function g_MenuDialog.MenuEffectTransJob(r0_160)
      -- line: [5386, 5389] id: 160
      return cclass.lua_Layers:create():isEffect("dialog", "DialogDisp")
    end
    function g_MenuDialog.MenuEffectEndJob(r0_161)
      -- line: [5391, 5426] id: 161
      local r1_161 = cclass.lua_Layers:create()
      if r0_161.MenuInf.enabled == true then
        local r2_161 = 0
        local r3_161 = 0
        local r4_161 = cclass.lua_AutoCursor:new()
        r2_161, r3_161 = r4_161:GetCursorPos(r2_161, r3_161)
        r4_161:delete()
        r0_161.MenuButton:changeButton(r0_161.MenuInf.SetName, r1_161:getCursorPos(r0_161.MenuInf.SetName, r2_161, r3_161, 0) - 1, r2_161, r3_161)
      else
        if g_skipConfirm == true then
          executeProcess(true)
          r1_161:remove(r0_161.MenuInf.SetName)
          return 
        end
        r1_161:remove(r0_161.MenuInf.SetName)
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
        r0_161.MenuInf.ButtonLayer = ""
        r0_161.MenuInf.ButtonPna = ""
        g_confirmDialog = 0
        cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_MOUSEMOVE, 0)
      end
    end
    function g_MenuDialog.startMenu(r0_162)
      -- line: [5432, 5445] id: 162
      local r1_162 = cclass.lua_Layers:create()
      local r2_162 = getEffectRate()
      local r3_162 = 0
      r1_162:setParam("dialog", "Dialog01", LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_162:setEffect("dialog", "Dialog01", "DialogDisp", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, 250 * r2_162, 0, r3_162)
      r1_162:startEffect("dialog", "Dialog01", "DialogDisp", 0)
      r0_162.MenuInf.enabled = true
      r0_162.MenuInf.effect = true
    end
    function g_MenuDialog.closeConfirm(r0_163, r1_163)
      -- line: [5448, 5474] id: 163
      if g_skipConfirm == true then
        g_confirmDialog = 0
        return 
      end
      local r2_163 = cclass.lua_Layers:create()
      local r3_163 = getEffectRate()
      local r4_163 = 0
      r2_163:setParam("dialog", "Dialog01", LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_163:setEffect("dialog", "Dialog01", "DialogDisp", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, 250 * r3_163, 0, r4_163)
      r2_163:startEffect("dialog", "Dialog01", "DialogDisp", 0)
      r0_163.MenuInf.enabled = false
      r0_163.MenuInf.effect = true
      if r1_163 == true then
        SetAutoOncursorPos(r0_163.InitCursorX, r0_163.InitCursorY, 100)
      end
    end
    local r5_158 = g_MenuDialog:MenuInit("Dialog01", "Sys_Dialog.pna")
    if res == false then
      return false
    end
    if g_skipConfirm == true then
      g_MenuDialog.MenuInf.effect = true
      g_MenuDialog.MenuInf.enabled = false
      return true
    end
    local r6_158 = cclass.lua_Layers:create()
    r6_158:initSubLayer("dialog", "Dialog01", 20, 1)
    if r0_158 == LUA_CONFIRM_TITLE then
      r6_158:initSubLayer("dialog", "Dialog01", 4, 1)
    elseif r0_158 == LUA_CONFIRM_ALBUM then
      r6_158:initSubLayer("dialog", "Dialog01", 5, 1)
    elseif r0_158 == LUA_CONFIRM_OVERWRITE then
      r6_158:initSubLayer("dialog", "Dialog01", 6, 1)
    elseif r0_158 == LUA_CONFIRM_LOAD then
      r6_158:initSubLayer("dialog", "Dialog01", 7, 1)
    elseif r0_158 == LUA_CONFIRM_QUICKLOAD then
      r6_158:initSubLayer("dialog", "Dialog01", 8, 1)
    elseif r0_158 == LUA_CONFIRM_QUIT then
      r6_158:initSubLayer("dialog", "Dialog01", 9, 1)
    elseif r0_158 == LUA_CONFIRM_DEFAULT then
      r6_158:initSubLayer("dialog", "Dialog01", 10, 1)
    elseif r0_158 == LUA_CONFIRM_MEMLOAD then
      r6_158:initSubLayer("dialog", "Dialog01", 3, 1)
    elseif r0_158 == LUA_CONFIRM_SELECTLOAD then
      r6_158:initSubLayer("dialog", "Dialog01", 2, 1)
    end
    g_MenuDialog:MenuButtonSet(g_MenuDialog.MenuButtonData, "YES", 0, "Dialog01", 17, 17, 13, -1, -1, 1, 0, 0)
    g_MenuDialog:MenuButtonSet(g_MenuDialog.MenuButtonData, "NO", 0, "Dialog01", 18, 18, 14, -1, -1, 2, 0, 0)
    g_MenuDialog.MenuButtonData.NO.se_click = "SYS02.ogg"
    g_MenuDialog:MenuButtonInit()
    SetAutoOncursor("dialog", "Dialog01", 17, 250)
    local r7_158 = {
      SYSVOICE_CONFIRMTITLE,
      SYSVOICE_CONFIRMGALLERY,
      SYSVOICE_CONFIRMOVERWRITE,
      SYSVOICE_CONFIRMLOAD,
      SYSVOICE_CONFIRMQUICK,
      SYSVOICE_CONFIRMQUIT,
      SYSVOICE_CONFIRMDEFAULT
    }
    if r7_158[g_confirmDialog] ~= nil then
      playSystemVoice(r7_158[g_confirmDialog])
    end
    g_MenuDialog:startMenu()
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  end
  return true
end
function onMouseMoveDialog(r0_164, r1_164, r2_164, r3_164, r4_164, r5_164)
  -- line: [5580, 5584] id: 164
  if g_MenuDialog ~= nil and r0_164 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuMouseMove(r0_164, r1_164, r2_164, r3_164, r4_164, r5_164)
  end
end
function onLButtonDownDialog(r0_165, r1_165, r2_165, r3_165, r4_165, r5_165)
  -- line: [5586, 5590] id: 165
  if g_MenuDialog ~= nil and r0_165 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuLButtonDown(r0_165, r1_165, r2_165, r3_165, r4_165, r5_165)
  end
end
function onLButtonUpDialog(r0_166, r1_166, r2_166, r3_166, r4_166, r5_166)
  -- line: [5592, 5596] id: 166
  if g_MenuDialog ~= nil and r0_166 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuLButtonUp(r0_166, r1_166, r2_166, r3_166, r4_166, r5_166)
  end
end
function onRButtonDownDialog(r0_167, r1_167, r2_167, r3_167, r4_167, r5_167)
  -- line: [5598, 5602] id: 167
  if g_MenuDialog ~= nil and r0_167 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuRButtonDown(r0_167, r1_167, r2_167, r3_167, r4_167, r5_167)
  end
end
function onRButtonUpDialog(r0_168, r1_168, r2_168, r3_168, r4_168, r5_168)
  -- line: [5604, 5608] id: 168
  if g_MenuDialog ~= nil and r0_168 == g_MenuDialog.MenuInf.SetName then
    g_MenuDialog:MenuRButtonUp(r0_168, r1_168, r2_168, r3_168, r4_168, r5_168)
  end
end
function onKeyDownDialog(r0_169, r1_169, r2_169, r3_169)
  -- line: [5611, 5649] id: 169
  if r3_169 == true then
    return 
  end
  if g_MenuDialog ~= nil and r0_169 == g_MenuDialog.MenuInf.SetName and g_MenuDialog.MenuInf.effect == false then
    local r4_169 = g_MenuDialog.MenuButton.selCursor
    if r2_169 == LUA_KEYCODE_LEFT and r4_169 ~= "YES" then
      SetAutoOncursor("dialog", "Dialog01", 17, 100)
    elseif r2_169 == LUA_KEYCODE_RIGHT and r4_169 ~= "NO" then
      SetAutoOncursor("dialog", "Dialog01", 18, 100)
    elseif r2_169 == LUA_KEYCODE_ENTER then
      local r5_169 = g_MenuDialog.MenuButton.selListKey
      if r4_169 == "YES" and r5_169[r4_169].focusflag == true then
        executeProcess(true)
      elseif r4_169 == "NO" and r5_169[r4_169].focusflag == true then
        executeProcess(false)
      end
    elseif r2_169 == LUA_KEYCODE_SPACE then
      executeProcess(false)
    end
  end
end
function closeConfirm(r0_170)
  -- line: [5652, 5656] id: 170
  if g_MenuDialog ~= nil then
    g_MenuDialog:closeConfirm(r0_170)
  end
end
function executeProcess(r0_171)
  -- line: [5659, 5775] id: 171
  if r0_171 == true then
    if g_confirmDialog == LUA_CONFIRM_QUIT then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUIT, 0)
    elseif g_confirmDialog == LUA_CONFIRM_QUICKLOAD then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_QUICKLOADGAME, -1)
      closeConfirm(false)
      g_MenuMsgWin:onResetTips()
    elseif g_confirmDialog == LUA_CONFIRM_LOAD then
      if g_dataInfo.page == r0_0 then
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
      local r2_171 = cclass.lua_Sounds:new()
      r2_171:BgmStop("systembgm", 500)
      r2_171:delete()
      g_menuExecute = false
      closeConfig()
    elseif g_confirmDialog == LUA_CONFIRM_OVERWRITE then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SAVEGAME, (g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1)
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
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_BACKGAME, cclass.lua_Layers:create():getIndexLogLayerText("messageLog", "LogText01", g_Menu.BackLog.ptr.selLine))
      closeConfirm(false)
      g_MenuMsgWin:onResetTips()
      cclass.lua_Layers:create():removeSnap("system")
      g_menuExecute = false
      closeMessageLog()
    elseif g_confirmDialog == LUA_CONFIRM_SELECTLOAD then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SELECTLOADGAME, -1)
      closeConfirm(false)
      g_MenuMsgWin:onResetTips()
    end
  else
    if g_confirmDialog == LUA_CONFIRM_CHANGESCN and g_Menu.Config.ptr ~= nil and g_Menu.Config.ptr.MenuInf.enabled == true then
      g_NmsPlay.Act = g_Menu.Config.ptr.P8ChangeSceneNo
      closeConfig()
    end
    closeConfirm(true)
  end
end
function changeDialogFocus(r0_172)
  -- line: [5779, 5781] id: 172
end
g_logWindowDisable = true
g_logSnapUpdate = false
g_logTest = 0
function openMessageLog()
  -- line: [5791, 6662] id: 173
  g_Menu.BackLog.ptr = Menu.new("messageLog")
  function g_Menu.BackLog.ptr.MenuButtonJobPos(r0_174, r1_174, r2_174, r3_174, r4_174)
    -- line: [5799, 5874] id: 174
    if r2_174 == "LD" and r0_174.textCursor ~= -1 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_LOG_VOICEPLAY, r0_174.textCursor)
    end
    if r2_174 == "LD" and r1_174 ~= 0 and r1_174 == 10 then
      r0_174.SliderMoveNo = 1
      r0_174.SliderParam = r0_174.ButtonSlide.SlideBar:bt_GetParamY()
    end
    if r2_174 == "LU" and r0_174.SliderMoveNo == 1 then
      local r5_174 = r0_174.ButtonSlide.SlideBar:bt_GetParamY()
      if r0_174.SliderParam ~= r5_174 then
        r0_174:MenuMouseWheelEx("messageLog", r0_174.SliderParam - r5_174, false)
        r0_174.SliderParam = r5_174
        r0_174:SetActive()
      end
      r0_174.ButtonSlide.SlideBar:bt_SetParamY(r5_174)
      r0_174.SliderParam = 0
      r0_174.SliderMoveNo = -1
    end
    if r2_174 == "LU" and r1_174 ~= 0 then
      if r1_174 == 1 then
        closeMessageLog()
      end
      if r1_174 == 2 then
        r0_174:MenuMouseWheelEx("messageLog", 1, false)
      end
      if r1_174 == 3 then
        r0_174:MenuMouseWheelEx("messageLog", -1, false)
      end
      if r1_174 == 11 then
        local r5_174 = r0_174.ButtonSlide.BarBack.EVENT_RECT.h / (r0_174.ButtonSlide.SlideBar.MOVABLE.PAR_MAX_Y + 1 - r0_174.ButtonSlide.SlideBar.MOVABLE.PSIZE_Y)
        local r6_174 = r4_174 - r0_174.ButtonSlide.BarBack.DRAW_POS.y
        if r6_174 < 0 then
          r6_174 = 0
        end
        local r7_174 = math.floor(r6_174 / r5_174)
        r0_174:MenuMouseWheelEx("messageLog", r0_174.ButtonSlide.SlideBar:bt_GetParamY() - r7_174, false)
        r0_174.ButtonSlide.SlideBar:bt_SetParamY(r7_174)
        r0_174:SetActive()
        r0_174.SliderParam = 0
      end
      if 100 < r1_174 and r1_174 <= 150 then
        r0_174.selLine = r0_174.iconID[r1_174 - 100]
        openConfirm(LUA_CONFIRM_MEMLOAD)
      end
    end
    if r2_174 == "RU" and r0_174:GetMenuMouseEnable() then
      r0_174:SystemSePlay("SYS02.ogg")
      closeMessageLog()
    end
  end
  function g_Menu.BackLog.ptr.MenuMouseWheel(r0_175, r1_175, r2_175)
    -- line: [5876, 5878] id: 175
    r0_175:MenuMouseWheelEx(r1_175, r2_175, true)
  end
  function g_Menu.BackLog.ptr.MenuMouseWheelEx(r0_176, r1_176, r2_176, r3_176)
    -- line: [5880, 5907] id: 176
    if r0_176.MenuInf.effect == true then
      return 
    end
    if cclass.lua_Layers:create():onWheelMouseLogLayer("messageLog", "LogText01", r2_176, r3_176) == true and r3_176 == true then
      closeMessageLog()
      return 
    end
    r0_176.FocusAfterCallFlag = 2
  end
  g_Menu.BackLog.ptr.FocusAfterCallFlag = -1
  function g_Menu.BackLog.ptr.FocusAfterCall(r0_177)
    -- line: [5911, 5927] id: 177
    if r0_177.FocusAfterCallFlag >= 1 then
      r0_177.FocusAfterCallFlag = r0_177.FocusAfterCallFlag - 1
    end
    if r0_177.FocusAfterCallFlag == 0 then
      r0_177.FocusAfterCallFlag = -1
      local r1_177 = 0
      local r2_177 = 0
      local r3_177 = cclass.lua_AutoCursor:new()
      r1_177, r2_177 = r3_177:GetCursorPos(r1_177, r2_177)
      r3_177:delete()
      r0_177:defaultMenuMouseMove(setname, -1, -1, r1_177, r2_177, false)
      r0_177:TextFocus(r1_177, r2_177)
    end
  end
  g_Menu.BackLog.ptr.defaultMenuMouseMove = g_Menu.BackLog.ptr.MenuMouseMove
  function g_Menu.BackLog.ptr.MenuMouseMove(r0_178, r1_178, r2_178, r3_178, r4_178, r5_178, r6_178)
    -- line: [5931, 5960] id: 178
    r0_178:defaultMenuMouseMove(r1_178, r2_178, r3_178, r4_178, r5_178, r6_178)
    if r0_178.SliderMoveNo == 1 then
      local r7_178 = r0_178.ButtonSlide.SlideBar:bt_GetParamY()
      if r0_178.SliderParam ~= r7_178 then
        r0_178:MenuMouseWheelEx("messageLog", r0_178.SliderParam - r7_178, false)
        r0_178.SliderParam = r7_178
        r0_178:SetActive()
      end
    end
    if r0_178.MenuButton.selCursor == -1 then
      r0_178.Item.SlideBase:SetAct("def")
    end
    if r0_178.MenuButton.selCursor == "Up" or r0_178.MenuButton.selCursor == "Down" or r0_178.MenuButton.selCursor == "SlideBar" or r0_178.MenuButton.selCursor == "BarBack" then
      r0_178.Item.SlideBase:SetAct("on")
    end
    r0_178:TextFocus(r4_178, r5_178)
  end
  function g_Menu.BackLog.ptr.MenuInit(r0_179)
    -- line: [5963, 5983] id: 179
    local r1_179 = true
    r0_179.MenuInf.enabled = false
    r0_179.MenuInf.effect = false
    r0_179.MenuInf.ButtonLayer = ""
    r0_179.MenuInf.ButtonPna = ""
    if cclass.lua_Layers:create():add(r0_179.MenuInf.SetName) == false then
      return false
    end
    r0_179.MenuButton = Button.new(r0_179.MenuInf.SetName)
    r0_179.MenuButton:InitList()
    r0_179.MenuButtonData = {}
    return r1_179
  end
  function g_Menu.BackLog.ptr.MenuEffect(r0_180)
    -- line: [5986, 6020] id: 180
    local r1_180 = false
    r1_180 = r0_180:MenuEffectTransJob()
    if g_logWindowDisable then
      local r2_180 = cclass.lua_Layers:create()
      if r0_180.MenuInf.effect == true and r1_180 == true and g_logSnapUpdate == false then
        g_logTest = g_logTest + 1
        if g_logTest == 2 then
          r2_180:setSnap("system", true)
          g_logSnapUpdate = true
        end
      end
    end
    if r0_180.MenuInf.effect == true and r1_180 == false then
      r0_180:MenuEffectEndJob()
      r0_180.MenuInf.effect = false
    end
    return r1_180
    -- warn: not visited block [5, 6]
    -- block#5:
    -- g_logTest = g_logTest + 1
    -- if g_logTest == 2
    -- block#6:
    -- r2_180:setSnap2("system", true)
    -- g_logSnapUpdate = true
    -- goto label_52
  end
  function g_Menu.BackLog.ptr.MenuEffectEndJob(r0_181)
    -- line: [6023, 6062] id: 181
    local r1_181 = cclass.lua_Layers:create()
    if r0_181.MenuInf.enabled == true then
      if g_logWindowDisable then
      end
      r0_181:InitSlideBar()
      local r2_181 = 0
      local r3_181 = 0
      local r4_181 = cclass.lua_AutoCursor:new()
      r2_181, r3_181 = r4_181:GetCursorPos(r2_181, r3_181)
      r4_181:delete()
      r0_181.MenuButton:changeButton(r0_181.MenuInf.SetName, r1_181:getCursorPos(r0_181.MenuInf.SetName, r2_181, r3_181, 0) - 1, r2_181, r3_181)
      r0_181:TextFocus(r2_181, r3_181)
    else
      r1_181:removeSnap("system")
      r1_181:remove(r0_181.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_181.MenuInf.ButtonLayer = ""
      r0_181.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.BackLog.ptr.MenuKeyDown(r0_182, r1_182, r2_182, r3_182, r4_182)
    -- line: [6065, 6120] id: 182
    if r0_182.MenuInf.effect == false and r3_182 == LUA_KEYCODE_DOWN and r0_182.MenuButtonData.Down.active == 0 and r0_182.FocusAfterCallFlag == -1 then
      r0_182:MenuMouseWheelEx(r1_182, -1, false)
    end
    if r4_182 == true then
      return 
    end
    if r0_182.MenuInf.effect == false then
      local r5_182 = cclass.lua_Layers:create()
      local r6_182 = r5_182:getLogTextDrawCount("messageLog", "LogText01", 0)
      local r7_182 = 0
      local r8_182 = 0
      r7_182, r8_182 = r5_182:getLogTextLine("messageLog", "LogText01", r7_182, r8_182)
      if r3_182 == LUA_KEYCODE_HOME and r0_182.MenuButtonData.Up.active == 0 then
        r0_182:MenuMouseWheelEx(r1_182, r8_182, false)
      elseif r3_182 == LUA_KEYCODE_END and r0_182.MenuButtonData.Down.active == 0 then
        r0_182:MenuMouseWheelEx(r1_182, -(r7_182 - r6_182 - r8_182), false)
      elseif r3_182 == LUA_KEYCODE_PAGEUP then
        r0_182:MenuMouseWheelEx(r1_182, r5_182:pageUpLogText("messageLog", "LogText01"), false)
      elseif r3_182 == LUA_KEYCODE_PAGEDOWN then
        if r7_182 < r6_182 + r6_182 + r8_182 then
          r6_182 = r7_182 - r6_182 - r8_182
        end
        r0_182:MenuMouseWheelEx(r1_182, -r6_182, false)
      elseif r3_182 ~= LUA_KEYCODE_ENTER and r3_182 == LUA_KEYCODE_SPACE then
        closeMessageLog()
      end
    end
    -- warn: not visited block [4]
    -- block#4:
    -- r0_182:MenuMouseWheelEx(r1_182, 1, false)
    -- goto label_37
  end
  function g_Menu.BackLog.ptr.initBackLog(r0_183)
    -- line: [6128, 6188] id: 183
    r0_183:MenuLoadLayer("Log01", "Sys_BackLog.pna")
    local r1_183 = cclass.lua_Layers:create()
    r0_183:MenuLoadLayer("LogPrevBase", "Sys_Preview.pna")
    r1_183:initSubLayer("messageLog", "LogPrevBase", 0, 0)
    r1_183:insertLogLayer("messageLog", "LogText01", g_LogTxtSize.lWidth, g_LogTxtSize.lHeight, g_LogTxtSize.lMarginLeft, g_LogTxtSize.lMarginTop, g_LogTxtSize.lMarginRight, g_LogTxtSize.lMarginBottom, g_LogTxtSize.fLineMargin, 1)
    local r2_183 = 0
    r2_183, r3_183, r4_183, r5_183 = r1_183:getParam("system", "Msg01", LUA_PARAM_POS, r2_183, 0, 0, 0)
    r1_183:setParam("messageLog", "LogText01", LUA_PARAM_POS, r2_183 + 230, 50, 0, 0)
    r0_183.MenuButton:InitList()
    r0_183.MenuButtonData = {}
    r0_183.ButtonSlide = {}
    r1_183:initSubLayer("messageLog", "Log01", 35, 1)
    r1_183:initSubLayer("messageLog", "Log01", 9, 0)
    r1_183:initSubLayer("messageLog", "Log01", 10, 0)
    r1_183:initSubLayer("messageLog", "Log01", 11, 0)
    r0_183:MenuButtonSet(r0_183.MenuButtonData, "Close", 0, "Log01", 15, 15, 14, -1, -1, 1, 0, 0)
    r0_183:MenuButtonSet(r0_183.MenuButtonData, "Up", 0, "Log01", 19, 19, 18, -1, -1, 2, 0, 0)
    r0_183:MenuButtonSet(r0_183.MenuButtonData, "Down", 0, "Log01", 23, 23, 22, -1, -1, 3, 0, 0)
    for r9_183 = 1, 50, 1 do
      r0_183:MenuButtonSet(r0_183.MenuButtonData, r0_183:GetJumpButton(r9_183), 1, "Log01", 6, -1, -1, -1, -1, r9_183 + 100, 0, 0)
    end
    r0_183.MenuButton:SetList("MenuButtonData", r0_183.MenuButtonData)
    r0_183.MenuButton:InitButton()
    for r9_183 = 1, 50, 1 do
      r0_183.MenuButtonData[r0_183:GetJumpButton(r9_183)]:bt_SetActive(3)
    end
    r0_183.Item = {}
    r0_183.Item.WindowMode = MenuItem.new("messageLog", "Log01", 6, 5)
    r0_183.Item.WindowMode:SetAct(-1)
    r0_183.Item.SlideBase = MenuItem.new("messageLog", "Log01", 33, 32)
    r0_183:SetActive()
  end
  function g_Menu.BackLog.ptr.SetActive(r0_184)
    -- line: [6191, 6240] id: 184
    if r0_184.SlideInit == true then
      local r1_184 = cclass.lua_Layers:create()
      local r2_184 = r1_184:getLogTextDrawCount("messageLog", "LogText01", 0)
      local r3_184 = 0
      local r4_184 = 0
      r3_184, r4_184 = r1_184:getLogTextLine("messageLog", "LogText01", r3_184, r4_184)
      r0_184.ButtonSlide.SlideBar:bt_SetMovableInit(true, 0, r3_184, 0, r2_184, 0, 0)
      if r3_184 < 2 then
        r0_184.MenuButtonData.Up:bt_SetActive(2)
        r0_184.MenuButtonData.Down:bt_SetActive(2)
      else
        if r4_184 > 0 then
          if r0_184.MenuButtonData.Up.active ~= 0 then
            r0_184.MenuButtonData.Up:bt_SetActive(0)
          end
        else
          r0_184.MenuButtonData.Up:bt_SetActive(2)
        end
        if r4_184 + r2_184 < r3_184 then
          if r0_184.MenuButtonData.Down.active ~= 0 then
            r0_184.MenuButtonData.Down:bt_SetActive(0)
          end
        else
          r0_184.MenuButtonData.Down:bt_SetActive(2)
        end
      end
      if r0_184.SliderMoveNo == -1 then
        r0_184.ButtonSlide.SlideBar:bt_SetParamY(r4_184)
      end
    else
      r0_184.MenuButtonData.Up:bt_SetActive(2)
      r0_184.MenuButtonData.Down:bt_SetActive(2)
      local r1_184 = cclass.lua_Layers:create()
    end
  end
  function g_Menu.BackLog.ptr.InitSlideBar(r0_185)
    -- line: [6244, 6295] id: 185
    if r0_185.SlideInit == true then
      return 
    end
    local r1_185 = cclass.lua_Layers:create()
    local r2_185 = r1_185:getLogTextDrawCount("messageLog", "LogText01", 0)
    local r3_185 = 0
    local r4_185 = 0
    r3_185, r4_185 = r1_185:getLogTextLine("messageLog", "LogText01", r3_185, r4_185)
    r0_185.Item.SlideBase:SetAct(-1)
    if r3_185 < 2 then
      return 
    end
    if r3_185 <= r2_185 then
      return 
    end
    r0_185.Item.SlideBase:SetAct("def")
    r0_185:MenuMoveButtonSet(r0_185.ButtonSlide, "SlideBar", 1, "Log01", 27, 27, 26, -1, -1, 10, 0, 0)
    r0_185:MenuButtonSet(r0_185.ButtonSlide, "BarBack", 1, "Log01", 28, -1, -1, -1, -1, 11, 0, -1)
    r0_185.ButtonSlide.SlideBar.se_click = -1
    r0_185.ButtonSlide.BarBack.se_click = -1
    r0_185.MenuButton:SetList("ButtonSlide", r0_185.ButtonSlide)
    r0_185.MenuButton:InitButton()
    r0_185.MenuButton:SetList("MenuButtonData", r0_185.MenuButtonData)
    r0_185:SetSliderParam(r0_185.ButtonSlide.SlideBar, 28, 29, r3_185, r2_185, r4_185)
    r0_185.SlideInit = true
    r0_185:SetActive()
  end
  function g_Menu.BackLog.ptr.SetSliderParam(r0_186, r1_186, r2_186, r3_186, r4_186, r5_186, r6_186)
    -- line: [6298, 6315] id: 186
    r1_186:bt_SetMoveRangeRectLayer(r2_186)
    r1_186:bt_SetEventRangeRectLayer(r3_186)
    r1_186:bt_SetMovableInit(true, 0, r4_186, 0, r5_186, 0, 0)
    r1_186.initpos.x = r1_186.MOVERANGE.x
    r1_186.initpos.y = r1_186.MOVERANGE.y
    r1_186.initrect.x = r1_186.MOVERANGE.x
    r1_186.initrect.y = r1_186.MOVERANGE.y
    r1_186.initrect.w = r1_186.EVENT_RECT.w
    r1_186.initrect.h = r1_186.EVENT_RECT.h
    r1_186:bt_SetParamY(r6_186)
  end
  function g_Menu.BackLog.ptr.GetJumpIcon(r0_187, r1_187)
    -- line: [6318, 6322] id: 187
    return string.format("dataIcon%03d", r1_187)
  end
  function g_Menu.BackLog.ptr.GetJumpButton(r0_188, r1_188)
    -- line: [6324, 6328] id: 188
    return string.format("Jump%03d", r1_188)
  end
  function g_Menu.BackLog.ptr.TextFocus(r0_189, r1_189, r2_189)
    -- line: [6332, 6476] id: 189
    if r0_189.SliderMoveNo ~= -1 then
      return 
    end
    if r0_189.MenuButton.selDownCursor ~= -1 then
      return 
    end
    local r3_189 = cclass.lua_Layers:create()
    local r4_189 = -1
    local r5_189 = -1
    for r9_189 = 1, r0_189.iconCount, 1 do
      local r10_189 = r0_189:GetJumpIcon(r9_189)
      local r11_189 = r0_189:GetJumpButton(r9_189)
      if r11_189 == r0_189.MenuButton.selCursor then
        local r12_189 = 0
        local r13_189 = 0
        local r14_189 = 0
        local r15_189 = 0
        r12_189, r13_189 = r0_189.MenuButtonData[r11_189]:bt_GetPos()
        r0_189.Item.WindowMode:SetPos("def", r12_189, r13_189)
        r3_189:setParam("messageLog", r10_189, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_189 = r9_189 - 1
        r5_189 = r0_189.MenuButtonData[r11_189]
      else
        r3_189:setParam("messageLog", r10_189, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
    if r4_189 == -1 then
      r3_189:removeLayer("messageLog", "LogPrevBaseR")
      r3_189:removeLayer("messageLog", "LogPreview")
      r0_189.Item.WindowMode:SetAct(-1)
      r0_189.selLine = -1
    else
      local r6_189 = r0_189.iconID[r4_189 + 1]
      if r0_189.selLine ~= r6_189 then
        local r7_189 = r3_189:getIndexLogLayerText("messageLog", "LogText01", r6_189)
        r3_189:insertPNARefLayer("messageLog", "LogPrevBaseR", "LogPrevBase", 0, 1)
        r3_189:insertLogPreviewLayer("messageLog", "LogPreview", r7_189, 172, 98, 1)
        local r8_189 = 60
        local r9_189 = r5_189.DRAW_POS.y + r5_189.EVENT_RECT.h - 50
        local r11_189 = 0
        r10_189, r11_189, r12_189, r13_189 = r3_189:getParam("messageLog", "LogPrevBaseR", LUA_PARAM_SIZE, 0, r11_189, 0, 0)
        if APP_INTERNAL_HEIGHT < r9_189 + r11_189 then
          r9_189 = r5_189.DRAW_POS.y - r11_189 + 50
        end
        r3_189:setParam("messageLog", "LogPrevBaseR", LUA_PARAM_POS, r8_189, r9_189, 0, 0)
        r3_189:setParam("messageLog", "LogPreview", LUA_PARAM_POS, r8_189 + 1, r9_189 + 1, 0, 0)
      end
      r0_189.Item.WindowMode:SetAct("on")
      r0_189.selLine = r6_189
    end
    if r0_189.selLine == -1 then
      local r6_189 = r3_189:hitTestLogLayerText("messageLog", "LogText01", r1_189, r2_189)
      if r6_189 >= 0 then
        r3_189:setSubLayerVisible("messageLog", "Log01", 9, 1)
        r3_189:setSubLayerVisible("messageLog", "Log01", 10, 1)
        r3_189:setSubLayerVisible("messageLog", "Log01", 11, 1)
        local r8_189 = 0
        local r10_189 = 0
        r7_189, r8_189, r9_189, r10_189 = r3_189:getLogTextRect("messageLog", "LogText01", 0, r8_189, 0, r10_189)
        r10_189 = r10_189 - 12
        r8_189 = r8_189 + 6
        local r11_189 = 0
        local r12_189 = 0
        local r13_189 = 0
        local r14_189 = 0
        r11_189, r12_189, r13_189, r14_189 = r3_189:getSubLayerParam("messageLog", "Log01", 10, LUA_PARAM_SIZE, r11_189, r12_189, r13_189, r14_189)
        local r15_189 = 0
        local r18_189 = 0
        r15_189, r16_189, r17_189, r18_189 = r3_189:getSubLayerParam("messageLog", "Log01", 10, LUA_PARAM_POS, r15_189, 0, 0, r18_189)
        local r19_189 = math.floor(r10_189 / 35)
        r3_189:setSubLayerParam("messageLog", "Log01", 10, LUA_PARAM_POS, r15_189, r8_189, 0, 0)
        r3_189:setSubLayerParam("messageLog", "Log01", 10, LUA_PARAM_CENTERZ, 0, 0, 0, 0)
        r3_189:setSubLayerParam("messageLog", "Log01", 10, LUA_PARAM_SCALE, 1, r10_189 / r12_189, 1, 0)
        if r10_189 <= 0 then
          r3_189:setSubLayerVisible("messageLog", "Log01", 10, 0)
        end
        r11_189, r12_189, r13_189, r14_189 = r3_189:getSubLayerParam("messageLog", "Log01", 9, LUA_PARAM_SIZE, r11_189, r12_189, r13_189, r14_189)
        r3_189:setSubLayerParam("messageLog", "Log01", 9, LUA_PARAM_POS, r15_189, r8_189 - r12_189, r15_189, r18_189)
        r3_189:setSubLayerParam("messageLog", "Log01", 11, LUA_PARAM_POS, r15_189, r8_189 + r10_189, r15_189, r18_189)
        if nose == false then
          local r20_189 = cclass.lua_Sounds:new()
          r20_189:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
          r20_189:delete()
        end
      else
        r3_189:setSubLayerVisible("messageLog", "Log01", 9, 0)
        r3_189:setSubLayerVisible("messageLog", "Log01", 10, 0)
        r3_189:setSubLayerVisible("messageLog", "Log01", 11, 0)
      end
      r0_189.textCursor = r6_189
    else
      r0_189.textCursor = -1
    end
    r0_189:SetActive()
  end
  function g_Menu.BackLog.ptr.drawSceneJumpIcon(r0_190)
    -- line: [6479, 6564] id: 190
    r0_190:FocusAfterCall()
    local r1_190 = cclass.lua_Layers:create()
    local r2_190 = r1_190:getLogTextDrawCount("messageLog", "LogText01", 0)
    if r2_190 <= 0 then
      r0_190.iconCount = 0
      return 
    end
    local r4_190 = 0
    r3_190, r4_190 = r1_190:getLogTextLine("messageLog", "LogText01", 0, r4_190)
    local r5_190 = -1
    local r6_190 = 0
    r0_190.iconID = {}
    for r10_190 = r4_190, r4_190 + r2_190 - 1, 1 do
      local r11_190 = r1_190:getLogLineToIndex("messageLog", "LogText01", r10_190)
      r0_190.iconID[r6_190 + 1] = r11_190
      local r12_190 = 0
      r12_190 = r1_190:getIndexLogLayerText("messageLog", "LogText01", r11_190)
      if r5_190 ~= r12_190 then
        if r12_190 >= 0 then
          r6_190 = r6_190 + 1
        end
        r5_190 = r12_190
      end
    end
    if r0_190.iconCount ~= r6_190 then
      if r0_190.iconCount < r6_190 then
        for r10_190 = r0_190.iconCount + 1, r6_190, 1 do
          r1_190:insertPNARefLayer("messageLog", r0_190:GetJumpIcon(r10_190), "Log01", 6, 1)
          r0_190.MenuButtonData[r0_190:GetJumpButton(r10_190)]:bt_SetActive(0)
        end
      else
        for r10_190 = r6_190 + 1, r0_190.iconCount, 1 do
          r1_190:removeLayer("messageLog", r0_190:GetJumpIcon(r10_190))
          r0_190.MenuButtonData[r0_190:GetJumpButton(r10_190)]:bt_SetActive(3)
        end
      end
      r0_190.iconCount = r6_190
    end
    local r7_190 = 0
    local r9_190 = 0
    local r10_190 = 0
    r7_190, r8_190, r9_190, r10_190 = r1_190:getSubLayerParam("messageLog", "Log01", 6, LUA_PARAM_POS, r7_190, 0, r9_190, r10_190)
    local r12_190 = 0
    r11_190, r12_190, r13_190, r14_190 = r1_190:getSubLayerParam("messageLog", "Log01", 6, LUA_PARAM_SIZE, 0, r12_190, 0, 0)
    for r18_190 = 1, r0_190.iconCount, 1 do
      local r20_190 = 0
      local r22_190 = 0
      r19_190, r20_190, r21_190, r22_190 = r1_190:getLogTextRectIndex("messageLog", "LogText01", r0_190.iconID[r18_190], 0, r20_190, 0, r22_190)
      local r8_190 = math.floor(r20_190 + r22_190 / 2 - r12_190 / 2)
      r1_190:setParam("messageLog", r0_190:GetJumpIcon(r18_190), LUA_PARAM_POS, r7_190, r8_190, r9_190, r10_190)
      r0_190.MenuButtonData[r0_190:GetJumpButton(r18_190)]:bt_SetPos(r7_190, r8_190)
    end
    r0_190:InitSlideBar()
  end
  function g_Menu.BackLog.ptr.StartEffect(r0_191)
    -- line: [6566, 6595] id: 191
    local r1_191 = cclass.lua_Layers:create()
    if g_logWindowDisable then
      g_logSnapUpdate = false
      g_logTest = 0
    end
    r1_191:setSnap("system", true)
    r1_191:copySnap("messageLog", "system")
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
    r0_191:MenuEffectStart(300, 0)
    r0_191.MenuInf.enabled = true
    r0_191.MenuInf.effect = true
  end
  function g_Menu.BackLog.ptr.MenuEffectStart(r0_192, r1_192, r2_192)
    -- line: [6598, 6605] id: 192
    local r3_192 = cclass.lua_Layers:create()
    local r4_192 = cclass.lua_MeasureTime:new()
    local r5_192 = getEffectRate()
    r3_192:startTransition(r0_192.MenuInf.SetName, 0, 1, r1_192 * r5_192, r2_192 * r4_192:diff() * r5_192, LUA_TRANSITION_NORMAL)
    r4_192:delete()
  end
  function g_Menu.BackLog.ptr.EndEffect(r0_193)
    -- line: [6608, 6635] id: 193
    local r1_193 = cclass.lua_Layers:create()
    r1_193:stopLogVoice("messageLog", "LogText01")
    if g_logWindowDisable then
      g_logSnapUpdate = false
      g_logTest = 0
      r1_193:setSnap("messageLog", false)
    end
    r1_193:startTransition(r0_193.MenuInf.SetName, 0, 1, 300 * getEffectRate(), 0, LUA_TRANSITION_ERASE)
    r0_193.MenuInf.enabled = false
    r0_193.MenuInf.effect = true
  end
  local r0_173 = g_Menu.BackLog.ptr:MenuInit()
  if res == false then
    return false
  end
  g_Menu.BackLog.ptr.Item = {}
  g_Menu.BackLog.ptr.ButtonSlide = {}
  g_Menu.BackLog.ptr.iconCount = 0
  g_Menu.BackLog.ptr.iconID = {}
  g_Menu.BackLog.ptr.selLine = -1
  g_Menu.BackLog.ptr.textCursor = -1
  g_Menu.BackLog.ptr.SlideInit = false
  g_Menu.BackLog.ptr.SliderMoveNo = -1
  g_Menu.BackLog.ptr.SliderParam = 0
  g_Menu.BackLog.ptr:initBackLog()
  g_Menu.BackLog.ptr:StartEffect()
end
function closeMessageLog()
  -- line: [6667, 6674] id: 194
  if g_Menu.BackLog.ptr ~= nil and g_Menu.BackLog.ptr.MenuInf.enabled == true and g_Menu.BackLog.ptr.MenuInf.effect == false then
    g_Menu.BackLog.ptr:EndEffect()
  end
end
function drawSceneJumpIcon()
  -- line: [6678, 6682] id: 195
  if g_Menu.BackLog.ptr ~= nil then
    g_Menu.BackLog.ptr:drawSceneJumpIcon()
  end
end
function getMessageLogTextColor(r0_196)
  -- line: [6685, 6693] id: 196
  if r0_196 == 0 then
    return g_logNameColor.normal, g_logNameColor.normalEdge
  else
    return g_logTextColor.voice, g_logTextColor.voiceEdge
  end
end
function getMessageLogKey()
  -- line: [6696, 6699] id: 197
  return "messageLog", "LogText01"
end
function ConfigGetPageFileName(r0_198)
  -- line: [6714, 6721] id: 198
  if r0_198 == 5 then
    r0_198 = 4
  end
  return "sys_config_P" .. tostring(r0_198) .. ".pna"
end
function ConfigGetPageKeyName(r0_199)
  -- line: [6723, 6727] id: 199
  return string.format("ConfigPage%03d", r0_199)
end
function getConfigText()
  -- line: [6729, 6731] id: 200
  return "ConfigText2", "ConfigTextName"
end
function getSaveThumbKey(r0_201, r1_201)
  -- line: [6733, 6740] id: 201
  local r2_201 = cclass.lua_Layers:create()
  local r3_201 = nil	-- notice: implicit variable refs by block#[3]
  if r0_201 == true then
    r3_201 = "Save"
    if not r3_201 then
      ::label_9::
      r3_201 = "Load"
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  r3_201 = string.format("%sThumbnail%03d", r3_201, r1_201)
  return r3_201
end
function getSaveThumbTxt(r0_202, r1_202)
  -- line: [6742, 6748] id: 202
  local r2_202 = cclass.lua_Layers:create()
  local r3_202 = nil	-- notice: implicit variable refs by block#[3]
  if r0_202 == true then
    r3_202 = "Save"
    if not r3_202 then
      ::label_9::
      r3_202 = "Load"
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  r3_202 = string.format("%sText%03d", r3_202, r1_202)
  return r3_202
end
function getSaveThumbTimeTxt(r0_203, r1_203)
  -- line: [6751, 6757] id: 203
  local r2_203 = cclass.lua_Layers:create()
  local r3_203 = nil	-- notice: implicit variable refs by block#[3]
  if r0_203 == true then
    r3_203 = "Save"
    if not r3_203 then
      ::label_9::
      r3_203 = "Load"
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  r3_203 = string.format("%sTimeText%03d", r3_203, r1_203)
  return r3_203
end
g_UseSaveNoTxt = true
function getSaveThumbNoTxt(r0_204, r1_204)
  -- line: [6760, 6766] id: 204
  local r2_204 = cclass.lua_Layers:create()
  local r3_204 = nil	-- notice: implicit variable refs by block#[3]
  if r0_204 == true then
    r3_204 = "Save"
    if not r3_204 then
      ::label_9::
      r3_204 = "Load"
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  r3_204 = string.format("%sNoText%03d", r3_204, r1_204)
  return r3_204
end
function openConfig(r0_205, r1_205)
  -- line: [6769, 12049] id: 205
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
  g_Menu.Config.ptr.CompFlag = cfunc.LegacyGame__lua_GetFlag(1000)
  if g_Menu.Config.ptr.NMSAcitve == true and r0_205 == 0 then
    r0_205 = 8
  elseif r0_205 == 0 then
    if g_configPage < 1 or g_configPage == 4 or g_configPage == 5 or 8 < g_configPage then
      r0_205 = 1
    else
      r0_205 = g_configPage
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
  g_Menu.Config.ptr.SliderMoveNo = -1
  g_Menu.Config.ptr.autoModeTimer = nil
  function g_Menu.Config.ptr.GetMenuMouseEnable(r0_206)
    -- line: [6841, 6850] id: 206
    local r1_206 = false
    if r0_206.MenuInf.enabled == true and r0_206.MenuInf.effect == false and r0_206.MenuInf.pageEffect == false and r0_206.MenuButton ~= nil then
      r1_206 = true
    end
    return r1_206
  end
  function g_Menu.Config.ptr.MenuEffect(r0_207)
    -- line: [6853, 6911] id: 207
    local r1_207 = false
    if r0_207.MenuInf.effect == true then
      r1_207 = r0_207:MenuEffectTransJob()
      if r1_207 == false then
        r0_207:MenuEffectEndJob()
        r0_207.MenuInf.effect = false
      end
    end
    if r0_207.MenuInf.pageEffect == true then
      local r2_207 = cclass.lua_Layers:create()
      if r2_207:isEffect("configBase", "ConfigPage") == false then
        if r0_207.MenuInf.beforePage ~= -1 then
          r2_207:removeLayer("configBase", ConfigGetPageKeyName(r0_207.MenuInf.beforePage))
          if r0_207.MenuInf.beforePage == 1 then
            r2_207:removeLayer("configBase", "preview")
          end
          if r0_207.MenuInf.beforePage == 2 then
            r0_207:deleteP2key()
          end
          if r0_207.MenuInf.beforePage == 4 then
            r0_207:deleteThumbnail(true)
          end
          if r0_207.MenuInf.beforePage == 5 then
            r0_207:deleteThumbnail(false)
          end
          if r0_207.MenuInf.beforePage == 7 then
            r0_207:deleteIcon()
          end
          if r0_207.MenuInf.beforePage == 8 then
            r0_207:deleteP8Th()
          end
          r0_207.MenuInf.beforePage = -1
        end
        if g_configPage == 2 then
          startCfg2Preview()
        end
        r0_207:updateConfigCursorPos()
        r0_207.MenuInf.pageEffect = false
      end
    end
    return r1_207
  end
  function g_Menu.Config.ptr.MenuEffectEndJob(r0_208)
    -- line: [6914, 6949] id: 208
    local r1_208 = cclass.lua_Layers:create()
    if r0_208.MenuInf.enabled == true then
      r0_208:updateConfigCursorPos()
      if g_configPage == 2 then
        startCfg2Preview()
      end
      if r0_208.toSysMenu == true then
        r1_208:removeSnap("system")
        r1_208:setSnap("system", true)
      end
    else
      if g_menuExecute == false then
        r1_208:removeSnap("system")
      end
      r1_208:remove("configBase")
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      setButtonState()
      r0_208.MenuInf.ButtonLayer = ""
      r0_208.MenuInf.ButtonPna = ""
      r0_208:StopTestVoice()
      r0_208:StopTestSe()
      r0_208:StopTestSystemVoice()
    end
  end
  function g_Menu.Config.ptr.updateConfigCursorPos(r0_209)
    -- line: [6952, 6982] id: 209
    local r1_209 = cclass.lua_Layers:create()
    local r2_209 = 0
    local r3_209 = 0
    local r4_209 = cclass.lua_AutoCursor:new()
    r2_209, r3_209 = r4_209:GetCursorPos(r2_209, r3_209)
    r4_209:delete()
    r0_209.MenuButton:changeButton("configBase", r1_209:getCursorPos("configBase", r2_209, r3_209, 0) - 1, r2_209, r3_209)
    for r10_209, r11_209 in pairs({
      "System",
      "Text",
      "Sound",
      "Save",
      "Load",
      "Shortcut",
      "Gesture"
    }) do
      local r12_209 = r0_209.MenuButton.selCursor
      if r11_209 == r12_209 then
        r1_209:setSubLayerVisible("configBase", "configBase01", 68 + r10_209 - 1, 1)
      else
        r12_209 = r0_209.MenuButtonData[r11_209]
        if r12_209 ~= nil then
          r12_209 = r0_209.MenuButtonData[r11_209].active
          if r12_209 == 0 then
            r1_209:setSubLayerVisible("configBase", "configBase01", 68 + r10_209 - 1, 0)
          end
        end
      end
    end
  end
  g_Menu.Config.ptr.defaultMenuMouseMove = g_Menu.Config.ptr.MenuMouseMove
  function g_Menu.Config.ptr.MenuMouseMove(r0_210, r1_210, r2_210, r3_210, r4_210, r5_210, r6_210)
    -- line: [6987, 7036] id: 210
    r0_210:defaultMenuMouseMove(r1_210, r2_210, r3_210, r4_210, r5_210, r6_210)
    local r7_210 = {
      "System",
      "Text",
      "Sound",
      "Save",
      "Load",
      "Shortcut",
      "Gesture"
    }
    local r8_210 = cclass.lua_Layers:create()
    for r12_210, r13_210 in pairs(r7_210) do
      local r14_210 = r0_210.MenuButton.selCursor
      if r13_210 == r14_210 then
        r8_210:setSubLayerVisible("configBase", "configBase01", 68 + r12_210 - 1, 1)
      else
        r14_210 = r0_210.MenuButtonData[r13_210]
        if r14_210 ~= nil then
          r14_210 = r0_210.MenuButtonData[r13_210].active
          if r14_210 == 0 then
            r8_210:setSubLayerVisible("configBase", "configBase01", 68 + r12_210 - 1, 0)
          end
        end
      end
    end
    if g_configPage == 1 then
      r0_210:SelCursorP1(r0_210.MenuButton.selCursor, r4_210, r5_210)
    end
    if g_configPage == 2 then
      r0_210:SelCursorP2(r0_210.MenuButton.selCursor, r4_210, r5_210)
    end
    if g_configPage == 3 then
      r0_210:SelCursorP3(r0_210.MenuButton.selCursor, r4_210, r5_210)
    end
    if g_configPage == 4 then
      r0_210:SelCursorP4(r0_210.MenuButton.selCursor, r4_210, r5_210)
    end
    if g_configPage == 5 then
      r0_210:SelCursorP5(r0_210.MenuButton.selCursor, r4_210, r5_210)
    end
    if g_configPage == 7 then
      r0_210:SelCursorP7(r0_210.MenuButton.selDownCursor, r0_210.MenuButton.selCursor, r4_210, r5_210)
    end
    if g_configPage == 8 then
      r0_210:SelCursorP8(r0_210.MenuButton.selCursor, r4_210, r5_210)
    end
  end
  function g_Menu.Config.ptr.MenuButtonJobPos(r0_211, r1_211, r2_211, r3_211, r4_211)
    -- line: [7039, 7127] id: 211
    if r2_211 == "LD" then
      r0_211:P1_ButtonJobLD(r1_211, r2_211, r3_211, r4_211)
      r0_211:P2_ButtonJobLD(r1_211, r2_211, r3_211, r4_211)
      r0_211:P3_ButtonJobLD(r1_211, r2_211, r3_211, r4_211)
      r0_211:P7_ButtonJobLD(r1_211, r2_211, r3_211, r4_211)
      r0_211:P8_ButtonJobLD(r1_211, r2_211, r3_211, r4_211)
    end
    if r2_211 == "LU" then
      if r1_211 == 1 then
        r0_211:initConfigPage(1, false)
      end
      if r1_211 == 2 then
        r0_211:initConfigPage(2, false)
      end
      if r1_211 == 3 then
        r0_211:initConfigPage(3, false)
      end
      if r1_211 == 4 then
        r0_211:initConfigPage(4, false)
      end
      if r1_211 == 5 then
        r0_211:initConfigPage(5, false)
      end
      if r1_211 == 6 then
        r0_211:initConfigPage(6, false)
      end
      if r1_211 == 7 then
        r0_211:initConfigPage(7, false)
      end
      if r1_211 == 8 then
        r0_211:initConfigPage(8, false)
      end
      if r1_211 == 10 then
        openConfirm(LUA_CONFIRM_DEFAULT)
      end
      if r1_211 == 11 then
        if r0_211.NMSAcitve == true then
          if g_menuExecute == false and r0_211.P8ChangeSceneNo ~= g_NmsPlay.Act then
            openConfirm(LUA_CONFIRM_CHANGESCN)
          else
            closeConfig()
          end
        else
          closeConfig()
        end
      end
      if r1_211 == 12 then
        if g_menuExecute == true then
          closeConfig()
        else
          openConfirm(LUA_CONFIRM_TITLE)
        end
      end
      if r1_211 == 13 then
        openConfirm(LUA_CONFIRM_QUIT)
      end
      r0_211:P1_ButtonJobLU(r1_211, r2_211, r3_211, r4_211)
      r0_211:P2_ButtonJobLU(r1_211, r2_211, r3_211, r4_211)
      r0_211:P3_ButtonJobLU(r1_211, r2_211, r3_211, r4_211)
      r0_211:DataPage_ButtonJobLU(r1_211, r2_211, r3_211, r4_211)
      r0_211:P7_ButtonJobLU(r1_211, r2_211, r3_211, r4_211)
      r0_211:P8_ButtonJobLU(r1_211, r2_211, r3_211, r4_211)
    end
    if r2_211 == "RU" and r0_211:GetMenuMouseEnable() then
      if r0_211.NMSAcitve == true then
        if g_menuExecute == false and r0_211.P8ChangeSceneNo ~= g_NmsPlay.Act then
          openConfirm(LUA_CONFIRM_CHANGESCN)
        else
          closeConfig()
        end
      else
        r0_211:SystemSePlay("SYS02.ogg")
        closeConfig()
      end
    end
  end
  function g_Menu.Config.ptr.MenuKeyDown(r0_212, r1_212, r2_212, r3_212, r4_212)
    -- line: [7129, 7130] id: 212
  end
  function g_Menu.Config.ptr.MenuMouseWheel(r0_213, r1_213, r2_213, r3_213)
    -- line: [7133, 7139] id: 213
    if r0_213:GetMenuMouseEnable() and g_configPage == 8 then
      r0_213:MenuMouseWheelP8(r1_213, r2_213, r3_213)
    end
  end
  function g_Menu.Config.ptr.startConfigMenu(r0_214, r1_214)
    -- line: [7145, 7164] id: 214
    local r2_214 = cclass.lua_Layers:create()
    if g_menuExecute == false and r1_214 == false then
      r2_214:setSnap("system", true)
    end
    r2_214:copySnap("configBase", "system")
    r2_214:startTransition("configBase", 0, 1, 500 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_214.MenuInf.enabled = true
    r0_214.MenuInf.effect = true
    if r1_214 == false then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
    end
  end
  g_Menu.Config.ptr.LogoMainPos = {}
  g_Menu.Config.ptr.LogoSubPos = {}
  function g_Menu.Config.ptr.initConfigButton(r0_215)
    -- line: [7171, 7235] id: 215
    local r1_215 = cclass.lua_Layers:create()
    for r5_215 = 0, 6, 1 do
      local r6_215 = 79 + r5_215
      local r7_215 = 88 + r5_215
      r1_215:initSubLayer("configBase", "configBase01", r6_215, 1)
      r1_215:initSubLayer("configBase", "configBase01", r7_215, 1)
      local r8_215 = 0
      local r9_215 = 0
      r8_215, r9_215, r10_215, r11_215 = r1_215:getSubLayerParam("configBase", "configBase01", r6_215, LUA_PARAM_POS, r8_215, r9_215, 0, 0)
      r0_215.LogoMainPos[r5_215 + 1] = {
        posx = r8_215,
        posy = r9_215,
      }
      local r12_215 = 0
      local r13_215 = 0
      r12_215, r13_215, r14_215, r15_215 = r1_215:getSubLayerParam("configBase", "configBase01", r7_215, LUA_PARAM_POS, r12_215, r13_215, 0, 0)
      r0_215.LogoSubPos[r5_215 + 1] = {
        posx = r12_215,
        posy = r13_215,
      }
      r1_215:setSubLayerParam("configBase", "configBase01", r6_215, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_215:setSubLayerParam("configBase", "configBase01", r7_215, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r1_215:initSubLayer("configBase", "configBase01", 68 + r5_215, 0)
    end
    r1_215:initSubLayer("configBase", "configBase01", 76, 1)
    r1_215:initSubLayer("configBase", "configBase01", 101, 1)
    r1_215:initSubLayer("configBase", "configBase01", 104, 1)
    r1_215:initSubLayer("configBase", "configBase01", 102, 1)
    r0_215.MenuButtonData = {}
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "System", 1, "configBase01", 23, 32, 50, 41, 59, 1, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "Text", 1, "configBase01", 24, 33, 51, 42, 60, 2, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "Sound", 1, "configBase01", 25, 34, 52, 43, 61, 3, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "Save", 1, "configBase01", 26, 35, 53, 44, 62, 4, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "Load", 1, "configBase01", 27, 36, 54, 45, 63, 5, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "Shortcut", 1, "configBase01", 28, 37, 55, 46, 64, 6, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "Gesture", 1, "configBase01", 29, 38, 56, 47, 65, 7, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "default", 1, "configBase01", 8, 8, 2, -1, 14, 10, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "back", 1, "configBase01", 9, 9, 3, -1, 15, 11, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "rereplay", 1, "configBase01", 98, 98, 97, -1, 99, 12, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "title", 1, "configBase01", 10, 10, 4, -1, 16, 12, 0, 0)
    r0_215:MenuButtonSet(r0_215.MenuButtonData, "quit", 1, "configBase01", 11, 11, 5, -1, 17, 13, 0, 0)
    r0_215:MenuButtonInit()
  end
  function g_Menu.Config.ptr.SetConfigButtonActive(r0_216, r1_216)
    -- line: [7240, 7302] id: 216
    local r2_216 = {
      "System",
      "Text",
      "Sound",
      "Save",
      "Load",
      "Shortcut",
      "Gesture"
    }
    local r3_216 = cclass.lua_Layers:create()
    for r7_216, r8_216 in pairs(r2_216) do
      if r7_216 == r1_216 then
        r0_216.MenuButtonData[r8_216]:bt_SetActive(1)
        r3_216:setSubLayerVisible("configBase", "configBase01", 68 + r7_216 - 1, 1)
      else
        r0_216.MenuButtonData[r8_216]:bt_SetActive(0)
        local r9_216 = r0_216.MenuButton.selCursor
        if r8_216 == r9_216 then
          r3_216:setSubLayerVisible("configBase", "configBase01", 68 + r7_216 - 1, 1)
        else
          r3_216:setSubLayerVisible("configBase", "configBase01", 68 + r7_216 - 1, 0)
        end
      end
    end
    if checkOverlayFunction(7) == false then
      r0_216.MenuButtonData.Save:bt_SetActive(2)
    end
    if checkOverlayFunction(8) == false then
      r0_216.MenuButtonData.Load:bt_SetActive(2)
    end
    if g_menuExecute == true then
      r0_216.MenuButtonData.Save:bt_SetActive(2)
    end
    r0_216.MenuButtonData.rereplay:bt_SetActive(3)
    r0_216.MenuButtonData.title:bt_SetActive(0)
    if cfunc.LegacyGame__lua_GetFlag(127) then
      r0_216.MenuButtonData.rereplay:bt_SetActive(0)
      r0_216.MenuButtonData.title:bt_SetActive(3)
    end
  end
  g_Menu.Config.ptr.PageSlide = true
  function g_Menu.Config.ptr.initConfigPage(r0_217, r1_217, r2_217)
    -- line: [7307, 7465] id: 217
    r0_217.SliderMoveNo = -1
    if r2_217 == false and g_configPage == r1_217 then
      return 
    end
    local r3_217 = getEffectRate()
    local r4_217 = 300 * r3_217
    local r5_217 = cclass.lua_Layers:create()
    local r6_217 = ConfigGetPageFileName(r1_217)
    local r7_217 = ConfigGetPageKeyName(r1_217)
    r0_217:MenuLoadLayer(r7_217, r6_217)
    if r1_217 == 1 then
      r0_217:initConfigP1(r7_217, true)
    elseif r1_217 == 2 then
      r0_217:initConfigP2(r7_217, true)
    elseif r1_217 == 3 then
      r0_217:initConfigP3(r7_217, true)
    elseif r1_217 == 4 then
      r0_217:initDataPage(r7_217, true, true)
    elseif r1_217 == 5 then
      r0_217:initDataPage(r7_217, false, true)
    elseif r1_217 == 6 then
      r0_217.MenuButton:InitList()
      r5_217:initSubLayer("configBase", r7_217, 0, 1)
    elseif r1_217 == 7 then
      r0_217:initConfigP7(r7_217, true)
    elseif r1_217 == 8 then
      r0_217:initConfigP8(r7_217, true)
    end
    r0_217.MenuButton:SetList("MenuButtonData", r0_217.MenuButtonData)
    r0_217:SetConfigButtonActive(r1_217)
    if r2_217 == false then
      local r8_217 = 0
      local r9_217 = ConfigGetPageKeyName(g_configPage)
      r5_217:clearHitTestAll("configBase", r9_217)
      local r10_217 = g_configPage
      if r1_217 < r10_217 then
        r10_217 = APP_INTERNAL_WIDTH or -1 * APP_INTERNAL_WIDTH
      else
        goto label_110	-- block#22 is visited secondly
      end
      if r1_217 >= g_configPage or not 90 then
        local r11_217 = -90
      end
      if r1_217 == 6 then
        r10_217 = -1 * APP_INTERNAL_WIDTH
        local r11_217 = -90
      end
      if g_configPage == 6 then
        r10_217 = APP_INTERNAL_WIDTH
        local r11_217 = 90
      end
      if g_configPage == 1 then
        r0_217:effectCfg1Preview(r2_217, r10_217, r4_217, true, r8_217)
      elseif g_configPage == 2 then
        r0_217:effectCfg2Text(r2_217, r10_217, r4_217, true, r8_217)
      elseif g_configPage == 4 or g_configPage == 5 then
        local r12_217 = g_configPage
        if r12_217 == 4 then
          r12_217 = true or false
        else
          goto label_163	-- block#38 is visited secondly
        end
        r0_217:effectThumbnail(r12_217, r2_217, g_dataInfo.page, r10_217, r4_217, true, r8_217)
      elseif g_configPage == 7 then
        r0_217:effectP7(r2_217, r10_217, r4_217, true, r8_217)
      elseif g_configPage == 8 then
        r0_217:effectP8Th(r2_217, r10_217, r4_217, true, r8_217)
      end
      local r12_217 = r0_217.PageSlide
      if r12_217 then
        r5_217:setParam("configBase", r9_217, LUA_PARAM_POS, 0, 0, 0, 0)
        r5_217:setEffect("configBase", r9_217, "ConfigPage", LUA_EFFECT_POS, r10_217, 0, 0, 0, 2, r4_217, 0, r8_217)
        r5_217:startEffect("configBase", r9_217, "ConfigPage", 0)
        r5_217:setParam("configBase", r7_217, LUA_PARAM_POS, -r10_217, 0, 0, 0)
        r5_217:setEffect("configBase", r7_217, "ConfigPage", LUA_EFFECT_POS, r10_217, 0, 0, 0, 2, r4_217, 0, r8_217)
      else
        r5_217:setParam("configBase", r9_217, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_217:setEffect("configBase", r9_217, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r4_217, 0, r8_217)
        r5_217:startEffect("configBase", r9_217, "ConfigPage", 0)
        r5_217:setParam("configBase", r7_217, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r5_217:setEffect("configBase", r7_217, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r4_217, 0, r8_217)
      end
      r5_217:startEffect("configBase", r7_217, "ConfigPage", 0)
      if r1_217 == 1 then
        r0_217:effectCfg1Preview(r2_217, r10_217, r4_217, false, r8_217)
      elseif r1_217 == 2 then
        r0_217:effectCfg2Text(r2_217, r10_217, r4_217, false, r8_217)
      elseif r1_217 == 4 or r1_217 == 5 then
        if r1_217 == 4 then
          r12_217 = true or false
        else
          goto label_339	-- block#55 is visited secondly
        end
        r0_217:effectThumbnail(r12_217, r2_217, g_dataInfo.page, r10_217, r4_217, false, r8_217)
      elseif r1_217 == 7 then
        r0_217:effectP7(r2_217, r10_217, r4_217, false, r8_217)
      elseif r1_217 == 8 then
        r0_217:effectP8Th(r2_217, r10_217, r4_217, false, r8_217)
      end
      r0_217:ConfigLogo(r1_217, g_configPage, r4_217, r3_217)
      r0_217.MenuInf.pageEffect = true
    else
      r0_217:ConfigLogo(r1_217, g_configPage, 0, 0)
    end
    r0_217.MenuInf.beforePage = g_configPage
    g_configPage = r1_217
  end
  function g_Menu.Config.ptr.ConfigLogo(r0_218, r1_218, r2_218, r3_218, r4_218)
    -- line: [7468, 7583] id: 218
    if r1_218 == 0 then
      return 
    end
    local r5_218 = cclass.lua_Layers:create()
    local r6_218 = 0
    local r7_218 = 79 + r1_218 - 1
    local r8_218 = 88 + r1_218 - 1
    local r9_218 = 79 + r2_218 - 1
    local r10_218 = 88 + r2_218 - 1
    local r11_218 = 0
    if r3_218 > 0 then
      r11_218 = 553
      if r2_218 >= 1 then
        r5_218:setSubLayerParam("configBase", "configBase01", r9_218, LUA_PARAM_POS, r0_218.LogoMainPos[r2_218].posx, r0_218.LogoMainPos[r2_218].posy, 0, 0)
        r5_218:setSubLayerParam("configBase", "configBase01", r10_218, LUA_PARAM_POS, r0_218.LogoSubPos[r2_218].posx, r0_218.LogoSubPos[r2_218].posy, 0, 0)
        r5_218:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r9_218, LUA_EFFECT_POS, -500, 0, 0, 0, 0, r3_218 / 2, 0, r6_218)
        r5_218:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r10_218, LUA_EFFECT_POS, 250, 0, 0, 0, 0, r3_218 / 2, 0, r6_218)
        r5_218:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r9_218, 0)
        r5_218:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r10_218, 0)
        r6_218 = r3_218 / 2
        if r2_218 == 1 or r2_218 == 2 or r2_218 == 3 then
          r11_218 = 553
        else
          r11_218 = 626
        end
      end
      local r12_218 = r11_218
      if r1_218 >= 1 then
        r5_218:setSubLayerParam("configBase", "configBase01", r7_218, LUA_PARAM_POS, r0_218.LogoMainPos[r1_218].posx - 500, r0_218.LogoMainPos[r1_218].posy, 0, 0)
        r5_218:setSubLayerParam("configBase", "configBase01", r8_218, LUA_PARAM_POS, r0_218.LogoSubPos[r1_218].posx + 250, r0_218.LogoSubPos[r1_218].posy, 0, 0)
        r5_218:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r7_218, LUA_EFFECT_POS, 500, 0, 0, 0, 0, r3_218 / 2, 0, r6_218)
        r5_218:setSubLayerEffect("configBase", "configBase01", "ConfigPage", r8_218, LUA_EFFECT_POS, -250, 0, 0, 0, 0, r3_218 / 2, 0, r6_218)
        r5_218:setSubLayerParam("configBase", "configBase01", r7_218, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_218:setSubLayerParam("configBase", "configBase01", r8_218, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_218:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r7_218, 0)
        r5_218:startSubLayerEffect("configBase", "configBase01", "ConfigPage", r8_218, 0)
        local r13_218 = 0
        if r1_218 == 1 or r1_218 == 2 or r1_218 == 3 then
          r13_218 = 553
        else
          r13_218 = 626
        end
        r12_218 = r13_218 - r12_218
      end
      r5_218:setSubLayerParam("configBase", "configBase01", 102, LUA_PARAM_POS, 0, r11_218, 0, 0)
      if r12_218 ~= 0 then
        r5_218:setSubLayerEffect("configBase", "configBase01", "ConfigPage", 102, LUA_EFFECT_POS, 0, r12_218, 0, 0, 0, r3_218, 0, 0)
        r5_218:startSubLayerEffect("configBase", "configBase01", "ConfigPage", 102, 0)
      end
    else
      if r2_218 >= 1 then
        r5_218:setSubLayerParam("configBase", "configBase01", r9_218, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r5_218:setSubLayerParam("configBase", "configBase01", r10_218, LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
      if r1_218 >= 1 then
        r5_218:setSubLayerParam("configBase", "configBase01", r7_218, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_218:setSubLayerParam("configBase", "configBase01", r8_218, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
      if r1_218 == 1 or r1_218 == 2 or r1_218 == 3 then
        r11_218 = 553
      else
        r11_218 = 626
      end
      r5_218:setSubLayerParam("configBase", "configBase01", 102, LUA_PARAM_POS, 0, r11_218, 0, 0)
    end
  end
  function g_Menu.Config.ptr.ItemSetInit(r0_219)
    -- line: [7587, 7594] id: 219
    return {
      selCursor_selName = -1,
      selCursor_Item = -1,
      selCursor_SubItem = -1,
      selCursor_Conf = -1,
    }
  end
  function g_Menu.Config.ptr.ItemSet(r0_220, r1_220, r2_220, r3_220, r4_220, r5_220)
    -- line: [7595, 7626] id: 220
    r1_220.selCursor_selName = r2_220
    if r1_220.selCursor_Item ~= -1 then
      r1_220.selCursor_Item:SetAct("def")
      r1_220.selCursor_Item = -1
    end
    if r1_220.selCursor_SubItem ~= -1 then
      r1_220.selCursor_SubItem:SetAct("def")
      r1_220.selCursor_SubItem = -1
    end
    if r1_220.selCursor_Conf ~= -1 then
      r1_220.selCursor_Conf:SetAct("def")
      r1_220.selCursor_Conf = -1
    end
    if r3_220 ~= -1 then
      r1_220.selCursor_Item = r1_220[r3_220]
      r1_220.selCursor_Item:SetAct("on")
    end
    if r4_220 ~= -1 then
      r1_220.selCursor_SubItem = r1_220[r4_220]
      r1_220.selCursor_SubItem:SetAct("on")
    end
    if r5_220 ~= -1 then
      r1_220.selCursor_Conf = r1_220[r5_220]
      r1_220.selCursor_Conf:SetAct("on")
    end
  end
  function g_Menu.Config.ptr.CheckItemNew(r0_221, r1_221, r2_221, r3_221, r4_221, r5_221)
    -- line: [7630, 7639] id: 221
    local r6_221 = MenuItem.new("configBase", r1_221, r2_221, r3_221)
    r6_221:addLayer("Actdef", r4_221)
    r6_221:addLayer("Acton", r5_221)
    r6_221:ReSet()
    r6_221:SetAct("def")
    r6_221.ActiveFlag = 0
    return r6_221
  end
  function g_Menu.Config.ptr.CheckItemAct(r0_222, r1_222, r2_222, r3_222)
    -- line: [7641, 7650] id: 222
    if r1_222 == nil then
      return 
    end
    if r1_222[r2_222] == nil then
      return 
    end
    r1_222[r2_222].ActiveFlag = r3_222
  end
  function g_Menu.Config.ptr.CheckItemOnCursor(r0_223, r1_223, r2_223, r3_223)
    -- line: [7653, 7675] id: 223
    if r1_223 == nil then
      return 
    end
    if r1_223[r2_223] == nil then
      return 
    end
    if r1_223[r2_223].ActiveFlag == 0 then
      if r3_223 == 0 then
        r1_223[r2_223]:SetAct("def")
      else
        r1_223[r2_223]:SetAct("on")
      end
    elseif r3_223 == 0 then
      r1_223[r2_223]:SetAct("Actdef")
    else
      r1_223[r2_223]:SetAct("Acton")
    end
  end
  function g_Menu.Config.ptr.SetSliderParam(r0_224, r1_224, r2_224, r3_224, r4_224, r5_224, r6_224)
    -- line: [7681, 7698] id: 224
    r1_224:bt_SetMoveRangeRectLayer(r2_224)
    r1_224:bt_SetEventRangeRectLayer(r3_224)
    r1_224:bt_SetMovableInit(true, r4_224, 0, r5_224, 0, 0, 0)
    r1_224.initpos.x = r1_224.MOVERANGE.x
    r1_224.initpos.y = r1_224.MOVERANGE.y
    r1_224.initrect.x = r1_224.MOVERANGE.x
    r1_224.initrect.y = r1_224.MOVERANGE.y
    r1_224.initrect.w = r1_224.EVENT_RECT.w
    r1_224.initrect.h = r1_224.EVENT_RECT.h
    r1_224:bt_SetParamX(r6_224)
  end
  function g_Menu.Config.ptr.MoveSliderBack(r0_225, r1_225, r2_225, r3_225)
    -- line: [7700, 7713] id: 225
    local r4_225 = r2_225.EVENT_RECT.w / (r1_225.MOVABLE.PAR_MAX_X + 1 - r1_225.MOVABLE.PSIZE_X)
    local r5_225 = r3_225 - r2_225.DRAW_POS.x
    if r5_225 < 0 then
      r5_225 = 0
    end
    local r6_225 = math.floor(r5_225 / r4_225)
    r1_225:bt_SetParamX(r6_225)
    return r6_225
  end
  function g_Menu.Config.ptr.Page1_SetActive(r0_226)
    -- line: [7719, 7920] id: 226
    if g_screenMode == 0 then
      r0_226.ButtonP1.Window:bt_SetActive(0)
      r0_226.ButtonP1.FullScreen:bt_SetActive(4)
    else
      r0_226.ButtonP1.Window:bt_SetActive(4)
      r0_226.ButtonP1.FullScreen:bt_SetActive(0)
    end
    if g_zoomMode == 0 then
      r0_226.ButtonP1.LetterBox:bt_SetActive(4)
      r0_226.ButtonP1.FullSize:bt_SetActive(0)
      r0_226.ButtonP1.SideCut:bt_SetActive(0)
      r0_226.ButtonP1.Without:bt_SetActive(0)
    elseif g_zoomMode == 1 then
      r0_226.ButtonP1.LetterBox:bt_SetActive(0)
      r0_226.ButtonP1.FullSize:bt_SetActive(4)
      r0_226.ButtonP1.SideCut:bt_SetActive(0)
      r0_226.ButtonP1.Without:bt_SetActive(0)
    elseif g_zoomMode == 2 then
      r0_226.ButtonP1.LetterBox:bt_SetActive(0)
      r0_226.ButtonP1.FullSize:bt_SetActive(0)
      r0_226.ButtonP1.SideCut:bt_SetActive(4)
      r0_226.ButtonP1.Without:bt_SetActive(0)
    elseif g_zoomMode == 3 then
      r0_226.ButtonP1.LetterBox:bt_SetActive(0)
      r0_226.ButtonP1.FullSize:bt_SetActive(0)
      r0_226.ButtonP1.SideCut:bt_SetActive(0)
      r0_226.ButtonP1.Without:bt_SetActive(4)
    end
    if g_effectSpeed == 0 then
      r0_226.ButtonP1.EFF_Normal:bt_SetActive(4)
      r0_226.ButtonP1.EFF_Fast:bt_SetActive(0)
      r0_226.ButtonP1.EFF_None:bt_SetActive(0)
    elseif g_effectSpeed == 1 then
      r0_226.ButtonP1.EFF_Normal:bt_SetActive(0)
      r0_226.ButtonP1.EFF_Fast:bt_SetActive(4)
      r0_226.ButtonP1.EFF_None:bt_SetActive(0)
    elseif g_effectSpeed == 2 then
      r0_226.ButtonP1.EFF_Normal:bt_SetActive(0)
      r0_226.ButtonP1.EFF_Fast:bt_SetActive(0)
      r0_226.ButtonP1.EFF_None:bt_SetActive(4)
    end
    if g_mouseAutoMove == true then
      r0_226.ButtonP1.AutoCurOn:bt_SetActive(4)
      r0_226.ButtonP1.AutoCurOff:bt_SetActive(0)
    else
      r0_226.ButtonP1.AutoCurOn:bt_SetActive(0)
      r0_226.ButtonP1.AutoCurOff:bt_SetActive(4)
    end
    local r1_226 = cclass.lua_Layers:create()
    local r2_226 = ConfigGetPageKeyName(1)
    if g_hideCursor == 0 then
      r0_226.ButtonP1.EraseCur5:bt_SetActive(4)
      r0_226.ButtonP1.EraseCur30:bt_SetActive(0)
      r0_226.ButtonP1.EraseCurOff:bt_SetActive(0)
    elseif g_hideCursor == 1 then
      r0_226.ButtonP1.EraseCur5:bt_SetActive(0)
      r0_226.ButtonP1.EraseCur30:bt_SetActive(4)
      r0_226.ButtonP1.EraseCurOff:bt_SetActive(0)
    end
    if g_hideCursorOn == false then
      r0_226.ButtonP1.EraseCur5:bt_SetActive(0)
      r0_226.ButtonP1.EraseCur30:bt_SetActive(0)
      r0_226.ButtonP1.EraseCurOff:bt_SetActive(4)
    end
    if g_drawSkipIcon == true then
      r0_226.ButtonP1.SkipIconOn:bt_SetActive(4)
      r0_226.ButtonP1.SkipIconOff:bt_SetActive(0)
    else
      r0_226.ButtonP1.SkipIconOn:bt_SetActive(0)
      r0_226.ButtonP1.SkipIconOff:bt_SetActive(4)
    end
    if g_skipConfirm == true then
      r0_226.ButtonP1.ConfMsgOn:bt_SetActive(4)
      r0_226.ButtonP1.ConfMsgOff:bt_SetActive(0)
    else
      r0_226.ButtonP1.ConfMsgOn:bt_SetActive(0)
      r0_226.ButtonP1.ConfMsgOff:bt_SetActive(4)
    end
    if g_deactiveMode == true then
      r0_226.ButtonP1.DeactiveOn:bt_SetActive(4)
      r0_226.ButtonP1.DeactiveOff:bt_SetActive(0)
    else
      r0_226.ButtonP1.DeactiveOn:bt_SetActive(0)
      r0_226.ButtonP1.DeactiveOff:bt_SetActive(4)
    end
    if g_MouseRButton == 0 then
      r0_226.ButtonP1.MouseRClose:bt_SetActive(4)
      r0_226.ButtonP1.MouseRConfig:bt_SetActive(0)
      r0_226.ButtonP1.MouseRSave:bt_SetActive(0)
      r0_226.ButtonP1.MouseRLoad:bt_SetActive(0)
    elseif g_MouseRButton == 1 then
      r0_226.ButtonP1.MouseRClose:bt_SetActive(0)
      r0_226.ButtonP1.MouseRConfig:bt_SetActive(4)
      r0_226.ButtonP1.MouseRSave:bt_SetActive(0)
      r0_226.ButtonP1.MouseRLoad:bt_SetActive(0)
    elseif g_MouseRButton == 2 then
      r0_226.ButtonP1.MouseRClose:bt_SetActive(0)
      r0_226.ButtonP1.MouseRConfig:bt_SetActive(0)
      r0_226.ButtonP1.MouseRSave:bt_SetActive(4)
      r0_226.ButtonP1.MouseRLoad:bt_SetActive(0)
    elseif g_MouseRButton == 3 then
      r0_226.ButtonP1.MouseRClose:bt_SetActive(0)
      r0_226.ButtonP1.MouseRConfig:bt_SetActive(0)
      r0_226.ButtonP1.MouseRSave:bt_SetActive(0)
      r0_226.ButtonP1.MouseRLoad:bt_SetActive(4)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true or cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
      r0_226.ButtonP1.MouseRLoad:bt_SetActive(2)
    end
    if g_CASTOFF then
      if r0_226.hiyakeflag == true then
        local r3_226 = cfunc.LegacyGame__lua_GetVariable(200)
        if r3_226 == 0 then
          r0_226.ButtonP1.CastOn:bt_SetActive(4)
          r0_226.ButtonP1.CastOff:bt_SetActive(0)
        end
        if r3_226 == 1 then
          r0_226.ButtonP1.CastOn:bt_SetActive(0)
          r0_226.ButtonP1.CastOff:bt_SetActive(4)
        end
      else
        r0_226.ButtonP1.CastOn:bt_SetActive(3)
        r0_226.ButtonP1.CastOff:bt_SetActive(3)
      end
    end
    if g_messageWindowType == 0 then
      r0_226.ButtonP1.MswNormal:bt_SetActive(4)
      r0_226.ButtonP1.MswSimple:bt_SetActive(0)
    else
      r0_226.ButtonP1.MswNormal:bt_SetActive(0)
      r0_226.ButtonP1.MswSimple:bt_SetActive(4)
    end
    r0_226:ActiveCheckItemP1()
  end
  function g_Menu.Config.ptr.P1_ButtonJobLD(r0_227, r1_227, r2_227, r3_227, r4_227)
    -- line: [7923, 7924] id: 227
  end
  function g_Menu.Config.ptr.P1_ButtonJobLU(r0_228, r1_228, r2_228, r3_228, r4_228)
    -- line: [7925, 8084] id: 228
    if r1_228 == 101 and g_screenMode == 0 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SCREENMODE, 0)
    elseif r1_228 == 102 and g_screenMode == 1 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SCREENMODE, 0)
    end
    if r1_228 == 103 then
      g_zoomMode = 1
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, g_zoomMode)
    elseif r1_228 == 104 then
      g_zoomMode = 0
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, g_zoomMode)
    elseif r1_228 == 105 then
      g_zoomMode = 2
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, g_zoomMode)
    elseif r1_228 == 106 then
      g_zoomMode = 3
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ASPECTMODE, g_zoomMode)
    end
    if r1_228 == 109 then
      g_effectSpeed = 0
    elseif r1_228 == 110 then
      g_effectSpeed = 1
    elseif r1_228 == 111 then
      g_effectSpeed = 2
    end
    if r1_228 == 112 then
      g_mouseAutoMove = true
    elseif r1_228 == 113 then
      g_mouseAutoMove = false
    end
    if r1_228 == 127 then
      g_hideCursor = 0
      g_hideCursorOn = true
    elseif r1_228 == 128 then
      g_hideCursor = 1
      g_hideCursorOn = true
    elseif r1_228 == 129 then
      g_hideCursor = 2
      g_hideCursorOn = false
    end
    if r1_228 == 115 then
      g_hideCursorOn = true
    elseif r1_228 == 116 then
      g_hideCursorOn = false
    end
    if r1_228 == 117 then
      g_drawSkipIcon = true
    elseif r1_228 == 118 then
      g_drawSkipIcon = false
    end
    if r1_228 == 119 then
      g_skipConfirm = true
    elseif r1_228 == 120 then
      g_skipConfirm = false
    end
    if r1_228 == 121 then
      g_deactiveMode = true
    elseif r1_228 == 122 then
      g_deactiveMode = false
    end
    if r1_228 == 123 then
      g_MouseRButton = 0
    elseif r1_228 == 124 then
      g_MouseRButton = 1
    elseif r1_228 == 125 then
      g_MouseRButton = 2
    elseif r1_228 == 126 then
      g_MouseRButton = 3
    end
    if g_CASTOFF then
      if r1_228 == 130 then
        cfunc.LegacyGame__lua_SetVariable(200, 0)
        if g_menuExecute == false then
          local r5_228 = cclass.lua_Layers:create()
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
          r5_228:setForceBG(true)
          g_P1Renew = 3
        end
      end
      if r1_228 == 131 then
        cfunc.LegacyGame__lua_SetVariable(200, 1)
        if g_menuExecute == false then
          local r5_228 = cclass.lua_Layers:create()
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
          r5_228:setForceBG(true)
          g_P1Renew = 3
        end
      end
    end
    if r1_228 == 140 then
      g_messageWindowType = 0
      changeMessageWindow(-1, true)
      if g_menuExecute == false then
        local r5_228 = cclass.lua_Layers:create()
        if g_CASTOFF then
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        end
        r5_228:setForceBG(true)
        g_P1Renew = 3
      end
    elseif r1_228 == 141 then
      g_messageWindowType = 1
      changeMessageWindow(-1, true)
      if g_menuExecute == false then
        local r5_228 = cclass.lua_Layers:create()
        if g_CASTOFF then
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        end
        r5_228:setForceBG(true)
        g_P1Renew = 3
      end
    end
    if 101 <= r1_228 and r1_228 <= 200 then
      r0_228:updatePreviewSize(ConfigGetPageKeyName(g_configPage))
      r0_228:Page1_SetActive()
    end
  end
  g_Menu.Config.ptr.initConfigP1_BBase = 5
  g_Menu.Config.ptr.hiyakeflag = true
  function g_Menu.Config.ptr.initConfigP1(r0_229, r1_229, r2_229)
    -- line: [8088, 8339] id: 229
    local r3_229 = cclass.lua_Layers:create()
    if r2_229 == true then
      r3_229:initSubLayer("configBase", r1_229, 143, 1)
      r3_229:initSubLayer("configBase", r1_229, 2, 0)
      r3_229:initSubLayer("configBase", r1_229, 3, 0)
      r3_229:initSubLayer("configBase", r1_229, 4, 0)
      r3_229:initSubLayer("configBase", r1_229, r0_229.initConfigP1_BBase, 1)
      r0_229.ButtonP1 = {}
      r0_229:MenuButtonSet(r0_229.ButtonP1, "Window", 1, r1_229, 35, 35, 63, 91, -1, 101, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "FullScreen", 1, r1_229, 36, 36, 64, 92, -1, 102, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "FullSize", 1, r1_229, 37, 37, 65, 93, -1, 103, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "LetterBox", 1, r1_229, 38, 38, 66, 94, -1, 104, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "SideCut", 1, r1_229, 39, 39, 67, 95, -1, 105, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "Without", 1, r1_229, 40, 40, 68, 96, -1, 106, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "MswNormal", 1, r1_229, 41, 41, 69, 97, -1, 140, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "MswSimple", 1, r1_229, 42, 42, 70, 98, -1, 141, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "EFF_Normal", 1, r1_229, 43, 43, 71, 99, -1, 109, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "EFF_Fast", 1, r1_229, 44, 44, 72, 100, -1, 110, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "EFF_None", 1, r1_229, 45, 45, 73, 101, -1, 111, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "SkipIconOn", 1, r1_229, 46, 46, 74, 102, -1, 117, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "SkipIconOff", 1, r1_229, 47, 47, 75, 103, -1, 118, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "AutoCurOn", 1, r1_229, 48, 48, 76, 104, -1, 112, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "AutoCurOff", 1, r1_229, 49, 49, 77, 105, -1, 113, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "ConfMsgOn", 1, r1_229, 51, 51, 79, 107, -1, 119, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "ConfMsgOff", 1, r1_229, 50, 50, 78, 106, -1, 120, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "EraseCur5", 1, r1_229, 52, 52, 80, 108, -1, 127, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "EraseCur30", 1, r1_229, 53, 53, 81, 109, -1, 128, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "EraseCurOff", 1, r1_229, 54, 54, 82, 110, -1, 116, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "DeactiveOn", 1, r1_229, 55, 55, 83, 111, -1, 121, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "DeactiveOff", 1, r1_229, 56, 56, 84, 112, -1, 122, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "MouseRConfig", 1, r1_229, 57, 57, 85, 113, -1, 124, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "MouseRSave", 1, r1_229, 58, 58, 86, 114, -1, 125, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "MouseRLoad", 1, r1_229, 59, 59, 87, 115, 63, 126, 0, 0)
      r0_229:MenuButtonSet(r0_229.ButtonP1, "MouseRClose", 1, r1_229, 60, 60, 88, 116, -1, 123, 0, 0)
      if g_CASTOFF then
        r0_229:MenuButtonSet(r0_229.ButtonP1, "CastOn", 1, r1_229, 56, 56, 52, 48, -1, 130, 0, 0)
        r0_229:MenuButtonSet(r0_229.ButtonP1, "CastOff", 1, r1_229, 55, 55, 51, 47, -1, 131, 0, 0)
      end
      r0_229.MenuButton:InitList()
      r0_229.MenuButton:SetList("ButtonP1", r0_229.ButtonP1)
      r0_229.MenuButton:InitButton()
      r3_229:initSubLayer("configBase", r1_229, r0_229.initConfigP1_BBase, 1)
      local r4_229 = 0
      local r5_229 = 0
      r4_229, r5_229, r6_229, r7_229 = r3_229:getScreenAspect(r4_229, r5_229, 0, 0)
      local r8_229 = 0
      local r9_229 = 0
      r8_229, r9_229, r10_229, r11_229 = r3_229:getSubLayerParam("configBase", r1_229, r0_229.initConfigP1_BBase, LUA_PARAM_SIZE, r8_229, r9_229, 0, 0)
      if r4_229 ~= 16 or r5_229 ~= 9 then
        r3_229:setSubLayerParam("configBase", r1_229, r0_229.initConfigP1_BBase, LUA_PARAM_SCALE, 1, r8_229 / r4_229 * r5_229 / r9_229, 1, 0)
      end
      if g_menuExecute == false then
        r3_229:insertPreviewLayer("configBase", "preview", r8_229, r9_229, 1)
      else
        if g_TrialFlag == 0 then
          if r0_229.CompFlag == false then
            r3_229:insertPNARefLayer("configBase", "preview", r1_229, 2, 1)
          else
            r3_229:insertPNARefLayer("configBase", "preview", r1_229, 4, 1)
          end
        end
        if g_TrialFlag == 1 then
          r3_229:insertPNARefLayer("configBase", "preview", r1_229, 3, 1)
        end
      end
      local r12_229 = 0
      local r13_229 = 0
      local r14_229 = 0
      local r15_229 = 0
      r12_229, r13_229, r14_229, r15_229 = r3_229:getSubLayerParam("configBase", r1_229, r0_229.initConfigP1_BBase, LUA_PARAM_POS, r12_229, r13_229, r14_229, r15_229)
      r3_229:setParam("configBase", "preview", LUA_PARAM_POS, r12_229, r13_229, r14_229, r15_229)
      r0_229.ItemP1 = r0_229:ItemSetInit()
      r0_229.ItemP1.WindowMode = MenuItem.new("configBase", r1_229, 9, 21)
      r0_229.ItemP1.WideScreen = MenuItem.new("configBase", r1_229, 10, 22)
      r0_229.ItemP1.MswType = MenuItem.new("configBase", r1_229, 11, 23)
      r0_229.ItemP1.Effect = MenuItem.new("configBase", r1_229, 12, 24)
      r0_229.ItemP1.SkipIcon = MenuItem.new("configBase", r1_229, 13, 25)
      r0_229.ItemP1.AutoCursor = MenuItem.new("configBase", r1_229, 14, 26)
      r0_229.ItemP1.ConfMsg = MenuItem.new("configBase", r1_229, 15, 27)
      r0_229.ItemP1.EraseCursor = MenuItem.new("configBase", r1_229, 16, 28)
      r0_229.ItemP1.Deactive = MenuItem.new("configBase", r1_229, 17, 29)
      r0_229.ItemP1.RClick = MenuItem.new("configBase", r1_229, 18, 30)
      r0_229.ItemP1.Headline_WindowMode = "WindowMode"
      r0_229.ItemP1.Headline_WideScreen = "WideScreen"
      r0_229.ItemP1.Headline_MswType = "MswType"
      r0_229.ItemP1.Headline_Effect = "Effect"
      r0_229.ItemP1.Headline_AutoCursor = "AutoCursor"
      r0_229.ItemP1.Headline_EraseCursor = "EraseCursor"
      r0_229.ItemP1.Headline_RClick = "RClick"
      r0_229.ItemP1.Headline_SkipIcon = "SkipIcon"
      r0_229.ItemP1.Headline_ConfMsg = "ConfMsg"
      r0_229.ItemP1.Headline_Deactive = "Deactive"
      r0_229.ItemP1.Headline_CastOff = -1
      r0_229.ItemP1.expWindowModeWin = MenuItem.new("configBase", r1_229, -1, 140)
      r0_229.ItemP1.expWindowModeFull = MenuItem.new("configBase", r1_229, -1, 139)
      r0_229.ItemP1.expWideScreenFull = MenuItem.new("configBase", r1_229, -1, 138)
      r0_229.ItemP1.expWideScreenLett = MenuItem.new("configBase", r1_229, -1, 137)
      r0_229.ItemP1.expWideScreenSCut = MenuItem.new("configBase", r1_229, -1, 136)
      r0_229.ItemP1.expWideScreenNone = MenuItem.new("configBase", r1_229, -1, 135)
      r0_229.ItemP1.expMswNormal = MenuItem.new("configBase", r1_229, -1, 134)
      r0_229.ItemP1.expMswSimple = MenuItem.new("configBase", r1_229, -1, 133)
      r0_229.ItemP1.expEffectNomal = MenuItem.new("configBase", r1_229, -1, 132)
      r0_229.ItemP1.expEffectQuick = MenuItem.new("configBase", r1_229, -1, 131)
      r0_229.ItemP1.expEffectOff = MenuItem.new("configBase", r1_229, -1, 130)
      r0_229.ItemP1.expSkipIconOn = MenuItem.new("configBase", r1_229, -1, 129)
      r0_229.ItemP1.expAutoCursorOn = MenuItem.new("configBase", r1_229, -1, 128)
      r0_229.ItemP1.expConfMsgOn = MenuItem.new("configBase", r1_229, -1, 127)
      r0_229.ItemP1.expEraseCursor = MenuItem.new("configBase", r1_229, -1, 126)
      r0_229.ItemP1.expDeactive = -1
      r0_229.ItemP1.expDeactiveOn = MenuItem.new("configBase", r1_229, -1, 125)
      r0_229.ItemP1.expDeactiveOff = MenuItem.new("configBase", r1_229, -1, 124)
      r0_229.ItemP1.expMouseR = MenuItem.new("configBase", r1_229, -1, 123)
      if g_CASTOFF then
        r0_229.ItemP1.expCastOff = MenuItem.new("configBase", r1_229, -1, 3)
        r0_229.ItemP1.expCastOn = MenuItem.new("configBase", r1_229, -1, 4)
      end
    end
    r0_229:updatePreviewSize(r1_229)
    r0_229:Page1_SetActive()
  end
  function g_Menu.Config.ptr.OnCursorCheckItemP1(r0_230, r1_230)
    -- line: [8343, 8344] id: 230
  end
  function g_Menu.Config.ptr.ActiveCheckItemP1(r0_231)
    -- line: [8347, 8350] id: 231
    r0_231:OnCursorCheckItemP1(-1)
  end
  function g_Menu.Config.ptr.SelCursorP1(r0_232, r1_232, r2_232, r3_232)
    -- line: [8354, 8499] id: 232
    if r1_232 == -1 or r0_232.ItemP1.selCursor_selName ~= r1_232 then
      r0_232:ItemSet(r0_232.ItemP1, -1, -1, -1, -1)
    end
    if r1_232 == "Window" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_WindowMode, -1, "expWindowModeWin")
    end
    if r1_232 == "FullScreen" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_WindowMode, -1, "expWindowModeFull")
    end
    if r1_232 == "FullSize" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_WideScreen, -1, "expWideScreenFull")
    end
    if r1_232 == "LetterBox" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_WideScreen, -1, "expWideScreenLett")
    end
    if r1_232 == "SideCut" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_WideScreen, -1, "expWideScreenSCut")
    end
    if r1_232 == "Without" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_WideScreen, -1, "expWideScreenNone")
    end
    if r1_232 == "MswNormal" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_MswType, -1, "expMswNormal")
    end
    if r1_232 == "MswSimple" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_MswType, -1, "expMswSimple")
    end
    if r1_232 == "EFF_Normal" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_Effect, -1, "expEffectNomal")
    end
    if r1_232 == "EFF_Fast" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_Effect, -1, "expEffectQuick")
    end
    if r1_232 == "EFF_None" then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_Effect, -1, "expEffectOff")
    end
    if "AutoCurOn" == r1_232 or "AutoCurOff" == r1_232 then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_AutoCursor, -1, "expAutoCursorOn")
    end
    if "EraseCur5" == r1_232 or "EraseCur30" == r1_232 or "EraseCurOn" == r1_232 or "EraseCurOff" == r1_232 then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_EraseCursor, -1, "expEraseCursor")
    end
    if "SkipIconOn" == r1_232 or "SkipIconOff" == r1_232 then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_SkipIcon, -1, "expSkipIconOn")
    end
    if "ConfMsgOn" == r1_232 or "ConfMsgOff" == r1_232 then
      r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_ConfMsg, -1, "expConfMsgOn")
    end
    if r1_232 == "DeactiveOn" then
      if r0_232.ItemP1.expDeactive == -1 then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_Deactive, -1, "expDeactiveOn")
      else
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_Deactive, -1, "expDeactive")
      end
    end
    if r1_232 == "DeactiveOff" then
      if r0_232.ItemP1.expDeactive == -1 then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_Deactive, -1, "expDeactiveOff")
      else
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_Deactive, -1, "expDeactive")
      end
    end
    if r1_232 == "MouseRClose" then
      if r0_232.ItemP1.expMouseR == -1 then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseRClose")
      else
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseR")
      end
    end
    if r1_232 == "MouseRConfig" then
      if r0_232.ItemP1.expMouseR == -1 then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseRConfig")
      else
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseR")
      end
    end
    if r1_232 == "MouseRSave" then
      if r0_232.ItemP1.expMouseR == -1 then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseRSave")
      else
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseR")
      end
    end
    if r1_232 == "MouseRLoad" then
      if r0_232.ItemP1.expMouseR == -1 then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseRLoad")
      else
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseR")
      end
    end
    if r1_232 == "MouseRBLog" then
      if r0_232.ItemP1.expMouseR == -1 then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseRBLog")
      else
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseR")
      end
    end
    if r1_232 == "MouseRMin" then
      if r0_232.ItemP1.expMouseR == -1 then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseRMin")
      else
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_RClick, -1, "expMouseR")
      end
    end
    if g_CASTOFF then
      if r1_232 == "CastOn" then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_CastOff, -1, "expCastOn")
      end
      if r1_232 == "CastOff" then
        r0_232:ItemSet(r0_232.ItemP1, r1_232, r0_232.ItemP1.Headline_CastOff, -1, "expCastOff")
      end
    end
    r0_232:OnCursorCheckItemP1(r1_232)
  end
  function g_Menu.Config.ptr.effectCfg1Preview(r0_233, r1_233, r2_233, r3_233, r4_233, r5_233)
    -- line: [8502, 8532] id: 233
    local r6_233 = cclass.lua_Layers:create()
    local r7_233 = getEffectRate()
    local r8_233 = "preview"
    if r1_233 ~= true then
      if r0_233.PageSlide then
        if r4_233 == false then
          local r9_233 = 0
          local r10_233 = 0
          local r11_233 = 0
          local r12_233 = 0
          r9_233, r10_233, r11_233, r12_233 = r6_233:getParam("configBase", r8_233, LUA_PARAM_POS, r9_233, r10_233, r11_233, r12_233)
          r6_233:setParam("configBase", r8_233, LUA_PARAM_POS, r9_233 - r2_233, r10_233, r11_233, r12_233)
          r6_233:setParam("configBase", r8_233, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_233:setEffect("configBase", r8_233, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_233, 0, r5_233)
        else
          r6_233:setEffect("configBase", r8_233, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_233, 0, r5_233)
        end
        r6_233:setEffect("configBase", r8_233, "ConfigPage", LUA_EFFECT_POS, r2_233, 0, 0, 0, 2, r3_233, 0, r5_233)
      elseif r4_233 == false then
        r6_233:setParam("configBase", r8_233, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r6_233:setEffect("configBase", r8_233, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_233, 0, r5_233)
      else
        r6_233:setEffect("configBase", r8_233, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_233, 0, r5_233)
      end
      r6_233:startEffect("configBase", r8_233, "ConfigPage", 0)
    end
  end
  function g_Menu.Config.ptr.updatePreviewSize(r0_234, r1_234)
    -- line: [8535, 8573] id: 234
    local r2_234 = cclass.lua_Layers:create()
    local r3_234 = 0
    local r4_234 = 0
    local r5_234 = 0
    r3_234, r4_234, r5_234, r6_234 = r2_234:getScreenAspect(r3_234, r4_234, r5_234, 0)
    local r7_234 = 0
    local r8_234 = 0
    r7_234, r8_234, r9_234, r10_234 = r2_234:getSubLayerParam("configBase", r1_234, r0_234.initConfigP1_BBase, LUA_PARAM_SIZE, r7_234, r8_234, 0, 0)
    if g_zoomMode == 3 then
      local r11_234 = APP_INTERNAL_WIDTH / r5_234
      r2_234:setParam("configBase", "preview", LUA_PARAM_SCALE, r11_234, r11_234, 1, 0)
      r2_234:setParam("configBase", "preview", LUA_PARAM_RECT, 0, 0, r7_234, r8_234)
    elseif r3_234 ~= 16 or r4_234 ~= 9 then
      if g_zoomMode == 0 then
        r2_234:setParam("configBase", "preview", LUA_PARAM_SCALE, 1, 1, 1, 0)
        r2_234:setParam("configBase", "preview", LUA_PARAM_RECT, 0, 0, r7_234, r8_234)
      elseif g_zoomMode == 1 then
        r2_234:setParam("configBase", "preview", LUA_PARAM_SCALE, 1, r7_234 / r3_234 * r4_234 / r8_234, 1, 0)
        r2_234:setParam("configBase", "preview", LUA_PARAM_RECT, 0, 0, r7_234, r8_234)
      elseif g_zoomMode == 2 then
        local r11_234 = r7_234 / r3_234 * r4_234 / r8_234
        r2_234:setParam("configBase", "preview", LUA_PARAM_SCALE, r11_234, r11_234, 1, 0)
        local r12_234 = (r7_234 * r11_234 - r7_234) * 1 / r11_234
        r2_234:setParam("configBase", "preview", LUA_PARAM_RECT, r12_234 / 2, 0, r7_234 - r12_234, r8_234)
      end
    else
      r2_234:setParam("configBase", "preview", LUA_PARAM_SCALE, 1, 1, 1, 0)
      r2_234:setParam("configBase", "preview", LUA_PARAM_RECT, 0, 0, r7_234, r8_234)
    end
  end
  function g_Menu.Config.ptr.Page2_SetActive(r0_235)
    -- line: [8579, 8628] id: 235
    if g_allskip == false then
      r0_235.ButtonP2.SkipRead:bt_SetActive(4)
      r0_235.ButtonP2.SkipAll:bt_SetActive(0)
    else
      r0_235.ButtonP2.SkipRead:bt_SetActive(0)
      r0_235.ButtonP2.SkipAll:bt_SetActive(4)
    end
    local r1_235 = cclass.lua_Layers:create()
    local r2_235 = ConfigGetPageKeyName(2)
    if g_selectReleaseSkip == true then
      r0_235.ButtonP2.SkipOptOn:bt_SetActive(4)
      r0_235.ButtonP2.SkipOptOff:bt_SetActive(0)
    else
      r0_235.ButtonP2.SkipOptOn:bt_SetActive(0)
      r0_235.ButtonP2.SkipOptOff:bt_SetActive(4)
    end
    if g_selectReleaseAuto == true then
      r0_235.ButtonP2.AutoOptOn:bt_SetActive(4)
      r0_235.ButtonP2.AutoOptOff:bt_SetActive(0)
    else
      r0_235.ButtonP2.AutoOptOn:bt_SetActive(0)
      r0_235.ButtonP2.AutoOptOff:bt_SetActive(4)
    end
    if g_ReadColorChange == true then
      r0_235.ButtonP2.ReadColorOn:bt_SetActive(4)
      r0_235.ButtonP2.ReadColorOff:bt_SetActive(0)
    else
      r0_235.ButtonP2.ReadColorOn:bt_SetActive(0)
      r0_235.ButtonP2.ReadColorOff:bt_SetActive(4)
    end
    r0_235.ButtonP2.SL_MsgSpeed:bt_SetParamX(g_msgspeed)
    r0_235.ButtonP2.SL_OpaWin:bt_SetParamX(g_messagealpha)
    r0_235.ButtonP2.SL_AutoSpeed:bt_SetParamX(g_autospeed)
    r0_235:SetSlideActP2(r0_235.MenuButton.selCursor)
  end
  function g_Menu.Config.ptr.P2_ButtonJobLD(r0_236, r1_236, r2_236, r3_236, r4_236)
    -- line: [8631, 8643] id: 236
    if r1_236 == 207 then
      r0_236.SliderMoveNo = r1_236
    end
    if r1_236 == 209 then
      r0_236.SliderMoveNo = r1_236
    end
    if r1_236 == 211 then
      r0_236.SliderMoveNo = r1_236
    end
  end
  function g_Menu.Config.ptr.P2_ButtonJobLU(r0_237, r1_237, r2_237, r3_237, r4_237)
    -- line: [8646, 8757] id: 237
    if r0_237.SliderMoveNo == 207 then
      g_msgspeed = r0_237.ButtonP2.SL_MsgSpeed:bt_GetParamX()
      if g_msgspeed > 100 then
        g_msgspeed = 100
      end
      r0_237.ButtonP2.SL_MsgSpeed:bt_SetParamX(g_msgspeed)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEMSGSPEED, 0)
      startCfg2Preview()
    end
    if r0_237.SliderMoveNo == 209 then
      g_messagealpha = r0_237.ButtonP2.SL_OpaWin:bt_GetParamX()
      r0_237.ButtonP2.SL_OpaWin:bt_SetParamX(g_messagealpha)
      r0_237:setCfg2WindowAlpa()
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin:changeMessageWindowOpacity()
      end
      if g_menuExecute == false then
        local r5_237 = cclass.lua_Layers:create()
        if g_CASTOFF then
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        end
        r5_237:setForceBG(true)
        g_P1Renew = 3
      end
    end
    if r0_237.SliderMoveNo == 211 then
      g_autospeed = r0_237.ButtonP2.SL_AutoSpeed:bt_GetParamX()
      r0_237.ButtonP2.SL_AutoSpeed:bt_SetParamX(g_autospeed)
    end
    if r1_237 == 201 then
      g_allskip = false
    end
    if r1_237 == 202 then
      g_allskip = true
    end
    if r1_237 == 203 then
      g_selectReleaseSkip = true
    end
    if r1_237 == 204 then
      g_selectReleaseSkip = false
    end
    if r1_237 == 205 then
      g_selectReleaseAuto = true
    end
    if r1_237 == 206 then
      g_selectReleaseAuto = false
    end
    if r1_237 == 213 then
      g_ReadColorChange = true
    end
    if r1_237 == 214 then
      g_ReadColorChange = false
    end
    if 201 <= r1_237 and r1_237 <= 300 or 201 <= r0_237.SliderMoveNo and r0_237.SliderMoveNo <= 300 then
      r0_237:Page2_SetActive()
      r0_237.SliderMoveNo = -1
      r0_237:DeleteConfigNo()
    end
    if r1_237 == 208 then
      local r5_237 = r0_237:MoveSliderBack(r0_237.ButtonP2.SL_MsgSpeed, r0_237.ButtonP2.SL_MsgSpeedBk, r3_237)
      g_msgspeed = r0_237.ButtonP2.SL_MsgSpeed:bt_GetParamX()
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEMSGSPEED, 0)
      startCfg2Preview()
    end
    if r1_237 == 210 then
      local r5_237 = r0_237:MoveSliderBack(r0_237.ButtonP2.SL_OpaWin, r0_237.ButtonP2.SL_OpaWinBk, r3_237)
      g_messagealpha = r0_237.ButtonP2.SL_OpaWin:bt_GetParamX()
      r0_237:setCfg2WindowAlpa()
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin:changeMessageWindowOpacity()
      end
      if g_menuExecute == false then
        local r6_237 = cclass.lua_Layers:create()
        if g_CASTOFF then
          cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
        end
        r6_237:setForceBG(true)
        g_P1Renew = 3
      end
    end
    if r1_237 == 212 then
      local r5_237 = r0_237:MoveSliderBack(r0_237.ButtonP2.SL_AutoSpeed, r0_237.ButtonP2.SL_AutoSpeedBk, r3_237)
      g_autospeed = r0_237.ButtonP2.SL_AutoSpeed:bt_GetParamX()
    end
  end
  function g_Menu.Config.ptr.MakeClkWait(r0_238, r1_238)
    -- line: [8760, 8769] id: 238
    if r0_238.P2IconKey ~= -1 then
      r1_238 = r0_238.P2IconKey
    end
    local r2_238 = cclass.lua_Layers:create()
    for r6_238 = 0, 65, 1 do
      r2_238:setAnimation("configBase", r1_238, "ClkWait", r6_238, 0.015151515151515152 * r6_238, 0)
    end
  end
  function g_Menu.Config.ptr.StartClkWait(r0_239)
    -- line: [8772, 8780] id: 239
    local r1_239 = cclass.lua_Layers:create()
    local r2_239 = ConfigGetPageKeyName(2)
    if r0_239.P2IconKey ~= -1 then
      r2_239 = r0_239.P2IconKey
    end
    r1_239:startAnimation("configBase", r2_239, "ClkWait", 2600, -1, 0)
  end
  function g_Menu.Config.ptr.StopClkWait(r0_240)
    -- line: [8783, 8792] id: 240
    local r1_240 = cclass.lua_Layers:create()
    local r2_240 = ConfigGetPageKeyName(2)
    if r0_240.P2IconKey ~= -1 then
      r2_240 = r0_240.P2IconKey
    end
    r1_240:stopAnimation("configBase", r2_240, "ClkWait")
  end
  g_Menu.Config.ptr.P2IconKey = -1
  function g_Menu.Config.ptr.initConfigP2(r0_241, r1_241, r2_241)
    -- line: [8796, 8940] id: 241
    if r2_241 == true then
      local r3_241 = cclass.lua_Layers:create()
      r0_241.P2IconKey = "P2Icon"
      r0_241:MenuLoadLayer(r0_241.P2IconKey, "Sys_ClickWait.pna")
      r3_241:setParam("configBase", r0_241.P2IconKey, LUA_PARAM_POS, 1000, 480, 0, 0)
      r3_241:initSubLayer("configBase", r1_241, 24, 1)
      r3_241:initSubLayer("configBase", r1_241, 25, 1)
      r3_241:initSubLayer("configBase", r1_241, 27, 1)
      r3_241:initSubLayer("configBase", r1_241, 28, 1)
      r3_241:initSubLayer("configBase", r1_241, 30, 1)
      r3_241:initSubLayer("configBase", r1_241, 31, 1)
      r3_241:initSubLayer("configBase", r1_241, 35, 0)
      r3_241:initSubLayer("configBase", r1_241, 36, 0)
      r3_241:initSubLayer("configBase", r1_241, 38, 0)
      r3_241:initSubLayer("configBase", r1_241, 39, 0)
      r3_241:initSubLayer("configBase", r1_241, 41, 0)
      r3_241:initSubLayer("configBase", r1_241, 42, 0)
      r3_241:initSubLayer("configBase", r1_241, 2, 1)
      r3_241:initSubLayer("configBase", r1_241, 113, 1)
      r0_241:setCfg2WindowAlpa()
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_MSGHIDE) == false then
        changeMessageWindow(-1, true)
      end
      local r4_241 = 0
      local r5_241 = 0
      local r6_241 = 0
      local r7_241 = 0
      local r8_241 = nil
      local r9_241 = nil
      r8_241, r9_241 = getConfigText()
      r3_241:insertTextLayer("configBase", r8_241, 960, 130, 100, 5, 100, 5, 0, 1)
      r3_241:setParam("configBase", r8_241, LUA_PARAM_POS, 170, 415, 0, 0)
      r3_241:insertTextLayer("configBase", r9_241, 550, 40, 100, 5, 100, 5, 0, 1)
      r3_241:setParam("configBase", r9_241, LUA_PARAM_POS, 170, 385, 0, 0)
      r0_241:MakeClkWait(r1_241)
      r0_241.ButtonP2 = {}
      r0_241:MenuButtonSet(r0_241.ButtonP2, "SkipRead", 1, r1_241, 55, 55, 63, 71, -1, 201, 0, 0)
      r0_241:MenuButtonSet(r0_241.ButtonP2, "SkipAll", 1, r1_241, 56, 56, 64, 72, -1, 202, 0, 0)
      r0_241:MenuButtonSet(r0_241.ButtonP2, "SkipOptOn", 1, r1_241, 57, 57, 65, 73, -1, 203, 0, 0)
      r0_241:MenuButtonSet(r0_241.ButtonP2, "SkipOptOff", 1, r1_241, 58, 58, 66, 74, -1, 204, 0, 0)
      r0_241:MenuButtonSet(r0_241.ButtonP2, "AutoOptOn", 1, r1_241, 59, 59, 67, 75, -1, 205, 0, 0)
      r0_241:MenuButtonSet(r0_241.ButtonP2, "AutoOptOff", 1, r1_241, 60, 60, 68, 76, -1, 206, 0, 0)
      r0_241:MenuButtonSet(r0_241.ButtonP2, "ReadColorOn", 1, r1_241, 103, 103, 95, 99, -1, 213, 0, 0)
      r0_241:MenuButtonSet(r0_241.ButtonP2, "ReadColorOff", 1, r1_241, 104, 104, 96, 100, -1, 214, 0, 0)
      r0_241:MenuMoveButtonSet(r0_241.ButtonP2, "SL_MsgSpeed", 1, r1_241, 23, 23, 34, -1, -1, 207, 0, 0)
      r0_241:MenuMoveButtonSet(r0_241.ButtonP2, "SL_OpaWin", 1, r1_241, 26, 26, 37, -1, -1, 209, 0, 0)
      r0_241:MenuMoveButtonSet(r0_241.ButtonP2, "SL_AutoSpeed", 1, r1_241, 29, 29, 40, -1, -1, 211, 0, 0)
      r0_241.ButtonP2.SL_MsgSpeed.se_click = -1
      r0_241.ButtonP2.SL_OpaWin.se_click = -1
      r0_241.ButtonP2.SL_AutoSpeed.se_click = -1
      r0_241:MenuButtonSet(r0_241.ButtonP2, "SL_MsgSpeedBk", 1, r1_241, 46, -1, -1, -1, -1, 208, 0, -1)
      r0_241:MenuButtonSet(r0_241.ButtonP2, "SL_OpaWinBk", 1, r1_241, 48, -1, -1, -1, -1, 210, 0, -1)
      r0_241:MenuButtonSet(r0_241.ButtonP2, "SL_AutoSpeedBk", 1, r1_241, 50, -1, -1, -1, -1, 212, 0, -1)
      r0_241.ButtonP2.SL_MsgSpeedBk.se_click = -1
      r0_241.ButtonP2.SL_OpaWinBk.se_click = -1
      r0_241.ButtonP2.SL_AutoSpeedBk.se_click = -1
      r0_241.MenuButton:InitList()
      r0_241.MenuButton:SetList("ButtonP2", r0_241.ButtonP2)
      r0_241.MenuButton:InitButton()
      r0_241:SetSliderParam(r0_241.ButtonP2.SL_MsgSpeed, 46, 45, 100, 0, g_msgspeed)
      r0_241:SetSliderParam(r0_241.ButtonP2.SL_OpaWin, 48, 47, 100, 0, g_messagealpha)
      r0_241:SetSliderParam(r0_241.ButtonP2.SL_AutoSpeed, 50, 49, 100, 0, g_autospeed)
      r0_241:Page2_SetActive()
      r0_241.ItemP2 = r0_241:ItemSetInit()
      r0_241.ItemP2.MsgSpeed = MenuItem.new("configBase", r1_241, 5, 13)
      r0_241.ItemP2.OpaWindow = MenuItem.new("configBase", r1_241, 6, 14)
      r0_241.ItemP2.SkipMsg = MenuItem.new("configBase", r1_241, 7, 15)
      r0_241.ItemP2.SkipOption = MenuItem.new("configBase", r1_241, 8, 16)
      r0_241.ItemP2.AutoPlay = MenuItem.new("configBase", r1_241, 9, 17)
      r0_241.ItemP2.AutoOption = MenuItem.new("configBase", r1_241, 10, 18)
      r0_241.ItemP2.ReadColor = MenuItem.new("configBase", r1_241, 91, 90)
      r0_241.ItemP2.Headline_MsgSpeed = "MsgSpeed"
      r0_241.ItemP2.Headline_OpaWindow = "OpaWindow"
      r0_241.ItemP2.Headline_SkipMsg = "SkipMsg"
      r0_241.ItemP2.Headline_SkipOption = "SkipOption"
      r0_241.ItemP2.Headline_AutoPlay = "AutoPlay"
      r0_241.ItemP2.Headline_AutoOption = "AutoOption"
      r0_241.ItemP2.Headline_ReadColor = "ReadColor"
      r0_241.ItemP2.expMsgSpeed = MenuItem.new("configBase", r1_241, -1, 86)
      r0_241.ItemP2.expOpaWindow = MenuItem.new("configBase", r1_241, -1, 85)
      r0_241.ItemP2.expSkipMsg = -1
      r0_241.ItemP2.expSkipMsgRead = MenuItem.new("configBase", r1_241, -1, 84)
      r0_241.ItemP2.expSkipMsgAll = MenuItem.new("configBase", r1_241, -1, 83)
      r0_241.ItemP2.expSkipOption = MenuItem.new("configBase", r1_241, -1, 82)
      r0_241.ItemP2.expAutoPlay = MenuItem.new("configBase", r1_241, -1, 81)
      r0_241.ItemP2.expAutoOption = MenuItem.new("configBase", r1_241, -1, 80)
      r0_241.ItemP2.expReadColor = MenuItem.new("configBase", r1_241, -1, 111)
      r0_241.autoModeTimer = AutoModeTimer.new()
      r0_241.autoModeTimer:reset()
    else
      r0_241:Page2_SetActive()
    end
  end
  function g_Menu.Config.ptr.deleteP2key(r0_242)
    -- line: [8943, 8954] id: 242
    local r1_242 = cclass.lua_Layers:create()
    local r2_242 = nil
    local r3_242 = nil
    r2_242, r3_242 = getConfigText()
    r1_242:removeLayer("configBase", r2_242)
    r1_242:removeLayer("configBase", r3_242)
    if r0_242.P2IconKey ~= -1 then
      r1_242:removeLayer("configBase", r0_242.P2IconKey)
    end
  end
  function g_Menu.Config.ptr.SetSlideActP2(r0_243, r1_243)
    -- line: [8957, 9026] id: 243
    local r2_243 = cclass.lua_Layers:create()
    local r3_243 = ConfigGetPageKeyName(2)
    local r4_243 = 0
    local r5_243 = 0
    local r6_243 = 0
    local r7_243 = 0
    local r8_243 = 0
    local r9_243 = nil
    local r10_243 = 0
    local r11_243 = 0
    if "SL_MsgSpeed" == r1_243 or "SL_MsgSpeedBk" == r1_243 then
      r10_243 = 0
      r11_243 = 1
    else
      r10_243 = 1
      r11_243 = 0
    end
    r2_243:setSubLayerVisible("configBase", r3_243, 24, r10_243)
    r2_243:setSubLayerVisible("configBase", r3_243, 25, r10_243)
    r2_243:setSubLayerVisible("configBase", r3_243, 35, r11_243)
    r2_243:setSubLayerVisible("configBase", r3_243, 36, r11_243)
    r4_243, r5_243, r6_243, r7_243 = r2_243:getSubLayerParam("configBase", r3_243, 2, LUA_PARAM_SIZE, 0, 0, 0, 0)
    r8_243, r9_243, r6_243, r7_243 = r2_243:getSubLayerParam("configBase", r3_243, 12, LUA_PARAM_SIZE, 0, 0, 0, 0)
    r4_243 = 13
    r8_243 = 203
    r9_243 = 13
    local r13_243 = (r8_243 - r4_243) * r0_243.ButtonP2.SL_MsgSpeed:bt_GetParamX() / 100 + r4_243 / 2
    r2_243:setSubLayerParam("configBase", r3_243, 24, LUA_PARAM_RECT, 0, 0, r13_243, r9_243)
    r2_243:setSubLayerParam("configBase", r3_243, 35, LUA_PARAM_RECT, 0, 0, r13_243, r9_243)
    if "SL_OpaWin" == r1_243 or "SL_OpaWinBk" == r1_243 then
      r10_243 = 0
      r11_243 = 1
    else
      r10_243 = 1
      r11_243 = 0
    end
    r2_243:setSubLayerVisible("configBase", r3_243, 27, r10_243)
    r2_243:setSubLayerVisible("configBase", r3_243, 28, r10_243)
    r2_243:setSubLayerVisible("configBase", r3_243, 38, r11_243)
    r2_243:setSubLayerVisible("configBase", r3_243, 39, r11_243)
    r13_243 = (r8_243 - r4_243) * r0_243.ButtonP2.SL_OpaWin:bt_GetParamX() / 100 + r4_243 / 2
    r2_243:setSubLayerParam("configBase", r3_243, 27, LUA_PARAM_RECT, 0, 0, r13_243, r9_243)
    r2_243:setSubLayerParam("configBase", r3_243, 38, LUA_PARAM_RECT, 0, 0, r13_243, r9_243)
    if "SL_AutoSpeed" == r1_243 or "SL_AutoSpeedBk" == r1_243 then
      r10_243 = 0
      r11_243 = 1
    else
      r10_243 = 1
      r11_243 = 0
    end
    r2_243:setSubLayerVisible("configBase", r3_243, 30, r10_243)
    r2_243:setSubLayerVisible("configBase", r3_243, 31, r10_243)
    r2_243:setSubLayerVisible("configBase", r3_243, 41, r11_243)
    r2_243:setSubLayerVisible("configBase", r3_243, 42, r11_243)
    r13_243 = (r8_243 - r4_243) * r0_243.ButtonP2.SL_AutoSpeed:bt_GetParamX() / 100 + r4_243 / 2
    r2_243:setSubLayerParam("configBase", r3_243, 30, LUA_PARAM_RECT, 0, 0, r13_243, r9_243)
    r2_243:setSubLayerParam("configBase", r3_243, 41, LUA_PARAM_RECT, 0, 0, r13_243, r9_243)
  end
  function g_Menu.Config.ptr.SelCursorP2(r0_244, r1_244, r2_244, r3_244)
    -- line: [9029, 9126] id: 244
    if r0_244.SliderMoveNo == 207 then
      local r4_244 = r0_244.ButtonP2.SL_MsgSpeed
      r0_244:DrawConfigNo(r4_244:bt_GetParamX(), r4_244.DRAW_POS.x + r4_244.EVENT_RECT.w / 2, r4_244.DRAW_POS.y - 20)
    end
    if r0_244.SliderMoveNo == 209 then
      local r4_244 = r0_244.ButtonP2.SL_OpaWin
      g_messagealpha = r4_244:bt_GetParamX()
      r4_244:bt_SetParamX(g_messagealpha)
      r0_244:DrawConfigNo(g_messagealpha, r4_244.DRAW_POS.x + r4_244.EVENT_RECT.w / 2, r4_244.DRAW_POS.y - 20)
      r0_244:setCfg2WindowAlpa()
    end
    if r0_244.SliderMoveNo == 211 then
      local r4_244 = r0_244.ButtonP2.SL_AutoSpeed
      r0_244:DrawConfigNo(r4_244:bt_GetParamX(), r4_244.DRAW_POS.x + r4_244.EVENT_RECT.w / 2, r4_244.DRAW_POS.y - 20)
    end
    r0_244:SetSlideActP2(r1_244)
    if r1_244 == -1 or r0_244.ItemP2.selCursor_selName ~= r1_244 then
      r0_244:ItemSet(r0_244.ItemP2, -1, -1, -1, -1)
    end
    if r1_244 == "SkipRead" then
      if r0_244.ItemP2.expSkipMsg ~= -1 then
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_SkipMsg, -1, "expSkipMsg")
      else
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_SkipMsg, -1, "expSkipMsgRead")
      end
    end
    if r1_244 == "SkipAll" then
      if r0_244.ItemP2.expSkipMsg ~= -1 then
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_SkipMsg, -1, "expSkipMsg")
      else
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_SkipMsg, -1, "expSkipMsgAll")
      end
    end
    if "SkipOptOn" == r1_244 or "SkipOptOff" == r1_244 then
      if r0_244.ItemP2.expSkipOption ~= -1 then
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_SkipMsg, r0_244.ItemP2.Headline_SkipOption, "expSkipOption")
      else
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_SkipMsg, r0_244.ItemP2.Headline_SkipOption, "expSkipMsg")
      end
    end
    if r1_244 == "AutoOptOn" then
      if r0_244.ItemP2.expAutoOption ~= -1 then
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_AutoPlay, r0_244.ItemP2.Headline_AutoOption, "expAutoOption")
      else
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_AutoPlay, r0_244.ItemP2.Headline_AutoOption, "expAutoPlay")
      end
    end
    if r1_244 == "AutoOptOff" then
      if r0_244.ItemP2.expAutoOption ~= -1 then
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_AutoPlay, r0_244.ItemP2.Headline_AutoOption, "expAutoOption")
      else
        r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_AutoPlay, r0_244.ItemP2.Headline_AutoOption, "expAutoPlay")
      end
    end
    if "SL_MsgSpeed" == r1_244 or "SL_MsgSpeedBk" == r1_244 then
      r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_MsgSpeed, -1, "expMsgSpeed")
    end
    if "SL_OpaWin" == r1_244 or "SL_OpaWinBk" == r1_244 then
      r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_OpaWindow, -1, "expOpaWindow")
    end
    if "SL_AutoSpeed" == r1_244 or "SL_AutoSpeedBk" == r1_244 then
      r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_AutoPlay, -1, "expAutoPlay")
    end
    if "ReadColorOn" == r1_244 and r0_244.ItemP2.expReadColor ~= -1 then
      r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_ReadColor, -1, "expReadColor")
    end
    if "ReadColorOff" == r1_244 and r0_244.ItemP2.expReadColor ~= -1 then
      r0_244:ItemSet(r0_244.ItemP2, r1_244, r0_244.ItemP2.Headline_ReadColor, -1, "expReadColor")
    end
  end
  function g_Menu.Config.ptr.setCfg2WindowAlpa(r0_245)
    -- line: [9129, 9153] id: 245
    cclass.lua_Layers:create():setSubLayerParam("configBase", ConfigGetPageKeyName(2), 2, LUA_PARAM_COLOR, 1, 1, 1, g_messagealpha / 100)
  end
  function g_Menu.Config.ptr.effectCfg2Text(r0_246, r1_246, r2_246, r3_246, r4_246, r5_246)
    -- line: [9158, 9215] id: 246
    local r6_246 = cclass.lua_Layers:create()
    local r7_246 = getEffectRate()
    local r8_246 = nil
    local r9_246 = nil
    r8_246, r9_246 = getConfigText()
    if r1_246 ~= true then
      if r0_246.PageSlide then
        if r4_246 == false then
          local r10_246 = 0
          local r11_246 = 0
          local r12_246 = 0
          local r13_246 = 0
          r10_246, r11_246, r12_246, r13_246 = r6_246:getParam("configBase", r8_246, LUA_PARAM_POS, r10_246, r11_246, r12_246, r13_246)
          r6_246:setParam("configBase", r8_246, LUA_PARAM_POS, r10_246 - r2_246, r11_246, r12_246, r13_246)
          r6_246:setParam("configBase", r8_246, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_246:setEffect("configBase", r8_246, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_246, 0, r5_246)
          r10_246, r11_246, r12_246, r13_246 = r6_246:getParam("configBase", r9_246, LUA_PARAM_POS, r10_246, r11_246, r12_246, r13_246)
          r6_246:setParam("configBase", r9_246, LUA_PARAM_POS, r10_246 - r2_246, r11_246, r12_246, r13_246)
          r6_246:setParam("configBase", r9_246, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_246:setEffect("configBase", r9_246, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_246, 0, r5_246)
        else
          r6_246:setEffect("configBase", r8_246, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_246, 0, r5_246)
          r6_246:setEffect("configBase", r9_246, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_246, 0, r5_246)
        end
        r6_246:setEffect("configBase", r8_246, "ConfigPage", LUA_EFFECT_POS, r2_246, 0, 0, 0, 0, r3_246, 0, r5_246)
        r6_246:setEffect("configBase", r9_246, "ConfigPage", LUA_EFFECT_POS, r2_246, 0, 0, 0, 0, r3_246, 0, r5_246)
      elseif r4_246 ~= false then
        r6_246:setEffect("configBase", r8_246, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_246, 0, r5_246)
        r6_246:setEffect("configBase", r9_246, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_246, 0, r5_246)
      end
      r6_246:startEffect("configBase", r8_246, "ConfigPage", 0)
      r6_246:startEffect("configBase", r9_246, "ConfigPage", 0)
      if r0_246.P2IconKey ~= -1 then
        if r4_246 == false then
          r6_246:setParam("configBase", r0_246.P2IconKey, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_246:setEffect("configBase", r0_246.P2IconKey, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_246, 0, r5_246)
        else
          r6_246:setParam("configBase", r0_246.P2IconKey, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r6_246:setEffect("configBase", r0_246.P2IconKey, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_246, 0, r5_246)
        end
        r6_246:startEffect("configBase", r0_246.P2IconKey, "ConfigPage", 0)
      end
    end
  end
  g_Menu.Config.ptr.selChar = 0
  function g_Menu.Config.ptr.Page3_SetActive(r0_247, r1_247)
    -- line: [9222, 9322] id: 247
    local r2_247 = cclass.lua_Layers:create()
    if g_clickVoice == true then
      r0_247.ButtonP3.VoiceSkipOn:bt_SetActive(4)
      r0_247.ButtonP3.VoiceSkipOff:bt_SetActive(0)
    else
      r0_247.ButtonP3.VoiceSkipOn:bt_SetActive(0)
      r0_247.ButtonP3.VoiceSkipOff:bt_SetActive(4)
    end
    if g_enablePan == true then
      r0_247.ButtonP3.VoiceRLOn:bt_SetActive(4)
      r0_247.ButtonP3.VoiceRLOff:bt_SetActive(0)
    else
      r0_247.ButtonP3.VoiceRLOn:bt_SetActive(0)
      r0_247.ButtonP3.VoiceRLOff:bt_SetActive(4)
    end
    if r0_247.selChar <= 0 then
      for r6_247 = 0, r0_247.selCharMax - 1, 1 do
        if r0_247.CharEnableList[r6_247 + 1] == true then
          r0_247.selChar = r6_247 + 1
          break
        end
      end
    end
    if r0_247.CharAllDisable == true then
      r0_247.ButtonP3.SysVoiceEx:bt_SetActive(2)
      r0_247.ButtonP3.SysVoiceRa:bt_SetActive(2)
    else
      if g_sysVoiceChar == 999 then
        r0_247.ButtonP3.SysVoiceRa:bt_SetActive(4)
      else
        r0_247.ButtonP3.SysVoiceRa:bt_SetActive(0)
      end
      if g_TrialFlag == 0 then
        if r0_247.selChar <= r0_247.selCharMax - 2 then
          if r0_247.selChar == g_sysVoiceChar then
            r0_247.ButtonP3.SysVoiceEx:bt_SetActive(4)
          else
            r0_247.ButtonP3.SysVoiceEx:bt_SetActive(0)
          end
        else
          r0_247.ButtonP3.SysVoiceEx:bt_SetActive(2)
        end
      elseif r0_247.selChar <= 7 then
        if r0_247.selChar == g_sysVoiceChar then
          r0_247.ButtonP3.SysVoiceEx:bt_SetActive(4)
        else
          r0_247.ButtonP3.SysVoiceEx:bt_SetActive(0)
        end
      else
        r0_247.ButtonP3.SysVoiceEx:bt_SetActive(2)
      end
    end
    r0_247:SetCharBaseActP3(r1_247)
    r0_247.ButtonP3.SL_MasterVol:bt_SetParamX(g_mixer:getMasterVolume())
    r0_247.ButtonP3.SL_BgmVol:bt_SetParamX(g_volume[getSoundIndex("bgm")].vol / 10)
    r0_247.ButtonP3.SL_SeVol:bt_SetParamX(g_volume[getSoundIndex("se")].vol / 10)
    r0_247.ButtonP3.SL_MovieVol:bt_SetParamX(g_volume[getSoundIndex("movie")].vol / 10)
    r0_247.ButtonP3.SL_VoiceVol:bt_SetParamX(g_volume[getSoundIndex("char")].vol / 10)
    r0_247.ButtonP3.SL_VoiceBgmVol:bt_SetParamX(g_bgmCutPer)
    if r0_247.CharAllDisable == false then
      r0_247.ButtonP3.SL_CharVol:bt_SetParamX(g_volume[r0_247:getPersonalIndex()].vol / 10)
    end
    r0_247.ButtonP3.SL_SysSeVol:bt_SetParamX(g_volume[getSoundIndex("systemse")].vol / 10)
    r0_247:SetSlideActP3(r0_247.MenuButton.selCursor)
  end
  function g_Menu.Config.ptr.P3_ButtonJobLD(r0_248, r1_248, r2_248, r3_248, r4_248)
    -- line: [9326, 9375] id: 248
    if r1_248 == 308 then
      r0_248.SliderMoveNo = r1_248
    end
    if r1_248 == 310 then
      r0_248.SliderMoveNo = r1_248
    end
    if r1_248 == 312 then
      r0_248.SliderMoveNo = r1_248
    end
    if r1_248 == 314 then
      r0_248.SliderMoveNo = r1_248
    end
    if r1_248 == 316 then
      r0_248.SliderMoveNo = r1_248
    end
    if r1_248 == 318 then
      r0_248.SliderMoveNo = r1_248
    end
    if r1_248 == 322 then
      r0_248.SliderMoveNo = r1_248
    end
    if r1_248 == 320 then
      r0_248.SliderMoveNo = r1_248
    end
    if r1_248 == 324 then
      r0_248.SliderMoveNo = r1_248
    end
    if r1_248 == 326 then
      r0_248.SliderMoveNo = r1_248
    end
  end
  function g_Menu.Config.ptr.P3_ButtonJobLU(r0_249, r1_249, r2_249, r3_249, r4_249)
    -- line: [9378, 9752] id: 249
    if r0_249.SliderMoveNo == 308 then
      local r5_249 = r0_249.ButtonP3.SL_MasterVol:bt_GetParamX()
      r0_249.ButtonP3.SL_MasterVol:bt_SetParamX(r5_249)
      if g_mixer:getMasterMute() == true then
        g_mixer:setMasterMute(false)
      end
      g_mixer:setMasterVolume(r5_249)
    end
    if r0_249.SliderMoveNo == 310 then
      local r5_249 = r0_249.ButtonP3.SL_BgmVol:bt_GetParamX()
      r0_249.ButtonP3.SL_BgmVol:bt_SetParamX(r5_249)
      g_volume[getSoundIndex("bgm")].vol = r5_249 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgm")
    end
    if r0_249.SliderMoveNo == 312 then
      local r5_249 = r0_249.ButtonP3.SL_SeVol:bt_GetParamX()
      r0_249.ButtonP3.SL_SeVol:bt_SetParamX(r5_249)
      g_volume[getSoundIndex("se")].vol = r5_249 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("se")
      r0_249:SetTestSeVol(g_volume[getSoundIndex("se")].vol)
    end
    if r0_249.SliderMoveNo == 324 then
      local r5_249 = r0_249.ButtonP3.SL_SysSeVol:bt_GetParamX()
      r0_249.ButtonP3.SL_SysSeVol:bt_SetParamX(r5_249)
      g_volume[getSoundIndex("systemse")].vol = r5_249 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
    end
    if r0_249.SliderMoveNo == 314 then
      local r5_249 = r0_249.ButtonP3.SL_MovieVol:bt_GetParamX()
      r0_249.ButtonP3.SL_MovieVol:bt_SetParamX(r5_249)
      g_volume[getSoundIndex("movie")].vol = r5_249 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("movie")
    end
    if r0_249.SliderMoveNo == 316 then
      local r5_249 = r0_249.ButtonP3.SL_VoiceVol:bt_GetParamX()
      r0_249.ButtonP3.SL_VoiceVol:bt_SetParamX(r5_249)
      g_volume[getSoundIndex("char")].vol = r5_249 * 10
      for r9_249 = getSoundIndex("char") + 1, #g_volume, 1 do
        g_volume[r9_249].vol = r5_249 * 10
      end
      cfunc.LegacyGame__lua_NeedVolumeUpdate("char")
      for r9_249, r10_249 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_249)
      end
      r0_249:SetTestVoiceVol(g_volume[getSoundIndex("char")].vol)
      g_volume[getSoundIndex("systemVoice")].vol = g_volume[getSoundIndex("char")].vol
      r0_249:PlayTestVoice(999, getSoundVolume("char"))
    end
    if r0_249.SliderMoveNo == 326 then
      local r5_249 = r0_249.ButtonP3.SL_SysVoiceVol:bt_GetParamX()
      r0_249.ButtonP3.SL_SysVoiceVol:bt_SetParamX(r5_249)
      g_volume[getSoundIndex("systemVoice")].vol = r5_249 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
    end
    if r0_249.SliderMoveNo == 322 then
      local r5_249 = r0_249.ButtonP3.SL_BgvVol:bt_GetParamX()
      r0_249.ButtonP3.SL_BgvVol:bt_SetParamX(r5_249)
      g_volume[getSoundIndex("bgv")].vol = r5_249 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgv")
      for r9_249, r10_249 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_249)
      end
    end
    if r0_249.SliderMoveNo == 318 then
      local r5_249 = r0_249.ButtonP3.SL_VoiceBgmVol:bt_GetParamX()
      r0_249.ButtonP3.SL_VoiceBgmVol:bt_SetParamX(r5_249)
      g_bgmCutPer = r5_249
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
    end
    if r0_249.SliderMoveNo == 320 then
      local r5_249 = r0_249.ButtonP3.SL_CharVol:bt_GetParamX()
      r0_249.ButtonP3.SL_CharVol:bt_SetParamX(r5_249)
      g_volume[r0_249:getPersonalIndex()].vol = r5_249 * 10
      r0_249:SetTestVoiceVol(g_volume[r0_249:getPersonalIndex()].vol)
      local r6_249 = nil
      local r7_249 = nil
      local r8_249 = 0
      r6_249, r7_249 = string.find(g_volume[r0_249:getPersonalIndex()].name, "charOtherM")
      if r6_249 ~= nil then
        r8_249 = 1
      end
      r6_249, r7_249 = string.find(g_volume[r0_249:getPersonalIndex()].name, "charOtherF")
      if r6_249 ~= nil then
        r8_249 = 2
      end
      r6_249, r7_249 = string.find(g_volume[r0_249:getPersonalIndex()].name, "charMAN")
      if r6_249 ~= nil then
        r8_249 = 3
      end
      r6_249, r7_249 = string.find(g_volume[r0_249:getPersonalIndex()].name, "charWOMAN")
      if r6_249 ~= nil then
        r8_249 = 4
      end
      if r8_249 == 0 then
        cfunc.LegacyGame__lua_NeedVolumeUpdate(g_volume[r0_249:getPersonalIndex()].name)
      elseif r8_249 == 1 then
        for r12_249 = 1, #g_charKeysOtherM, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r12_249])
        end
      elseif r8_249 == 2 then
        for r12_249 = 1, #g_charKeysOtherF, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r12_249])
        end
      elseif r8_249 == 3 then
        for r12_249 = 1, #g_volumeID_MAN, 1 do
          g_volume[getSoundIndex("char") + g_volumeID_MAN[r12_249]].vol = g_volume[r0_249:getPersonalIndex()].vol
        end
        for r12_249 = 1, #g_charKeysOtherMAN, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherMAN[r12_249])
        end
        for r12_249 = 1, #g_charKeysOtherM, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r12_249])
        end
      elseif r8_249 == 4 then
        for r12_249 = 1, #g_volumeID_WOMAN, 1 do
          g_volume[getSoundIndex("char") + g_volumeID_WOMAN[r12_249]].vol = g_volume[r0_249:getPersonalIndex()].vol
        end
        for r12_249 = 1, #g_charKeysOtherWOMAN, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherWOMAN[r12_249])
        end
        for r12_249 = 1, #g_charKeysOtherF, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r12_249])
        end
      end
      for r12_249, r13_249 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r12_249)
      end
      r0_249:PlayTestVoice(r0_249.selChar, g_volume[r0_249:getPersonalIndex()].vol)
    end
    if r1_249 == 301 then
      g_clickVoice = true
    end
    if r1_249 == 302 then
      g_clickVoice = false
    end
    if r1_249 == 303 then
      g_enablePan = true
    end
    if r1_249 == 304 then
      g_enablePan = false
    end
    if r1_249 == 305 then
      g_bgvVoiceMute = true
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGV, 0)
    end
    if r1_249 == 306 then
      g_bgvVoiceMute = false
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGV, 0)
    end
    if 330 <= r1_249 and r1_249 <= 330 + r0_249.selCharMax then
      r0_249.selChar = r1_249 - 330 + 1
      r0_249:StopTestVoice()
    end
    if r1_249 == 309 then
      local r5_249 = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_MasterVol, r0_249.ButtonP3.SL_MasterVolBk, r3_249)
      if g_mixer:getMasterMute() == true then
        g_mixer:setMasterMute(false)
      end
      g_mixer:setMasterVolume(r5_249)
    end
    if r1_249 == 311 then
      g_volume[getSoundIndex("bgm")].vol = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_BgmVol, r0_249.ButtonP3.SL_BgmVolBk, r3_249) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgm")
    end
    if r1_249 == 313 then
      g_volume[getSoundIndex("se")].vol = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_SeVol, r0_249.ButtonP3.SL_SeVolBk, r3_249) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("se")
      r0_249:SetTestSeVol(g_volume[getSoundIndex("se")].vol)
    end
    if r1_249 == 315 then
      g_volume[getSoundIndex("movie")].vol = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_MovieVol, r0_249.ButtonP3.SL_MovieVolBk, r3_249) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("movie")
    end
    if r1_249 == 317 then
      local r5_249 = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_VoiceVol, r0_249.ButtonP3.SL_VoiceVolBk, r3_249)
      g_volume[getSoundIndex("char")].vol = r5_249 * 10
      for r9_249 = getSoundIndex("char") + 1, #g_volume, 1 do
        g_volume[r9_249].vol = r5_249 * 10
      end
      cfunc.LegacyGame__lua_NeedVolumeUpdate("char")
      for r9_249, r10_249 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_249)
      end
      r0_249:SetTestVoiceVol(g_volume[getSoundIndex("char")].vol)
      g_volume[getSoundIndex("systemVoice")].vol = g_volume[getSoundIndex("char")].vol
      r0_249:PlayTestVoice(999, getSoundVolume("char"))
    end
    if r1_249 == 323 then
      g_volume[getSoundIndex("bgv")].vol = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_BgvVol, r0_249.ButtonP3.SL_BgvVolBk, r3_249) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("bgv")
      for r9_249, r10_249 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r9_249)
      end
    end
    if r1_249 == 319 then
      g_bgmCutPer = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_VoiceBgmVol, r0_249.ButtonP3.SL_VoiceBgmVolBk, r3_249)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
    end
    if r1_249 == 321 then
      g_volume[r0_249:getPersonalIndex()].vol = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_CharVol, r0_249.ButtonP3.SL_CharVolBk, r3_249) * 10
      local r6_249 = nil
      local r7_249 = nil
      local r8_249 = 0
      r6_249, r7_249 = string.find(g_volume[r0_249:getPersonalIndex()].name, "charOtherM")
      if r6_249 ~= nil then
        r8_249 = 1
      end
      r6_249, r7_249 = string.find(g_volume[r0_249:getPersonalIndex()].name, "charOtherF")
      if r6_249 ~= nil then
        r8_249 = 2
      end
      if r8_249 == 0 then
        cfunc.LegacyGame__lua_NeedVolumeUpdate(g_volume[r0_249:getPersonalIndex()].name)
      elseif r8_249 == 1 then
        for r12_249 = 1, #g_charKeysOtherM, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherM[r12_249])
        end
      else
        for r12_249 = 1, #g_charKeysOtherF, 1 do
          cfunc.LegacyGame__lua_NeedVolumeUpdate(g_charKeysOtherF[r12_249])
        end
      end
      for r12_249, r13_249 in pairs(g_BgvKeyToVolkey) do
        cfunc.LegacyGame__lua_NeedVolumeUpdate(r12_249)
      end
      r0_249:PlayTestVoice(r0_249.selChar, g_volume[r0_249:getPersonalIndex()].vol)
    end
    if r1_249 == 324 then
      local r5_249 = r0_249.ButtonP3.SL_SysSeVol:bt_GetParamX()
      r0_249.ButtonP3.SL_SysSeVol:bt_SetParamX(r5_249)
      g_volume[getSoundIndex("systemse")].vol = r5_249 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
    end
    if r1_249 == 325 then
      g_volume[getSoundIndex("systemse")].vol = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_SysSeVol, r0_249.ButtonP3.SL_SysSeVolBk, r3_249) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemse")
    end
    if r1_249 == 326 then
      local r5_249 = r0_249.ButtonP3.SL_SysVoiceVol:bt_GetParamX()
      r0_249.ButtonP3.SL_SysVoiceVol:bt_SetParamX(r5_249)
      g_volume[getSoundIndex("systemVoice")].vol = r5_249 * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
    end
    if r1_249 == 327 then
      g_volume[getSoundIndex("systemVoice")].vol = r0_249:MoveSliderBack(r0_249.ButtonP3.SL_SysVoiceVol, r0_249.ButtonP3.SL_SysVoiceVolBk, r3_249) * 10
      cfunc.LegacyGame__lua_NeedVolumeUpdate("systemVoice")
    end
    if r1_249 == 360 and 1 <= r0_249.selChar then
      g_sysVoiceChar = r0_249.selChar
    end
    if r1_249 == 361 then
      g_sysVoiceChar = 999
    end
    if r1_249 == 362 then
    end
    if r1_249 == 363 then
      r0_249:PlayTestVoice(g_sysVoiceChar, getSoundVolume("char"))
    end
    if r1_249 == 364 then
      r0_249:PlayTestVoice(r0_249.selChar, g_volume[r0_249:getPersonalIndex()].vol)
    end
    if 301 <= r1_249 and r1_249 <= 400 or 301 <= r0_249.SliderMoveNo and r0_249.SliderMoveNo <= 400 then
      r0_249:Page3_SetActive(ConfigGetPageKeyName(3))
      r0_249.SliderMoveNo = -1
      r0_249:DeleteConfigNo()
    end
  end
  g_Menu.Config.ptr.P3_Voice = {}
  function g_Menu.Config.ptr.PlayTestVoice(r0_250, r1_250, r2_250)
    -- line: [9758, 9845] id: 250
    if r1_250 <= 0 then
      return 
    end
    if r0_250.CharAllDisable == true then
      return 
    end
    local r4_250 = -1
    r4_250 = {
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
    if r1_250 == 999 then
      local r5_250 = 0
      for r9_250, r10_250 in pairs(r0_250.CharEnableList) do
        if r10_250 == true then
          r5_250 = r5_250 + 1
        end
      end
      if r5_250 <= 0 then
        return 
      end
      local r6_250 = math.random(1, r5_250)
      r5_250 = 1
      for r10_250, r11_250 in pairs(r0_250.CharEnableList) do
        if r11_250 == true then
          if r5_250 == r6_250 then
            r1_250 = r10_250
            break
          else
            r5_250 = r5_250 + 1
          end
        end
      end
    end
    if #g_charKeys < r1_250 then
      return 
    end
    local r3_250 = r4_250[r1_250][1]
    if r3_250 ~= nil then
      r0_250:SetTestVoiceVol(r2_250)
      local r6_250 = cclass.lua_Sounds:new()
      r6_250:SndStop("ConfTestVoice")
      r6_250:SndPlay("ConfTestVoice", getSoundArcFileName("systemVoice", r3_250), r3_250, r2_250)
      r6_250:delete()
    end
  end
  function g_Menu.Config.ptr.StopTestVoice(r0_251)
    -- line: [9848, 9852] id: 251
    local r1_251 = cclass.lua_Sounds:new()
    r1_251:SndStop("ConfTestVoice")
    r1_251:delete()
  end
  function g_Menu.Config.ptr.SetTestVoiceVol(r0_252, r1_252)
    -- line: [9855, 9858] id: 252
    g_ConfigVoiceVolume = r1_252
    cfunc.LegacyGame__lua_NeedVolumeUpdate("ConfTestVoice")
  end
  function g_Menu.Config.ptr.PlayTestSe(r0_253, r1_253)
    -- line: [9862, 9869] id: 253
  end
  function g_Menu.Config.ptr.StopTestSe(r0_254)
    -- line: [9871, 9875] id: 254
  end
  function g_Menu.Config.ptr.SetTestSeVol(r0_255, r1_255)
    -- line: [9878, 9881] id: 255
  end
  function g_Menu.Config.ptr.PlayTestSystemVoice(r0_256, r1_256)
    -- line: [9885, 9891] id: 256
  end
  function g_Menu.Config.ptr.StopTestSystemVoice(r0_257)
    -- line: [9894, 9898] id: 257
  end
  function g_Menu.Config.ptr.getPersonalIndex(r0_258)
    -- line: [9903, 9905] id: 258
    return getSoundIndex("char") + r0_258.selChar
  end
  function g_Menu.Config.ptr.SetCharBaseActP3(r0_259, r1_259)
    -- line: [9909, 9964] id: 259
    local r2_259 = cclass.lua_Layers:create()
    for r6_259 = 0, r0_259.selCharMax - 1, 1 do
      local r7_259 = string.format("VoiceChar%03d", r6_259 + 1)
      local r8_259 = -1
      local r9_259 = -1
      r8_259, r9_259 = r0_259:GetCharBaseLayerP3(r6_259)
      if r0_259.CharEnableList[r6_259 + 1] == true then
        if r0_259.selChar == r6_259 + 1 then
          r0_259.ButtonP3[r7_259]:bt_SetActive(4)
          if r8_259 ~= -1 then
            r2_259:setSubLayerVisible("configBase", r1_259, r8_259, 1)
          end
          if r9_259 ~= -1 then
            r2_259:setSubLayerVisible("configBase", r1_259, r9_259, 1)
          end
        else
          r0_259.ButtonP3[r7_259]:bt_SetActive(0)
          if r8_259 ~= -1 then
            r2_259:setSubLayerVisible("configBase", r1_259, r8_259, 0)
          end
          if r9_259 ~= -1 then
            r2_259:setSubLayerVisible("configBase", r1_259, r9_259, 0)
          end
        end
      else
        r0_259.ButtonP3[r7_259]:bt_SetActive(2)
        if r8_259 ~= -1 then
          r2_259:setSubLayerVisible("configBase", r1_259, r8_259, 0)
        end
        if r9_259 ~= -1 then
          r2_259:setSubLayerVisible("configBase", r1_259, r9_259, 0)
        end
      end
    end
    if r0_259.CharAllDisable == true then
      r2_259:setSubLayerVisible("configBase", r1_259, 281, 1)
    else
      r2_259:setSubLayerVisible("configBase", r1_259, 281, 0)
    end
  end
  function g_Menu.Config.ptr.GetCharBaseLayerP3(r0_260, r1_260)
    -- line: [9967, 9973] id: 260
    return 327 - r1_260, 303 - r1_260
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
    1
  }
  function g_Menu.Config.ptr.initConfigP3(r0_261, r1_261, r2_261)
    -- line: [9981, 10323] id: 261
    if r2_261 == true then
      local r3_261 = cclass.lua_Layers:create()
      r3_261:initSubLayer("configBase", r1_261, 5, 1)
      r3_261:initSubLayer("configBase", r1_261, 6, 1)
      r3_261:initSubLayer("configBase", r1_261, 10, 1)
      r3_261:initSubLayer("configBase", r1_261, 11, 1)
      r3_261:initSubLayer("configBase", r1_261, 21, 1)
      r3_261:initSubLayer("configBase", r1_261, 22, 1)
      r3_261:initSubLayer("configBase", r1_261, 26, 1)
      r3_261:initSubLayer("configBase", r1_261, 27, 1)
      r3_261:initSubLayer("configBase", r1_261, 37, 1)
      r3_261:initSubLayer("configBase", r1_261, 38, 1)
      r3_261:initSubLayer("configBase", r1_261, 42, 1)
      r3_261:initSubLayer("configBase", r1_261, 43, 1)
      r3_261:initSubLayer("configBase", r1_261, 53, 1)
      r3_261:initSubLayer("configBase", r1_261, 54, 1)
      r3_261:initSubLayer("configBase", r1_261, 58, 1)
      r3_261:initSubLayer("configBase", r1_261, 59, 1)
      r3_261:initSubLayer("configBase", r1_261, 69, 1)
      r3_261:initSubLayer("configBase", r1_261, 70, 1)
      r3_261:initSubLayer("configBase", r1_261, 74, 1)
      r3_261:initSubLayer("configBase", r1_261, 75, 1)
      r3_261:initSubLayer("configBase", r1_261, 85, 1)
      r3_261:initSubLayer("configBase", r1_261, 86, 1)
      r3_261:initSubLayer("configBase", r1_261, 90, 1)
      r3_261:initSubLayer("configBase", r1_261, 91, 1)
      r3_261:initSubLayer("configBase", r1_261, 101, 1)
      r3_261:initSubLayer("configBase", r1_261, 102, 1)
      r3_261:initSubLayer("configBase", r1_261, 106, 1)
      r3_261:initSubLayer("configBase", r1_261, 107, 1)
      r3_261:initSubLayer("configBase", r1_261, 329, 1)
      r3_261:initSubLayer("configBase", r1_261, 346, 1)
      r0_261.ButtonP3 = {}
      r0_261:MenuButtonSet(r0_261.ButtonP3, "VoiceSkipOn", 1, r1_261, 157, 157, 173, 165, -1, 301, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "VoiceSkipOff", 1, r1_261, 158, 158, 174, 166, -1, 302, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "VoiceRLOn", 1, r1_261, 159, 159, 175, 167, -1, 303, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "VoiceRLOff", 1, r1_261, 160, 160, 176, 168, -1, 304, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "SysVoiceEx", 1, r1_261, 161, 161, 177, 169, 355, 360, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "SysVoiceRa", 1, r1_261, 162, 162, 178, 170, 356, 361, 0, 0)
      r0_261.CharAllDisable = true
      r0_261.selChar = 0
      for r7_261 = 0, r0_261.selCharMax - 1, 1 do
        r0_261.CharEnableList[r7_261 + 1] = cfunc.LegacyGame__lua_GetFlag(1010 + r7_261)
        if r0_261.CharEnableList[r7_261 + 1] == true then
          r0_261.CharAllDisable = false
        end
        local r9_261 = -1
        local r10_261 = -1
        r9_261, r10_261 = r0_261:GetCharBaseLayerP3(r7_261)
        if r9_261 ~= -1 then
          r3_261:initSubLayer("configBase", r1_261, r9_261, 1)
        end
        if r10_261 ~= -1 then
          r3_261:initSubLayer("configBase", r1_261, r10_261, 1)
        end
        local r11_261 = string.format("VoiceChar%03d", r7_261 + 1)
        local r12_261 = 183 + r7_261
        r0_261:MenuButtonSet(r0_261.ButtonP3, r11_261, 1, r1_261, r12_261, r12_261, 231 + r7_261, 207 + r7_261, 255 + r7_261, 330 + r7_261, 0, 0)
      end
      r3_261:initSubLayer("configBase", r1_261, 281, 0)
      r0_261:MenuMoveButtonSet(r0_261.ButtonP3, "SL_MasterVol", 1, r1_261, 4, 4, 9, -1, -1, 308, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "SL_MasterVolBk", 1, r1_261, 14, -1, -1, -1, -1, 309, 0, -1)
      r0_261.ButtonP3.SL_MasterVol.se_click = -1
      r0_261.ButtonP3.SL_MasterVolBk.se_click = -1
      r0_261:MenuMoveButtonSet(r0_261.ButtonP3, "SL_SysSeVol", 1, r1_261, 20, 20, 25, -1, -1, 324, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "SL_SysSeVolBk", 1, r1_261, 30, -1, -1, -1, -1, 325, 0, -1)
      r0_261.ButtonP3.SL_SysSeVol.se_click = -1
      r0_261.ButtonP3.SL_SysSeVolBk.se_click = -1
      r0_261:MenuMoveButtonSet(r0_261.ButtonP3, "SL_BgmVol", 1, r1_261, 36, 36, 41, -1, -1, 310, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "SL_BgmVolBk", 1, r1_261, 46, -1, -1, -1, -1, 311, 0, -1)
      r0_261.ButtonP3.SL_BgmVol.se_click = -1
      r0_261.ButtonP3.SL_BgmVolBk.se_click = -1
      r0_261:MenuMoveButtonSet(r0_261.ButtonP3, "SL_SeVol", 1, r1_261, 52, 52, 57, -1, -1, 312, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "SL_SeVolBk", 1, r1_261, 62, -1, -1, -1, -1, 313, 0, -1)
      r0_261.ButtonP3.SL_SeVol.se_click = -1
      r0_261.ButtonP3.SL_SeVolBk.se_click = -1
      r0_261:MenuMoveButtonSet(r0_261.ButtonP3, "SL_MovieVol", 1, r1_261, 68, 68, 73, -1, -1, 314, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "SL_MovieVolBk", 1, r1_261, 78, -1, -1, -1, -1, 315, 0, -1)
      r0_261.ButtonP3.SL_MovieVol.se_click = -1
      r0_261.ButtonP3.SL_MovieVolBk.se_click = -1
      r0_261:MenuMoveButtonSet(r0_261.ButtonP3, "SL_VoiceVol", 1, r1_261, 84, 84, 89, -1, -1, 316, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "SL_VoiceVolBk", 1, r1_261, 94, -1, -1, -1, -1, 317, 0, -1)
      r0_261.ButtonP3.SL_VoiceVol.se_click = -1
      r0_261.ButtonP3.SL_VoiceVolBk.se_click = -1
      r0_261:MenuMoveButtonSet(r0_261.ButtonP3, "SL_VoiceBgmVol", 1, r1_261, 100, 100, 105, -1, -1, 318, 0, 0)
      r0_261:MenuButtonSet(r0_261.ButtonP3, "SL_VoiceBgmVolBk", 1, r1_261, 110, -1, -1, -1, -1, 319, 0, -1)
      r0_261.ButtonP3.SL_VoiceBgmVol.se_click = -1
      r0_261.ButtonP3.SL_VoiceBgmVolBk.se_click = -1
      if r0_261.CharAllDisable == false then
        r0_261:MenuMoveButtonSet(r0_261.ButtonP3, "SL_CharVol", 1, r1_261, 116, 116, 121, -1, -1, 320, 0, 0)
        r0_261:MenuButtonSet(r0_261.ButtonP3, "SL_CharVolBk", 1, r1_261, 126, -1, -1, -1, -1, 321, 0, -1)
        r0_261.ButtonP3.SL_CharVol.se_click = -1
        r0_261.ButtonP3.SL_CharVolBk.se_click = -1
        r3_261:initSubLayer("configBase", r1_261, 117, 1)
        r3_261:initSubLayer("configBase", r1_261, 118, 1)
        r3_261:initSubLayer("configBase", r1_261, 122, 1)
        r3_261:initSubLayer("configBase", r1_261, 123, 1)
      else
        r3_261:initSubLayer("configBase", r1_261, 352, 1)
      end
      r0_261.MenuButton:InitList()
      r0_261.MenuButton:SetList("ButtonP3", r0_261.ButtonP3)
      r0_261.MenuButton:InitButton()
      local r4_261 = g_mixer:getMasterVolume()
      if g_mixer:getMasterMute() ~= false or not r4_261 then
        r4_261 = 0
      end
      r0_261:SetSliderParam(r0_261.ButtonP3.SL_MasterVol, 14, 15, 100, 0, r4_261)
      r0_261:SetSliderParam(r0_261.ButtonP3.SL_SysSeVol, 30, 31, 100, 0, g_volume[getSoundIndex("systemse")].vol / 10)
      r0_261:SetSliderParam(r0_261.ButtonP3.SL_BgmVol, 46, 47, 100, 0, g_volume[getSoundIndex("bgm")].vol / 10)
      r0_261:SetSliderParam(r0_261.ButtonP3.SL_SeVol, 62, 63, 100, 0, g_volume[getSoundIndex("se")].vol / 10)
      r0_261:SetSliderParam(r0_261.ButtonP3.SL_MovieVol, 78, 79, 100, 0, g_volume[getSoundIndex("movie")].vol / 10)
      r0_261:SetSliderParam(r0_261.ButtonP3.SL_VoiceVol, 94, 95, 100, 0, g_volume[getSoundIndex("char")].vol / 10)
      r0_261:SetSliderParam(r0_261.ButtonP3.SL_VoiceBgmVol, 110, 111, 100, 0, g_bgmCutPer)
      if r0_261.CharAllDisable == false then
        r0_261:SetSliderParam(r0_261.ButtonP3.SL_CharVol, 126, 127, 100, 0, g_volume[(getSoundIndex("char") + r0_261.selChar)].vol / 10)
      end
      r0_261:Page3_SetActive(r1_261)
      r0_261.ItemP3 = r0_261:ItemSetInit()
      r0_261.ItemP3.MasterVol = MenuItem.new("configBase", r1_261, 144, 133)
      r0_261.ItemP3.SysSeVol = MenuItem.new("configBase", r1_261, 145, 134)
      r0_261.ItemP3.BgmVol = MenuItem.new("configBase", r1_261, 146, 135)
      r0_261.ItemP3.SeVol = MenuItem.new("configBase", r1_261, 147, 136)
      r0_261.ItemP3.MovieVol = MenuItem.new("configBase", r1_261, 148, 137)
      r0_261.ItemP3.VoiceVol = MenuItem.new("configBase", r1_261, 149, 138)
      r0_261.ItemP3.VoiceBgmVol = MenuItem.new("configBase", r1_261, 150, 139)
      r0_261.ItemP3.VoiceSkip = MenuItem.new("configBase", r1_261, 151, 140)
      r0_261.ItemP3.VoiceRL = MenuItem.new("configBase", r1_261, 152, 141)
      r0_261.ItemP3.expMasterVol = MenuItem.new("configBase", r1_261, -1, 343)
      r0_261.ItemP3.expSysSeVol = MenuItem.new("configBase", r1_261, -1, 342)
      r0_261.ItemP3.expBgmVol = MenuItem.new("configBase", r1_261, -1, 341)
      r0_261.ItemP3.expSeVol = MenuItem.new("configBase", r1_261, -1, 340)
      r0_261.ItemP3.expMovieVol = MenuItem.new("configBase", r1_261, -1, 339)
      r0_261.ItemP3.expVoiceVol = MenuItem.new("configBase", r1_261, -1, 338)
      r0_261.ItemP3.expVoiceSkip = MenuItem.new("configBase", r1_261, -1, 337)
      r0_261.ItemP3.expVoiceRL = MenuItem.new("configBase", r1_261, -1, 336)
      r0_261.ItemP3.expVoiceBgmVol = MenuItem.new("configBase", r1_261, -1, 335)
      r0_261.ItemP3.expCharVol = MenuItem.new("configBase", r1_261, -1, 334)
      r0_261.ItemP3.expSysVoiceEx = MenuItem.new("configBase", r1_261, -1, 333)
      r0_261.ItemP3.expSysVoiceRa = MenuItem.new("configBase", r1_261, -1, 332)
      r0_261.ItemP3.expSysVoiceVol = -1
      r0_261.ItemP3.Headline_MasterVol = "MasterVol"
      r0_261.ItemP3.Headline_BgmVol = "BgmVol"
      r0_261.ItemP3.Headline_SeVol = "SeVol"
      r0_261.ItemP3.Headline_SysSeVol = "SysSeVol"
      r0_261.ItemP3.Headline_MovieVol = "MovieVol"
      r0_261.ItemP3.Headline_VoiceVol = "VoiceVol"
      r0_261.ItemP3.Headline_SysVoiceVol = -1
      r0_261.ItemP3.Headline_BgvVol = -1
      r0_261.ItemP3.Headline_BgvStop = -1
      r0_261.ItemP3.Headline_CharVoice = -1
      r0_261.ItemP3.Headline_VoiceBgmVol = "VoiceBgmVol"
      r0_261.ItemP3.Headline_VoiceSkip = "VoiceSkip"
      r0_261.ItemP3.Headline_VoiceRL = "VoiceRL"
      r0_261.ItemP3.Headline_CharVol = -1
      r0_261.ItemP3.Headline_barMasterVol = -1
      r0_261.ItemP3.Headline_barBgmVol = -1
      r0_261.ItemP3.Headline_barSeVol = -1
      r0_261.ItemP3.Headline_barSysSeVol = -1
      r0_261.ItemP3.Headline_barMovieVol = -1
      r0_261.ItemP3.Headline_barVoiceVol = -1
      r0_261.ItemP3.Headline_barSysVoiceVol = -1
      r0_261.ItemP3.Headline_barBgvVol = -1
      r0_261.ItemP3.Headline_barVoiceBgmVol = -1
      r0_261.ItemP3.Headline_barCharVol = -1
    else
      r0_261:Page3_SetActive(r1_261)
    end
  end
  function g_Menu.Config.ptr.SetSlideActP3(r0_262, r1_262)
    -- line: [10326, 10492] id: 262
    local r2_262 = cclass.lua_Layers:create()
    local r3_262 = ConfigGetPageKeyName(3)
    local r4_262 = 0
    local r5_262 = 0
    local r6_262 = 0
    local r7_262 = 0
    local r8_262 = 0
    local r9_262 = nil
    local r10_262 = 0
    local r11_262 = 0
    if "SL_MasterVol" == r1_262 or "SL_MasterVolBk" == r1_262 then
      r10_262 = 0
      r11_262 = 1
    else
      r10_262 = 1
      r11_262 = 0
    end
    r2_262:setSubLayerVisible("configBase", r3_262, 5, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 6, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 10, r11_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 11, r11_262)
    r4_262 = 13
    r8_262 = 203
    r9_262 = 13
    local r13_262 = (r8_262 - r4_262) * r0_262.ButtonP3.SL_MasterVol:bt_GetParamX() / 100 + r4_262 / 2
    r2_262:setSubLayerParam("configBase", r3_262, 5, LUA_PARAM_RECT, 0, 0, r13_262, r9_262)
    r2_262:setSubLayerParam("configBase", r3_262, 10, LUA_PARAM_RECT, 0, 0, r13_262, r9_262)
    if "SL_BgmVol" == r1_262 or "SL_BgmVolBk" == r1_262 then
      r10_262 = 0
      r11_262 = 1
    else
      r10_262 = 1
      r11_262 = 0
    end
    r2_262:setSubLayerVisible("configBase", r3_262, 37, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 38, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 42, r11_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 43, r11_262)
    local r15_262 = (r8_262 - r4_262) * r0_262.ButtonP3.SL_BgmVol:bt_GetParamX() / 100 + r4_262 / 2
    r2_262:setSubLayerParam("configBase", r3_262, 42, LUA_PARAM_RECT, 0, 0, r15_262, r9_262)
    r2_262:setSubLayerParam("configBase", r3_262, 37, LUA_PARAM_RECT, 0, 0, r15_262, r9_262)
    if "SL_SeVol" == r1_262 or "SL_SeVolBk" == r1_262 then
      r10_262 = 0
      r11_262 = 1
    else
      r10_262 = 1
      r11_262 = 0
    end
    r2_262:setSubLayerVisible("configBase", r3_262, 53, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 54, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 58, r11_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 59, r11_262)
    local r17_262 = (r8_262 - r4_262) * r0_262.ButtonP3.SL_SeVol:bt_GetParamX() / 100 + r4_262 / 2
    r2_262:setSubLayerParam("configBase", r3_262, 58, LUA_PARAM_RECT, 0, 0, r17_262, r9_262)
    r2_262:setSubLayerParam("configBase", r3_262, 53, LUA_PARAM_RECT, 0, 0, r17_262, r9_262)
    if "SL_MovieVol" == r1_262 or "SL_MovieVolBk" == r1_262 then
      r10_262 = 0
      r11_262 = 1
    else
      r10_262 = 1
      r11_262 = 0
    end
    r2_262:setSubLayerVisible("configBase", r3_262, 69, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 70, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 74, r11_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 75, r11_262)
    local r19_262 = (r8_262 - r4_262) * r0_262.ButtonP3.SL_MovieVol:bt_GetParamX() / 100 + r4_262 / 2
    r2_262:setSubLayerParam("configBase", r3_262, 74, LUA_PARAM_RECT, 0, 0, r19_262, r9_262)
    r2_262:setSubLayerParam("configBase", r3_262, 69, LUA_PARAM_RECT, 0, 0, r19_262, r9_262)
    if "SL_VoiceVol" == r1_262 or "SL_VoiceVolBk" == r1_262 then
      r10_262 = 0
      r11_262 = 1
    else
      r10_262 = 1
      r11_262 = 0
    end
    r2_262:setSubLayerVisible("configBase", r3_262, 85, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 86, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 90, r11_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 91, r11_262)
    local r21_262 = (r8_262 - r4_262) * r0_262.ButtonP3.SL_VoiceVol:bt_GetParamX() / 100 + r4_262 / 2
    r2_262:setSubLayerParam("configBase", r3_262, 90, LUA_PARAM_RECT, 0, 0, r21_262, r9_262)
    r2_262:setSubLayerParam("configBase", r3_262, 85, LUA_PARAM_RECT, 0, 0, r21_262, r9_262)
    if "SL_VoiceBgmVol" == r1_262 or "SL_VoiceBgmVolBk" == r1_262 then
      r10_262 = 0
      r11_262 = 1
    else
      r10_262 = 1
      r11_262 = 0
    end
    r2_262:setSubLayerVisible("configBase", r3_262, 101, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 102, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 106, r11_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 107, r11_262)
    local r23_262 = (r8_262 - r4_262) * r0_262.ButtonP3.SL_VoiceBgmVol:bt_GetParamX() / 100 + r4_262 / 2
    r2_262:setSubLayerParam("configBase", r3_262, 106, LUA_PARAM_RECT, 0, 0, r23_262, r9_262)
    r2_262:setSubLayerParam("configBase", r3_262, 101, LUA_PARAM_RECT, 0, 0, r23_262, r9_262)
    if r0_262.CharAllDisable == false then
      if "SL_CharVol" == r1_262 or "SL_CharVolBk" == r1_262 then
        r10_262 = 0
        r11_262 = 1
      else
        r10_262 = 1
        r11_262 = 0
      end
      r2_262:setSubLayerVisible("configBase", r3_262, 117, r10_262)
      r2_262:setSubLayerVisible("configBase", r3_262, 118, r10_262)
      r2_262:setSubLayerVisible("configBase", r3_262, 122, r11_262)
      r2_262:setSubLayerVisible("configBase", r3_262, 123, r11_262)
      local r25_262 = (r8_262 - r4_262) * r0_262.ButtonP3.SL_CharVol:bt_GetParamX() / 100 + r4_262 / 2
      r2_262:setSubLayerParam("configBase", r3_262, 122, LUA_PARAM_RECT, 0, 0, r25_262, r9_262)
      r2_262:setSubLayerParam("configBase", r3_262, 117, LUA_PARAM_RECT, 0, 0, r25_262, r9_262)
    end
    if "SL_SysSeVol" == r1_262 or "SL_SysSeVolBk" == r1_262 then
      r10_262 = 0
      r11_262 = 1
    else
      r10_262 = 1
      r11_262 = 0
    end
    r2_262:setSubLayerVisible("configBase", r3_262, 21, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 22, r10_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 26, r11_262)
    r2_262:setSubLayerVisible("configBase", r3_262, 27, r11_262)
    local r25_262 = (r8_262 - r4_262) * r0_262.ButtonP3.SL_SysSeVol:bt_GetParamX() / 100 + r4_262 / 2
    r2_262:setSubLayerParam("configBase", r3_262, 26, LUA_PARAM_RECT, 0, 0, r25_262, r9_262)
    r2_262:setSubLayerParam("configBase", r3_262, 21, LUA_PARAM_RECT, 0, 0, r25_262, r9_262)
  end
  function g_Menu.Config.ptr.SelCursorP3(r0_263, r1_263, r2_263, r3_263)
    -- line: [10495, 10653] id: 263
    if r0_263.SliderMoveNo == 308 then
      local r4_263 = r0_263.ButtonP3.SL_MasterVol
      r0_263:DrawConfigNo(r4_263:bt_GetParamX(), r4_263.DRAW_POS.x + r4_263.EVENT_RECT.w / 2, r4_263.DRAW_POS.y - 20)
    end
    if r0_263.SliderMoveNo == 310 then
      local r4_263 = r0_263.ButtonP3.SL_BgmVol
      r0_263:DrawConfigNo(r4_263:bt_GetParamX(), r4_263.DRAW_POS.x + r4_263.EVENT_RECT.w / 2, r4_263.DRAW_POS.y - 20)
    end
    if r0_263.SliderMoveNo == 312 then
      local r4_263 = r0_263.ButtonP3.SL_SeVol
      local r5_263 = r4_263:bt_GetParamX()
      r0_263:SetTestSeVol(r5_263 * 10)
      r0_263:DrawConfigNo(r5_263, r4_263.DRAW_POS.x + r4_263.EVENT_RECT.w / 2, r4_263.DRAW_POS.y - 20)
    end
    if r0_263.SliderMoveNo == 314 then
      local r4_263 = r0_263.ButtonP3.SL_MovieVol
      r0_263:DrawConfigNo(r4_263:bt_GetParamX(), r4_263.DRAW_POS.x + r4_263.EVENT_RECT.w / 2, r4_263.DRAW_POS.y - 20)
    end
    if r0_263.SliderMoveNo == 316 then
      local r4_263 = r0_263.ButtonP3.SL_VoiceVol:bt_GetParamX()
      if r0_263.CharAllDisable == false then
        r0_263.ButtonP3.SL_CharVol:bt_SetParamX(r4_263)
        g_volume[r0_263:getPersonalIndex()].vol = r4_263 * 10
      end
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_UPDATEBGMCUT, 0)
      r0_263:SetTestVoiceVol(r4_263 * 10)
      local r5_263 = r0_263.ButtonP3.SL_VoiceVol
      r0_263:DrawConfigNo(r5_263:bt_GetParamX(), r5_263.DRAW_POS.x + r5_263.EVENT_RECT.w / 2, r5_263.DRAW_POS.y - 20)
    end
    if r0_263.SliderMoveNo == 322 then
      local r4_263 = r0_263.ButtonP3.SL_BgvVol
      r0_263:DrawConfigNo(r4_263:bt_GetParamX(), r4_263.DRAW_POS.x + r4_263.EVENT_RECT.w / 2, r4_263.DRAW_POS.y - 20)
    end
    if r0_263.SliderMoveNo == 318 then
      local r4_263 = r0_263.ButtonP3.SL_VoiceBgmVol
      r0_263:DrawConfigNo(r4_263:bt_GetParamX(), r4_263.DRAW_POS.x + r4_263.EVENT_RECT.w / 2, r4_263.DRAW_POS.y - 20)
    end
    if r0_263.SliderMoveNo == 320 then
      local r4_263 = r0_263.ButtonP3.SL_CharVol
      local r5_263 = r4_263:bt_GetParamX()
      r0_263:DrawConfigNo(r5_263, r4_263.DRAW_POS.x + r4_263.EVENT_RECT.w / 2, r4_263.DRAW_POS.y + 25)
      r0_263:SetTestVoiceVol(r5_263 * 10)
    end
    r0_263:SetSlideActP3(r1_263)
    if r1_263 == -1 or r0_263.ItemP3.selCursor_selName ~= r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, -1, -1, -1, -1)
    end
    if "VoiceSkipOn" == r1_263 or "VoiceSkipOff" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_VoiceSkip, -1, "expVoiceSkip")
    end
    if "VoiceRLOn" == r1_263 or "VoiceRLOff" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_VoiceRL, -1, "expVoiceRL")
    end
    if "BgvStopOn" == r1_263 or "BgvStopOff" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_BgvStop, -1, "expBgvStop")
    end
    for r7_263 = 0, r0_263.selCharMax - 1, 1 do
      if string.format("VoiceChar%03d", r7_263 + 1) == r1_263 then
        r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_CharVol, -1, "expCharVol")
      end
    end
    if "SL_MasterVol" == r1_263 or "SL_MasterVolBk" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_MasterVol, r0_263.ItemP3.Headline_barMasterVol, "expMasterVol")
    end
    if "SL_BgmVol" == r1_263 or "SL_BgmVolBk" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_BgmVol, r0_263.ItemP3.Headline_barBgmVol, "expBgmVol")
    end
    if "SL_SeVol" == r1_263 or "SL_SeVolBk" == r1_263 or "SeTest" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_SeVol, r0_263.ItemP3.Headline_barSeVol, "expSeVol")
    end
    if "SL_SysSeVol" == r1_263 or "SL_SysSeVolBk" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_SysSeVol, r0_263.ItemP3.Headline_barSysSeVol, "expSysSeVol")
    end
    if "SL_MovieVol" == r1_263 or "SL_MovieVolBk" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_MovieVol, r0_263.ItemP3.Headline_barMovieVol, "expMovieVol")
    end
    if "SL_VoiceVol" == r1_263 or "SL_VoiceVolBk" == r1_263 or "VoiceTest" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_VoiceVol, r0_263.ItemP3.Headline_barVoiceVol, "expVoiceVol")
    end
    if "SL_SysVoiceVol" == r1_263 or "SL_SysVoiceVolBk" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_SysVoiceVol, r0_263.ItemP3.Headline_barSysVoiceVol, "expSysVoiceVol")
    end
    if "SL_BgvVol" == r1_263 or "SL_BgvVolBk" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_BgvVol, r0_263.ItemP3.Headline_barBgvVol, "expBgvVol")
    end
    if "SL_VoiceBgmVol" == r1_263 or "SL_VoiceBgmVolBk" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_VoiceBgmVol, r0_263.ItemP3.Headline_barVoiceBgmVol, "expVoiceBgmVol")
    end
    if "SL_CharVol" == r1_263 or "SL_CharVolBk" == r1_263 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, r0_263.ItemP3.Headline_CharVoice, r0_263.ItemP3.Headline_barCharVol, "expCharVol")
    end
    if "SysVoiceEx" == r1_263 and r0_263.ItemP3.expSysVoiceEx ~= nil and r0_263.ItemP3.expSysVoiceEx ~= -1 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, -1, -1, "expSysVoiceEx")
    end
    if "SysVoiceRa" == r1_263 and r0_263.ItemP3.expSysVoiceRa ~= nil and r0_263.ItemP3.expSysVoiceRa ~= -1 then
      r0_263:ItemSet(r0_263.ItemP3, r1_263, -1, -1, "expSysVoiceRa")
    end
  end
  function g_Menu.Config.ptr.DataNoName(r0_264, r1_264, r2_264)
    -- line: [10659, 10665] id: 264
    local r3_264 = nil	-- notice: implicit variable refs by block#[3]
    if r1_264 == true then
      r3_264 = "Save"
      if not r3_264 then
        ::label_5::
        r3_264 = "Load"
      end
    else
      goto label_5	-- block#2 is visited secondly
    end
    return string.format("P4DataNo%s%04d", r3_264, r2_264)
  end
  function g_Menu.Config.ptr.DataOverName(r0_265, r1_265, r2_265)
    -- line: [10667, 10674] id: 265
    local r3_265 = nil	-- notice: implicit variable refs by block#[3]
    if r1_265 == true then
      r3_265 = "Save"
      if not r3_265 then
        ::label_5::
        r3_265 = "Load"
      end
    else
      goto label_5	-- block#2 is visited secondly
    end
    return string.format("P4DataTh%s%04d", r3_265, r2_265)
  end
  function g_Menu.Config.ptr.DataPage_SetActive(r0_266, r1_266, r2_266)
    -- line: [10677, 10802] id: 266
    local r3_266 = cclass.lua_Layers:create()
    for r7_266 = 1, 10, 1 do
      local r8_266 = "Data" .. tostring(r7_266)
      r0_266.ButtonP45[r8_266]:bt_SetActive(0)
      if r2_266 == true then
        if g_dataInfo.page == r0_0 then
          r0_266.ButtonP45[r8_266]:bt_SetActive(2)
        end
      elseif g_dataInfo.page == r0_0 then
        local r9_266 = r7_266
        if r7_266 <= 5 then
          if g_autoOrder[r9_266] > 0 then
            r0_266.ButtonP45[r8_266]:bt_SetActive(0)
          else
            r0_266.ButtonP45[r8_266]:bt_SetActive(2)
          end
        elseif g_quickOrder[r9_266 - 5] > 0 then
          r0_266.ButtonP45[r8_266]:bt_SetActive(0)
        else
          r0_266.ButtonP45[r8_266]:bt_SetActive(2)
        end
      elseif cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r7_266) == false then
        r0_266.ButtonP45[r8_266]:bt_SetActive(2)
      else
        r0_266.ButtonP45[r8_266]:bt_SetActive(0)
      end
      updateNewIcon(r1_266, g_dataInfo.page, r2_266)
    end
    for r7_266 = 1, r0_0, 1 do
      local r8_266 = "Page" .. tostring(r7_266)
      if r7_266 == r0_0 then
        if g_dataInfo.page == r7_266 then
          r0_266.ButtonP45[r8_266]:bt_SetActive(1)
        else
          r0_266.ButtonP45[r8_266]:bt_SetActive(0)
        end
      elseif r0_266.ChangePageNo == 1 then
        if r7_266 <= 10 then
          if g_dataInfo.page == r7_266 then
            r0_266.ButtonP45[r8_266]:bt_SetActive(1)
          else
            r0_266.ButtonP45[r8_266]:bt_SetActive(0)
          end
        else
          r0_266.ButtonP45[r8_266]:bt_SetActive(3)
        end
      elseif r7_266 <= 10 then
        r0_266.ButtonP45[r8_266]:bt_SetActive(3)
      elseif g_dataInfo.page == r7_266 then
        r0_266.ButtonP45[r8_266]:bt_SetActive(1)
      else
        r0_266.ButtonP45[r8_266]:bt_SetActive(0)
      end
    end
    if r0_266.ChangePageNo == 1 then
      r0_266.ButtonP45.Page_10:bt_SetActive(1)
      r0_266.ButtonP45.Page_20:bt_SetActive(0)
    else
      r0_266.ButtonP45.Page_10:bt_SetActive(0)
      r0_266.ButtonP45.Page_20:bt_SetActive(1)
    end
  end
  function g_Menu.Config.ptr.SelCursorP4(r0_267, r1_267, r2_267, r3_267)
    -- line: [10808, 10810] id: 267
    r0_267:SelCursorP5(r1_267, r2_267, r3_267)
  end
  function g_Menu.Config.ptr.SelCursorP5(r0_268, r1_268, r2_268, r3_268)
    -- line: [10811, 10852] id: 268
    local r4_268 = ConfigGetPageKeyName(4)
    if g_configPage == 5 then
      r4_268 = ConfigGetPageKeyName(5)
    end
    local r5_268 = cclass.lua_Layers:create()
    for r9_268 = 1, 10, 1 do
      local r11_268 = g_Menu.Config.ptr:DataOverName(save, r9_268)
      if "Data" .. tostring(r9_268) == r1_268 then
        r5_268:setSubLayerVisible("configBase", r11_268, 1, 1)
      else
        r5_268:setSubLayerVisible("configBase", r11_268, 1, 0)
      end
    end
  end
  function g_Menu.Config.ptr.DataPage_ButtonJobLU(r0_269, r1_269, r2_269, r3_269, r4_269)
    -- line: [10857, 10930] id: 269
    if 451 <= r1_269 and r1_269 <= 451 + r0_0 then
      local r5_269 = g_dataInfo.page
      g_dataInfo.page = r1_269 - 450
    end
    if r1_269 == 491 then
      r0_269.ChangePageNo = 1
    end
    if r1_269 == 492 then
      r0_269.ChangePageNo = 2
    end
    if 431 <= r1_269 and r1_269 <= 441 then
      g_dataInfo.data_no = r1_269 - 431
      local r5_269 = g_configPage
      if r5_269 == 4 then
        r5_269 = true or false
      else
        goto label_30	-- block#11 is visited secondly
      end
      if r5_269 == true then
        local r6_269 = (g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1
        if cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, r6_269) == false then
          cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_SAVEGAME, r6_269)
          if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
            r0_269:SetConfigButtonActive(r0_269.MenuInf.beforePage)
          end
        else
          openConfirm(LUA_CONFIRM_OVERWRITE)
        end
      elseif g_dataInfo.page == r0_0 then
        local r6_269 = g_dataInfo.data_no + 1
        if r6_269 < 6 and g_autoOrder[r6_269] > 0 then
          openConfirm(LUA_CONFIRM_LOAD)
        elseif g_quickOrder[r6_269 - 5] > 0 then
          openConfirm(LUA_CONFIRM_LOAD)
        end
      elseif cfunc.CSaveDataManager__lua_IsData(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + g_dataInfo.data_no + 1) == true then
        openConfirm(LUA_CONFIRM_LOAD)
      end
    end
    if 401 <= r1_269 and r1_269 <= 500 then
      local r5_269 = ConfigGetPageKeyName(g_configPage)
      local r6_269 = g_configPage
      if r6_269 == 4 then
        r6_269 = true or false
      else
        goto label_126	-- block#29 is visited secondly
      end
      r0_269:deleteThumbnail(r6_269)
      for r10_269 = 1, 10, 1 do
        initThumbnail(r6_269, r10_269, false)
      end
      r0_269:DataPage_SetActive(r5_269, r6_269)
    end
  end
  g_Menu.Config.ptr.ChangePageNo = 1
  function g_Menu.Config.ptr.initDataPage(r0_270, r1_270, r2_270, r3_270)
    -- line: [10935, 11047] id: 270
    initDataOrder()
    if g_dataInfo.init == false then
      r0_270:initDataPageNo()
      g_dataInfo.init = true
    end
    if g_dataInfo.page <= 10 then
      r0_270.ChangePageNo = 1
    else
      r0_270.ChangePageNo = 2
    end
    local r4_270 = cclass.lua_Layers:create()
    if r3_270 == true then
      r4_270:initSubLayer("configBase", r1_270, 87, 1)
      r0_270.ButtonP45 = {}
      local r5_270 = 451
      local r6_270 = 43
      local r7_270 = 56
      local r8_270 = 69
      local r9_270 = -1
      for r13_270 = 1, r0_0, 1 do
        local r14_270 = "Page" .. tostring(r13_270)
        if r13_270 <= 10 then
          r6_270 = 54 - r13_270 - 1
          r7_270 = 80 - r13_270 - 1
          r8_270 = 67 - r13_270 - 1
          r9_270 = -1
        else
          r6_270 = 108 - r13_270 - 11
          r7_270 = 134 - r13_270 - 11
          r8_270 = 121 - r13_270 - 11
          r9_270 = -1
        end
        r0_270:MenuButtonSet(r0_270.ButtonP45, r14_270, 1, r1_270, r6_270, r6_270, r7_270, r8_270, r9_270, r5_270, 0, 0)
        r5_270 = r5_270 + 1
      end
      r0_270:MenuButtonSet(r0_270.ButtonP45, "Page_10", 1, r1_270, 153, 165, 161, 157, 169, 491, 0, 0)
      r0_270:MenuButtonSet(r0_270.ButtonP45, "Page_20", 1, r1_270, 152, 164, 160, 156, 168, 492, 0, 0)
      r5_270 = 431
      r6_270 = 5
      r7_270 = 17
      r9_270 = 29
      for r13_270 = 1, 10, 1 do
        r0_270:MenuButtonSet(r0_270.ButtonP45, "Data" .. tostring(r13_270), 1, r1_270, r6_270, r6_270, r7_270, -1, r9_270, r5_270, 0, 0)
        r5_270 = r5_270 + 1
        r6_270 = r6_270 + 1
        r7_270 = r7_270 + 1
        r9_270 = r9_270 + 1
        initThumbnail(r2_270, r13_270, false)
      end
      r0_270.MenuButton:InitList()
      r0_270.MenuButton:SetList("ButtonP45", r0_270.ButtonP45)
      r0_270.MenuButton:InitButton()
    else
      r0_270:deleteThumbnail(r2_270)
    end
    r0_270:DataPage_SetActive(r1_270, r2_270)
  end
  function g_Menu.Config.ptr.deleteThumbnail(r0_271, r1_271)
    -- line: [11052, 11072] id: 271
    local r2_271 = cclass.lua_Layers:create()
    for r6_271 = 1, 10, 1 do
      r2_271:removeLayer("configBase", getSaveThumbKey(r1_271, r6_271))
      r2_271:removeLayer("configBase", getSaveThumbTxt(r1_271, r6_271))
      r2_271:removeLayer("configBase", getSaveThumbTimeTxt(r1_271, r6_271))
      if g_UseSaveNoTxt == true then
        r2_271:removeLayer("configBase", getSaveThumbNoTxt(r1_271, r6_271))
      end
      r2_271:removeLayer("configBase", r0_271:DataOverName(r1_271, r6_271))
    end
  end
  function g_Menu.Config.ptr.initDataPageNo(r0_272)
    -- line: [11077, 11088] id: 272
    local r1_272 = 0
    local r2_272 = 0
    r1_272, r2_272 = cfunc.CSaveDataManager__lua_FindNewData(0, r1_272, r2_272)
    if r1_272 == 0 then
      g_dataInfo.page = (r2_272 - 1) / 10 + 1
      g_dataInfo.page = math.floor(g_dataInfo.page)
    elseif r1_272 == 1 then
      g_dataInfo.page = r0_0
    end
  end
  function g_Menu.Config.ptr.effectThumbnail(r0_273, r1_273, r2_273, r3_273, r4_273, r5_273, r6_273, r7_273)
    -- line: [11091, 11209] id: 273
    local r8_273 = cclass.lua_Layers:create()
    local r9_273 = getEffectRate()
    for r13_273 = 1, 10, 1 do
      local r14_273 = getSaveThumbKey(r1_273, r13_273)
      local r15_273 = getSaveThumbTxt(r1_273, r13_273)
      local r16_273 = getSaveThumbTimeTxt(r1_273, r13_273)
      local r17_273 = getSaveThumbNoTxt(r1_273, r13_273)
      local r18_273 = r0_273:DataOverName(r1_273, r13_273)
      if r2_273 ~= true then
        if r6_273 == false then
          local r19_273 = r5_273
          r8_273:setParam("configBase", r14_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_273:setParam("configBase", r15_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_273:setParam("configBase", r16_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_273:setParam("configBase", r18_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r8_273:setEffect("configBase", r14_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r19_273)
          r8_273:setEffect("configBase", r15_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r19_273)
          r8_273:setEffect("configBase", r16_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r19_273)
          r8_273:setEffect("configBase", r18_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r19_273)
          if g_UseSaveNoTxt then
            r8_273:setParam("configBase", r17_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_273:setEffect("configBase", r17_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r19_273)
          end
        else
          local r19_273 = r5_273
          if r0_273.PageSlide then
            r19_273 = 100
          end
          r8_273:setEffect("configBase", r14_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r19_273, 0, r7_273)
          r8_273:setEffect("configBase", r15_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r19_273, 0, r7_273)
          r8_273:setEffect("configBase", r16_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r19_273, 0, r7_273)
          r8_273:setEffect("configBase", r18_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r19_273, 0, r7_273)
          if g_UseSaveNoTxt then
            r8_273:setEffect("configBase", r17_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r19_273, 0, r7_273)
          end
        end
        r8_273:startEffect("configBase", r14_273, "ConfigPage", 0)
        r8_273:startEffect("configBase", r15_273, "ConfigPage", 0)
        r8_273:startEffect("configBase", r16_273, "ConfigPage", 0)
        r8_273:startEffect("configBase", r18_273, "ConfigPage", 0)
        if g_UseSaveNoTxt then
          r8_273:startEffect("configBase", r17_273, "ConfigPage", 0)
        end
        if r0_273.PageSlide then
          if r6_273 == false then
            local r19_273 = 0
            local r20_273 = 0
            local r21_273 = 0
            local r22_273 = 0
            r19_273, r20_273, r21_273, r22_273 = r8_273:getParam("configBase", r14_273, LUA_PARAM_POS, r19_273, r20_273, r21_273, r22_273)
            r8_273:setParam("configBase", r14_273, LUA_PARAM_POS, r19_273 - r4_273, r20_273, r21_273, r22_273)
            r19_273, r20_273, r21_273, r22_273 = r8_273:getParam("configBase", r15_273, LUA_PARAM_POS, r19_273, r20_273, r21_273, r22_273)
            r8_273:setParam("configBase", r15_273, LUA_PARAM_POS, r19_273 - r4_273, r20_273, r21_273, r22_273)
            r19_273, r20_273, r21_273, r22_273 = r8_273:getParam("configBase", r16_273, LUA_PARAM_POS, r19_273, r20_273, r21_273, r22_273)
            r8_273:setParam("configBase", r16_273, LUA_PARAM_POS, r19_273 - r4_273, r20_273, r21_273, r22_273)
            r8_273:setParam("configBase", r14_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_273:setParam("configBase", r15_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_273:setParam("configBase", r16_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_273:setEffect("configBase", r14_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r7_273)
            r8_273:setEffect("configBase", r15_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r7_273)
            r8_273:setEffect("configBase", r16_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r7_273)
            if g_UseSaveNoTxt then
              r19_273, r20_273, r21_273, r22_273 = r8_273:getParam("configBase", r17_273, LUA_PARAM_POS, r19_273, r20_273, r21_273, r22_273)
              r8_273:setParam("configBase", r17_273, LUA_PARAM_POS, r19_273 - r4_273, r20_273, r21_273, r22_273)
              r8_273:setParam("configBase", r17_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
              r8_273:setEffect("configBase", r17_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r7_273)
            end
            r19_273, r20_273, r21_273, r22_273 = r8_273:getParam("configBase", r18_273, LUA_PARAM_POS, r19_273, r20_273, r21_273, r22_273)
            r8_273:setParam("configBase", r18_273, LUA_PARAM_POS, r19_273 - r4_273, r20_273, r21_273, r22_273)
            r8_273:setParam("configBase", r18_273, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r8_273:setEffect("configBase", r18_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r5_273, 0, r7_273)
          else
            r8_273:setEffect("configBase", r14_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_273, 0, r7_273)
            r8_273:setEffect("configBase", r15_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_273, 0, r7_273)
            r8_273:setEffect("configBase", r16_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_273, 0, r7_273)
            if g_UseSaveNoTxt then
              r8_273:setEffect("configBase", r17_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_273, 0, r7_273)
            end
            r8_273:setEffect("configBase", r18_273, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r5_273, 0, r7_273)
          end
          r8_273:setEffect("configBase", r14_273, "ConfigPage", LUA_EFFECT_POS, r4_273, 0, 0, 0, 0, r5_273, 0, r7_273)
          r8_273:startEffect("configBase", r14_273, "ConfigPage", 0)
          r8_273:setEffect("configBase", r15_273, "ConfigPage", LUA_EFFECT_POS, r4_273, 0, 0, 0, 0, r5_273, 0, r7_273)
          r8_273:startEffect("configBase", r15_273, "ConfigPage", 0)
          r8_273:setEffect("configBase", r16_273, "ConfigPage", LUA_EFFECT_POS, r4_273, 0, 0, 0, 0, r5_273, 0, r7_273)
          r8_273:startEffect("configBase", r16_273, "ConfigPage", 0)
          if g_UseSaveNoTxt then
            r8_273:setEffect("configBase", r17_273, "ConfigPage", LUA_EFFECT_POS, r4_273, 0, 0, 0, 0, r5_273, 0, r7_273)
            r8_273:startEffect("configBase", r17_273, "ConfigPage", 0)
          end
          r8_273:setEffect("configBase", r18_273, "ConfigPage", LUA_EFFECT_POS, r4_273, 0, 0, 0, 0, r5_273, 0, r7_273)
          r8_273:startEffect("configBase", r18_273, "ConfigPage", 0)
        end
      end
    end
  end
  function g_Menu.Config.ptr.GetIconName(r0_274, r1_274)
    -- line: [11214, 11218] id: 274
    return string.format("gestureIcon%03d", r1_274)
  end
  function g_Menu.Config.ptr.GetDropName(r0_275, r1_275)
    -- line: [11220, 11224] id: 275
    return string.format("Drop%03d", r1_275)
  end
  function g_Menu.Config.ptr.loadIcon(r0_276)
    -- line: [11227, 11229] id: 276
    r0_276:MenuLoadLayer("GestureIcon", "Sys_Arrow.pna")
  end
  function g_Menu.Config.ptr.deleteIcon(r0_277)
    -- line: [11231, 11234] id: 277
    cclass.lua_Layers:create():removeLayer("configBase", "GestureIcon")
  end
  function g_Menu.Config.ptr.GetIconLay(r0_278, r1_278)
    -- line: [11237, 11240] id: 278
    return 14 - r1_278
  end
  function g_Menu.Config.ptr.Page7_SetActive(r0_279)
    -- line: [11244, 11273] id: 279
    local r1_279 = cclass.lua_Layers:create()
    for r5_279 = 1, 14, 1 do
      r0_279.ButtonP7[r0_279:GetIconName(r5_279)]:bt_SetDefPos()
      local r6_279 = r0_279:GetDropName(r5_279 + 10)
      r0_279.ButtonDropP7[r6_279]:bt_SetActive(0)
      r0_279.ButtonDropP7[r6_279]:bt_SetDefPos()
    end
    for r5_279, r6_279 in pairs(g_gestureFunc) do
      r0_279.ButtonP7[r0_279:GetIconName(r6_279 + 1)]:bt_SetPos(r0_279.DropP7[r5_279].x, r0_279.DropP7[r5_279].y)
      local r7_279 = r0_279:GetDropName(r6_279 + 1 + 10)
      r0_279.ButtonDropP7[r7_279]:bt_SetActive(2)
      r0_279.ButtonDropP7[r7_279]:bt_SetPos(r0_279.DropP7[r5_279].x, r0_279.DropP7[r5_279].y)
    end
    if g_gestureDisable == true then
      r0_279.ButtonP7.GestureOn:bt_SetActive(4)
      r0_279.ButtonP7.GestureOff:bt_SetActive(0)
    else
      r0_279.ButtonP7.GestureOn:bt_SetActive(0)
      r0_279.ButtonP7.GestureOff:bt_SetActive(4)
    end
  end
  function g_Menu.Config.ptr.DragStart(r0_280, r1_280, r2_280, r3_280)
    -- line: [11276, 11313] id: 280
    r1_280 = r1_280 - 701
    r0_280.MenuButton.onDropFlag = true
    r0_280.DropParam.DropNo = r1_280
    r0_280.DropParam.Before = -1
    for r7_280, r8_280 in pairs(g_gestureFunc) do
      if r8_280 == r1_280 then
        r0_280.DropParam.Before = r7_280
        break
      end
    end
    if r0_280.DropParam.Before == -1 then
      for r7_280 = 1, 14, 1 do
        r0_280.ButtonDropP7[r0_280:GetDropName(r7_280 + 10)]:bt_SetActive(2)
      end
    else
      r0_280:Page7_SetActive()
    end
    local r4_280 = r0_280:GetIconName(r1_280 + 1)
    r0_280.DropParam.DRAGST_X = r0_280.ButtonP7[r4_280].DRAW_POS.x - r2_280
    r0_280.DropParam.DRAGST_Y = r0_280.ButtonP7[r4_280].DRAW_POS.y - r3_280
    cclass.lua_Layers:create():setSubLayerParam("configBase", "GestureIcon", r0_280:GetIconLay(r0_280.DropParam.DropNo), LUA_PARAM_COLOR, 1, 1, 1, 0.8)
  end
  function g_Menu.Config.ptr.DragEnd(r0_281, r1_281, r2_281, r3_281)
    -- line: [11315, 11359] id: 281
    local r4_281 = cclass.lua_Layers:create()
    r0_281.MenuButton.onDropFlag = false
    if r0_281.DropParam.DropNo ~= -1 then
      if 751 <= r1_281 and r1_281 <= 754 then
        r1_281 = r1_281 - 750
        if r0_281.DropParam.Before == -1 then
          local r6_281 = r0_281:GetIconName(g_gestureFunc[r1_281] + 1)
        else
          local r5_281 = g_gestureFunc[r0_281.DropParam.Before]
          g_gestureFunc[r0_281.DropParam.Before] = g_gestureFunc[r1_281]
        end
        g_gestureFunc[r1_281] = r0_281.DropParam.DropNo
        r0_281:Page7_SetActive()
      end
      if 761 <= r1_281 and r1_281 <= 775 and r0_281.DropParam.Before ~= -1 then
        g_gestureFunc[r0_281.DropParam.Before] = r1_281 - 761
        r0_281:Page7_SetActive()
      end
      cclass.lua_Layers:create():setSubLayerVisible("configBase", "GestureIcon", r0_281:GetIconLay(r0_281.DropParam.DropNo), 0)
      r0_281.DropParam.DropNo = -1
      r0_281.DropParam.Before = -1
      r0_281.DropParam.DRAGST_X = 0
      r0_281.DropParam.DRAGST_Y = 0
    end
  end
  function g_Menu.Config.ptr.DragOn(r0_282, r1_282, r2_282)
    -- line: [11361, 11375] id: 282
    if r0_282.DropParam.DropNo ~= -1 then
      local r3_282 = cclass.lua_Layers:create()
      local r4_282 = 0
      local r5_282 = 0
      local r8_282 = r0_282:GetIconLay(r0_282.DropParam.DropNo)
      r3_282:setSubLayerParam("configBase", "GestureIcon", r8_282, LUA_PARAM_POS, r1_282 + r0_282.DropParam.DRAGST_X, r2_282 + r0_282.DropParam.DRAGST_Y, 0, 0)
      r3_282:setSubLayerVisible("configBase", "GestureIcon", r8_282, 1)
    end
  end
  function g_Menu.Config.ptr.P7_ButtonJobLD(r0_283, r1_283, r2_283, r3_283, r4_283)
    -- line: [11378, 11382] id: 283
    if 701 <= r1_283 and r1_283 <= 714 then
      r0_283:DragStart(r1_283, r3_283, r4_283)
    end
  end
  function g_Menu.Config.ptr.P7_ButtonJobLU(r0_284, r1_284, r2_284, r3_284, r4_284)
    -- line: [11384, 11401] id: 284
    if 701 <= r1_284 and r1_284 <= 800 then
      if r1_284 == 770 then
        g_gestureDisable = true
        r0_284:Page7_SetActive()
      end
      if r1_284 == 771 then
        g_gestureDisable = false
        r0_284:Page7_SetActive()
      end
    end
    local r5_284 = 0
    if r0_284.MenuButton.selCursor ~= -1 then
      r5_284 = r0_284.MenuButton.selListKey[r0_284.MenuButton.selCursor].bt_l
    end
    r0_284:DragEnd(r5_284)
  end
  function g_Menu.Config.ptr.initConfigP7(r0_285, r1_285, r2_285)
    -- line: [11409, 11495] id: 285
    if r2_285 then
      local r3_285 = cclass.lua_Layers:create()
      r3_285:initSubLayer("configBase", r1_285, 57, 1)
      r3_285:initSubLayer("configBase", r1_285, 79, 1)
      r3_285:initSubLayer("configBase", r1_285, 80, 1)
      r3_285:initSubLayer("configBase", r1_285, 81, 1)
      r0_285:loadIcon()
      r0_285.ButtonP7 = {}
      r0_285.ButtonDropP7 = {}
      r0_285.DropNo = -1
      for r7_285 = 1, 14, 1 do
        local r8_285 = r0_285:GetIconName(r7_285)
        local r9_285 = 9 + r7_285 - 1
        r0_285:MenuButtonSet(r0_285.ButtonP7, r8_285, 1, r1_285, r9_285, r9_285, 25 + r7_285 - 1, -1, -1, r7_285 + 700, 0, 0)
        r0_285:MenuButtonSet(r0_285.ButtonDropP7, r0_285:GetDropName(r7_285 + 10), 1, r1_285, 41 + r7_285 - 1, -1, -1, -1, -1, r7_285 + 760, 0, 0)
        r3_285:initSubLayer("configBase", "GestureIcon", r0_285:GetIconLay(r7_285 - 1), 0)
      end
      for r7_285 = 1, 4, 1 do
        local r8_285 = -1
        r0_285:MenuButtonSet(r0_285.ButtonDropP7, r0_285:GetDropName(r7_285), 1, r1_285, 2 + r7_285 - 1, -1, -1, -1, -1, r7_285 + 750, 0, 0)
        r8_285 = 2 + r7_285 - 1
        r3_285:initSubLayer("configBase", r1_285, r8_285, 0)
        local r11_285 = 0
        local r12_285 = 0
        local r13_285 = 0
        local r14_285 = 0
        r11_285, r12_285, r13_285, r14_285 = r3_285:getSubLayerParam("configBase", r1_285, r8_285, LUA_PARAM_POS, 0, 0, 0, 0)
        local r15_285 = 0
        local r16_285 = 0
        r15_285, r16_285, r13_285, r14_285 = r3_285:getSubLayerParam("configBase", r1_285, r8_285, LUA_PARAM_SIZE, 0, 0, 0, 0)
        r0_285.DropP7[r7_285] = {
          x = r11_285,
          y = r12_285,
          w = r15_285 + r11_285,
          h = r16_285 + r12_285,
        }
      end
      r3_285:initSubLayer("configBase", r1_285, 60, 1)
      r3_285:initSubLayer("configBase", r1_285, 61, 0)
      r0_285:MenuButtonSet(r0_285.ButtonP7, "GestureOn", 1, r1_285, 65, 65, 69, 73, -1, 770, 0, 0)
      r0_285:MenuButtonSet(r0_285.ButtonP7, "GestureOff", 1, r1_285, 66, 66, 70, 74, -1, 771, 0, 0)
      r0_285.MenuButton:InitList()
      r0_285.MenuButton:SetList("ButtonP7", r0_285.ButtonP7)
      r0_285.MenuButton:SetDropList("ButtonDropP7", r0_285.ButtonDropP7)
      r0_285.MenuButton:InitButton()
    end
    r0_285:Page7_SetActive()
  end
  function g_Menu.Config.ptr.SelCursorP7(r0_286, r1_286, r2_286, r3_286, r4_286)
    -- line: [11497, 11512] id: 286
    if r1_286 ~= -1 then
      r0_286:DragOn(r3_286, r4_286)
    end
    local r5_286 = cclass.lua_Layers:create()
    local r6_286 = ConfigGetPageKeyName(7)
    if "GestureOn" == r2_286 or "GestureOff" == r2_286 then
      r5_286:setSubLayerVisible("configBase", r6_286, 60, 0)
      r5_286:setSubLayerVisible("configBase", r6_286, 61, 1)
    else
      r5_286:setSubLayerVisible("configBase", r6_286, 60, 1)
      r5_286:setSubLayerVisible("configBase", r6_286, 61, 0)
    end
  end
  function g_Menu.Config.ptr.effectP7(r0_287, r1_287, r2_287, r3_287, r4_287, r5_287)
    -- line: [11515, 11523] id: 287
    local r6_287 = cclass.lua_Layers:create()
    local r7_287 = getEffectRate()
    if r1_287 == true then
    end
  end
  function g_Menu.Config.ptr.Page8_SetInitParam(r0_288)
    -- line: [11527, 11542] id: 288
    if 10 < g_NmsPlay.Param and 1 <= g_NmsPlay.Act then
      if g_NmsPlay.Param - 10 < g_NmsPlay.Act then
        g_NmsPlay.Slide = g_NmsPlay.Param - 10
      else
        g_NmsPlay.Slide = g_NmsPlay.Act - 1
      end
    end
  end
  function g_Menu.Config.ptr.Page8_SetActive(r0_289)
    -- line: [11546, 11556] id: 289
    r0_289:SetEntryBarBt()
    r0_289:SetEntryText()
  end
  g_Menu.Config.ptr.P8ChangeSceneNo = g_NmsPlay.Act
  g_Menu.Config.ptr.P8SlideFlag = 0
  function g_Menu.Config.ptr.P8_ButtonJobLD(r0_290, r1_290, r2_290, r3_290, r4_290)
    -- line: [11561, 11568] id: 290
    if 801 <= r1_290 and r1_290 <= 900 and r1_290 == 801 then
      r0_290.P8SlideFlag = 1
      g_NmsPlay.Slide = r0_290.ButtonP8Slide.SlideBar:bt_GetParamY()
    end
  end
  function g_Menu.Config.ptr.P8_ButtonJobLU(r0_291, r1_291, r2_291, r3_291, r4_291)
    -- line: [11570, 11622] id: 291
    if 801 <= r1_291 and r1_291 <= 900 then
      if r1_291 == 802 then
        local r5_291 = r0_291.ButtonP8Slide.BarBack.EVENT_RECT.h / (r0_291.ButtonP8Slide.SlideBar.MOVABLE.PAR_MAX_Y + 1 - r0_291.ButtonP8Slide.SlideBar.MOVABLE.PSIZE_Y)
        local r6_291 = r4_291 - r0_291.ButtonP8Slide.BarBack.DRAW_POS.y
        if r6_291 < 0 then
          r6_291 = 0
        end
        local r7_291 = math.floor(r6_291 / r5_291)
        local r9_291 = r0_291.ButtonP8Slide.SlideBar:bt_GetParamY() - r7_291
        r0_291.ButtonP8Slide.SlideBar:bt_SetParamY(r7_291)
        r0_291:SetEntryBarParam(r7_291)
        r0_291:Page8_SetActive()
      end
      if r1_291 == 803 then
        local r5_291 = r0_291.ButtonP8Slide.SlideBar:bt_GetParamY() - 1
        r0_291.ButtonP8Slide.SlideBar:bt_SetParamY(r5_291)
        r0_291:SetEntryBarParam(r5_291)
        r0_291:Page8_SetActive()
      end
      if r1_291 == 804 then
        local r5_291 = r0_291.ButtonP8Slide.SlideBar:bt_GetParamY() + 1
        r0_291.ButtonP8Slide.SlideBar:bt_SetParamY(r5_291)
        r0_291:SetEntryBarParam(r5_291)
        r0_291:Page8_SetActive()
      end
      if r1_291 == 810 then
        openConfirm(LUA_CONFIRM_SCNTOP)
      end
      if 850 <= r1_291 and r1_291 <= 859 then
        g_NmsPlay.Act = r1_291 - 850 + 1 + g_NmsPlay.Slide
        r0_291:Page8_SetActive()
      end
    end
    if r0_291.P8SlideFlag == 1 then
      local r5_291 = r0_291.ButtonP8Slide.SlideBar:bt_GetParamY()
      r0_291.ButtonP8Slide.SlideBar:bt_SetParamY(r5_291)
      r0_291:SetEntryBarParam(r5_291)
      r0_291:Page8_SetActive()
      r0_291.P8SlideFlag = 0
    end
  end
  function g_Menu.Config.ptr.initConfigP8(r0_292, r1_292, r2_292)
    -- line: [11625, 11723] id: 292
    if r2_292 then
      local r3_292 = cclass.lua_Layers:create()
      r0_292:MenuLoadLayer("NmsTitle", "sys_nms_scn.pna")
      r0_292:MenuLoadLayer("NmsTh", "sys_nms_th.pna")
      r0_292:MenuLoadLayer("NmsNo", "sys_nms_no.pna")
      for r7_292 = 0, g_NmsData.MAX_THUMB - 1, 1 do
        r3_292:initSubLayer("configBase", "NmsTitle", r7_292, 0)
        r3_292:initSubLayer("configBase", "NmsTh", r7_292, 0)
      end
      for r7_292 = 0, 10, 1 do
        r3_292:initSubLayer("configBase", "NmsNo", r7_292, 0)
      end
      local r4_292 = 0
      local r5_292 = 0
      local r6_292 = 0
      local r7_292 = 0
      r3_292:initSubLayer("configBase", r1_292, 69, 1)
      r4_292, r5_292, r6_292, r7_292 = r3_292:getSubLayerParam("configBase", r1_292, 69, LUA_PARAM_POS, r4_292, r5_292, r6_292, r7_292)
      r3_292:setParam("configBase", "NmsTh", LUA_PARAM_POS, r4_292, r5_292, 0, 0)
      local r9_292 = math.floor(g_NmsPlay.Param / 10) % 10
      local r10_292 = math.floor(g_NmsPlay.Param / 100)
      r3_292:insertPNARefLayer("configBase", "NmsNo1", "NmsNo", g_NmsPlay.Param % 10, 1)
      r3_292:insertPNARefLayer("configBase", "NmsNo2", "NmsNo", r9_292, 1)
      r3_292:insertPNARefLayer("configBase", "NmsNo3", "NmsNo", r10_292, 1)
      r3_292:initSubLayer("configBase", r1_292, 73, 0)
      r3_292:initSubLayer("configBase", r1_292, 74, 0)
      r3_292:initSubLayer("configBase", r1_292, 75, 0)
      r4_292, r5_292, r6_292, r7_292 = r3_292:getSubLayerParam("configBase", r1_292, 75, LUA_PARAM_POS, r4_292, r5_292, r6_292, r7_292)
      r3_292:setParam("configBase", "NmsNo3", LUA_PARAM_POS, r4_292, r5_292, 0, 0)
      r4_292, r5_292, r6_292, r7_292 = r3_292:getSubLayerParam("configBase", r1_292, 74, LUA_PARAM_POS, r4_292, r5_292, r6_292, r7_292)
      r3_292:setParam("configBase", "NmsNo2", LUA_PARAM_POS, r4_292, r5_292, 0, 0)
      r4_292, r5_292, r6_292, r7_292 = r3_292:getSubLayerParam("configBase", r1_292, 73, LUA_PARAM_POS, r4_292, r5_292, r6_292, r7_292)
      r3_292:setParam("configBase", "NmsNo1", LUA_PARAM_POS, r4_292, r5_292, 0, 0)
      r3_292:initSubLayer("configBase", r1_292, 78, 1)
      r3_292:initSubLayer("configBase", r1_292, 79, 1)
      r3_292:initSubLayer("configBase", r1_292, 84, 0)
      r3_292:initSubLayer("configBase", r1_292, 85, 0)
      r3_292:initSubLayer("configBase", r1_292, 81, 1)
      r3_292:initSubLayer("configBase", r1_292, 87, 1)
      r3_292:initSubLayer("configBase", r1_292, 60, 1)
      r0_292.ButtonP8 = {}
      r0_292.ButtonP8Slide = {}
      r0_292.ButtonP8Slide.SlideBar = r0_292.MenuButton:SlidebarY(55, 56, r0_292.MenuButton:ButtonCreate("SlideBar", 1, r1_292, 55, -1, -1, -1, -1, 801, 0, "SYS01.ogg", -1, 0))
      r0_292:MenuButtonSet(r0_292.ButtonP8Slide, "BarBack", 1, r1_292, 58, -1, -1, -1, -1, 802, 0, -1)
      r0_292.ButtonP8Slide.BarBack.se_click = -1
      r0_292:MenuButtonSet(r0_292.ButtonP8, "Up", 0, r1_292, 42, 42, 46, -1, 50, 803, 0, 0)
      r0_292:MenuButtonSet(r0_292.ButtonP8, "Do", 0, r1_292, 43, 43, 47, -1, 51, 804, 0, 0)
      r0_292:MenuButtonSet(r0_292.ButtonP8, "RetTop", 1, r1_292, 65, 65, 66, -1, 67, 810, 0, 0)
      for r14_292 = 0, 9, 1 do
        local r16_292 = 12 - r14_292
        r0_292:MenuButtonSet(r0_292.ButtonP8, "EN_List" .. tostring(r14_292), 1, r1_292, r16_292, r16_292, 24 - r14_292, 36 - r14_292, -1, 850 + r14_292, 0, 0)
      end
      r0_292.MenuButton:InitList()
      r0_292.MenuButton:SetList("ButtonP8", r0_292.ButtonP8)
      r0_292.MenuButton:SetList("ButtonP8Slide", r0_292.ButtonP8Slide)
      r0_292.MenuButton:InitButton()
      r0_292.ButtonP8Slide.SlideBar:bt_SlidebarYInit(g_NmsPlay.Param, 10, 20, 58, 59)
      r0_292.ButtonP8Slide.SlideBar:bt_SetParamY(g_NmsPlay.Slide)
    end
    r0_292:SetEntryBarParam(g_NmsPlay.Slide)
    r0_292:Page8_SetActive()
  end
  function g_Menu.Config.ptr.deleteP8Th(r0_293)
    -- line: [11726, 11743] id: 293
    local r1_293 = cclass.lua_Layers:create()
    r1_293:removeLayer("configBase", "NmsTitle")
    r1_293:removeLayer("configBase", "NmsTh")
    r1_293:removeLayer("configBase", "NmsNo")
    for r5_293 = 0, 9, 1 do
      r1_293:removeLayer("configBase", "NmsTitle" .. tostring(r5_293))
    end
    for r5_293 = 1, 3, 1 do
      r1_293:removeLayer("configBase", "NmsNo" .. tostring(r5_293))
    end
  end
  function g_Menu.Config.ptr.SelCursorP8(r0_294, r1_294, r2_294, r3_294)
    -- line: [11746, 11789] id: 294
    local r4_294 = cclass.lua_Layers:create()
    if r0_294.P8SlideFlag == 1 then
      r0_294:SetEntryBarParam(r0_294.ButtonP8Slide.SlideBar:bt_GetParamY())
      r0_294:Page8_SetActive()
    end
    local r5_294 = -1
    local r11_294 = nil	-- notice: implicit variable refs by block#[16]
    if g_NmsPlay.Param >= 2 then
      for r9_294 = 0, 9, 1 do
        r11_294 = tostring(r9_294)
        if "EN_List" .. r11_294 == r1_294 then
          r11_294 = g_NmsPlay.List
          r5_294 = r11_294[g_NmsPlay.Slide + r9_294 + 1]
        end
      end
    end
    local r6_294 = ConfigGetPageKeyName(g_configPage)
    if r1_294 == "RetTop" then
      r4_294:setSubLayerVisible("configBase", r6_294, 84, 1)
    else
      r4_294:setSubLayerVisible("configBase", r6_294, 84, 0)
    end
    if r5_294 == -1 then
      r4_294:setSubLayerVisible("configBase", "NmsTh", g_NmsPlay.List[g_NmsPlay.Act], 1)
      r4_294:setSubLayerVisible("configBase", r6_294, 85, 0)
    else
      for r10_294 = 0, g_NmsData.MAX_THUMB - 1, 1 do
        if r5_294 == r10_294 then
          r11_294 = 1
          if not r11_294 then
            ::label_88::
            r11_294 = 0
          end
        else
          goto label_88	-- block#15 is visited secondly
        end
        r4_294:setSubLayerVisible("configBase", "NmsTh", r10_294, r11_294)
      end
      r4_294:setSubLayerVisible("configBase", r6_294, 85, 1)
    end
  end
  function g_Menu.Config.ptr.effectP8Th(r0_295, r1_295, r2_295, r3_295, r4_295, r5_295)
    -- line: [11792, 11849] id: 295
    local r6_295 = cclass.lua_Layers:create()
    local r7_295 = getEffectRate()
    if r1_295 ~= true then
      if r4_295 == false then
        local r8_295 = 0
        local r9_295 = 0
        local r10_295 = 0
        local r11_295 = 0
        r8_295, r9_295, r10_295, r11_295 = r6_295:getParam("configBase", "NmsTh", LUA_PARAM_POS, r8_295, r9_295, r10_295, r11_295)
        r6_295:setParam("configBase", "NmsTh", LUA_PARAM_POS, r8_295 - r2_295, r9_295, r10_295, r11_295)
        r6_295:setParam("configBase", "NmsTh", LUA_PARAM_COLOR, 1, 1, 1, 0)
        r6_295:setEffect("configBase", "NmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_295, 0, r5_295)
      else
        r6_295:setEffect("configBase", "NmsTh", "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 2, r3_295, 0, r5_295)
      end
      r6_295:setEffect("configBase", "NmsTh", "ConfigPage", LUA_EFFECT_POS, r2_295, 0, 0, 0, 2, r3_295, 0, r5_295)
      r6_295:startEffect("configBase", "NmsTh", "ConfigPage", 0)
      for r11_295 = 1, 3, 1 do
        local r12_295 = "NmsNo" .. tostring(r11_295)
        if r4_295 == false then
          local r13_295 = 0
          local r14_295 = 0
          local r15_295 = 0
          local r16_295 = 0
          r13_295, r14_295, r15_295, r16_295 = r6_295:getParam("configBase", r12_295, LUA_PARAM_POS, r13_295, r14_295, r15_295, r16_295)
          r6_295:setParam("configBase", r12_295, LUA_PARAM_POS, r13_295 - r2_295, r14_295, r15_295, r16_295)
          r6_295:setParam("configBase", r12_295, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r6_295:setEffect("configBase", r12_295, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_295, 0, r5_295)
        else
          r6_295:setEffect("configBase", r12_295, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_295, 0, r5_295)
        end
        r6_295:setEffect("configBase", r12_295, "ConfigPage", LUA_EFFECT_POS, r2_295, 0, 0, 0, 2, r3_295, 0, r5_295)
        r6_295:startEffect("configBase", r12_295, "ConfigPage", 0)
      end
      local r8_295 = g_NmsPlay.Param
      for r12_295 = 0, 9, 1 do
        local r13_295 = "EN_List" .. tostring(r12_295)
        if r0_295.ButtonP8[r13_295].active == 0 or r0_295.ButtonP8[r13_295].active == 4 then
          local r14_295 = "NmsTitle" .. tostring(r12_295)
          if r4_295 == false then
            r6_295:setParam("configBase", r14_295, LUA_PARAM_POS, r0_295.ButtonP8[r13_295].DRAW_POS.x - r2_295, r0_295.ButtonP8[r13_295].DRAW_POS.y, 0, 0)
            r6_295:setParam("configBase", r14_295, LUA_PARAM_COLOR, 1, 1, 1, 0)
            r6_295:setEffect("configBase", r14_295, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_295, 0, r5_295)
          else
            r6_295:setEffect("configBase", r14_295, "ConfigPage", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 2, r3_295, 0, r5_295)
          end
          r6_295:setEffect("configBase", r14_295, "ConfigPage", LUA_EFFECT_POS, r2_295, 0, 0, 0, 2, r3_295, 0, r5_295)
          r6_295:startEffect("configBase", r14_295, "ConfigPage", 0)
        end
      end
    end
  end
  function g_Menu.Config.ptr.MenuMouseWheelP8(r0_296, r1_296, r2_296, r3_296)
    -- line: [11853, 11873] id: 296
    local r4_296 = cclass.lua_Layers:create()
    local r5_296 = r0_296.ButtonP8Slide.SlideBar:bt_GetParamY()
    if g_NmsPlay.Param >= 11 then
      r5_296 = r5_296 - r2_296 / 2
      if r5_296 < 0 then
        r5_296 = 0
      end
      local r6_296 = g_NmsPlay.Param - 10
      if r6_296 < r5_296 then
        r5_296 = r6_296
      end
      r0_296:SetEntryBarParam(r5_296)
      r0_296:Page8_SetActive()
    end
  end
  function g_Menu.Config.ptr.SetEntryBarBt(r0_297)
    -- line: [11877, 11895] id: 297
    for r4_297 = 0, 9, 1 do
      local r5_297 = "EN_List" .. tostring(r4_297)
      if r4_297 < g_NmsPlay.Param then
        local r6_297 = g_NmsPlay.Act
        if r6_297 ~= -1 then
          r6_297 = r6_297 - g_NmsPlay.Slide
        end
        if r6_297 == r4_297 + 1 then
          r0_297.ButtonP8[r5_297]:bt_SetActive(4)
        else
          r0_297.ButtonP8[r5_297]:bt_SetActive(0)
        end
      else
        r0_297.ButtonP8[r5_297]:bt_SetActive(2)
      end
    end
  end
  function g_Menu.Config.ptr.SetEntryText(r0_298)
    -- line: [11898, 11919] id: 298
    local r1_298 = cclass.lua_Layers:create()
    local r2_298 = g_NmsPlay.Param
    for r6_298 = 0, 9, 1 do
      local r7_298 = "EN_List" .. tostring(r6_298)
      local r8_298 = "NmsTitle" .. tostring(r6_298)
      r1_298:removeLayer("configBase", r8_298)
      if r0_298.ButtonP8[r7_298].active == 0 or r0_298.ButtonP8[r7_298].active == 4 then
        local r10_298 = r0_298.ButtonP8[r7_298].DRAW_POS.x
        local r11_298 = r0_298.ButtonP8[r7_298].DRAW_POS.y
        r1_298:insertPNARefLayer("configBase", r8_298, "NmsTitle", g_NmsData.MAX_THUMB - g_NmsPlay.List[r6_298 + g_NmsPlay.Slide + 1] + 1, 1)
        r1_298:setParam("configBase", r8_298, LUA_PARAM_POS, r10_298, r11_298, 0, 0)
      end
    end
  end
  function g_Menu.Config.ptr.SetEntryBarParam(r0_299, r1_299)
    -- line: [11922, 11948] id: 299
    g_NmsPlay.Slide = r1_299
    r0_299.ButtonP8Slide.SlideBar:bt_SetParamY(g_NmsPlay.Slide)
    if g_NmsPlay.Param > 10 then
      r0_299.ButtonP8Slide.SlideBar:bt_SetActive(0)
      r0_299.ButtonP8Slide.BarBack:bt_SetActive(0)
      if g_NmsPlay.Slide <= 0 then
        g_NmsPlay.Slide = 0
        r0_299.ButtonP8.Up:bt_SetActive(2)
      else
        r0_299.ButtonP8.Up:bt_SetActive(0)
      end
      if g_NmsPlay.Param - 10 <= g_NmsPlay.Slide then
        g_NmsPlay.Slide = g_NmsPlay.Param - 10
        r0_299.ButtonP8.Do:bt_SetActive(2)
      else
        r0_299.ButtonP8.Do:bt_SetActive(0)
      end
    else
      r0_299.ButtonP8Slide.SlideBar:bt_SetActive(2)
      r0_299.ButtonP8Slide.BarBack:bt_SetActive(2)
      r0_299.ButtonP8.Up:bt_SetActive(2)
      r0_299.ButtonP8.Do:bt_SetActive(2)
    end
  end
  function g_Menu.Config.ptr.InitConfigNo(r0_300)
    -- line: [11952, 11959] id: 300
    r0_300:MenuLoadLayer("config_no", "sys_no.pna")
    local r1_300 = cclass.lua_Layers:create()
    for r5_300 = 0, 9, 1 do
      r1_300:initSubLayer("configBase", "config_no", r5_300, 0)
    end
    r1_300:initSubLayer("configBase", "config_no", 10, 0)
  end
  g_Menu.Config.ptr.PlaceCount = 0
  function g_Menu.Config.ptr.DrawConfigNo(r0_301, r1_301, r2_301, r3_301)
    -- line: [11963, 12003] id: 301
  end
  function g_Menu.Config.ptr.DeleteConfigNo(r0_302)
    -- line: [12006, 12014] id: 302
    local r1_302 = cclass.lua_Layers:create()
    for r5_302 = 0, r0_302.PlaceCount - 1, 1 do
      r1_302:removeLayer("configBase", "config_no" .. tostring(r5_302))
    end
    r1_302:removeLayer("configBase", "config_perc")
  end
  local r2_205 = g_Menu.Config.ptr:MenuInit("configBase01", "sys_config_base.pna")
  if res == false then
    return false
  end
  g_Menu.Config.ptr:MenuLoadLayer("configBack", "sys_config_back.png")
  cclass.lua_Layers:create():swapLayerOrder("configBase", "configBase01", "configBack")
  g_Menu.Config.ptr.toSysMenu = r1_205
  g_Menu.Config.ptr:InitConfigNo()
  if g_Menu.Config.ptr.NMSAcitve == true then
    g_Menu.Config.ptr:Page8_SetInitParam()
  end
  g_Menu.Config.ptr:initConfigButton()
  g_Menu.Config.ptr:SetConfigButtonActive(r0_205)
  g_Menu.Config.ptr:initConfigPage(r0_205, true)
  g_Menu.Config.ptr:startConfigMenu(r1_205)
  return true
end
function initDataOrder()
  -- line: [12056, 12105] id: 303
  local r0_303 = 0
  local r1_303 = 0
  for r5_303 = 1, 5, 1 do
    g_autoOrder[r5_303] = -1
  end
  r0_303, r1_303 = cfunc.CSaveDataManager__lua_FindNewData(2, r0_303, r1_303)
  if r0_303 == 2 then
    for r5_303 = 1, 5, 1 do
      g_autoOrder[r5_303] = r1_303
      if r1_303 > 0 then
        r1_303 = r1_303 - 1
      end
      if r1_303 < 1 then
        r1_303 = 5
        if r1_303 then
          r1_303 = r1_303
        end
      end
      if 0 < r1_303 and cfunc.CSaveDataManager__lua_IsData(2, r1_303) == false then
        r1_303 = -1
      end
    end
  end
  r0_303, r1_303 = cfunc.CSaveDataManager__lua_FindNewData(2, r0_303, r1_303)
  for r5_303 = 1, 5, 1 do
    g_quickOrder[r5_303] = -1
  end
  r0_303, r1_303 = cfunc.CSaveDataManager__lua_FindNewData(1, r0_303, r1_303)
  if r0_303 == 1 then
    for r5_303 = 1, 5, 1 do
      g_quickOrder[r5_303] = r1_303
      if r1_303 > 0 then
        r1_303 = r1_303 - 1
      end
      if r1_303 < 1 then
        r1_303 = 5
        if r1_303 then
          r1_303 = r1_303
        end
      end
      if 0 < r1_303 and cfunc.CSaveDataManager__lua_IsData(1, r1_303) == false then
        r1_303 = -1
      end
    end
  end
end
function closeConfig()
  -- line: [12108, 12135] id: 304
  if g_Menu.Config.ptr == nil then
    return false
  end
  local r0_304 = cclass.lua_Layers:create()
  if g_menuExecute == true then
    r0_304:removeSnap("system")
    r0_304:rtSnap("system")
  else
    if g_CASTOFF then
      cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
    end
    r0_304:setForceBG(true)
    local r1_304 = getEffectRate()
    r0_304:setSnap("configBase", false)
    r0_304:startTransition("configBase", 0, 1, 500 * r1_304, 0, LUA_TRANSITION_ERASE)
  end
  g_Menu.Config.ptr.MenuInf.enabled = false
  g_Menu.Config.ptr.MenuInf.effect = true
  return true
end
function defaultSetting()
  -- line: [12142, 12272] id: 305
  g_autospeed = 80
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
  for r3_305 = 1, #g_volume, 1 do
    if g_volume[r3_305].name == "bgm" then
      g_volume[r3_305].vol = 500
    elseif g_volume[r3_305].name == "systemse" then
      g_volume[r3_305].vol = 600
    elseif g_volume[r3_305].name == "se" then
      g_volume[r3_305].vol = 700
    elseif g_volume[r3_305].name == "movie" then
      g_volume[r3_305].vol = 800
    elseif g_volume[r3_305].name == "char" then
      g_volume[r3_305].vol = 900
    elseif g_volume[r3_305].name == "charC_SAYA" then
      g_volume[r3_305].vol = 950
    else
      g_volume[r3_305].vol = 900
    end
    g_volume[r3_305].mute = false
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
  changeMessageWindow(-1, true)
  if g_Menu.Config.ptr ~= nil then
    g_Menu.Config.ptr:setCfg2WindowAlpa()
  end
  if g_MenuMsgWin ~= nil then
    g_MenuMsgWin:changeMessageWindowOpacity()
  end
  if g_menuExecute == false then
    local r0_305 = cclass.lua_Layers:create()
    r0_305:removeSnap("system")
    r0_305:setSnap("system", true)
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
  local r0_305 = ConfigGetPageKeyName(g_configPage)
  if g_Menu.Config.ptr ~= nil then
    g_Menu.Config.ptr:SetTestVoiceVol(g_volume[g_Menu.Config.ptr:getPersonalIndex()].vol)
    if g_configPage == 1 then
      if g_menuExecute == false then
        cfunc.LegacyGame__lua_NeedPreview("configBase", "preview")
      end
      g_Menu.Config.ptr:updatePreviewSize(r0_305)
      g_Menu.Config.ptr:Page1_SetActive()
    elseif g_configPage == 2 then
      g_Menu.Config.ptr:setCfg2WindowAlpa()
      startCfg2Preview()
      g_Menu.Config.ptr:Page2_SetActive()
    elseif g_configPage == 3 then
      g_Menu.Config.ptr.selChar = 0
      g_Menu.Config.ptr:Page3_SetActive(r0_305)
    elseif g_configPage == 7 then
      g_Menu.Config.ptr:Page7_SetActive()
    end
    if g_menuExecute == false then
      local r1_305 = cclass.lua_Layers:create()
      if g_CASTOFF then
        cfunc.LegacyGame__lua_NeedInterrupt("CastOffCall")
      end
      r1_305:setForceBG(true)
      g_P1Renew = 3
    end
  end
end
function startCfg2Preview()
  -- line: [12274, 12313] id: 306
  local r0_306 = cclass.lua_Layers:create()
  local r1_306 = nil
  local r2_306 = nil
  r1_306, r2_306 = getConfigText()
  local r3_306 = "\x95\\\x8e\xa6\x91\xac\x93x\x82\u{303}T\x83\x93\x83v\x83\x8b\x81B\n\x82Ђ炪\x82ȁA{\x8a\xbf\x8e\x9a:\x82\xa9\x82\xf1\x82\xb6}\x81A\x83J\x83^\x83J\x83i\x81B\n\x89p\x90\x94\x8bL\x8d\x86\x82P\x82Q\x82R\x82`\x82a\x82b\x81I\x81H"
  local r4_306 = "\x96\xbc\x91O\x83T\x83\x93\x83v\x83\x8b"
  r0_306:clearText("configBase", r1_306)
  r0_306:clearText("configBase", r2_306)
  local r5_306 = {
    [1] = g_message1Color,
    [2] = g_message2Color,
  }
  local r6_306 = {
    [1] = g_name1Color,
    [2] = g_name2Color,
  }
  local r7_306 = getDefaultFont()
  r0_306:effectText("configBase", r1_306, r3_306, r7_306, r5_306[g_messageWindowType + 1].defsize, 1, 0, r5_306[g_messageWindowType + 1].normal, r5_306[g_messageWindowType + 1].normalEdge)
  r0_306:setText("configBase", r2_306, r4_306, r7_306, r5_306[g_messageWindowType + 1].defsize, 1, 0, r6_306[g_messageWindowType + 1].normal, r6_306[g_messageWindowType + 1].normalEdge)
  g_Menu.Config.ptr.autoModeTimer:reset()
  local r8_306 = ConfigGetPageKeyName(2)
  g_Menu.Config.ptr:StopClkWait()
end
function updateNewIcon(r0_307, r1_307, r2_307)
  -- line: [12315, 12358] id: 307
  local r3_307 = cclass.lua_Layers:create()
  local r4_307 = 0
  local r5_307 = 0
  r4_307, r5_307 = cfunc.CSaveDataManager__lua_FindNewData(0, r4_307, r5_307)
  if 0 <= r4_307 and g_Menu.Config.ptr ~= nil then
    for r9_307 = 1, 10, 1 do
      r3_307:setSubLayerVisible("configBase", g_Menu.Config.ptr:DataOverName(r2_307, r9_307), 0, 0)
    end
    if r1_307 == r0_0 and r4_307 == 1 then
      r3_307:setSubLayerVisible("configBase", g_Menu.Config.ptr:DataOverName(r2_307, 6), 0, 1)
      return 
    elseif r4_307 == 0 and math.floor((r5_307 - 1) / 10 + 1) == r1_307 then
      r3_307:setSubLayerVisible("configBase", g_Menu.Config.ptr:DataOverName(r2_307, (r5_307 - 1) % 10 + 1), 0, 1)
      return 
    end
  end
end
function screenChangeNotification()
  -- line: [12361, 12371] id: 308
  local r0_308 = g_screenMode
  if r0_308 == 0 then
    r0_308 = 1 or 0
  else
    goto label_6	-- block#2 is visited secondly
  end
  g_screenMode = r0_308
  if getSystemSet() == "configBase" and g_Menu.Config.ptr ~= nil and g_configPage == 1 then
    g_Menu.Config.ptr:updatePreviewSize(ConfigGetPageKeyName(g_configPage))
    g_Menu.Config.ptr:Page1_SetActive()
  end
end
function aspectChangeNotification(r0_309)
  -- line: [12372, 12382] id: 309
  g_zoomMode = r0_309
  if getSystemSet() == "configBase" and g_Menu.Config.ptr ~= nil and g_configPage == 1 then
    g_Menu.Config.ptr:updatePreviewSize(ConfigGetPageKeyName(g_configPage))
    g_Menu.Config.ptr:Page1_SetActive()
  end
end
function onMessageOutEnd(r0_310)
  -- line: [12383, 12404] id: 310
  if r0_310 == "configBase" and g_Menu.Config.ptr ~= nil and g_Menu.Config.ptr:GetMenuActive() and g_configPage == 2 then
    local r1_310 = cclass.lua_Layers:create()
    local r2_310 = nil
    local r3_310 = nil
    r2_310, r3_310 = getConfigText()
    g_Menu.Config.ptr.autoModeTimer:start(r1_310:messageLength("configBase", r2_310))
    local r5_310 = ConfigGetPageKeyName(g_configPage)
    g_Menu.Config.ptr:StartClkWait()
  end
end
function addFrame(r0_311, r1_311)
  -- line: [12406, 12470] id: 311
  if g_Menu.Config.ptr == nil and g_P1Renew ~= 0 then
    g_P1Renew = 0
    cclass.lua_Layers:create():setForceBG(false)
  end
  if r0_311 == "configBase" and g_Menu.Config.ptr ~= nil and g_Menu.Config.ptr:GetMenuActive() then
    if g_P1Renew ~= 0 then
      if g_P1Renew == 3 then
        g_P1Renew = 2
      elseif g_P1Renew == 2 then
        g_P1Renew = 1
        local r2_311 = cclass.lua_Layers:create()
        r2_311:removeSnap("system")
        r2_311:setSnap("system", true)
        if g_configPage == 1 then
          cfunc.LegacyGame__lua_NeedPreview("configBase", "preview")
          g_Menu.Config.ptr:initConfigP1(ConfigGetPageKeyName(1), false)
        end
      else
        g_P1Renew = 0
        cclass.lua_Layers:create():setForceBG(false)
      end
    end
    if g_configPage == 2 and g_Menu.Config.ptr.autoModeTimer:addFrame(r1_311) == true and g_msgspeed ~= 100 then
      startCfg2Preview()
    end
    if g_configPage == 3 and g_Menu.Config.ptr.SliderMoveNo == -1 then
      local r2_311 = g_mixer:getMasterVolume()
      if g_mixer:getMasterMute() ~= false or not r2_311 then
        r2_311 = 0
      end
      if g_Menu.Config.ptr.ButtonP3.SL_MasterVol:bt_GetParamX() ~= r2_311 then
        g_Menu.Config.ptr.ButtonP3.SL_MasterVol:bt_SetParamX(r2_311)
        g_Menu.Config.ptr:SetSlideActP3(g_Menu.Config.ptr.MenuButton.selCursor)
      end
    end
  elseif r0_311 == "messageLog" then
    drawSceneJumpIcon()
  elseif r0_311 == "cmdLine" then
    setIMState()
  end
end
function updateNewIconC(r0_312)
  -- line: [12473, 12491] id: 312
  local r1_312 = ConfigGetPageKeyName(g_configPage)
  local r2_312 = g_configPage
  if r2_312 == 4 then
    r2_312 = true or false
  else
    goto label_9	-- block#2 is visited secondly
  end
  updateNewIcon(r1_312, g_dataInfo.page, r2_312)
  if r0_312 == DATA_MODE_QUICK then
    playSystemVoice(0)
    playSystemVoice(SYSVOICE_QSAVE)
  elseif getSystemSet() == "configBase" and g_Menu.Config.ptr ~= nil then
    g_Menu.Config.ptr:SetConfigButtonActive(g_configPage)
  end
end
function initThumbnail(r0_313, r1_313, r2_313)
  -- line: [12494, 12698] id: 313
  if g_Menu.Config.ptr == nil then
    return 
  end
  local r3_313 = cclass.lua_Layers:create()
  local r4_313 = nil
  local r5_313 = nil
  if g_dataInfo.page == r0_0 then
    if r1_313 < 6 and g_autoOrder[r1_313] > 0 then
      r5_313 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_AUTO, g_autoOrder[r1_313])
    elseif g_quickOrder[r1_313 - 5] > 0 then
      r5_313 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_QUICK, g_quickOrder[r1_313 - 5])
    end
  else
    r5_313 = cfunc.CSaveDataManager__lua_GetThumbnailPath(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r1_313)
  end
  local r6_313 = getSaveThumbKey(r0_313, r1_313)
  local r7_313 = r3_313:insertThumbnailLayer("configBase", r6_313, r5_313, 1)
  local r8_313 = "Data" .. tostring(r1_313)
  local r9_313 = 272 + 163 * (r1_313 - 1) % 5
  if r1_313 >= 6 then
    r9_313 = r9_313 + 102
  end
  local r10_313 = nil	-- notice: implicit variable refs by block#[14, 17, 29, 38, 44]
  if r1_313 < 6 then
    r10_313 = 150
    if not r10_313 then
      ::label_82::
      r10_313 = 379
    end
  else
    goto label_82	-- block#13 is visited secondly
  end
  r3_313:setParam("configBase", r6_313, LUA_PARAM_POS, r9_313 + 10, r10_313 + 30, 0, 0)
  if false and r2_313 == true then
    local r13_313 = getEffectRate()
    r3_313:setEffect("configBase", r6_313, "Update", LUA_EFFECT_SCALE, 0.08, 0.08, 0, 0, 0, 150 * r13_313, 0, 0)
    r3_313:setEffect("configBase", r6_313, "Update", LUA_EFFECT_SCALE, -0.08, -0.08, 0, 0, 0, 100 * r13_313, 0, 0)
    r3_313:startEffect("configBase", r6_313, "Update", 2)
  end
  local r13_313 = g_Menu.Config.ptr:DataOverName(r0_313, r1_313)
  r3_313:removeLayer("configBase", r13_313)
  g_Menu.Config.ptr:MenuLoadLayer(r13_313, "sys_config_P4TH.pna")
  r3_313:initSubLayer("configBase", r13_313, 0, 0)
  r3_313:initSubLayer("configBase", r13_313, 1, 0)
  r3_313:setParam("configBase", r13_313, LUA_PARAM_POS, r9_313, r10_313, 0, 0)
  if false then
    if g_dataInfo.page == r0_0 then
      local r14_313 = 0
      local r15_313 = 0
      local r16_313 = 0
      local r17_313 = 0
      if r1_313 < 6 then
        local r18_313 = {
          [1] = 40,
          [2] = 12 - r1_313,
          [3] = 24,
          [4] = 36,
        }
        local r19_313 = 12
        for r23_313, r24_313 in pairs(r18_313) do
          r3_313:initSubLayer("configBase", r13_313, r24_313, 1)
          r14_313, r15_313, r16_313, r17_313 = r3_313:getSubLayerParam("configBase", r13_313, r24_313, LUA_PARAM_POS, r14_313, r15_313, r16_313, r17_313)
          r3_313:setSubLayerParam("configBase", r13_313, r24_313, LUA_PARAM_POS, r14_313 + r19_313, r15_313, 0, 0)
        end
      else
        local r18_313 = {
          [1] = 39,
          [2] = 12 - r1_313 - 5,
          [3] = 24,
          [4] = 36,
        }
        local r19_313 = 15
        for r23_313, r24_313 in pairs(r18_313) do
          r3_313:initSubLayer("configBase", r13_313, r24_313, 1)
          r14_313, r15_313, r16_313, r17_313 = r3_313:getSubLayerParam("configBase", r13_313, r24_313, LUA_PARAM_POS, r14_313, r15_313, r16_313, r17_313)
          r3_313:setSubLayerParam("configBase", r13_313, r24_313, LUA_PARAM_POS, r14_313 + r19_313, r15_313, 0, 0)
        end
      end
    else
      r3_313:initSubLayer("configBase", r13_313, 38, 1)
      local r14_313 = (g_dataInfo.page - 1) * 10 + r1_313
      local r15_313 = {
        [1] = r14_313 % 10,
        [2] = math.floor(r14_313 / 10) % 10,
        [3] = math.floor(r14_313 / 100),
      }
      r3_313:initSubLayer("configBase", r13_313, 12 - r15_313[1], 1)
      r3_313:initSubLayer("configBase", r13_313, 24 - r15_313[2], 1)
      r3_313:initSubLayer("configBase", r13_313, 36 - r15_313[3], 1)
    end
  end
  local r14_313 = getSaveThumbTimeTxt(r0_313, r1_313)
  r3_313:insertTextLayer("configBase", r14_313, 160, 20, 2, 2, 14, 2, 0, 1)
  r3_313:setParam("configBase", r14_313, LUA_PARAM_POS, r9_313 + 12, r10_313 + 110, 0, 0)
  local r15_313 = ""
  if g_dataInfo.page == r0_0 then
    if r1_313 < 6 then
      r15_313 = r15_313 .. cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_AUTO, g_autoOrder[r1_313])
    else
      r15_313 = r15_313 .. cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_QUICK, g_quickOrder[r1_313 - 5])
    end
  else
    r15_313 = r15_313 .. cfunc.CSaveDataManager__lua_GetSaveDataDate(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r1_313)
  end
  local r16_313 = getDefaultFont()
  if r0_313 then
    r3_313:setText("configBase", r14_313, r15_313, r16_313, 10, 0, 0, g_saveTextColor.time, g_saveTextColor.timeEdge)
  else
    r3_313:setText("configBase", r14_313, r15_313, r16_313, 10, 0, 0, g_saveTextColor.time2, g_saveTextColor.timeEdge2)
  end
  if g_UseSaveNoTxt then
    local r17_313 = getSaveThumbNoTxt(r0_313, r1_313)
    r3_313:insertTextLayer("configBase", r17_313, 210, 20, 2, 2, 14, 2, 0, 1)
    r3_313:setParam("configBase", r17_313, LUA_PARAM_POS, r9_313 + 12, r10_313 + 12, 0, 0)
    r15_313 = ""
    if g_dataInfo.page == r0_0 then
      if r1_313 < 6 then
        r15_313 = "AUTO." .. tostring(r1_313)
      else
        r15_313 = "QUICK." .. tostring(r1_313 - 5)
      end
    else
      r15_313 = string.format("%02d", (g_dataInfo.page - 1) * 10 + r1_313) .. "  "
    end
    r3_313:setText("configBase", r17_313, r15_313, r16_313, 10, 0, 0, g_saveTextColor.No, g_saveTextColor.NoEdge)
  end
  local r17_313 = getSaveThumbTxt(r0_313, r1_313)
  r3_313:insertTextLayer("configBase", r17_313, 146, 90, 8, 8, 14, 2, 0, 1)
  r3_313:setParam("configBase", r17_313, LUA_PARAM_POS, r9_313 + 7, r10_313 + 130, 0, 0)
  r15_313 = ""
  if g_dataInfo.page == r0_0 then
    if r1_313 < 6 then
      r15_313 = r15_313 .. cfunc.CSaveDataManager__lua_GetSaveDataChapter(DATA_MODE_AUTO, g_autoOrder[r1_313], getGameEngineVersion())
    else
      r15_313 = r15_313 .. cfunc.CSaveDataManager__lua_GetSaveDataChapter(DATA_MODE_QUICK, g_quickOrder[r1_313 - 5], getGameEngineVersion())
    end
  else
    r15_313 = r15_313 .. cfunc.CSaveDataManager__lua_GetSaveDataChapter(DATA_MODE_NORMAL, (g_dataInfo.page - 1) * 10 + r1_313, getGameEngineVersion())
  end
  r3_313:setText("configBase", r17_313, r15_313, r16_313, 10, 0, 0, g_saveTextColor.normal, g_saveTextColor.normalEdge)
end
function playSystemVoice(r0_314)
  -- line: [12703, 12712] id: 314
  local r1_314 = getSystemvoiceNo()
  if r1_314 <= 0 then
    return 
  end
  playSystemVoiceNo(r0_314, r1_314)
end
function getSystemvoiceNo()
  -- line: [12714, 12762] id: 315
  local r0_315 = 19
  if g_TrialFlag == 1 then
    r0_315 = 6
  end
  local r1_315 = 0
  local r2_315 = os.time()
  local r3_315 = 0
  for r7_315 = 0, r0_315, 1 do
    if cfunc.LegacyGame__lua_GetFlag(1010 + r7_315) == true then
      r3_315 = r3_315 + 1
    end
  end
  if r3_315 == 0 then
    return 0
  end
  local r4_315 = r2_315 % r3_315 + 1
  r3_315 = 0
  for r8_315 = 0, r0_315, 1 do
    if cfunc.LegacyGame__lua_GetFlag(1010 + r8_315) == true and r3_315 + 1 == r4_315 then
      r1_315 = r8_315 + 1
      break
    end
  end
  if g_sysVoiceChar ~= 999 then
    r1_315 = g_sysVoiceChar
  end
  return r1_315
end
function playSystemVoiceNo(r0_316, r1_316)
  -- line: [12765, 13247] id: 316
  if false then
    return 
  end
  local r2_316 = {
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
  if r2_316[r1_316] == nil then
    return 
  end
  local r3_316 = {
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
      "HIKA_INF_0185.ogg"
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
      "C_HIKA_INF_0198.ogg"
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
      "SAYA_INF_0172.ogg"
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
      "C_SAYA_INF_0185.ogg"
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
      "ORI_INF_0133.ogg"
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
      "KORO_INF_0141.ogg"
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
      "C_KORO_INF_0154.ogg"
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
      "MIHA_INF_0044.ogg"
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
      "TAKE_INF_0022.ogg"
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
      "C_TAKE_INF_0001.ogg"
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
      "YOSHI_INF_0018.ogg"
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
      "KANO_INF_0017.ogg"
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
      "JINNO_INF_0020.ogg"
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
      "TAJI_INF_0007.ogg"
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
      "CHAMP_INF_0001.ogg"
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
      "KOTA_INF_0026.ogg"
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
      "HINA_INF_0010.ogg"
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
      "TOYO_INF_0001.ogg"
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
      "KAWA_INF_0001.ogg"
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
      "MORI_INF_0001.ogg"
    },
  }
  local r4_316 = cclass.lua_Sounds:new()
  for r8_316, r9_316 in pairs(r2_316) do
    local r10_316 = r9_316 .. "SysVoice"
    local r13_316 = "SndStop"
    r13_316 = r10_316
    r4_316:[r13_316](r13_316)
  end
  r4_316:delete()
  local r5_316 = r3_316[r1_316][r0_316]
  if r5_316 == nil then
    return 
  end
  local r6_316 = cclass.lua_Sounds:new()
  local r7_316 = r2_316[r1_316] .. "SysVoice"
  local r10_316 = "SndPlay"
  r10_316 = r7_316
  r6_316:[r10_316](r10_316, getSoundArcFileName("systemvoice", r5_316), r5_316, getSoundVolume(r7_316))
  r6_316:delete()
end
AutoModeTimer = {}
function AutoModeTimer.new()
  -- line: [13258, 13290] id: 317
  return {
    textLength = 0,
    waitLength = 0,
    carryTime = 0,
    enable = false,
    start = function(r0_318, r1_318)
      -- line: [13265, 13270] id: 318
      r0_318.enable = true
      r0_318.textLength = r1_318
      r0_318.waitLength = 0
      r0_318.carryTime = 0
    end,
    addFrame = function(r0_319, r1_319)
      -- line: [13272, 13284] id: 319
      if r0_319.enable == true then
        local r2_319 = getAutoWaitTime()
        local r3_319 = math.floor((r1_319 + r0_319.carryTime) / r2_319)
        r0_319.carryTime = r1_319 + r0_319.carryTime - r2_319 * r3_319
        r0_319.waitLength = r0_319.waitLength + r3_319
        if r0_319.textLength <= r0_319.waitLength then
          return true
        end
      end
      return false
    end,
    reset = function(r0_320)
      -- line: [13286, 13288] id: 320
      r0_320.enable = false
    end,
  }
end
GraphBar = {}
function GraphBar.new(r0_321, r1_321, r2_321, r3_321, r4_321, r5_321, r6_321)
  -- line: [13296, 13388] id: 321
  return {
    now = 0,
    max = r2_321,
    layerset = r0_321,
    layerkey = r1_321,
    memberLayer = {
      r3_321,
      r4_321,
      r5_321,
      r6_321
    },
    init = function(r0_322, r1_322)
      -- line: [13304, 13320] id: 322
      local r2_322 = cclass.lua_Layers:create()
      for r6_322 = 1, #r0_322.memberLayer, 1 do
        r2_322:initSubLayer(r0_322.layerset, r0_322.layerkey, r0_322.memberLayer[r6_322], 1)
        if r6_322 == 1 then
          r2_322:setSubLayerParam(r0_322.layerset, r0_322.layerkey, r0_322.memberLayer[r6_322], LUA_PARAM_COLOR, 1, 1, 1, 0)
          r2_322:setSubLayerHitTest(r0_322.layerset, r0_322.layerkey, r0_322.memberLayer[r6_322], 1, 0)
        elseif r6_322 == 2 then
          r0_322:updateBar(r1_322)
        elseif r6_322 == 4 then
          r2_322:setSubLayerParam(r0_322.layerset, r0_322.layerkey, r0_322.memberLayer[r6_322], LUA_PARAM_COLOR, 1, 1, 1, 0)
        end
      end
    end,
    updateBar = function(r0_323, r1_323)
      -- line: [13322, 13336] id: 323
      if r0_323.max > 0 then
        local r2_323 = cclass.lua_Layers:create()
        if r1_323 == 0 then
          r2_323:setSubLayerParam(r0_323.layerset, r0_323.layerkey, r0_323.memberLayer[2], LUA_PARAM_COLOR, 1, 1, 1, 0)
        else
          r2_323:setSubLayerParam(r0_323.layerset, r0_323.layerkey, r0_323.memberLayer[2], LUA_PARAM_COLOR, 1, 1, 1, 1)
          local r3_323 = 0
          local r4_323 = 0
          r3_323, r4_323, r5_323, r6_323 = r2_323:getSubLayerParam(r0_323.layerset, r0_323.layerkey, r0_323.memberLayer[2], LUA_PARAM_SIZE, r3_323, r4_323, 0, 0)
          r2_323:setSubLayerParam(r0_323.layerset, r0_323.layerkey, r0_323.memberLayer[2], LUA_PARAM_RECT, 0, 0, r3_323 * r1_323 / r0_323.max, r4_323)
        end
      end
      r0_323.now = r1_323
    end,
    changeFocus = function(r0_324, r1_324, r2_324)
      -- line: [13338, 13352] id: 324
      local r3_324 = cclass.lua_Layers:create()
      if r2_324 == r0_324:getInput() then
        local r4_324 = cclass.lua_Sounds:new()
        r4_324:SndPlay("systemse", getSoundArcFileName("systemse", "SYS01.ogg"), "SYS01.ogg", getSoundVolume("systemse"))
        r4_324:delete()
        r3_324:setSubLayerParam(r0_324.layerset, r0_324.layerkey, r0_324.memberLayer[3], LUA_PARAM_COLOR, 1, 1, 1, 0)
        r3_324:setSubLayerParam(r0_324.layerset, r0_324.layerkey, r0_324.memberLayer[4], LUA_PARAM_COLOR, 1, 1, 1, 1)
      elseif r1_324 == r0_324:getInput() then
        r3_324:setSubLayerParam(r0_324.layerset, r0_324.layerkey, r0_324.memberLayer[3], LUA_PARAM_COLOR, 1, 1, 1, 1)
        r3_324:setSubLayerParam(r0_324.layerset, r0_324.layerkey, r0_324.memberLayer[4], LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
    end,
    onLButtonDown = function(r0_325, r1_325, r2_325, r3_325, r4_325)
      -- line: [13354, 13378] id: 325
      if r1_325 == r0_325:getInput() then
        local r5_325 = cclass.lua_Layers:create()
        local r6_325 = 0
        r6_325, r7_325, r8_325, r9_325 = r5_325:getSubLayerParam(r0_325.layerset, r0_325.layerkey, r0_325.memberLayer[2], LUA_PARAM_SIZE, r6_325, 0, 0, 0)
        local r10_325 = 0
        r10_325, r11_325, r12_325, r13_325 = r5_325:getSubLayerParam(r0_325.layerset, r0_325.layerkey, r0_325.memberLayer[2], LUA_PARAM_POS, r10_325, 0, 0, 0)
        local r14_325 = r4_325
        if r2_325 <= r10_325 then
          r14_325 = 0
        elseif r10_325 + r6_325 <= r2_325 then
          r14_325 = r2_321
        else
          r14_325 = math.modf(r2_321 * (r2_325 - r10_325) / r6_325)
        end
        if r4_325 ~= r14_325 then
          r0_325:updateBar(r14_325)
        end
        return r14_325
      end
      return r4_325
    end,
    getInput = function(r0_326)
      -- line: [13380, 13382] id: 326
      return r0_326.memberLayer[1]
    end,
    getValue = function(r0_327)
      -- line: [13384, 13386] id: 327
      return r0_327.now
    end,
  }
end
ScrollBar = {}
function ScrollBar.new(r0_328, r1_328, r2_328, r3_328, r4_328, r5_328, r6_328)
  -- line: [13395, 13489] id: 328
  local r7_328 = {
    layerset = r0_328,
    layerkey = r1_328,
    layerno = r2_328,
    drug = false,
  }
  local r8_328 = {
    left = r3_328,
    top = r4_328,
    right = r3_328 + r5_328,
    bottom = r4_328 + r6_328,
  }
  r7_328.rect = r8_328
  if r5_328 < r6_328 then
    r8_328 = true or false
  else
    goto label_18	-- block#2 is visited secondly
  end
  r7_328.vertical = r8_328
  function r7_328.getNearSelect(r0_329, r1_329, r2_329, r3_329)
    -- line: [13404, 13434] id: 329
    local r4_329 = cclass.lua_Layers:create()
    local r5_329 = 0
    local r6_329 = 0
    r5_329, r6_329, r7_329, r8_329 = r4_329:getSubLayerParam(r0_329.layerset, r0_329.layerkey, r0_329.layerno, LUA_PARAM_SIZE, r5_329, r6_329, 0, 0)
    if r0_329.vertical == true then
      local r9_329 = r2_329 - r0_329.rect.top
      local r10_329 = r0_329.rect.bottom - r0_329.rect.top - r6_329
      if r9_329 < r6_329 / 2 then
        return 0
      elseif r10_329 < r9_329 then
        return r3_329
      end
      return math.modf(r3_329 * r9_329 / r10_329)
    else
      local r9_329 = r1_329 - r0_329.rect.left
      local r10_329 = r0_329.rect.right - r0_329.rect.left - r5_329
      if r9_329 < r5_329 / 2 then
        return 0
      elseif r10_329 < r9_329 then
        return r3_329
      end
      return math.modf(r3_329 * r9_329 / r10_329)
    end
  end
  function r7_328.onLButtonDown(r0_330, r1_330, r2_330, r3_330, r4_330, r5_330, r6_330)
    -- line: [13436, 13452] id: 330
    if r6_330 == true then
      return -1
    end
    if r0_330.layerno == r1_330 then
      r0_330.drug = true
    elseif r0_330.rect.left <= r2_330 and r2_330 < r0_330.rect.right and r0_330.rect.top <= r3_330 and r3_330 < r0_330.rect.bottom then
      return r0_330:getNearSelect(r2_330, r3_330, r4_330)
    end
    return -1
  end
  function r7_328.onLButtonUp(r0_331, r1_331, r2_331)
    -- line: [13454, 13458] id: 331
    if r0_331.drug == true then
      r0_331.drug = false
    end
  end
  function r7_328.isDrug(r0_332)
    -- line: [13460, 13462] id: 332
    return r0_332.drug
  end
  function r7_328.setSliderPos(r0_333, r1_333, r2_333)
    -- line: [13464, 13487] id: 333
    local r3_333 = cclass.lua_Layers:create()
    if r1_333 == 1 then
      r3_333:setSubLayerParam(r0_333.layerset, r0_333.layerkey, r0_333.layerno, LUA_PARAM_COLOR, 1, 1, 1, 0)
      return 
    end
    r3_333:setSubLayerParam(r0_333.layerset, r0_333.layerkey, r0_333.layerno, LUA_PARAM_COLOR, 1, 1, 1, 1)
    local r4_333 = 0
    local r5_333 = 0
    r4_333, r5_333, r6_333, r7_333 = r3_333:getSubLayerParam(r0_333.layerset, r0_333.layerkey, r0_333.layerno, LUA_PARAM_SIZE, r4_333, r5_333, 0, 0)
    local r8_333 = 0
    local r9_333 = 0
    local r10_333 = 0
    local r11_333 = 0
    r8_333, r9_333, r10_333, r11_333 = r3_333:getSubLayerParam(r0_328, r1_328, r0_333.layerno, LUA_PARAM_POS, r8_333, r9_333, r10_333, r11_333)
    if r0_333.vertical == true then
      r9_333 = math.floor(r0_333.rect.top + (r0_333.rect.bottom - r0_333.rect.top - r5_333) / (r1_333 - 1) * r2_333)
    else
      r8_333 = math.floor(r0_333.rect.left + (r0_333.rect.right - r0_333.rect.left - r4_333) / (r1_333 - 1) * r2_333)
    end
    r3_333:setSubLayerParam(r0_333.layerset, r0_333.layerkey, r0_333.layerno, LUA_PARAM_POS, r8_333, r9_333, r10_333, r11_333)
  end
  return r7_328
end
Menu = {}
function Menu.new(r0_334)
  -- line: [13500, 13802] id: 334
  local r1_334 = {
    MenuInf = {},
  }
  r1_334.MenuInf.enabled = false
  r1_334.MenuInf.effect = false
  r1_334.MenuInf.SetName = r0_334
  r1_334.MenuInf.ButtonLayer = ""
  r1_334.MenuInf.ButtonPna = ""
  r1_334.MenuButton = nil
  r1_334.MenuButtonData = {}
  function r1_334.MenuEffect(r0_335)
    -- line: [13519, 13528] id: 335
    local r1_335 = false
    r1_335 = r0_335:MenuEffectTransJob()
    if r0_335.MenuInf.effect == true and r1_335 == false then
      r0_335:MenuEffectEndJob()
      r0_335.MenuInf.effect = false
    end
    return r1_335
  end
  function r1_334.MenuEffectTransJob(r0_336)
    -- line: [13533, 13542] id: 336
    local r1_336 = cclass.lua_Layers:create()
    if r0_336.MenuInf.enabled == true then
      return r1_336:isTransition(r0_336.MenuInf.SetName)
    else
      return r1_336:isTransition(r0_336.MenuInf.SetName)
    end
  end
  function r1_334.MenuEffectEndJob(r0_337)
    -- line: [13544, 13571] id: 337
    local r1_337 = cclass.lua_Layers:create()
    if r0_337.MenuInf.enabled == true then
      local r2_337 = 0
      local r3_337 = 0
      local r4_337 = cclass.lua_AutoCursor:new()
      r2_337, r3_337 = r4_337:GetCursorPos(r2_337, r3_337)
      r4_337:delete()
      r0_337.MenuButton:changeButton(r0_337.MenuInf.SetName, r1_337:getCursorPos(r0_337.MenuInf.SetName, r2_337, r3_337, 0) - 1, r2_337, r3_337)
    else
      if g_menuExecute == false then
        r1_337:removeSnap("system")
      end
      r1_337:remove(r0_337.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_337.MenuInf.ButtonLayer = ""
      r0_337.MenuInf.ButtonPna = ""
    end
  end
  function r1_334.MenuEffectStart(r0_338, r1_338, r2_338)
    -- line: [13573, 13580] id: 338
    local r3_338 = cclass.lua_Layers:create()
    local r4_338 = cclass.lua_MeasureTime:new()
    local r5_338 = getEffectRate()
    r3_338:startTransition(r0_338.MenuInf.SetName, 0, 1, r1_338 * r5_338, r2_338 * r4_338:diff() * r5_338, LUA_TRANSITION_NORMAL)
    r4_338:delete()
  end
  function r1_334.MenuEffectEnd(r0_339, r1_339)
    -- line: [13582, 13590] id: 339
    local r2_339 = cclass.lua_Layers:create()
    local r3_339 = getEffectRate()
    r2_339:setSnap(r0_339.MenuInf.SetName, false)
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_RTSNAP, 0)
    r2_339:startTransition(r0_339.MenuInf.SetName, 0, 1, r1_339 * r3_339, 0, LUA_TRANSITION_ERASE)
  end
  function r1_334.MenuEffectToMenu(r0_340, r1_340)
    -- line: [13592, 13600] id: 340
    local r2_340 = cclass.lua_Layers:create()
    r2_340:removeSnap("system")
    r2_340:rtSnap("system")
    local r3_340 = getEffectRate()
    r2_340:setSnap(r0_340.MenuInf.SetName, false)
    r2_340:startTransition(r0_340.MenuInf.SetName, 0, 1, r1_340 * r3_340, 0, LUA_TRANSITION_ERASE)
  end
  function r1_334.MenuInit(r0_341, r1_341, r2_341)
    -- line: [13605, 13627] id: 341
    local r3_341 = true
    r0_341.MenuInf.enabled = false
    r0_341.MenuInf.effect = false
    r0_341.MenuInf.ButtonLayer = r1_341
    r0_341.MenuInf.ButtonPna = r2_341
    if cclass.lua_Layers:create():add(r0_341.MenuInf.SetName) == false then
      return false
    end
    r0_341:MenuLoadLayer(r1_341, r2_341)
    r0_341.MenuButton = Button.new(r0_341.MenuInf.SetName)
    r0_341.MenuButton:InitList()
    r0_341.MenuButtonData = {}
    return r3_341
  end
  function r1_334.MenuLoadLayer(r0_342, r1_342, r2_342)
    -- line: [13630, 13640] id: 342
    local r3_342 = cclass.lua_Layers:create()
    local r4_342 = getGraphicsArcFileName(r0_342.MenuInf.SetName, r2_342)
    local r5_342 = false
    if string.lower(string.sub(r2_342, -4)) == ".pna" then
      r5_342 = r3_342:insertLayer(r0_342.MenuInf.SetName, r1_342, LUA_LAYER_PNA, r4_342, r2_342, 1)
    else
      r5_342 = r3_342:insertLayer(r0_342.MenuInf.SetName, r1_342, LUA_LAYER_STD, r4_342, r2_342, 1)
    end
    return r5_342
  end
  function r1_334.MenuButtonInit(r0_343)
    -- line: [13645, 13651] id: 343
    if r0_343.MenuButton ~= nil then
      r0_343.MenuButton:SetList("MenuButtonData", r0_343.MenuButtonData)
      r0_343.MenuButton:InitButton()
    end
  end
  function r1_334.MenuButtonSet(r0_344, r1_344, r2_344, r3_344, r4_344, r5_344, r6_344, r7_344, r8_344, r9_344, r10_344, r11_344, r12_344)
    -- line: [13654, 13656] id: 344
    r1_344[r2_344] = r0_344.MenuButton:ButtonCreate(r2_344, r3_344, r4_344, r5_344, r6_344, r7_344, r8_344, r9_344, r10_344, r11_344, "SYS01.ogg", "SYS03.ogg", r12_344)
  end
  function r1_334.MenuMoveButtonSet(r0_345, r1_345, r2_345, r3_345, r4_345, r5_345, r6_345, r7_345, r8_345, r9_345, r10_345, r11_345, r12_345)
    -- line: [13659, 13663] id: 345
    r1_345[r2_345] = r0_345.MenuButton:Movable(r0_345.MenuButton:ButtonCreate(r2_345, r3_345, r4_345, r5_345, r6_345, r7_345, r8_345, r9_345, r10_345, r11_345, "SYS01.ogg", "SYS03.ogg", r12_345))
  end
  function r1_334.MenuAnimButtonSet(r0_346, r1_346, r2_346, r3_346, r4_346, r5_346, r6_346, r7_346, r8_346, r9_346, r10_346, r11_346, r12_346, r13_346)
    -- line: [13666, 13670] id: 346
    r2_346[r3_346] = r0_346.MenuButton:Animatable(r1_346, r0_346.MenuButton:ButtonCreate(r3_346, r4_346, r5_346, r6_346, r7_346, r8_346, r9_346, r10_346, r11_346, r12_346, "SYS01.ogg", "SYS03.ogg", r13_346))
  end
  function r1_334.SystemSePlay(r0_347, r1_347)
    -- line: [13675, 13679] id: 347
    local r2_347 = cclass.lua_Sounds:new()
    r2_347:SndPlay("systemse", getSoundArcFileName("systemse", r1_347), r1_347, getSoundVolume("systemse"))
    r2_347:delete()
  end
  function r1_334.MenuButtonJobPos(r0_348, r1_348, r2_348, r3_348, r4_348)
    -- line: [13682, 13684] id: 348
    r0_348:MenuButtonJob(r1_348, r2_348)
  end
  function r1_334.MenuButtonJob(r0_349, r1_349, r2_349)
    -- line: [13685, 13692] id: 349
  end
  function r1_334.GetMenuActive(r0_350)
    -- line: [13695, 13701] id: 350
    local r1_350 = false
    if r0_350.MenuInf.enabled == true or r0_350.MenuInf.effect == true then
      r1_350 = true
    end
    return r1_350
  end
  function r1_334.GetMenuMouseEnable(r0_351)
    -- line: [13704, 13710] id: 351
    local r1_351 = false
    if r0_351.MenuInf.enabled == true and r0_351.MenuInf.effect == false and r0_351.MenuButton ~= nil then
      r1_351 = true
    end
    return r1_351
  end
  function r1_334.MenuMouseMove(r0_352, r1_352, r2_352, r3_352, r4_352, r5_352, r6_352)
    -- line: [13714, 13723] id: 352
    if r6_352 == true then
      return 
    end
    if r0_352:GetMenuMouseEnable() then
      r0_352.MenuButton:mouseMove(r2_352, r3_352, r4_352, r5_352)
    end
  end
  function r1_334.MenuLButtonDown(r0_353, r1_353, r2_353, r3_353, r4_353, r5_353, r6_353)
    -- line: [13727, 13738] id: 353
    local r7_353 = 0
    if r6_353 == true then
      return r7_353
    end
    if r0_353:GetMenuMouseEnable() then
      r7_353 = r0_353.MenuButton:mouseLdown(r2_353, r3_353, r4_353, r5_353, r6_353)
    end
    r0_353:MenuButtonJobPos(r7_353, "LD", r4_353, r5_353)
    return r7_353
  end
  function r1_334.MenuLButtonUp(r0_354, r1_354, r2_354, r3_354, r4_354, r5_354, r6_354)
    -- line: [13742, 13753] id: 354
    local r7_354 = 0
    if r6_354 == true then
      return r7_354
    end
    if r0_354:GetMenuMouseEnable() then
      r7_354 = r0_354.MenuButton:mouseLup(r2_354, r3_354, r4_354, r5_354, r6_354)
    end
    r0_354:MenuButtonJobPos(r7_354, "LU", r4_354, r5_354)
    return r7_354
  end
  function r1_334.MenuRButtonDown(r0_355, r1_355, r2_355, r3_355, r4_355, r5_355, r6_355)
    -- line: [13757, 13768] id: 355
    local r7_355 = 0
    if r6_355 == true then
      return r7_355
    end
    if r0_355:GetMenuMouseEnable() then
      r7_355 = r0_355.MenuButton:mouseRdown(r2_355, r3_355, r4_355, r5_355, r6_355)
    end
    r0_355:MenuButtonJobPos(r7_355, "RD", r4_355, r5_355)
    return r7_355
  end
  function r1_334.MenuRButtonUp(r0_356, r1_356, r2_356, r3_356, r4_356, r5_356, r6_356)
    -- line: [13772, 13783] id: 356
    local r7_356 = 0
    if r6_356 == true then
      return r7_356
    end
    if r0_356:GetMenuMouseEnable() then
      r7_356 = r0_356.MenuButton:mouseRup(r2_356, r3_356, r4_356, r5_356, r6_356)
    end
    r0_356:MenuButtonJobPos(r7_356, "RU", r4_356, r5_356)
    return r7_356
  end
  function r1_334.MenuMButtonDown(r0_357, r1_357, r2_357, r3_357, r4_357, r5_357, r6_357)
    -- line: [13786, 13787] id: 357
  end
  function r1_334.MenuMButtonUp(r0_358, r1_358, r2_358, r3_358, r4_358, r5_358, r6_358)
    -- line: [13790, 13791] id: 358
  end
  function r1_334.MenuMouseWheel(r0_359, r1_359, r2_359)
    -- line: [13794, 13795] id: 359
  end
  function r1_334.MenuKeyDown(r0_360, r1_360, r2_360, r3_360, r4_360)
    -- line: [13798, 13799] id: 360
  end
  return r1_334
end
Button = {}
function Button.new(r0_361)
  -- line: [13810, 15203] id: 361
  local r1_361 = {
    selCursor = -1,
    selDownCursor = -1,
    sellayerset = r0_361,
    dataList = {},
    selListKey = nil,
    selDownKey = nil,
    onDropList = {},
    onDropFlag = false,
    ButtonCreate = function(r0_362, r1_362, r2_362, r3_362, r4_362, r5_362, r6_362, r7_362, r8_362, r9_362, r10_362, r11_362, r12_362, r13_362)
      -- line: [13830, 13832] id: 362
      return r0_362:_ButtonCreate(-1, r1_362, r2_362, r3_362, r4_362, r5_362, r6_362, r7_362, r8_362, r9_362, r10_362, r11_362, r12_362, r13_362)
    end,
    _ButtonCreate = function(r0_363, r1_363, r2_363, r3_363, r4_363, r5_363, r6_363, r7_363, r8_363, r9_363, r10_363, r11_363, r12_363, r13_363, r14_363)
      -- line: [13834, 14385] id: 363
      local r15_363 = {}
      if r1_363 == -1 then
        r1_363 = r1_361.sellayerset
      end
      r15_363.layerset = r1_363
      r15_363.arg = r2_363
      r15_363.EVENT_TYPE = r3_363
      r15_363.layerkey = r4_363
      r15_363.SubLayer = {}
      function r15_363.bt_addLayer(r0_364, r1_364, r2_364)
        -- line: [13850, 13852] id: 364
        r0_364.SubLayer[r1_364] = {
          no = r2_364,
          x = 0,
          y = 0,
          r = 0,
          g = 0,
          b = 0,
          a = 0,
        }
      end
      r15_363:bt_addLayer("hit", r5_363)
      r15_363:bt_addLayer("def", r6_363)
      r15_363:bt_addLayer("on", r7_363)
      r15_363:bt_addLayer("act", r8_363)
      r15_363:bt_addLayer("dis", r9_363)
      r15_363.bt_l = r10_363
      r15_363.bt_r = r11_363
      function r15_363.bt_getLR(r0_365)
        -- line: [13865, 13867] id: 365
        return r0_365.bt_l, r0_365.bt_r
      end
      r15_363.se_on = r12_363
      r15_363.se_click = r13_363
      r15_363.priority = r14_363
      r15_363.active = 0
      r15_363.focusflag = false
      r15_363.initpos = {
        x = 0,
        y = 0,
      }
      r15_363.initrect = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
      }
      r15_363.DRAW_POS = {
        x = 0,
        y = 0,
      }
      r15_363.EVENT_RECT = {
        w = 0,
        h = 0,
      }
      function r15_363.bt_GetPos(r0_366)
        -- line: [13883, 13885] id: 366
        return r0_366.DRAW_POS.x, r0_366.DRAW_POS.y
      end
      function r15_363.bt_GetInitPos(r0_367)
        -- line: [13886, 13888] id: 367
        return r0_367.initpos.x, r0_367.initpos.y
      end
      r15_363.initFlag = false
      function r15_363.bt_init(r0_368)
        -- line: [13892, 13953] id: 368
        if r0_368.initFlag == false then
          r0_368.initFlag = true
          local r1_368 = false
          local r2_368 = cclass.lua_Layers:create()
          if r0_368.SubLayer.hit.no ~= -1 then
            r2_368:initSubLayer(r0_368.layerset, r0_368.layerkey, r0_368.SubLayer.hit.no, 1)
          end
          for r6_368, r7_368 in pairs(r0_368.SubLayer) do
            if r7_368.no ~= -1 then
              local r8_368 = 0
              local r9_368 = 0
              local r10_368 = 0
              local r11_368 = 0
              r2_368:initSubLayer(r0_368.layerset, r0_368.layerkey, r7_368.no, 1)
              r7_368.r, r7_368.g, r7_368.b, r7_368.a = r2_368:getSubLayerParam(r0_368.layerset, r0_368.layerkey, r7_368.no, LUA_PARAM_COLOR, r8_368, r9_368, r10_368, r11_368)
              if r7_368.no == r0_368.SubLayer.hit.no then
                r7_368.x = 0
                r7_368.y = 0
                if r7_368 ~= r0_368.SubLayer.hit then
                  r1_368 = true
                end
              else
                r8_368, r9_368, r10_368, r11_368 = r2_368:getSubLayerParam(r0_368.layerset, r0_368.layerkey, r0_368.SubLayer.hit.no, LUA_PARAM_POS, r8_368, r9_368, r10_368, r11_368)
                r7_368.x = r8_368
                r7_368.y = r9_368
                r8_368, r9_368, r10_368, r11_368 = r2_368:getSubLayerParam(r0_368.layerset, r0_368.layerkey, r7_368.no, LUA_PARAM_POS, r8_368, r9_368, r10_368, r11_368)
                r7_368.x = r8_368 - r7_368.x
                r7_368.y = r9_368 - r7_368.y
              end
            end
          end
          if r1_368 == false then
            r0_368.SubLayer.hit.a = 0
            r2_368:setSubLayerParam(r0_368.layerset, r0_368.layerkey, r0_368.SubLayer.hit.no, LUA_PARAM_COLOR, 1, 1, 1, 0)
          end
          r0_368.initrect.x, r0_368.initrect.y, r0_368.initrect.w, r0_368.initrect.h = r0_368:bt_GetLayerRect(r0_368.layerkey, r0_368.SubLayer.hit.no)
          r0_368.initpos.x = r0_368.initrect.x
          r0_368.initpos.y = r0_368.initrect.y
          r0_368.DRAW_POS.x = r0_368.initrect.x
          r0_368.DRAW_POS.y = r0_368.initrect.y
          r0_368.EVENT_RECT.w = r0_368.initrect.w - r0_368.initrect.x
          r0_368.EVENT_RECT.h = r0_368.initrect.h - r0_368.initrect.y
          if r0_368.EVENT_TYPE == 0 and r0_368.SubLayer.hit.no ~= -1 then
            r2_368:setSubLayerHitTest(r0_368.layerset, r0_368.layerkey, r0_368.SubLayer.hit.no, 1, 0)
          end
          r0_368:bt_SetActive(0)
        end
      end
      function r15_363.bt_SetColor(r0_369, r1_369, r2_369, r3_369, r4_369)
        -- line: [13956, 13963] id: 369
        local r5_369 = cclass.lua_Layers:create()
        for r9_369, r10_369 in pairs(r0_369.SubLayer) do
          if r10_369.no ~= -1 then
            r5_369:setSubLayerParam(r0_369.layerset, r0_369.layerkey, r10_369.no, LUA_PARAM_COLOR, r1_369, r2_369, r3_369, r4_369)
          end
        end
      end
      function r15_363.bt_ResetColor(r0_370)
        -- line: [13965, 13968] id: 370
        local r1_370 = cclass.lua_Layers:create()
        r0_370:bt_SetActive(r0_370.active)
      end
      function r15_363.bt_SetOnOffActive(r0_371)
        -- line: [13970, 14013] id: 371
        if r0_371.active == 0 then
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.act, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.dis, false)
          if r0_371.focusflag == false then
            r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.on, false)
            r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.def, true)
          elseif r0_371.SubLayer.on.no ~= -1 then
            r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.def, false)
            r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.on, true)
          else
            r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.on, false)
            r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.def, true)
          end
        end
        if r0_371.active == 1 then
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.def, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.on, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.dis, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.act, true)
        end
        if r0_371.active == 2 then
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.def, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.on, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.act, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.dis, true)
        end
        if r0_371.active == 3 then
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.def, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.on, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.act, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.dis, false)
        end
        if r0_371.active == 4 then
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.def, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.on, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.dis, false)
          r0_371:bt_SetEnableSubLayer(r0_371.SubLayer.act, true)
        end
      end
      function r15_363.bt_GetLayerRect(r0_372, r1_372, r2_372)
        -- line: [14017, 14019] id: 372
        return GetLayerRect(r0_372.layerset, r1_372, r2_372)
      end
      function r15_363.bt_getNowButtonParam(r0_373)
        -- line: [14022, 14063] id: 373
        local r1_373 = -1
        local r2_373 = 0
        local r3_373 = nil
        local r4_373 = 0
        local r5_373 = 0
        local r6_373 = 0
        local r7_373 = 0
        local r8_373 = "def"
        if r0_373.active == 0 then
          if r0_373.focusflag == false then
            r8_373 = "def"
          else
            r8_373 = "on"
          end
        end
        if r0_373.active == 1 then
          r8_373 = "act"
        end
        if r0_373.active == 2 then
          r8_373 = "dis"
        end
        if r0_373.active == 3 then
          r8_373 = -1
        end
        if r0_373.active == 4 then
          r8_373 = "act"
        end
        if r8_373 ~= -1 then
          r1_373 = r0_373.SubLayer[r8_373].no
          r2_373 = math.floor(r0_373.DRAW_POS.x + r0_373.SubLayer[r8_373].x)
          r3_373 = math.floor(r0_373.DRAW_POS.y + r0_373.SubLayer[r8_373].y)
          r4_373 = r0_373.SubLayer[r8_373].r
          r5_373 = r0_373.SubLayer[r8_373].g
          r6_373 = r0_373.SubLayer[r8_373].b
          r7_373 = r0_373.SubLayer[r8_373].a
        end
        return r1_373, r2_373, r3_373, r4_373, r5_373, r6_373, r7_373
      end
      function r15_363.bt_getNowKey(r0_374)
        -- line: [14066, 14072] id: 374
        local r1_374 = -1
        local r2_374 = 0
        local r3_374 = nil
        local r4_374 = 0
        local r5_374 = 0
        local r6_374 = 0
        local r7_374 = 0
        r1_374, r2_374, r3_374, r4_374, r5_374, r6_374, r7_374 = r0_374:bt_getNowButtonParam()
        return r1_374
      end
      function r15_363.bt_getNowColor(r0_375)
        -- line: [14073, 14079] id: 375
        local r1_375 = -1
        local r2_375 = 0
        local r3_375 = nil
        local r4_375 = 0
        local r5_375 = 0
        local r6_375 = 0
        local r7_375 = 0
        r1_375, r2_375, r3_375, r4_375, r5_375, r6_375, r7_375 = r0_375:bt_getNowButtonParam()
        return r4_375, r5_375, r6_375, r7_375
      end
      function r15_363.bt_change(r0_376, r1_376, r2_376, r3_376, r4_376)
        -- line: [14146, 14241] id: 376
        local r5_376 = cclass.lua_Layers:create()
        local r6_376 = 0
        local r7_376 = r0_376.priority
        if r0_376.active == 0 or r0_376.active == 4 then
          local r8_376 = {
            def = false,
            on = false,
          }
          if r0_376.EVENT_TYPE == 0 then
            if r0_376.SubLayer.hit.no ~= -1 and r0_376.SubLayer.hit.no == r2_376 then
              r6_376 = 1
              if r0_376.focusflag == false then
                r0_376:bt_PlayAnim()
              end
              r0_376.focusflag = true
            else
              r0_376.focusflag = false
              r0_376:bt_StopAnim()
            end
          elseif r0_376.DRAW_POS.x <= r3_376 and r0_376.DRAW_POS.y <= r4_376 and r3_376 < r0_376.DRAW_POS.x + r0_376.EVENT_RECT.w and r4_376 < r0_376.DRAW_POS.y + r0_376.EVENT_RECT.h then
            r6_376 = 1
            if r0_376.focusflag == false then
              r0_376:bt_PlayAnim()
            end
            r0_376.focusflag = true
          else
            r0_376.focusflag = false
            r0_376:bt_StopAnim()
          end
          if r0_376.active == 0 then
            if r0_376.focusflag == true then
              if r0_376.SubLayer.def.no ~= -1 then
                r8_376.def = false
              end
              if r0_376.SubLayer.on.no ~= -1 then
                r8_376.on = true
              else
                r8_376.def = true
              end
              r0_376:bt_OnCursorEvent(r1_376, r2_376, r3_376, r4_376)
            else
              if r0_376.SubLayer.def.no ~= -1 then
                r8_376.def = true
              end
              if r0_376.SubLayer.on.no ~= -1 then
                r8_376.on = false
              else
                r8_376.def = true
              end
              r0_376:bt_OffCursorEvent(r1_376, r2_376, r3_376, r4_376)
            end
            if r8_376.def == true then
              r0_376:bt_SetEnableSubLayer(r0_376.SubLayer.on, r8_376.on)
              r0_376:bt_SetEnableSubLayer(r0_376.SubLayer.def, r8_376.def)
            else
              r0_376:bt_SetEnableSubLayer(r0_376.SubLayer.def, r8_376.def)
              r0_376:bt_SetEnableSubLayer(r0_376.SubLayer.on, r8_376.on)
            end
          end
        end
        return r6_376, r7_376
      end
      function r15_363.bt_OnCursorEvent(r0_377, r1_377, r2_377, r3_377, r4_377)
        -- line: [14243, 14244] id: 377
      end
      function r15_363.bt_OffCursorEvent(r0_378, r1_378, r2_378, r3_378, r4_378)
        -- line: [14245, 14246] id: 378
      end
      function r15_363.bt_SetEnableSubLayer(r0_379, r1_379, r2_379)
        -- line: [14249, 14261] id: 379
        if r1_379.no ~= -1 then
          local r3_379 = cclass.lua_Layers:create()
          if r2_379 == true then
            r3_379:setSubLayerParam(r0_379.layerset, r0_379.layerkey, r1_379.no, LUA_PARAM_COLOR, r1_379.r, r1_379.g, r1_379.b, r1_379.a)
          else
            r3_379:setSubLayerParam(r0_379.layerset, r0_379.layerkey, r1_379.no, LUA_PARAM_COLOR, 1, 1, 1, 0)
          end
        end
      end
      function r15_363.bt_ResetActive(r0_380)
        -- line: [14264, 14269] id: 380
        for r4_380, r5_380 in pairs(r0_380.SubLayer) do
          r0_380:bt_SetEnableSubLayer(r5_380, true)
        end
      end
      function r15_363.bt_SetActive(r0_381, r1_381)
        -- line: [14273, 14334] id: 381
        local r2_381 = cclass.lua_Layers:create()
        if r1_381 == 0 then
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.on, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.act, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.dis, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.def, true)
          if r0_381.SubLayer.hit.no ~= -1 then
            r2_381:setSubLayerHitTest(r0_381.layerset, r0_381.layerkey, r0_381.SubLayer.hit.no, 1, 0)
          end
        end
        if r1_381 == 1 then
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.def, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.on, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.dis, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.act, true)
          if r0_381.SubLayer.hit.no ~= -1 then
            r2_381:setSubLayerHitTest(r0_381.layerset, r0_381.layerkey, r0_381.SubLayer.hit.no, 0, 0)
          end
          r0_381:bt_StopAnim()
        end
        if r1_381 == 2 then
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.def, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.on, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.act, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.dis, true)
          if r0_381.SubLayer.hit.no ~= -1 then
            r2_381:setSubLayerHitTest(r0_381.layerset, r0_381.layerkey, r0_381.SubLayer.hit.no, 0, 0)
          end
          r0_381:bt_StopAnim()
        end
        if r1_381 == 3 then
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.def, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.on, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.act, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.dis, false)
          if r0_381.SubLayer.hit.no ~= -1 then
            r2_381:setSubLayerHitTest(r0_381.layerset, r0_381.layerkey, r0_381.SubLayer.hit.no, 0, 0)
          end
          r0_381:bt_StopAnim()
        end
        if r1_381 == 4 then
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.def, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.on, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.dis, false)
          r0_381:bt_SetEnableSubLayer(r0_381.SubLayer.act, true)
          if r0_381.SubLayer.hit.no ~= -1 then
            r2_381:setSubLayerHitTest(r0_381.layerset, r0_381.layerkey, r0_381.SubLayer.hit.no, 1, 0)
          end
          r0_381:bt_StopAnim()
        end
        r0_381.active = r1_381
      end
      function r15_363.bt_OnSePlay(r0_382)
        -- line: [14338, 14344] id: 382
        if r0_382.se_on ~= nil then
          local r1_382 = cclass.lua_Sounds:new()
          r1_382:SndPlay("systemse", getSoundArcFileName("systemse", r0_382.se_on), r0_382.se_on, getSoundVolume("systemse"))
          r1_382:delete()
        end
      end
      function r15_363.bt_ClickSePlay(r0_383)
        -- line: [14345, 14351] id: 383
        if r0_383.se_click ~= nil then
          local r1_383 = cclass.lua_Sounds:new()
          r1_383:SndPlay("systemse", getSoundArcFileName("systemse", r0_383.se_click), r0_383.se_click, getSoundVolume("systemse"))
          r1_383:delete()
        end
      end
      function r15_363.bt_SetPos(r0_384, r1_384, r2_384)
        -- line: [14353, 14364] id: 384
        r0_384.DRAW_POS.x = r1_384
        r0_384.DRAW_POS.y = r2_384
        local r3_384 = cclass.lua_Layers:create()
        for r7_384, r8_384 in pairs(r0_384.SubLayer) do
          if r8_384.no ~= -1 then
            r3_384:setSubLayerParam(r0_384.layerset, r0_384.layerkey, r8_384.no, LUA_PARAM_POS, math.floor(r1_384 + r8_384.x), math.floor(r2_384 + r8_384.y), 0, 0)
          end
        end
      end
      function r15_363.bt_SetDefPos(r0_385)
        -- line: [14366, 14368] id: 385
        r0_385:bt_SetPos(r0_385.initrect.x, r0_385.initrect.y)
      end
      function r15_363.bt_PlayAnim(r0_386)
        -- line: [14371, 14372] id: 386
      end
      function r15_363.bt_StopAnim(r0_387)
        -- line: [14373, 14374] id: 387
      end
      function r15_363.bt_MovableStart(r0_388, r1_388, r2_388)
        -- line: [14377, 14378] id: 388
      end
      function r15_363.bt_MovableControl(r0_389, r1_389, r2_389)
        -- line: [14379, 14381] id: 389
        return false
      end
      return r15_363
    end,
    SetList = function(r0_390, r1_390, r2_390)
      -- line: [14390, 14392] id: 390
      r0_390.dataList[r1_390] = r2_390
    end,
    InitList = function(r0_391)
      -- line: [14394, 14397] id: 391
      r0_391.dataList = {}
      r0_391.onDropList = {}
    end,
    SetDropList = function(r0_392, r1_392, r2_392)
      -- line: [14399, 14401] id: 392
      r0_392.onDropList[r1_392] = r2_392
    end,
    InitButton = function(r0_393)
      -- line: [14407, 14430] id: 393
      r0_393.selCursor = -1
      r0_393.selDownCursor = -1
      r0_393.selListKey = nil
      r0_393.selDownKey = nil
      for r4_393, r5_393 in pairs(r0_393.dataList) do
        if r5_393 ~= nil then
          for r9_393, r10_393 in pairs(r5_393) do
            r10_393:bt_init()
          end
        end
      end
      for r4_393, r5_393 in pairs(r0_393.onDropList) do
        if r5_393 ~= nil then
          for r9_393, r10_393 in pairs(r5_393) do
            r10_393:bt_init()
          end
        end
      end
    end,
    ResetButtonActive = function(r0_394, r1_394)
      -- line: [14434, 14438] id: 394
      for r5_394, r6_394 in pairs(r1_394) do
        r6_394:bt_ResetActive()
      end
    end,
    ResetColor = function(r0_395, r1_395)
      -- line: [14444, 14448] id: 395
      for r5_395, r6_395 in pairs(r1_395) do
        r6_395:bt_ResetColor()
      end
    end,
    SetColor = function(r0_396, r1_396, r2_396, r3_396, r4_396, r5_396)
      -- line: [14450, 14454] id: 396
      for r9_396, r10_396 in pairs(r1_396) do
        r10_396:bt_SetColor(r2_396, r3_396, r4_396, r5_396)
      end
    end,
    changeButton = function(r0_397, r1_397, r2_397, r3_397, r4_397)
      -- line: [14458, 14516] id: 397
      local r5_397 = 0
      local r6_397 = -2
      if r0_397.selDownCursor ~= -1 then
        r5_397, r6_397 = r0_397.selDownKey[r0_397.selDownCursor]:bt_change(r1_397, r2_397, r3_397, r4_397)
        if r5_397 ~= 0 then
          r0_397.selCursor = r0_397.selDownCursor
          r0_397.selListKey = r0_397.selDownKey
        elseif r0_397.onDropFlag == true then
          r0_397:offCursor(r0_397.dataList)
          r0_397:offCursor(r0_397.onDropList)
          local r7_397 = -1
          local r8_397 = nil
          r7_397, r8_397 = r0_397:onCursor(r0_397.onDropList, r1_397, r2_397, r3_397, r4_397)
          if r7_397 ~= -1 then
            if r0_397.selCursor ~= r7_397 then
              r8_397[r7_397]:bt_OnSePlay()
            end
            r0_397.selCursor = r7_397
            r0_397.selListKey = r8_397
          else
            r0_397.selCursor = -1
            r0_397.selListKey = nil
          end
        else
          r0_397.selCursor = -1
          r0_397.selListKey = nil
        end
      end
      if r0_397.selDownCursor == -1 then
        local r7_397 = -1
        local r8_397 = nil
        r7_397, r8_397 = r0_397:onCursor(r0_397.dataList, r1_397, r2_397, r3_397, r4_397)
        if r7_397 ~= -1 then
          if r0_397.selCursor ~= r7_397 then
            r8_397[r7_397]:bt_OnSePlay()
          end
          r0_397.selCursor = r7_397
          r0_397.selListKey = r8_397
        else
          r0_397.selCursor = -1
          r0_397.selListKey = nil
        end
      end
    end,
    onCursor = function(r0_398, r1_398, r2_398, r3_398, r4_398, r5_398)
      -- line: [14520, 14547] id: 398
      local r6_398 = -1
      local r7_398 = -2
      local r8_398 = nil
      for r12_398, r13_398 in pairs(r1_398) do
        if r13_398 ~= nil then
          for r17_398, r18_398 in pairs(r13_398) do
            local r19_398 = 0
            local r20_398 = -2
            r19_398, r20_398 = r18_398:bt_change(r2_398, r3_398, r4_398, r5_398)
            if r19_398 ~= 0 and r7_398 < r20_398 then
              r6_398 = r17_398
              r7_398 = r20_398
              r8_398 = r13_398
            end
          end
        end
      end
      return r6_398, r8_398
    end,
    offCursor = function(r0_399, r1_399)
      -- line: [14551, 14565] id: 399
      for r5_399, r6_399 in pairs(r1_399) do
        if r6_399 ~= nil then
          for r10_399, r11_399 in pairs(r6_399) do
            if r11_399.active == 0 then
              r11_399.focusflag = false
              r11_399:bt_StopAnim()
              r11_399:bt_SetEnableSubLayer(r11_399.SubLayer.on, false)
              r11_399:bt_SetEnableSubLayer(r11_399.SubLayer.def, true)
            end
          end
        end
      end
    end,
    mouseMove = function(r0_400, r1_400, r2_400, r3_400, r4_400)
      -- line: [14569, 14577] id: 400
      local r5_400 = false
      if r0_400.selDownCursor ~= -1 then
        r5_400 = r0_400.selDownKey[r0_400.selDownCursor]:bt_MovableControl(r3_400, r4_400)
      end
      if r5_400 == false then
        r0_400:changeButton(r1_400, r2_400, r3_400, r4_400)
      end
    end,
    mouseLdown = function(r0_401, r1_401, r2_401, r3_401, r4_401, r5_401)
      -- line: [14582, 14598] id: 401
      local r6_401 = 0
      if _buttonrepeat == true then
        return r6_401
      end
      r0_401:changeButton(r1_401, r2_401, r3_401, r4_401)
      if r0_401.selCursor ~= -1 then
        r0_401.selDownCursor = r0_401.selCursor
        r0_401.selDownKey = r0_401.selListKey
        r0_401.selDownKey[r0_401.selDownCursor]:bt_MovableStart(r3_401, r4_401)
        r6_401 = r0_401.selDownKey[r0_401.selDownCursor].bt_l
      end
      return r6_401
    end,
    mouseLup = function(r0_402, r1_402, r2_402, r3_402, r4_402, r5_402)
      -- line: [14603, 14620] id: 402
      local r6_402 = 0
      if _buttonrepeat == true then
        return r6_402
      end
      r0_402:changeButton(r1_402, r2_402, r3_402, r4_402)
      if r0_402.selCursor ~= -1 and r0_402.selCursor == r0_402.selDownCursor then
        r0_402.selDownKey[r0_402.selDownCursor]:bt_ClickSePlay()
        r6_402 = r0_402.selDownKey[r0_402.selDownCursor].bt_l
      end
      r0_402:offCursor(r0_402.onDropList)
      r0_402.selDownCursor = -1
      r0_402.selDownKey = nil
      return r6_402
    end,
    mouseRdown = function(r0_403, r1_403, r2_403, r3_403, r4_403, r5_403)
      -- line: [14625, 14636] id: 403
      local r6_403 = 0
      if _buttonrepeat == true then
        return r6_403
      end
      if r0_403.selDownCursor == -1 and r0_403.selCursor ~= -1 then
        r6_403 = r0_403.selListKey[r0_403.selCursor].bt_r
      end
      return r6_403
    end,
    mouseRup = function(r0_404, r1_404, r2_404, r3_404, r4_404, r5_404)
      -- line: [14641, 14653] id: 404
      local r6_404 = 0
      if _buttonrepeat == true then
        return r6_404
      end
      if r0_404.selDownCursor == -1 and r0_404.selCursor ~= -1 then
        r6_404 = r0_404.selListKey[r0_404.selCursor].bt_r
      end
      return r6_404
    end,
    Animatable = function(r0_405, r1_405, r2_405)
      -- line: [14660, 14695] id: 405
      local r3_405 = r2_405
      r3_405.anim = {
        play = false,
        name = r1_405,
      }
      function r3_405.bt_PlayAnim(r0_406)
        -- line: [14664, 14678] id: 406
        if r0_406.anim.name ~= -1 and r0_406.active == 0 then
          local r1_406 = cclass.lua_Layers:create()
          r0_406.anim.play = true
          if r0_406.SubLayer.on.no ~= -1 then
            r1_406:cancelSubLayerEffect(r0_406.layerset, r0_406.layerkey, r0_406.SubLayer.on.no, r0_406.anim.name)
            r1_406:setSubLayerEffect(r0_406.layerset, r0_406.layerkey, r0_406.anim.name, r0_406.SubLayer.on.no, LUA_EFFECT_SCALE, 0.1, 0.1, 0, 0, 0, 300, 0, 100)
            r1_406:setSubLayerEffect(r0_406.layerset, r0_406.layerkey, r0_406.anim.name, r0_406.SubLayer.on.no, LUA_EFFECT_SCALE, -0.1, -0.1, 0, 0, 0, 300, 0, 0)
            r1_406:startSubLayerEffect(r0_406.layerset, r0_406.layerkey, r0_406.anim.name, r0_406.SubLayer.on.no, -1)
          end
        end
      end
      function r3_405.bt_StopAnim(r0_407)
        -- line: [14680, 14691] id: 407
        if r0_407.anim.play == true and r0_407.anim.name ~= -1 then
          local r1_407 = cclass.lua_Layers:create()
          r0_407.anim.play = false
          if r0_407.SubLayer.on.no ~= -1 then
            r1_407:cancelSubLayerEffect(r0_407.layerset, r0_407.layerkey, r0_407.SubLayer.on.no, r0_407.anim.name)
            r1_407:setSubLayerParam(r0_407.layerset, r0_407.layerkey, r0_407.SubLayer.on.no, LUA_PARAM_SCALE, 1, 1, 1, 0)
          end
        end
      end
      return r3_405
    end,
    Movable = function(r0_408, r1_408)
      -- line: [14700, 15083] id: 408
      local r2_408 = r1_408
      r2_408.MOVABLE = {
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
      r2_408.MOVERANGE = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
      }
      r2_408.EVRANGE = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
      }
      function r2_408.bt_SetMovableInit(r0_409, r1_409, r2_409, r3_409, r4_409, r5_409, r6_409, r7_409)
        -- line: [14726, 14744] id: 409
        r0_409.MOVABLE.flag = r1_409
        r0_409.MOVABLE.PAR_MAX_X = r2_409
        r0_409.MOVABLE.PAR_MAX_Y = r3_409
        r0_409.MOVABLE.PSIZE_X = r4_409
        r0_409.MOVABLE.PSIZE_Y = r5_409
        r0_409.MOVABLE.MIN_W = r6_409
        r0_409.MOVABLE.MIN_H = r7_409
        r0_409:bt_SetEventWParam(r4_409)
        r0_409:bt_SetEventHParam(r5_409)
        r0_409.MOVABLE.PAR_X = 0
        r0_409.MOVABLE.PAR_Y = 0
      end
      function r2_408.bt_SetMoveRangeRect(r0_410, r1_410, r2_410, r3_410, r4_410)
        -- line: [14747, 14752] id: 410
        r0_410.MOVERANGE.x = r1_410
        r0_410.MOVERANGE.y = r2_410
        r0_410.MOVERANGE.w = r3_410
        r0_410.MOVERANGE.h = r4_410
      end
      function r2_408.bt_SetMoveRangeRectLayer(r0_411, r1_411)
        -- line: [14754, 14761] id: 411
        cclass.lua_Layers:create():initSubLayer(r0_411.layerset, r0_411.layerkey, r1_411, 0)
        local r3_411 = 0
        local r4_411 = 0
        local r5_411 = 0
        local r6_411 = 0
        r3_411, r4_411, r5_411, r6_411 = r0_411:bt_GetLayerRect(r0_411.layerkey, r1_411)
        r0_411:bt_SetMoveRangeRect(r3_411, r4_411, r5_411, r6_411)
      end
      function r2_408.bt_GetMoveRangeRectW(r0_412)
        -- line: [14764, 14766] id: 412
        return r0_412.MOVERANGE.w - r0_412.MOVERANGE.x
      end
      function r2_408.bt_GetMoveRangeRectH(r0_413)
        -- line: [14767, 14769] id: 413
        return r0_413.MOVERANGE.h - r0_413.MOVERANGE.y
      end
      function r2_408.bt_MovableStart(r0_414, r1_414, r2_414)
        -- line: [14773, 14789] id: 414
        if r0_414.MOVABLE.flag == false then
          return 
        end
        r0_414.MOVABLE.DRAGST_X = r1_414
        r0_414.MOVABLE.DRAGST_Y = r2_414
        r0_414.MOVABLE.BT_X = r0_414.DRAW_POS.x
        r0_414.MOVABLE.BT_Y = r0_414.DRAW_POS.y
      end
      function r2_408.bt_MovableControl(r0_415, r1_415, r2_415)
        -- line: [14791, 14823] id: 415
        if r0_415.MOVABLE.flag == false then
          return false
        end
        local r3_415 = 0
        local r4_415 = 0
        if r0_415.EVRANGE.x <= r1_415 and r1_415 < r0_415.EVRANGE.w and r0_415.EVRANGE.y <= r2_415 and r2_415 < r0_415.EVRANGE.h then
          r3_415 = r0_415.MOVABLE.BT_X + r1_415 - r0_415.MOVABLE.DRAGST_X
          r4_415 = r0_415.MOVABLE.BT_Y + r2_415 - r0_415.MOVABLE.DRAGST_Y
          r3_415, r4_415 = r0_415:bt_MovableSetRange(r3_415, r4_415)
        else
          r3_415 = r0_415.MOVABLE.BT_X
          r4_415 = r0_415.MOVABLE.BT_Y
        end
        if r0_415.DRAW_POS.x ~= r3_415 or r0_415.DRAW_POS.y ~= r4_415 then
          r0_415:bt_SetPos(r3_415, r4_415)
          r0_415:bt_MoveCalc()
        end
        return true
      end
      function r2_408.bt_MovableCorrect(r0_416)
        -- line: [14826, 14841] id: 416
        if r0_416.MOVABLE.flag == false then
          return 
        end
        local r2_416 = r0_416.MOVABLE.PSIZE_Y
        r0_416:bt_SetEventWParam(r0_416.MOVABLE.PSIZE_X)
        r0_416:bt_SetEventHParam(r2_416)
        r0_416:bt_SetMovableMove_XParam(r0_416.MOVABLE.PAR_X)
        r0_416:bt_SetMovableMove_YParam(r0_416.MOVABLE.PAR_Y)
        r0_416.DRAW_POS.x, r0_416.DRAW_POS.y = r0_416:bt_MovableSetRange(r0_416.DRAW_POS.x, r0_416.DRAW_POS.y)
      end
      function r2_408.bt_MovableSetRange(r0_417, r1_417, r2_417)
        -- line: [14844, 14874] id: 417
        local r3_417 = r1_417
        local r4_417 = r2_417
        if r3_417 < r0_417.MOVERANGE.x then
          r3_417 = r0_417.MOVERANGE.x
        end
        if r4_417 < r0_417.MOVERANGE.y then
          r4_417 = r0_417.MOVERANGE.y
        end
        local r5_417 = r0_417.MOVERANGE.w - r0_417.EVENT_RECT.w
        if r5_417 <= r3_417 then
          r3_417 = r5_417
        end
        local r6_417 = r0_417.MOVERANGE.h - r0_417.EVENT_RECT.h
        if r6_417 <= r4_417 then
          r4_417 = r6_417
        end
        return r3_417, r4_417
      end
      function r2_408.bt_MoveCalc(r0_418)
        -- line: [14878, 14914] id: 418
        local r1_418 = r0_418:bt_GetMoveRangeParamX()
        local r2_418 = r0_418:bt_GetMoveRangeParamY()
        r0_418.MOVABLE.MAX_X = r0_418:bt_GetMoveRangeX()
        r0_418.MOVABLE.MAX_Y = r0_418:bt_GetMoveRangeY()
        if r0_418.MOVABLE.MAX_X == 0 then
          r0_418.MOVABLE.PAR_X = 0
        else
          r0_418.MOVABLE.PAR_X = (r0_418.DRAW_POS.x - r0_418.initpos.x + r0_418.MOVABLE.MAX_X / r1_418 / 2) * r1_418 / r0_418.MOVABLE.MAX_X
          r0_418.MOVABLE.PAR_X = math.floor(r0_418.MOVABLE.PAR_X)
          if r0_418.MOVABLE.PAR_X < 0 then
            r0_418.MOVABLE.PAR_X = 0
          end
        end
        if r0_418.MOVABLE.MAX_Y == 0 then
          r0_418.MOVABLE.PAR_Y = 0
        else
          r0_418.MOVABLE.PAR_Y = (r0_418.DRAW_POS.y - r0_418.initpos.y + r0_418.MOVABLE.MAX_Y / r2_418 / 2) * r2_418 / r0_418.MOVABLE.MAX_Y
          r0_418.MOVABLE.PAR_Y = math.floor(r0_418.MOVABLE.PAR_Y)
          if r0_418.MOVABLE.PAR_Y < 0 then
            r0_418.MOVABLE.PAR_Y = 0
          end
        end
      end
      function r2_408.bt_SetSlidebarPos(r0_419)
        -- line: [14917, 14921] id: 419
        r0_419:bt_MovableCorrect()
        local r1_419 = cclass.lua_Layers:create()
        r0_419:bt_SetPos(r0_419.DRAW_POS.x, r0_419.DRAW_POS.y)
      end
      function r2_408.bt_SetParamX(r0_420, r1_420)
        -- line: [14925, 14928] id: 420
        r0_420:bt_SetMovableMove_XParam(r1_420)
        r0_420:bt_SetSlidebarPos()
      end
      function r2_408.bt_SetParamY(r0_421, r1_421)
        -- line: [14929, 14932] id: 421
        r0_421:bt_SetMovableMove_YParam(r1_421)
        r0_421:bt_SetSlidebarPos()
      end
      function r2_408.bt_GetParamX(r0_422)
        -- line: [14935, 14938] id: 422
        r0_422:bt_MoveCalc()
        return r0_422.MOVABLE.PAR_X
      end
      function r2_408.bt_GetParamY(r0_423)
        -- line: [14939, 14942] id: 423
        r0_423:bt_MoveCalc()
        return r0_423.MOVABLE.PAR_Y
      end
      function r2_408.bt_SetEventWParam(r0_424, r1_424)
        -- line: [14945, 14959] id: 424
        r0_424.MOVABLE.PSIZE_X = r1_424
        if r0_424.MOVABLE.PAR_MAX_X ~= 0 and r0_424.MOVABLE.PSIZE_X ~= 0 and r0_424.MOVABLE.MIN_W ~= 0 then
          local r2_424 = 0
          r2_424 = r0_424:bt_GetMoveRangeRectW() * r0_424.MOVABLE.PSIZE_X / r0_424.MOVABLE.PAR_MAX_X
          if r2_424 < r0_424.MOVABLE.MIN_W then
            r2_424 = r0_424.MOVABLE.MIN_W
          end
          r0_424.EVENT_RECT.w = math.floor(r2_424)
        end
      end
      function r2_408.bt_SetEventHParam(r0_425, r1_425)
        -- line: [14960, 14975] id: 425
        r0_425.MOVABLE.PSIZE_Y = r1_425
        if r0_425.MOVABLE.PAR_MAX_Y ~= 0 and r0_425.MOVABLE.PSIZE_Y ~= 0 and r0_425.MOVABLE.MIN_H ~= 0 then
          local r2_425 = 0
          r2_425 = r0_425:bt_GetMoveRangeRectH() * r0_425.MOVABLE.PSIZE_Y / r0_425.MOVABLE.PAR_MAX_Y
          if r2_425 < r0_425.MOVABLE.MIN_H then
            r2_425 = r0_425.MOVABLE.MIN_H
          end
          r0_425.EVENT_RECT.h = math.floor(r2_425)
        end
      end
      function r2_408.bt_SetMovableMove_X(r0_426, r1_426)
        -- line: [14979, 14981] id: 426
        r0_426.DRAW_POS.x = r1_426 + r0_426.MOVERANGE.x
      end
      function r2_408.bt_SetMovableMove_Y(r0_427, r1_427)
        -- line: [14982, 14984] id: 427
        r0_427.DRAW_POS.y = r1_427 + r0_427.MOVERANGE.y
      end
      function r2_408.bt_SetMovableMove_XParam(r0_428, r1_428)
        -- line: [14988, 15007] id: 428
        local r3_428 = r0_428:bt_GetMoveRangeParamX()
        if r3_428 < r1_428 then
          r1_428 = r3_428
        end
        r0_428.MOVABLE.PAR_X = r1_428
        r0_428.MOVABLE.MAX_X = r0_428:bt_GetMoveRangeX()
        local r2_428 = nil	-- notice: implicit variable refs by block#[6]
        if r3_428 > 0 then
          r2_428 = math.ceil(r0_428.MOVABLE.PAR_X * r0_428.MOVABLE.MAX_X / r3_428)
          if r0_428.MOVABLE.MAX_X < r2_428 then
            r2_428 = r0_428.MOVABLE.MAX_X
          end
        else
          r2_428 = 0
        end
        r0_428:bt_SetMovableMove_X(r2_428)
      end
      function r2_408.bt_SetMovableMove_YParam(r0_429, r1_429)
        -- line: [15008, 15028] id: 429
        r0_429.MOVABLE.PAR_Y = r1_429
        local r2_429 = nil
        local r3_429 = r0_429:bt_GetMoveRangeParamY()
        if r3_429 < r1_429 then
          r1_429 = r3_429
        end
        r0_429.MOVABLE.PAR_Y = r1_429
        r0_429.MOVABLE.MAX_Y = r0_429:bt_GetMoveRangeY()
        if r3_429 > 0 then
          r2_429 = math.ceil(r0_429.MOVABLE.PAR_Y * r0_429.MOVABLE.MAX_Y / r3_429)
          if r0_429.MOVABLE.MAX_Y < r2_429 then
            r2_429 = r0_429.MOVABLE.MAX_Y
          end
        else
          r2_429 = 0
        end
        r0_429:bt_SetMovableMove_Y(r2_429)
      end
      function r2_408.bt_GetMoveRangeX(r0_430)
        -- line: [15031, 15038] id: 430
        local r1_430 = r0_430:bt_GetMoveRangeRectW() - r0_430.EVENT_RECT.w
        if r1_430 < 0 then
          r1_430 = 0
        end
        return r1_430
      end
      function r2_408.bt_GetMoveRangeY(r0_431)
        -- line: [15039, 15047] id: 431
        local r1_431 = r0_431:bt_GetMoveRangeRectH() - r0_431.EVENT_RECT.h
        if r1_431 < 0 then
          r1_431 = 0
        end
        return r1_431
      end
      function r2_408.bt_GetMoveRangeParamX(r0_432)
        -- line: [15049, 15056] id: 432
        local r1_432 = r0_432.MOVABLE.PAR_MAX_X - r0_432.MOVABLE.PSIZE_X
        if r1_432 < 0 then
          r1_432 = 0
        end
        return r1_432
      end
      function r2_408.bt_GetMoveRangeParamY(r0_433)
        -- line: [15057, 15064] id: 433
        local r1_433 = r0_433.MOVABLE.PAR_MAX_Y - r0_433.MOVABLE.PSIZE_Y
        if r1_433 < 0 then
          r1_433 = 0
        end
        return r1_433
      end
      function r2_408.bt_SetEventRangeRect(r0_434, r1_434, r2_434, r3_434, r4_434)
        -- line: [15066, 15071] id: 434
        r0_434.EVRANGE.x = r1_434
        r0_434.EVRANGE.y = r2_434
        r0_434.EVRANGE.w = r3_434
        r0_434.EVRANGE.h = r4_434
      end
      function r2_408.bt_SetEventRangeRectLayer(r0_435, r1_435)
        -- line: [15073, 15080] id: 435
        cclass.lua_Layers:create():initSubLayer(r0_435.layerset, r0_435.layerkey, r1_435, 0)
        local r3_435 = 0
        local r4_435 = 0
        local r5_435 = 0
        local r6_435 = 0
        r3_435, r4_435, r5_435, r6_435 = r0_435:bt_GetLayerRect(r0_435.layerkey, r1_435)
        r0_435:bt_SetEventRangeRect(r3_435, r4_435, r5_435, r6_435)
      end
      return r2_408
    end,
    SlidebarY = function(r0_436, r1_436, r2_436, r3_436)
      -- line: [15088, 15196] id: 436
      local r4_436 = r0_436:Movable(r3_436)
      r4_436:bt_addLayer("bar", r1_436)
      r4_436:bt_addLayer("bot", r2_436)
      function r4_436.bt_SlidebarYInit(r0_437, r1_437, r2_437, r3_437, r4_437, r5_437)
        -- line: [15096, 15105] id: 437
        r0_437:bt_SetMoveRangeRectLayer(r4_437)
        r0_437:bt_SetEventRangeRectLayer(r5_437)
        r0_437:bt_SetMovableInit(true, 0, r1_437, 0, r2_437, 0, r3_437)
        r0_437:bt_SetSlidebarPos()
      end
      function r4_436.bt_MovableControl(r0_438, r1_438, r2_438)
        -- line: [15108, 15144] id: 438
        if r0_438.MOVABLE.flag == false then
          return false
        end
        local r3_438 = 0
        local r4_438 = 0
        if r0_438.EVRANGE.x <= r1_438 and r1_438 < r0_438.EVRANGE.w and r0_438.EVRANGE.y <= r2_438 and r2_438 < r0_438.EVRANGE.h then
          r3_438 = r0_438.MOVABLE.BT_X + r1_438 - r0_438.MOVABLE.DRAGST_X
          r4_438 = r0_438.MOVABLE.BT_Y + r2_438 - r0_438.MOVABLE.DRAGST_Y
          r3_438, r4_438 = r0_438:bt_MovableSetRange(r3_438, r4_438)
        else
          r3_438 = r0_438.MOVABLE.BT_X
          r4_438 = r0_438.MOVABLE.BT_Y
        end
        if r0_438.DRAW_POS.x ~= r3_438 or r0_438.DRAW_POS.y ~= r4_438 then
          r0_438.DRAW_POS.x = r3_438
          r0_438.DRAW_POS.y = r4_438
          local r5_438 = cclass.lua_Layers:create()
          r5_438:setSubLayerParam(r0_438.layerset, r0_438.layerkey, r0_438.SubLayer.bar.no, LUA_PARAM_POS, math.floor(r3_438), math.floor(r4_438), 0, 0)
          r5_438:setSubLayerParam(r0_438.layerset, r0_438.layerkey, r0_438.SubLayer.bot.no, LUA_PARAM_POS, math.floor(r3_438), math.floor(r4_438 + r0_438.EVENT_RECT.h - 10), 0, 0)
          r0_438:bt_MoveCalc()
        end
        return true
      end
      function r4_436.bt_SetActive(r0_439, r1_439)
        -- line: [15147, 15170] id: 439
        local r2_439 = cclass.lua_Layers:create()
        for r6_439, r7_439 in pairs(r0_439.SubLayer) do
          if r7_439.no ~= -1 then
            if r1_439 == 0 then
              if r7_439.no == r0_439.SubLayer.bar.no or r7_439.no == r0_439.SubLayer.bot.no then
                r0_439:bt_SetEnableSubLayer(r7_439, true)
              else
                r0_439:bt_SetEnableSubLayer(r7_439, false)
              end
            else
              r0_439:bt_SetEnableSubLayer(r7_439, false)
            end
          end
        end
        r0_439.active = r1_439
      end
      function r4_436.bt_SetSlidebarPos(r0_440)
        -- line: [15174, 15191] id: 440
        r0_440:bt_MovableCorrect()
        local r1_440 = cclass.lua_Layers:create()
        local r2_440 = {
          x = 0,
          y = 0,
        }
        r2_440.x = math.floor(r0_440.DRAW_POS.x)
        r2_440.y = math.floor(r0_440.DRAW_POS.y)
        r1_440:setSubLayerParam(r0_440.layerset, r0_440.layerkey, r0_440.SubLayer.bar.no, LUA_PARAM_POS, r2_440.x, r2_440.y, 0, 0)
        local r3_440 = {
          w = 0,
          h = 0,
        }
        r3_440.w = math.floor(r0_440.EVENT_RECT.w)
        r3_440.h = math.floor(r0_440.EVENT_RECT.h - 10)
        r1_440:setSubLayerParam(r0_440.layerset, r0_440.layerkey, r0_440.SubLayer.bar.no, LUA_PARAM_RECT, 0, 0, r3_440.w, r3_440.h)
        r2_440.x = math.floor(r0_440.DRAW_POS.x)
        r2_440.y = math.floor(r0_440.DRAW_POS.y + r0_440.EVENT_RECT.h - 10)
        r1_440:setSubLayerParam(r0_440.layerset, r0_440.layerkey, r0_440.SubLayer.bot.no, LUA_PARAM_POS, r2_440.x, r2_440.y, 0, 0)
      end
      return r4_436
    end,
  }
  return r1_361
end
MenuItem = {}
function MenuItem.new(r0_441, r1_441, r2_441, r3_441)
  -- line: [15208, 15290] id: 441
  local r4_441 = {
    layerset = r0_441,
    layerkey = r1_441,
    Layer = {},
    actKey = -2,
    addLayer = function(r0_442, r1_442, r2_442)
      -- line: [15219, 15232] id: 442
      local r3_442 = 0
      local r4_442 = 0
      local r5_442 = 0
      local r6_442 = 0
      local r7_442 = 0
      local r8_442 = 0
      local r9_442 = 0
      local r10_442 = 0
      if r2_442 >= 0 then
        local r11_442 = cclass.lua_Layers:create()
        r11_442:initSubLayer(r0_442.layerset, r0_442.layerkey, r2_442, 1)
        r3_442, r4_442, r5_442, r6_442 = r11_442:getSubLayerParam(r0_442.layerset, r0_442.layerkey, r2_442, LUA_PARAM_COLOR, r3_442, r4_442, r5_442, r6_442)
        r7_442, r8_442, r9_442, r10_442 = r11_442:getSubLayerParam(r0_442.layerset, r0_442.layerkey, r2_442, LUA_PARAM_POS, r7_442, r8_442, r9_442, r10_442)
      end
      r0_442.Layer[r1_442] = {
        no = r2_442,
        x = r7_442,
        y = r8_442,
        r = r3_442,
        g = r4_442,
        b = r5_442,
        a = r6_442,
      }
    end,
  }
  r4_441:addLayer("def", r2_441)
  r4_441:addLayer("on", r3_441)
  function r4_441.SetAct(r0_443, r1_443)
    -- line: [15242, 15261] id: 443
    if r0_443.actKey == r1_443 then
      return 
    end
    local r2_443 = cclass.lua_Layers:create()
    for r6_443, r7_443 in pairs(r0_443.Layer) do
      if r7_443.no ~= -1 then
        if r6_443 == r1_443 then
          r2_443:setSubLayerParam(r0_443.layerset, r0_443.layerkey, r7_443.no, LUA_PARAM_COLOR, r7_443.r, r7_443.g, r7_443.b, r7_443.a)
        else
          r2_443:setSubLayerParam(r0_443.layerset, r0_443.layerkey, r7_443.no, LUA_PARAM_COLOR, 0, 0, 0, 0)
        end
      end
    end
    r0_443.actKey = r1_443
  end
  function r4_441.ReSet(r0_444)
    -- line: [15264, 15273] id: 444
    local r1_444 = cclass.lua_Layers:create()
    for r5_444, r6_444 in pairs(r0_444.Layer) do
      if r6_444.no ~= -1 then
        r1_444:setSubLayerParam(r0_444.layerset, r0_444.layerkey, r6_444.no, LUA_PARAM_COLOR, r6_444.r, r6_444.g, r6_444.b, r6_444.a)
      end
    end
    r0_444.actKey = -2
  end
  function r4_441.SetPos(r0_445, r1_445, r2_445, r3_445)
    -- line: [15276, 15285] id: 445
    local r4_445 = cclass.lua_Layers:create()
    for r8_445, r9_445 in pairs(r0_445.Layer) do
      r9_445.movex = r2_445 + r9_445.x - r0_445.Layer[r1_445].x
      r9_445.movey = r3_445 + r9_445.y - r0_445.Layer[r1_445].y
      r4_445:setSubLayerParam(r0_445.layerset, r0_445.layerkey, r9_445.no, LUA_PARAM_POS, math.floor(r9_445.movex), math.floor(r9_445.movey), 0, 0)
    end
  end
  r4_441:SetAct("def")
  return r4_441
end
function GetLayerRect(r0_446, r1_446, r2_446)
  -- line: [15295, 15317] id: 446
  local r3_446 = 0
  local r4_446 = 0
  local r5_446 = 0
  local r6_446 = 0
  local r7_446 = 0
  local r8_446 = 0
  local r9_446 = 0
  local r10_446 = 0
  local r11_446 = cclass.lua_Layers:create()
  local r12_446 = nil
  local r13_446 = nil
  r12_446, r13_446, r9_446, r10_446 = r11_446:getParam(r0_446, r1_446, LUA_PARAM_POS, r7_446, r8_446, r9_446, r10_446)
  if r1_446 ~= -1 and r2_446 ~= -1 then
    r7_446, r8_446, r9_446, r10_446 = r11_446:getSubLayerParam(r0_446, r1_446, r2_446, LUA_PARAM_POS, r7_446, r8_446, r9_446, r10_446)
    r7_446 = r7_446 + r12_446
    r8_446 = r8_446 + r13_446
    r3_446 = r7_446
    r4_446 = r8_446
    r7_446, r8_446, r9_446, r10_446 = r11_446:getSubLayerParam(r0_446, r1_446, r2_446, LUA_PARAM_SIZE, r7_446, r8_446, r9_446, r10_446)
    r5_446 = r7_446 + r3_446
    r6_446 = r8_446 + r4_446
  end
  return r3_446, r4_446, r5_446, r6_446
end
function SetAutoOncursor(r0_447, r1_447, r2_447, r3_447)
  -- line: [15320, 15330] id: 447
  local r4_447 = cclass.lua_Layers:create()
  local r5_447 = 0
  local r6_447 = 0
  local r7_447 = 0
  local r8_447 = 0
  r5_447, r6_447, r7_447, r8_447 = r4_447:getSubLayerParam(r0_447, r1_447, r2_447, LUA_PARAM_SIZE, r5_447, r6_447, r7_447, r8_447)
  local r9_447 = 0
  local r10_447 = 0
  r9_447, r10_447, r7_447, r8_447 = r4_447:getSubLayerParam(r0_447, r1_447, r2_447, LUA_PARAM_POS, r9_447, r10_447, r7_447, r8_447)
  SetAutoOncursorPos(r9_447 + r5_447 / 2, r10_447 + r6_447 / 2, r3_447)
end
function SetAutoOncursorPos(r0_448, r1_448, r2_448)
  -- line: [15333, 15338] id: 448
  local r3_448 = cclass.lua_AutoCursor:new()
  r3_448:AutoCursor(r0_448, r1_448, r2_448)
  r3_448:SetCursor(0)
  r3_448:delete()
end
g_TitleInit = false
function openTitle()
  -- line: [15345, 15822] id: 449
  g_Menu.GameTitle.ptr = Menu.new("titleMenu")
  local r0_449 = true
  g_NmsData.MAX_THUMB = 137
  NmsMenuLoadBookMark()
  g_nmsBookMarkFlag = false
  local r1_449 = cclass.lua_AutoCursor:new()
  r1_449:SetCursor(0)
  r1_449:delete()
  function g_Menu.GameTitle.ptr.MenuEffect(r0_450)
    -- line: [15372, 15382] id: 450
    local r1_450 = false
    r1_450 = r0_450:MenuEffectTransJob()
    if r0_450.MenuInf.effect == true and r1_450 == false then
      r0_450:MenuEffectEndJob()
      r0_450.MenuInf.effect = false
    end
    return r1_450
  end
  function g_Menu.GameTitle.ptr.MenuEffectTransJob(r0_451)
    -- line: [15384, 15394] id: 451
    local r1_451 = cclass.lua_Layers:create()
    if r0_451.MenuInf.enabled == true then
      return r1_451:isEffect(r0_451.MenuInf.SetName, "TitleDisp")
    else
      return r1_451:isTransition(r0_451.MenuInf.SetName)
    end
  end
  function g_Menu.GameTitle.ptr.MenuEffectEndJob(r0_452)
    -- line: [15396, 15445] id: 452
    local r1_452 = cclass.lua_Layers:create()
    if r0_452.MenuInf.enabled == true then
      r0_452.MenuButton:ResetColor(r0_452.MenuButtonData)
      local r2_452 = 0
      local r3_452 = 0
      local r4_452 = cclass.lua_AutoCursor:new()
      r2_452, r3_452 = r4_452:GetCursorPos(r2_452, r3_452)
      r4_452:delete()
      r0_452.MenuButton:changeButton(r0_452.MenuInf.SetName, r1_452:getCursorPos(r0_452.MenuInf.SetName, r2_452, r3_452, 0) - 1, r2_452, r3_452)
      local r6_452 = 0
      if r0_452.MenuButton.selCursor ~= -1 then
        r6_452 = r0_452.MenuButton.selListKey[r0_452.MenuButton.selCursor].bt_l
      end
      r0_452:TitleSelCursor(r0_452.MenuButton.selCursor, r6_452, r2_452, r3_452)
      if g_TitleInit == false then
        playSystemVoice(SYSVOICE_TITLECALL)
      end
      g_TitleInit = true
    else
      r1_452:remove(r0_452.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_452.MenuInf.ButtonLayer = ""
      r0_452.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.GameTitle.ptr.MenuEffectStart(r0_453, r1_453, r2_453, r3_453)
    -- line: [15449, 15484] id: 453
    if r3_453 == 0 then
      local r4_453 = cclass.lua_Sounds:new()
      local r5_453 = getGameEngineVersion()
      if r0_453.CompFlag == false then
        if r5_453 == 1.4 then
          r4_453:BgmPlay("systembgm", getSoundArcFileName("bgm", ".ogg"), "bgm01.ogg", getSoundVolume("bgm"))
        else
          r4_453:BgmPlay("systembgm", getSoundArcFileName("bgm", ".ogg"), "bgm01.ogg", getSoundVolume("bgm"), 100)
        end
        cfunc.LegacyGame__lua_SetVariable(120, 2)
      else
        if r5_453 == 1.4 then
          r4_453:BgmPlay("systembgm", getSoundArcFileName("bgm", ".ogg"), "bgm26.ogg", getSoundVolume("bgm"))
        else
          r4_453:BgmPlay("systembgm", getSoundArcFileName("bgm", ".ogg"), "bgm26.ogg", getSoundVolume("bgm"), 100)
        end
        cfunc.LegacyGame__lua_SetVariable(120, 26)
      end
      r4_453:delete()
    end
    r0_453.MenuInf.effect = true
    r0_453.MenuInf.enabled = true
    local r4_453 = cclass.lua_Layers:create()
    local r5_453 = cclass.lua_MeasureTime:new()
    local r6_453 = getEffectRate()
    r4_453:startTransition(r0_453.MenuInf.SetName, 0, 1, r1_453 * r6_453, r2_453 * r5_453:diff() * r6_453, LUA_TRANSITION_NORMAL)
    r5_453:delete()
  end
  g_Menu.GameTitle.ptr.EffectButtonKeyList = {}
  function g_Menu.GameTitle.ptr.CancelMenuEffect(r0_454)
    -- line: [15488, 15499] id: 454
    if r0_454.MenuInf.effect == true and r0_454.MenuInf.enabled == true then
      local r1_454 = cclass.lua_Layers:create()
      for r5_454, r6_454 in pairs(r0_454.EffectButtonKeyList) do
        r1_454:cancelSubLayerEffect("titleMenu", "titleBase01", r5_454, "TitleDisp")
        r1_454:setSubLayerParam("titleMenu", "titleBase01", r5_454, LUA_PARAM_COLOR, 1, 1, 1, 1)
        if r6_454.flag == true then
          r1_454:setSubLayerParam("titleMenu", "titleBase01", r5_454, LUA_PARAM_POS, r6_454.x, r6_454.y, 0, 0)
        end
      end
    end
  end
  function g_Menu.GameTitle.ptr.MenuButtonJob(r0_455, r1_455, r2_455)
    -- line: [15503, 15573] id: 455
    if r1_455 ~= 0 and r2_455 == "LU" then
      if r1_455 == 500 then
        cfunc.LegacyGame__lua_NeedShell("https://creativesurvey.com/ng/reply/63d98aaf0cbec91733678dd8c5bf8c/")
        return 
      end
      local r3_455 = cclass.lua_Layers:create()
      r3_455:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_455)
      if r1_455 == 100 or r1_455 == 120 or r1_455 == 121 then
        playSystemVoice(SYSVOICE_TITLESTART)
      end
      if r1_455 == 100 or r1_455 == 104 or r1_455 == 105 or r1_455 == 106 or r1_455 == 107 or r1_455 == 108 or r1_455 == 109 or r1_455 == 120 or r1_455 == 121 then
        r3_455:removeSnap("system")
        if r1_455 == 104 then
          cfunc.LegacyGame__lua_SetVariable(90, getSystemvoiceNo())
        elseif cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_455:MenuEffectEnd(0)
        g_menuExecute = false
      else
        if r1_455 == 103 then
        end
        r3_455:rtSnap("system")
      end
      r0_455.MenuInf.enabled = false
      r0_455.MenuInf.effect = true
    end
    if r2_455 == "LD" then
      r0_455:CancelMenuEffect()
    end
  end
  function g_Menu.GameTitle.ptr.MenuKeyDown(r0_456, r1_456, r2_456, r3_456, r4_456)
    -- line: [15576, 15583] id: 456
    if r4_456 == true then
      return 
    end
    if r0_456.MenuInf.effect == false then
      local r5_456 = r0_456.MenuButton.selCursor
    end
  end
  g_Menu.GameTitle.ptr.defaultMenuMouseMove = g_Menu.GameTitle.ptr.MenuMouseMove
  function g_Menu.GameTitle.ptr.MenuMouseMove(r0_457, r1_457, r2_457, r3_457, r4_457, r5_457, r6_457)
    -- line: [15588, 15596] id: 457
    r0_457:defaultMenuMouseMove(r1_457, r2_457, r3_457, r4_457, r5_457, r6_457)
    local r7_457 = 0
    if r0_457.MenuButton.selCursor ~= -1 then
      r7_457 = r0_457.MenuButton.selListKey[r0_457.MenuButton.selCursor].bt_l
    end
    r0_457:TitleSelCursor(r0_457.MenuButton.selCursor, r7_457, r4_457, r5_457)
  end
  function g_Menu.GameTitle.ptr.MenuInit(r0_458, r1_458, r2_458)
    -- line: [15601, 15630] id: 458
    local r3_458 = true
    r0_458.MenuInf.enabled = false
    r0_458.MenuInf.effect = false
    r0_458.MenuInf.ButtonLayer = r1_458
    r0_458.MenuInf.ButtonPna = r2_458
    local r4_458 = cclass.lua_Layers:create()
    if r4_458:add(r0_458.MenuInf.SetName) == false then
      return false
    end
    if r0_458.CompFlag == true then
      r4_458:insertMovieLayer(r0_458.MenuInf.SetName, "%MovieTitle%", "EFmov_04_lp.dat", 1)
    end
    r0_458:MenuLoadLayer(r1_458, r2_458)
    r0_458.MenuButton = Button.new(r0_458.MenuInf.SetName)
    r0_458.MenuButton:InitList()
    r0_458.MenuButtonData = {}
    return r3_458
  end
  function g_Menu.GameTitle.ptr.TitleMenuInit(r0_459)
    -- line: [15633, 15737] id: 459
    local r1_459 = g_Menu.GameTitle.ptr:MenuInit("titleBase01", "Sys_Title.pna")
    if res == false then
      return false
    end
    local r2_459 = cclass.lua_Layers:create()
    if g_TrialFlag >= 1 then
      r2_459:initSubLayer("titleMenu", "titleBase01", 27, 1)
    end
    r2_459:initSubLayer("titleMenu", "titleBase01", 28, 1)
    r2_459:initSubLayer("titleMenu", "titleBase01", 29, 1)
    r2_459:initSubLayer("titleMenu", "titleBase01", 32, 1)
    r2_459:initSubLayer("titleMenu", "titleBase01", 33, 1)
    r2_459:initSubLayer("titleMenu", "titleBase01", 34, 1)
    r2_459:initSubLayer("titleMenu", "titleBase01", 35, 1)
    r2_459:initSubLayer("titleMenu", "titleBase01", 36, 1)
    if r0_459.CompFlag == false then
      r2_459:initSubLayer("titleMenu", "titleBase01", 38, 1)
      r2_459:initSubLayer("titleMenu", "titleBase01", 39, 1)
    end
    local r3_459 = r0_459.MenuButtonData
    local r4_459 = 100
    if g_TrialFlag == 1 then
      r4_459 = 120
    end
    if g_TrialFlag == 2 then
      r4_459 = 121
    end
    g_Menu.GameTitle.ptr:MenuButtonSet(g_Menu.GameTitle.ptr.MenuButtonData, "start", 0, "titleBase01", 7, 7, 15, -1, 23, r4_459, 0, 0)
    g_Menu.GameTitle.ptr:MenuButtonSet(g_Menu.GameTitle.ptr.MenuButtonData, "load", 0, "titleBase01", 6, 6, 14, -1, 22, 101, 0, 0)
    g_Menu.GameTitle.ptr:MenuButtonSet(g_Menu.GameTitle.ptr.MenuButtonData, "exit", 0, "titleBase01", 5, 5, 13, -1, 21, 104, 0, 0)
    g_Menu.GameTitle.ptr:MenuButtonSet(g_Menu.GameTitle.ptr.MenuButtonData, "config", 0, "titleBase01", 4, 4, 12, -1, 20, 102, 0, 0)
    g_Menu.GameTitle.ptr:MenuButtonSet(g_Menu.GameTitle.ptr.MenuButtonData, "gallery", 0, "titleBase01", 3, 3, 11, -1, 19, 103, 0, 0)
    g_Menu.GameTitle.ptr:MenuButtonSet(g_Menu.GameTitle.ptr.MenuButtonData, "ex01", 0, "titleBase01", 2, 2, 10, -1, 18, 500, 0, 0)
    r0_459:MenuButtonInit()
    if g_TrialFlag == 0 then
      if not r0_459.GetAnyClearFlag then
        r0_459.MenuButtonData.gallery:bt_SetActive(2)
      end
    else
      r0_459.MenuButtonData.gallery:bt_SetActive(2)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_ENABLELOAD) == false then
      r0_459.MenuButtonData.load:bt_SetActive(2)
    end
    return true
  end
  function g_Menu.GameTitle.ptr.TitleSelCursor(r0_460, r1_460, r2_460, r3_460, r4_460)
    -- line: [15740, 15741] id: 460
  end
  if g_TrialFlag >= 1 then
    g_Menu.GameTitle.ptr.GetAnyClearFlag = false
  else
    g_Menu.GameTitle.ptr.GetAnyClearFlag = true
  end
  g_Menu.GameTitle.ptr.CompFlag = cfunc.LegacyGame__lua_GetFlag(1000)
  local r2_449 = g_Menu.GameTitle.ptr:TitleMenuInit()
  if r2_449 == false then
    return r2_449
  end
  local r3_449 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r3_449:setSnap("system", true)
    r3_449:copySnap("titleMenu", "system")
    g_Menu.GameTitle.ptr:MenuEffectStart(300, 0, 0)
  else
    r3_449:copySnap("titleMenu", "system")
    g_Menu.GameTitle.ptr:MenuEffectStart(300, 0, 1)
  end
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function openGalleryTitle(r0_461, r1_461)
  -- line: [15829, 15951] id: 461
  return 0
  g_Menu.GalleryTitle.ptr = Menu.new("GalleryTitle")
  function g_Menu.GalleryTitle.ptr.MenuButtonJob(r0_462, r1_462, r2_462)
    -- line: [15842, 15882] id: 462
    if r1_462 ~= 0 and r2_462 == "LU" then
      local r3_462 = cclass.lua_Layers:create()
      r3_462:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(103, r1_462)
      if r1_462 == 6 then
        r3_462:removeSnap("system")
        if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
          cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
        end
        r0_462:MenuEffectEnd(0)
        local r4_462 = cclass.lua_Sounds:new()
        r4_462:BgmStop("systembgm", 500)
        r4_462:delete()
        g_menuExecute = false
      else
        r3_462:rtSnap("system")
      end
      r0_462.MenuInf.enabled = false
      r0_462.MenuInf.effect = true
    end
    if r2_462 == "RU" and r0_462:GetMenuMouseEnable() and r1_462 == 0 then
      r0_462:SystemSePlay("SYS02.ogg")
      local r3_462 = cclass.lua_Layers:create()
      r3_462:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(103, 5)
      r3_462:rtSnap("system")
      r0_462.MenuInf.enabled = false
      r0_462.MenuInf.effect = true
    end
  end
  g_Menu.GalleryTitle.ptr.HaremFlag = true
  local r2_461 = g_Menu.GalleryTitle.ptr:MenuInit("GTitle01", "Sys_Title.pna")
  if res == false then
    return false
  end
  local r3_461 = cclass.lua_Layers:create()
  if g_TrialFlag == 0 then
  end
  if g_TrialFlag == 1 then
  end
  if g_Menu.GalleryTitle.ptr.HaremFlag == false then
    r3_461:initSubLayer("GalleryTitle", "GTitle01", 25, 1)
  else
    r3_461:initSubLayer("GalleryTitle", "GTitle01", 26, 1)
  end
  r3_461:initSubLayer("GalleryTitle", "GTitle01", 59, 1)
  r3_461:initSubLayer("GalleryTitle", "GTitle01", 60, 1)
  r3_461:initSubLayer("GalleryTitle", "GTitle01", 61, 1)
  r3_461:initSubLayer("GalleryTitle", "GTitle01", 62, 1)
  r3_461:initSubLayer("GalleryTitle", "GTitle01", 63, 1)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Cg", 0, "GTitle01", 44, 44, 36, -1, 28, 1, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Replay", 0, "GTitle01", 45, 45, 37, -1, 29, 2, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Bgm", 0, "GTitle01", 46, 46, 38, -1, 30, 3, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Nms", 0, "GTitle01", 47, 47, 39, -1, 31, 4, 0, 0)
  if g_Menu.GalleryTitle.ptr.HaremFlag == true then
    g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Harem", 0, "GTitle01", 48, 48, 40, -1, 32, 6, 0, 0)
  end
  g_Menu.GalleryTitle.ptr:MenuButtonSet(g_Menu.GalleryTitle.ptr.MenuButtonData, "Ret", 0, "GTitle01", 49, 49, 41, -1, 33, 5, 0, 0)
  g_Menu.GalleryTitle.ptr:MenuButtonInit()
  r3_461:copySnap("GalleryTitle", "system")
  g_Menu.GalleryTitle.ptr:MenuEffectStart(300, 0)
  g_Menu.GalleryTitle.ptr.MenuInf.effect = true
  g_Menu.GalleryTitle.ptr.MenuInf.enabled = true
  g_menuExecute = true
  return true
end
function openGallery(r0_463, r1_463)
  -- line: [15972, 16838] id: 463
  g_Menu.GalleryMenu.ptr = Menu.new("Gallery")
  function g_Menu.GalleryMenu.ptr.MenuInit(r0_464, r1_464)
    -- line: [15978, 16014] id: 464
    local r2_464 = true
    r0_464.MenuInf.enabled = true
    r0_464.MenuInf.effect = true
    r0_464.MenuInf.ButtonLayer = ""
    r0_464.MenuInf.ButtonPna = ""
    if cclass.lua_Layers:create():add(r0_464.MenuInf.SetName) == false then
      return false
    end
    local r5_464 = cfunc.LegacyGame__lua_GetVariable(100)
    local r6_464 = cfunc.LegacyGame__lua_GetVariable(101)
    local r7_464 = cfunc.LegacyGame__lua_GetVariable(102)
    local r8_464 = cfunc.LegacyGame__lua_GetVariable(120)
    local r9_464 = g_GalleryInfo
    local r10_464 = nil	-- notice: implicit variable refs by block#[5, 8, 11]
    if r5_464 == 0 then
      r10_464 = 1
      if not r10_464 then
        ::label_43::
        r10_464 = r5_464
      end
    else
      goto label_43	-- block#4 is visited secondly
    end
    r9_464.CgPage = r10_464
    r9_464 = g_GalleryInfo
    if r6_464 == 0 then
      r10_464 = 1
      if not r10_464 then
        ::label_51::
        r10_464 = r6_464
      end
    else
      goto label_51	-- block#7 is visited secondly
    end
    r9_464.ScenePage = r10_464
    r9_464 = g_GalleryInfo
    if r7_464 == 0 then
      r10_464 = 1
      if not r10_464 then
        ::label_59::
        r10_464 = r7_464
      end
    else
      goto label_59	-- block#10 is visited secondly
    end
    r9_464.BgmPage = r10_464
    r0_464:SetBgmNo(r8_464)
    r0_464.MenuButton = Button.new(r0_464.MenuInf.SetName)
    r0_464.MenuButton:InitList()
    r0_464.MenuButtonData = {}
    return r2_464
  end
  function g_Menu.GalleryMenu.ptr.MenuButtonJobPos(r0_465, r1_465, r2_465, r3_465, r4_465)
    -- line: [16018, 16131] id: 465
    if g_GalleryInfo.Page == 4 then
      r0_465:NmsButtonJob(r1_465, r2_465, r3_465, r4_465)
    end
    if r1_465 ~= 0 and r2_465 == "LU" then
      local r5_465 = cclass.lua_Layers:create()
      if 1 <= r1_465 and r1_465 <= 4 then
        r0_465:initPageGallery(r1_465, false)
      end
      if r1_465 == 10 then
        r0_465.BT_DataBace.stop:bt_SetActive(2)
        r0_465:GalleryBgmStop()
      end
      if r1_465 == 11 or r1_465 == 13 then
        cclass.lua_Layers:create():rtSnap("system")
        if r1_465 == 13 then
          cfunc.LegacyGame__lua_SetVariable(99, -1)
        else
          cfunc.LegacyGame__lua_SetVariable(99, 0)
        end
        r0_465:closeGallery(0)
        r0_465:PlayTitleSound()
      end
      if r1_465 == 12 then
        r0_465.MenuButton.selDownCursor = -1
        r0_465.MenuButton.selDownKey = nil
        openConfirm(LUA_CONFIRM_QUIT)
      end
      if (g_GalleryInfo.Page == 1 or g_GalleryInfo.Page == 2 or g_GalleryInfo.Page == 3 or g_GalleryInfo.Page == 4) and 101 <= r1_465 and r1_465 <= 115 then
        local r6_465 = r1_465 - 100
        if g_GalleryInfo.Page == 1 then
          r0_465:CGPageInit(r6_465, g_GalleryInfo.CgPage, false)
        end
        if g_GalleryInfo.Page == 2 then
          r0_465:ScenePageInit(r6_465, g_GalleryInfo.ScenePage, false)
        end
        if g_GalleryInfo.Page == 3 then
          r0_465:BGMPageInit(r6_465, g_GalleryInfo.BgmPage, false)
        end
      end
      if (g_GalleryInfo.Page == 1 or g_GalleryInfo.Page == 2) and 201 <= r1_465 and r1_465 <= 215 then
        local r6_465 = r1_465 - 200
        if g_GalleryInfo.Page == 1 then
          cfunc.LegacyGame__lua_SetVariable(99, 1)
          cfunc.LegacyGame__lua_SetVariable(105, r6_465)
          r0_465:closeGallery(0)
        end
        if g_GalleryInfo.Page == 2 then
          cfunc.LegacyGame__lua_SetVariable(99, 2)
          cfunc.LegacyGame__lua_SetVariable(110, r6_465)
          r0_465:closeGallery(2)
          r0_465:GalleryBgmStop()
          g_menuExecute = false
        end
      end
      if g_GalleryInfo.Page == 3 then
        r0_465:GalleryBgmButtonJob(r1_465)
      end
    end
    if r2_465 == "RU" and r0_465:GetMenuMouseEnable() and r1_465 == 0 then
      r0_465:SystemSePlay("SYS02.ogg")
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_465:closeGallery(0)
      r0_465:PlayTitleSound()
    end
  end
  g_Menu.GalleryMenu.ptr.MenuInf.PageEffect = false
  g_Menu.GalleryMenu.ptr.MenuInf.PageEffect2 = false
  g_Menu.GalleryMenu.ptr.MenuInf.GalleryEff = false
  function g_Menu.GalleryMenu.ptr.MenuEffect(r0_466)
    -- line: [16142, 16218] id: 466
    local r1_466 = false
    if r0_466.MenuInf.GalleryEff == true and cclass.lua_Layers:create():isEffect("Gallery", "GalleryEff") == false then
      r0_466.MenuInf.GalleryEff = false
    end
    r1_466 = r0_466:MenuEffectTransJob()
    if r0_466.MenuInf.effect == true and r1_466 == false and r0_466.MenuInf.GalleryEff == false then
      r0_466:MenuEffectEndJob()
      r0_466.MenuInf.effect = false
    end
    if r0_466.MenuInf.PageEffect == true then
      local r2_466 = cclass.lua_Layers:create()
      ret = r2_466:isEffect("Gallery", "GalleryPageEff")
      if ret == false then
        if r0_466.beforePage == 1 then
          r0_466:DeleteCgMenu()
        end
        if r0_466.beforePage == 2 then
          r0_466:DeleteReplayMenu()
        end
        if r0_466.beforePage == 3 then
          r2_466:removeLayer("Gallery", "GalleryBgm")
        end
        if r0_466.beforePage == 4 then
          r0_466:DeleteNmsMenu()
        end
        r0_466.beforePage = 0
        local r3_466 = 0
        local r4_466 = 0
        local r5_466 = cclass.lua_AutoCursor:new()
        r3_466, r4_466 = r5_466:GetCursorPos(r3_466, r4_466)
        r5_466:delete()
        r0_466.MenuButton:changeButton(r0_466.MenuInf.SetName, r2_466:getCursorPos(r0_466.MenuInf.SetName, r3_466, r4_466, 0) - 1, r3_466, r4_466)
        r0_466.MenuInf.PageEffect = false
      end
    end
    if r0_466.MenuInf.PageEffect2 == true then
      local r2_466 = cclass.lua_Layers:create()
      ret = r2_466:isEffect("Gallery", "GalleryPageEff2")
      if ret == false then
        local r3_466 = 0
        local r4_466 = 0
        local r5_466 = cclass.lua_AutoCursor:new()
        r3_466, r4_466 = r5_466:GetCursorPos(r3_466, r4_466)
        r5_466:delete()
        r0_466.MenuButton:changeButton(r0_466.MenuInf.SetName, r2_466:getCursorPos(r0_466.MenuInf.SetName, r3_466, r4_466, 0) - 1, r3_466, r4_466)
        r0_466.MenuInf.PageEffect2 = false
      end
    end
    return r1_466
  end
  function g_Menu.GalleryMenu.ptr.MenuEffectEndJob(r0_467)
    -- line: [16220, 16246] id: 467
    local r1_467 = cclass.lua_Layers:create()
    if r0_467.MenuInf.enabled == true then
      local r2_467 = 0
      local r3_467 = 0
      local r4_467 = cclass.lua_AutoCursor:new()
      r2_467, r3_467 = r4_467:GetCursorPos(r2_467, r3_467)
      r4_467:delete()
      r0_467.MenuButton:changeButton(r0_467.MenuInf.SetName, r1_467:getCursorPos(r0_467.MenuInf.SetName, r2_467, r3_467, 0) - 1, r2_467, r3_467)
    else
      r1_467:remove(r0_467.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_467.MenuInf.ButtonLayer = ""
      r0_467.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.GalleryMenu.ptr.MenuEffectStart(r0_468, r1_468, r2_468)
    -- line: [16248, 16258] id: 468
    local r3_468 = cclass.lua_Layers:create()
    local r4_468 = cclass.lua_MeasureTime:new()
    local r5_468 = getEffectRate()
    r3_468:startTransition(r0_468.MenuInf.SetName, 0, 1, r1_468 * r5_468, r2_468 * r4_468:diff() * r5_468, LUA_TRANSITION_NORMAL)
    r4_468:delete()
    r0_468.MenuInf.enabled = true
    r0_468.MenuInf.effect = true
  end
  function g_Menu.GalleryMenu.ptr.GetMenuMouseEnable(r0_469)
    -- line: [16263, 16274] id: 469
    local r1_469 = false
    if r0_469.MenuInf.enabled == true and r0_469.MenuInf.effect == false and r0_469.MenuInf.PageEffect == false and r0_469.MenuInf.PageEffect2 == false and r0_469.MenuInf.GalleryEff == false and r0_469.MenuButton ~= nil then
      r1_469 = true
    end
    return r1_469
  end
  g_Menu.GalleryMenu.ptr.defaultMenuMouseMove = g_Menu.GalleryMenu.ptr.MenuMouseMove
  function g_Menu.GalleryMenu.ptr.MenuMouseMove(r0_470, r1_470, r2_470, r3_470, r4_470, r5_470, r6_470)
    -- line: [16278, 16308] id: 470
    r0_470:defaultMenuMouseMove(r1_470, r2_470, r3_470, r4_470, r5_470, r6_470)
    local r7_470 = cclass.lua_Layers:create()
    for r12_470, r13_470 in pairs({
      "CG",
      "Scene",
      "BGM"
    }) do
      if r13_470 == r0_470.MenuButton.selCursor then
        r7_470:setSubLayerVisible("Gallery", "GalleryBace", 46 - r12_470 - 1, 1)
      elseif r0_470.BT_DataBace[r13_470] ~= nil and r0_470.BT_DataBace[r13_470].active == 0 then
        r7_470:setSubLayerVisible("Gallery", "GalleryBace", 46 - r12_470 - 1, 0)
      end
    end
    if g_GalleryInfo.Page == 1 then
      r0_470:CgThumbnailOver(r1_470, r2_470, r3_470, r4_470, r5_470, r6_470)
    end
    if g_GalleryInfo.Page == 2 then
      r0_470:ReplayThumbnailOver(r1_470, r2_470, r3_470, r4_470, r5_470, r6_470)
    end
    if g_GalleryInfo.Page == 4 then
      r0_470:NmsMouseMove(r1_470, r2_470, r3_470, r4_470, r5_470, r6_470)
    end
  end
  g_Menu.GalleryMenu.ptr.defaultMenuLButtonDown = g_Menu.GalleryMenu.ptr.MenuLButtonDown
  function g_Menu.GalleryMenu.ptr.MenuLButtonDown(r0_471, r1_471, r2_471, r3_471, r4_471, r5_471, r6_471)
    -- line: [16312, 16318] id: 471
    r0_471:defaultMenuLButtonDown(r1_471, r2_471, r3_471, r4_471, r5_471, r6_471)
    if g_GalleryInfo.Page == 4 then
      r0_471:DropRepeatLD(r1_471, r2_471, r3_471, r4_471, r5_471, r6_471)
    end
  end
  function g_Menu.GalleryMenu.ptr.MenuMouseWheel(r0_472, r1_472, r2_472)
    -- line: [16322, 16326] id: 472
    if g_GalleryInfo.Page == 4 then
      r0_472:NmsMouseWheel(r1_472, r2_472)
    end
  end
  g_Menu.GalleryMenu.ptr.GalleryItemP1 = {}
  g_Menu.GalleryMenu.ptr.GalleryItemP2 = {}
  g_Menu.GalleryMenu.ptr.GalleryItemP3 = {}
  function g_Menu.GalleryMenu.ptr.ItemSetInit(r0_473, r1_473)
    -- line: [16338, 16347] id: 473
    local r2_473 = {
      selCursor_selName = -1,
      selCursor_Item = {},
    }
    for r6_473 = 1, r1_473, 1 do
      r2_473.selCursor_Item[r6_473] = -1
    end
    return r2_473
  end
  function g_Menu.GalleryMenu.ptr.ItemSet(r0_474, r1_474, r2_474, ...)
    -- line: [16351, 16372] id: 474
    item = {
      ...
    }
    r1_474.selCursor_selName = r2_474
    for r7_474 = 1, #r1_474.selCursor_Item, 1 do
      if r1_474.selCursor_Item[r7_474] ~= -1 then
        r1_474.selCursor_Item[r7_474]:SetAct("def")
      end
      r1_474.selCursor_Item[r7_474] = -1
      if r7_474 <= #item and item[r7_474] ~= -1 then
        r1_474.selCursor_Item[r7_474] = r1_474[item[r7_474]]
        r1_474.selCursor_Item[r7_474]:SetAct("on")
      end
    end
  end
  function g_Menu.GalleryMenu.ptr.ConfigLogo(r0_475, r1_475, r2_475, r3_475, r4_475)
    -- line: [16377, 16435] id: 475
    if r1_475 == 0 then
      return 
    end
    local r5_475 = cclass.lua_Layers:create()
    local r6_475 = 0
    local r7_475 = 51 + (r1_475 - 1) * 4
    local r8_475 = r7_475 - 1
    local r9_475 = 51 + (r2_475 - 1) * 4
    local r10_475 = r9_475 - 1
    if r3_475 > 0 then
      if r2_475 >= 1 then
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r9_475, LUA_PARAM_POS, r0_475.LogoMainPos[r2_475].posx, r0_475.LogoMainPos[r2_475].posy, 0, 0)
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r10_475, LUA_PARAM_POS, r0_475.LogoSubPos[r2_475].posx, r0_475.LogoSubPos[r2_475].posy, 0, 0)
        r5_475:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r9_475, LUA_EFFECT_POS, -500, 0, 0, 0, 0, r3_475 / 2, 0, r6_475)
        r5_475:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r10_475, LUA_EFFECT_POS, 250, 0, 0, 0, 0, r3_475 / 2, 0, r6_475)
        r5_475:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r9_475, 0)
        r5_475:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r10_475, 0)
        r6_475 = r3_475 / 2
      end
      if r1_475 >= 1 then
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r7_475, LUA_PARAM_POS, r0_475.LogoMainPos[r1_475].posx - 500, r0_475.LogoMainPos[r1_475].posy, 0, 0)
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r8_475, LUA_PARAM_POS, r0_475.LogoSubPos[r1_475].posx + 250, r0_475.LogoSubPos[r1_475].posy, 0, 0)
        r5_475:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r7_475, LUA_EFFECT_POS, 500, 0, 0, 0, 0, r3_475 / 2, 0, r6_475)
        r5_475:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r8_475, LUA_EFFECT_POS, -250, 0, 0, 0, 0, r3_475 / 2, 0, r6_475)
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r7_475, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r8_475, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_475:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r7_475, 0)
        r5_475:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r8_475, 0)
      end
    else
      if r2_475 >= 1 then
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r9_475, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r10_475, LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
      if r1_475 >= 1 then
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r7_475, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_475:setSubLayerParam("Gallery", "GalleryBace", r8_475, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
  end
  g_Menu.GalleryMenu.ptr.beforePage = 0
  function g_Menu.GalleryMenu.ptr.initPageGallery(r0_476, r1_476, r2_476)
    -- line: [16439, 16610] id: 476
    if r1_476 == 0 then
      r1_476 = g_GalleryInfo.Page
    end
    local r3_476 = cclass.lua_Layers:create()
    local r4_476 = 300
    local r5_476 = cclass.lua_Layers:create()
    local r6_476 = getEffectRate()
    local r7_476 = 0
    local r8_476 = 0
    local r9_476 = 0
    local r10_476 = 0
    local r11_476 = ""
    r0_476.MenuButton:InitList()
    if r0_476:GetBgmNo() == 0 then
      r0_476.BT_DataBace.stop:bt_SetActive(2)
    else
      r0_476.BT_DataBace.stop:bt_SetActive(0)
    end
    for r16_476, r17_476 in pairs({
      "CG",
      "Scene",
      "BGM"
    }) do
      if r16_476 == r1_476 then
        r5_476:setSubLayerVisible("Gallery", "GalleryBace", 46 - r16_476 - 1, 1)
        r0_476.BT_DataBace[r17_476]:bt_SetActive(1)
      else
        if r17_476 == r0_476.MenuButton.selCursor then
          r5_476:setSubLayerVisible("Gallery", "GalleryBace", 46 - r16_476 - 1, 1)
        else
          r5_476:setSubLayerVisible("Gallery", "GalleryBace", 46 - r16_476 - 1, 0)
        end
        r0_476.BT_DataBace[r17_476]:bt_SetActive(0)
      end
    end
    if r1_476 == 1 then
      r11_476 = r0_476:InitCgMenu()
    end
    if r1_476 == 2 then
      r11_476 = r0_476:InitSceneMenu()
    end
    if r1_476 == 3 then
      r11_476 = r0_476:InitBgmMenu()
    end
    if r1_476 == 4 then
      r11_476 = r0_476:InitNmsMenu()
    end
    r0_476.MenuButton:SetList("BT_DataBace", r0_476.BT_DataBace)
    if r2_476 == true then
      if nil and not nil then
        goto label_121	-- block#23 is visited secondly
      end
      r0_476:ConfigLogo(r1_476, r0_476.beforePage, 0, 0)
    else
      r0_476.beforePage = g_GalleryInfo.Page
      local r13_476 = r0_476.beforePage
      if r1_476 < r13_476 then
        r13_476 = APP_INTERNAL_WIDTH or -1 * APP_INTERNAL_WIDTH
      else
        goto label_139	-- block#27 is visited secondly
      end
      local r14_476 = r0_476.beforePage
      if r1_476 < r14_476 then
        r14_476 = 90 or -90
      else
        goto label_147	-- block#30 is visited secondly
      end
      local r15_476 = r4_476 * r6_476
      local r16_476 = 0
      r0_476.MenuInf.PageEffect = true
      if r1_476 == 1 then
        r0_476:CgThumbnailEffect(g_GalleryInfo.CgPage, r13_476, r15_476, r14_476, false)
      end
      if r1_476 == 2 then
        r0_476:ReplayThumbnailEffect(g_GalleryInfo.ScenePage, r13_476, r15_476, r14_476, false)
      end
      if r1_476 == 3 then
      end
      if r1_476 == 4 then
        r0_476:NmsChangeEffect(r13_476, r4_476, false)
      end
      local r17_476 = ""
      if r0_476.beforePage == 1 then
        r17_476 = r0_476.CgMenu.keyname
        r0_476:CgThumbnailEffect(g_GalleryInfo.CgPage, r13_476, r15_476, r14_476, true)
      end
      if r0_476.beforePage == 2 then
        r17_476 = "GalleryScene"
        r0_476:ReplayThumbnailEffect(g_GalleryInfo.ScenePage, r13_476, r15_476, r14_476, true)
      end
      if r0_476.beforePage == 3 then
        r17_476 = "GalleryBgm"
      end
      if r0_476.beforePage == 4 then
        r17_476 = r0_476:NmsChangeEffect(r13_476, r4_476, true)
      end
      r5_476:setEffect("Gallery", r17_476, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r4_476 * r6_476, 0, 0)
      r5_476:setEffect("Gallery", r17_476, "GalleryPageEff", LUA_EFFECT_POS, r13_476, 0, 0, 0, 0, r4_476 * r6_476, 0, 0)
      r5_476:startEffect("Gallery", r17_476, "GalleryPageEff", 0)
      r5_476:setParam("Gallery", r11_476, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r5_476:setEffect("Gallery", r11_476, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r4_476 * r6_476, 0, 0)
      r5_476:setParam("Gallery", r11_476, LUA_PARAM_POS, -1 * r13_476, 0, 0, 0)
      r5_476:setEffect("Gallery", r11_476, "GalleryPageEff", LUA_EFFECT_POS, r13_476, 0, 0, 0, 0, r4_476 * r6_476, 0, 0)
      r5_476:startEffect("Gallery", r11_476, "GalleryPageEff", 0)
      r0_476:ConfigLogo(r1_476, r0_476.beforePage, r4_476, r6_476)
    end
    g_GalleryInfo.Page = r1_476
    cfunc.LegacyGame__lua_SetVariable(103, r1_476)
  end
  function g_Menu.GalleryMenu.ptr.closeGallery(r0_477, r1_477)
    -- line: [16620, 16649] id: 477
    cfunc.LegacyGame__lua_SetVariable(100, g_GalleryInfo.CgPage)
    cfunc.LegacyGame__lua_SetVariable(101, g_GalleryInfo.ScenePage)
    cfunc.LegacyGame__lua_SetVariable(102, g_GalleryInfo.BgmPage)
    NmsMenuSaveBookMark()
    if r1_477 == 2 or r1_477 == 4 then
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      cclass.lua_Layers:create():removeSnap("system")
      r0_477:MenuEffectEnd(0)
    else
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      r0_477:MenuEffectToMenu(0)
    end
    r0_477.MenuInf.enabled = false
    r0_477.MenuInf.effect = true
  end
  function g_Menu.GalleryMenu.ptr.PlayTitleSound(r0_478)
    -- line: [16651, 16661] id: 478
    if r0_478.CompFlag == false and r0_478:GetBgmNo() ~= 2 then
      r0_478:GalleryBgmPlay(2)
    elseif r0_478:GetBgmNo() ~= 26 then
      r0_478:GalleryBgmPlay(26)
    end
  end
  g_Menu.GalleryMenu.ptr.LogoMainPos = {}
  g_Menu.GalleryMenu.ptr.LogoSubPos = {}
  function g_Menu.GalleryMenu.ptr.InitGallery(r0_479, r1_479)
    -- line: [16670, 16773] id: 479
    local r2_479 = cclass.lua_Layers:create()
    g_GalleryInfo.CgPageMax = 10
    g_GalleryInfo.ScenePageMax = 2
    g_GalleryInfo.BgmPageMax = 2
    g_Menu.GalleryMenu.ptr:MenuLoadLayer("GalleryBace", "SYS_GalleryBase.pna")
    g_Menu.GalleryMenu.ptr:MenuLoadLayer("GalleryBaceBack", "SYS_Gallery_bg.png")
    r2_479:swapLayerOrder("Gallery", "GalleryBace", "GalleryBaceBack")
    for r6_479 = 0, 2, 1 do
      local r7_479 = 51 + r6_479 * 4
      local r8_479 = r7_479 - 1
      r2_479:initSubLayer("Gallery", "GalleryBace", r7_479, 1)
      r2_479:initSubLayer("Gallery", "GalleryBace", r8_479, 1)
      local r9_479 = 0
      local r10_479 = 0
      r9_479, r10_479, r11_479, r12_479 = r2_479:getSubLayerParam("Gallery", "GalleryBace", r7_479, LUA_PARAM_POS, r9_479, r10_479, 0, 0)
      r0_479.LogoMainPos[r6_479 + 1] = {
        posx = r9_479,
        posy = r10_479,
      }
      local r13_479 = 0
      local r14_479 = 0
      r13_479, r14_479, r15_479, r16_479 = r2_479:getSubLayerParam("Gallery", "GalleryBace", r8_479, LUA_PARAM_POS, r13_479, r14_479, 0, 0)
      r0_479.LogoSubPos[r6_479 + 1] = {
        posx = r13_479,
        posy = r14_479,
      }
      r2_479:setSubLayerParam("Gallery", "GalleryBace", r7_479, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_479:setSubLayerParam("Gallery", "GalleryBace", r8_479, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_479:initSubLayer("Gallery", "GalleryBace", 46 - r6_479, 0)
    end
    r2_479:initSubLayer("Gallery", "GalleryBace", 62, 1)
    r2_479:initSubLayer("Gallery", "GalleryBace", 63, 1)
    r2_479:initSubLayer("Gallery", "GalleryBace", 64, 1)
    r0_479.BT_DataBace = {}
    r0_479:MenuButtonSet(r0_479.BT_DataBace, "CG", 1, "GalleryBace", 21, 36, 26, 31, 41, 1, 0, 0)
    r0_479:MenuButtonSet(r0_479.BT_DataBace, "Scene", 1, "GalleryBace", 20, 35, 25, 30, 40, 2, 0, 0)
    r0_479:MenuButtonSet(r0_479.BT_DataBace, "BGM", 1, "GalleryBace", 19, 34, 24, 29, 39, 3, 0, 0)
    r0_479:MenuButtonSet(r0_479.BT_DataBace, "stop", 1, "GalleryBace", 9, 9, 4, -1, 14, 10, 0, 0)
    r0_479:MenuButtonSet(r0_479.BT_DataBace, "back", 1, "GalleryBace", 8, 8, 3, -1, 13, 13, 0, 0)
    r0_479:MenuButtonSet(r0_479.BT_DataBace, "quit", 1, "GalleryBace", 7, 7, 2, -1, 12, 12, 0, 0)
    r0_479.MenuButton:SetList("BT_DataBace", r0_479.BT_DataBace)
    r0_479:MenuButtonInit()
    local r3_479 = cfunc.LegacyGame__lua_GetVariable(103)
    if r1_479 ~= 0 then
      if r0_479.CompFlag == false then
        r0_479:GalleryBgmPlay(2)
      else
        r0_479:GalleryBgmPlay(26)
      end
    end
    r0_479:initPageGallery(r3_479, true)
  end
  GalleryCgMenu(g_Menu.GalleryMenu.ptr)
  GallerySceneMenu(g_Menu.GalleryMenu.ptr)
  GalleryBgmMenu(g_Menu.GalleryMenu.ptr)
  GalleryNmsMenu(g_Menu.GalleryMenu.ptr)
  local r2_463 = g_Menu.GalleryMenu.ptr:MenuInit(r1_463)
  if res == false then
    return false
  end
  g_Menu.GalleryMenu.ptr.CompFlag = cfunc.LegacyGame__lua_GetFlag(1000)
  g_Menu.GalleryMenu.ptr:InitGallery(r1_463)
  local r3_463 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r3_463:setSnap("system", true)
  end
  r3_463:copySnap("Gallery", "system")
  g_Menu.GalleryMenu.ptr:MenuEffectStart(500, 0)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function GalleryCgMenu(r0_480)
  -- line: [16845, 17261] id: 480
  r0_480.CgMenu = {}
  r0_480.CgMenu.DataPage = {}
  r0_480.CgMenu.DataTh = {}
  r0_480.CgMenu.keyname = "GalleryCg"
  r0_480.CgMenu.LayerName = "SYS_CgThumbnail"
  r0_480.CgMenu.FileName = "SYS_GalleryCg.pna"
  r0_480.CgMenu.ThFileName = "SYS_GalleryCgTH.pna"
  r0_480.CgMenu.ThXLineMax = 4
  r0_480.CgMenu.ThYLineMax = 3
  r0_480.CgMenu.ThAllMax = r0_480.CgMenu.ThXLineMax * r0_480.CgMenu.ThYLineMax
  function r0_480.InitCgButton(r0_481, r1_481)
    -- line: [16861, 16893] id: 481
    local r2_481 = cclass.lua_Layers:create()
    r0_481.CgMenu.DataPage = {}
    for r6_481 = 1, g_GalleryInfo.CgPageMax, 1 do
      local r8_481 = 80 - r6_481 - 1
      r0_481:MenuButtonSet(r0_481.CgMenu.DataPage, "P" .. tostring(r6_481), 1, r1_481, r8_481, r8_481, 56 - r6_481 - 1, 68 - r6_481 - 1, 92 - r6_481 - 1, 100 + r6_481, 0, 0)
    end
    r0_481.CgMenu.DataTh = {}
    for r6_481 = 1, r0_481.CgMenu.ThAllMax, 1 do
      local r8_481 = 28 - r6_481 - 1
      r0_481:MenuButtonSet(r0_481.CgMenu.DataTh, "TH" .. tostring(r6_481), 1, r1_481, r8_481, r8_481, 14 - r6_481 - 1, -1, 42 - r6_481 - 1, 200 + r6_481, 0, 0)
    end
  end
  function r0_480.InitCgMenu(r0_482)
    -- line: [16896, 16932] id: 482
    local r1_482 = cclass.lua_Layers:create()
    r0_482:MenuLoadLayer(r0_482.CgMenu.keyname, r0_482.CgMenu.FileName)
    r0_482:LoadCgThumbnail(g_GalleryInfo.CgPage)
    r0_482:InitCgButton(r0_482.CgMenu.keyname)
    r0_482.MenuButton:SetList("BT_CgDataPage", r0_482.CgMenu.DataPage)
    r0_482.MenuButton:SetList("BT_CgDataTh", r0_482.CgMenu.DataTh)
    r0_482:MenuButtonInit()
    r0_482:CGPageInit(g_GalleryInfo.CgPage, g_GalleryInfo.CgPage, true)
    return r0_482.CgMenu.keyname
  end
  function r0_480.GetCgThumbnailOnOff(r0_483, r1_483, r2_483)
    -- line: [16935, 16949] id: 483
    local r3_483 = (r1_483 - 1) * 30 - r2_483 - 1 + 13
    local r4_483 = (r1_483 - 1) * 30 - r2_483 - 1 + 27
    if r1_483 == 10 then
      r3_483 = 0 - r2_483 - 1 + 272
      r4_483 = 0 - r2_483 - 1 + 275
    end
    return r3_483, r4_483
  end
  function r0_480.LoadCgThumbnail(r0_484, r1_484)
    -- line: [16952, 16999] id: 484
    r0_484:MenuLoadLayer(r0_484.CgMenu.LayerName, r0_484.CgMenu.ThFileName)
    local r2_484 = 1
    local r3_484 = cclass.lua_Layers:create()
    for r7_484 = 1, r0_484.CgMenu.ThYLineMax, 1 do
      for r11_484 = 1, r0_484.CgMenu.ThXLineMax, 1 do
        local r12_484 = r0_484:GetCgFlag(r1_484, r2_484)
        local r13_484 = -1
        local r14_484 = -1
        local r15_484 = 0
        local r16_484 = 0
        r15_484, r16_484 = r0_484:GetCgThumbnailOnOff(r1_484, r2_484)
        if r12_484 == 1 then
          if r15_484 ~= -1 then
            r3_484:initSubLayer(r0_484.MenuInf.SetName, r0_484.CgMenu.LayerName, r15_484, 0)
            if r13_484 ~= -1 and r14_484 ~= -1 then
              r3_484:setSubLayerParam(r0_484.MenuInf.SetName, r0_484.CgMenu.LayerName, r15_484, LUA_PARAM_POS, r13_484, r14_484, 0, 0)
            end
          end
          if r16_484 ~= -1 then
            r3_484:initSubLayer(r0_484.MenuInf.SetName, r0_484.CgMenu.LayerName, r16_484, 1)
            if r13_484 ~= -1 and r14_484 ~= -1 then
              r3_484:setSubLayerParam(r0_484.MenuInf.SetName, r0_484.CgMenu.LayerName, r16_484, LUA_PARAM_POS, r13_484, r14_484, 0, 0)
            end
          end
        end
        r2_484 = r2_484 + 1
      end
    end
  end
  function r0_480.DeleteCgThumbnail(r0_485, r1_485)
    -- line: [17002, 17005] id: 485
    cclass.lua_Layers:create():removeLayer(r0_485.MenuInf.SetName, r0_485.CgMenu.LayerName)
  end
  function r0_480.DeleteCgMenu(r0_486)
    -- line: [17008, 17012] id: 486
    cclass.lua_Layers:create():removeLayer(r0_486.MenuInf.SetName, r0_486.CgMenu.keyname)
    r0_486:DeleteCgThumbnail(g_GalleryInfo.CgPage)
  end
  function r0_480.CgThumbnailEffect(r0_487, r1_487, r2_487, r3_487, r4_487, r5_487)
    -- line: [17016, 17044] id: 487
    local r6_487 = cclass.lua_Layers:create()
    if r5_487 == false then
      r6_487:setParam(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r6_487:setEffect(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_487, 0, 0)
      r6_487:setParam(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, LUA_PARAM_POS, -r2_487, 0, 0, 0)
      r6_487:setParam(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, LUA_PARAM_ROTATE, -r4_487, 0, 0, 0)
      r6_487:setEffect(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_487, 0, 0, 0, 0, r3_487, 0, 0)
      r6_487:setEffect(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_ROTATE, r4_487, 0, 0, 0, 0, r3_487, 0, 0)
      r6_487:startEffect(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, "GalleryPageEff", 0)
    else
      r6_487:setParam(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r6_487:setEffect(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_487, 0, 0)
      r6_487:setParam(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, LUA_PARAM_POS, 0, 0, 0, 0)
      r6_487:setParam(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r6_487:setEffect(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_487, 0, 0, 0, 0, r3_487, 0, 0)
      r6_487:setEffect(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_ROTATE, r4_487, 0, 0, 0, 0, r3_487, 0, 0)
      r6_487:startEffect(r0_487.MenuInf.SetName, r0_487.CgMenu.LayerName, "GalleryPageEff", 0)
    end
  end
  function r0_480.CgThumbnailOver(r0_488, r1_488, r2_488, r3_488, r4_488, r5_488, r6_488)
    -- line: [17047, 17098] id: 488
    local r7_488 = cclass.lua_Layers:create()
    local r8_488 = 0
    local r9_488 = 0
    local r10_488 = -1
    if r0_488.MenuButton.selCursor ~= -1 then
      r10_488 = r0_488.MenuButton.selListKey[r0_488.MenuButton.selCursor]
      r9_488 = r10_488.arg
      r8_488 = r10_488.bt_l
    end
    for r14_488 = 1, r0_488.CgMenu.ThAllMax, 1 do
      local r15_488 = 0
      local r16_488 = 0
      if r0_488:GetCgFlag(g_GalleryInfo.CgPage, r14_488) == 1 then
        r15_488, r16_488 = r0_488:GetCgThumbnailOnOff(g_GalleryInfo.CgPage, r14_488)
        if r15_488 ~= -1 then
          r7_488:setSubLayerVisible(r0_488.MenuInf.SetName, r0_488.CgMenu.LayerName, r15_488, 0)
        end
        if r16_488 ~= -1 then
          r7_488:setSubLayerVisible(r0_488.MenuInf.SetName, r0_488.CgMenu.LayerName, r16_488, 1)
        end
      end
    end
    if 201 <= r8_488 and r8_488 <= 215 then
      local r11_488 = r8_488 - 200
      local r12_488 = 0
      local r13_488 = 0
      if r0_488:GetCgFlag(g_GalleryInfo.CgPage, r11_488) == 1 then
        r12_488, r13_488 = r0_488:GetCgThumbnailOnOff(g_GalleryInfo.CgPage, r11_488)
        if r12_488 ~= -1 then
          r7_488:setSubLayerVisible(r0_488.MenuInf.SetName, r0_488.CgMenu.LayerName, r12_488, 1)
        end
        if r13_488 ~= -1 then
          r7_488:setSubLayerVisible(r0_488.MenuInf.SetName, r0_488.CgMenu.LayerName, r13_488, 0)
        end
      end
    end
  end
  function r0_480.GetCgFlag(r0_489, r1_489, r2_489)
    -- line: [17102, 17189] id: 489
    local r3_489 = {
      EVCOM_01 = 1120,
      EVCOM_02 = 1121,
      EVCOM_03 = 1122,
      EVCOM_04 = 1123,
      EVCOM_05 = 1124,
      EVCOM_06 = 1125,
      EVHIK_01 = 1126,
      EVHIK_02 = 1127,
      EVHIK_03 = 1128,
      EVHIK_04 = 1129,
      EVHIK_05 = 1130,
      EVHIK_06 = 1131,
      EVHIK_07 = 1132,
      EVHIK_08 = 1133,
      EVHIK_09 = 1134,
      EVHIK_10 = 1135,
      EVHIK_11 = 1136,
      EVHIK_12 = 1137,
      EVHIK_13 = 1138,
      EVHIK_14 = 1139,
      EVHIK_15 = 1140,
      EVHIK_16 = 1141,
      EVHIK_17 = 1142,
      EVHIK_18 = 1143,
      EVHIK_19 = 1144,
      EVHIK_20 = 1145,
      EVHIK_21 = 1146,
      EVHIK_22 = 1147,
      EVHIK_23 = 1148,
      EVSAY_01 = 1149,
      EVSAY_02 = 1150,
      EVSAY_03 = 1151,
      EVSAY_04 = 1152,
      EVSAY_05 = 1153,
      EVSAY_06 = 1154,
      EVSAY_07 = 1155,
      EVSAY_08 = 1156,
      EVSAY_09 = 1157,
      EVSAY_10 = 1158,
      EVSAY_11 = 1159,
      EVSAY_12 = 1160,
      EVSAY_13 = 1161,
      EVSAY_14 = 1162,
      EVSAY_15 = 1163,
      EVSAY_16 = 1164,
      EVSAY_17 = 1165,
      EVSAY_18 = 1166,
      EVSAY_19 = 1167,
      EVSAY_20 = 1168,
      EVSAY_21 = 1169,
      EVSAY_22 = 1170,
      EVSAY_23 = 1171,
      EVORI_01 = 1172,
      EVORI_02 = 1173,
      EVORI_03 = 1175,
      EVORI_04 = 1174,
      EVORI_05 = 1176,
      EVORI_07 = 1177,
      EVORI_08 = 1178,
      EVORI_09 = 1179,
      EVORI_10 = 1180,
      EVORI_11 = 1181,
      EVORI_12 = 1182,
      EVORI_13 = 1183,
      EVORI_14 = 1184,
      EVORI_15 = 1185,
      EVORI_16 = 1186,
      EVORI_17 = 1187,
      EVORI_18 = 1188,
      EVORI_19 = 1189,
      EVKOR_01 = 1190,
      EVKOR_02 = 1191,
      EVKOR_03 = 1192,
      EVKOR_04 = 1193,
      EVKOR_07 = 1194,
      EVKOR_08 = 1195,
      EVKOR_09 = 1196,
      EVKOR_10 = 1197,
      EVKOR_11 = 1198,
      EVKOR_12 = 1199,
      EVKOR_13 = 1200,
      EVKOR_14 = 1201,
      EVKOR_15 = 1202,
      EVKOR_16 = 1203,
      EVKOR_17 = 1204,
      EVKOR_18 = 1205,
      EVKOR_19 = 1206,
      SDEV_01 = 1207,
      SDEV_02 = 1208,
      SDEV_03 = 1209,
      SDEV_04 = 1210,
      SDEV_05 = 1211,
      SDEV_06 = 1212,
      SDEV_07 = 1213,
      SDEV_08 = 1214,
      SDEV_09 = 1215,
      SDEV_10 = 1216,
      SDEV_11 = 1217,
      SDEV_12 = 1218,
      SDEV_13 = 1219,
      SDEV_14 = 1220,
      SDEV_15 = 1221,
      SDEV_16 = 1222,
      SDEV_17 = 1223,
      SDEV_18 = 1224,
      SDEV_19 = 1225,
      SDEV_20 = 1226,
      SDEV_21 = 1227,
      SDEV_22 = 1228,
    }
    local r5_489 = ({
      {
        r3_489.EVCOM_01,
        r3_489.EVCOM_02,
        r3_489.EVCOM_03,
        r3_489.EVCOM_04,
        r3_489.EVCOM_05,
        r3_489.EVCOM_06,
        r3_489.EVHIK_02,
        r3_489.EVHIK_03,
        r3_489.EVHIK_04,
        r3_489.EVHIK_01,
        r3_489.EVHIK_05,
        r3_489.EVHIK_06
      },
      {
        r3_489.EVHIK_07,
        r3_489.EVHIK_08,
        r3_489.EVHIK_09,
        r3_489.EVHIK_10,
        r3_489.EVHIK_11,
        r3_489.EVHIK_12,
        r3_489.EVHIK_13,
        r3_489.EVHIK_14,
        r3_489.EVHIK_15,
        r3_489.EVHIK_16,
        r3_489.EVHIK_17,
        r3_489.EVHIK_18
      },
      {
        r3_489.EVHIK_19,
        r3_489.EVHIK_20,
        r3_489.EVHIK_21,
        r3_489.EVHIK_22,
        r3_489.EVHIK_23,
        r3_489.EVSAY_03,
        r3_489.EVSAY_05,
        r3_489.EVSAY_09,
        r3_489.EVSAY_01,
        r3_489.EVSAY_02,
        r3_489.EVSAY_04,
        r3_489.EVSAY_06
      },
      {
        r3_489.EVSAY_07,
        r3_489.EVSAY_08,
        r3_489.EVSAY_10,
        r3_489.EVSAY_11,
        r3_489.EVSAY_12,
        r3_489.EVSAY_13,
        r3_489.EVSAY_14,
        r3_489.EVSAY_15,
        r3_489.EVSAY_16,
        r3_489.EVSAY_17,
        r3_489.EVSAY_18,
        r3_489.EVSAY_19
      },
      {
        r3_489.EVSAY_20,
        r3_489.EVSAY_21,
        r3_489.EVSAY_22,
        r3_489.EVSAY_23,
        r3_489.EVORI_01,
        r3_489.EVORI_02,
        r3_489.EVORI_03,
        r3_489.EVORI_04,
        r3_489.EVORI_05,
        r3_489.EVORI_07,
        r3_489.EVORI_08,
        r3_489.EVORI_09
      },
      {
        r3_489.EVORI_10,
        r3_489.EVORI_11,
        r3_489.EVORI_12,
        r3_489.EVORI_13,
        r3_489.EVORI_14,
        r3_489.EVORI_15,
        r3_489.EVORI_16,
        r3_489.EVORI_17,
        r3_489.EVORI_18,
        r3_489.EVORI_19,
        r3_489.EVKOR_01,
        r3_489.EVKOR_02
      },
      {
        r3_489.EVKOR_03,
        r3_489.EVKOR_04,
        r3_489.EVKOR_07,
        r3_489.EVKOR_08,
        r3_489.EVKOR_09,
        r3_489.EVKOR_10,
        r3_489.EVKOR_11,
        r3_489.EVKOR_12,
        r3_489.EVKOR_13,
        r3_489.EVKOR_14,
        r3_489.EVKOR_15,
        r3_489.EVKOR_16
      },
      {
        r3_489.EVKOR_17,
        r3_489.EVKOR_18,
        r3_489.EVKOR_19,
        r3_489.SDEV_03,
        r3_489.SDEV_04,
        r3_489.SDEV_01,
        r3_489.SDEV_05,
        r3_489.SDEV_02,
        r3_489.SDEV_07,
        r3_489.SDEV_10,
        r3_489.SDEV_06,
        r3_489.SDEV_08
      },
      {
        r3_489.SDEV_09,
        r3_489.SDEV_11,
        r3_489.SDEV_12,
        r3_489.SDEV_13,
        r3_489.SDEV_14,
        r3_489.SDEV_19,
        r3_489.SDEV_15,
        r3_489.SDEV_17,
        r3_489.SDEV_16,
        r3_489.SDEV_18,
        r3_489.SDEV_20,
        r3_489.SDEV_21
      },
      {
        r3_489.SDEV_22
      }
    })[r1_489][r2_489]
    if r5_489 == nil then
      return -1
    end
    if cfunc.LegacyGame__lua_GetFlag(r5_489) then
      return 1
    else
      return 0
    end
  end
  function r0_480.CGPageInit(r0_490, r1_490, r2_490, r3_490)
    -- line: [17193, 17259] id: 490
    g_GalleryInfo.CgPage = r1_490
    local r4_490 = "P" .. tostring(g_GalleryInfo.CgPage)
    local r5_490 = cclass.lua_Layers:create()
    for r9_490 = 1, g_GalleryInfo.CgPageMax, 1 do
      r4_490 = "P" .. tostring(r9_490)
      if r9_490 == g_GalleryInfo.CgPage then
        r0_490.CgMenu.DataPage[r4_490]:bt_SetActive(1)
      else
        r0_490.CgMenu.DataPage[r4_490]:bt_SetActive(0)
      end
    end
    local r6_490 = false
    for r10_490 = 1, r0_490.CgMenu.ThAllMax, 1 do
      r4_490 = "TH" .. tostring(r10_490)
      local r11_490 = r0_490:GetCgFlag(r1_490, r10_490)
      if r11_490 == 1 then
        r0_490.CgMenu.DataTh[r4_490]:bt_SetActive(0)
      end
      if r11_490 == 0 then
        r0_490.CgMenu.DataTh[r4_490]:bt_SetActive(2)
      end
      if r11_490 == -1 then
        r0_490.CgMenu.DataTh[r4_490]:bt_SetActive(3)
      end
      if false then
        local r12_490 = 116 - (r10_490 - 1) * 8
        local r13_490 = 115 - (r10_490 - 1) * 8
        if r11_490 == -1 then
          r5_490:setSubLayerVisible(r0_490.MenuInf.SetName, r0_490.CgMenu.keyname, r12_490, 0)
          r5_490:setSubLayerVisible(r0_490.MenuInf.SetName, r0_490.CgMenu.keyname, r13_490, 0)
        end
        if r11_490 == 0 then
          r5_490:setSubLayerVisible(r0_490.MenuInf.SetName, r0_490.CgMenu.keyname, r12_490, 0)
          r5_490:setSubLayerVisible(r0_490.MenuInf.SetName, r0_490.CgMenu.keyname, r13_490, 1)
        end
        if r11_490 == 1 then
          r5_490:setSubLayerVisible(r0_490.MenuInf.SetName, r0_490.CgMenu.keyname, r12_490, 1)
          r5_490:setSubLayerVisible(r0_490.MenuInf.SetName, r0_490.CgMenu.keyname, r13_490, 0)
        end
      end
    end
    r0_490:DeleteCgThumbnail(r2_490)
    r0_490:LoadCgThumbnail(r1_490)
  end
end
function GallerySceneMenu(r0_491)
  -- line: [17265, 17619] id: 491
  r0_491.SceneMenu = {}
  r0_491.SceneMenu.DataPage = {}
  r0_491.SceneMenu.DataTh = {}
  r0_491.SceneMenu.keyname = "GalleryScene"
  r0_491.SceneMenu.LayerName = "SYS_SceneThumbnail"
  r0_491.SceneMenu.FileName = "SYS_GalleryRe.pna"
  r0_491.SceneMenu.ThFileName = "SYS_GalleryReTH.pna"
  r0_491.SceneMenu.ThXLineMax = 4
  r0_491.SceneMenu.ThYLineMax = 3
  r0_491.SceneMenu.ThAllMax = r0_491.SceneMenu.ThXLineMax * r0_491.SceneMenu.ThYLineMax
  function r0_491.InitSceneButton(r0_492, r1_492)
    -- line: [17281, 17313] id: 492
    local r2_492 = cclass.lua_Layers:create()
    r0_492.SceneMenu.DataPage = {}
    for r6_492 = 1, g_GalleryInfo.ScenePageMax, 1 do
      local r8_492 = 56 - r6_492 - 1
      r0_492:MenuButtonSet(r0_492.SceneMenu.DataPage, "P" .. tostring(r6_492), 1, r1_492, r8_492, r8_492, 48 - r6_492 - 1, 52 - r6_492 - 1, 60 - r6_492 - 1, 100 + r6_492, 0, 0)
    end
    r0_492.SceneMenu.DataTh = {}
    for r6_492 = 1, r0_492.SceneMenu.ThAllMax, 1 do
      local r8_492 = 28 - r6_492 - 1
      r0_492:MenuButtonSet(r0_492.SceneMenu.DataTh, "TH" .. tostring(r6_492), 1, r1_492, r8_492, r8_492, 14 - r6_492 - 1, -1, 42 - r6_492 - 1, 200 + r6_492, 0, 0)
    end
  end
  function r0_491.InitSceneMenu(r0_493)
    -- line: [17316, 17355] id: 493
    local r1_493 = cclass.lua_Layers:create()
    r0_493:MenuLoadLayer(r0_493.SceneMenu.keyname, r0_493.SceneMenu.FileName)
    r1_493:setVisible(r0_493.MenuInf.SetName, r0_493.SceneMenu.keyname, 1)
    r0_493:LoadReplayThumbnail(g_GalleryInfo.ScenePage)
    r0_493:InitSceneButton(r0_493.SceneMenu.keyname)
    r0_493.MenuButton:SetList("BT_SceneDataPage", r0_493.SceneMenu.DataPage)
    r0_493.MenuButton:SetList("BT_SceneDataTh", r0_493.SceneMenu.DataTh)
    r0_493:MenuButtonInit()
    r1_493:initSubLayer(r0_493.MenuInf.SetName, r0_493.SceneMenu.keyname, 65, 1)
    r0_493:ScenePageInit(g_GalleryInfo.ScenePage, g_GalleryInfo.ScenePage, true)
    return r0_493.SceneMenu.keyname
  end
  function r0_491.GetReplayThumbnailOnOff(r0_494, r1_494, r2_494)
    -- line: [17358, 17375] id: 494
    local r3_494 = 0 - r2_494 - 1 + 13
    local r4_494 = 0 - r2_494 - 1 + 27
    if r1_494 == 2 then
      r3_494 = 0 - r2_494 - 1 + 36
      r4_494 = 0 - r2_494 - 1 + 43
    end
    if r1_494 == 3 then
      r3_494 = 0 - r2_494 - 1 + 59
      r4_494 = 0 - r2_494 - 1 + 73
    end
    return r3_494, r4_494
  end
  function r0_491.LoadReplayThumbnail(r0_495, r1_495)
    -- line: [17378, 17420] id: 495
    r0_495:MenuLoadLayer(r0_495.SceneMenu.LayerName, r0_495.SceneMenu.ThFileName)
    local r2_495 = 1
    local r3_495 = cclass.lua_Layers:create()
    for r7_495 = 1, r0_495.SceneMenu.ThYLineMax, 1 do
      for r11_495 = 1, r0_495.SceneMenu.ThXLineMax, 1 do
        local r12_495 = r0_495:GetSceneFlag(r1_495, r2_495)
        local r13_495 = -1
        local r14_495 = -1
        local r15_495 = 0
        local r16_495 = 0
        r15_495, r16_495 = r0_495:GetReplayThumbnailOnOff(r1_495, r2_495)
        if r12_495 == 1 then
          if r15_495 ~= -1 then
            r3_495:initSubLayer(r0_495.MenuInf.SetName, r0_495.SceneMenu.LayerName, r15_495, 0)
            if r13_495 ~= -1 and r14_495 ~= -1 then
              r3_495:setSubLayerParam(r0_495.MenuInf.SetName, r0_495.SceneMenu.LayerName, r15_495, LUA_PARAM_POS, r13_495, r14_495, 0, 0)
            end
          end
          if r16_495 ~= -1 then
            r3_495:initSubLayer(r0_495.MenuInf.SetName, r0_495.SceneMenu.LayerName, r16_495, 1)
            if r13_495 ~= -1 and r14_495 ~= -1 then
              r3_495:setSubLayerParam(r0_495.MenuInf.SetName, r0_495.SceneMenu.LayerName, r16_495, LUA_PARAM_POS, r13_495, r14_495, 0, 0)
            end
          end
        end
        r2_495 = r2_495 + 1
      end
    end
  end
  function r0_491.DeleteReplayThumbnail(r0_496, r1_496)
    -- line: [17423, 17426] id: 496
    cclass.lua_Layers:create():removeLayer(r0_496.MenuInf.SetName, r0_496.SceneMenu.LayerName)
  end
  function r0_491.DeleteReplayMenu(r0_497)
    -- line: [17429, 17433] id: 497
    cclass.lua_Layers:create():removeLayer(r0_497.MenuInf.SetName, r0_497.SceneMenu.keyname)
    r0_497:DeleteReplayThumbnail(g_GalleryInfo.ScenePage)
  end
  function r0_491.ReplayThumbnailEffect(r0_498, r1_498, r2_498, r3_498, r4_498, r5_498)
    -- line: [17436, 17464] id: 498
    local r6_498 = cclass.lua_Layers:create()
    if r5_498 == false then
      r6_498:setParam(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r6_498:setEffect(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_498, 0, 0)
      r6_498:setParam(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, LUA_PARAM_POS, -r2_498, 0, 0, 0)
      r6_498:setEffect(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_498, 0, 0, 0, 0, r3_498, 0, 0)
      r6_498:startEffect(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, "GalleryPageEff", 0)
    else
      r6_498:setParam(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r6_498:setEffect(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_498, 0, 0)
      r6_498:setParam(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, LUA_PARAM_POS, 0, 0, 0, 0)
      r6_498:setEffect(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_498, 0, 0, 0, 0, r3_498, 0, 0)
      r6_498:startEffect(r0_498.MenuInf.SetName, r0_498.SceneMenu.LayerName, "GalleryPageEff", 0)
    end
  end
  function r0_491.ReplayThumbnailOver(r0_499, r1_499, r2_499, r3_499, r4_499, r5_499, r6_499)
    -- line: [17467, 17511] id: 499
    local r7_499 = 0
    local r8_499 = 0
    local r9_499 = -1
    if r0_499.MenuButton.selCursor ~= -1 then
      r9_499 = r0_499.MenuButton.selListKey[r0_499.MenuButton.selCursor]
      r8_499 = r9_499.arg
      r7_499 = r9_499.bt_l
    end
    local r10_499 = cclass.lua_Layers:create()
    for r14_499 = 1, r0_499.SceneMenu.ThAllMax, 1 do
      local r15_499 = 0
      local r16_499 = 0
      if r0_499:GetSceneFlag(g_GalleryInfo.ScenePage, r14_499) == 1 then
        r15_499, r16_499 = r0_499:GetReplayThumbnailOnOff(g_GalleryInfo.ScenePage, r14_499)
        if r15_499 ~= -1 then
          r10_499:setSubLayerVisible(r0_499.MenuInf.SetName, r0_499.SceneMenu.LayerName, r15_499, 0)
        end
        if r16_499 ~= -1 then
          r10_499:setSubLayerVisible(r0_499.MenuInf.SetName, r0_499.SceneMenu.LayerName, r16_499, 1)
        end
      end
    end
    if 201 <= r7_499 and r7_499 <= 215 then
      local r11_499 = r7_499 - 200
      local r12_499 = 0
      local r13_499 = 0
      if r0_499:GetSceneFlag(g_GalleryInfo.ScenePage, r11_499) == 1 then
        r12_499, r13_499 = r0_499:GetReplayThumbnailOnOff(g_GalleryInfo.ScenePage, r11_499)
        if r12_499 ~= -1 then
          r10_499:setSubLayerVisible(r0_499.MenuInf.SetName, r0_499.SceneMenu.LayerName, r12_499, 1)
        end
        if r13_499 ~= -1 then
          r10_499:setSubLayerVisible(r0_499.MenuInf.SetName, r0_499.SceneMenu.LayerName, r13_499, 0)
        end
      end
    end
  end
  function r0_491.GetSceneFlag(r0_500, r1_500, r2_500)
    -- line: [17515, 17560] id: 500
    local r3_500 = {
      REPLAY_001 = 1090,
      REPLAY_002 = 1091,
      REPLAY_003 = 1092,
      REPLAY_004 = 1093,
      REPLAY_005 = 1094,
      REPLAY_006 = 1095,
      REPLAY_007 = 1096,
      REPLAY_008 = 1097,
      REPLAY_009 = 1098,
      REPLAY_010 = 1099,
      REPLAY_011 = 1100,
      REPLAY_012 = 1101,
      REPLAY_013 = 1102,
      REPLAY_014 = 1103,
      REPLAY_015 = 1104,
      REPLAY_016 = 1105,
      REPLAY_017 = 1106,
    }
    local r5_500 = ({
      {
        r3_500.REPLAY_001,
        r3_500.REPLAY_002,
        r3_500.REPLAY_003,
        r3_500.REPLAY_004,
        r3_500.REPLAY_005,
        r3_500.REPLAY_006,
        r3_500.REPLAY_007,
        r3_500.REPLAY_008,
        r3_500.REPLAY_009,
        r3_500.REPLAY_010,
        r3_500.REPLAY_011,
        r3_500.REPLAY_012
      },
      {
        r3_500.REPLAY_013,
        r3_500.REPLAY_014,
        r3_500.REPLAY_015,
        r3_500.REPLAY_016,
        r3_500.REPLAY_017,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil
      }
    })[r1_500][r2_500]
    if r5_500 == nil then
      return -1
    end
    if cfunc.LegacyGame__lua_GetFlag(r5_500) then
      return 1
    else
      return 0
    end
  end
  function r0_491.ScenePageInit(r0_501, r1_501, r2_501, r3_501)
    -- line: [17562, 17617] id: 501
    g_GalleryInfo.ScenePage = r1_501
    local r4_501 = "P" .. tostring(g_GalleryInfo.ScenePage)
    local r5_501 = cclass.lua_Layers:create()
    for r9_501 = 1, g_GalleryInfo.ScenePageMax, 1 do
      r4_501 = "P" .. tostring(r9_501)
      if r9_501 == g_GalleryInfo.ScenePage then
        r0_501.SceneMenu.DataPage[r4_501]:bt_SetActive(1)
      else
        r0_501.SceneMenu.DataPage[r4_501]:bt_SetActive(0)
      end
    end
    local r6_501 = false
    for r10_501 = 1, r0_501.SceneMenu.ThAllMax, 1 do
      r4_501 = "TH" .. tostring(r10_501)
      local r11_501 = 50 + r10_501 - 1
      local r12_501 = r0_501:GetSceneFlag(r1_501, r10_501)
      if r12_501 == 1 then
        r0_501.SceneMenu.DataTh[r4_501]:bt_SetActive(0)
      end
      if r12_501 == 0 then
        r0_501.SceneMenu.DataTh[r4_501]:bt_SetActive(2)
      end
      if r12_501 == -1 then
        r0_501.SceneMenu.DataTh[r4_501]:bt_SetActive(3)
      end
      if false then
        local r13_501 = 116 - (r10_501 - 1) * 8
        local r14_501 = 115 - (r10_501 - 1) * 8
        if r12_501 == -1 then
          r5_501:setSubLayerVisible(r0_501.MenuInf.SetName, r0_501.SceneMenu.keyname, r13_501, 0)
          r5_501:setSubLayerVisible(r0_501.MenuInf.SetName, r0_501.SceneMenu.keyname, r14_501, 0)
        end
        if r12_501 == 0 then
          r5_501:setSubLayerVisible(r0_501.MenuInf.SetName, r0_501.SceneMenu.keyname, r13_501, 0)
          r5_501:setSubLayerVisible(r0_501.MenuInf.SetName, r0_501.SceneMenu.keyname, r14_501, 1)
        end
        if r12_501 == 1 then
          r5_501:setSubLayerVisible(r0_501.MenuInf.SetName, r0_501.SceneMenu.keyname, r13_501, 1)
          r5_501:setSubLayerVisible(r0_501.MenuInf.SetName, r0_501.SceneMenu.keyname, r14_501, 0)
        end
      end
    end
    r0_501:DeleteReplayThumbnail(r2_501)
    r0_501:LoadReplayThumbnail(r1_501)
  end
end
function GalleryBgmMenu(r0_502)
  -- line: [17623, 17888] id: 502
  r0_502.BgmMenu = {}
  r0_502.BgmMenu.BgmSoundList = {}
  r0_502.BgmMenu.DataPage = {}
  r0_502.BgmMenu.keyname = "GalleryBgm"
  r0_502.BgmMenu.FileName = "SYS_GalleryBGM.pna"
  r0_502.BgmMenu.BGM_SoundNo = 0
  r0_502.BgmMenu.BGM_Max = 32
  r0_502.BgmMenu.OnePageMax = 20
  function r0_502.SetBgmNo(r0_503, r1_503)
    -- line: [17640, 17642] id: 503
    r0_503.BgmMenu.BGM_SoundNo = r1_503
  end
  function r0_502.GetBgmNo(r0_504)
    -- line: [17644, 17646] id: 504
    return r0_504.BgmMenu.BGM_SoundNo
  end
  function r0_502.InitBgmButton(r0_505, r1_505)
    -- line: [17649, 17684] id: 505
    r0_505.BgmMenu.BgmSoundList = {}
    local r2_505 = 1
    for r6_505 = 1, g_GalleryInfo.BgmPageMax, 1 do
      for r10_505 = 1, r0_505.BgmMenu.OnePageMax, 1 do
        if r0_505.BgmMenu.BGM_Max < r2_505 then
          break
        else
          local r12_505 = 112 - r10_505 - 1 - (r6_505 - 1) * 22
          r0_505:MenuButtonSet(r0_505.BgmMenu.BgmSoundList, "S" .. tostring(r2_505), 1, r1_505, r12_505, r12_505, 74 - r10_505 - 1 - (r6_505 - 1) * 22, 36 - r10_505 - 1 - (r6_505 - 1) * 22, 150 - r10_505 - 1 - (r6_505 - 1) * 22, 300 + r2_505, 0, 0)
          r2_505 = r2_505 + 1
        end
      end
    end
    for r6_505 = 1, g_GalleryInfo.BgmPageMax, 1 do
      local r8_505 = 164 - r6_505 - 1
      r0_505:MenuButtonSet(r0_505.BgmMenu.DataPage, "SPage" .. tostring(r6_505), 1, r1_505, r8_505, r8_505, 156 - r6_505 - 1, 160 - r6_505 - 1, -1, 100 + r6_505, 0, 0)
    end
  end
  function r0_502.InitBgmMenu(r0_506)
    -- line: [17687, 17707] id: 506
    local r1_506 = cclass.lua_Layers:create()
    r0_506:MenuLoadLayer(r0_506.BgmMenu.keyname, r0_506.BgmMenu.FileName)
    r1_506:setVisible(r0_506.MenuInf.SetName, r0_506.BgmMenu.keyname, 1)
    r0_506:InitBgmButton(r0_506.BgmMenu.keyname)
    r0_506.MenuButton:SetList("BT_BgmSoundList", r0_506.BgmMenu.BgmSoundList)
    r0_506.MenuButton:SetList("BT_DataPage", r0_506.BgmMenu.DataPage)
    r0_506:MenuButtonInit()
    r1_506:initSubLayer(r0_506.MenuInf.SetName, r0_506.BgmMenu.keyname, 172, 1)
    r1_506:initSubLayer(r0_506.MenuInf.SetName, r0_506.BgmMenu.keyname, 173, 1)
    r0_506:BGMPageInit(g_GalleryInfo.BgmPage, g_GalleryInfo.BgmPage, true)
    return r0_506.BgmMenu.keyname
  end
  function r0_502.GallerySetBgmButton(r0_507, r1_507)
    -- line: [17709, 17732] id: 507
    if r0_507.BgmMenu.BGM_SoundNo ~= 0 then
    end
    r0_507.BT_DataBace.stop:bt_SetActive(0)
    local r2_507 = cclass.lua_Layers:create()
    local r3_507 = getEffectRate()
    r0_507.MenuInf.GalleryEff = true
    r0_507:GalleryBgmPlay(r1_507)
    r0_507:BGMPageInit(g_GalleryInfo.BgmPage, g_GalleryInfo.BgmPage, false)
  end
  function r0_502.GalleryBgmPlay(r0_508, r1_508)
    -- line: [17734, 17781] id: 508
    r0_508.BgmMenu.BGM_SoundNo = r1_508
    cfunc.LegacyGame__lua_SetVariable(120, r0_508.BgmMenu.BGM_SoundNo)
    local r2_508 = {
      [1] = "bgm36.ogg",
      [2] = "bgm01.ogg",
      [3] = "bgm06.ogg",
      [4] = "bgm05.ogg",
      [5] = "bgm08.ogg",
      [6] = "bgm09.ogg",
      [7] = "bgm03.ogg",
      [8] = "bgm07.ogg",
      [9] = "bgm04.ogg",
      [10] = "bgm10.ogg",
      [11] = "bgm11.ogg",
      [12] = "bgm12.ogg",
      [13] = "bgm23.ogg",
      [14] = "bgm13.ogg",
      [15] = "bgm22.ogg",
      [16] = "bgm14.ogg",
      [17] = "bgm15.ogg",
      [18] = "bgm16.ogg",
      [19] = "bgm17.ogg",
      [20] = "bgm18.ogg",
      [21] = "bgm19.ogg",
      [22] = "bgm21.ogg",
      [23] = "bgm20.ogg",
      [24] = "bgm02.ogg",
      [25] = "bgm25.ogg",
      [26] = "bgm26.ogg",
      [27] = "bgm28b.ogg",
      [28] = "bgm29.ogg",
      [29] = "bgm30.ogg",
      [30] = "bgm27.ogg",
      [31] = "bgm24c1.ogg",
      [32] = "bgm31.ogg",
    }
    local r3_508 = cclass.lua_Sounds:new()
    if getGameEngineVersion() == 1.4 then
      r3_508:BgmPlay("systembgm", getSoundArcFileName("BGM", ".ogg"), r2_508[r1_508], getSoundVolume("BGM"))
    else
      r3_508:BgmPlay("systembgm", getSoundArcFileName("BGM", ".ogg"), r2_508[r1_508], getSoundVolume("BGM"), 100)
    end
    r3_508:delete()
  end
  function r0_502.GalleryBgmStop(r0_509)
    -- line: [17784, 17804] id: 509
    if r0_509.BgmMenu.BGM_SoundNo > 0 then
      local r1_509 = cclass.lua_Sounds:new()
      r1_509:BgmStop("systembgm", 200)
      r1_509:delete()
      r0_509.BgmMenu.BGM_SoundNo = 0
      cfunc.LegacyGame__lua_SetVariable(120, r0_509.BgmMenu.BGM_SoundNo)
      if g_GalleryInfo.Page == 3 then
        r0_509:BGMPageInit(g_GalleryInfo.BgmPage, g_GalleryInfo.BgmPage, false)
      end
    end
  end
  function r0_502.GetBgmFlag(r0_510, r1_510, r2_510)
    -- line: [17807, 17832] id: 510
    local r3_510 = {
      BGM01 = 1050,
      BGM02 = 1051,
      BGM03 = 1052,
      BGM04 = 1053,
      BGM05 = 1054,
      BGM06 = 1055,
      BGM07 = 1056,
      BGM08 = 1057,
      BGM09 = 1058,
      BGM10 = 1059,
      BGM11 = 1060,
      BGM12 = 1061,
      BGM13 = 1062,
      BGM14 = 1063,
      BGM15 = 1064,
      BGM16 = 1065,
      BGM17 = 1066,
      BGM18 = 1067,
      BGM19 = 1068,
      BGM20 = 1069,
      BGM21 = 1070,
      BGM22 = 1071,
      BGM23 = 1072,
      BGM24 = 1073,
      BGM25 = 1074,
      BGM26 = 1075,
      BGM27 = 1076,
      BGM28 = 1077,
      BGM29 = 1078,
      BGM30 = 1079,
      BGM31 = 1080,
      BGM34 = 1081,
    }
    local r5_510 = ({
      {
        r3_510.BGM34,
        r3_510.BGM01,
        r3_510.BGM06,
        r3_510.BGM05,
        r3_510.BGM08,
        r3_510.BGM09,
        r3_510.BGM03,
        r3_510.BGM07,
        r3_510.BGM04,
        r3_510.BGM10,
        r3_510.BGM11,
        r3_510.BGM12,
        r3_510.BGM23,
        r3_510.BGM13,
        r3_510.BGM22,
        r3_510.BGM14,
        r3_510.BGM15,
        r3_510.BGM16,
        r3_510.BGM17,
        r3_510.BGM18
      },
      {
        r3_510.BGM19,
        r3_510.BGM21,
        r3_510.BGM20,
        r3_510.BGM02,
        r3_510.BGM25,
        r3_510.BGM26,
        r3_510.BGM28,
        r3_510.BGM29,
        r3_510.BGM30,
        r3_510.BGM27,
        r3_510.BGM24,
        r3_510.BGM31
      }
    })[r1_510][r2_510]
    if r5_510 == nil then
      return false
    end
    return cfunc.LegacyGame__lua_GetFlag(r5_510)
  end
  function r0_502.BGMPageInit(r0_511, r1_511, r2_511, r3_511)
    -- line: [17835, 17873] id: 511
    g_GalleryInfo.BgmPage = r1_511
    for r7_511 = 1, g_GalleryInfo.BgmPageMax, 1 do
      local r8_511 = "SPage" .. tostring(r7_511)
      if g_GalleryInfo.BgmPage == r7_511 then
        r0_511.BgmMenu.DataPage[r8_511]:bt_SetActive(1)
      else
        r0_511.BgmMenu.DataPage[r8_511]:bt_SetActive(0)
      end
    end
    local r4_511 = 1
    for r8_511 = 1, g_GalleryInfo.BgmPageMax, 1 do
      for r12_511 = 1, r0_511.BgmMenu.OnePageMax, 1 do
        if r0_511.BgmMenu.BGM_Max < r4_511 then
          break
        else
          local r13_511 = "S" .. tostring(r4_511)
          if g_GalleryInfo.BgmPage == r8_511 then
            if r0_511:GetBgmFlag(r8_511, r12_511) == true then
              if r0_511.BgmMenu.BGM_SoundNo == r4_511 then
                r0_511.BgmMenu.BgmSoundList[r13_511]:bt_SetActive(1)
              else
                r0_511.BgmMenu.BgmSoundList[r13_511]:bt_SetActive(0)
              end
            else
              r0_511.BgmMenu.BgmSoundList[r13_511]:bt_SetActive(2)
            end
          else
            r0_511.BgmMenu.BgmSoundList[r13_511]:bt_SetActive(3)
          end
          r4_511 = r4_511 + 1
        end
      end
    end
  end
  function r0_502.GalleryBgmButtonJob(r0_512, r1_512)
    -- line: [17876, 17885] id: 512
    if 301 <= r1_512 and r1_512 <= 390 then
      r0_512.MenuButton.selDownCursor = -1
      r0_512.MenuButton.selDownKey = nil
      r0_512:GallerySetBgmButton(r1_512 - 300)
    end
  end
end
function GalleryTipsMenu(r0_513)
  -- line: [17894, 18078] id: 513
  r0_513.TipsMenu = {}
  r0_513.TipsMenu.DataPage = {}
  r0_513.TipsMenu.keyname = "GalleryTips"
  r0_513.TipsMenu.FileName = "SYS_GalleryTips.pna"
  r0_513.TipsMenu.LayerName = "SYS_TipsThumbnail"
  r0_513.TipsMenu.ThFileName = "SYS_GalleryTHTips.pna"
  function r0_513.InitTipsButton(r0_514, r1_514)
    -- line: [17907, 17923] id: 514
    r0_514.TipsMenu.DataPage = {}
    for r5_514 = 1, g_GalleryInfo.TipsPageMax, 1 do
      local r7_514 = 14 + r5_514 - 1
      r0_514:MenuButtonSet(r0_514.TipsMenu.DataPage, "P" .. tostring(r5_514), 1, r1_514, r7_514, r7_514, 26 + r5_514 - 1, 38 + r5_514 - 1, -1, 100 + r5_514, 0, 0)
    end
  end
  function r0_513.TipsMouseMove(r0_515, r1_515, r2_515, r3_515, r4_515, r5_515, r6_515)
    -- line: [17926, 17928] id: 515
  end
  function r0_513.DeleteTipsThumbnail(r0_516, r1_516)
    -- line: [17931, 17934] id: 516
    cclass.lua_Layers:create():removeLayer(r0_516.MenuInf.SetName, r0_516.TipsMenu.LayerName)
  end
  function r0_513.LoadTipsThumbnail(r0_517, r1_517)
    -- line: [17938, 17957] id: 517
    r0_517:MenuLoadLayer(r0_517.TipsMenu.LayerName, r0_517.TipsMenu.ThFileName)
    local r2_517 = 1
    local r3_517 = cclass.lua_Layers:create()
    for r7_517 = 1, 3, 1 do
      for r11_517 = 1, 3, 1 do
        local r12_517 = r0_517:GetTipsThumbnailEnable(r1_517, r2_517)
        local r13_517 = r0_517:GetTipsFlag(r1_517, r2_517)
        local r14_517 = (r1_517 - 1) * 9 + r2_517 - 1 + 0
        if r12_517 == true and r13_517 == true then
          r3_517:initSubLayer(r0_517.MenuInf.SetName, r0_517.TipsMenu.LayerName, r14_517, 1)
        end
        r2_517 = r2_517 + 1
      end
    end
  end
  function r0_513.InitTipsMenu(r0_518)
    -- line: [17960, 17983] id: 518
    local r1_518 = cclass.lua_Layers:create()
    r0_518:MenuLoadLayer(r0_518.TipsMenu.keyname, r0_518.TipsMenu.FileName)
    r1_518:setVisible(r0_518.MenuInf.SetName, r0_518.TipsMenu.keyname, 1)
    r0_518:InitTipsButton(r0_518.TipsMenu.keyname)
    r0_518.MenuButton:SetList("BT_DataPage", r0_518.TipsMenu.DataPage)
    r0_518:MenuButtonInit()
    r1_518:initSubLayer(r0_518.MenuInf.SetName, r0_518.TipsMenu.keyname, 51, 1)
    for r5_518 = 1, 9, 1 do
      local r6_518 = 2 + r5_518 - 1
      r1_518:initSubLayer(r0_518.MenuInf.SetName, r0_518.TipsMenu.keyname, r6_518, 1)
      r1_518:setSubLayerVisible(r0_518.MenuInf.SetName, r0_518.TipsMenu.keyname, r6_518, 1)
    end
    r0_518:TipsPageInit(g_GalleryInfo.TipsPage, g_GalleryInfo.TipsPage, true)
    return r0_518.TipsMenu.keyname
  end
  function r0_513.DeleteTipsMenu(r0_519)
    -- line: [17987, 17991] id: 519
    cclass.lua_Layers:create():removeLayer(r0_519.MenuInf.SetName, r0_519.TipsMenu.keyname)
    r0_519:DeleteTipsThumbnail(g_GalleryInfo.TipsPage)
  end
  function r0_513.TipsThumbnailEffect(r0_520, r1_520, r2_520, r3_520, r4_520, r5_520)
    -- line: [17994, 18016] id: 520
    local r6_520 = cclass.lua_Layers:create()
    if r5_520 == false then
      r6_520:setParam(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, LUA_PARAM_POS, -r2_520, 0, 0, 0)
      r6_520:setParam(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, LUA_PARAM_ROTATE, -r4_520, 0, 0, 0)
      r6_520:setEffect(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_520, 0, 0, 0, 0, r3_520, 0, 0)
      r6_520:setEffect(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, "GalleryPageEff", LUA_EFFECT_ROTATE, r4_520, 0, 0, 0, 0, r3_520, 0, 0)
      r6_520:startEffect(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, "GalleryPageEff", 0)
    else
      r6_520:setParam(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, LUA_PARAM_POS, 0, 0, 0, 0)
      r6_520:setParam(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, LUA_PARAM_ROTATE, 0, 0, 0, 0)
      r6_520:setEffect(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_520, 0, 0, 0, 0, r3_520, 0, 0)
      r6_520:setEffect(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, "GalleryPageEff", LUA_EFFECT_ROTATE, r4_520, 0, 0, 0, 0, r3_520, 0, 0)
      r6_520:startEffect(r0_520.MenuInf.SetName, r0_520.TipsMenu.LayerName, "GalleryPageEff", 0)
    end
  end
  function r0_513.GetTipsThumbnailEnable(r0_521, r1_521, r2_521)
    -- line: [18019, 18029] id: 521
    if g_GalleryInfo.TipsPageMax < r1_521 then
      return false
    end
    if r1_521 == g_GalleryInfo.TipsPageMax and g_GalleryInfo.TipsThMax < r2_521 then
      return false
    end
    return true
  end
  function r0_513.GetTipsFlag(r0_522, r1_522, r2_522)
    -- line: [18032, 18037] id: 522
    return cfunc.LegacyGame__lua_GetFlag(1100 + (r1_522 - 1) * 9 + r2_522 - 1)
  end
  function r0_513.TipsPageInit(r0_523, r1_523, r2_523, r3_523)
    -- line: [18039, 18066] id: 523
    g_GalleryInfo.TipsPage = r1_523
    local r4_523 = cclass.lua_Layers:create()
    for r8_523 = 1, g_GalleryInfo.TipsPageMax, 1 do
      local r9_523 = "P" .. tostring(g_GalleryInfo.TipsPage)
      for r13_523, r14_523 in pairs(r0_523.TipsMenu.DataPage) do
        if r14_523.arg == r9_523 then
          r14_523:bt_SetActive(1)
        else
          r14_523:bt_SetActive(0)
        end
      end
    end
    for r8_523 = 1, 9, 1 do
      local r9_523 = r0_523:GetTipsThumbnailEnable(r1_523, r8_523)
      if r9_523 then
        r9_523 = 1 or 0
      else
        goto label_48	-- block#10 is visited secondly
      end
      r4_523:setSubLayerVisible(r0_523.MenuInf.SetName, r0_523.TipsMenu.keyname, 2 + r8_523 - 1, r9_523)
    end
    r0_523:DeleteTipsThumbnail(r2_523)
    r0_523:LoadTipsThumbnail(r1_523)
  end
  function r0_513.GalleryTipsButtonJob(r0_524, r1_524)
    -- line: [18069, 18075] id: 524
    if 401 <= r1_524 and r1_524 <= 430 then
      local r2_524 = r1_524 - 400
      r0_524.MenuButton.selDownCursor = -1
      r0_524.MenuButton.selDownKey = nil
    end
  end
end
function GalleryNmsMenu(r0_525)
  -- line: [18082, 19873] id: 525
  r0_525.NmsMenu = {}
  r0_525.NmsMenu.keyname = "NmsBace"
  r0_525.NmsMenu.FileName = "sys_nms.pna"
  r0_525.NmsMenu.ThumbOnNo = -1
  r0_525.NmsMenu.ExpTextNo = 0
  r0_525.NmsMenu.SlideFlag = 0
  r0_525.NmsMenu.ExpLayerTop = 221
  r0_525.NmsMenu.ExpLayerEnd = 242
  r0_525.NmsMenu.BarMoveNo = -1
  r0_525.NmsMenu.StandbyDragFlag = false
  r0_525.NmsMenu.StandbyDragParam = {}
  r0_525.NmsMenu.ENTRY_MAX = 150
  r0_525.NmsMenu.DropRepeatArg = 0
  r0_525.NmsMenu.DropRepeatTime = 0
  r0_525.NmsMenu.TH_PosLayer = 17
  r0_525.NmsSubKey = {}
  r0_525.NmsSubKey.NmsThTitle = "NmsThTitle"
  r0_525.NmsSubKey.NmsTitle = "NmsTitle"
  r0_525.NmsSubKey.NmsNo = "NmsNo"
  r0_525.NmsSubKey.NmsThumb = "NmsThumb"
  r0_525.NmsSubKey.NmsListTh = "NmsListTh"
  r0_525.NmsSubKey.NmsIconTh = "NmsIconTh"
  r0_525.NmsMenu.NmsButton = {}
  r0_525.NmsMenu.NmsEntry = {}
  r0_525.NmsMenu.NmsDrop = {}
  function r0_525.NmsMenuInitParam(r0_526)
    -- line: [18128, 18131] id: 526
    g_NmsData.THP_Slide = 0
    g_NmsData.THP_Param = 0
  end
  function r0_525.InitNmsMenu(r0_527)
    -- line: [18139, 18329] id: 527
    NmsSLMenuInitSaveData()
    g_NmsData.OneInit = true
    NmsMenuLoadBookMark()
    local r1_527 = cclass.lua_Layers:create()
    r0_527:MenuLoadLayer(r0_527.NmsMenu.keyname, r0_527.NmsMenu.FileName)
    r0_527:MenuLoadLayer(r0_527.NmsSubKey.NmsThTitle, "sys_nms_scn.pna")
    r0_527:MenuLoadLayer(r0_527.NmsSubKey.NmsTitle, "sys_nms_scn.pna")
    r0_527:MenuLoadLayer(r0_527.NmsSubKey.NmsNo, "sys_nms_no.pna")
    r0_527:MenuLoadLayer(r0_527.NmsSubKey.NmsThumb, "sys_nms_th.pna")
    r0_527:MenuLoadLayer(r0_527.NmsSubKey.NmsListTh, "sys_nms_th.pna")
    r0_527:MenuLoadLayer(r0_527.NmsSubKey.NmsIconTh, "sys_nms_ic.pna")
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 103, 1)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 105, 1)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 171, 1)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 173, 0)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 213, 1)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 215, 1)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 216, 1)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 244, 1)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 207, 0)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 208, 0)
    r1_527:initSubLayer(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 209, 0)
    local r2_527 = 0
    local r3_527 = 0
    local r4_527 = 0
    local r5_527 = 0
    r2_527, r3_527, r4_527, r5_527 = r1_527:getSubLayerParam(r0_527.MenuInf.SetName, r0_527.NmsMenu.keyname, 213, LUA_PARAM_POS, r2_527, r3_527, r4_527, r5_527)
    r1_527:setParam(r0_527.MenuInf.SetName, r0_527.NmsSubKey.NmsListTh, LUA_PARAM_POS, r2_527, r3_527, r4_527, r5_527)
    r0_527.NmsMenu.NmsButton = {}
    local r6_527 = r0_527.NmsMenu.NmsButton
    r0_527:MakeYSlideBar(r6_527, "SL_Bar1", 1, r0_527.NmsMenu.keyname, 98, 99, 200, 0, 0)
    r0_527:MenuButtonSet(r6_527, "SL_BarBk1", 1, r0_527.NmsMenu.keyname, 101, -1, -1, -1, -1, 201, 0, -1)
    r0_527.NmsMenu.NmsButton.SL_BarBk1.se_click = -1
    r0_527:MenuButtonSet(r6_527, "SL_Bar1Up", 1, r0_527.NmsMenu.keyname, 93, 93, 89, -1, 85, 202, 0, 0)
    r0_527:MenuButtonSet(r6_527, "SL_Bar1Do", 1, r0_527.NmsMenu.keyname, 94, 94, 90, -1, 86, 203, 0, 0)
    r0_527:MakeYSlideBar(r6_527, "SL_Bar2", 1, r0_527.NmsMenu.keyname, 166, 167, 210, 0, 0)
    r0_527:MenuButtonSet(r6_527, "SL_BarBk2", 1, r0_527.NmsMenu.keyname, 169, -1, -1, -1, -1, 211, 0, -1)
    r0_527.NmsMenu.NmsButton.SL_BarBk2.se_click = -1
    r0_527:MenuButtonSet(r6_527, "SL_Bar2Up", 1, r0_527.NmsMenu.keyname, 161, 161, 157, -1, 153, 212, 0, 0)
    r0_527:MenuButtonSet(r6_527, "SL_Bar2Do", 1, r0_527.NmsMenu.keyname, 162, 162, 158, -1, 154, 213, 0, 0)
    r0_527:MenuButtonSet(r6_527, "TH_Reset", 1, r0_527.NmsMenu.keyname, 33, 33, 28, -1, 23, 110, 0, 0)
    r0_527:MenuButtonSet(r6_527, "TH_AllSet", 1, r0_527.NmsMenu.keyname, 32, 32, 27, -1, 22, 111, 0, 0)
    r0_527:MenuButtonSet(r6_527, "TH_Entry", 1, r0_527.NmsMenu.keyname, 31, 31, 26, -1, 21, 112, 0, 0)
    r0_527:MenuButtonSet(r6_527, "TH_AllPlay", 1, r0_527.NmsMenu.keyname, 2, 2, 3, -1, 4, 120, 0, 0)
    for r10_527 = 1, 9, 1 do
      local r12_527 = 79 - r10_527 - 1
      local r14_527 = 57 - r10_527 - 1
      r0_527:MenuButtonSet(r6_527, "TH_" .. tostring(r10_527), 1, r0_527.NmsMenu.keyname, r12_527, r12_527, 68 - r10_527 - 1, -1, 46 - r10_527 - 1, 700 + r10_527 - 1, 0, -1)
      r12_527 = 48 - r10_527 - 1
      r0_527:MenuButtonSet(r6_527, "TH_" .. tostring(r10_527) .. "play", 1, r0_527.NmsSubKey.NmsIconTh, r12_527, r12_527, 37 - r10_527 - 1, -1, -1, 800 + r10_527 - 1, 0, 1)
      r12_527 = 83 - r10_527 - 1
      r0_527:MenuButtonSet(r6_527, "TH_" .. tostring(r10_527) .. "bmk", 1, r0_527.NmsSubKey.NmsIconTh, r12_527, r12_527, 72 - r10_527 - 1, 61 - r10_527 - 1, -1, 900 + r10_527 - 1, 0, 1)
    end
    r0_527:MenuButtonSet(r6_527, "EN_Load", 1, r0_527.NmsMenu.keyname, 198, 198, 191, -1, 184, 170, 0, 0)
    r0_527:MenuButtonSet(r6_527, "EN_Save", 1, r0_527.NmsMenu.keyname, 199, 199, 192, -1, 185, 171, 0, 0)
    r0_527:MenuButtonSet(r6_527, "EN_Reset", 1, r0_527.NmsMenu.keyname, 200, 200, 193, -1, 186, 172, 0, 0)
    r0_527:MenuButtonSet(r6_527, "EN_PlayTT", 1, r0_527.NmsMenu.keyname, 201, 201, 194, -1, 187, 180, 0, 0)
    r0_527:MenuButtonSet(r6_527, "EN_PlayTW", 1, r0_527.NmsMenu.keyname, 202, 202, 195, -1, 188, 181, 0, 0)
    r0_527:MenuButtonSet(r6_527, "EN_bmk", 1, r0_527.NmsSubKey.NmsIconTh, 90, 90, 89, 88, -1, 190, 0, 1)
    r0_527.NmsMenu.NmsEntry = {}
    local r7_527 = r0_527.NmsMenu.NmsEntry
    for r11_527 = 0, 9, 1 do
      local r13_527 = 147 - r11_527
      r0_527:MenuButtonSet(r7_527, "EN_List" .. tostring(r11_527), 1, r0_527.NmsMenu.keyname, r13_527, r13_527, 135 - r11_527, 123 - r11_527, -1, 130 + r11_527, 150 + r11_527, 0)
    end
    r0_527.NmsMenu.NmsDrop = {}
    local r8_527 = r0_527.NmsMenu.NmsDrop
    r0_527:MenuButtonSet(r8_527, "EntryDrop", 1, r0_527.NmsMenu.keyname, 109, -1, 108, -1, -1, 500, 0, -1)
    r0_527:MenuButtonSet(r8_527, "DropListUp", 1, r0_527.NmsSubKey.NmsIconTh, 94, -1, 94, -1, -1, 501, 0, 0)
    r0_527:MenuButtonSet(r8_527, "DropListDown", 1, r0_527.NmsSubKey.NmsIconTh, 95, -1, 95, -1, -1, 502, 0, 0)
    for r12_527 = 0, 10, 1 do
      r0_527:MenuButtonSet(r8_527, "DropBetween" .. tostring(r12_527), 1, r0_527.NmsSubKey.NmsIconTh, 24 - r12_527, -1, 11 - r12_527, -1, -1, 400 + r12_527, 0, 0)
    end
    r0_527.MenuButton:SetList("BT_NmsButton", r6_527)
    r0_527.MenuButton:SetList("BT_NmsEntry", r7_527)
    r0_527.MenuButton:SetDropList("BT_NmsDrop", r8_527)
    r0_527:MenuButtonInit()
    r0_527:InitExpTextSur()
    r0_527:StartSetParam()
    r0_527:InitEntryTextSur()
    r0_527:InitNumEntryTextSur()
    r0_527.NmsMenu.NmsButton.SL_Bar1:bt_SlidebarYInit(g_NmsData.THP_Param, 3, 20, 101, 102)
    r0_527.NmsMenu.NmsButton.SL_Bar2:bt_SlidebarYInit(g_NmsData.Param, 10, 20, 169, 170)
    r0_527:SetthumbBarParam(g_NmsData.THP_Slide, g_NmsData.THP_Param)
    r0_527:InitEntryList()
    r0_527:SetEntryText()
    r0_527:SetNumEntryTextSur()
    r0_527:SetThumb()
    r0_527:ThumbOn(-1)
    return r0_527.NmsMenu.keyname
  end
  function r0_525.DeleteNmsMenu(r0_528)
    -- line: [18333, 18352] id: 528
    local r1_528 = cclass.lua_Layers:create()
    r1_528:removeLayer(r0_528.MenuInf.SetName, r0_528.NmsMenu.keyname)
    for r5_528, r6_528 in pairs(r0_528.NmsSubKey) do
      r1_528:removeLayer(r0_528.MenuInf.SetName, r6_528)
    end
    for r5_528 = 0, 9, 1 do
      r1_528:removeLayer(r0_528.MenuInf.SetName, r0_528.NmsSubKey.NmsTitle .. tostring(r5_528))
    end
    for r5_528 = 1, 3, 1 do
      r1_528:removeLayer(r0_528.MenuInf.SetName, r0_528.NmsSubKey.NmsNo .. tostring(r5_528))
    end
  end
  function r0_525.NmsButtonJob(r0_529, r1_529, r2_529, r3_529, r4_529)
    -- line: [18361, 18681] id: 529
    if r1_529 ~= 0 and r2_529 == "LD" then
      if 700 <= r1_529 and r1_529 <= 709 then
        r0_529:StandbyDrag(r1_529 - 700 + 1, false, r3_529, r4_529)
      end
      if 800 <= r1_529 and r1_529 <= 809 then
        local r5_529 = r1_529 - 800 + 1
      end
      if 900 <= r1_529 and r1_529 <= 909 then
        local r5_529 = r1_529 - 900 + 1
      end
      if 130 <= r1_529 and r1_529 <= 139 and 2 <= g_NmsData.Param then
        r0_529:StandbyDrag(r1_529 - 130 + 1 + g_NmsData.Slide, true, r3_529, r4_529)
      end
      if r1_529 == 200 then
        r0_529.NmsMenu.BarMoveNo = 1
      end
      if r1_529 == 210 then
        r0_529.NmsMenu.BarMoveNo = 2
      end
    end
    if r2_529 == "LU" then
      if r0_529.NmsMenu.BarMoveNo == 1 then
        local r5_529 = r0_529.NmsMenu.NmsButton.SL_Bar1
        r5_529:bt_SetParamY(r5_529:bt_GetParamY())
        r0_529.NmsMenu.BarMoveNo = -1
        r0_529:SetThumb()
      end
      if r0_529.NmsMenu.BarMoveNo == 2 then
        local r5_529 = r0_529.NmsMenu.NmsButton.SL_Bar2
        r5_529:bt_SetParamY(r5_529:bt_GetParamY())
        r0_529.NmsMenu.BarMoveNo = -1
      end
      local r5_529 = 0
      if r0_529.MenuButton.selCursor ~= -1 then
        r5_529 = r0_529.MenuButton.selListKey[r0_529.MenuButton.selCursor].bt_l
      end
      r0_529:ThumbDragEnd(r5_529, r3_529, r4_529)
    end
    if r1_529 ~= 0 and r2_529 == "LU" then
      if nil and not nil then
        goto label_109	-- block#30 is visited secondly
      end
      if 130 <= r1_529 and r1_529 <= 139 then
        g_NmsData.Act = r1_529 - 130 + 1 + g_NmsData.Slide
        r0_529:SetEntryBarParam(r0_529.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY(), g_NmsData.Param)
        r0_529:EntryTh(-1)
      end
      if r1_529 == 201 then
        local r5_529 = r0_529.NmsMenu.NmsButton.SL_BarBk1.EVENT_RECT.h / (g_NmsData.THP_Param + 1 - r0_529.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PSIZE_Y)
        local r6_529 = r4_529 - r0_529.NmsMenu.NmsButton.SL_BarBk1.DRAW_POS.y
        if r6_529 < 0 then
          r6_529 = 0
        end
        r0_529:SetthumbBarParam(math.floor(r6_529 / r5_529), g_NmsData.THP_Param)
        r0_529:SetThumb()
      end
      if r1_529 == 202 then
        r0_529:SetthumbBarParam(r0_529.NmsMenu.NmsButton.SL_Bar1:bt_GetParamY() - 1, g_NmsData.THP_Param)
        r0_529:SetThumb()
      end
      if r1_529 == 203 then
        r0_529:SetthumbBarParam(r0_529.NmsMenu.NmsButton.SL_Bar1:bt_GetParamY() + 1, g_NmsData.THP_Param)
        r0_529:SetThumb()
      end
      if r1_529 == 211 then
        local r5_529 = r0_529.NmsMenu.NmsButton.SL_BarBk2.EVENT_RECT.h / (g_NmsData.Param + 1 - r0_529.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PSIZE_Y)
        local r6_529 = r4_529 - r0_529.NmsMenu.NmsButton.SL_BarBk2.DRAW_POS.y
        if r6_529 < 0 then
          r6_529 = 0
        end
        local r7_529 = math.floor(r6_529 / r5_529)
        r0_529.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(r7_529)
        r0_529:SetEntryBarParam(r7_529, g_NmsData.Param)
      end
      if r1_529 == 212 then
        local r5_529 = r0_529.NmsMenu.NmsButton.SL_Bar2
        local r6_529 = r5_529:bt_GetParamY() - 1
        r5_529:bt_SetParamY(r6_529)
        r0_529:SetEntryBarParam(r6_529, g_NmsData.Param)
      end
      if r1_529 == 213 then
        local r5_529 = r0_529.NmsMenu.NmsButton.SL_Bar2
        local r6_529 = r5_529:bt_GetParamY() + 1
        r5_529:bt_SetParamY(r6_529)
        r0_529:SetEntryBarParam(r6_529, g_NmsData.Param)
      end
      if r1_529 == 110 then
        NmsMenuSetBookMarkAll(0)
        r0_529:EntryTh(-1)
        r0_529:SetThumb()
      end
      if r1_529 == 111 then
        NmsMenuSetBookMarkAll(1)
        r0_529:EntryTh(-1)
        r0_529:SetThumb()
      end
      if r1_529 == 112 then
        for r8_529 = 1, #g_NmsData.THP_List, 1 do
          if g_NmsData.THP_ListEnable[r8_529] == true then
            local r9_529 = g_NmsData.THP_List[r8_529] + 1
            if g_NmsData.THP_BookMark[r9_529] == 1 then
              local r10_529 = g_NmsData.Act
              if r10_529 == -1 then
                r10_529 = 0
              end
              if r0_529:AddEntryList(r10_529 + 1, r9_529 - 1) == false then
                break
              end
            end
          end
        end
      end
      if r1_529 == 120 then
        g_NmsPlay.Slide = 0
        g_NmsPlay.List = {}
        g_NmsPlay.Act = 1
        g_NmsPlay.Param = 0
        for r8_529 = 1, #g_NmsData.THP_List, 1 do
          if g_NmsData.THP_ListEnable[r8_529] == true then
            g_NmsPlay.Param = g_NmsPlay.Param + 1
            g_NmsPlay.List[g_NmsPlay.Param] = g_NmsData.THP_List[r8_529]
          end
        end
        r0_529:endMenu(1000, 1)
      end
      if r1_529 == 170 then
        r0_529:endMenu(-10, 1)
      end
      if r1_529 == 171 then
        r0_529:endMenu(-20, 1)
      end
      if r1_529 == 172 then
        NmsMenuInitENP()
        r0_529:InitEntryList()
      end
      if r1_529 == 180 then
        g_NmsPlay.Slide = 0
        g_NmsPlay.List = g_NmsData.List
        g_NmsPlay.Act = 1
        g_NmsPlay.Param = g_NmsData.Param
        r0_529:endMenu(2000, 1)
      end
      if r1_529 == 181 then
        g_NmsPlay.Slide = g_NmsData.Slide
        g_NmsPlay.List = g_NmsData.List
        g_NmsPlay.Act = g_NmsData.Act
        g_NmsPlay.Param = g_NmsData.Param
        r0_529:endMenu(3000, g_NmsData.Act)
      end
      if r1_529 == 190 then
        local r5_529 = g_NmsData.List[g_NmsData.Act] + 1
        if g_NmsData.THP_BookMark[r5_529] == 0 then
          g_NmsData.THP_BookMark[r5_529] = 1
        else
          g_NmsData.THP_BookMark[r5_529] = 0
        end
        NmsMenuSaveBookMark()
        r0_529:EntryTh(-1)
        r0_529:SetThumb()
        r0_529.NmsMenu.ExpTextNo = 0
      end
      if 800 <= r1_529 and r1_529 <= 808 then
        local r5_529 = r1_529 - 800 + g_NmsData.THP_Slide * 3 + 1
        g_NmsPlay.Slide = 0
        g_NmsPlay.List = {}
        g_NmsPlay.List[1] = g_NmsData.THP_List[r5_529]
        g_NmsPlay.Act = 1
        g_NmsPlay.Param = 1
        r0_529:endMenu(g_NmsData.THP_List[r5_529], 1)
      end
      if 900 <= r1_529 and r1_529 <= 908 then
        local r6_529 = g_NmsData.THP_List[r1_529 - 900 + g_NmsData.THP_Slide * 3 + 1] + 1
        if g_NmsData.THP_BookMark[r6_529] == 0 then
          g_NmsData.THP_BookMark[r6_529] = 1
        else
          g_NmsData.THP_BookMark[r6_529] = 0
        end
        NmsMenuSaveBookMark()
        r0_529:EntryTh(-1)
        r0_529:SetThumb()
        r0_529.NmsMenu.ExpTextNo = 0
      end
      if r1_529 == 999 then
        r0_529:endMenu(-1, -1)
      end
      if r1_529 == 1000 then
      end
    end
    if r2_529 == "RU" then
      r0_529:DelEntryList(r1_529 - 150 + 1 + g_NmsData.Slide)
      local r7_529 = cclass.lua_Layers:create():getCursorPos(r0_529.MenuInf.SetName, r3_529, r4_529, 0) - 1
      r0_529.MenuButton:changeButton(r0_529.MenuInf.SetName, r7_529, r3_529, r4_529)
      r0_529:SetEntryBarParam(r0_529.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY(), g_NmsData.Param)
      r0_529:SetThumbTitle()
      r0_529:defaultMenuMouseMove(r0_529.MenuInf.SetName, -1, r7_529, r3_529, r4_529, false)
      local r10_529 = -1
      for r14_529 = 0, 9, 1 do
        if r0_529.MenuButton.selCursor == "EN_List" .. tostring(r14_529) then
          r10_529 = r14_529
          break
        end
      end
      r0_529:EntryTh(r10_529)
    end
  end
  function r0_525.InitExpTextSur(r0_530)
    -- line: [18686, 18693] id: 530
    local r1_530 = cclass.lua_Layers:create()
    for r5_530 = r0_530.NmsMenu.ExpLayerTop, r0_530.NmsMenu.ExpLayerEnd, 1 do
      r1_530:initSubLayer(r0_530.MenuInf.SetName, r0_530.NmsMenu.keyname, r5_530, 0)
    end
  end
  function r0_525.InitEntryTextSur(r0_531)
    -- line: [18697, 18703] id: 531
    local r1_531 = cclass.lua_Layers:create()
    for r5_531 = 0, g_NmsData.MAX_THUMB - 1, 1 do
      r1_531:initSubLayer(r0_531.MenuInf.SetName, r0_531.NmsSubKey.NmsTitle, r5_531, 0)
    end
  end
  function r0_525.SetEntryText(r0_532)
    -- line: [18706, 18731] id: 532
    local r1_532 = cclass.lua_Layers:create()
    local r2_532 = ""
    local r3_532 = g_NmsData.Param
    for r7_532 = 0, 9, 1 do
      local r8_532 = "EN_List" .. tostring(r7_532)
      local r9_532 = r0_532.NmsSubKey.NmsTitle .. tostring(r7_532)
      r1_532:removeLayer(r0_532.MenuInf.SetName, r9_532)
      if r0_532.NmsMenu.NmsEntry[r8_532].active == 0 or r0_532.NmsMenu.NmsEntry[r8_532].active == 4 then
        local r11_532 = r0_532.NmsMenu.NmsEntry[r8_532].DRAW_POS.x
        local r12_532 = r0_532.NmsMenu.NmsEntry[r8_532].DRAW_POS.y
        r1_532:insertPNARefLayer(r0_532.MenuInf.SetName, r9_532, r0_532.NmsSubKey.NmsTitle, g_NmsData.MAX_THUMB - g_NmsData.List[r7_532 + g_NmsData.Slide + 1] + 1, 1)
        r1_532:setParam(r0_532.MenuInf.SetName, r9_532, LUA_PARAM_POS, r11_532, r12_532, 0, 0)
        if r0_532.DD_Param.no ~= -1 then
          r1_532:swapLayerOrder(r0_532.MenuInf.SetName, "NmsDragTh", r9_532)
        end
      end
    end
  end
  function r0_525.InitNumEntryTextSur(r0_533)
    -- line: [18735, 18742] id: 533
    local r1_533 = cclass.lua_Layers:create()
    for r5_533 = 0, 9, 1 do
      r1_533:initSubLayer(r0_533.MenuInf.SetName, r0_533.NmsSubKey.NmsNo, r5_533, 0)
    end
  end
  function r0_525.SetNumEntryTextSur(r0_534)
    -- line: [18745, 18769] id: 534
    local r1_534 = cclass.lua_Layers:create()
    local r2_534 = {
      [1] = g_NmsData.Param % 10,
      [2] = math.floor(g_NmsData.Param / 10) % 10,
      [3] = math.floor(g_NmsData.Param / 100),
    }
    for r6_534 = 1, 3, 1 do
      local r8_534 = 0
      local r9_534 = 0
      r8_534, r9_534, r10_534, r11_534 = r1_534:getSubLayerParam(r0_534.MenuInf.SetName, r0_534.NmsMenu.keyname, 207 + r6_534 - 1, LUA_PARAM_POS, r8_534, r9_534, 0, 0)
      local r12_534 = r0_534.NmsSubKey.NmsNo .. tostring(r6_534)
      r1_534:removeLayer(r0_534.MenuInf.SetName, r12_534)
      r1_534:insertPNARefLayer(r0_534.MenuInf.SetName, r12_534, r0_534.NmsSubKey.NmsNo, r2_534[r6_534], 1)
      r1_534:setParam(r0_534.MenuInf.SetName, r12_534, LUA_PARAM_POS, r8_534, r9_534, 0, 0)
    end
  end
  function r0_525.NmsMouseMove(r0_535, r1_535, r2_535, r3_535, r4_535, r5_535, r6_535)
    -- line: [18773, 18971] id: 535
    if r0_535.NmsMenu.StandbyDragFlag == true then
      r0_535:ThumbDragStart(r0_535.NmsMenu.StandbyDragParam.no, r0_535.NmsMenu.StandbyDragParam.move, r0_535.NmsMenu.StandbyDragParam.x, r0_535.NmsMenu.StandbyDragParam.y)
    end
    if r0_535.MenuButton.selDownCursor ~= -1 then
      r0_535:ThumbDragOn(r4_535, r5_535)
    end
    local r7_535 = 0
    local r8_535 = 0
    local r9_535 = -1
    if r0_535.MenuButton.selCursor ~= -1 then
      r9_535 = r0_535.MenuButton.selListKey[r0_535.MenuButton.selCursor]
      r8_535 = r9_535.arg
      r7_535 = r9_535.bt_l
    end
    if r8_535 ~= r0_535.NmsMenu.ExpTextNo or r0_535.NmsMenu.SlideFlag ~= 0 then
      local r10_535 = cclass.lua_Layers:create()
      if r0_535.NmsMenu.SlideFlag ~= 0 then
      end
      r0_535.NmsMenu.SlideFlag = 0
      r0_535.NmsMenu.ExpTextNo = r8_535
      local r11_535 = -1
      if r8_535 == "SL_Bar1" then
        r0_535.NmsMenu.SlideFlag = 1
        r0_535:SetthumbBarParam(r0_535.NmsMenu.NmsButton.SL_Bar1:bt_GetParamY(), g_NmsData.THP_Param)
        r0_535:SetThumb()
        r11_535 = 0
      end
      if r8_535 == "SL_Bar2" then
        r0_535.NmsMenu.SlideFlag = 2
        r0_535:SetEntryBarParam(r0_535.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY(), g_NmsData.Param)
        r11_535 = 1
      end
      if r8_535 == "SL_Bar1Up" then
        r11_535 = 0
      end
      if r8_535 == "SL_Bar1Do" then
        r11_535 = 0
      end
      if r8_535 == "SL_Bar2Up" then
        r11_535 = 1
      end
      if r8_535 == "SL_Bar2Do" then
        r11_535 = 1
      end
      if r8_535 == "TH_Reset" then
        r11_535 = 3
      end
      if r8_535 == "TH_AllSet" then
        r11_535 = 4
      end
      if r8_535 == "TH_Entry" then
        r11_535 = 5
      end
      if r8_535 == "TH_AllPlay" then
        r11_535 = 6
      end
      if r8_535 == "EN_Load" then
        r11_535 = 7
      end
      if r8_535 == "EN_Save" then
        r11_535 = 8
      end
      if r8_535 == "EN_Reset" then
        r11_535 = 9
      end
      if r8_535 == "EN_PlayTT" then
        r11_535 = 10
      end
      if r8_535 == "EN_PlayTW" then
        r11_535 = 11
      end
      if r8_535 == "EN_bmk" then
        if g_NmsData.THP_BookMark[g_NmsData.List[g_NmsData.Act] + 1] == 0 then
          r11_535 = 12
        else
          r11_535 = 13
        end
      end
      local r12_535 = -1
      local r18_535 = nil	-- notice: implicit variable refs by block#[68]
      for r16_535 = 1, 9, 1 do
        r18_535 = tostring(r16_535)
        if r8_535 == "TH_" .. r18_535 then
          r18_535 = g_NmsData.Param
          if r0_535.NmsMenu.ENTRY_MAX <= r18_535 then
            r11_535 = 14
          else
            r11_535 = 15
          end
          r12_535 = r16_535
          break
        else
          r18_535 = "TH_"
          if r8_535 == r18_535 .. tostring(r16_535) .. "play" then
            r11_535 = 16
            r12_535 = r16_535
            break
          else
            r18_535 = "TH_"
            if r8_535 == r18_535 .. tostring(r16_535) .. "bmk" then
              r18_535 = g_NmsData.THP_Slide * 3 + r16_535
              if g_NmsData.THP_BookMark[g_NmsData.THP_List[r18_535] + 1] == 0 then
                r11_535 = 12
              else
                r11_535 = 13
              end
              r12_535 = r16_535
              break
            end
          end
        end
      end
      r0_535.NmsMenu.ThumbOnNo = r12_535
      r0_535:ThumbOn(r12_535)
      r0_535:SetThumbTitle()
      local r13_535 = -1
      for r17_535 = 0, 9, 1 do
        r18_535 = "EN_List" .. tostring(r17_535)
        if r8_535 == r18_535 then
          local r19_535 = r17_535 + g_NmsData.Slide
          r11_535 = 17
          r13_535 = r17_535
          break
        end
      end
      r0_535:EntryTh(r13_535)
      if r8_535 == "EntryDrop" then
        r11_535 = 18
      end
      r11_535 = r0_535.NmsMenu.ExpLayerTop + r11_535
      for r17_535 = r0_535.NmsMenu.ExpLayerTop, r0_535.NmsMenu.ExpLayerEnd, 1 do
        if r17_535 == r11_535 then
          r18_535 = 1
          if not r18_535 then
            ::label_256::
            r18_535 = 0
          end
        else
          goto label_256	-- block#67 is visited secondly
        end
        r10_535:setSubLayerVisible(r0_535.MenuInf.SetName, r0_535.NmsMenu.keyname, r17_535, r18_535)
      end
    end
  end
  function r0_525.NmsMouseWheel(r0_536, r1_536, r2_536)
    -- line: [18975, 19048] id: 536
    if r0_536:GetMenuMouseEnable() then
      local r3_536 = 0
      local r4_536 = 0
      local r5_536 = cclass.lua_AutoCursor:new()
      r3_536, r4_536 = r5_536:GetCursorPos(r3_536, r4_536)
      r5_536:delete()
      r2_536 = r2_536 / 2
      if 0 <= r3_536 and r3_536 < 495 and 0 <= r4_536 and r4_536 < APP_INTERNAL_HEIGHT and 10 < g_NmsData.Param then
        local r6_536 = r0_536.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY() - r2_536
        if r6_536 < 0 then
          r6_536 = 0
        end
        local r7_536 = g_NmsData.Param - r0_536.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PSIZE_Y
        if r7_536 < r6_536 then
          r6_536 = r7_536
        end
        r0_536.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(r6_536)
        r0_536:SetEntryBarParam(r6_536, g_NmsData.Param)
        r0_536:defaultMenuMouseMove(r0_536.MenuInf.SetName, -1, cclass.lua_Layers:create():getCursorPos(r0_536.MenuInf.SetName, r3_536, r4_536, 0) - 1, r3_536, r4_536, false)
        local r10_536 = -1
        for r14_536 = 0, 9, 1 do
          if r0_536.MenuButton.selCursor == "EN_List" .. tostring(r14_536) then
            r10_536 = r14_536
            break
          end
        end
        r0_536:EntryTh(r10_536)
      end
      if 495 <= r3_536 and r3_536 < 1280 and 0 <= r4_536 and r4_536 < APP_INTERNAL_HEIGHT and 3 < g_NmsData.THP_Param then
        local r6_536 = r0_536.NmsMenu.NmsButton.SL_Bar1:bt_GetParamY() - r2_536
        if r6_536 < 0 then
          r6_536 = 0
        end
        local r7_536 = g_NmsData.THP_Param - r0_536.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PSIZE_Y
        if r7_536 < r6_536 then
          r6_536 = r7_536
        end
        r0_536:SetthumbBarParam(r6_536, g_NmsData.THP_Param)
        r0_536:SetThumb()
        r0_536:MenuMouseMove(r0_536.MenuInf.SetName, -1, cclass.lua_Layers:create():getCursorPos(r0_536.MenuInf.SetName, r3_536, r4_536, 0) - 1, r3_536, r4_536, false)
      end
      r0_536:SetThumbTitle()
    end
  end
  function r0_525.endMenu(r0_537, r1_537, r2_537)
    -- line: [19052, 19071] id: 537
    local r3_537 = cclass.lua_Layers:create()
    cfunc.LegacyGame__lua_SetVariable(99, r1_537)
    cfunc.LegacyGame__lua_SetVariable(98, r2_537)
    if r1_537 == -1 then
      NmsMenuSaveBookMark()
      r0_537:closeGallery(0)
      cfunc.LegacyGame__lua_SetFlag(140, false)
    else
      r0_537:GalleryBgmStop()
      r0_537:closeGallery(4)
      g_menuExecute = false
      cfunc.LegacyGame__lua_SetFlag(140, true)
    end
  end
  function r0_525.SetthumbBarParam(r0_538, r1_538, r2_538)
    -- line: [19074, 19107] id: 538
    g_NmsData.THP_Param = r2_538
    g_NmsData.THP_Slide = r1_538
    r0_538.NmsMenu.NmsButton.SL_Bar1:bt_SetParamY(g_NmsData.THP_Slide)
    r2_538 = r2_538 - r0_538.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PSIZE_Y
    if r2_538 <= 0 then
      r0_538.NmsMenu.NmsButton.SL_Bar1:bt_SetActive(2)
      r0_538.NmsMenu.NmsButton.SL_BarBk1:bt_SetActive(2)
      r0_538.NmsMenu.NmsButton.SL_Bar1Up:bt_SetActive(2)
      r0_538.NmsMenu.NmsButton.SL_Bar1Do:bt_SetActive(2)
    else
      if r2_538 <= g_NmsData.THP_Slide then
        g_NmsData.THP_Slide = r2_538
      end
      r0_538.NmsMenu.NmsButton.SL_Bar1:bt_SetActive(0)
      r0_538.NmsMenu.NmsButton.SL_BarBk1:bt_SetActive(0)
      if g_NmsData.THP_Slide <= 0 then
        r0_538.NmsMenu.NmsButton.SL_Bar1Up:bt_SetActive(2)
      else
        r0_538.NmsMenu.NmsButton.SL_Bar1Up:bt_SetActive(0)
      end
      if r2_538 <= g_NmsData.THP_Slide then
        r0_538.NmsMenu.NmsButton.SL_Bar1Do:bt_SetActive(2)
      else
        r0_538.NmsMenu.NmsButton.SL_Bar1Do:bt_SetActive(0)
      end
    end
  end
  function r0_525.SetEntryBarParam(r0_539, r1_539, r2_539)
    -- line: [19111, 19153] id: 539
    g_NmsData.Param = r2_539
    g_NmsData.Slide = r1_539
    r2_539 = r2_539 - r0_539.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PSIZE_Y
    if r2_539 <= 0 then
      r0_539.NmsMenu.NmsButton.SL_Bar2:bt_SetActive(2)
      r0_539.NmsMenu.NmsButton.SL_BarBk2:bt_SetActive(2)
      r0_539.NmsMenu.NmsButton.SL_Bar2Up:bt_SetActive(2)
      r0_539.NmsMenu.NmsButton.SL_Bar2Do:bt_SetActive(2)
      r0_539.NmsMenu.NmsDrop.DropListUp:bt_SetActive(3)
      r0_539.NmsMenu.NmsDrop.DropListDown:bt_SetActive(3)
    else
      if r2_539 <= g_NmsData.Slide then
        g_NmsData.Slide = r2_539
      end
      r0_539.NmsMenu.NmsButton.SL_Bar2:bt_SetActive(0)
      r0_539.NmsMenu.NmsButton.SL_BarBk2:bt_SetActive(0)
      if g_NmsData.Slide <= 0 then
        r0_539.NmsMenu.NmsButton.SL_Bar2Up:bt_SetActive(2)
        r0_539.NmsMenu.NmsDrop.DropListUp:bt_SetActive(3)
      else
        r0_539.NmsMenu.NmsButton.SL_Bar2Up:bt_SetActive(0)
        r0_539.NmsMenu.NmsDrop.DropListUp:bt_SetActive(0)
      end
      if r2_539 <= g_NmsData.Slide then
        r0_539.NmsMenu.NmsButton.SL_Bar2Do:bt_SetActive(2)
        r0_539.NmsMenu.NmsDrop.DropListDown:bt_SetActive(3)
      else
        r0_539.NmsMenu.NmsButton.SL_Bar2Do:bt_SetActive(0)
        r0_539.NmsMenu.NmsDrop.DropListDown:bt_SetActive(0)
      end
    end
    r0_539:SetEntryBarBt()
    r0_539:SetEntryText()
    r0_539:SetNumEntryTextSur()
  end
  function r0_525.SetEntryBarBt(r0_540)
    -- line: [19156, 19180] id: 540
    for r4_540 = 0, 9, 1 do
      local r5_540 = "EN_List" .. tostring(r4_540)
      if r4_540 < g_NmsData.Param then
        local r6_540 = g_NmsData.Act
        if r6_540 ~= -1 then
          r6_540 = r6_540 - g_NmsData.Slide
        end
        if r6_540 == r4_540 + 1 then
          r0_540.NmsMenu.NmsEntry[r5_540]:bt_SetActive(4)
        else
          r0_540.NmsMenu.NmsEntry[r5_540]:bt_SetActive(0)
        end
      else
        r0_540.NmsMenu.NmsEntry[r5_540]:bt_SetActive(2)
      end
    end
    r0_540:SetDropBetween()
  end
  function r0_525.SetDropBetween(r0_541)
    -- line: [19183, 19202] id: 541
    if g_NmsData.Param > 0 then
      r0_541.NmsMenu.NmsDrop.DropBetween0:bt_SetActive(0)
    else
      r0_541.NmsMenu.NmsDrop.DropBetween0:bt_SetActive(2)
    end
    for r4_541 = 1, 10, 1 do
      local r5_541 = "DropBetween" .. tostring(r4_541)
      if r4_541 <= g_NmsData.Param then
        r0_541.NmsMenu.NmsDrop[r5_541]:bt_SetActive(0)
      else
        r0_541.NmsMenu.NmsDrop[r5_541]:bt_SetActive(2)
      end
    end
  end
  function r0_525.SetThumb(r0_542)
    -- line: [19207, 19269] id: 542
    local r1_542 = cclass.lua_Layers:create()
    for r5_542 = 0, g_NmsData.MAX_THUMB - 1, 1 do
      r1_542:setSubLayerVisible(r0_542.MenuInf.SetName, r0_542.NmsSubKey.NmsThumb, r5_542, 0)
    end
    local r2_542 = g_NmsData.THP_Slide * 3 + 1
    local r3_542 = 1
    for r7_542 = 1, 9, 1 do
      local r8_542 = "TH_" .. tostring(r7_542)
      local r9_542 = r0_542.NmsMenu.TH_PosLayer - r7_542 - 1
      if r2_542 <= #g_NmsData.THP_List and g_NmsData.THP_ListEnable[r2_542] == true then
        local r10_542 = 0
        local r11_542 = 0
        local r12_542 = 0
        local r13_542 = 0
        r10_542, r11_542, r12_542, r13_542 = r1_542:getSubLayerParam(r0_542.MenuInf.SetName, r0_542.NmsMenu.keyname, r9_542, LUA_PARAM_POS, r10_542, r11_542, r12_542, r13_542)
        r1_542:setSubLayerVisible(r0_542.MenuInf.SetName, r0_542.NmsSubKey.NmsThumb, g_NmsData.THP_List[r2_542], 1)
        r1_542:setSubLayerParam(r0_542.MenuInf.SetName, r0_542.NmsSubKey.NmsThumb, g_NmsData.THP_List[r2_542], LUA_PARAM_POS, r10_542, r11_542, r12_542, r13_542)
        r0_542.NmsMenu.NmsButton[r8_542]:bt_SetActive(0)
      else
        r0_542.NmsMenu.NmsButton[r8_542]:bt_SetActive(2)
        r0_542.NmsMenu.NmsButton["TH_" .. tostring(r7_542) .. "play"]:bt_SetActive(2)
        r0_542.NmsMenu.NmsButton["TH_" .. tostring(r7_542) .. "bmk"]:bt_SetActive(2)
      end
      if g_NmsData.MAX_THUMB < r2_542 then
        r0_542.NmsMenu.NmsButton["TH_" .. tostring(r7_542)]:bt_SetActive(3)
      end
      r2_542 = r2_542 + 1
    end
    r0_542:InitBookMarkBt()
    if g_NmsData.THP_EnableCount > 0 then
      r0_542.NmsMenu.NmsButton.TH_AllPlay:bt_SetActive(0)
    else
      r0_542.NmsMenu.NmsButton.TH_AllPlay:bt_SetActive(2)
    end
  end
  function r0_525.SetThumbTitle(r0_543)
    -- line: [19272, 19290] id: 543
    local r1_543 = cclass.lua_Layers:create()
    local r2_543 = -1
    if r0_543.NmsMenu.ThumbOnNo ~= -1 then
      r2_543 = r0_543.NmsMenu.ThumbOnNo - 1 + g_NmsData.THP_Slide * 3
    end
    if r0_543.DD_Param.no ~= -1 and r0_543.DD_Param.move == false then
      r2_543 = r0_543.DD_Param.no
    end
    for r6_543 = 0, g_NmsData.MAX_THUMB - 1, 1 do
      local r7_543 = nil	-- notice: implicit variable refs by block#[9]
      if r2_543 == r6_543 then
        r7_543 = 1
        if not r7_543 then
          ::label_37::
          r7_543 = 0
        end
      else
        goto label_37	-- block#8 is visited secondly
      end
      r1_543:setSubLayerVisible(r0_543.MenuInf.SetName, r0_543.NmsSubKey.NmsThTitle, g_NmsData.MAX_THUMB - r6_543 - 1, r7_543)
    end
  end
  function r0_525.InitBookMarkBt(r0_544)
    -- line: [19294, 19315] id: 544
    local r1_544 = cclass.lua_Layers:create()
    for r5_544 = 1, 9, 1 do
      local r6_544 = "TH_" .. tostring(r5_544) .. "bmk"
      local r7_544 = g_NmsData.THP_Slide * 3 + r5_544
      if r7_544 <= #g_NmsData.THP_List and g_NmsData.THP_ListEnable[r7_544] == true then
        if g_NmsData.THP_BookMark[g_NmsData.THP_List[r7_544] + 1] == 0 then
          r0_544.NmsMenu.NmsButton[r6_544]:bt_SetActive(0)
        else
          r0_544.NmsMenu.NmsButton[r6_544]:bt_SetActive(4)
        end
      else
        r0_544.NmsMenu.NmsButton[r6_544]:bt_SetActive(3)
      end
    end
    r0_544:InitTHBookMarkBt()
  end
  function r0_525.InitTHBookMarkBt(r0_545)
    -- line: [19318, 19325] id: 545
    if r0_545.NmsMenu.ENTRY_MAX <= g_NmsData.Param then
      r0_545.NmsMenu.NmsButton.TH_Entry:bt_SetActive(2)
    else
      r0_545.NmsMenu.NmsButton.TH_Entry:bt_SetActive(0)
    end
  end
  function r0_525.ThumbOn(r0_546, r1_546)
    -- line: [19329, 19343] id: 546
    local r2_546 = cclass.lua_Layers:create()
    for r6_546 = 1, 9, 1 do
      local r7_546 = "TH_" .. tostring(r6_546) .. "play"
      if r1_546 == r6_546 then
        r0_546.NmsMenu.NmsButton[r7_546]:bt_SetActive(0)
      else
        r0_546.NmsMenu.NmsButton[r7_546]:bt_SetActive(2)
      end
    end
  end
  r0_525.DD_Param = {
    no = -1,
    move = false,
    POS_X = 0,
    POS_Y = 0,
    DRAGST_X = 0,
    DRAGST_Y = 0,
    list_pos = -1,
  }
  function r0_525.StandbyDrag(r0_547, r1_547, r2_547, r3_547, r4_547)
    -- line: [19358, 19368] id: 547
    if r0_547.NmsMenu.ENTRY_MAX > g_NmsData.Param then
      r0_547.NmsMenu.StandbyDragFlag = true
      r0_547.NmsMenu.StandbyDragParam = {}
      r0_547.NmsMenu.StandbyDragParam.no = r1_547
      r0_547.NmsMenu.StandbyDragParam.move = r2_547
      r0_547.NmsMenu.StandbyDragParam.x = r3_547
      r0_547.NmsMenu.StandbyDragParam.y = r4_547
    end
  end
  function r0_525.ThumbDragStart(r0_548, r1_548, r2_548, r3_548, r4_548)
    -- line: [19371, 19417] id: 548
    if r0_548.NmsMenu.StandbyDragFlag == true then
      r0_548.NmsMenu.StandbyDragFlag = false
    end
    if r0_548.NmsMenu.ENTRY_MAX > g_NmsData.Param then
      local r5_548 = cclass.lua_Layers:create()
      r0_548.MenuButton.onDropFlag = true
      r0_548.DD_Param.move = r2_548
      if r0_548.DD_Param.move == true then
        r0_548.DD_Param.no = g_NmsData.List[r1_548]
        r0_548.DD_Param.POS_X = 0
        r0_548.DD_Param.POS_Y = 0
        r0_548.DD_Param.DRAGST_X = -70
        r0_548.DD_Param.DRAGST_Y = -52
        r0_548.DD_Param.list_pos = r1_548
        r0_548.NmsMenu.NmsDrop.EntryDrop:bt_SetActive(2)
      else
        local r6_548 = "TH_" .. tostring(r1_548)
        r0_548.DD_Param.no = g_NmsData.THP_List[g_NmsData.THP_Slide * 3 + r1_548]
        r0_548.DD_Param.POS_X = r0_548.NmsMenu.NmsButton[r6_548].DRAW_POS.x
        r0_548.DD_Param.POS_Y = r0_548.NmsMenu.NmsButton[r6_548].DRAW_POS.y
        r0_548.DD_Param.DRAGST_X = r0_548.DD_Param.POS_X - r3_548
        r0_548.DD_Param.DRAGST_Y = r0_548.DD_Param.POS_Y - r4_548
        r0_548.DD_Param.list_pos = -1
        r0_548.NmsMenu.NmsDrop.EntryDrop:bt_SetActive(0)
      end
      local r6_548 = r3_548 + r0_548.DD_Param.DRAGST_X
      local r7_548 = r4_548 + r0_548.DD_Param.DRAGST_Y
      r5_548:insertPNARefLayer(r0_548.MenuInf.SetName, "NmsDragTh", r0_548.NmsSubKey.NmsThumb, r0_548.DD_Param.no, 1)
      r5_548:setParam(r0_548.MenuInf.SetName, "NmsDragTh", LUA_PARAM_POS, r6_548, r7_548, 0, 0)
      r5_548:setParam(r0_548.MenuInf.SetName, "NmsDragTh", LUA_PARAM_COLOR, 1, 1, 1, 0.7)
    end
  end
  function r0_525.ThumbDragEnd(r0_549, r1_549, r2_549, r3_549)
    -- line: [19420, 19475] id: 549
    if r0_549.NmsMenu.StandbyDragFlag == true then
      r0_549.NmsMenu.StandbyDragFlag = false
    end
    local r4_549 = false
    local r5_549 = -1
    if r0_549.DD_Param.no ~= -1 then
      r0_549.MenuButton.onDropFlag = false
      local r6_549 = cclass.lua_Layers:create()
      if 400 <= r1_549 and r1_549 <= 410 then
        r5_549 = r1_549 - 400 + 1 + g_NmsData.Slide
        if r0_549:AddEntryList(r5_549, r0_549.DD_Param.no) == true then
          r4_549 = true
        end
      end
      if r1_549 == 500 then
        r5_549 = g_NmsData.Act
        if r5_549 == -1 then
          r5_549 = 0
        end
        r5_549 = r5_549 + 1
        if r0_549:AddEntryList(r5_549, r0_549.DD_Param.no) == true then
          r4_549 = true
        end
      end
      r6_549:removeLayer(r0_549.MenuInf.SetName, "NmsDragTh")
      if r0_549.DD_Param.move == true and r4_549 == true then
        local r7_549 = r0_549.DD_Param.list_pos
        if r5_549 <= r7_549 then
          r7_549 = r7_549 + 1
        end
        r0_549:DelEntryList(r7_549)
        r4_549 = true
      end
      r0_549.DD_Param.no = -1
    end
    return r4_549
  end
  function r0_525.ThumbDragOn(r0_550, r1_550, r2_550)
    -- line: [19478, 19487] id: 550
    if r0_550.DD_Param.no ~= -1 then
      local r3_550 = cclass.lua_Layers:create()
      local r4_550 = 0
      local r5_550 = 0
      r3_550:setParam(r0_550.MenuInf.SetName, "NmsDragTh", LUA_PARAM_POS, r1_550 + r0_550.DD_Param.DRAGST_X, r2_550 + r0_550.DD_Param.DRAGST_Y, 0, 0)
      r3_550:setVisible(r0_550.MenuInf.SetName, "NmsDragTh", 1)
    end
  end
  function r0_525.EntryTh(r0_551, r1_551)
    -- line: [19493, 19554] id: 551
    local r2_551 = cclass.lua_Layers:create()
    local r3_551 = -1
    if g_NmsData.Param >= 1 then
      r3_551 = g_NmsData.List[r1_551 + 1 + g_NmsData.Slide]
    end
    local r8_551 = nil	-- notice: implicit variable refs by block#[9]
    for r7_551 = 0, g_NmsData.MAX_THUMB - 1, 1 do
      if r3_551 == r7_551 then
        r8_551 = 1
        if not r8_551 then
          ::label_39::
          r8_551 = 0
        end
      else
        goto label_39	-- block#8 is visited secondly
      end
      r2_551:setSubLayerVisible(r0_551.MenuInf.SetName, r0_551.NmsSubKey.NmsListTh, r7_551, r8_551)
    end
    if g_NmsData.Act == -1 then
      r0_551.NmsMenu.NmsButton.EN_bmk:bt_SetActive(2)
    elseif r3_551 ~= -1 and g_NmsData.THP_BookMark[r3_551 + 1] == 1 then
      r0_551.NmsMenu.NmsButton.EN_bmk:bt_SetActive(4)
    else
      r0_551.NmsMenu.NmsButton.EN_bmk:bt_SetActive(0)
    end
    if g_NmsData.Param > 0 then
      r0_551.NmsMenu.NmsButton.EN_Save:bt_SetActive(0)
      r0_551.NmsMenu.NmsButton.EN_Reset:bt_SetActive(0)
      r0_551.NmsMenu.NmsButton.EN_PlayTT:bt_SetActive(0)
      r0_551.NmsMenu.NmsButton.EN_PlayTW:bt_SetActive(0)
    else
      r0_551.NmsMenu.NmsButton.EN_Save:bt_SetActive(2)
      r0_551.NmsMenu.NmsButton.EN_Reset:bt_SetActive(2)
      r0_551.NmsMenu.NmsButton.EN_PlayTT:bt_SetActive(2)
      r0_551.NmsMenu.NmsButton.EN_PlayTW:bt_SetActive(2)
    end
    local r4_551 = false
    for r8_551 = 1, g_NmsSLDataMax, 1 do
      if g_NmsSLData[r8_551] ~= nil and 0 < g_NmsSLData[r8_551].Param then
        r4_551 = true
        break
      end
    end
    if r4_551 == true then
      r0_551.NmsMenu.NmsButton.EN_Load:bt_SetActive(0)
    else
      r0_551.NmsMenu.NmsButton.EN_Load:bt_SetActive(2)
    end
    r0_551:InitTHBookMarkBt()
    -- warn: not visited block [3]
    -- block#3:
    -- r3_551 = g_NmsData.List[g_NmsData.Act]
    -- goto label_28
  end
  function r0_525.InitEntryList(r0_552)
    -- line: [19558, 19564] id: 552
    r0_552:SetEntryBarParam(g_NmsData.Slide, g_NmsData.Param)
    r0_552.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(g_NmsData.Slide)
    r0_552:EntryTh(-1)
  end
  function r0_525.AddEntryList(r0_553, r1_553, r2_553)
    -- line: [19567, 19602] id: 553
    if r0_553.NmsMenu.ENTRY_MAX <= g_NmsData.Param then
      return false
    end
    if r1_553 <= g_NmsData.Param and 1 <= g_NmsData.Param then
      for r6_553 = g_NmsData.Param + 1, r1_553, -1 do
        g_NmsData.List[r6_553] = g_NmsData.List[r6_553 - 1]
      end
    end
    g_NmsData.List[r1_553] = r2_553
    g_NmsData.Param = g_NmsData.Param + 1
    g_NmsData.Act = r1_553
    if g_NmsData.Param > 10 then
      if g_NmsData.Act < g_NmsData.Slide then
        g_NmsData.Slide = g_NmsData.Act - 1
      end
      if g_NmsData.Slide + 10 <= g_NmsData.Act then
        g_NmsData.Slide = g_NmsData.Act - 10
      end
    end
    r0_553.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PAR_MAX_Y = g_NmsData.Param
    r0_553.NmsMenu.NmsButton.SL_Bar2:bt_SetSlidebarPos()
    r0_553:SetEntryBarParam(g_NmsData.Slide, g_NmsData.Param)
    r0_553.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(g_NmsData.Slide)
    r0_553:EntryTh(-1)
    r0_553:InitTHBookMarkBt()
    return true
  end
  function r0_525.DelEntryList(r0_554, r1_554)
    -- line: [19605, 19637] id: 554
    g_NmsData.List[r1_554] = -1
    if g_NmsData.Param >= 2 then
      for r5_554 = r1_554, g_NmsData.Param - 1, 1 do
        g_NmsData.List[r5_554] = g_NmsData.List[r5_554 + 1]
      end
    end
    g_NmsData.Param = g_NmsData.Param - 1
    if r1_554 <= g_NmsData.Act then
      if g_NmsData.Act > 1 then
        g_NmsData.Act = g_NmsData.Act - 1
      else
        g_NmsData.Act = 1
      end
      if g_NmsData.Param == 0 then
        g_NmsData.Act = -1
      end
    end
    r0_554.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PAR_MAX_Y = g_NmsData.Param
    r0_554.NmsMenu.NmsButton.SL_Bar2:bt_SetSlidebarPos()
    r0_554:SetEntryBarParam(g_NmsData.Slide, g_NmsData.Param)
    r0_554.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(g_NmsData.Slide)
    r0_554:EntryTh(-1)
    r0_554:InitTHBookMarkBt()
  end
  function r0_525.InitThumb(r0_555)
    -- line: [19642, 19676] id: 555
    local r1_555 = cclass.lua_Layers:create()
    local r2_555 = 1
    g_NmsData.THP_List = {}
    g_NmsData.THP_ListEnable = {}
    g_NmsData.THP_EnableCount = 0
    for r6_555 = 1, g_NmsData.MAX_THUMB, 1 do
      r1_555:initSubLayer(r0_555.MenuInf.SetName, r0_555.NmsSubKey.NmsThumb, r6_555 - 1, 0)
      r1_555:initSubLayer(r0_555.MenuInf.SetName, r0_555.NmsSubKey.NmsListTh, r6_555 - 1, 0)
      g_NmsData.THP_List[r2_555] = r6_555 - 1
      if NmsMenuGetFlag(r6_555 - 1) then
        g_NmsData.THP_ListEnable[r2_555] = true
        g_NmsData.THP_EnableCount = g_NmsData.THP_EnableCount + 1
      else
        g_NmsData.THP_ListEnable[r2_555] = false
      end
      r2_555 = r2_555 + 1
    end
    for r6_555 = 0, 8, 1 do
      r1_555:initSubLayer(r0_555.MenuInf.SetName, r0_555.NmsMenu.keyname, r0_555.NmsMenu.TH_PosLayer - r6_555, 0)
    end
    g_NmsData.THP_Param = math.ceil((r2_555 - 1) / 3)
  end
  function r0_525.StartSetParam(r0_556)
    -- line: [19680, 19693] id: 556
    r0_556:InitThumb()
    local r1_556 = cclass.lua_Layers:create()
    for r5_556 = 1, g_NmsData.MAX_THUMB, 1 do
      r1_556:initSubLayer(r0_556.MenuInf.SetName, r0_556.NmsSubKey.NmsThTitle, g_NmsData.MAX_THUMB - r5_556, 0)
    end
    r1_556:setParam(r0_556.MenuInf.SetName, r0_556.NmsSubKey.NmsThTitle, LUA_PARAM_POS, 535, 114, 0, 0)
  end
  function r0_525.DropRepeatLD(r0_557, r1_557, r2_557, r3_557, r4_557, r5_557, r6_557)
    -- line: [19702, 19763] id: 557
    if r6_557 == false then
      return 
    end
    if r0_557.DD_Param.no ~= -1 then
      local r7_557 = 0
      local r8_557 = -1
      if r0_557.MenuButton.selCursor ~= -1 then
        r7_557 = r0_557.MenuButton.selListKey[r0_557.MenuButton.selCursor].arg
      end
      if r0_557.NmsMenu.DropRepeatArg ~= r7_557 then
        r0_557.NmsMenu.DropRepeatArg = r7_557
        r0_557.NmsMenu.DropRepeatTime = 0
      end
      local r9_557 = false
      if r7_557 == "DropListUp" and 0 < g_NmsData.Slide then
        if r0_557.NmsMenu.DropRepeatTime < 10 then
          r0_557.NmsMenu.DropRepeatTime = r0_557.NmsMenu.DropRepeatTime + 1
        else
          local r10_557 = r0_557.NmsMenu.NmsButton.SL_Bar2
          local r11_557 = r10_557:bt_GetParamY() - 1
          r10_557:bt_SetParamY(r11_557)
          r0_557:SetEntryBarParam(r11_557, g_NmsData.Param)
        end
        r9_557 = true
      end
      if r7_557 == "DropListDown" then
        if r0_557.NmsMenu.DropRepeatTime < 10 then
          r0_557.NmsMenu.DropRepeatTime = r0_557.NmsMenu.DropRepeatTime + 1
        else
          local r10_557 = r0_557.NmsMenu.NmsButton.SL_Bar2
          local r11_557 = r10_557:bt_GetParamY() + 1
          r10_557:bt_SetParamY(r11_557)
          r0_557:SetEntryBarParam(r11_557, g_NmsData.Param)
        end
        r9_557 = true
      end
      if r9_557 == false then
        r0_557.NmsMenu.DropRepeatArg = 0
        r0_557.NmsMenu.DropRepeatTime = 0
      end
    else
      r0_557.NmsMenu.DropRepeatArg = 0
      r0_557.NmsMenu.DropRepeatTime = 0
    end
  end
  function r0_525.MakeYSlideBar(r0_558, r1_558, r2_558, r3_558, r4_558, r5_558, r6_558, r7_558, r8_558, r9_558)
    -- line: [19766, 19772] id: 558
    r1_558[r2_558] = r0_558.MenuButton:SlidebarY(r5_558, r6_558, r0_558.MenuButton:Movable(r0_558.MenuButton:ButtonCreate(r2_558, r3_558, r4_558, r5_558, -1, -1, -1, -1, r7_558, r8_558, "SYS01.ogg", -1, r9_558)))
  end
  function r0_525.NmsChangeEffect(r0_559, r1_559, r2_559, r3_559)
    -- line: [19775, 19867] id: 559
    local r4_559 = cclass.lua_Layers:create()
    local r5_559 = getEffectRate()
    for r9_559, r10_559 in pairs(r0_559.NmsSubKey) do
      if r3_559 == false then
        r4_559:setParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r2_559 * r5_559, 0, 0)
        local r11_559 = 0
        local r12_559 = 0
        r11_559, r12_559, r13_559, r14_559 = r4_559:getParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_POS, r11_559, r12_559, 0, 0)
        r4_559:setParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_POS, r11_559 + -1 * r1_559, r12_559, 0, 0)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_POS, r1_559, 0, 0, 0, 0, r2_559 * r5_559, 0, 0)
        r4_559:startEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", 0)
      else
        r4_559:setParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r2_559 * r5_559, 0, 0)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_POS, r1_559, 0, 0, 0, 0, r2_559 * r5_559, 0, 0)
        r4_559:startEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", 0)
      end
    end
    for r9_559 = 0, 9, 1 do
      local r10_559 = r0_559.NmsSubKey.NmsTitle .. tostring(r9_559)
      if r3_559 == false then
        r4_559:setParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r2_559 * r5_559, 0, 0)
        local r11_559 = 0
        local r12_559 = 0
        r11_559, r12_559, r13_559, r14_559 = r4_559:getParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_POS, r11_559, r12_559, 0, 0)
        r4_559:setParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_POS, r11_559 + -1 * r1_559, r12_559, 0, 0)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_POS, r1_559, 0, 0, 0, 0, r2_559 * r5_559, 0, 0)
        r4_559:startEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", 0)
      else
        r4_559:setParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r2_559 * r5_559, 0, 0)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_POS, r1_559, 0, 0, 0, 0, r2_559 * r5_559, 0, 0)
        r4_559:startEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", 0)
      end
    end
    for r9_559 = 1, 3, 1 do
      local r10_559 = r0_559.NmsSubKey.NmsNo .. tostring(r9_559)
      if r3_559 == false then
        r4_559:setParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r2_559 * r5_559, 0, 0)
        local r11_559 = 0
        local r12_559 = 0
        r11_559, r12_559, r13_559, r14_559 = r4_559:getParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_POS, r11_559, r12_559, 0, 0)
        r4_559:setParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_POS, r11_559 + -1 * r1_559, r12_559, 0, 0)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_POS, r1_559, 0, 0, 0, 0, r2_559 * r5_559, 0, 0)
        r4_559:startEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", 0)
      else
        r4_559:setParam(r0_559.MenuInf.SetName, r10_559, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r2_559 * r5_559, 0, 0)
        r4_559:setEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", LUA_EFFECT_POS, r1_559, 0, 0, 0, 0, r2_559 * r5_559, 0, 0)
        r4_559:startEffect(r0_559.MenuInf.SetName, r10_559, "GalleryPageEff", 0)
      end
    end
    return r0_559.NmsMenu.keyname
  end
end
g_CgBrowserList = {
  Count = 0,
  Layer = {},
}
function InitPnaCgBrowser(r0_560, r1_560)
  -- line: [19887, 19896] id: 560
  if r1_560 == -1 then
    g_CgBrowserList.Count = 0
    g_CgBrowserList.Layer = {}
  else
    g_CgBrowserList.Count = g_CgBrowserList.Count + 1
    g_CgBrowserList.Layer["Cg" .. tostring(g_CgBrowserList.Count)] = r1_560
  end
end
function openCgBrowser(r0_561, r1_561)
  -- line: [19901, 20454] id: 561
  g_Menu.CgBrowser.ptr = Menu.new("CgBrowser")
  function g_Menu.CgBrowser.ptr.MenuInit(r0_562)
    -- line: [19913, 19925] id: 562
    local r1_562 = true
    r0_562.MenuInf.enabled = true
    r0_562.MenuInf.effect = true
    if cclass.lua_Layers:create():add(r0_562.MenuInf.SetName) == false then
      return false
    end
    return r1_562
  end
  function g_Menu.CgBrowser.ptr.MenuEffectEndJob(r0_563)
    -- line: [19953, 19966] id: 563
    local r1_563 = cclass.lua_Layers:create()
    if r0_563.MenuInf.enabled ~= true then
      r1_563:remove(r0_563.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_563.MenuInf.ButtonLayer = ""
      r0_563.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.CgBrowser.ptr.MenuEffectStart(r0_564, r1_564)
    -- line: [19969, 19977] id: 564
    cclass.lua_Layers:create():startTransition(r0_564.MenuInf.SetName, 0, 1, r1_564 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_564.MenuInf.enabled = true
    r0_564.MenuInf.effect = true
  end
  function g_Menu.CgBrowser.ptr.GetMenuMouseEnable(r0_565)
    -- line: [19993, 20004] id: 565
    local r1_565 = false
    if r0_565.MenuInf.enabled == true and r0_565.MenuInf.effect == false then
      r1_565 = true
    end
    return r1_565
  end
  function g_Menu.CgBrowser.ptr.MenuMouseMove(r0_566, r1_566, r2_566, r3_566, r4_566, r5_566, r6_566)
    -- line: [20010, 20023] id: 566
    if r6_566 == true then
      return 
    end
    if r0_566:GetMenuMouseEnable() then
      r0_566:DragMoveCg(r4_566, r5_566)
      r0_566:Cursor()
    elseif r0_566.DragMoveFlag == true then
      r0_566.DragMoveFlag = false
      r0_566:Cursor()
    end
  end
  function g_Menu.CgBrowser.ptr.MenuLButtonDown(r0_567, r1_567, r2_567, r3_567, r4_567, r5_567, r6_567)
    -- line: [20025, 20044] id: 567
    local r7_567 = 0
    if r6_567 == true then
      return r7_567
    end
    if r0_567:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, 0)
      r0_567:closeBrowser()
    elseif r0_567.DragMoveFlag == true then
      r0_567.DragMoveFlag = false
      r0_567:Cursor()
    end
    return r7_567
  end
  function g_Menu.CgBrowser.ptr.MenuLButtonUp(r0_568, r1_568, r2_568, r3_568, r4_568, r5_568, r6_568)
    -- line: [20046, 20058] id: 568
    local r7_568 = 0
    if r6_568 == true then
      return r7_568
    end
    if r0_568.DragMoveFlag == true then
      r0_568.DragMoveFlag = false
      r0_568:Cursor()
    end
    return r7_568
  end
  function g_Menu.CgBrowser.ptr.MenuRButtonDown(r0_569, r1_569, r2_569, r3_569, r4_569, r5_569, r6_569)
    -- line: [20060, 20073] id: 569
    local r7_569 = 0
    if r6_569 == true then
      return r7_569
    end
    if not r0_569:GetMenuMouseEnable() and r0_569.DragMoveFlag == true then
      r0_569.DragMoveFlag = false
      r0_569:Cursor()
    end
    return r7_569
  end
  function g_Menu.CgBrowser.ptr.MenuRButtonUp(r0_570, r1_570, r2_570, r3_570, r4_570, r5_570, r6_570)
    -- line: [20075, 20093] id: 570
    local r7_570 = 0
    if r6_570 == true then
      return r7_570
    end
    if r0_570:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_570:closeBrowser()
    elseif r0_570.DragMoveFlag == true then
      r0_570.DragMoveFlag = false
      r0_570:Cursor()
    end
    return r7_570
  end
  function g_Menu.CgBrowser.ptr.MenuMButtonDown(r0_571, r1_571, r2_571, r3_571, r4_571, r5_571, r6_571)
    -- line: [20095, 20111] id: 571
    local r7_571 = 0
    if r6_571 == true then
      return r7_571
    end
    if r0_571:GetMenuMouseEnable() then
      r0_571:DragStart(r4_571, r5_571)
    elseif r0_571.DragMoveFlag == true then
      r0_571.DragMoveFlag = false
      r0_571:Cursor()
    end
    return r7_571
  end
  function g_Menu.CgBrowser.ptr.MenuMButtonUp(r0_572, r1_572, r2_572, r3_572, r4_572, r5_572, r6_572)
    -- line: [20113, 20125] id: 572
    if r0_572:GetMenuMouseEnable() and r0_572.DragMoveFlag == true then
      r0_572.DragMoveFlag = false
      r0_572:Cursor()
    elseif r0_572.DragMoveFlag == true then
      r0_572.DragMoveFlag = false
      r0_572:Cursor()
    end
  end
  function g_Menu.CgBrowser.ptr.MenuMouseWheel(r0_573, r1_573, r2_573)
    -- line: [20127, 20141] id: 573
  end
  function g_Menu.CgBrowser.ptr.MoveCgPos(r0_574, r1_574, r2_574)
    -- line: [20146, 20154] id: 574
    local r3_574 = cclass.lua_Layers:create()
    r1_574, r2_574 = r0_574:PosCalc(r1_574, r2_574)
    r0_574.LoadCgInf.EventCG.posx = r1_574
    r0_574.LoadCgInf.EventCG.posy = r2_574
    r3_574:setParam(r0_574.MenuInf.SetName, "EventCG", LUA_PARAM_POS, r1_574, r2_574, 0, 0)
    r0_574:Cursor()
  end
  function g_Menu.CgBrowser.ptr.ScaleCg(r0_575, r1_575)
    -- line: [20156, 20171] id: 575
    local r2_575 = cclass.lua_Layers:create()
    if r1_575 < r0_575.LoadCgInf.EventCG.MinScale then
      r1_575 = r0_575.LoadCgInf.EventCG.MinScale
    end
    if r1_575 > 1 then
      r1_575 = 1
    end
    r2_575:setParam(r0_575.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, r1_575, r1_575, 0, 0)
    r0_575.LoadCgInf.EventCG.Scale = r1_575
    r0_575:MoveCgPos(r0_575.LoadCgInf.EventCG.posx, r0_575.LoadCgInf.EventCG.posy)
    r0_575:Cursor()
  end
  g_Menu.CgBrowser.ptr.DragMoveFlag = false
  g_Menu.CgBrowser.ptr.DragMovePosx = 0
  g_Menu.CgBrowser.ptr.DragMovePosy = 0
  function g_Menu.CgBrowser.ptr.DragMoveCg(r0_576, r1_576, r2_576)
    -- line: [20177, 20225] id: 576
    if r0_576.DragMoveFlag == true then
      if 0 <= r1_576 and 0 <= r2_576 and r1_576 < APP_INTERNAL_WIDTH and r2_576 < APP_INTERNAL_HEIGHT then
        r0_576.DragMovePosx = r1_576
        r0_576.DragMovePosy = r2_576
        r0_576:MoveCgPos(r1_576 - r0_576.DragMovePosx + r0_576.LoadCgInf.EventCG.posx, r2_576 - r0_576.DragMovePosy + r0_576.LoadCgInf.EventCG.posy)
      end
    else
      if 0 <= r1_576 and r1_576 <= 100 then
        r0_576:MoveCgPos(r0_576.LoadCgInf.EventCG.posx + 100 - r1_576, r0_576.LoadCgInf.EventCG.posy)
      end
      if r1_576 < APP_INTERNAL_WIDTH and APP_INTERNAL_WIDTH - 100 <= r1_576 then
        r0_576:MoveCgPos(r0_576.LoadCgInf.EventCG.posx - r1_576 - APP_INTERNAL_WIDTH - 100, r0_576.LoadCgInf.EventCG.posy)
      end
      if 0 <= r2_576 and r2_576 <= 100 then
        r0_576:MoveCgPos(r0_576.LoadCgInf.EventCG.posx, r0_576.LoadCgInf.EventCG.posy + 100 - r2_576)
      end
      if r2_576 < APP_INTERNAL_HEIGHT and APP_INTERNAL_HEIGHT - 100 <= r2_576 then
        r0_576:MoveCgPos(r0_576.LoadCgInf.EventCG.posx, r0_576.LoadCgInf.EventCG.posy - r2_576 - APP_INTERNAL_HEIGHT - 100)
      end
    end
  end
  function g_Menu.CgBrowser.ptr.DragStart(r0_577, r1_577, r2_577)
    -- line: [20227, 20231] id: 577
    r0_577.DragMoveFlag = true
    r0_577.DragMovePosx = r1_577
    r0_577.DragMovePosy = r2_577
  end
  function g_Menu.CgBrowser.ptr.PosCalc(r0_578, r1_578, r2_578)
    -- line: [20233, 20267] id: 578
    local r3_578 = 0
    local r4_578 = 0
    local r5_578 = 0
    local r6_578 = nil
    local r7_578 = 0
    local r8_578 = 0
    r5_578, r6_578, r7_578, r8_578 = cclass.lua_Layers:create():getParam(r0_578.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, 0, 0, 0, 0)
    r3_578 = (r0_578.LoadCgInf.EventCG.size_w * r5_578 - r0_578.LoadCgInf.EventCG.size_w) / 2
    r4_578 = (r0_578.LoadCgInf.EventCG.size_h * r6_578 - r0_578.LoadCgInf.EventCG.size_h) / 2
    local r10_578 = 0 - r0_578.LoadCgInf.EventCG.size_w - APP_INTERNAL_WIDTH - r3_578
    local r11_578 = 0 - r0_578.LoadCgInf.EventCG.size_h - APP_INTERNAL_HEIGHT - r4_578
    if r0_578.LoadCgInf.EventCG.size_w * r5_578 < APP_INTERNAL_WIDTH then
      r1_578 = (APP_INTERNAL_WIDTH - r0_578.LoadCgInf.EventCG.size_w) / 2
    else
      if r1_578 < r10_578 then
        r1_578 = r10_578
      end
      if r3_578 < r1_578 then
        r1_578 = r3_578
      end
    end
    if r0_578.LoadCgInf.EventCG.size_h * r6_578 < APP_INTERNAL_HEIGHT then
      r2_578 = (APP_INTERNAL_HEIGHT - r0_578.LoadCgInf.EventCG.size_h) / 2
    else
      if r2_578 < r11_578 then
        r2_578 = r11_578
      end
      if r4_578 < r2_578 then
        r2_578 = r4_578
      end
    end
    return r1_578, r2_578
  end
  function g_Menu.CgBrowser.ptr.Cursor(r0_579)
    -- line: [20270, 20284] id: 579
    local r1_579 = cclass.lua_AutoCursor:new()
    local r2_579 = 0
    local r3_579 = cclass.lua_Layers:create()
    local r4_579 = 0
    local r5_579 = 0
    r4_579, r5_579, r6_579, r7_579 = r3_579:getParam(r0_579.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, r4_579, r5_579, 0, 0)
    if (APP_INTERNAL_WIDTH < r0_579.LoadCgInf.EventCG.size_w * r4_579 or APP_INTERNAL_HEIGHT < r0_579.LoadCgInf.EventCG.size_h * r5_579) and (r0_579.DragMoveFlag ~= true or 2) then
      r2_579 = 1
    end
    r1_579:SetCursor(0)
    r1_579:delete()
  end
  g_Menu.CgBrowser.ptr.Different = 1
  g_Menu.CgBrowser.ptr.LoadCgInf = {}
  function g_Menu.CgBrowser.ptr.LoadCg(r0_580, r1_580, r2_580)
    -- line: [20304, 20371] id: 580
    p, q = string.find(string.lower(r2_580), string.lower("ASA_11_"))
    if p ~= nil then
      r0_580:MenuLoadLayer("EventBack", "BG08_AS.png")
    end
    local r3_580 = r0_580:MenuLoadLayer(r1_580, r2_580)
    local r4_580 = cclass.lua_Layers:create()
    for r8_580, r9_580 in pairs(g_CgBrowserList.Layer) do
      r4_580:initSubLayer(r0_580.MenuInf.SetName, r1_580, r9_580, 1)
    end
    local r5_580 = 0
    local r6_580 = 0
    r5_580, r6_580, r7_580, r8_580 = r4_580:getParam(r0_580.MenuInf.SetName, r1_580, LUA_PARAM_SIZE, r5_580, r6_580, 0, 0)
    local r9_580 = r5_580
    local r10_580 = r6_580
    local r11_580 = 1
    local r12_580 = 0.5
    if r4_580:isMosaic(r0_580.MenuInf.SetName, r1_580) == false and (APP_INTERNAL_WIDTH <= r5_580 or APP_INTERNAL_HEIGHT <= r6_580) then
      r5_580 = APP_INTERNAL_WIDTH / r5_580
      r6_580 = APP_INTERNAL_HEIGHT / r6_580
      if r6_580 < r5_580 then
        r11_580 = r5_580 or r6_580
      else
        goto label_85	-- block#10 is visited secondly
      end
      if r11_580 < 0.5 then
        r11_580 = 0.5
      end
      r12_580 = r11_580
      r4_580:setParam(r0_580.MenuInf.SetName, r1_580, LUA_PARAM_SCALE, r11_580, r11_580, 0, 0)
    end
    local r14_580 = (APP_INTERNAL_WIDTH - r9_580) / 2
    local r15_580 = (APP_INTERNAL_HEIGHT - r10_580) / 2
    r4_580:setParam(r0_580.MenuInf.SetName, r1_580, LUA_PARAM_POS, r14_580, r15_580, 0, 0)
    r0_580.LoadCgInf[r1_580] = {
      posx = r14_580,
      posy = r15_580,
      size_w = r9_580,
      size_h = r10_580,
      Scale = r11_580,
      MinScale = r12_580,
    }
    r0_580:Cursor()
    return r3_580
  end
  function g_Menu.CgBrowser.ptr.closeBrowser(r0_581)
    -- line: [20414, 20425] id: 581
    r0_581:MenuEffectToMenu(0)
    r0_581.MenuInf.enabled = false
    r0_581.MenuInf.effect = true
    cclass.lua_Layers:create():rtSnap("system")
    local r2_581 = cclass.lua_AutoCursor:new()
    r2_581:SetCursor(0)
    r2_581:delete()
  end
  local r2_561 = g_Menu.CgBrowser.ptr:MenuInit()
  if res == false then
    return false
  end
  if g_Menu.CgBrowser.ptr:LoadCg("EventCG", r0_561) == false then
    print("\x83t\x83@\x83C\x83\x8b\x82\xaa\x96\xb3\x82\xa9\x82\xc1\x82\xbd")
  end
  cclass.lua_Layers:create():copySnap("CgBrowser", "system")
  g_Menu.CgBrowser.ptr:MenuEffectStart(200)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function ScriptLogOut(r0_582, r1_582)
  -- line: [20460, 20472] id: 582
  if getAppInfo() ~= 0 then
    local r3_582 = nil
    if r1_582 ~= 0 then
      r3_582 = io.open("\x83V\x81[\x83\x93\x92ʉ߃\x8d\x83O.txt", "w")
    else
      r3_582 = io.open("\x83V\x81[\x83\x93\x92ʉ߃\x8d\x83O.txt", "a")
    end
    r3_582:write(r0_582 .. "\n")
    r3_582:close()
  end
end
g_DisableGestureFlag = false
g_DisableDataBackup = false
function DisableSC(r0_583, r1_583)
  -- line: [20481, 20494] id: 583
  if r1_583 == 1 then
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
function GetNmsList(r0_584, r1_584)
  -- line: [20502, 20530] id: 584
  local r2_584 = cfunc.LegacyGame__lua_GetVariable(98)
  cfunc.LegacyGame__lua_SetVariable(97, -1)
  if r2_584 <= g_NmsPlay.Param then
    cfunc.LegacyGame__lua_SetVariable(97, g_NmsPlay.List[r2_584])
    g_NmsPlay.Act = r2_584
  else
    cfunc.LegacyGame__lua_SetVariable(97, -1)
  end
  if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
    cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
  end
end
function NmsMenuGetFlag(r0_585)
  -- line: [20562, 20575] id: 585
  return 
  local r1_585 = 1120 + r0_585
  if r0_585 >= 128 then
    r1_585 = 1786 + r0_585 - 128
  end
  local r2_585 = cfunc.LegacyGame__lua_GetFlag(r1_585)
  return true
end
function NmsMenuSetBookMarkAll(r0_586)
  -- line: [20579, 20592] id: 586
  return 
  g_NmsData.THP_BookMark = {}
  for r4_586 = 1, g_NmsData.MAX_THUMB, 1 do
    if NmsMenuGetFlag(r4_586 - 1) then
      g_NmsData.THP_BookMark[r4_586] = r0_586
    else
      g_NmsData.THP_BookMark[r4_586] = 0
    end
  end
end
function NmsMenuLoadBookMark()
  -- line: [20594, 20614] id: 587
  return 
  local r1_587 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmsBookMark.dat", "r")
  if r1_587 ~= nil then
    for r5_587 = 1, g_NmsData.MAX_THUMB, 1 do
      g_NmsData.THP_BookMark[r5_587] = r1_587:read("*n")
      if g_NmsData.THP_BookMark[r5_587] == nil then
        g_NmsData.THP_BookMark[r5_587] = 0
      end
    end
    r1_587:close()
  else
    NmsMenuSetBookMarkAll(0)
  end
end
g_nmsBookMarkFlag = false
function NmsMenuSaveBookMark()
  -- line: [20617, 20643] id: 588
  return 
  if g_nmsBookMarkFlag then
    local r1_588 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmsBookMark.dat", "w")
    if r1_588 ~= nil then
      for r5_588 = 1, g_NmsData.MAX_THUMB, 1 do
        if g_NmsData.THP_BookMark[r5_588] == nil then
          g_NmsData.THP_BookMark[r5_588] = 0
        end
        if r5_588 <= #g_NmsData.THP_BookMark then
          r1_588:write(g_NmsData.THP_BookMark[r5_588] .. "\n")
        else
          r1_588:write(0 .. "\n")
          g_NmsData.THP_BookMark[r5_588] = 0
        end
      end
      r1_588:close()
    end
  end
end
function NmsMenuInitENP()
  -- line: [20647, 20653] id: 589
  g_NmsData.Slide = 0
  g_NmsData.List = {}
  g_NmsData.Act = -1
  g_NmsData.Param = 0
end
function openNmsSaveLoad(r0_590, r1_590)
  -- line: [20664, 21106] id: 590
  g_Menu.NmsSaveLoad.ptr = Menu.new("NmsSLMenu")
  g_Menu.NmsSaveLoad.ptr.SaveLoadFlag = r1_590
  g_Menu.NmsSaveLoad.ptr.ExpTextNo = -1
  g_Menu.NmsSaveLoad.ptr.defaultMenuMouseMove = g_Menu.NmsSaveLoad.ptr.MenuMouseMove
  function g_Menu.NmsSaveLoad.ptr.MenuMouseMove(r0_591, r1_591, r2_591, r3_591, r4_591, r5_591, r6_591)
    -- line: [20679, 20689] id: 591
    r0_591:defaultMenuMouseMove(r1_591, r2_591, r3_591, r4_591, r5_591, r6_591)
    local r7_591 = 0
    local r8_591 = -1
    if r0_591.MenuButton.selCursor ~= -1 then
      r7_591 = r0_591.MenuButton.selListKey[r0_591.MenuButton.selCursor].arg
    end
  end
  function g_Menu.NmsSaveLoad.ptr.MenuButtonJobPos(r0_592, r1_592, r2_592, r3_592, r4_592)
    -- line: [20693, 20760] id: 592
    if nil and not nil then
      goto label_2	-- block#1 is visited secondly
    end
    if r2_592 == "LU" then
    end
    if r2_592 == "LU" and r1_592 ~= 0 then
      if r1_592 == 999 then
        r0_592:endMenu()
      end
      if 1 <= r1_592 and r1_592 <= g_NmsSLDataMax then
        if r0_592.SaveLoadFlag == 0 then
          g_Menu.NmsSaveLoad.ptrSaveNo = r1_592
          if g_NmsSLData[g_Menu.NmsSaveLoad.ptrSaveNo].Param == 0 then
            NmsSLMenuSave()
          else
            openConfirm(LUA_CONFIRM_NMSSAVE)
          end
        else
          NmsSLMenuLoadData(r1_592)
          if r0_592.DataActNo ~= -1 then
            r0_592.ButtonSlide.SlideBar.MOVABLE.PAR_MAX_Y = r0_592.DispSave.Param
            r0_592.ButtonSlide.SlideBar:bt_SetSlidebarPos()
          end
          r0_592:endMenu()
        end
        r0_592:SetActive()
      end
    end
    if nil and not nil then
      goto label_64	-- block#19 is visited secondly
    end
    if r2_592 == "RU" and r1_592 == 0 then
      r0_592:SystemSePlay("SYS02.ogg")
      r0_592:endMenu()
    end
  end
  function g_Menu.NmsSaveLoad.ptr.MenuMouseWheel(r0_593, r1_593, r2_593, r3_593)
    -- line: [20764, 20769] id: 593
    local r4_593 = cclass.lua_Layers:create()
  end
  function g_Menu.NmsSaveLoad.ptr.NmsSLMenuSaveData(r0_594, r1_594)
    -- line: [20776, 20811] id: 594
    g_NmsSLData[r1_594] = {}
    g_NmsSLData[r1_594].Act = g_Menu.NmsSaveLoad.ptr.DispSave.Act
    g_NmsSLData[r1_594].List = {
      unpack(g_NmsData.List)
    }
    g_NmsSLData[r1_594].Param = g_NmsData.Param
    g_NmsSLData[r1_594].Slide = g_Menu.NmsSaveLoad.ptr.DispSave.Slide
    g_NmsSLData[r1_594].ts = os.date("%Y-%m-%d %H:%M:%S")
    local r4_594 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmssave" .. tostring(r1_594) .. ".dat", "w")
    if r4_594 ~= nil then
      r4_594:write(g_NmsSLData[r1_594].ts .. "\n")
      r4_594:write(g_NmsSLData[r1_594].Param .. "\n")
      r4_594:write(g_NmsSLData[r1_594].Act .. "\n")
      r4_594:write(g_NmsSLData[r1_594].Slide .. "\n")
      for r8_594 = 1, g_NmsSLData[r1_594].Param, 1 do
        r4_594:write(g_NmsSLData[r1_594].List[r8_594] .. "\n")
      end
      r4_594:close()
    end
  end
  function g_Menu.NmsSaveLoad.ptr.startMenu(r0_595)
    -- line: [20814, 20823] id: 595
    local r1_595 = cclass.lua_Layers:create()
    if g_menuExecute == false then
      r1_595:setSnap("system", true)
    end
    r1_595:copySnap("NmsSLMenu", "system")
    r0_595:MenuEffectStart(500, 0)
    r0_595.MenuInf.enabled = true
    r0_595.MenuInf.effect = true
  end
  function g_Menu.NmsSaveLoad.ptr.endMenu(r0_596)
    -- line: [20825, 20829] id: 596
    r0_596:MenuEffectToMenu(500)
    r0_596.MenuInf.enabled = false
    r0_596.MenuInf.effect = true
  end
  function g_Menu.NmsSaveLoad.ptr.MakeDataTh(r0_597, r1_597)
    -- line: [20833, 20888] id: 597
    local r2_597 = 228 * (r1_597 - 1) % 4
    local r3_597 = 211 * math.floor((r1_597 - 1) / 4)
    local r4_597 = "NmsSLThumb" .. tostring(r1_597)
    local r5_597 = cclass.lua_Layers:create()
    local r6_597 = 0
    local r7_597 = 0
    local r8_597 = 0
    local r9_597 = 0
    r5_597:removeLayer("NmsSLMenu", r4_597)
    if 0 < g_NmsSLData[r1_597].Param and 0 < g_NmsSLData[r1_597].Act then
      r6_597, r7_597, r8_597, r9_597 = r5_597:getSubLayerParam("NmsSLMenu", "NmsSLBace00", 7, LUA_PARAM_POS, r6_597, r7_597, r8_597, r9_597)
      r6_597 = r6_597 + r2_597
      r7_597 = r7_597 + r3_597
      r5_597:insertPNARefLayer("NmsSLMenu", r4_597, "NmsSLThumb", g_NmsSLData[r1_597].List[g_NmsSLData[r1_597].Act], 1)
      r5_597:setParam("NmsSLMenu", r4_597, LUA_PARAM_POS, r6_597, r7_597, 0, 0)
    end
    local r10_597 = {
      [1] = g_NmsSLData[r1_597].Param % 10,
      [2] = math.floor(g_NmsSLData[r1_597].Param / 10) % 10,
      [3] = math.floor(g_NmsSLData[r1_597].Param / 100),
    }
    local r11_597 = g_NmsSLData[r1_597].Param
    if r11_597 > 0 then
      r11_597 = 1 or 0.2
    else
      goto label_107	-- block#5 is visited secondly
    end
    for r15_597 = 1, 3, 1 do
      local r16_597 = "NmsData" .. tostring(r1_597) .. "No" .. tostring(r15_597)
      r5_597:removeLayer("NmsSLMenu", r16_597)
      r5_597:insertPNARefLayer("NmsSLMenu", r16_597, "NmsSLNo", r10_597[r15_597], 1)
      r6_597, r7_597, r8_597, r9_597 = r5_597:getSubLayerParam("NmsSLMenu", "NmsSLBace00", 3 + r15_597 - 1, LUA_PARAM_POS, r6_597, r7_597, r8_597, r9_597)
      r6_597 = r6_597 + r2_597
      r7_597 = r7_597 + r3_597
      r5_597:setParam("NmsSLMenu", r16_597, LUA_PARAM_POS, r6_597, r7_597, 0, 0)
      r5_597:setParam("NmsSLMenu", r16_597, LUA_PARAM_COLOR, 1, 1, 1, r11_597)
    end
    local r12_597 = getDefaultFont()
    r4_597 = "NmsSLTime" .. tostring(r1_597)
    r5_597:clearText("NmsSLMenu", r4_597)
    if g_NmsSLData[r1_597].Param > 0 then
      r5_597:setText("NmsSLMenu", r4_597, g_NmsSLData[r1_597].ts, r12_597, 16, 0, 0, 255, 4294967295)
      r6_597, r7_597, r8_597, r9_597 = r5_597:getSubLayerParam("NmsSLMenu", "NmsSLBace00", 1, LUA_PARAM_POS, r6_597, r7_597, r8_597, r9_597)
      r5_597:setParam("NmsSLMenu", r4_597, LUA_PARAM_POS, r6_597 + r2_597, r7_597 + r3_597, 0, 0)
    end
  end
  g_Menu.NmsSaveLoad.ptr.DataActNo = -1
  function g_Menu.NmsSaveLoad.ptr.InitNmsSL(r0_598)
    -- line: [20892, 21031] id: 598
    local r1_598 = cclass.lua_Layers:create()
    local r2_598 = r0_598:MenuInit("NmsSLBace00", "sys_nms_saveload.pna")
    if res == false then
      return false
    end
    r0_598:MenuLoadLayer("NmsSLTitle", "sys_nms_scn.pna")
    r0_598:MenuLoadLayer("NmsSLNo", "sys_nms_no.pna")
    r0_598:MenuLoadLayer("NmsSLThumb", "sys_nms_th.pna")
    for r6_598 = 0, g_NmsData.MAX_THUMB - 1, 1 do
      r1_598:initSubLayer("NmsSLMenu", "NmsSLThumb", r6_598, 0)
    end
    for r6_598 = 0, 9, 1 do
      r1_598:initSubLayer("NmsSLMenu", "NmsSLNo", r6_598, 0)
    end
    if r0_598.SaveLoadFlag == 0 then
      r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 47, 1)
      r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 48, 1)
      r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 51, 1)
      r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 52, 1)
    else
      r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 115, 1)
      r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 116, 1)
      r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 119, 1)
      r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 120, 1)
    end
    r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 1, 0)
    r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 3, 0)
    r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 4, 0)
    r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 5, 0)
    r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 7, 0)
    for r6_598 = 1, g_NmsSLDataMax, 1 do
      local r7_598 = 1
      local r8_598 = "NmsSLTime" .. tostring(r6_598)
      r1_598:insertTextLayer("NmsSLMenu", r8_598, 220, 30, 16, 0, 0, 0, 0, 1)
      local r9_598 = 0
      local r10_598 = 0
      r9_598, r10_598, r11_598, r12_598 = r1_598:getSubLayerParam("NmsSLMenu", "NmsSLBace00", r7_598, LUA_PARAM_POS, r9_598, r10_598, 0, 0)
      r1_598:setParam("NmsSLMenu", r8_598, LUA_PARAM_POS, r9_598 + 228 * (r6_598 - 1) % 4, r10_598 + 211 * math.floor((r6_598 - 1) / 4), 0, 0)
      local r15_598 = "SaveLoad" .. tostring(r6_598)
      local r16_598 = r6_598
      local r17_598 = -1
      local r18_598 = -1
      local r19_598 = -1
      if r0_598.SaveLoadFlag == 0 then
        r17_598 = 22 + r6_598 - 1
        r18_598 = 12 + r6_598 - 1
      else
        r17_598 = 78 + r6_598 - 1
        r18_598 = 68 + r6_598 - 1
        r19_598 = 58 + r6_598 - 1
      end
      r0_598:MenuButtonSet(r0_598.MenuButtonData, r15_598, 1, "NmsSLBace00", r17_598, r17_598, r18_598, -1, r19_598, r16_598, 0, 1)
      r15_598 = "Data" .. tostring(r6_598)
      lay = 18 * (r6_598 - 1) + 64
      if r0_598.SaveLoadFlag == 0 then
        r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", 33 + r6_598 - 1, 1)
      else
        r17_598 = 100 + r6_598 - 1
        r19_598 = 90 + r6_598 - 1
        r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", r17_598, 0)
        r1_598:initSubLayer("NmsSLMenu", "NmsSLBace00", r19_598, 0)
        if g_NmsSLData[r6_598].Param > 0 then
          r1_598:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_598, 1)
          r1_598:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r19_598, 0)
        else
          r1_598:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_598, 0)
          r1_598:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r19_598, 1)
        end
      end
      r0_598:MakeDataTh(r6_598)
    end
    if r0_598.SaveLoadFlag == 0 then
      r0_598:MenuButtonSet(r0_598.MenuButtonData, "RETURN", 0, "NmsSLBace00", 44, 44, 43, -1, -1, 999, 0, 0)
    else
      r0_598:MenuButtonSet(r0_598.MenuButtonData, "RETURN", 0, "NmsSLBace00", 112, 112, 111, -1, -1, 999, 0, 0)
    end
    r0_598.MenuButton:SetList("MenuButtonData", r0_598.MenuButtonData)
    r0_598:MenuButtonInit()
    if r0_598.SaveLoadFlag == 0 then
      r0_598.DispSave.Act = g_NmsData.Act
      r0_598.DispSave.List = {
        unpack(g_NmsData.List)
      }
      r0_598.DispSave.Param = g_NmsData.Param
      r0_598.DispSave.Slide = g_NmsData.Slide
    elseif 1 <= r0_598.DataActNo and r0_598.DataActNo <= 6 then
      r0_598.DispSave.Act = g_NmsSLData[r0_598.DataActNo].Act
      r0_598.DispSave.List = {
        unpack(g_NmsSLData[r0_598.DataActNo].List)
      }
      r0_598.DispSave.Param = g_NmsSLData[r0_598.DataActNo].Param
      r0_598.DispSave.Slide = g_NmsSLData[r0_598.DataActNo].Slide
    else
      r0_598.DispSave.Act = -1
      r0_598.DispSave.List = -1
      r0_598.DispSave.Param = 0
      r0_598.DispSave.Slide = 0
    end
    r0_598:SetActive()
    return true
  end
  function g_Menu.NmsSaveLoad.ptr.SetActive(r0_599)
    -- line: [21036, 21066] id: 599
    for r4_599 = 1, g_NmsSLDataMax, 1 do
      local r5_599 = "SaveLoad" .. tostring(r4_599)
      if r0_599.SaveLoadFlag == 0 then
        r0_599.MenuButtonData[r5_599]:bt_SetActive(0)
      else
        if g_NmsSLData[r4_599].Param > 0 then
          r0_599.MenuButtonData[r5_599]:bt_SetActive(0)
        else
          r0_599.MenuButtonData[r5_599]:bt_SetActive(2)
        end
        local r6_599 = cclass.lua_Layers:create()
        local r7_599 = 100 + r4_599 - 1
        local r8_599 = 90 + r4_599 - 1
        if g_NmsSLData[r4_599].Param > 0 then
          r6_599:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_599, 1)
          r6_599:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_599, 0)
        else
          r6_599:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_599, 0)
          r6_599:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_599, 1)
        end
      end
    end
  end
  g_Menu.NmsSaveLoad.ptr.DispSave = {}
  g_Menu.NmsSaveLoad.ptr.DispSave.Act = -1
  g_Menu.NmsSaveLoad.ptr.DispSave.List = -1
  g_Menu.NmsSaveLoad.ptr.DispSave.Param = 0
  g_Menu.NmsSaveLoad.ptr.DispSave.Slide = 0
  local r2_590 = g_Menu.NmsSaveLoad.ptr:InitNmsSL()
  if res == false then
    return false
  end
  g_Menu.NmsSaveLoad.ptr:startMenu()
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
g_Menu.NmsSaveLoad.ptrSaveNo = -1
function NmsSLMenuSave()
  -- line: [21109, 21114] id: 600
  if g_Menu.NmsSaveLoad.ptr ~= nil and 1 <= g_Menu.NmsSaveLoad.ptrSaveNo and g_Menu.NmsSaveLoad.ptrSaveNo <= g_NmsSLDataMax then
    g_Menu.NmsSaveLoad.ptr:NmsSLMenuSaveData(g_Menu.NmsSaveLoad.ptrSaveNo)
    g_Menu.NmsSaveLoad.ptr:MakeDataTh(g_Menu.NmsSaveLoad.ptrSaveNo)
  end
end
function NmsSLMenuInitSaveData()
  -- line: [21116, 21150] id: 601
  if g_NmsData.OneInit == true then
    return 
  end
  for r3_601 = 1, g_NmsSLDataMax, 1 do
    g_NmsSLData[r3_601] = {}
    g_NmsSLData[r3_601].Act = -1
    g_NmsSLData[r3_601].List = {}
    g_NmsSLData[r3_601].Param = 0
    g_NmsSLData[r3_601].ts = ""
    local r6_601 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmssave" .. tostring(r3_601) .. ".dat", "r")
    if r6_601 ~= nil then
      g_NmsSLData[r3_601].ts = r6_601:read("*l")
      g_NmsSLData[r3_601].Param = r6_601:read("*n")
      g_NmsSLData[r3_601].Act = r6_601:read("*n")
      g_NmsSLData[r3_601].Slide = r6_601:read("*n")
      for r10_601 = 1, g_NmsSLData[r3_601].Param, 1 do
        g_NmsSLData[r3_601].List[r10_601] = r6_601:read("*n")
      end
      r6_601:close()
    end
  end
end
function NmsSLMenuLoadData(r0_602)
  -- line: [21154, 21159] id: 602
  g_NmsData.Act = g_NmsSLData[r0_602].Act
  g_NmsData.List = {
    unpack(g_NmsSLData[r0_602].List)
  }
  g_NmsData.Param = g_NmsSLData[r0_602].Param
  g_NmsData.Slide = g_NmsSLData[r0_602].Slide
end
function split(r0_603, r1_603)
  -- line: [21168, 21182] id: 603
  if string.find(r0_603, r1_603) == nil then
    return {
      r0_603
    }
  end
  local r2_603 = {}
  local r4_603 = nil
  for r8_603, r9_603 in string.gfind(r0_603, "(.-)" .. r1_603 .. "()") do
    table.insert(r2_603, r8_603)
    r4_603 = r9_603
  end
  table.insert(r2_603, string.sub(r0_603, r4_603))
  return r2_603
end
function openTestMenu(r0_604, r1_604)
  -- line: [21187, 21190] id: 604
end
function openTips(r0_605, r1_605)
  -- line: [21234, 21237] id: 605
  g_MenuMsgWin:MenuInitTips(r1_605)
end
function closeTips(r0_606, r1_606)
  -- line: [21239, 21245] id: 606
  if r1_606 == 0 then
    g_MenuMsgWin:closeTips()
  else
    g_MenuMsgWin:SetTipsCloseCount(r1_606)
  end
end
function LoadTips(r0_607, r1_607)
  -- line: [21249, 21251] id: 607
  g_MenuMsgWin:MenuLoadTips()
end
function openCharSelect(r0_608, r1_608)
  -- line: [21256, 21388] id: 608
  g_Menu.CharSelect.ptr = Menu.new("CharSelect")
  function g_Menu.CharSelect.ptr.MenuEffectEndJob(r0_609)
    -- line: [21264, 21291] id: 609
    local r1_609 = cclass.lua_Layers:create()
    if r0_609.MenuInf.enabled == true then
      local r2_609 = 0
      local r3_609 = 0
      local r4_609 = cclass.lua_AutoCursor:new()
      r2_609, r3_609 = r4_609:GetCursorPos(r2_609, r3_609)
      r4_609:delete()
      r0_609.MenuButton:changeButton(r0_609.MenuInf.SetName, r1_609:getCursorPos(r0_609.MenuInf.SetName, r2_609, r3_609, 0) - 1, r2_609, r3_609)
    else
      if g_menuExecute == false then
        r1_609:removeSnap("system")
      end
      r1_609:remove(r0_609.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_609.MenuInf.ButtonLayer = ""
      r0_609.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.CharSelect.ptr.MenuButtonJob(r0_610, r1_610, r2_610)
    -- line: [21294, 21331] id: 610
    if r1_610 ~= 0 and r2_610 == "LU" then
      local r3_610 = cclass.lua_Layers:create()
      r3_610:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_610)
      r3_610:removeSnap("system")
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      r0_610:MenuEffectEnd(0)
      local r4_610 = cclass.lua_Sounds:new()
      r4_610:BgmStop("systembgm", 500)
      r4_610:delete()
      g_menuExecute = false
      r0_610.MenuInf.enabled = false
      r0_610.MenuInf.effect = true
    end
    if r2_610 == "RU" and r0_610:GetMenuMouseEnable() and r1_610 == 0 then
      r0_610:SystemSePlay("SYS02.ogg")
      local r3_610 = cclass.lua_Layers:create()
      r3_610:removeSnap("system")
      r3_610:rtSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_610.MenuInf.enabled = false
      r0_610.MenuInf.effect = true
    end
  end
  function g_Menu.CharSelect.ptr.CharSelectInit(r0_611, r1_611, r2_611)
    -- line: [21333, 21353] id: 611
    cclass.lua_Layers:create():initSubLayer("CharSelect", "CharSel01", 20, 1)
    for r7_611 = 1, 7, 1 do
      local r9_611 = 2 + r7_611 - 1
      r0_611:MenuButtonSet(r0_611.MenuButtonData, "CharSelect" .. tostring(r7_611), 0, "CharSel01", r9_611, r9_611, 11 + r7_611 - 1, -1, -1, r7_611, 0, 0)
    end
    r0_611:MenuButtonInit()
  end
  local r2_608 = g_Menu.CharSelect.ptr:MenuInit("CharSel01", "Sys_CharSelect.pna")
  if res == false then
    return false
  end
  g_Menu.CharSelect.ptr:CharSelectInit()
  local r3_608 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r3_608:setSnap("system", true)
    r3_608:copySnap("CharSelect", "system")
    g_Menu.CharSelect.ptr:MenuEffectStart(300, 0, 0)
  else
    r3_608:copySnap("CharSelect", "system")
    g_Menu.CharSelect.ptr:MenuEffectStart(300, 0, 1)
  end
  cfunc.LegacyGame__lua_SetVariable(99, -1)
  g_Menu.CharSelect.ptr.MenuInf.effect = true
  g_Menu.CharSelect.ptr.MenuInf.enabled = true
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function openSceneSelect(r0_612, r1_612)
  -- line: [21399, 21532] id: 612
  g_Menu.SceneSelect.ptr = Menu.new("SceneSelect")
  function g_Menu.SceneSelect.ptr.MenuEffectEndJob(r0_613)
    -- line: [21407, 21434] id: 613
    local r1_613 = cclass.lua_Layers:create()
    if r0_613.MenuInf.enabled == true then
      local r2_613 = 0
      local r3_613 = 0
      local r4_613 = cclass.lua_AutoCursor:new()
      r2_613, r3_613 = r4_613:GetCursorPos(r2_613, r3_613)
      r4_613:delete()
      r0_613.MenuButton:changeButton(r0_613.MenuInf.SetName, r1_613:getCursorPos(r0_613.MenuInf.SetName, r2_613, r3_613, 0) - 1, r2_613, r3_613)
    else
      if g_menuExecute == false then
        r1_613:removeSnap("system")
      end
      r1_613:remove(r0_613.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_613.MenuInf.ButtonLayer = ""
      r0_613.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.SceneSelect.ptr.MenuButtonJob(r0_614, r1_614, r2_614)
    -- line: [21437, 21474] id: 614
    if r1_614 ~= 0 and r2_614 == "LU" then
      local r3_614 = cclass.lua_Layers:create()
      r3_614:removeSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, r1_614)
      r3_614:removeSnap("system")
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      r0_614:MenuEffectEnd(0)
      local r4_614 = cclass.lua_Sounds:new()
      r4_614:BgmStop("systembgm", 500)
      r4_614:delete()
      g_menuExecute = false
      r0_614.MenuInf.enabled = false
      r0_614.MenuInf.effect = true
    end
    if r2_614 == "RU" and r0_614:GetMenuMouseEnable() and r1_614 == 0 then
      r0_614:SystemSePlay("SYS02.ogg")
      local r3_614 = cclass.lua_Layers:create()
      r3_614:removeSnap("system")
      r3_614:rtSnap("system")
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_614.MenuInf.enabled = false
      r0_614.MenuInf.effect = true
    end
  end
  function g_Menu.SceneSelect.ptr.TrialInit(r0_615, r1_615, r2_615)
    -- line: [21476, 21496] id: 615
    cclass.lua_Layers:create():initSubLayer("SceneSelect", "SceneSelect01", 18, 1)
    for r7_615 = 1, 7, 1 do
      local r9_615 = 1 + r7_615 - 1
      r0_615:MenuButtonSet(r0_615.MenuButtonData, "Scene" .. tostring(r7_615), 0, "SceneSelect01", r9_615, r9_615, 10 + r7_615 - 1, -1, -1, r7_615, 0, 0)
    end
    r0_615:MenuButtonInit()
  end
  local r2_612 = g_Menu.SceneSelect.ptr:MenuInit("SceneSelect01", "Sys_CharSelect.pna")
  if res == false then
    return false
  end
  g_Menu.SceneSelect.ptr:TrialInit()
  local r3_612 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r3_612:setSnap("system", true)
    r3_612:copySnap("SceneSelect", "system")
    g_Menu.SceneSelect.ptr:MenuEffectStart(300, 0, 0)
  else
    r3_612:copySnap("SceneSelect", "system")
    g_Menu.SceneSelect.ptr:MenuEffectStart(300, 0, 1)
  end
  g_Menu.SceneSelect.ptr.MenuInf.effect = true
  g_Menu.SceneSelect.ptr.MenuInf.enabled = true
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
