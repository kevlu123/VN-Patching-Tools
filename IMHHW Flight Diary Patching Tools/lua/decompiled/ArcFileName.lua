-- filename: 
-- version: lua53
-- line: [0, 0] id: 0
getRioArcFileName = function(r0_1)
  -- line: [3, 20] id: 1
  local r1_1 = nil
  local r2_1 = nil
  local r3_1 = nil
  if string.lower(string.sub(r0_1, 1, 8)) == "mainmenu" then
    return "Rio.arc"
  end
  if string.lower(string.sub(r0_1, 1, 8)) == "mainpart" then
    return "Rio.arc"
  end
  return "Rio.arc"
end
getGraphicsArcFileName = function(r0_2, r1_2)
  -- line: [24, 152] id: 2
  local r2_2 = getLangPatchFlag()
  local r3_2 = nil
  local r4_2 = nil
  local r5_2 = nil
  local r6_2 = nil
  if string.lower(string.sub(r1_2, 1, 4)) == "sys_" then
    return "SysGraphic.arc"
  end
  if string.lower(string.sub(r1_2, 1, 5)) == "efmsk" then
    return "Graphic.arc"
  end
  if string.lower(string.sub(r1_2, 1, 2)) == "bg" then
    return "Chip1.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "sky" then
    return "Chip1.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "csbg" then
    return "Chip1.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "age" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "com" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "hut" then
    return "Chip3.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "kot" then
    return "Chip5.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "ama" then
    return "Chip6.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "aft" then
    return "Chip7.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "bef" then
    return "Chip7.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "ags" then
    return "Chip8.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "hot" then
    return "Chip8.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "nov" then
    return "Chip8.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "hus" then
    return "Chip9.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "kan" then
    return "Chip9.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "csev" then
    return "Chip10.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "sdev" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 4)) == "fdsd" then
    return "Chip2.arc"
  end
  if string.lower(string.sub(r1_2, 1, 2)) == "an" then
    return "Chip4.arc"
  end
  if string.lower(string.sub(r1_2, 1, 2)) == "ef" then
    return "Chip4.arc"
  end
  if string.lower(string.sub(r1_2, 1, 3)) == "est" then
    return "Chip4.arc"
  end
  if string.lower(string.sub(r1_2, 1, 2)) == "im" then
    return "Chip4.arc"
  end
  return "Graphic.arc"
end
getModelArcFileName = function(r0_3, r1_3)
  -- line: [155, 158] id: 3
  return "Model1.arc"
end
getSoundArcFileName = function(r0_4, r1_4)
  -- line: [161, 200] id: 4
  local r2_4 = nil
  local r3_4 = nil
  for r8_4, r9_4 in pairs({}) do
    r2_4, r3_4 = string.find(string.lower(r0_4), string.lower(r9_4 .. "SysVoice"))
    if r2_4 ~= nil then
      return "SysVoice.arc"
    end
  end
  r2_4, r3_4 = string.find(string.lower(r0_4), "char")
  if r2_4 ~= nil then
    return "Voice.arc"
  end
  r2_4, r3_4 = string.find(string.lower(r0_4), "bgv")
  if r2_4 ~= nil then
    return "Voice.arc"
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
