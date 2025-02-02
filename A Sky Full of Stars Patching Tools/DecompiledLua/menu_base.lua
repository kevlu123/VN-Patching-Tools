-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
Menu = {}
function Menu.new(r0_1)
  -- line: [5, 335] id: 1
  local r1_1 = {
    MenuInf = {},
  }
  r1_1.MenuInf.enabled = false
  r1_1.MenuInf.effect = false
  r1_1.MenuInf.SetName = r0_1
  r1_1.MenuInf.ButtonLayer = ""
  r1_1.MenuInf.ButtonPna = ""
  r1_1.MenuButton = nil
  r1_1.MenuButtonData = {}
  function r1_1.MenuEffect(r0_2)
    -- line: [24, 33] id: 2
    local r1_2 = false
    r1_2 = r0_2:MenuEffectTransJob()
    if r0_2.MenuInf.effect == true and r1_2 == false then
      r0_2:MenuEffectEndJob()
      r0_2.MenuInf.effect = false
    end
    return r1_2
  end
  function r1_1.MenuEffectTransJob(r0_3)
    -- line: [38, 47] id: 3
    local r1_3 = cclass.lua_Layers:create()
    if r0_3.MenuInf.enabled == true then
      return r1_3:isTransition(r0_3.MenuInf.SetName)
    else
      return r1_3:isTransition(r0_3.MenuInf.SetName)
    end
  end
  function r1_1.MenuEffectEndJob(r0_4)
    -- line: [49, 76] id: 4
    local r1_4 = cclass.lua_Layers:create()
    if r0_4.MenuInf.enabled == true then
      local r2_4 = 0
      local r3_4 = 0
      local r4_4 = cclass.lua_AutoCursor:new()
      r2_4, r3_4 = r4_4:GetCursorPos(r2_4, r3_4)
      r4_4:delete()
      r0_4.MenuButton:changeButton(r0_4.MenuInf.SetName, r1_4:getCursorPos(r0_4.MenuInf.SetName, r2_4, r3_4, 0) - 1, r2_4, r3_4)
    else
      if g_menuExecute == false then
        r1_4:removeSnap("system")
      end
      r1_4:remove(r0_4.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_4.MenuInf.ButtonLayer = ""
      r0_4.MenuInf.ButtonPna = ""
    end
  end
  function r1_1.MenuEffectStart(r0_5, r1_5, r2_5)
    -- line: [78, 85] id: 5
    local r3_5 = cclass.lua_Layers:create()
    local r4_5 = cclass.lua_MeasureTime:new()
    local r5_5 = getEffectRate()
    r3_5:startTransition(r0_5.MenuInf.SetName, 0, 1, r1_5 * r5_5, r2_5 * r4_5:diff() * r5_5, LUA_TRANSITION_NORMAL)
    r4_5:delete()
  end
  function r1_1.MenuEffectEnd(r0_6, r1_6)
    -- line: [87, 95] id: 6
    local r2_6 = cclass.lua_Layers:create()
    local r3_6 = getEffectRate()
    r2_6:setSnap(r0_6.MenuInf.SetName, false)
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_RTSNAP, 0)
    r2_6:startTransition(r0_6.MenuInf.SetName, 0, 1, r1_6 * r3_6, 0, LUA_TRANSITION_ERASE)
  end
  function r1_1.MenuEffectToMenu(r0_7, r1_7)
    -- line: [97, 105] id: 7
    local r2_7 = cclass.lua_Layers:create()
    r2_7:removeSnap("system")
    r2_7:rtSnap("system")
    local r3_7 = getEffectRate()
    r2_7:setSnap(r0_7.MenuInf.SetName, false)
    r2_7:startTransition(r0_7.MenuInf.SetName, 0, 1, r1_7 * r3_7, 0, LUA_TRANSITION_ERASE)
  end
  function r1_1.MenuInit(r0_8, r1_8, r2_8)
    -- line: [110, 132] id: 8
    local r3_8 = true
    r0_8.MenuInf.enabled = false
    r0_8.MenuInf.effect = false
    r0_8.MenuInf.ButtonLayer = r1_8
    r0_8.MenuInf.ButtonPna = r2_8
    if cclass.lua_Layers:create():add(r0_8.MenuInf.SetName) == false then
      return false
    end
    r0_8:MenuLoadLayer(r1_8, r2_8)
    r0_8.MenuButton = Button.new(r0_8.MenuInf.SetName)
    r0_8.MenuButton:InitList()
    r0_8.MenuButtonData = {}
    return r3_8
  end
  function r1_1.MenuLoadLayer(r0_9, r1_9, r2_9)
    -- line: [135, 145] id: 9
    local r3_9 = cclass.lua_Layers:create()
    local r4_9 = getGraphicsArcFileName(r0_9.MenuInf.SetName, r2_9)
    local r5_9 = false
    if string.lower(string.sub(r2_9, -4)) == ".pna" then
      r5_9 = r3_9:insertLayer(r0_9.MenuInf.SetName, r1_9, LUA_LAYER_PNA, r4_9, r2_9, 1)
    else
      r5_9 = r3_9:insertLayer(r0_9.MenuInf.SetName, r1_9, LUA_LAYER_STD, r4_9, r2_9, 1)
    end
    return r5_9
  end
  function r1_1.MenuButtonInit(r0_10)
    -- line: [150, 156] id: 10
    if r0_10.MenuButton ~= nil then
      r0_10.MenuButton:SetList("MenuButtonData", r0_10.MenuButtonData)
      r0_10.MenuButton:InitButton()
    end
  end
  function r1_1.MenuButtonSet(r0_11, r1_11, r2_11, r3_11, r4_11, r5_11, r6_11, r7_11, r8_11, r9_11, r10_11, r11_11, r12_11)
    -- line: [159, 161] id: 11
    r1_11[r2_11] = r0_11.MenuButton:ButtonCreate(r2_11, r3_11, r4_11, r5_11, r6_11, r7_11, r8_11, r9_11, r10_11, r11_11, g_SysSEName.cursor, g_SysSEName.ok, r12_11)
  end
  function r1_1.MenuMoveButtonSet(r0_12, r1_12, r2_12, r3_12, r4_12, r5_12, r6_12, r7_12, r8_12, r9_12, r10_12, r11_12, r12_12)
    -- line: [164, 168] id: 12
    r1_12[r2_12] = r0_12.MenuButton:Movable(r0_12.MenuButton:ButtonCreate(r2_12, r3_12, r4_12, r5_12, r6_12, r7_12, r8_12, r9_12, r10_12, r11_12, g_SysSEName.cursor, g_SysSEName.ok, r12_12))
  end
  function r1_1.MenuAnimButtonSet(r0_13, r1_13, r2_13, r3_13, r4_13, r5_13, r6_13, r7_13, r8_13, r9_13, r10_13, r11_13, r12_13, r13_13)
    -- line: [171, 175] id: 13
    r2_13[r3_13] = r0_13.MenuButton:Animatable(r1_13, r0_13.MenuButton:ButtonCreate(r3_13, r4_13, r5_13, r6_13, r7_13, r8_13, r9_13, r10_13, r11_13, r12_13, g_SysSEName.cursor, g_SysSEName.ok, r13_13))
  end
  function r1_1.SystemSePlay(r0_14, r1_14)
    -- line: [180, 184] id: 14
    local r2_14 = cclass.lua_Sounds:new()
    r2_14:SndPlay("systemse", getSoundArcFileName("systemse", r1_14), r1_14, getSoundVolume("systemse"))
    r2_14:delete()
  end
  function r1_1.MenuButtonJobFocus(r0_15, r1_15, r2_15, r3_15, r4_15, r5_15, r6_15, r7_15)
    -- line: [187, 189] id: 15
    r0_15:MenuButtonJobPos(r1_15, r2_15, r6_15, r7_15)
  end
  function r1_1.MenuButtonJobPos(r0_16, r1_16, r2_16, r3_16, r4_16)
    -- line: [191, 193] id: 16
    r0_16:MenuButtonJob(r1_16, r2_16)
  end
  function r1_1.MenuButtonJob(r0_17, r1_17, r2_17)
    -- line: [194, 201] id: 17
  end
  function r1_1.MenuButtonJobPosRepeat(r0_18, r1_18, r2_18, r3_18, r4_18, r5_18, r6_18, r7_18)
    -- line: [202, 204] id: 18
  end
  function r1_1.GetMenuActive(r0_19)
    -- line: [207, 213] id: 19
    local r1_19 = false
    if r0_19.MenuInf.enabled == true or r0_19.MenuInf.effect == true then
      r1_19 = true
    end
    return r1_19
  end
  function r1_1.GetMenuMouseEnable(r0_20)
    -- line: [216, 222] id: 20
    local r1_20 = false
    if r0_20.MenuInf.enabled == true and r0_20.MenuInf.effect == false and r0_20.MenuButton ~= nil then
      r1_20 = true
    end
    return r1_20
  end
  function r1_1.MenuMouseMove(r0_21, r1_21, r2_21, r3_21, r4_21, r5_21, r6_21)
    -- line: [226, 235] id: 21
    if r6_21 == true then
      return 
    end
    if r0_21:GetMenuMouseEnable() then
      r0_21.MenuButton:mouseMove(r2_21, r3_21, r4_21, r5_21)
    end
  end
  function r1_1.MenuLButtonDown(r0_22, r1_22, r2_22, r3_22, r4_22, r5_22, r6_22)
    -- line: [239, 252] id: 22
    local r7_22 = 0
    r0_22:MenuButtonJobPosRepeat(r7_22, "LD", r1_22, r2_22, r3_22, r4_22, r5_22)
    if r6_22 == true then
      return r7_22
    end
    if r0_22:GetMenuMouseEnable() then
      r7_22 = r0_22.MenuButton:mouseLdown(r2_22, r3_22, r4_22, r5_22, r6_22)
    end
    r0_22:MenuButtonJobFocus(r7_22, "LD", r1_22, r2_22, r3_22, r4_22, r5_22)
    return r7_22
  end
  function r1_1.MenuLButtonUp(r0_23, r1_23, r2_23, r3_23, r4_23, r5_23, r6_23)
    -- line: [256, 269] id: 23
    local r7_23 = 0
    r0_23:MenuButtonJobPosRepeat(r7_23, "LU", r1_23, r2_23, r3_23, r4_23, r5_23)
    if r6_23 == true then
      return r7_23
    end
    if r0_23:GetMenuMouseEnable() then
      r7_23 = r0_23.MenuButton:mouseLup(r2_23, r3_23, r4_23, r5_23, r6_23)
    end
    r0_23:MenuButtonJobFocus(r7_23, "LU", r1_23, r2_23, r3_23, r4_23, r5_23)
    return r7_23
  end
  function r1_1.MenuRButtonDown(r0_24, r1_24, r2_24, r3_24, r4_24, r5_24, r6_24)
    -- line: [273, 286] id: 24
    local r7_24 = 0
    r0_24:MenuButtonJobPosRepeat(r7_24, "RD", r1_24, r2_24, r3_24, r4_24, r5_24)
    if r6_24 == true then
      return r7_24
    end
    if r0_24:GetMenuMouseEnable() then
      r7_24 = r0_24.MenuButton:mouseRdown(r2_24, r3_24, r4_24, r5_24, r6_24)
    end
    r0_24:MenuButtonJobFocus(r7_24, "RD", r1_24, r2_24, r3_24, r4_24, r5_24)
    return r7_24
  end
  function r1_1.MenuRButtonUp(r0_25, r1_25, r2_25, r3_25, r4_25, r5_25, r6_25)
    -- line: [290, 303] id: 25
    local r7_25 = 0
    r0_25:MenuButtonJobPosRepeat(r7_25, "RU", r1_25, r2_25, r3_25, r4_25, r5_25)
    if r6_25 == true then
      return r7_25
    end
    if r0_25:GetMenuMouseEnable() then
      r7_25 = r0_25.MenuButton:mouseRup(r2_25, r3_25, r4_25, r5_25, r6_25)
    end
    r0_25:MenuButtonJobFocus(r7_25, "RU", r1_25, r2_25, r3_25, r4_25, r5_25)
    return r7_25
  end
  function r1_1.MenuMButtonDown(r0_26, r1_26, r2_26, r3_26, r4_26, r5_26, r6_26)
    -- line: [306, 307] id: 26
  end
  function r1_1.MenuMButtonUp(r0_27, r1_27, r2_27, r3_27, r4_27, r5_27, r6_27)
    -- line: [310, 311] id: 27
  end
  function r1_1.MenuX1ButtonDown(r0_28, r1_28, r2_28, r3_28, r4_28, r5_28, r6_28)
    -- line: [313, 314] id: 28
  end
  function r1_1.MenuX1ButtonUp(r0_29, r1_29, r2_29, r3_29, r4_29, r5_29, r6_29)
    -- line: [316, 317] id: 29
  end
  function r1_1.MenuX2ButtonDown(r0_30, r1_30, r2_30, r3_30, r4_30, r5_30, r6_30)
    -- line: [319, 320] id: 30
  end
  function r1_1.MenuX2ButtonUp(r0_31, r1_31, r2_31, r3_31, r4_31, r5_31, r6_31)
    -- line: [322, 323] id: 31
  end
  function r1_1.MenuMouseWheel(r0_32, r1_32, r2_32)
    -- line: [327, 328] id: 32
  end
  function r1_1.MenuKeyDown(r0_33, r1_33, r2_33, r3_33, r4_33)
    -- line: [331, 332] id: 33
  end
  return r1_1
