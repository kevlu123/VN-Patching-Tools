-- filename: 
-- version: lua53
-- line: [0, 0] id: 0
Button = {}
Button.new = function(r0_1)
  -- line: [6, 1393] id: 1
  local r1_1 = {
    selCursor = -1,
    selDownCursor = -1,
    sellayerset = r0_1,
    dataList = {},
    selListKey = nil,
    selDownKey = nil,
    onDropList = {},
    onDropFlag = false,
    ButtonCreate = function(r0_2, r1_2, r2_2, r3_2, r4_2, r5_2, r6_2, r7_2, r8_2, r9_2, r10_2, r11_2, r12_2, r13_2)
      -- line: [26, 28] id: 2
      return r0_2:_ButtonCreate(-1, r1_2, r2_2, r3_2, r4_2, r5_2, r6_2, r7_2, r8_2, r9_2, r10_2, r11_2, r12_2, r13_2)
    end,
    _ButtonCreate = function(r0_3, r1_3, r2_3, r3_3, r4_3, r5_3, r6_3, r7_3, r8_3, r9_3, r10_3, r11_3, r12_3, r13_3, r14_3)
      -- line: [30, 573] id: 3
      local r15_3 = {}
      if r1_3 == -1 then
        r1_3 = r1_1.sellayerset
      end
      r15_3.layerset = r1_3
      r15_3.arg = r2_3
      r15_3.EVENT_TYPE = r3_3
      r15_3.layerkey = r4_3
      r15_3.SubLayer = {}
      function r15_3.bt_addLayer(r0_4, r1_4, r2_4)
        -- line: [46, 48] id: 4
        r0_4.SubLayer[r1_4] = {
          no = r2_4,
          x = 0,
          y = 0,
          r = 0,
          g = 0,
          b = 0,
          a = 0,
        }
      end
      r15_3:bt_addLayer("hit", r5_3)
      r15_3:bt_addLayer("def", r6_3)
      r15_3:bt_addLayer("on", r7_3)
      r15_3:bt_addLayer("act", r8_3)
      r15_3:bt_addLayer("dis", r9_3)
      r15_3.bt_l = r10_3
      r15_3.bt_r = r11_3
      function r15_3.bt_getLR(r0_5)
        -- line: [61, 63] id: 5
        return r0_5.bt_l, r0_5.bt_r
      end
      r15_3.se_on = r12_3
      r15_3.se_click = r13_3
      r15_3.priority = r14_3
      r15_3.active = 0
      r15_3.focusflag = false
      r15_3.initpos = {
        x = 0,
        y = 0,
      }
      r15_3.initrect = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
      }
      r15_3.DRAW_POS = {
        x = 0,
        y = 0,
      }
      r15_3.EVENT_RECT = {
        w = 0,
        h = 0,
      }
      function r15_3.bt_GetPos(r0_6)
        -- line: [79, 81] id: 6
        return r0_6.DRAW_POS.x, r0_6.DRAW_POS.y
      end
      function r15_3.bt_GetInitPos(r0_7)
        -- line: [82, 84] id: 7
        return r0_7.initpos.x, r0_7.initpos.y
      end
      r15_3.initFlag = false
      function r15_3.bt_init(r0_8)
        -- line: [88, 149] id: 8
        if r0_8.initFlag == false then
          r0_8.initFlag = true
          local r1_8 = false
          local r2_8 = cclass.lua_Layers:create()
          if r0_8.SubLayer.hit.no ~= -1 then
            r2_8:initSubLayer(r0_8.layerset, r0_8.layerkey, r0_8.SubLayer.hit.no, 1)
          end
          for r6_8, r7_8 in pairs(r0_8.SubLayer) do
            if r7_8.no ~= -1 then
              local r8_8 = 0
              local r9_8 = 0
              local r10_8 = 0
              local r11_8 = 0
              r2_8:initSubLayer(r0_8.layerset, r0_8.layerkey, r7_8.no, 1)
              r7_8.r, r7_8.g, r7_8.b, r7_8.a = r2_8:getSubLayerParam(r0_8.layerset, r0_8.layerkey, r7_8.no, LUA_PARAM_COLOR, r8_8, r9_8, r10_8, r11_8)
              if r7_8.no == r0_8.SubLayer.hit.no then
                r7_8.x = 0
                r7_8.y = 0
                if r7_8 ~= r0_8.SubLayer.hit then
                  r1_8 = true
                end
              else
                r8_8, r9_8, r10_8, r11_8 = r2_8:getSubLayerParam(r0_8.layerset, r0_8.layerkey, r0_8.SubLayer.hit.no, LUA_PARAM_POS, r8_8, r9_8, r10_8, r11_8)
                r7_8.x = r8_8
                r7_8.y = r9_8
                r8_8, r9_8, r10_8, r11_8 = r2_8:getSubLayerParam(r0_8.layerset, r0_8.layerkey, r7_8.no, LUA_PARAM_POS, r8_8, r9_8, r10_8, r11_8)
                r7_8.x = r8_8 - r7_8.x
                r7_8.y = r9_8 - r7_8.y
              end
            end
          end
          if r1_8 == false then
            r0_8.SubLayer.hit.a = 0
            r2_8:setSubLayerParam(r0_8.layerset, r0_8.layerkey, r0_8.SubLayer.hit.no, LUA_PARAM_COLOR, 1, 1, 1, 0)
          end
          r0_8.initrect.x, r0_8.initrect.y, r0_8.initrect.w, r0_8.initrect.h = r0_8:bt_GetLayerRect(r0_8.layerkey, r0_8.SubLayer.hit.no)
          r0_8.initpos.x = r0_8.initrect.x
          r0_8.initpos.y = r0_8.initrect.y
          r0_8.DRAW_POS.x = r0_8.initrect.x
          r0_8.DRAW_POS.y = r0_8.initrect.y
          r0_8.EVENT_RECT.w = r0_8.initrect.w - r0_8.initrect.x
          r0_8.EVENT_RECT.h = r0_8.initrect.h - r0_8.initrect.y
          if r0_8.EVENT_TYPE == 0 and r0_8.SubLayer.hit.no ~= -1 then
            r2_8:setSubLayerHitTest(r0_8.layerset, r0_8.layerkey, r0_8.SubLayer.hit.no, 1, 0.01)
          end
          r0_8:bt_SetActive(0)
        end
      end
      function r15_3.bt_SetColor(r0_9, r1_9, r2_9, r3_9, r4_9)
        -- line: [152, 159] id: 9
        local r5_9 = cclass.lua_Layers:create()
        for r9_9, r10_9 in pairs(r0_9.SubLayer) do
          if r10_9.no ~= -1 then
            r5_9:setSubLayerParam(r0_9.layerset, r0_9.layerkey, r10_9.no, LUA_PARAM_COLOR, r1_9, r2_9, r3_9, r4_9)
          end
        end
      end
      function r15_3.bt_ResetColor(r0_10)
        -- line: [161, 164] id: 10
        local r1_10 = cclass.lua_Layers:create()
        r0_10:bt_SetActive(r0_10.active)
      end
      function r15_3.bt_SetOnOffActive(r0_11)
        -- line: [166, 209] id: 11
        if r0_11.active == 0 then
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.act, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.dis, false)
          if r0_11.focusflag == false then
            r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.on, false)
            r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.def, true)
          elseif r0_11.SubLayer.on.no ~= -1 then
            r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.def, false)
            r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.on, true)
          else
            r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.on, false)
            r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.def, true)
          end
        end
        if r0_11.active == 1 then
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.def, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.on, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.dis, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.act, true)
        end
        if r0_11.active == 2 then
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.def, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.on, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.act, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.dis, true)
        end
        if r0_11.active == 3 then
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.def, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.on, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.act, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.dis, false)
        end
        if r0_11.active == 4 then
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.def, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.on, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.dis, false)
          r0_11:bt_SetEnableSubLayer(r0_11.SubLayer.act, true)
        end
      end
      function r15_3.bt_GetLayerRect(r0_12, r1_12, r2_12)
        -- line: [213, 215] id: 12
        return GetLayerRect(r0_12.layerset, r1_12, r2_12)
      end
      function r15_3.bt_getNowButtonParam(r0_13)
        -- line: [218, 259] id: 13
        local r1_13 = -1
        local r2_13 = 0
        local r3_13 = nil
        local r4_13 = 0
        local r5_13 = 0
        local r6_13 = 0
        local r7_13 = 0
        local r8_13 = "def"
        if r0_13.active == 0 then
          if r0_13.focusflag == false then
            r8_13 = "def"
          else
            r8_13 = "on"
          end
        end
        if r0_13.active == 1 then
          r8_13 = "act"
        end
        if r0_13.active == 2 then
          r8_13 = "dis"
        end
        if r0_13.active == 3 then
          r8_13 = -1
        end
        if r0_13.active == 4 then
          r8_13 = "act"
        end
        if r8_13 ~= -1 then
          r1_13 = r0_13.SubLayer[r8_13].no
          r2_13 = math.floor(r0_13.DRAW_POS.x + r0_13.SubLayer[r8_13].x)
          r3_13 = math.floor(r0_13.DRAW_POS.y + r0_13.SubLayer[r8_13].y)
          r4_13 = r0_13.SubLayer[r8_13].r
          r5_13 = r0_13.SubLayer[r8_13].g
          r6_13 = r0_13.SubLayer[r8_13].b
          r7_13 = r0_13.SubLayer[r8_13].a
        end
        return r1_13, r2_13, r3_13, r4_13, r5_13, r6_13, r7_13
      end
      function r15_3.bt_getNowKey(r0_14)
        -- line: [262, 268] id: 14
        local r1_14 = -1
        local r2_14 = 0
        local r3_14 = nil
        local r4_14 = 0
        local r5_14 = 0
        local r6_14 = 0
        local r7_14 = 0
        r1_14, r2_14, r3_14, r4_14, r5_14, r6_14, r7_14 = r0_14:bt_getNowButtonParam()
        return r1_14
      end
      function r15_3.bt_getNowColor(r0_15)
        -- line: [269, 275] id: 15
        local r1_15 = -1
        local r2_15 = 0
        local r3_15 = nil
        local r4_15 = 0
        local r5_15 = 0
        local r6_15 = 0
        local r7_15 = 0
        r1_15, r2_15, r3_15, r4_15, r5_15, r6_15, r7_15 = r0_15:bt_getNowButtonParam()
        return r4_15, r5_15, r6_15, r7_15
      end
      function r15_3.bt_change(r0_16, r1_16, r2_16, r3_16, r4_16)
        -- line: [334, 429] id: 16
        local r5_16 = cclass.lua_Layers:create()
        local r6_16 = 0
        local r7_16 = r0_16.priority
        if r0_16.active == 0 or r0_16.active == 4 then
          local r8_16 = {
            def = false,
            on = false,
          }
          if r0_16.EVENT_TYPE == 0 then
            if r0_16.SubLayer.hit.no ~= -1 and r0_16.SubLayer.hit.no == r2_16 then
              r6_16 = 1
              if r0_16.focusflag == false then
                r0_16:bt_PlayAnim()
              end
              r0_16.focusflag = true
            else
              r0_16.focusflag = false
              r0_16:bt_StopAnim()
            end
          elseif r0_16.DRAW_POS.x <= r3_16 and r0_16.DRAW_POS.y <= r4_16 and r3_16 < r0_16.DRAW_POS.x + r0_16.EVENT_RECT.w and r4_16 < r0_16.DRAW_POS.y + r0_16.EVENT_RECT.h then
            r6_16 = 1
            if r0_16.focusflag == false then
              r0_16:bt_PlayAnim()
            end
            r0_16.focusflag = true
          else
            r0_16.focusflag = false
            r0_16:bt_StopAnim()
          end
          if r0_16.active == 0 then
            if r0_16.focusflag == true then
              if r0_16.SubLayer.def.no ~= -1 then
                r8_16.def = false
              end
              if r0_16.SubLayer.on.no ~= -1 then
                r8_16.on = true
              else
                r8_16.def = true
              end
              r0_16:bt_OnCursorEvent(r1_16, r2_16, r3_16, r4_16)
            else
              if r0_16.SubLayer.def.no ~= -1 then
                r8_16.def = true
              end
              if r0_16.SubLayer.on.no ~= -1 then
                r8_16.on = false
              else
                r8_16.def = true
              end
              r0_16:bt_OffCursorEvent(r1_16, r2_16, r3_16, r4_16)
            end
            if r8_16.def == true then
              r0_16:bt_SetEnableSubLayer(r0_16.SubLayer.on, r8_16.on)
              r0_16:bt_SetEnableSubLayer(r0_16.SubLayer.def, r8_16.def)
            else
              r0_16:bt_SetEnableSubLayer(r0_16.SubLayer.def, r8_16.def)
              r0_16:bt_SetEnableSubLayer(r0_16.SubLayer.on, r8_16.on)
            end
          end
        end
        return r6_16, r7_16
      end
      function r15_3.bt_OnCursorEvent(r0_17, r1_17, r2_17, r3_17, r4_17)
        -- line: [431, 432] id: 17
      end
      function r15_3.bt_OffCursorEvent(r0_18, r1_18, r2_18, r3_18, r4_18)
        -- line: [433, 434] id: 18
      end
      function r15_3.bt_SetEnableSubLayer(r0_19, r1_19, r2_19)
        -- line: [437, 449] id: 19
        if r1_19.no ~= -1 then
          local r3_19 = cclass.lua_Layers:create()
          if r2_19 == true then
            r3_19:setSubLayerParam(r0_19.layerset, r0_19.layerkey, r1_19.no, LUA_PARAM_COLOR, r1_19.r, r1_19.g, r1_19.b, r1_19.a)
          else
            r3_19:setSubLayerParam(r0_19.layerset, r0_19.layerkey, r1_19.no, LUA_PARAM_COLOR, 1, 1, 1, 0)
          end
        end
      end
      function r15_3.bt_ResetActive(r0_20)
        -- line: [452, 457] id: 20
        for r4_20, r5_20 in pairs(r0_20.SubLayer) do
          r0_20:bt_SetEnableSubLayer(r5_20, true)
        end
      end
      function r15_3.bt_SetActive(r0_21, r1_21)
        -- line: [461, 522] id: 21
        local r2_21 = cclass.lua_Layers:create()
        if r1_21 == 0 then
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.on, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.act, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.dis, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.def, true)
          if r0_21.SubLayer.hit.no ~= -1 then
            r2_21:setSubLayerHitTest(r0_21.layerset, r0_21.layerkey, r0_21.SubLayer.hit.no, 1, 0.01)
          end
        end
        if r1_21 == 1 then
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.def, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.on, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.dis, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.act, true)
          if r0_21.SubLayer.hit.no ~= -1 then
            r2_21:setSubLayerHitTest(r0_21.layerset, r0_21.layerkey, r0_21.SubLayer.hit.no, 0, 0.01)
          end
          r0_21:bt_StopAnim()
        end
        if r1_21 == 2 then
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.def, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.on, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.act, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.dis, true)
          if r0_21.SubLayer.hit.no ~= -1 then
            r2_21:setSubLayerHitTest(r0_21.layerset, r0_21.layerkey, r0_21.SubLayer.hit.no, 0, 0.01)
          end
          r0_21:bt_StopAnim()
        end
        if r1_21 == 3 then
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.def, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.on, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.act, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.dis, false)
          if r0_21.SubLayer.hit.no ~= -1 then
            r2_21:setSubLayerHitTest(r0_21.layerset, r0_21.layerkey, r0_21.SubLayer.hit.no, 0, 0.01)
          end
          r0_21:bt_StopAnim()
        end
        if r1_21 == 4 then
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.def, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.on, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.dis, false)
          r0_21:bt_SetEnableSubLayer(r0_21.SubLayer.act, true)
          if r0_21.SubLayer.hit.no ~= -1 then
            r2_21:setSubLayerHitTest(r0_21.layerset, r0_21.layerkey, r0_21.SubLayer.hit.no, 1, 0.01)
          end
          r0_21:bt_StopAnim()
        end
        r0_21.active = r1_21
      end
      function r15_3.bt_OnSePlay(r0_22)
        -- line: [526, 532] id: 22
        if r0_22.se_on ~= nil then
          local r1_22 = cclass.lua_Sounds:new()
          r1_22:SndPlay("systemse01", getSoundArcFileName("systemse", r0_22.se_on), r0_22.se_on, getSoundVolume("systemse"))
          r1_22:delete()
        end
      end
      function r15_3.bt_ClickSePlay(r0_23)
        -- line: [533, 539] id: 23
        if r0_23.se_click ~= nil then
          local r1_23 = cclass.lua_Sounds:new()
          r1_23:SndPlay("systemse02", getSoundArcFileName("systemse", r0_23.se_click), r0_23.se_click, getSoundVolume("systemse"))
          r1_23:delete()
        end
      end
      function r15_3.bt_SetPos(r0_24, r1_24, r2_24)
        -- line: [541, 552] id: 24
        r0_24.DRAW_POS.x = r1_24
        r0_24.DRAW_POS.y = r2_24
        local r3_24 = cclass.lua_Layers:create()
        for r7_24, r8_24 in pairs(r0_24.SubLayer) do
          if r8_24.no ~= -1 then
            r3_24:setSubLayerParam(r0_24.layerset, r0_24.layerkey, r8_24.no, LUA_PARAM_POS, math.floor(r1_24 + r8_24.x), math.floor(r2_24 + r8_24.y), 0, 0)
          end
        end
      end
      function r15_3.bt_SetDefPos(r0_25)
        -- line: [554, 556] id: 25
        r0_25:bt_SetPos(r0_25.initrect.x, r0_25.initrect.y)
      end
      function r15_3.bt_PlayAnim(r0_26)
        -- line: [559, 560] id: 26
      end
      function r15_3.bt_StopAnim(r0_27)
        -- line: [561, 562] id: 27
      end
      function r15_3.bt_MovableStart(r0_28, r1_28, r2_28)
        -- line: [565, 566] id: 28
      end
      function r15_3.bt_MovableControl(r0_29, r1_29, r2_29)
        -- line: [567, 569] id: 29
        return false
      end
      return r15_3
    end,
    SetList = function(r0_30, r1_30, r2_30)
      -- line: [578, 580] id: 30
      r0_30.dataList[r1_30] = r2_30
    end,
    InitList = function(r0_31)
      -- line: [582, 585] id: 31
      r0_31.dataList = {}
      r0_31.onDropList = {}
    end,
    SetDropList = function(r0_32, r1_32, r2_32)
      -- line: [587, 589] id: 32
      r0_32.onDropList[r1_32] = r2_32
    end,
    InitButton = function(r0_33)
      -- line: [595, 618] id: 33
      r0_33.selCursor = -1
      r0_33.selDownCursor = -1
      r0_33.selListKey = nil
      r0_33.selDownKey = nil
      for r4_33, r5_33 in pairs(r0_33.dataList) do
        if r5_33 ~= nil then
          for r9_33, r10_33 in pairs(r5_33) do
            r10_33:bt_init()
          end
        end
      end
      for r4_33, r5_33 in pairs(r0_33.onDropList) do
        if r5_33 ~= nil then
          for r9_33, r10_33 in pairs(r5_33) do
            r10_33:bt_init()
          end
        end
      end
    end,
    ResetButtonActive = function(r0_34, r1_34)
      -- line: [622, 626] id: 34
      for r5_34, r6_34 in pairs(r1_34) do
        r6_34:bt_ResetActive()
      end
    end,
    ResetColor = function(r0_35, r1_35)
      -- line: [632, 636] id: 35
      for r5_35, r6_35 in pairs(r1_35) do
        r6_35:bt_ResetColor()
      end
    end,
    SetColor = function(r0_36, r1_36, r2_36, r3_36, r4_36, r5_36)
      -- line: [638, 642] id: 36
      for r9_36, r10_36 in pairs(r1_36) do
        r10_36:bt_SetColor(r2_36, r3_36, r4_36, r5_36)
      end
    end,
    changeButton = function(r0_37, r1_37, r2_37, r3_37, r4_37)
      -- line: [646, 706] id: 37
      local r5_37 = 0
      local r6_37 = -2
      if r0_37.selDownCursor ~= -1 then
        r5_37, r6_37 = r0_37.selDownKey[r0_37.selDownCursor]:bt_change(r1_37, r2_37, r3_37, r4_37)
        if r5_37 ~= 0 then
          r0_37.selCursor = r0_37.selDownCursor
          r0_37.selListKey = r0_37.selDownKey
        elseif r0_37.onDropFlag == true then
          r0_37:offCursor(r0_37.dataList)
          r0_37:offCursor(r0_37.onDropList)
          local r7_37 = -1
          local r8_37 = nil
          r7_37, r8_37 = r0_37:onCursor(r0_37.onDropList, r1_37, r2_37, r3_37, r4_37)
          if r7_37 ~= -1 then
            if r0_37.selCursor ~= r7_37 then
              r8_37[r7_37]:bt_OnSePlay()
            end
            r0_37.selCursor = r7_37
            r0_37.selListKey = r8_37
          else
            r0_37.selCursor = -1
            r0_37.selListKey = nil
          end
        else
          r0_37.selCursor = -1
          r0_37.selListKey = nil
        end
      end
      if r0_37.selDownCursor == -1 then
        local r7_37 = -1
        local r8_37 = nil
        r7_37, r8_37 = r0_37:onCursor(r0_37.dataList, r1_37, r2_37, r3_37, r4_37)
        if r7_37 ~= -1 then
          if r0_37.selCursor ~= r7_37 then
            r8_37[r7_37]:bt_OnSePlay()
          end
          r0_37.selCursor = r7_37
          r0_37.selListKey = r8_37
        else
          r0_37.selCursor = -1
          r0_37.selListKey = nil
        end
      end
    end,
    onCursor = function(r0_38, r1_38, r2_38, r3_38, r4_38, r5_38)
      -- line: [710, 737] id: 38
      local r6_38 = -1
      local r7_38 = -2
      local r8_38 = nil
      for r12_38, r13_38 in pairs(r1_38) do
        if r13_38 ~= nil then
          for r17_38, r18_38 in pairs(r13_38) do
            local r19_38 = 0
            local r20_38 = -2
            r19_38, r20_38 = r18_38:bt_change(r2_38, r3_38, r4_38, r5_38)
            if r19_38 ~= 0 and r7_38 < r20_38 then
              r6_38 = r17_38
              r7_38 = r20_38
              r8_38 = r13_38
            end
          end
        end
      end
      return r6_38, r8_38
    end,
    offCursor = function(r0_39, r1_39)
      -- line: [741, 755] id: 39
      for r5_39, r6_39 in pairs(r1_39) do
        if r6_39 ~= nil then
          for r10_39, r11_39 in pairs(r6_39) do
            if r11_39.active == 0 then
              r11_39.focusflag = false
              r11_39:bt_StopAnim()
              r11_39:bt_SetEnableSubLayer(r11_39.SubLayer.on, false)
              r11_39:bt_SetEnableSubLayer(r11_39.SubLayer.def, true)
            end
          end
        end
      end
    end,
    mouseMove = function(r0_40, r1_40, r2_40, r3_40, r4_40)
      -- line: [759, 767] id: 40
      local r5_40 = false
      if r0_40.selDownCursor ~= -1 then
        r5_40 = r0_40.selDownKey[r0_40.selDownCursor]:bt_MovableControl(r3_40, r4_40)
      end
      if r5_40 == false then
        r0_40:changeButton(r1_40, r2_40, r3_40, r4_40)
      end
    end,
    mouseLdown = function(r0_41, r1_41, r2_41, r3_41, r4_41, r5_41)
      -- line: [772, 788] id: 41
      local r6_41 = 0
      if _buttonrepeat == true then
        return r6_41
      end
      r0_41:changeButton(r1_41, r2_41, r3_41, r4_41)
      if r0_41.selCursor ~= -1 then
        r0_41.selDownCursor = r0_41.selCursor
        r0_41.selDownKey = r0_41.selListKey
        r0_41.selDownKey[r0_41.selDownCursor]:bt_MovableStart(r3_41, r4_41)
        r6_41 = r0_41.selDownKey[r0_41.selDownCursor].bt_l
      end
      return r6_41
    end,
    mouseLup = function(r0_42, r1_42, r2_42, r3_42, r4_42, r5_42)
      -- line: [793, 810] id: 42
      local r6_42 = 0
      if _buttonrepeat == true then
        return r6_42
      end
      r0_42:changeButton(r1_42, r2_42, r3_42, r4_42)
      if r0_42.selCursor ~= -1 and r0_42.selCursor == r0_42.selDownCursor then
        r0_42.selDownKey[r0_42.selDownCursor]:bt_ClickSePlay()
        r6_42 = r0_42.selDownKey[r0_42.selDownCursor].bt_l
      end
      r0_42:offCursor(r0_42.onDropList)
      r0_42.selDownCursor = -1
      r0_42.selDownKey = nil
      return r6_42
    end,
    mouseRdown = function(r0_43, r1_43, r2_43, r3_43, r4_43, r5_43)
      -- line: [815, 826] id: 43
      local r6_43 = 0
      if _buttonrepeat == true then
        return r6_43
      end
      if r0_43.selDownCursor == -1 and r0_43.selCursor ~= -1 then
        r6_43 = r0_43.selListKey[r0_43.selCursor].bt_r
      end
      return r6_43
    end,
    mouseRup = function(r0_44, r1_44, r2_44, r3_44, r4_44, r5_44)
      -- line: [831, 843] id: 44
      local r6_44 = 0
      if _buttonrepeat == true then
        return r6_44
      end
      if r0_44.selDownCursor == -1 and r0_44.selCursor ~= -1 then
        r6_44 = r0_44.selListKey[r0_44.selCursor].bt_r
      end
      return r6_44
    end,
    Animatable = function(r0_45, r1_45, r2_45)
      -- line: [850, 885] id: 45
      local r3_45 = r2_45
      r3_45.anim = {
        play = false,
        name = r1_45,
      }
      function r3_45.bt_PlayAnim(r0_46)
        -- line: [854, 868] id: 46
        if r0_46.anim.name ~= -1 and r0_46.active == 0 then
          local r1_46 = cclass.lua_Layers:create()
          r0_46.anim.play = true
          if r0_46.SubLayer.on.no ~= -1 then
            r1_46:cancelSubLayerEffect(r0_46.layerset, r0_46.layerkey, r0_46.SubLayer.on.no, r0_46.anim.name)
            r1_46:setSubLayerEffect(r0_46.layerset, r0_46.layerkey, r0_46.anim.name, r0_46.SubLayer.on.no, LUA_EFFECT_SCALE, 0.1, 0.1, 0, 0, 0, 300, 0, 100)
            r1_46:setSubLayerEffect(r0_46.layerset, r0_46.layerkey, r0_46.anim.name, r0_46.SubLayer.on.no, LUA_EFFECT_SCALE, -0.1, -0.1, 0, 0, 0, 300, 0, 0)
            r1_46:startSubLayerEffect(r0_46.layerset, r0_46.layerkey, r0_46.anim.name, r0_46.SubLayer.on.no, -1)
          end
        end
      end
      function r3_45.bt_StopAnim(r0_47)
        -- line: [870, 881] id: 47
        if r0_47.anim.play == true and r0_47.anim.name ~= -1 then
          local r1_47 = cclass.lua_Layers:create()
          r0_47.anim.play = false
          if r0_47.SubLayer.on.no ~= -1 then
            r1_47:cancelSubLayerEffect(r0_47.layerset, r0_47.layerkey, r0_47.SubLayer.on.no, r0_47.anim.name)
            r1_47:setSubLayerParam(r0_47.layerset, r0_47.layerkey, r0_47.SubLayer.on.no, LUA_PARAM_SCALE, 1, 1, 1, 0)
          end
        end
      end
      return r3_45
    end,
    Movable = function(r0_48, r1_48)
      -- line: [890, 1273] id: 48
      local r2_48 = r1_48
      r2_48.MOVABLE = {
        flag = false,
        DRAGST_X = 0,
        DRAGST_Y = 0,
        BT_X = 0,
        BT_Y = 0,
        MAX_X = 0,
        MAX_Y = 0,
        PAR_X = 0,
        PAR_Y = 0,
        MIN_W = 0,
        MIN_H = 0,
        PAR_MAX_X = 0,
        PAR_MAX_Y = 0,
        PSIZE_X = 0,
        PSIZE_Y = 0,
      }
      r2_48.MOVERANGE = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
      }
      r2_48.EVRANGE = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
      }
      function r2_48.bt_SetMovableInit(r0_49, r1_49, r2_49, r3_49, r4_49, r5_49, r6_49, r7_49)
        -- line: [916, 934] id: 49
        r0_49.MOVABLE.flag = r1_49
        r0_49.MOVABLE.PAR_MAX_X = r2_49
        r0_49.MOVABLE.PAR_MAX_Y = r3_49
        r0_49.MOVABLE.PSIZE_X = r4_49
        r0_49.MOVABLE.PSIZE_Y = r5_49
        r0_49.MOVABLE.MIN_W = r6_49
        r0_49.MOVABLE.MIN_H = r7_49
        r0_49:bt_SetEventWParam(r4_49)
        r0_49:bt_SetEventHParam(r5_49)
        r0_49.MOVABLE.PAR_X = 0
        r0_49.MOVABLE.PAR_Y = 0
      end
      function r2_48.bt_SetMoveRangeRect(r0_50, r1_50, r2_50, r3_50, r4_50)
        -- line: [937, 942] id: 50
        r0_50.MOVERANGE.x = r1_50
        r0_50.MOVERANGE.y = r2_50
        r0_50.MOVERANGE.w = r3_50
        r0_50.MOVERANGE.h = r4_50
      end
      function r2_48.bt_SetMoveRangeRectLayer(r0_51, r1_51)
        -- line: [944, 951] id: 51
        cclass.lua_Layers:create():initSubLayer(r0_51.layerset, r0_51.layerkey, r1_51, 0)
        local r3_51 = 0
        local r4_51 = 0
        local r5_51 = 0
        local r6_51 = 0
        r3_51, r4_51, r5_51, r6_51 = r0_51:bt_GetLayerRect(r0_51.layerkey, r1_51)
        r0_51:bt_SetMoveRangeRect(r3_51, r4_51, r5_51, r6_51)
      end
      function r2_48.bt_GetMoveRangeRectW(r0_52)
        -- line: [954, 956] id: 52
        return r0_52.MOVERANGE.w - r0_52.MOVERANGE.x
      end
      function r2_48.bt_GetMoveRangeRectH(r0_53)
        -- line: [957, 959] id: 53
        return r0_53.MOVERANGE.h - r0_53.MOVERANGE.y
      end
      function r2_48.bt_MovableStart(r0_54, r1_54, r2_54)
        -- line: [963, 979] id: 54
        if r0_54.MOVABLE.flag == false then
          return 
        end
        r0_54.MOVABLE.DRAGST_X = r1_54
        r0_54.MOVABLE.DRAGST_Y = r2_54
        r0_54.MOVABLE.BT_X = r0_54.DRAW_POS.x
        r0_54.MOVABLE.BT_Y = r0_54.DRAW_POS.y
      end
      function r2_48.bt_MovableControl(r0_55, r1_55, r2_55)
        -- line: [981, 1013] id: 55
        if r0_55.MOVABLE.flag == false then
          return false
        end
        local r3_55 = 0
        local r4_55 = 0
        if r0_55.EVRANGE.x <= r1_55 and r1_55 < r0_55.EVRANGE.w and r0_55.EVRANGE.y <= r2_55 and r2_55 < r0_55.EVRANGE.h then
          r3_55 = r0_55.MOVABLE.BT_X + r1_55 - r0_55.MOVABLE.DRAGST_X
          r4_55 = r0_55.MOVABLE.BT_Y + r2_55 - r0_55.MOVABLE.DRAGST_Y
          r3_55, r4_55 = r0_55:bt_MovableSetRange(r3_55, r4_55)
        else
          r3_55 = r0_55.MOVABLE.BT_X
          r4_55 = r0_55.MOVABLE.BT_Y
        end
        if r0_55.DRAW_POS.x ~= r3_55 or r0_55.DRAW_POS.y ~= r4_55 then
          r0_55:bt_SetPos(r3_55, r4_55)
          r0_55:bt_MoveCalc()
        end
        return true
      end
      function r2_48.bt_MovableCorrect(r0_56)
        -- line: [1016, 1031] id: 56
        if r0_56.MOVABLE.flag == false then
          return 
        end
        local r2_56 = r0_56.MOVABLE.PSIZE_Y
        r0_56:bt_SetEventWParam(r0_56.MOVABLE.PSIZE_X)
        r0_56:bt_SetEventHParam(r2_56)
        r0_56:bt_SetMovableMove_XParam(r0_56.MOVABLE.PAR_X)
        r0_56:bt_SetMovableMove_YParam(r0_56.MOVABLE.PAR_Y)
        r0_56.DRAW_POS.x, r0_56.DRAW_POS.y = r0_56:bt_MovableSetRange(r0_56.DRAW_POS.x, r0_56.DRAW_POS.y)
      end
      function r2_48.bt_MovableSetRange(r0_57, r1_57, r2_57)
        -- line: [1034, 1064] id: 57
        local r3_57 = r1_57
        local r4_57 = r2_57
        if r3_57 < r0_57.MOVERANGE.x then
          r3_57 = r0_57.MOVERANGE.x
        end
        if r4_57 < r0_57.MOVERANGE.y then
          r4_57 = r0_57.MOVERANGE.y
        end
        local r5_57 = r0_57.MOVERANGE.w - r0_57.EVENT_RECT.w
        if r5_57 <= r3_57 then
          r3_57 = r5_57
        end
        local r6_57 = r0_57.MOVERANGE.h - r0_57.EVENT_RECT.h
        if r6_57 <= r4_57 then
          r4_57 = r6_57
        end
        return r3_57, r4_57
      end
      function r2_48.bt_MoveCalc(r0_58)
        -- line: [1068, 1104] id: 58
        local r1_58 = r0_58:bt_GetMoveRangeParamX()
        local r2_58 = r0_58:bt_GetMoveRangeParamY()
        r0_58.MOVABLE.MAX_X = r0_58:bt_GetMoveRangeX()
        r0_58.MOVABLE.MAX_Y = r0_58:bt_GetMoveRangeY()
        if r0_58.MOVABLE.MAX_X == 0 then
          r0_58.MOVABLE.PAR_X = 0
        else
          r0_58.MOVABLE.PAR_X = (r0_58.DRAW_POS.x - r0_58.initpos.x + r0_58.MOVABLE.MAX_X / r1_58 / 2) * r1_58 / r0_58.MOVABLE.MAX_X
          r0_58.MOVABLE.PAR_X = math.floor(r0_58.MOVABLE.PAR_X)
          if r0_58.MOVABLE.PAR_X < 0 then
            r0_58.MOVABLE.PAR_X = 0
          end
        end
        if r0_58.MOVABLE.MAX_Y == 0 then
          r0_58.MOVABLE.PAR_Y = 0
        else
          r0_58.MOVABLE.PAR_Y = (r0_58.DRAW_POS.y - r0_58.initpos.y + r0_58.MOVABLE.MAX_Y / r2_58 / 2) * r2_58 / r0_58.MOVABLE.MAX_Y
          r0_58.MOVABLE.PAR_Y = math.floor(r0_58.MOVABLE.PAR_Y)
          if r0_58.MOVABLE.PAR_Y < 0 then
            r0_58.MOVABLE.PAR_Y = 0
          end
        end
      end
      function r2_48.bt_SetSlidebarPos(r0_59)
        -- line: [1107, 1111] id: 59
        r0_59:bt_MovableCorrect()
        local r1_59 = cclass.lua_Layers:create()
        r0_59:bt_SetPos(r0_59.DRAW_POS.x, r0_59.DRAW_POS.y)
      end
      function r2_48.bt_SetParamX(r0_60, r1_60)
        -- line: [1115, 1118] id: 60
        r0_60:bt_SetMovableMove_XParam(r1_60)
        r0_60:bt_SetSlidebarPos()
      end
      function r2_48.bt_SetParamY(r0_61, r1_61)
        -- line: [1119, 1122] id: 61
        r0_61:bt_SetMovableMove_YParam(r1_61)
        r0_61:bt_SetSlidebarPos()
      end
      function r2_48.bt_GetParamX(r0_62)
        -- line: [1125, 1128] id: 62
        r0_62:bt_MoveCalc()
        return r0_62.MOVABLE.PAR_X
      end
      function r2_48.bt_GetParamY(r0_63)
        -- line: [1129, 1132] id: 63
        r0_63:bt_MoveCalc()
        return r0_63.MOVABLE.PAR_Y
      end
      function r2_48.bt_SetEventWParam(r0_64, r1_64)
        -- line: [1135, 1149] id: 64
        r0_64.MOVABLE.PSIZE_X = r1_64
        if r0_64.MOVABLE.PAR_MAX_X ~= 0 and r0_64.MOVABLE.PSIZE_X ~= 0 and r0_64.MOVABLE.MIN_W ~= 0 then
          local r2_64 = 0
          r2_64 = r0_64:bt_GetMoveRangeRectW() * r0_64.MOVABLE.PSIZE_X / r0_64.MOVABLE.PAR_MAX_X
          if r2_64 < r0_64.MOVABLE.MIN_W then
            r2_64 = r0_64.MOVABLE.MIN_W
          end
          r0_64.EVENT_RECT.w = math.floor(r2_64)
        end
      end
      function r2_48.bt_SetEventHParam(r0_65, r1_65)
        -- line: [1150, 1165] id: 65
        r0_65.MOVABLE.PSIZE_Y = r1_65
        if r0_65.MOVABLE.PAR_MAX_Y ~= 0 and r0_65.MOVABLE.PSIZE_Y ~= 0 and r0_65.MOVABLE.MIN_H ~= 0 then
          local r2_65 = 0
          r2_65 = r0_65:bt_GetMoveRangeRectH() * r0_65.MOVABLE.PSIZE_Y / r0_65.MOVABLE.PAR_MAX_Y
          if r2_65 < r0_65.MOVABLE.MIN_H then
            r2_65 = r0_65.MOVABLE.MIN_H
          end
          r0_65.EVENT_RECT.h = math.floor(r2_65)
        end
      end
      function r2_48.bt_SetMovableMove_X(r0_66, r1_66)
        -- line: [1169, 1171] id: 66
        r0_66.DRAW_POS.x = r1_66 + r0_66.MOVERANGE.x
      end
      function r2_48.bt_SetMovableMove_Y(r0_67, r1_67)
        -- line: [1172, 1174] id: 67
        r0_67.DRAW_POS.y = r1_67 + r0_67.MOVERANGE.y
      end
      function r2_48.bt_SetMovableMove_XParam(r0_68, r1_68)
        -- line: [1178, 1197] id: 68
        local r2_68 = nil
        local r3_68 = r0_68:bt_GetMoveRangeParamX()
        if r3_68 < r1_68 then
          r1_68 = r3_68
        end
        r0_68.MOVABLE.PAR_X = r1_68
        r0_68.MOVABLE.MAX_X = r0_68:bt_GetMoveRangeX()
        if r3_68 > 0 then
          r2_68 = math.ceil(r0_68.MOVABLE.PAR_X * r0_68.MOVABLE.MAX_X / r3_68)
          if r0_68.MOVABLE.MAX_X < r2_68 then
            r2_68 = r0_68.MOVABLE.MAX_X
          end
        else
          r2_68 = 0
        end
        r0_68:bt_SetMovableMove_X(r2_68)
      end
      function r2_48.bt_SetMovableMove_YParam(r0_69, r1_69)
        -- line: [1198, 1218] id: 69
        r0_69.MOVABLE.PAR_Y = r1_69
        local r2_69 = nil
        local r3_69 = r0_69:bt_GetMoveRangeParamY()
        if r3_69 < r1_69 then
          r1_69 = r3_69
        end
        r0_69.MOVABLE.PAR_Y = r1_69
        r0_69.MOVABLE.MAX_Y = r0_69:bt_GetMoveRangeY()
        if r3_69 > 0 then
          r2_69 = math.ceil(r0_69.MOVABLE.PAR_Y * r0_69.MOVABLE.MAX_Y / r3_69)
          if r0_69.MOVABLE.MAX_Y < r2_69 then
            r2_69 = r0_69.MOVABLE.MAX_Y
          end
        else
          r2_69 = 0
        end
        r0_69:bt_SetMovableMove_Y(r2_69)
      end
      function r2_48.bt_GetMoveRangeX(r0_70)
        -- line: [1221, 1228] id: 70
        local r1_70 = r0_70:bt_GetMoveRangeRectW() - r0_70.EVENT_RECT.w
        if r1_70 < 0 then
          r1_70 = 0
        end
        return r1_70
      end
      function r2_48.bt_GetMoveRangeY(r0_71)
        -- line: [1229, 1237] id: 71
        local r1_71 = r0_71:bt_GetMoveRangeRectH() - r0_71.EVENT_RECT.h
        if r1_71 < 0 then
          r1_71 = 0
        end
        return r1_71
      end
      function r2_48.bt_GetMoveRangeParamX(r0_72)
        -- line: [1239, 1246] id: 72
        local r1_72 = r0_72.MOVABLE.PAR_MAX_X - r0_72.MOVABLE.PSIZE_X
        if r1_72 < 0 then
          r1_72 = 0
        end
        return r1_72
      end
      function r2_48.bt_GetMoveRangeParamY(r0_73)
        -- line: [1247, 1254] id: 73
        local r1_73 = r0_73.MOVABLE.PAR_MAX_Y - r0_73.MOVABLE.PSIZE_Y
        if r1_73 < 0 then
          r1_73 = 0
        end
        return r1_73
      end
      function r2_48.bt_SetEventRangeRect(r0_74, r1_74, r2_74, r3_74, r4_74)
        -- line: [1256, 1261] id: 74
        r0_74.EVRANGE.x = r1_74
        r0_74.EVRANGE.y = r2_74
        r0_74.EVRANGE.w = r3_74
        r0_74.EVRANGE.h = r4_74
      end
      function r2_48.bt_SetEventRangeRectLayer(r0_75, r1_75)
        -- line: [1263, 1270] id: 75
        cclass.lua_Layers:create():initSubLayer(r0_75.layerset, r0_75.layerkey, r1_75, 0)
        local r3_75 = 0
        local r4_75 = 0
        local r5_75 = 0
        local r6_75 = 0
        r3_75, r4_75, r5_75, r6_75 = r0_75:bt_GetLayerRect(r0_75.layerkey, r1_75)
        r0_75:bt_SetEventRangeRect(r3_75, r4_75, r5_75, r6_75)
      end
      return r2_48
    end,
    SlidebarY = function(r0_76, r1_76, r2_76, r3_76)
      -- line: [1278, 1386] id: 76
      local r4_76 = r0_76:Movable(r3_76)
      r4_76:bt_addLayer("bar", r1_76)
      r4_76:bt_addLayer("bot", r2_76)
      function r4_76.bt_SlidebarYInit(r0_77, r1_77, r2_77, r3_77, r4_77, r5_77)
        -- line: [1286, 1295] id: 77
        r0_77:bt_SetMoveRangeRectLayer(r4_77)
        r0_77:bt_SetEventRangeRectLayer(r5_77)
        r0_77:bt_SetMovableInit(true, 0, r1_77, 0, r2_77, 0, r3_77)
        r0_77:bt_SetSlidebarPos()
      end
      function r4_76.bt_MovableControl(r0_78, r1_78, r2_78)
        -- line: [1298, 1334] id: 78
        if r0_78.MOVABLE.flag == false then
          return false
        end
        local r3_78 = 0
        local r4_78 = 0
        if r0_78.EVRANGE.x <= r1_78 and r1_78 < r0_78.EVRANGE.w and r0_78.EVRANGE.y <= r2_78 and r2_78 < r0_78.EVRANGE.h then
          r3_78 = r0_78.MOVABLE.BT_X + r1_78 - r0_78.MOVABLE.DRAGST_X
          r4_78 = r0_78.MOVABLE.BT_Y + r2_78 - r0_78.MOVABLE.DRAGST_Y
          r3_78, r4_78 = r0_78:bt_MovableSetRange(r3_78, r4_78)
        else
          r3_78 = r0_78.MOVABLE.BT_X
          r4_78 = r0_78.MOVABLE.BT_Y
        end
        if r0_78.DRAW_POS.x ~= r3_78 or r0_78.DRAW_POS.y ~= r4_78 then
          r0_78.DRAW_POS.x = r3_78
          r0_78.DRAW_POS.y = r4_78
          local r5_78 = cclass.lua_Layers:create()
          r5_78:setSubLayerParam(r0_78.layerset, r0_78.layerkey, r0_78.SubLayer.bar.no, LUA_PARAM_POS, math.floor(r3_78), math.floor(r4_78), 0, 0)
          r5_78:setSubLayerParam(r0_78.layerset, r0_78.layerkey, r0_78.SubLayer.bot.no, LUA_PARAM_POS, math.floor(r3_78), math.floor(r4_78 + r0_78.EVENT_RECT.h - 10), 0, 0)
          r0_78:bt_MoveCalc()
        end
        return true
      end
      function r4_76.bt_SetActive(r0_79, r1_79)
        -- line: [1337, 1360] id: 79
        local r2_79 = cclass.lua_Layers:create()
        for r6_79, r7_79 in pairs(r0_79.SubLayer) do
          if r7_79.no ~= -1 then
            if r1_79 == 0 then
              if r7_79.no == r0_79.SubLayer.bar.no or r7_79.no == r0_79.SubLayer.bot.no then
                r0_79:bt_SetEnableSubLayer(r7_79, true)
              else
                r0_79:bt_SetEnableSubLayer(r7_79, false)
              end
            else
              r0_79:bt_SetEnableSubLayer(r7_79, false)
            end
          end
        end
        r0_79.active = r1_79
      end
      function r4_76.bt_SetSlidebarPos(r0_80)
        -- line: [1364, 1381] id: 80
        r0_80:bt_MovableCorrect()
        local r1_80 = cclass.lua_Layers:create()
        local r2_80 = {
          x = 0,
          y = 0,
        }
        r2_80.x = math.floor(r0_80.DRAW_POS.x)
        r2_80.y = math.floor(r0_80.DRAW_POS.y)
        r1_80:setSubLayerParam(r0_80.layerset, r0_80.layerkey, r0_80.SubLayer.bar.no, LUA_PARAM_POS, r2_80.x, r2_80.y, 0, 0)
        local r3_80 = {
          w = 0,
          h = 0,
        }
        r3_80.w = math.floor(r0_80.EVENT_RECT.w)
        r3_80.h = math.floor(r0_80.EVENT_RECT.h - 10)
        r1_80:setSubLayerParam(r0_80.layerset, r0_80.layerkey, r0_80.SubLayer.bar.no, LUA_PARAM_RECT, 0, 0, r3_80.w, r3_80.h)
        r2_80.x = math.floor(r0_80.DRAW_POS.x)
        r2_80.y = math.floor(r0_80.DRAW_POS.y + r0_80.EVENT_RECT.h - 10)
        r1_80:setSubLayerParam(r0_80.layerset, r0_80.layerkey, r0_80.SubLayer.bot.no, LUA_PARAM_POS, r2_80.x, r2_80.y, 0, 0)
      end
      return r4_76
    end,
  }
  return r1_1
end
