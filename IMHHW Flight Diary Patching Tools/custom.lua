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
    for r12_267 = 19, 25, 1 do -- NOTE: Changed 20 to 19
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
    for r22_267 = 1, 7, 1 do -- NOTE: Changed 6 to 7
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
      102, -- Added 102
      103,
      104,
      105,
      106,
      107
    }
    for r8_272 = 1, 7, 1 do -- NOTE: Changed 6 to 7
      local r10_272 = 4 + (r8_272 - 1) * 2 -- Changed 6 to 4
      r0_272:MenuButtonSet(r0_272.MenuButtonData, "SC" .. tostring(r8_272), 0, "StoryBace", r10_272, r10_272, 3 + (r8_272 - 1) * 2, -1, -1, r4_272[r8_272], 0, 0)
    end
    r0_272:MenuButtonSet(r0_272.MenuButtonData, "Return", 0, "StoryBace", 2, 2, 1, -1, -1, 99, 0, 0)
    r0_272:MenuButtonInit()
  end
  g_Menu.StoryMenu.ptr.StorySelCursor = function(r0_273, r1_273, r2_273, r3_273, r4_273)
    -- line: [8876, 8902] id: 273
    local r5_273 = cclass.lua_Layers:create()
    for r9_273 = 19, 25, 1 do -- NOTE: Changed 20 to 19
      r5_273:setSubLayerVisible("StoryMenu", "StoryBace", r9_273, 0)
    end
    if 101 <= r2_273 and r2_273 <= 107 then
      -- NOTE: Removed this if statement
      -- if r2_273 >= 103 then
      --   r2_273 = r2_273 - 1
      -- end
      r5_273:setSubLayerVisible("StoryMenu", "StoryBace", 19 + r2_273 - 100 - 1, 1) -- Changed 20 to 19
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
