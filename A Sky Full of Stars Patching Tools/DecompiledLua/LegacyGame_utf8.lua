-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
g_fonts = {
  name = "Tahoma",
  file = nil,
  CharSet = SHIFTJIS_CHARSET,
}
g_fonts2 = {
  name = "FOT-ロダン Pro DB",
  file = "FOT-RodinPro-DB.PTF",
  CharSet = SHIFTJIS_CHARSET,
}
g_fontSize = {
  MsgSize = 16,
  NameSize = 16,
  LogSize = 16,
  selectSize = 16,
  inputSize = 12,
}
g_fontSize2 = {
  MsgSize = 11,
  NameSize = 11,
  LogSize = 11,
  selectSize = 11,
  inputSize = 12,
}
g_exampleName = "名字样品"
g_exampleText = "表示速度的样品\\n诸位你好\n一二三四五六七八九"
g_EexampleName = "Name"
g_EexampleText = "This is sample text.\nText will display at this speed.\n123456789 ABCDE!?"
g_selectTextPos = {
  add_x = 0,
  add_y = 0,
}
g_selectTextPos2 = {
  add_x = 0,
  add_y = 0,
}
g_AnketoURL = nil
g_Savefonts = {
  name = "Tahoma",
  size = 10,
  timesize = 8,
  nosize = 10,
}
g_Savefonts2 = {
  name = "MS UI Gothic",
  size = 10,
  timesize = 8,
  nosize = 10,
}
function SaveDataLabelTxt(r0_1, r1_1)
  -- line: [43, 55] id: 1
  local r2_1 = ""
  if r0_1 == g_DATAPAGEMAX then
    if r1_1 < 6 then
      r2_1 = " AUTO." .. tostring(r1_1) .. " "
    else
      r2_1 = "QUICK." .. tostring(r1_1 - 5)
    end
  else
    r2_1 = string.format("%03d", (r0_1 - 1) * 10 + r1_1) .. "  "
  end
  return r2_1
end
g_saveComment = ""
g_NmsFonts = {
  name = "MS UI Gothic",
  size = 14,
}
g_nmsTitleList = {}