end
MenuItem = {}
function MenuItem.new(r0_34, r1_34, r2_34, r3_34)
  -- line: [342, 424] id: 34
  local r4_34 = {
    layerset = r0_34,
    layerkey = r1_34,
    Layer = {},
    actKey = -2,
    addLayer = function(r0_35, r1_35, r2_35)
      -- line: [353, 366] id: 35
      local r3_35 = 0
      local r4_35 = 0
      local r5_35 = 0
      local r6_35 = 0
      local r7_35 = 0
      local r8_35 = 0
      local r9_35 = 0
      local r10_35 = 0
      if r2_35 >= 0 then
        local r11_35 = cclass.lua_Layers:create()
        r11_35:initSubLayer(r0_35.layerset, r0_35.layerkey, r2_35, 1)
        r3_35, r4_35, r5_35, r6_35 = r11_35:getSubLayerParam(r0_35.layerset, r0_35.layerkey, r2_35, LUA_PARAM_COLOR, r3_35, r4_35, r5_35, r6_35)
        r7_35, r8_35, r9_35, r10_35 = r11_35:getSubLayerParam(r0_35.layerset, r0_35.layerkey, r2_35, LUA_PARAM_POS, r7_35, r8_35, r9_35, r10_35)
      end
      r0_35.Layer[r1_35] = {
        no = r2_35,
        x = r7_35,
        y = r8_35,
        r = r3_35,
        g = r4_35,
        b = r5_35,
        a = r6_35,
      }
    end,
  }
  r4_34:addLayer("def", r2_34)
  r4_34:addLayer("on", r3_34)
  function r4_34.SetAct(r0_36, r1_36)
    -- line: [376, 395] id: 36
    if r0_36.actKey == r1_36 then
      return 
    end
    local r2_36 = cclass.lua_Layers:create()
    for r6_36, r7_36 in pairs(r0_36.Layer) do
      if r7_36.no ~= -1 then
        if r6_36 == r1_36 then
          r2_36:setSubLayerParam(r0_36.layerset, r0_36.layerkey, r7_36.no, LUA_PARAM_COLOR, r7_36.r, r7_36.g, r7_36.b, r7_36.a)
        else
          r2_36:setSubLayerParam(r0_36.layerset, r0_36.layerkey, r7_36.no, LUA_PARAM_COLOR, 0, 0, 0, 0)
        end
      end
    end
    r0_36.actKey = r1_36
  end
  function r4_34.ReSet(r0_37)
    -- line: [398, 407] id: 37
    local r1_37 = cclass.lua_Layers:create()
    for r5_37, r6_37 in pairs(r0_37.Layer) do
      if r6_37.no ~= -1 then
        r1_37:setSubLayerParam(r0_37.layerset, r0_37.layerkey, r6_37.no, LUA_PARAM_COLOR, r6_37.r, r6_37.g, r6_37.b, r6_37.a)
      end
    end
    r0_37.actKey = -2
  end
  function r4_34.SetPos(r0_38, r1_38, r2_38, r3_38)
    -- line: [410, 419] id: 38
    local r4_38 = cclass.lua_Layers:create()
    for r8_38, r9_38 in pairs(r0_38.Layer) do
      r9_38.movex = r2_38 + r9_38.x - r0_38.Layer[r1_38].x
      r9_38.movey = r3_38 + r9_38.y - r0_38.Layer[r1_38].y
      r4_38:setSubLayerParam(r0_38.layerset, r0_38.layerkey, r9_38.no, LUA_PARAM_POS, math.floor(r9_38.movex), math.floor(r9_38.movey), 0, 0)
    end
  end
  r4_34:SetAct("def")
  return r4_34
end
MsgMenuItem = {}
function MsgMenuItem.new(r0_39, r1_39, r2_39, r3_39, r4_39)
  -- line: [428, 436] id: 39
  local r5_39 = {}
  r5_39 = MenuItem.new(r0_39, r1_39, r2_39, r3_39)
  r5_39:addLayer("dis", r4_39)
  r5_39:SetAct("def")
  return r5_39
end
