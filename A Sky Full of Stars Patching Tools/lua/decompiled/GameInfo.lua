-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
function getAppInfo()
  -- line: [2, 5] id: 1
  return 0, 1280, 720, "Miagetegoran", "", "A Sky Full of Stars", "gameIcon.ico", 2048, 4096, 1, "MoeNovel", "MIAG"
end
function getEnglishTitle()
  -- line: [8, 10] id: 2
  return "A Sky Full of Stars"
end
function getSaveInfo()
  -- line: [12, 15] id: 3
  return 5, 5, 5, 140, 79, 2, 0
end
function bin_xor(r0_4, r1_4)
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
function getHostInfo()
  -- line: [40, 58] id: 5
  local r0_5 = {
    201,
    157,
    118,
    163,
    127,
    120,
    137,
    172,
    76,
    177,
    134,
    53,
    130,
    223,
    48,
    33
  }
  local r1_5 = 206
  local r2_5 = "{"
  for r6_5 = 1, #r0_5, 1 do
    r2_5 = r2_5 .. string.format("%02x", r0_5[r6_5])
    if r6_5 == 4 or r6_5 == 6 or r6_5 == 8 or r6_5 == 10 then
      r2_5 = r2_5 .. "-"
    end
  end
  return "", "", string.upper(r2_5 .. "}"), r1_5
end
