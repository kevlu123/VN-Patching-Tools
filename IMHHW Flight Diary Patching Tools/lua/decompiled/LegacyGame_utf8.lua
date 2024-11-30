-- filename: 
-- version: lua53
-- line: [0, 0] id: 0
g_fonts0 = {
  name = "Tahoma",
  file = nil,
  CharSet = SHIFTJIS_CHARSET,
}
g_fonts1 = {
  name = "Noto Sans CJK SC Regular",
  file = "NotoSansCJKsc-Regular.PTF",
  CharSet = GB2312_CHARSET,
}
g_fonts2 = {
  name = "MS UI Gothic",
  file = nil,
  CharSet = SHIFTJIS_CHARSET,
}
g_fontSize0 = {
  MsgSize = 17,
  NameSize = 17,
  LogSize = 17,
  selectSize = 17,
  inputSize = 12,
  msw_Y = 1,
  msw_R = 1,
}
g_fontSize1 = {
  MsgSize = 17,
  NameSize = 17,
  LogSize = 17,
  selectSize = 17,
  inputSize = 12,
  msw_Y = 1,
  msw_R = 1,
}
g_fontSize2 = {
  MsgSize = 17,
  NameSize = 17,
  LogSize = 17,
  selectSize = 17,
  inputSize = 12,
  msw_Y = 1,
  msw_R = 1,
}
g_exampleName0 = "Name"
g_exampleText0 = "This is sample text.\nText will display at this speed.\n123456789 ABCDE!?"
g_exampleName1 = "名字"
g_exampleText1 = "这里是示例。\\n文字显示速度大致如此。\\nAIUEO123456789汉字ABCDE！？"
g_exampleName2 = "名前サンプル"
g_exampleText2 = "表示速度のサンプル。\\nひらがな、漢字、カタカナ、\\n英数１２３ＡＢＣ"
g_selectTextPos0 = {
  add_x = 0,
  add_y = -2,
}
g_selectTextPos1 = {
  add_x = 0,
  add_y = -6,
}
g_selectTextPos2 = {
  add_x = 0,
  add_y = -4,
}
g_AnketoURL = nil
g_Savefonts0 = {
  name = "Tahoma",
  size = 10,
  timesize = 10,
  nosize = 10,
}
g_Savefonts1 = {
  name = "Noto Sans CJK SC Regular",
  size = 10,
  timesize = 10,
  nosize = 10,
}
g_Savefonts2 = {
  name = "MS UI Gothic",
  size = 10,
  timesize = 10,
  nosize = 10,
}
SaveDataLabelTxt = function(r0_1, r1_1)
  -- line: [44, 58] id: 1
  local r2_1 = ""
  if r0_1 == g_DATAPAGEMAX then
    if r1_1 < 6 then
      r2_1 = string.format("AUTO.%d", r1_1)
    else
      r2_1 = string.format("QUICK.%d", r1_1 - 5)
    end
  else
    r2_1 = string.format("%03d", (r0_1 - 1) * 10 + r1_1) .. "  "
  end
  return r2_1
end
g_saveComment = ""
SaveDataTimeTxt = function(r0_2)
  -- line: [67, 127] id: 2
  if false then
    return r0_2
  else
    local r1_2 = 0
    local r2_2 = 0
    local r3_2 = {
      "年",
      "月",
      "日",
      "月曜日",
      "火曜日",
      "水曜日",
      "木曜日",
      "金曜日",
      "土曜日",
      "日曜日",
      "午前",
      "午後"
    }
    local r4_2 = r0_2
    local r5_2 = 0
    for r9_2, r10_2 in pairs(r3_2) do
      local r12_2 = string.lower(r4_2)
      r1_2, r2_2 = string.find(r12_2, r10_2)
      if r1_2 ~= nil then
        local r11_2 = string.sub(r4_2, 1, r1_2 - 1)
        r12_2 = string.sub(r4_2, r2_2 + 1)
        r5_2 = r5_2 + 1
        if r5_2 >= 3 then
          local r13_2 = r11_2
          local r14_2 = r12_2
          r4_2 = r13_2 .. r14_2
        else
          local r13_2 = r11_2
          local r14_2 = "/"
          local r15_2 = r12_2
          r4_2 = r13_2 .. r14_2 .. r15_2
        end
      end
    end
    if false then
      r1_2 = 1
      r2_2 = 1
      r5_2 = 0
      for r9_2 = 1, 3, 1 do
        r1_2, r2_2 = string.find(string.lower(r4_2), ":", r2_2 + 1)
        if r1_2 ~= nil then
          if r5_2 + 1 >= 2 then
            r4_2 = string.sub(r4_2, 1, r1_2 - 1)
            break
          end
        else
          break
        end
      end
    end
    return r4_2
  end
end
getPKeyInfo = function()
  -- line: [129, 134] id: 3
  return "", 0, 10, 0.1
end
g_NmsFonts = {
  name = "MS UI Gothic",
  size = 14,
}
g_nmsTitleList = {}
