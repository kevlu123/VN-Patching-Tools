-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
function getRioArcFileName(r0_1)
  -- line: [3, 20] id: 1
  if string.lower(string.sub(r0_1, 1, 8)) == "mainmenu" then
    return "Rio.arc"
  end
  if string.lower(string.sub(r0_1, 1, 8)) == "mainpart" then
    return "Rio.arc"
  end
  return "Rio.arc"
end
function getGraphicsArcFileName(r0_2, r1_2)
  -- line: [24, 156] id: 2
  local r6_2 = cfunc.LegacyGame__lua_GetFlag(1005)
  if string.lower(string.sub(r1_2, 1, 4)) == "sys_" then
    return "SysGraphic.arc"
  end
  if string.lower(string.sub(r1_2, 1, 5)) == "efmsk" then
    return "Graphic.arc"
  end
  if string.lower(string.sub(r1_2, 1, 5)) == "layer" then
    return "Graphic.arc"
  end
  if string.lower(string.sub(r1_2, 1, 6)) == "cutin_" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 6)) == "hoshi_" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 6)) == "appli_" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 2)) == "bg" then
    if string.lower(string.sub(r1_2, -6)) == "_l.png" then
      return "Chip1A.arc"
    end
    return "Chip1.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "sky" then
    return "Chip1.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "com_" then
    return "Chip3.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "hik_" then
    return "Chip3.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "kor_" then
    return "Chip3A.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "ori_" then
    return "Chip3A.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "say_" then
    return "Chip3B.arc"
  end
  if string.lower(string.sub(r1_2, 1, 5)) == "sdev_" then
    return "Chip4.arc"
  end
  if string.lower(string.sub(r1_2, 1, 2)) == "ef" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "est" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 2)) == "im" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 5)) == "noise" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "hand" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "fall" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 5)) == "grass" then
    return "Chip2.arc"
  end
  return "Graphic.arc"
end
function getModelArcFileName(r0_3, r1_3)
  -- line: [158, 160] id: 3
  return "Model.arc"
end
function getSoundArcFileName(r0_4, r1_4)
  -- line: [163, 231] id: 4
  local r4_4 = {
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
  local r2_4 = nil	-- notice: implicit variable refs by block#[1, 4, 10, 12, 14]
  for r8_4, r9_4 in pairs(r4_4) do
    local r10_4 = r9_4 .. "SysVoice"
    local r12_4 = string.lower(r0_4)
    r2_4, r3_4 = string.find(r12_4, string.lower(r10_4))
    if r2_4 ~= nil then
      local r11_4 = "SysVoice.arc"
      return r11_4
    end
  end
  r2_4, r3_4 = string.find(string.lower(r0_4), "char")
  if r2_4 ~= nil then
    s = string.sub(r1_4, 1, 4)
    if string.lower(s) == "ori_" then
      return "Voice1.arc"
    end
    s = string.sub(r1_4, 1, 5)
    if string.lower(s) == "saya_" then
      return "Voice1.arc"
    end
    return "Voice.arc"
  end
  r2_4, r3_4 = string.find(string.lower(r0_4), "bgv")
  if r2_4 ~= nil then
    return "Se.arc"
  end
  r2_4, r3_4 = string.find(string.lower(r0_4), "bgm")
  if r2_4 ~= nil then
    return "Bgm.arc"
  end
  r2_4, r3_4 = string.find(string.lower(r0_4), "systemvoice")
  if r2_4 ~= nil then
    return "SysVoice.arc"
  end
  return "Se.arc"
end
