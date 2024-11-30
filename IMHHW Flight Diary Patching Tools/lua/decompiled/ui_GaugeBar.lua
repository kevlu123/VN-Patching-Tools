-- filename: 
-- version: lua53
-- line: [0, 0] id: 0
GaugeBar = {}
GaugeBar.new = function()
  -- line: [3, 92] id: 1
  local r0_1 = nil
  r0_1.dataList = {}
  function r0_1.GaugeBarCreate(r0_2, r1_2, r2_2, r3_2, r4_2, r5_2)
    -- line: [8, 69] id: 2
    return {
      set = r1_2,
      key = r2_2,
      hit = r3_2,
      lay = r4_2,
      max = r5_2,
      param = 0,
      LD = false,
      GaugeInit = function(r0_3)
        -- line: [20, 37] id: 3
        local r1_3 = cclass.lua_Layers:create()
        r1_3:initSubLayer(r0_3.set, r0_3.key, r0_3.hit, 1)
        r1_3:initSubLayer(r0_3.set, r0_3.key, r0_3.lay, 1)
        r1_3:setSubLayerParam(r0_3.set, r0_3.key, r0_3.hit, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r1_3:setSubLayerHitTest(r0_3.set, r0_3.key, r0_3.hit, 1, 0.01)
        local r2_3 = 0
        local r3_3 = 0
        local r4_3 = 0
        local r5_3 = 0
        r2_3, r3_3, r4_3, r5_3 = r1_3:getSubLayerParam(r0_3.set, r0_3.key, r0_3.lay, LUA_PARAM_POS, r2_3, r3_3, r4_3, r5_3)
        r0_3.Pos_x = r2_3
        r0_3.Pos_y = r3_3
        r2_3, r3_3, r4_3, r5_3 = r1_3:getSubLayerParam(r0_3.set, r0_3.key, r0_3.lay, LUA_PARAM_SIZE, r2_3, r3_3, r4_3, r5_3)
        r0_3.Size_w = r2_3
        r0_3.Size_h = r3_3
      end,
      GaugeSetParam = function(r0_4, r1_4)
        -- line: [40, 45] id: 4
        r0_4.param = r1_4
        cclass.lua_Layers:create():setSubLayerParam(r0_4.set, r0_4.key, r0_4.lay, LUA_PARAM_RECT, 0, 0, r0_4.Size_w * r0_4.param / r0_4.max, r0_4.Size_h)
      end,
      GaugeLD = function(r0_5, r1_5, r2_5, r3_5, r4_5, r5_5)
        -- line: [48, 66] id: 5
        if r0_5.set == r1_5 and r2_5 == r0_5.key and r3_5 == r0_5.hit then
          local r6_5 = r4_5 - r0_5.Pos_x
          local r7_5 = r0_5.param
          if 0 <= r6_5 and r6_5 < r0_5.Size_w then
            r7_5 = r6_5 * r0_5.max / r0_5.Size_w
          elseif r6_5 < 0 then
            r7_5 = 0
          else
            r7_5 = r0_5.max
          end
          r0_5:GaugeSetParam(r7_5)
          r0_5.LD = true
          return true
        end
        return false
      end,
    }
  end
  function r0_1.SetList(r0_6, r1_6, r2_6)
    -- line: [74, 76] id: 6
    r0_6.dataList[r1_6] = r2_6
  end
  function r0_1.InitList(r0_7)
    -- line: [78, 80] id: 7
    r0_7.dataList = {}
  end
  function r0_1.InitButton(r0_8)
    -- line: [84, 88] id: 8
    for r4_8, r5_8 in pairs(r0_8.dataList) do
      r5_8:GaugeInit()
    end
  end
  return r0_1
end
