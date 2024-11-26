-- filename: 
-- version: lua53
-- line: [0, 0] id: 0
ScrollBar = {}
ScrollBar.new = function(r0_1, r1_1, r2_1, r3_1, r4_1, r5_1, r6_1)
  -- line: [5, 99] id: 1
  local r7_1 = {
    layerset = r0_1,
    layerkey = r1_1,
    layerno = r2_1,
    drug = false,
  }
  local r8_1 = {
    left = r3_1,
    top = r4_1,
    right = r3_1 + r5_1,
    bottom = r4_1 + r6_1,
  }
  r7_1.rect = r8_1
  if r5_1 < r6_1 then
    r8_1 = true or false
  else
    goto label_18	-- block#2 is visited secondly
  end
  r7_1.vertical = r8_1
  function r7_1.getNearSelect(r0_2, r1_2, r2_2, r3_2)
    -- line: [14, 44] id: 2
    local r4_2 = cclass.lua_Layers:create()
    local r5_2 = 0
    local r6_2 = 0
    r5_2, r6_2, r7_2, r8_2 = r4_2:getSubLayerParam(r0_2.layerset, r0_2.layerkey, r0_2.layerno, LUA_PARAM_SIZE, r5_2, r6_2, 0, 0)
    if r0_2.vertical == true then
      local r9_2 = r2_2 - r0_2.rect.top
      local r10_2 = r0_2.rect.bottom - r0_2.rect.top - r6_2
      if r9_2 < r6_2 / 2 then
        return 0
      elseif r10_2 < r9_2 then
        return r3_2
      end
      return math.modf(r3_2 * r9_2 / r10_2)
    else
      local r9_2 = r1_2 - r0_2.rect.left
      local r10_2 = r0_2.rect.right - r0_2.rect.left - r5_2
      if r9_2 < r5_2 / 2 then
        return 0
      elseif r10_2 < r9_2 then
        return r3_2
      end
      return math.modf(r3_2 * r9_2 / r10_2)
    end
  end
  function r7_1.onLButtonDown(r0_3, r1_3, r2_3, r3_3, r4_3, r5_3, r6_3)
    -- line: [46, 62] id: 3
    if r6_3 == true then
      return -1
    end
    if r0_3.layerno == r1_3 then
      r0_3.drug = true
    elseif r0_3.rect.left <= r2_3 and r2_3 < r0_3.rect.right and r0_3.rect.top <= r3_3 and r3_3 < r0_3.rect.bottom then
      return r0_3:getNearSelect(r2_3, r3_3, r4_3)
    end
    return -1
  end
  function r7_1.onLButtonUp(r0_4, r1_4, r2_4)
    -- line: [64, 68] id: 4
    if r0_4.drug == true then
      r0_4.drug = false
    end
  end
  function r7_1.isDrug(r0_5)
    -- line: [70, 72] id: 5
    return r0_5.drug
  end
  function r7_1.setSliderPos(r0_6, r1_6, r2_6)
    -- line: [74, 97] id: 6
    local r3_6 = cclass.lua_Layers:create()
    if r1_6 == 1 then
      r3_6:setSubLayerParam(r0_6.layerset, r0_6.layerkey, r0_6.layerno, LUA_PARAM_COLOR, 1, 1, 1, 0)
      return 
    end
    r3_6:setSubLayerParam(r0_6.layerset, r0_6.layerkey, r0_6.layerno, LUA_PARAM_COLOR, 1, 1, 1, 1)
    local r4_6 = 0
    local r5_6 = 0
    r4_6, r5_6, r6_6, r7_6 = r3_6:getSubLayerParam(r0_6.layerset, r0_6.layerkey, r0_6.layerno, LUA_PARAM_SIZE, r4_6, r5_6, 0, 0)
    local r8_6 = 0
    local r9_6 = 0
    local r10_6 = 0
    local r11_6 = 0
    r8_6, r9_6, r10_6, r11_6 = r3_6:getSubLayerParam(r0_1, r1_1, r0_6.layerno, LUA_PARAM_POS, r8_6, r9_6, r10_6, r11_6)
    if r0_6.vertical == true then
      r9_6 = math.floor(r0_6.rect.top + (r0_6.rect.bottom - r0_6.rect.top - r5_6) / (r1_6 - 1) * r2_6)
    else
      r8_6 = math.floor(r0_6.rect.left + (r0_6.rect.right - r0_6.rect.left - r4_6) / (r1_6 - 1) * r2_6)
    end
    r3_6:setSubLayerParam(r0_6.layerset, r0_6.layerkey, r0_6.layerno, LUA_PARAM_POS, r8_6, r9_6, r10_6, r11_6)
  end
  return r7_1
end
