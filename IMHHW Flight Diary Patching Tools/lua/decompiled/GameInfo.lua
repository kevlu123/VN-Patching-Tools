-- filename: 
-- version: lua53
-- line: [0, 0] id: 0
getAppInfo = function()
  -- line: [2, 5] id: 1
  return 0, 1280, 720, "IfMyHeartHadWings", "", "IF MY HEART HAD WINGS -Flight Diary-", "gameIcon.ico", 2048, 4096, 1, "MoeNovel", "IMHF"
end
getEnglishTitle = function()
  -- line: [8, 10] id: 2
  return "IF MY HEART HAD WINGS -Flight Diary-"
end
getSaveInfo = function()
  -- line: [12, 15] id: 3
  return 5, 5, 5, 116, 64, 2, true
end
bin_xor = function(r0_4, r1_4)
  -- line: [18, 38] id: 4
  local r2_4 = 0
  for r6_4 = 0, 31, 1 do
    if r0_4 % 2 == 0 then
      if r1_4 % 2 == 1 then
        r1_4 = r1_4 - 1
        r2_4 = r2_4 + 2 ^ r6_4
      end
    else
      r0_4 = r0_4 - 1
      if r1_4 % 2 == 0 then
        r2_4 = r2_4 + 2 ^ r6_4
      else
        r1_4 = r1_4 - 1
      end
    end
    r1_4 = r1_4 / 2
    r0_4 = r0_4 / 2
  end
  return r2_4
end
getHostInfo = function()
  -- line: [40, 59] id: 5
  local r0_5 = 21
  local r1_5 = 62
  local r2_5 = {
    112,
    155,
    96,
    109,
    182,
    121,
    108,
    104,
    150,
    73,
    211,
    228,
    112,
    207,
    184,
    249
  }
  local r3_5 = "{"
  for r7_5 = 1, #r2_5, 1 do
    r3_5 = r3_5 .. string.format("%02x", (r2_5[r7_5] ~ r0_5))
    if r7_5 == 4 or r7_5 == 6 or r7_5 == 8 or r7_5 == 10 then
      r3_5 = r3_5 .. "-"
    end
  end
  return "", "", string.upper(r3_5 .. "}"), r1_5
end
