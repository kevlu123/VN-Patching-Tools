-- filename: 
-- version: lua53
-- line: [0, 0] id: 0
g_GalleryInfo = {
  Page = 1,
  CgPage = 1,
  ScenePage = 1,
  BgmPage = 1,
  TipsPage = 1,
  CgThMax = 1,
  SceneThMax = 1,
  TipsPageMax = 4,
}
if g_EnableNMS then
  makeNmsList = function()
    -- line: [26, 34] id: 1
    return {
      Slide = 0,
      List = {},
      Act = -1,
      Param = 0,
    }
  end
  g_NmsPlay = makeNmsList()
  g_NmsData = makeNmsList()
  g_NmsData.MAX_THUMB = 180
  g_NmsData.THP_Slide = 0
  g_NmsData.THP_Param = 0
  g_NmsData.THP_BookMark = {}
  g_NmsData.THP_List = {}
  g_NmsData.THP_ListEnable = {}
  g_NmsData.THP_EnableCount = 0
  g_NmsData.RetFlag = -1
  g_NmsData.OneInit = false
  g_UseArrowViewBase = false
  g_NmsSLDataMax = 8
  g_NmsSLData = {}
end
openGallery = function(r0_2, r1_2)
  -- line: [71, 1122] id: 2
  g_Menu.GalleryMenu.ptr = Menu.new("Gallery")
  g_Menu.GalleryMenu.ptr.MenuInit = function(r0_3, r1_3)
    -- line: [77, 119] id: 3
    local r2_3 = true
    r0_3.MenuInf.enabled = true
    r0_3.MenuInf.effect = true
    r0_3.MenuInf.ButtonLayer = ""
    r0_3.MenuInf.ButtonPna = ""
    if cclass.lua_Layers:create():add(r0_3.MenuInf.SetName) == false then
      return false
    end
    local r5_3 = cfunc.LegacyGame__lua_GetVariable(100)
    local r6_3 = cfunc.LegacyGame__lua_GetVariable(101)
    local r7_3 = cfunc.LegacyGame__lua_GetVariable(102)
    local r8_3 = cfunc.LegacyGame__lua_GetVariable(112)
    local r9_3 = g_GalleryInfo
    local r10_3 = nil	-- notice: implicit variable refs by block#[5, 8, 11]
    if r5_3 == 0 then
      r10_3 = 1
      if not r10_3 then
        ::label_43::
        r10_3 = r5_3
      end
    else
      goto label_43	-- block#4 is visited secondly
    end
    r9_3.CgPage = r10_3
    r9_3 = g_GalleryInfo
    if r6_3 == 0 then
      r10_3 = 1
      if not r10_3 then
        ::label_51::
        r10_3 = r6_3
      end
    else
      goto label_51	-- block#7 is visited secondly
    end
    r9_3.ScenePage = r10_3
    r9_3 = g_GalleryInfo
    if r7_3 == 0 then
      r10_3 = 1
      if not r10_3 then
        ::label_59::
        r10_3 = r7_3
      end
    else
      goto label_59	-- block#10 is visited secondly
    end
    r9_3.BgmPage = r10_3
    if g_EnableTips then
      r9_3 = cfunc.LegacyGame__lua_GetVariable(104)
      r10_3 = g_GalleryInfo
      local r11_3 = nil	-- notice: implicit variable refs by block#[15]
      if r9_3 == 0 then
        r11_3 = 1
        if not r11_3 then
          ::label_74::
          r11_3 = r9_3
        end
      else
        goto label_74	-- block#14 is visited secondly
      end
      r10_3.TipsPage = r11_3
    end
    r0_3:SetBgmNo(r8_3)
    r0_3.MenuButton = Button.new(r0_3.MenuInf.SetName)
    r0_3.MenuButton:InitList()
    r0_3.MenuButtonData = {}
    return r2_3
  end
  g_Menu.GalleryMenu.ptr.MenuButtonJobPos = function(r0_4, r1_4, r2_4, r3_4, r4_4)
    -- line: [123, 213] id: 4
    if g_GalleryInfo.Page == 1 then
      r0_4:CgButtonJob(r1_4, r2_4, r3_4, r4_4)
    end
    if g_GalleryInfo.Page == 2 then
      r0_4:SceneButtonJob(r1_4, r2_4, r3_4, r4_4)
    end
    if g_GalleryInfo.Page == 3 then
    end
    if g_GalleryInfo.Page == 4 and g_EnableNMS then
      r0_4:NmsButtonJob(r1_4, r2_4, r3_4, r4_4)
    end
    if g_GalleryInfo.Page == 5 then
    end
    if g_GalleryInfo.Page == 6 then
      r0_4:CharaButtonJob(r1_4, r2_4, r3_4, r4_4)
    end
    if r1_4 ~= 0 and r2_4 == "LU" then
      local r5_4 = cclass.lua_Layers:create()
      if 1 <= r1_4 and r1_4 <= 6 then
        r0_4:initPageGallery(r1_4, false)
      end
      if r1_4 == 10 then
        r0_4.BT_DataBace.stop:bt_SetActive(2)
        r0_4:GalleryBgmStop()
      end
      if r1_4 == 11 or r1_4 == 13 then
        cclass.lua_Layers:create():rtSnap("system")
        if r1_4 == 13 then
          cfunc.LegacyGame__lua_SetVariable(99, -1)
        else
          cfunc.LegacyGame__lua_SetVariable(99, 0)
        end
        r0_4:closeGallery(0)
        r0_4:PlayTitleSound()
      end
      if r1_4 == 12 then
        r0_4.MenuButton.selDownCursor = -1
        r0_4.MenuButton.selDownKey = nil
        openConfirm(LUA_CONFIRM_QUIT)
      end
      if g_GalleryInfo.Page == 3 then
        r0_4:GalleryBgmButtonJob(r1_4)
      end
      if g_GalleryInfo.Page == 5 and g_EnableTips then
        r0_4:GalleryTipsButtonJob(r1_4)
      end
    end
    if r2_4 == "RU" and r0_4:GetMenuMouseEnable() then
      local r5_4 = true
      if g_GalleryInfo.Page == 6 and r0_4:CharaButtonRUJob() then
        r5_4 = false
      end
      if r1_4 == 0 and r5_4 then
        r0_4:SystemSePlay(g_SysSEName.cancel)
        cfunc.LegacyGame__lua_SetVariable(99, 0)
        r0_4:closeGallery(0)
        r0_4:PlayTitleSound()
      end
    end
  end
  g_Menu.GalleryMenu.ptr.MenuInf.PageEffect = false
  g_Menu.GalleryMenu.ptr.MenuInf.PageEffect2 = false
  g_Menu.GalleryMenu.ptr.MenuInf.GalleryEff = false
  g_Menu.GalleryMenu.ptr.MenuEffect = function(r0_5)
    -- line: [224, 309] id: 5
    local r1_5 = false
    if r0_5.MenuInf.GalleryEff == true and cclass.lua_Layers:create():isEffect("Gallery", "GalleryEff") == false then
      r0_5.MenuInf.GalleryEff = false
    end
    r1_5 = r0_5:MenuEffectTransJob()
    if r0_5.MenuInf.effect == true and r1_5 == false and r0_5.MenuInf.GalleryEff == false then
      r0_5:MenuEffectEndJob()
      r0_5.MenuInf.effect = false
    end
    if r0_5.MenuInf.PageEffect == true then
      local r2_5 = cclass.lua_Layers:create()
      ret = r2_5:isEffect("Gallery", "GalleryPageEff")
      if ret == false then
        if r0_5.beforePage == 1 then
          r0_5:DeleteCgMenu()
        end
        if r0_5.beforePage == 2 then
          r0_5:DeleteReplayMenu()
        end
        if r0_5.beforePage == 3 then
          r2_5:removeLayer("Gallery", "GalleryBgm")
        end
        if r0_5.beforePage == 4 and g_EnableNMS then
          r0_5:DeleteNmsMenu()
        end
        if r0_5.beforePage == 5 and g_EnableTips then
          r0_5:DeleteTipsMenu()
        end
        if r0_5.beforePage == 6 then
          r2_5:removeLayer("Gallery", "GalleryChara")
        end
        r0_5.beforePage = 0
        local r3_5 = 0
        local r4_5 = 0
        local r5_5 = cclass.lua_AutoCursor:new()
        r3_5, r4_5 = r5_5:GetCursorPos(r3_5, r4_5)
        r5_5:delete()
        r0_5.MenuButton:changeButton(r0_5.MenuInf.SetName, r2_5:getCursorPos(r0_5.MenuInf.SetName, r3_5, r4_5, 0) - 1, r3_5, r4_5)
        r0_5.MenuInf.PageEffect = false
        r0_5:DashboardMove(g_GalleryInfo.Page, 0)
        r0_5:UpButtonMove(g_GalleryInfo.Page, 0)
      end
    end
    if r0_5.MenuInf.PageEffect2 == true then
      local r2_5 = cclass.lua_Layers:create()
      ret = r2_5:isEffect("Gallery", "GalleryPageEff2")
      if ret == false then
        local r3_5 = 0
        local r4_5 = 0
        local r5_5 = cclass.lua_AutoCursor:new()
        r3_5, r4_5 = r5_5:GetCursorPos(r3_5, r4_5)
        r5_5:delete()
        r0_5.MenuButton:changeButton(r0_5.MenuInf.SetName, r2_5:getCursorPos(r0_5.MenuInf.SetName, r3_5, r4_5, 0) - 1, r3_5, r4_5)
        r0_5.MenuInf.PageEffect2 = false
      end
    end
    return r1_5
  end
  g_Menu.GalleryMenu.ptr.MenuEffectEndJob = function(r0_6)
    -- line: [311, 337] id: 6
    local r1_6 = cclass.lua_Layers:create()
    if r0_6.MenuInf.enabled == true then
      local r2_6 = 0
      local r3_6 = 0
      local r4_6 = cclass.lua_AutoCursor:new()
      r2_6, r3_6 = r4_6:GetCursorPos(r2_6, r3_6)
      r4_6:delete()
      r0_6.MenuButton:changeButton(r0_6.MenuInf.SetName, r1_6:getCursorPos(r0_6.MenuInf.SetName, r2_6, r3_6, 0) - 1, r2_6, r3_6)
    else
      r1_6:remove(r0_6.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_6.MenuInf.ButtonLayer = ""
      r0_6.MenuInf.ButtonPna = ""
    end
  end
  g_Menu.GalleryMenu.ptr.MenuEffectStart = function(r0_7, r1_7, r2_7)
    -- line: [339, 349] id: 7
    local r3_7 = cclass.lua_Layers:create()
    local r4_7 = cclass.lua_MeasureTime:new()
    local r5_7 = getEffectRate()
    r3_7:startTransition(r0_7.MenuInf.SetName, 0, 1, r1_7 * r5_7, r2_7 * r4_7:diff() * r5_7, LUA_TRANSITION_NORMAL)
    r4_7:delete()
    r0_7.MenuInf.enabled = true
    r0_7.MenuInf.effect = true
  end
  g_Menu.GalleryMenu.ptr.GetMenuMouseEnable = function(r0_8)
    -- line: [354, 365] id: 8
    local r1_8 = false
    if r0_8.MenuInf.enabled == true and r0_8.MenuInf.effect == false and r0_8.MenuInf.PageEffect == false and r0_8.MenuInf.PageEffect2 == false and r0_8.MenuInf.GalleryEff == false and r0_8.MenuButton ~= nil then
      r1_8 = true
    end
    return r1_8
  end
  g_Menu.GalleryMenu.ptr.defaultMenuMouseMove = g_Menu.GalleryMenu.ptr.MenuMouseMove
  g_Menu.GalleryMenu.ptr.MenuMouseMove = function(r0_9, r1_9, r2_9, r3_9, r4_9, r5_9, r6_9)
    -- line: [369, 388] id: 9
    r0_9:defaultMenuMouseMove(r1_9, r2_9, r3_9, r4_9, r5_9, r6_9)
    if g_GalleryInfo.Page == 1 then
      r0_9:CgThumbnailOver(r1_9, r2_9, r3_9, r4_9, r5_9, r6_9)
    end
    if g_GalleryInfo.Page == 2 then
      r0_9:ReplayThumbnailOver(r1_9, r2_9, r3_9, r4_9, r5_9, r6_9)
    end
    if g_GalleryInfo.Page == 4 and g_EnableNMS then
      r0_9:NmsMouseMove(r1_9, r2_9, r3_9, r4_9, r5_9, r6_9)
    end
    if g_GalleryInfo.Page == 5 and g_EnableTips then
      r0_9:TipsMouseMove(r1_9, r2_9, r3_9, r4_9, r5_9, r6_9)
    end
    if g_GalleryInfo.Page == 6 then
      r0_9:GalleryCharaSelCursor(r1_9, r2_9, r3_9, r4_9, r5_9, r6_9)
    end
  end
  g_Menu.GalleryMenu.ptr.defaultMenuLButtonDown = g_Menu.GalleryMenu.ptr.MenuLButtonDown
  g_Menu.GalleryMenu.ptr.MenuLButtonDown = function(r0_10, r1_10, r2_10, r3_10, r4_10, r5_10, r6_10)
    -- line: [392, 398] id: 10
    r0_10:defaultMenuLButtonDown(r1_10, r2_10, r3_10, r4_10, r5_10, r6_10)
    if g_GalleryInfo.Page == 4 and g_EnableNMS then
      r0_10:DropRepeatLD(r1_10, r2_10, r3_10, r4_10, r5_10, r6_10)
    end
  end
  g_Menu.GalleryMenu.ptr.MenuMouseWheel = function(r0_11, r1_11, r2_11)
    -- line: [402, 416] id: 11
    if g_GalleryInfo.Page == 1 then
      r0_11:CgMouseWheel(r1_11, r2_11)
    end
    if g_GalleryInfo.Page == 2 then
      r0_11:ReplayMouseWheel(r1_11, r2_11)
    end
    if g_GalleryInfo.Page == 4 and g_EnableNMS then
      r0_11:NmsMouseWheel(r1_11, r2_11)
    end
    if g_GalleryInfo.Page == 6 then
      r0_11:GalleryCharaWheel(r2_11)
    end
  end
  g_Menu.GalleryMenu.ptr.GalleryItemP1 = {}
  g_Menu.GalleryMenu.ptr.GalleryItemP2 = {}
  g_Menu.GalleryMenu.ptr.GalleryItemP3 = {}
  g_Menu.GalleryMenu.ptr.ItemSetInit = function(r0_12, r1_12)
    -- line: [428, 437] id: 12
    local r2_12 = {
      selCursor_selName = -1,
      selCursor_Item = {},
    }
    for r6_12 = 1, r1_12, 1 do
      r2_12.selCursor_Item[r6_12] = -1
    end
    return r2_12
  end
  g_Menu.GalleryMenu.ptr.ItemSet = function(r0_13, r1_13, r2_13, ...)
    -- line: [441, 462] id: 13
    item = {
      ...
    }
    r1_13.selCursor_selName = r2_13
    for r6_13 = 1, #r1_13.selCursor_Item, 1 do
      if r1_13.selCursor_Item[r6_13] ~= -1 then
        r1_13.selCursor_Item[r6_13]:SetAct("def")
      end
      r1_13.selCursor_Item[r6_13] = -1
      if r6_13 <= #item and item[r6_13] ~= -1 then
        r1_13.selCursor_Item[r6_13] = r1_13[item[r6_13]]
        r1_13.selCursor_Item[r6_13]:SetAct("on")
      end
    end
  end
  g_Menu.GalleryMenu.ptr.beforePage = 0
  g_Menu.GalleryMenu.ptr.initPageGallery = function(r0_14, r1_14, r2_14)
    -- line: [468, 755] id: 14
    if r1_14 == 0 then
      r1_14 = g_GalleryInfo.Page
    end
    local r3_14 = 300
    local r4_14 = cclass.lua_Layers:create()
    local r5_14 = getEffectRate()
    local r6_14 = 0
    local r7_14 = 0
    local r8_14 = 0
    local r9_14 = 0
    local r10_14 = -1
    r0_14.MenuButton:InitList()
    if r0_14.BT_DataBace.CG ~= nil then
      r0_14.BT_DataBace.CG:bt_SetActive(0)
    end
    if r0_14.BT_DataBace.Scene ~= nil then
      r0_14.BT_DataBace.Scene:bt_SetActive(0)
    end
    if r0_14.BT_DataBace.BGM ~= nil then
      r0_14.BT_DataBace.BGM:bt_SetActive(0)
    end
    if r0_14.BT_DataBace.TIPS ~= nil then
      r0_14.BT_DataBace.TIPS:bt_SetActive(0)
    end
    if r0_14.BT_DataBace.NMS ~= nil then
      r0_14.BT_DataBace.NMS:bt_SetActive(0)
    end
    if r0_14.BT_DataBace.Chara ~= nil then
      r0_14.BT_DataBace.Chara:bt_SetActive(0)
    end
    if r0_14:GetBgmNo() == 0 then
      r0_14.BT_DataBace.stop:bt_SetActive(2)
    else
      r0_14.BT_DataBace.stop:bt_SetActive(0)
    end
    if r1_14 == 1 then
      r10_14 = r0_14:InitCgMenu()
      r0_14.BT_DataBace.CG:bt_SetActive(1)
    end
    if r1_14 == 2 then
      r10_14 = r0_14:InitSceneMenu()
      r0_14.BT_DataBace.Scene:bt_SetActive(1)
    end
    if r1_14 == 3 then
      r10_14 = r0_14:InitBgmMenu()
      if r0_14.BT_DataBace.BGM ~= nil then
        r0_14.BT_DataBace.BGM:bt_SetActive(1)
      end
    end
    if r1_14 == 4 and g_EnableNMS then
      r10_14 = r0_14:InitNmsMenu()
      if r0_14.BT_DataBace.NMS ~= nil then
        r0_14.BT_DataBace.NMS:bt_SetActive(1)
      end
    end
    if r1_14 == 5 and g_EnableTips then
      r10_14 = r0_14:InitTipsMenu()
      if r0_14.BT_DataBace.TIPS ~= nil then
        r0_14.BT_DataBace.TIPS:bt_SetActive(1)
      end
    end
    if r1_14 == 6 then
      r10_14 = r0_14:InitCharaMenu()
      if r0_14.BT_DataBace.Chara ~= nil then
        r0_14.BT_DataBace.Chara:bt_SetActive(1)
      end
    end
    r0_14.MenuButton:SetList("BT_DataBace", r0_14.BT_DataBace)
    if r2_14 == true then
      r0_14:DashboardMove(r1_14, 0)
      r0_14:UpButtonMove(r1_14, 0)
      if r1_14 == 6 then
        r4_14:setSubLayerVisible("Gallery", "GalleryBace", 43, 1)
        r4_14:setSubLayerVisible("Gallery", "GalleryBace", 45, 1)
        r4_14:setSubLayerParam("Gallery", "GalleryBace", 43, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_14:setSubLayerParam("Gallery", "GalleryBace", 45, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_14:setSubLayerParam("Gallery", "GalleryBace", 44, LUA_PARAM_COLOR, 1, 1, 1, 0)
      else
        r4_14:setSubLayerVisible("Gallery", "GalleryBace", 43, 0)
        r4_14:setSubLayerVisible("Gallery", "GalleryBace", 45, 0)
        r4_14:setSubLayerParam("Gallery", "GalleryBace", 43, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_14:setSubLayerParam("Gallery", "GalleryBace", 45, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_14:setSubLayerParam("Gallery", "GalleryBace", 44, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    else
      r0_14.beforePage = g_GalleryInfo.Page
      local r11_14 = r0_14.beforePage
      if r1_14 < r11_14 then
        r11_14 = APP_INTERNAL_WIDTH or -1 * APP_INTERNAL_WIDTH
      else
        goto label_282	-- block#41 is visited secondly
      end
      local r12_14 = r0_14.beforePage
      if r1_14 < r12_14 then
        r12_14 = 90 or -90
      else
        goto label_290	-- block#44 is visited secondly
      end
      local r13_14 = r3_14 * r5_14
      local r14_14 = 0
      r0_14.MenuInf.PageEffect = true
      if r1_14 == 1 then
        r0_14:CgThumbnailEffect(g_GalleryInfo.CgPage, r11_14, r13_14, r12_14, false)
      end
      if r1_14 == 2 then
        r0_14:ReplayThumbnailEffect(g_GalleryInfo.ScenePage, r11_14, r13_14, r12_14, false)
      end
      if r1_14 == 3 then
      end
      if r1_14 == 4 and g_EnableNMS then
        r0_14:NmsChangeEffect(r11_14, r3_14, false)
      end
      if r1_14 == 5 and g_EnableTips then
        r0_14:TipsThumbnailEffect(g_GalleryInfo.ScenePage, r11_14, r13_14, r12_14, false)
      end
      if r1_14 == 6 then
        r4_14:setSubLayerVisible("Gallery", "GalleryBace", 43, 1)
        r4_14:setSubLayerVisible("Gallery", "GalleryBace", 45, 1)
        local r15_14 = 43
        local r16_14 = APP_INTERNAL_WIDTH
        r4_14:setSubLayerParam("Gallery", "GalleryBace", r15_14, LUA_PARAM_POS, -1 * r16_14, 0, 0, 0)
        r4_14:setSubLayerParam("Gallery", "GalleryBace", r15_14, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r15_14, LUA_EFFECT_POS, r16_14, 0, 0, 0, 0, r13_14, 0, 0)
        r4_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r15_14, 0)
        r15_14 = 45
        r4_14:setSubLayerParam("Gallery", "GalleryBace", r15_14, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r15_14, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r13_14, 0, 0)
        r4_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r15_14, 0)
        r15_14 = 44
        r4_14:setSubLayerParam("Gallery", "GalleryBace", r15_14, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r15_14, LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r13_14, 0, 0)
        r4_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r15_14, 0)
      end
      local r15_14 = ""
      if r0_14.beforePage == 1 then
        r15_14 = r0_14.CgMenu.keyname
        r0_14:CgThumbnailEffect(g_GalleryInfo.CgPage, r11_14, r13_14, r12_14, true)
      end
      if r0_14.beforePage == 2 then
        r15_14 = r0_14.SceneMenu.keyname
        r0_14:ReplayThumbnailEffect(g_GalleryInfo.ScenePage, r11_14, r13_14, r12_14, true)
      end
      if r0_14.beforePage == 3 then
        r15_14 = r0_14.BgmMenu.keyname
      end
      if r0_14.beforePage == 4 and g_EnableNMS then
        r15_14 = r0_14:NmsChangeEffect(r11_14, r3_14, true)
      end
      if r0_14.beforePage == 5 and g_EnableTips then
        r15_14 = r0_14.TipsMenu.keyname
        r0_14:TipsThumbnailEffect(g_GalleryInfo.ScenePage, r11_14, r13_14, r12_14, true)
      end
      if r0_14.beforePage == 6 then
        r4_14:setSubLayerVisible("Gallery", "GalleryBace", 43, 1)
        r4_14:setSubLayerVisible("Gallery", "GalleryBace", 45, 1)
        r15_14 = r0_14.CharaMenu.keyname
        local r16_14 = 43
        local r17_14 = APP_INTERNAL_WIDTH
        r4_14:setSubLayerParam("Gallery", "GalleryBace", r16_14, LUA_PARAM_POS, 0, 0, 0, 0)
        r4_14:setSubLayerParam("Gallery", "GalleryBace", r16_14, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r16_14, LUA_EFFECT_POS, -1 * r17_14, 0, 0, 0, 0, r13_14, 0, 0)
        r4_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r16_14, 0)
        r16_14 = 45
        r4_14:setSubLayerParam("Gallery", "GalleryBace", r16_14, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r4_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r16_14, LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r13_14, 0, 0)
        r4_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r16_14, 0)
        r16_14 = 44
        r4_14:setSubLayerParam("Gallery", "GalleryBace", r16_14, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r16_14, LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r13_14, 0, 0)
        r4_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r16_14, 0)
      end
      r4_14:setEffect("Gallery", r15_14, "GalleryPageEff", LUA_EFFECT_POS, r11_14, 0, 0, 0, 0, r3_14 * r5_14, 0, 0)
      r4_14:setParam("Gallery", r15_14, LUA_PARAM_POS, 0, 0, 0, 0)
      r4_14:setEffect("Gallery", r15_14, "GalleryPageEff", LUA_EFFECT_POS, r11_14, 0, 0, 0, 0, r13_14, 0, r14_14)
      r4_14:startEffect("Gallery", r15_14, "GalleryPageEff", 0)
      if r10_14 ~= -1 then
        r4_14:setParam("Gallery", r10_14, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_14:setEffect("Gallery", r10_14, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_14 * r5_14, 0, 0)
        r4_14:setParam("Gallery", r10_14, LUA_PARAM_POS, -1 * r11_14, 0, 0, 0)
        r4_14:setEffect("Gallery", r10_14, "GalleryPageEff", LUA_EFFECT_POS, r11_14, 0, 0, 0, 0, r3_14 * r5_14, 0, 0)
        r4_14:startEffect("Gallery", r10_14, "GalleryPageEff", 0)
      end
      r0_14:DashboardMove(r1_14, r3_14)
      r0_14:UpButtonMove(r1_14, r3_14)
    end
    g_GalleryInfo.Page = r1_14
    cfunc.LegacyGame__lua_SetVariable(103, r1_14)
  end
  g_Menu.GalleryMenu.ptr.MenuEffectToMenu = function(r0_15, r1_15)
    -- line: [763, 771] id: 15
    local r2_15 = cclass.lua_Layers:create()
    r2_15:removeSnap("system")
    r2_15:rtSnap("system")
    r2_15:startTransition(r0_15.MenuInf.SetName, 0, 1, r1_15 * getEffectRate(), 0, LUA_TRANSITION_ERASE)
  end
  g_Menu.GalleryMenu.ptr.closeGallery = function(r0_16, r1_16)
    -- line: [775, 813] id: 16
    cfunc.LegacyGame__lua_SetVariable(100, g_GalleryInfo.CgPage)
    cfunc.LegacyGame__lua_SetVariable(101, g_GalleryInfo.ScenePage)
    cfunc.LegacyGame__lua_SetVariable(102, g_GalleryInfo.BgmPage)
    if g_EnableTips then
      cfunc.LegacyGame__lua_SetVariable(104, g_GalleryInfo.TipsPage)
    end
    if g_EnableNMS then
      NmsMenuSaveBookMark()
    end
    if r1_16 == 2 or r1_16 == 4 then
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      cclass.lua_Layers:create():removeSnap("system")
      r0_16:MenuEffectEnd(0)
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin.MenuInf.enabled = false
        g_MenuMsgWin.MenuInf.effect = false
      end
    else
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      r0_16:MenuEffectToMenu(0)
    end
    r0_16.MenuInf.enabled = false
    r0_16.MenuInf.effect = true
  end
  g_Menu.GalleryMenu.ptr.PlayTitleSound = function(r0_17)
    -- line: [815, 830] id: 17
    local r1_17 = cclass.lua_Sounds:new()
    if r0_17:GetBgmNo() ~= 30 then
      r1_17:BgmPlay("systembgm", getSoundArcFileName("bgm", ".ogg"), "bgm34.ogg", getSoundVolume("bgm"))
      cfunc.LegacyGame__lua_SetVariable(112, 30)
    end
    r1_17:delete()
  end
  g_Menu.GalleryMenu.ptr.DashboardMove = function(r0_18, r1_18, r2_18)
    -- line: [835, 862] id: 18
    local r3_18 = cclass.lua_Layers:create()
    local r4_18 = getEffectRate()
    if r1_18 == 3 then
      r1_18 = 2
    end
    if r1_18 == 6 then
      r1_18 = 3
    end
    for r8_18 = 1, 2, 1 do
      local r9_18 = 0
      local r10_18 = 0
      local r11_18 = 0
      local r12_18 = 0
      local r13_18 = 55 + (r1_18 - 1) * 4 + r8_18 - 1
      r3_18:initSubLayer("Gallery", "GalleryBace", r13_18, 0)
      r9_18, r10_18, r11_18, r12_18 = r3_18:getSubLayerParam("Gallery", "GalleryBace", r13_18, LUA_PARAM_POS, r9_18, r10_18, r11_18, r12_18)
      local r14_18 = 2 + r8_18 - 1
      if r2_18 > 0 then
        local r15_18 = 0
        local r16_18 = 0
        r15_18, r16_18, r17_18, r18_18 = r3_18:getSubLayerParam("Gallery", "GalleryBace", r14_18, LUA_PARAM_POS, r15_18, r16_18, 0, 0)
        r3_18:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r14_18, LUA_EFFECT_POS, r9_18 - r15_18, r10_18 - r16_18, 0, 0, 0, r2_18 * r4_18, 0, 0)
        r3_18:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r14_18, 0)
      else
        r3_18:setSubLayerParam("Gallery", "GalleryBace", r14_18, LUA_PARAM_POS, r9_18, r10_18, 0, 0)
      end
    end
  end
  g_Menu.GalleryMenu.ptr.UpButtonMove = function(r0_19, r1_19, r2_19)
    -- line: [865, 935] id: 19
    local r3_19 = cclass.lua_Layers:create()
    local r4_19 = getEffectRate()
    local r5_19 = {
      1,
      3,
      6
    }
    local r6_19 = {
      8,
      14,
      20
    }
    for r11_19, r12_19 in pairs({
      "CG",
      "BGM",
      "Chara"
    }) do
      local r13_19 = r6_19[r11_19]
      if r1_19 == r5_19[r11_19] then
        r3_19:initSubLayer("Gallery", "GalleryBace", r13_19, 1)
        r3_19:setSubLayerVisible("Gallery", "GalleryBace", r13_19, 1)
        if r2_19 > 0 then
          r3_19:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r13_19, LUA_EFFECT_SCALE, 0.2, 0.2, 0, 0, 0, 150 * r4_19, 0, 0)
          r3_19:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r13_19, LUA_EFFECT_SCALE, -0.2, -0.2, 0, 0, 0, 80 * r4_19, 0, 0)
          r3_19:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r13_19, 0)
        end
      else
        r3_19:setSubLayerVisible("Gallery", "GalleryBace", r13_19, 0)
      end
    end
    local r8_19 = {
      "BGM",
      "Chara"
    }
    local r9_19 = r1_19
    if r9_19 == 3 then
      r9_19 = 2
    end
    if r9_19 == 6 then
      r9_19 = 3
    end
    local r10_19 = getUItype()
    local r11_19 = r0_19.TopButtonPos
    if r10_19 == 1 then
      r11_19 = r0_19.C_TopButtonPos
    end
    for r15_19, r16_19 in pairs(r8_19) do
      if r2_19 > 0 then
        local r17_19 = r0_19.BT_DataBace[r16_19].initpos.x
        local r18_19 = r0_19.BT_DataBace[r16_19].initpos.y
        if r11_19[r9_19][r16_19] ~= nil then
          r17_19 = r11_19[r9_19][r16_19].x
          r18_19 = r11_19[r9_19][r16_19].y
        end
        local r19_19 = r17_19 - r0_19.BT_DataBace[r16_19].DRAW_POS.x
        local r20_19 = r18_19 - r0_19.BT_DataBace[r16_19].DRAW_POS.y
        for r25_19, r26_19 in pairs({
          "on",
          "def",
          "dis"
        }) do
          local r27_19 = r0_19.BT_DataBace[r16_19].SubLayer[r26_19].no
          r3_19:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r27_19, LUA_EFFECT_POS, r19_19, r20_19, 0, 0, 0, r2_19 * r4_19, 0, 0)
          r3_19:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r27_19, 0)
        end
      elseif r11_19[r9_19][r16_19] ~= nil then
        r0_19.BT_DataBace[r16_19]:bt_SetPos(r11_19[r9_19][r16_19].x, r11_19[r9_19][r16_19].y)
      else
        r0_19.BT_DataBace[r16_19]:bt_SetDefPos()
      end
    end
  end
  g_Menu.GalleryMenu.ptr.TopButtonPos = {
    {
      BGM = {
        x = 177,
        y = 48,
      },
      Chara = {
        x = 273,
        y = 48,
      },
    },
    {
      BGM = nil,
      Chara = {
        x = 307,
        y = 48,
      },
    },
    {
      BGM = nil,
      Chara = nil,
    }
  }
  g_Menu.GalleryMenu.ptr.C_TopButtonPos = {
    {
      BGM = {
        x = 202,
        y = 48,
      },
      Chara = {
        x = 354,
        y = 48,
      },
    },
    {
      BGM = nil,
      Chara = {
        x = 391,
        y = 48,
      },
    },
    {
      BGM = nil,
      Chara = nil,
    }
  }
  g_Menu.GalleryMenu.ptr.InitGallery = function(r0_20, r1_20)
    -- line: [960, 1037] id: 20
    local r2_20 = getUItype()
    local r3_20 = cclass.lua_Layers:create()
    local r4_20 = "SYS_GalleryBase.pna"
    if r2_20 == 1 then
      r4_20 = "SYS_c_GalleryBase.pna"
    end
    g_Menu.GalleryMenu.ptr:MenuLoadLayer("GalleryBace", r4_20)
    r0_20:MenuLoadLayer("GalleryDefaultBack", "bg00_02s.png")
    r3_20:setVisible("Gallery", "GalleryDefaultBack", 1)
    r3_20:forwardLayerOrder("Gallery", "GalleryBace", "GalleryDefaultBack")
    r3_20:initSubLayer("Gallery", "GalleryBace", 2, 1)
    r3_20:initSubLayer("Gallery", "GalleryBace", 3, 1)
    r3_20:initSubLayer("Gallery", "GalleryBace", 25, 1)
    r3_20:initSubLayer("Gallery", "GalleryBace", 43, 1)
    r3_20:initSubLayer("Gallery", "GalleryBace", 44, 1)
    r3_20:initSubLayer("Gallery", "GalleryBace", 45, 1)
    r3_20:setSubLayerVisible("Gallery", "GalleryBace", 43, 0)
    r3_20:setSubLayerVisible("Gallery", "GalleryBace", 45, 0)
    r0_20.BT_DataBace = {}
    r0_20:MenuButtonSet(r0_20.BT_DataBace, "CG", 1, "GalleryBace", 6, 6, 7, -1, 9, 1, 0, 0)
    r0_20:MenuButtonSet(r0_20.BT_DataBace, "BGM", 1, "GalleryBace", 12, 12, 13, -1, 15, 3, 0, 0)
    r0_20:MenuButtonSet(r0_20.BT_DataBace, "Chara", 1, "GalleryBace", 18, 18, 19, -1, 21, 6, 0, 0)
    r0_20:MenuButtonSet(r0_20.BT_DataBace, "stop", 1, "GalleryBace", 27, 27, 28, -1, 30, 10, 0, 0)
    r0_20:MenuButtonSet(r0_20.BT_DataBace, "title", 1, "GalleryBace", 33, 33, 34, -1, -1, 11, 0, 0)
    r0_20:MenuButtonSet(r0_20.BT_DataBace, "quit", 1, "GalleryBace", 38, 38, 39, -1, -1, 12, 0, 0)
    r0_20.MenuButton:SetList("BT_DataBace", r0_20.BT_DataBace)
    r0_20:MenuButtonInit()
    local r5_20 = cfunc.LegacyGame__lua_GetVariable(103)
    if r1_20 ~= 0 or cfunc.LegacyGame__lua_GetFlag(124) then
      r0_20:GalleryBgmPlay(30)
    end
    cfunc.LegacyGame__lua_SetFlag(124, false)
    r0_20:initPageGallery(r5_20, true)
  end
  g_Menu.GalleryMenu.ptr.PatchFlag = false
  g_Menu.GalleryMenu.ptr.JPatchFlag = getLangPatchFlag()
  if g_Menu.GalleryMenu.ptr.PatchFlag then
  end
  GalleryCgMenu(g_Menu.GalleryMenu.ptr)
  GallerySceneMenu(g_Menu.GalleryMenu.ptr)
  GalleryBgmMenu(g_Menu.GalleryMenu.ptr)
  if g_EnableTips then
    GalleryTipsMenu(g_Menu.GalleryMenu.ptr)
  end
  GalleryCharacterMenu(g_Menu.GalleryMenu.ptr)
  g_Menu.GalleryMenu.ptr:GalleryCharaSetPicInit()
  g_Menu.GalleryMenu.ptr:GalleryCharaSetPic(true)
  if g_EnableNMS then
    g_NmsData.MAX_THUMB = 180
    if g_Menu.GalleryMenu.ptr.PatchFlag then
    end
    GalleryNmsMenu(g_Menu.GalleryMenu.ptr)
  end
  local r2_2 = g_Menu.GalleryMenu.ptr:MenuInit(r1_2)
  if res == false then
    return false
  end
  g_Menu.GalleryMenu.ptr:InitGallery(r1_2)
  local r3_2 = cclass.lua_Layers:create()
  if g_menuExecute == false then
    r3_2:setSnap("system", true)
  end
  r3_2:copySnap("Gallery", "system")
  g_Menu.GalleryMenu.ptr:MenuEffectStart(500, 0)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
GalleryCgMenu = function(r0_21)
  -- line: [1129, 1666] id: 21
  r0_21.CgMenu = {}
  r0_21.CgMenu.DataTh = {}
  r0_21.CgMenu.keyname = "GalleryCg"
  r0_21.CgMenu.LayerName = "SYS_CgThumbnail"
  r0_21.CgMenu.FileName = "SYS_GalleryCg.pna"
  r0_21.CgMenu.c_FileName = "SYS_c_GalleryCg.pna"
  r0_21.CgMenu.ThFileName = "SYS_GalleryCgThOn.pna"
  r0_21.CgMenu.LayerNameOff = "SYS_CgThumbnailOff"
  r0_21.CgMenu.ThFileNameOff = "SYS_GalleryCgThOff.pna"
  r0_21.CgMenu.ThXLineMax = 3
  r0_21.CgMenu.ThYLineMax = 3
  r0_21.CgMenu.ThAllMax = r0_21.CgMenu.ThXLineMax * r0_21.CgMenu.ThYLineMax
  r0_21.CgMenu.BarMoveNo = -1
  r0_21.CgMenu.PageMax = 7
  function r0_21.CgMouseWheel(r0_22, r1_22, r2_22)
    -- line: [1158, 1159] id: 22
  end
  function r0_21.CgButtonJob(r0_23, r1_23, r2_23, r3_23, r4_23)
    -- line: [1163, 1197] id: 23
    if nil and not nil then
      goto label_2	-- block#1 is visited secondly
    end
    if r2_23 == "LU" then
    end
    if r1_23 ~= 0 and r2_23 == "LU" then
      local r5_23 = 201 + r0_23.CgMenu.ThAllMax
      if 201 <= r1_23 and r1_23 <= r5_23 then
        local r7_23 = r0_23:GetCgRetNo(g_GalleryInfo.CgPage, r1_23 - 200)
        cfunc.LegacyGame__lua_SetVariable(99, 1)
        cfunc.LegacyGame__lua_SetVariable(105, r7_23)
        if r7_23 >= 93 then
          r0_23:GalleryBgmStop()
          r0_23:closeGallery(2)
          g_menuExecute = false
          cfunc.LegacyGame__lua_SetFlag(124, true)
        else
          r0_23:closeGallery(0)
        end
      end
      if 101 <= r1_23 and r1_23 <= 115 then
        r0_23:CGPageInit(r1_23 - 100, false)
      end
    end
  end
  function r0_21.InitCgButton(r0_24, r1_24)
    -- line: [1201, 1239] id: 24
    local r2_24 = cclass.lua_Layers:create()
    r0_24.CgMenu.DataPage = {}
    for r6_24 = 1, r0_24.CgMenu.PageMax, 1 do
      local r7_24 = string.format("Page%d", r6_24)
      local r8_24 = 1 + (r6_24 - 1) * 6
      r0_24:MenuButtonSet(r0_24.CgMenu.DataPage, r7_24, 1, r1_24, r8_24, r8_24, 2 + (r6_24 - 1) * 6, 3 + (r6_24 - 1) * 6, -1, 100 + r6_24, 0, 0)
    end
    r0_24.CgMenu.DataTh = {}
    for r6_24 = 1, r0_24.CgMenu.ThAllMax, 1 do
      local r7_24 = string.format("TH%d", r6_24)
      local r8_24 = 73 + r6_24 - 1
      r0_24:MenuButtonSet(r0_24.CgMenu.DataTh, r7_24, 1, r1_24, r8_24, r8_24, 84 + r6_24 - 1, -1, 95 + r6_24 - 1, 200 + r6_24, 0, 0)
    end
  end
  function r0_21.InitCgMenu(r0_25)
    -- line: [1242, 1289] id: 25
    cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ACHIEVEMENT, 4)
    local r1_25 = cclass.lua_Layers:create()
    if getUItype() == 1 then
      r0_25:MenuLoadLayer(r0_25.CgMenu.keyname, r0_25.CgMenu.c_FileName)
    else
      r0_25:MenuLoadLayer(r0_25.CgMenu.keyname, r0_25.CgMenu.FileName)
    end
    r0_25:LoadCgThumbnail()
    r0_25:InitCgButton(r0_25.CgMenu.keyname)
    r0_25.MenuButton:SetList("BT_CgDataPage", r0_25.CgMenu.DataPage)
    r0_25.MenuButton:SetList("BT_CgDataTh", r0_25.CgMenu.DataTh)
    r0_25:MenuButtonInit()
    r1_25:initSubLayer(r0_25.MenuInf.SetName, r0_25.CgMenu.keyname, 105, 1)
    r0_25:CGPageInit(g_GalleryInfo.CgPage, true)
    return r0_25.CgMenu.keyname
  end
  function r0_21.GetCgRetNo(r0_26, r1_26, r2_26)
    -- line: [1292, 1295] id: 26
    return r2_26 + (r1_26 - 1) * r0_26.CgMenu.ThAllMax
  end
  function r0_21.GetCgThumbnailOnOff(r0_27, r1_27, r2_27)
    -- line: [1299, 1315] id: 27
    return 0 + (r1_27 - 1) * 9 + r2_27 - 1, 0 + (r1_27 - 1) * 9 + r2_27 - 1, r0_27.CgMenu.LayerName, r0_27.CgMenu.LayerNameOff
  end
  function r0_21.LoadCgThumbnail(r0_28)
    -- line: [1318, 1321] id: 28
    r0_28:MenuLoadLayer(r0_28.CgMenu.LayerName, r0_28.CgMenu.ThFileName)
    r0_28:MenuLoadLayer(r0_28.CgMenu.LayerNameOff, r0_28.CgMenu.ThFileNameOff)
  end
  function r0_21.DeleteCgThumbnail(r0_29)
    -- line: [1324, 1328] id: 29
    local r1_29 = cclass.lua_Layers:create()
    r1_29:removeLayer(r0_29.MenuInf.SetName, r0_29.CgMenu.LayerName)
    r1_29:removeLayer(r0_29.MenuInf.SetName, r0_29.CgMenu.LayerNameOff)
  end
  function r0_21.DeleteCgMenu(r0_30)
    -- line: [1331, 1335] id: 30
    cclass.lua_Layers:create():removeLayer(r0_30.MenuInf.SetName, r0_30.CgMenu.keyname)
    r0_30:DeleteCgThumbnail()
  end
  function r0_21.CgThumbnailEffect(r0_31, r1_31, r2_31, r3_31, r4_31, r5_31)
    -- line: [1339, 1381] id: 31
    local r6_31 = cclass.lua_Layers:create()
    if r5_31 == false then
      r6_31:setParam(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r6_31:setEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_31, 0, 0)
      r6_31:setParam(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r6_31:setEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_31, 0, 0)
      r6_31:setParam(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName, LUA_PARAM_POS, -1 * r2_31, 0, 0, 0)
      r6_31:setEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_31, 0, 0, 0, 0, r3_31, 0, 0)
      r6_31:setParam(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff, LUA_PARAM_POS, -1 * r2_31, 0, 0, 0)
      r6_31:setEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_POS, r2_31, 0, 0, 0, 0, r3_31, 0, 0)
      r6_31:startEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName, "GalleryPageEff", 0)
      r6_31:startEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff, "GalleryPageEff", 0)
    else
      r6_31:setParam(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r6_31:setEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_31, 0, 0)
      r6_31:setParam(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r6_31:setEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_31, 0, 0)
      r6_31:setEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_31, 0, 0, 0, 0, r3_31, 0, 0)
      r6_31:setEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_POS, r2_31, 0, 0, 0, 0, r3_31, 0, 0)
      r6_31:startEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName, "GalleryPageEff", 0)
      r6_31:startEffect(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff, "GalleryPageEff", 0)
    end
  end
  function r0_21.CgThumbnailOver(r0_32, r1_32, r2_32, r3_32, r4_32, r5_32, r6_32)
    -- line: [1384, 1425] id: 32
    local r7_32 = cclass.lua_Layers:create()
    local r8_32 = 0
    local r9_32 = 0
    local r10_32 = -1
    if r0_32.MenuButton.selCursor ~= -1 then
      r10_32 = r0_32.MenuButton.selListKey[r0_32.MenuButton.selCursor]
      r9_32 = r10_32.arg
      r8_32 = r10_32.bt_l
    end
    local r11_32 = -1
    local r12_32 = 201 + r0_32.CgMenu.ThAllMax
    if 201 <= r8_32 and r8_32 <= r12_32 then
      r11_32 = r8_32 - 200
    end
    for r16_32 = 1, r0_32.CgMenu.ThAllMax, 1 do
      if r0_32:GetCgFlag(g_GalleryInfo.CgPage, r16_32) == 1 then
        local r18_32 = 0
        local r19_32 = 0
        local r20_32 = r0_32.CgMenu.LayerName
        local r21_32 = r0_32.CgMenu.LayerNameOff
        r18_32, r19_32, r20_32, r21_32 = r0_32:GetCgThumbnailOnOff(g_GalleryInfo.CgPage, r16_32)
        if r18_32 ~= -1 and r19_32 ~= -1 then
          if r11_32 == r16_32 then
            r7_32:setSubLayerVisible(r0_32.MenuInf.SetName, r20_32, r18_32, 1)
            r7_32:setSubLayerVisible(r0_32.MenuInf.SetName, r21_32, r19_32, 0)
          else
            r7_32:setSubLayerVisible(r0_32.MenuInf.SetName, r20_32, r18_32, 0)
            r7_32:setSubLayerVisible(r0_32.MenuInf.SetName, r21_32, r19_32, 1)
          end
        end
      end
    end
  end
  function r0_21.GetCgFlag(r0_33, r1_33, r2_33)
    -- line: [1429, 1556] id: 33
    local r3_33 = {
      AFT_01 = 1080,
      AFT_02 = 1081,
      AFT_03 = 1082,
      AFT_07 = 1083,
      AFT_08 = 1084,
      AFT_11 = 1085,
      AFT_12 = 1086,
      AFT_13 = 1087,
      AFT_14 = 1088,
      BEF_01 = 1089,
      BEF_02 = 1090,
      BEF_03 = 1091,
      BEF_05 = 1092,
      BEF_08 = 1093,
      BEF_09 = 1094,
      HOT_01 = 1095,
      HOT_02 = 1096,
      HOT_03 = 1097,
      HOT_04 = 1098,
      HOT_06 = 1099,
      HOT_09 = 1100,
      HOT_10 = 1101,
      KAN_01 = 1102,
      KAN_02 = 1103,
      KAN_03 = 1104,
      KAN_04 = 1105,
      KAN_09 = 1106,
      HUS_03 = 1107,
      NOV_01 = 1108,
      NOV_02 = 1109,
      COM_01 = 1110,
      KOT_00 = 1111,
      KOT_01 = 1112,
      KOT_11 = 1113,
      KOT_21 = 1114,
      AMA_01 = 1115,
      AMA_08 = 1116,
      HUT_22 = 1117,
      CSEV_14 = 1118,
      CSEV_15 = 1119,
      CSEV_16 = 1120,
      CSEV_17 = 1121,
      CSEV_18 = 1122,
      CSEV_19 = 1123,
      CSEV_20 = 1124,
      CSEV_21 = 1125,
      CSEV_29 = 1126,
      FDSDEV01 = 1127,
      FDSDEV02 = 1128,
      FDSDEV03 = 1129,
      FDSDEV04 = 1130,
      FDSDEV05 = 1131,
      FDSDEV06 = 1132,
      FDSDEV07 = 1133,
      FDSDEV08 = 1134,
      FDSDEV09 = 1135,
      FDSDEV10 = 1136,
      FDSDEV11 = 1137,
      FDSDEV12 = 1138,
      FDSDEV13 = 1139,
      FDSDEV14 = 1140,
      FDSDEV15 = 1141,
    }
    local r6_33 = ({
      r3_33.AFT_01,
      r3_33.AFT_03,
      r3_33.CSEV_14,
      r3_33.AFT_13,
      r3_33.AFT_02,
      r3_33.AFT_07,
      r3_33.AFT_08,
      r3_33.CSEV_15,
      r3_33.AFT_11,
      r3_33.AFT_12,
      r3_33.AFT_14,
      r3_33.BEF_01,
      r3_33.BEF_02,
      r3_33.BEF_03,
      r3_33.BEF_05,
      r3_33.CSEV_16,
      r3_33.BEF_08,
      r3_33.BEF_09,
      r3_33.HOT_01,
      r3_33.HOT_10,
      r3_33.HOT_02,
      r3_33.HOT_03,
      r3_33.HOT_04,
      r3_33.HOT_06,
      r3_33.HOT_09,
      r3_33.KAN_01,
      r3_33.KAN_02,
      r3_33.KAN_04,
      r3_33.CSEV_17,
      r3_33.CSEV_18,
      r3_33.CSEV_19,
      r3_33.CSEV_20,
      r3_33.CSEV_21,
      r3_33.KAN_03,
      r3_33.KAN_09,
      r3_33.CSEV_29,
      r3_33.HUS_03,
      r3_33.NOV_01,
      r3_33.NOV_02,
      r3_33.COM_01,
      r3_33.KOT_00,
      r3_33.KOT_01,
      r3_33.KOT_11,
      r3_33.KOT_21,
      r3_33.AMA_01,
      r3_33.AMA_08,
      r3_33.HUT_22,
      r3_33.FDSDEV01,
      r3_33.FDSDEV02,
      r3_33.FDSDEV03,
      r3_33.FDSDEV04,
      r3_33.FDSDEV05,
      r3_33.FDSDEV06,
      r3_33.FDSDEV07,
      r3_33.FDSDEV08,
      r3_33.FDSDEV09,
      r3_33.FDSDEV10,
      r3_33.FDSDEV11,
      r3_33.FDSDEV12,
      r3_33.FDSDEV13,
      r3_33.FDSDEV15,
      r3_33.FDSDEV14,
      nil,
      nil
    })[(r1_33 - 1) * r0_33.CgMenu.ThAllMax + r2_33]
    if r6_33 == nil then
      return -1
    end
    if cfunc.LegacyGame__lua_GetFlag(r6_33) then
      return 1
    else
      return 0
    end
  end
  function r0_21.CGPageInit(r0_34, r1_34, r2_34)
    -- line: [1560, 1664] id: 34
    for r6_34 = 1, r0_34.CgMenu.PageMax, 1 do
      local r7_34 = string.format("Page%d", r6_34)
      if r1_34 == r6_34 then
        r0_34.CgMenu.DataPage[r7_34]:bt_SetActive(1)
      else
        r0_34.CgMenu.DataPage[r7_34]:bt_SetActive(0)
      end
    end
    local r3_34 = cclass.lua_Layers:create()
    if r2_34 == false then
      for r7_34 = 1, r0_34.CgMenu.ThAllMax, 1 do
        if r0_34:GetCgFlag(g_GalleryInfo.CgPage, r7_34) == 1 then
          local r9_34 = 0
          local r10_34 = 0
          local r11_34 = r0_34.CgMenu.LayerName
          local r12_34 = r0_34.CgMenu.LayerNameOff
          r9_34, r10_34, r11_34, r12_34 = r0_34:GetCgThumbnailOnOff(g_GalleryInfo.CgPage, r7_34)
          if r9_34 ~= -1 then
            r3_34:setSubLayerVisible(r0_34.MenuInf.SetName, r11_34, r9_34, 0)
          end
          if r10_34 ~= -1 then
            r3_34:setSubLayerVisible(r0_34.MenuInf.SetName, r12_34, r10_34, 0)
          end
        end
      end
    end
    local r4_34 = 1
    for r8_34 = 1, r0_34.CgMenu.ThYLineMax, 1 do
      for r12_34 = 1, r0_34.CgMenu.ThXLineMax, 1 do
        local r13_34 = r0_34:GetCgFlag(r1_34, r4_34)
        local r14_34 = string.format("TH%d", r4_34)
        if r13_34 == 1 then
          r0_34.CgMenu.DataTh[r14_34]:bt_SetActive(0)
        end
        if r13_34 == 0 then
          r0_34.CgMenu.DataTh[r14_34]:bt_SetActive(2)
        end
        if r13_34 == -1 then
          r0_34.CgMenu.DataTh[r14_34]:bt_SetActive(3)
        end
        local r15_34 = r0_34.CgMenu.DataTh[r14_34].DRAW_POS.x + 8
        local r16_34 = r0_34.CgMenu.DataTh[r14_34].DRAW_POS.y + 8
        local r17_34 = 0
        local r18_34 = 0
        local r19_34 = r0_34.CgMenu.LayerName
        local r20_34 = r0_34.CgMenu.LayerNameOff
        r17_34, r18_34, r19_34, r20_34 = r0_34:GetCgThumbnailOnOff(r1_34, r4_34)
        if r13_34 == 1 then
          if r17_34 ~= -1 then
            r3_34:initSubLayer(r0_34.MenuInf.SetName, r19_34, r17_34, 1)
            if r15_34 ~= -1 and r16_34 ~= -1 then
              r3_34:setSubLayerParam(r0_34.MenuInf.SetName, r19_34, r17_34, LUA_PARAM_POS, r15_34, r16_34, 0, 0)
            end
            r3_34:setSubLayerVisible(r0_34.MenuInf.SetName, r19_34, r17_34, 0)
          end
          if r18_34 ~= -1 then
            r3_34:initSubLayer(r0_34.MenuInf.SetName, r20_34, r18_34, 1)
            if r15_34 ~= -1 and r16_34 ~= -1 then
              r3_34:setSubLayerParam(r0_34.MenuInf.SetName, r20_34, r18_34, LUA_PARAM_POS, r15_34, r16_34, 0, 0)
            end
            r3_34:setSubLayerVisible(r0_34.MenuInf.SetName, r20_34, r18_34, 1)
          end
        elseif r13_34 == 0 then
          if r17_34 ~= -1 then
            r3_34:initSubLayer(r0_34.MenuInf.SetName, r19_34, r17_34, 0)
            r3_34:setSubLayerVisible(r0_34.MenuInf.SetName, r19_34, r17_34, 0)
          end
          if r18_34 ~= -1 then
            r3_34:initSubLayer(r0_34.MenuInf.SetName, r20_34, r18_34, 0)
            r3_34:setSubLayerVisible(r0_34.MenuInf.SetName, r20_34, r18_34, 0)
          end
        end
        r4_34 = r4_34 + 1
      end
    end
    g_GalleryInfo.CgPage = r1_34
  end
end
GallerySceneMenu = function(r0_35)
  -- line: [1672, 2102] id: 35
  r0_35.SceneMenu = {}
  r0_35.SceneMenu.DataTh = {}
  r0_35.SceneMenu.keyname = "GalleryScene"
  r0_35.SceneMenu.LayerName = "SYS_SceneThumbnail"
  r0_35.SceneMenu.FileName = "SYS_GalleryCg.pna"
  r0_35.SceneMenu.ThFileName = "SYS_GalleryScThOn.pna"
  r0_35.SceneMenu.LayerNameOff = "SYS_SceneThumbnailOff"
  r0_35.SceneMenu.ThFileNameOff = "SYS_GalleryScThOff.pna"
  r0_35.SceneMenu.ThXLineMax = 3
  r0_35.SceneMenu.ThYLineMax = 3
  r0_35.SceneMenu.ThAllMax = r0_35.SceneMenu.ThXLineMax * r0_35.SceneMenu.ThYLineMax
  r0_35.SceneMenu.BarMoveNo = -1
  r0_35.SceneMenu.AllSceneMax = g_GalleryInfo.SceneThMax
  r0_35.SceneMenu.PageMax = 2
  function r0_35.ReplayMouseWheel(r0_36, r1_36, r2_36)
    -- line: [1706, 1707] id: 36
  end
  function r0_35.SceneButtonJob(r0_37, r1_37, r2_37, r3_37, r4_37)
    -- line: [1711, 1738] id: 37
    if nil and not nil then
      goto label_2	-- block#1 is visited secondly
    end
    if r2_37 == "LU" then
    end
    if r1_37 ~= 0 and r2_37 == "LU" then
      local r5_37 = 201 + r0_37.SceneMenu.ThAllMax
      if 201 <= r1_37 and r1_37 <= r5_37 then
        local r7_37 = r0_37:GetReplayRetNo(g_GalleryInfo.ScenePage, r1_37 - 200)
        cfunc.LegacyGame__lua_SetVariable(99, 2)
        cfunc.LegacyGame__lua_SetVariable(110, r7_37)
        r0_37:GalleryBgmStop()
        r0_37:closeGallery(2)
        g_menuExecute = false
      end
      if 101 <= r1_37 and r1_37 <= 115 then
        r0_37:ScenePageInit(r1_37 - 100, false)
      end
    end
  end
  function r0_35.InitSceneButton(r0_38, r1_38)
    -- line: [1742, 1779] id: 38
    local r2_38 = cclass.lua_Layers:create()
    r0_38.SceneMenu.DataPage = {}
    for r6_38 = 1, r0_38.SceneMenu.PageMax, 1 do
      local r7_38 = string.format("Page%d", r6_38)
      local r8_38 = 1 + (r6_38 - 1) * 6
      r0_38:MenuButtonSet(r0_38.SceneMenu.DataPage, r7_38, 1, r1_38, r8_38, r8_38, 2 + (r6_38 - 1) * 6, 3 + (r6_38 - 1) * 6, -1, 100 + r6_38, 0, 0)
    end
    r0_38.SceneMenu.DataTh = {}
    for r6_38 = 1, r0_38.SceneMenu.ThAllMax, 1 do
      local r7_38 = string.format("TH%d", r6_38)
      local r8_38 = 73 + r6_38 - 1
      r0_38:MenuButtonSet(r0_38.SceneMenu.DataTh, r7_38, 1, r1_38, r8_38, r8_38, 84 + r6_38 - 1, -1, 95 + r6_38 - 1, 200 + r6_38, 0, 0)
    end
  end
  function r0_35.InitSceneMenu(r0_39)
    -- line: [1782, 1809] id: 39
    local r1_39 = cclass.lua_Layers:create()
    r0_39:MenuLoadLayer(r0_39.SceneMenu.keyname, r0_39.SceneMenu.FileName)
    r0_39:LoadSceneThumbnail()
    r0_39:InitSceneButton(r0_39.SceneMenu.keyname)
    r0_39.MenuButton:SetList("BT_SceneDataPage", r0_39.SceneMenu.DataPage)
    r0_39.MenuButton:SetList("BT_SceneDataTh", r0_39.SceneMenu.DataTh)
    r0_39:MenuButtonInit()
    r1_39:initSubLayer(r0_39.MenuInf.SetName, r0_39.SceneMenu.keyname, 105, 1)
    r0_39:ScenePageInit(g_GalleryInfo.ScenePage, true)
    return r0_39.SceneMenu.keyname
  end
  function r0_35.GetReplayRetNo(r0_40, r1_40, r2_40)
    -- line: [1813, 1816] id: 40
    return r2_40 + (r1_40 - 1) * r0_40.SceneMenu.ThAllMax
  end
  function r0_35.GetReplayThumbnailOnOff(r0_41, r1_41, r2_41)
    -- line: [1819, 1833] id: 41
    return 0 + (r1_41 - 1) * 9 + r2_41 - 1, 0 + (r1_41 - 1) * 9 + r2_41 - 1, r0_41.SceneMenu.LayerName, r0_41.SceneMenu.LayerNameOff
  end
  function r0_35.LoadSceneThumbnail(r0_42)
    -- line: [1836, 1839] id: 42
    r0_42:MenuLoadLayer(r0_42.SceneMenu.LayerName, r0_42.SceneMenu.ThFileName)
    r0_42:MenuLoadLayer(r0_42.SceneMenu.LayerNameOff, r0_42.SceneMenu.ThFileNameOff)
  end
  function r0_35.DeleteSceneThumbnail(r0_43)
    -- line: [1842, 1846] id: 43
    local r1_43 = cclass.lua_Layers:create()
    r1_43:removeLayer(r0_43.MenuInf.SetName, r0_43.SceneMenu.LayerName)
    r1_43:removeLayer(r0_43.MenuInf.SetName, r0_43.SceneMenu.LayerNameOff)
  end
  function r0_35.DeleteReplayMenu(r0_44)
    -- line: [1849, 1853] id: 44
    cclass.lua_Layers:create():removeLayer(r0_44.MenuInf.SetName, r0_44.SceneMenu.keyname)
    r0_44:DeleteSceneThumbnail()
  end
  function r0_35.ReplayThumbnailEffect(r0_45, r1_45, r2_45, r3_45, r4_45, r5_45)
    -- line: [1857, 1894] id: 45
    local r6_45 = cclass.lua_Layers:create()
    if r5_45 == false then
      r6_45:setParam(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r6_45:setEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_45, 0, 0)
      r6_45:setParam(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r6_45:setEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_45, 0, 0)
      r6_45:setParam(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName, LUA_PARAM_POS, -1 * r2_45, 0, 0, 0)
      r6_45:setEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_45, 0, 0, 0, 0, r3_45, 0, 0)
      r6_45:setParam(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff, LUA_PARAM_POS, -1 * r2_45, 0, 0, 0)
      r6_45:setEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_POS, r2_45, 0, 0, 0, 0, r3_45, 0, 0)
      r6_45:startEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName, "GalleryPageEff", 0)
      r6_45:startEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff, "GalleryPageEff", 0)
    else
      r6_45:setParam(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r6_45:setEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_45, 0, 0)
      r6_45:setParam(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r6_45:setEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_45, 0, 0)
      r6_45:setEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_45, 0, 0, 0, 0, r3_45, 0, 0)
      r6_45:setEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_POS, r2_45, 0, 0, 0, 0, r3_45, 0, 0)
      r6_45:startEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName, "GalleryPageEff", 0)
      r6_45:startEffect(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff, "GalleryPageEff", 0)
    end
  end
  function r0_35.ReplayThumbnailOver(r0_46, r1_46, r2_46, r3_46, r4_46, r5_46, r6_46)
    -- line: [1897, 1937] id: 46
    local r7_46 = cclass.lua_Layers:create()
    local r8_46 = 0
    local r9_46 = 0
    local r10_46 = -1
    if r0_46.MenuButton.selCursor ~= -1 then
      r10_46 = r0_46.MenuButton.selListKey[r0_46.MenuButton.selCursor]
      r9_46 = r10_46.arg
      r8_46 = r10_46.bt_l
    end
    local r11_46 = -1
    local r12_46 = 201 + r0_46.SceneMenu.ThAllMax
    if 201 <= r8_46 and r8_46 <= r12_46 then
      r11_46 = r8_46 - 200
    end
    for r16_46 = 1, r0_46.SceneMenu.ThAllMax, 1 do
      if r0_46:GetSceneFlag(g_GalleryInfo.ScenePage, r16_46) == 1 then
        local r18_46 = 0
        local r19_46 = 0
        local r20_46 = r0_46.SceneMenu.LayerName
        local r21_46 = r0_46.SceneMenu.LayerNameOff
        r18_46, r19_46, r20_46, r21_46 = r0_46:GetReplayThumbnailOnOff(g_GalleryInfo.ScenePage, r16_46)
        if r18_46 ~= -1 and r19_46 ~= -1 then
          if r11_46 == r16_46 then
            r7_46:setSubLayerVisible(r0_46.MenuInf.SetName, r20_46, r18_46, 1)
            r7_46:setSubLayerVisible(r0_46.MenuInf.SetName, r21_46, r19_46, 0)
          else
            r7_46:setSubLayerVisible(r0_46.MenuInf.SetName, r20_46, r18_46, 0)
            r7_46:setSubLayerVisible(r0_46.MenuInf.SetName, r21_46, r19_46, 1)
          end
        end
      end
    end
  end
  function r0_35.GetSceneFlag(r0_47, r1_47, r2_47)
    -- line: [1941, 1997] id: 47
    local r3_47 = {
      REPLAY_001 = 1050,
      REPLAY_002 = 1051,
      REPLAY_003 = 1052,
      REPLAY_004 = 1053,
      REPLAY_005 = 1054,
      REPLAY_006 = 1055,
      REPLAY_007 = 1056,
      REPLAY_008 = 1057,
      REPLAY_009 = 1058,
      REPLAY_010 = 1059,
      REPLAY_011 = 1060,
      REPLAY_012 = 1061,
      REPLAY_013 = 1062,
      REPLAY_014 = 1063,
      REPLAY_015 = 1064,
      REPLAY_016 = 1065,
      REPLAY_017 = 1066,
    }
    local r4_47 = {
      r3_47.REPLAY_001,
      r3_47.REPLAY_002,
      r3_47.REPLAY_003,
      r3_47.REPLAY_004,
      r3_47.REPLAY_005,
      r3_47.REPLAY_006,
      r3_47.REPLAY_007,
      r3_47.REPLAY_008,
      r3_47.REPLAY_009,
      r3_47.REPLAY_010,
      r3_47.REPLAY_011,
      r3_47.REPLAY_012,
      r3_47.REPLAY_013,
      r3_47.REPLAY_014,
      r3_47.REPLAY_015,
      r3_47.REPLAY_016,
      r3_47.REPLAY_017
    }
    local r5_47 = (r1_47 - 1) * r0_47.SceneMenu.ThAllMax + r2_47
    if r0_47.SceneMenu.AllSceneMax < r5_47 then
      return -1
    end
    local r7_47 = r4_47[r5_47]
    if r7_47 == nil then
      return -1
    end
    local r8_47 = cfunc.LegacyGame__lua_GetFlag(r7_47)
    if true then
      return 1
    else
      return 0
    end
  end
  function r0_35.ScenePageInit(r0_48, r1_48, r2_48)
    -- line: [2001, 2100] id: 48
    for r6_48 = 1, r0_48.SceneMenu.PageMax, 1 do
      local r7_48 = string.format("Page%d", r6_48)
      if r6_48 == r1_48 then
        r0_48.SceneMenu.DataPage[r7_48]:bt_SetActive(1)
      else
        r0_48.SceneMenu.DataPage[r7_48]:bt_SetActive(0)
      end
    end
    local r3_48 = 1
    local r4_48 = cclass.lua_Layers:create()
    if r2_48 == false then
      for r8_48 = 1, r0_48.SceneMenu.ThAllMax, 1 do
        if r0_48:GetSceneFlag(g_GalleryInfo.ScenePage, r8_48) == 1 then
          local r10_48 = 0
          local r11_48 = 0
          local r12_48 = r0_48.SceneMenu.LayerName
          lay_off = r0_48.SceneMenu.LayerNameOff
          r10_48, r11_48, r12_48, lay_off = r0_48:GetReplayThumbnailOnOff(g_GalleryInfo.ScenePage, r8_48)
          if r10_48 ~= -1 then
            r4_48:setSubLayerVisible(r0_48.MenuInf.SetName, r12_48, r10_48, 0)
          end
          if r11_48 ~= -1 then
            r4_48:setSubLayerVisible(r0_48.MenuInf.SetName, lay_off, r11_48, 0)
          end
        end
      end
    end
    local r5_48 = 1
    for r9_48 = 1, r0_48.SceneMenu.ThYLineMax, 1 do
      for r13_48 = 1, r0_48.SceneMenu.ThXLineMax, 1 do
        local r14_48 = r0_48:GetSceneFlag(r1_48, r5_48)
        local r15_48 = string.format("TH%d", r5_48)
        if r14_48 == 1 then
          r0_48.SceneMenu.DataTh[r15_48]:bt_SetActive(0)
        end
        if r14_48 == 0 then
          r0_48.SceneMenu.DataTh[r15_48]:bt_SetActive(2)
        end
        if r14_48 == -1 then
          r0_48.SceneMenu.DataTh[r15_48]:bt_SetActive(3)
        end
        local r16_48 = r0_48.SceneMenu.DataTh[r15_48].DRAW_POS.x + 8
        local r17_48 = r0_48.SceneMenu.DataTh[r15_48].DRAW_POS.y + 8
        local r18_48 = 0
        local r19_48 = 0
        local r20_48 = r0_48.SceneMenu.LayerName
        lay_off = r0_48.SceneMenu.LayerNameOff
        r18_48, r19_48, r20_48, lay_off = r0_48:GetReplayThumbnailOnOff(r1_48, r5_48)
        if r14_48 == 1 then
          if r18_48 ~= -1 then
            r4_48:initSubLayer(r0_48.MenuInf.SetName, r20_48, r18_48, 0)
            if r16_48 ~= -1 and r17_48 ~= -1 then
              r4_48:setSubLayerParam(r0_48.MenuInf.SetName, r20_48, r18_48, LUA_PARAM_POS, r16_48, r17_48, 0, 0)
            end
            r4_48:setSubLayerVisible(r0_48.MenuInf.SetName, r20_48, r18_48, 0)
          end
          if r19_48 ~= -1 then
            r4_48:initSubLayer(r0_48.MenuInf.SetName, lay_off, r19_48, 0)
            if r16_48 ~= -1 and r17_48 ~= -1 then
              r4_48:setSubLayerParam(r0_48.MenuInf.SetName, lay_off, r19_48, LUA_PARAM_POS, r16_48, r17_48, 0, 0)
            end
            r4_48:setSubLayerVisible(r0_48.MenuInf.SetName, lay_off, r19_48, 1)
          end
        elseif r14_48 == 0 then
          if r18_48 ~= -1 then
            r4_48:initSubLayer(r0_48.MenuInf.SetName, r20_48, r18_48, 0)
            r4_48:setSubLayerVisible(r0_48.MenuInf.SetName, r20_48, r18_48, 0)
          end
          if r19_48 ~= -1 then
            r4_48:initSubLayer(r0_48.MenuInf.SetName, lay_off, r19_48, 0)
            r4_48:setSubLayerVisible(r0_48.MenuInf.SetName, lay_off, r19_48, 0)
          end
        end
        r5_48 = r5_48 + 1
      end
    end
    g_GalleryInfo.ScenePage = r1_48
  end
end
GalleryBgmMenu = function(r0_49)
  -- line: [2108, 2453] id: 49
  r0_49.BgmMenu = {}
  r0_49.BgmMenu.BgmSoundList = {}
  r0_49.BgmMenu.DataPage = {}
  r0_49.BgmMenu.keyname = "GalleryBgm"
  r0_49.BgmMenu.FileName = "SYS_GalleryBGM.pna"
  r0_49.BgmMenu.c_FileName = "SYS_c_GalleryBGM.pna"
  r0_49.BgmMenu.BGM_SoundNo = 0
  r0_49.BgmMenu.BGM_Max = 32
  function r0_49.SetBgmNo(r0_50, r1_50)
    -- line: [2124, 2126] id: 50
    r0_50.BgmMenu.BGM_SoundNo = r1_50
  end
  function r0_49.GetBgmNo(r0_51)
    -- line: [2128, 2130] id: 51
    return r0_51.BgmMenu.BGM_SoundNo
  end
  function r0_49.InitBgmButton(r0_52, r1_52)
    -- line: [2133, 2163] id: 52
    r0_52.BgmMenu.BgmSoundList = {}
    for r5_52 = 1, r0_52.BgmMenu.BGM_Max, 1 do
      local r6_52 = string.format("S%d", r5_52)
      local r7_52 = 2 + (r5_52 - 1) * 6
      r0_52:MenuButtonSet(r0_52.BgmMenu.BgmSoundList, r6_52, 1, r1_52, r7_52, r7_52, 1 + (r5_52 - 1) * 6, 3 + (r5_52 - 1) * 6, 4 + (r5_52 - 1) * 6, 300 + r5_52, 0, 0)
    end
    for r5_52 = 1, 2, 1 do
      local r6_52 = string.format("SPage%d", r5_52)
      local r7_52 = 193 + (r5_52 - 1) * 6
      r0_52:MenuButtonSet(r0_52.BgmMenu.DataPage, r6_52, 1, r1_52, r7_52, r7_52, 194 + (r5_52 - 1) * 6, 195 + (r5_52 - 1) * 6, -1, 100 + r5_52, 0, 0)
    end
  end
  function r0_49.InitBgmMenu(r0_53)
    -- line: [2166, 2190] id: 53
    local r1_53 = cclass.lua_Layers:create()
    if getUItype() == 1 then
      r0_53:MenuLoadLayer(r0_53.BgmMenu.keyname, r0_53.BgmMenu.c_FileName)
    else
      r0_53:MenuLoadLayer(r0_53.BgmMenu.keyname, r0_53.BgmMenu.FileName)
    end
    r1_53:setVisible(r0_53.MenuInf.SetName, r0_53.BgmMenu.keyname, 1)
    r0_53:InitBgmButton(r0_53.BgmMenu.keyname)
    r0_53.MenuButton:SetList("BT_BgmSoundList", r0_53.BgmMenu.BgmSoundList)
    r0_53.MenuButton:SetList("BT_DataPage", r0_53.BgmMenu.DataPage)
    r0_53:MenuButtonInit()
    r1_53:initSubLayer(r0_53.MenuInf.SetName, r0_53.BgmMenu.keyname, 204, 1)
    r0_53:BGMPageInit(g_GalleryInfo.BgmPage, g_GalleryInfo.BgmPage, true)
    return r0_53.BgmMenu.keyname
  end
  function r0_49.GallerySetBgmButton(r0_54, r1_54)
    -- line: [2192, 2219] id: 54
    if r0_54.BgmMenu.BGM_SoundNo ~= 0 and r0_54:GetBgmPageEnable(g_GalleryInfo.BgmPage, r0_54.BgmMenu.BGM_SoundNo) == true then
      local r3_54 = string.format("S%d", r0_54.BgmMenu.BGM_SoundNo)
      if r0_54.BgmMenu.BgmSoundList[r3_54] ~= nil then
        r0_54.BgmMenu.BgmSoundList[r3_54]:bt_SetActive(0)
      end
    end
    r0_54.BgmMenu.BgmSoundList[string.format("S%d", r1_54)]:bt_SetActive(1)
    r0_54.BT_DataBace.stop:bt_SetActive(0)
    local r3_54 = cclass.lua_Layers:create()
    local r4_54 = getEffectRate()
    r0_54.MenuInf.GalleryEff = true
    r0_54:GalleryBgmPlay(r1_54)
  end
  function r0_49.GalleryBgmPlay(r0_55, r1_55)
    -- line: [2221, 2262] id: 55
    r0_55.BgmMenu.BGM_SoundNo = r1_55
    cfunc.LegacyGame__lua_SetVariable(112, r0_55.BgmMenu.BGM_SoundNo)
    local r2_55 = {
      [1] = "bgm29.ogg",
      [2] = "bgm01.ogg",
      [3] = "bgm12.ogg",
      [4] = "bgm03.ogg",
      [5] = "bgm02.ogg",
      [6] = "bgm05.ogg",
      [7] = "bgm04.ogg",
      [8] = "bgm10.ogg",
      [9] = "bgm07.ogg",
      [10] = "bgm08a.ogg",
      [11] = "bgm09a.ogg",
      [12] = "bgm06.ogg",
      [13] = "bgm11.ogg",
      [14] = "bgm13.ogg",
      [15] = "bgm14.ogg",
      [16] = "bgm15.ogg",
      [17] = "bgm16.ogg",
      [18] = "bgm17.ogg",
      [19] = "bgm18a.ogg",
      [20] = "bgm19.ogg",
      [21] = "bgm20.ogg",
      [22] = "bgm21.ogg",
      [23] = "bgm22.ogg",
      [24] = "bgm23.ogg",
      [25] = "bgm24a.ogg",
      [26] = "bgm25.ogg",
      [27] = "bgm26.ogg",
      [28] = "bgm32.ogg",
      [29] = "bgm33.ogg",
      [30] = "bgm34.ogg",
      [31] = "bgm35.ogg",
      [32] = "bgm36.ogg",
    }
    local r3_55 = cclass.lua_Sounds:new()
    r3_55:BgmPlay("systembgm", getSoundArcFileName("BGM", ".ogg"), r2_55[r1_55], getSoundVolume("BGM"))
    r3_55:delete()
  end
  function r0_49.GalleryBgmStop(r0_56)
    -- line: [2265, 2285] id: 56
    if r0_56.BgmMenu.BGM_SoundNo > 0 then
      if g_GalleryInfo.Page == 3 and r0_56:GetBgmPageEnable(g_GalleryInfo.BgmPage, r0_56.BgmMenu.BGM_SoundNo) then
        local r1_56 = string.format("S%d", r0_56.BgmMenu.BGM_SoundNo)
        if r0_56.BgmMenu.BgmSoundList[r1_56] ~= nil then
          r0_56.BgmMenu.BgmSoundList[r1_56]:bt_SetActive(0)
        end
      end
      local r1_56 = cclass.lua_Sounds:new()
      r1_56:BgmStop("systembgm", 200)
      r1_56:delete()
      r0_56.BgmMenu.BGM_SoundNo = 0
      cfunc.LegacyGame__lua_SetVariable(112, r0_56.BgmMenu.BGM_SoundNo)
    end
  end
  function r0_49.GetBgmPageEnable(r0_57, r1_57, r2_57)
    -- line: [2288, 2306] id: 57
    if r1_57 > 2 then
      return false
    end
    if r1_57 == 1 and 20 < r2_57 then
      return false
    end
    if r1_57 == 2 and r2_57 <= 20 then
      return false
    end
    return true
  end
  function r0_49.GetBgmFlag(r0_58, r1_58, r2_58)
    -- line: [2309, 2397] id: 58
    local r3_58 = {
      BGM01 = 1020,
      BGM02 = 1021,
      BGM03 = 1022,
      BGM04 = 1023,
      BGM05 = 1024,
      BGM06 = 1025,
      BGM07 = 1026,
      BGM08 = 1027,
      BGM09 = 1028,
      BGM10 = 1029,
      BGM11 = 1030,
      BGM12 = 1031,
      BGM13 = 1032,
      BGM14 = 1033,
      BGM15 = 1034,
      BGM16 = 1035,
      BGM17 = 1036,
      BGM18 = 1037,
      BGM19 = 1038,
      BGM20 = 1039,
      BGM21 = 1040,
      BGM22 = 1041,
      BGM23 = 1042,
      BGM24 = 1043,
      BGM25 = 1044,
      BGM26 = 1045,
      BGM27 = 1046,
      BGM28 = 1047,
      BGM29 = 1048,
      BGM30 = 1049,
      BGM31 = 1050,
      BGM32 = 1051,
    }
    local r6_58 = ({
      r3_58.BGM01,
      r3_58.BGM02,
      r3_58.BGM03,
      r3_58.BGM04,
      r3_58.BGM05,
      r3_58.BGM06,
      r3_58.BGM07,
      r3_58.BGM08,
      r3_58.BGM09,
      r3_58.BGM10,
      r3_58.BGM11,
      r3_58.BGM12,
      r3_58.BGM13,
      r3_58.BGM14,
      r3_58.BGM15,
      r3_58.BGM16,
      r3_58.BGM17,
      r3_58.BGM18,
      r3_58.BGM19,
      r3_58.BGM20,
      r3_58.BGM21,
      r3_58.BGM22,
      r3_58.BGM23,
      r3_58.BGM24,
      r3_58.BGM25,
      r3_58.BGM26,
      r3_58.BGM27,
      r3_58.BGM28,
      r3_58.BGM29,
      r3_58.BGM30,
      r3_58.BGM31,
      r3_58.BGM32
    })[r2_58]
    if r6_58 == nil then
      return false
    end
    if cfunc.LegacyGame__lua_GetFlag(r6_58) then
      return true
    else
      return false
    end
  end
  function r0_49.BGMPageInit(r0_59, r1_59, r2_59, r3_59)
    -- line: [2400, 2430] id: 59
    g_GalleryInfo.BgmPage = r1_59
    if g_GalleryInfo.BgmPage == 1 then
      r0_59.BgmMenu.DataPage.SPage1:bt_SetActive(1)
      r0_59.BgmMenu.DataPage.SPage2:bt_SetActive(0)
    else
      r0_59.BgmMenu.DataPage.SPage1:bt_SetActive(0)
      r0_59.BgmMenu.DataPage.SPage2:bt_SetActive(1)
    end
    for r7_59 = 1, r0_59.BgmMenu.BGM_Max, 1 do
      local r8_59 = "S" .. tostring(r7_59)
      local r9_59 = string.format("S%d", r7_59)
      if r0_59:GetBgmPageEnable(r1_59, r7_59) then
        if r0_59:GetBgmFlag(r1_59, r7_59) then
          if r0_59.BgmMenu.BGM_SoundNo == r7_59 then
            r0_59.BgmMenu.BgmSoundList[r9_59]:bt_SetActive(1)
          else
            r0_59.BgmMenu.BgmSoundList[r9_59]:bt_SetActive(0)
          end
        else
          r0_59.BgmMenu.BgmSoundList[r9_59]:bt_SetActive(2)
        end
      else
        r0_59.BgmMenu.BgmSoundList[r9_59]:bt_SetActive(3)
      end
    end
  end
  function r0_49.GalleryBgmButtonJob(r0_60, r1_60)
    -- line: [2433, 2450] id: 60
    if 301 <= r1_60 and r1_60 <= 390 then
      r0_60.MenuButton.selDownCursor = -1
      r0_60.MenuButton.selDownKey = nil
      r0_60:GallerySetBgmButton(r1_60 - 300)
    end
    if r1_60 == 101 then
      r0_60:BGMPageInit(1, g_GalleryInfo.BgmPage, false)
    end
    if r1_60 == 102 then
      r0_60:BGMPageInit(2, g_GalleryInfo.BgmPage, false)
    end
  end
end
if g_EnableTips then
  GalleryTipsMenu = function(r0_61)
    -- line: [2460, 2734] id: 61
    r0_61.TipsMenu = {}
    r0_61.TipsMenu.DataPage = {}
    r0_61.TipsMenu.keyname = "GalleryTips"
    r0_61.TipsMenu.FileName = "SYS_GalleryTips.pna"
    g_GalleryInfo.TipsPageMax = 4
    function r0_61.InitTipsButton(r0_62, r1_62)
      -- line: [2474, 2490] id: 62
      r0_62.TipsMenu.DataPage = {}
      for r5_62 = 1, g_GalleryInfo.TipsPageMax, 1 do
        local r6_62 = string.format("P%d", r5_62)
        local r7_62 = 130 - r5_62 - 1
        r0_62:MenuButtonSet(r0_62.TipsMenu.DataPage, r6_62, 1, r1_62, r7_62, r7_62, 106 - r5_62 - 1, 118 - r5_62 - 1, -1, 100 + r5_62, 0, 0)
      end
    end
    function r0_61.TipsMouseMove(r0_63, r1_63, r2_63, r3_63, r4_63, r5_63, r6_63)
      -- line: [2493, 2495] id: 63
    end
    function r0_61.DeleteTipsThumbnail(r0_64, r1_64)
      -- line: [2498, 2503] id: 64
      if r1_64 ~= -1 then
        local r2_64 = cclass.lua_Layers:create()
      end
    end
    function r0_61.LoadTipsThumbnail(r0_65, r1_65)
      -- line: [2507, 2509] id: 65
    end
    function r0_61.InitTipsMenu(r0_66)
      -- line: [2512, 2537] id: 66
      local r1_66 = cclass.lua_Layers:create()
      r0_66:MenuLoadLayer(r0_66.TipsMenu.keyname, r0_66.TipsMenu.FileName)
      r1_66:swapLayerOrder("Gallery", "GalleryBace", r0_66.TipsMenu.keyname)
      r1_66:setVisible(r0_66.MenuInf.SetName, r0_66.TipsMenu.keyname, 1)
      r0_66:InitTipsButton(r0_66.TipsMenu.keyname)
      r0_66.MenuButton:SetList("BT_DataPage", r0_66.TipsMenu.DataPage)
      r0_66:MenuButtonInit()
      r1_66:initSubLayer(r0_66.MenuInf.SetName, r0_66.TipsMenu.keyname, 133, 1)
      r0_66:TipsPageInit(g_GalleryInfo.TipsPage, -1, true)
      return r0_66.TipsMenu.keyname
    end
    function r0_61.DeleteTipsMenu(r0_67)
      -- line: [2541, 2545] id: 67
      cclass.lua_Layers:create():removeLayer(r0_67.MenuInf.SetName, r0_67.TipsMenu.keyname)
    end
    function r0_61.TipsThumbnailEffect(r0_68, r1_68, r2_68, r3_68, r4_68, r5_68)
      -- line: [2548, 2570] id: 68
    end
    function r0_61.TipsLayer(r0_69, r1_69, r2_69)
      -- line: [2574, 2588] id: 69
      local r3_69 = -1
      local r4_69 = -1
      if r1_69 == 4 then
        if r2_69 <= 7 then
          r3_69 = 19 - r2_69 - 1
          r4_69 = 10 - r2_69 - 1
        end
      else
        r3_69 = 91 - r2_69 - 1 - 24 * (r1_69 - 1)
        r4_69 = 80 - r2_69 - 1 - 24 * (r1_69 - 1)
      end
      return r3_69, r4_69
    end
    function r0_61.TipsPageInit(r0_70, r1_70, r2_70, r3_70)
      -- line: [2591, 2642] id: 70
      g_GalleryInfo.TipsPage = r1_70
      local r4_70 = cclass.lua_Layers:create()
      for r8_70 = 1, g_GalleryInfo.TipsPageMax, 1 do
        local r9_70 = string.format("P%d", g_GalleryInfo.TipsPage)
        for r13_70, r14_70 in pairs(r0_70.TipsMenu.DataPage) do
          if r14_70.arg == r9_70 then
            r14_70:bt_SetActive(1)
          else
            r14_70:bt_SetActive(0)
          end
        end
      end
      for r8_70 = 1, 9, 1 do
        if r2_70 ~= -1 then
          lay_dis, lay_def = r0_70:TipsLayer(r2_70, r8_70)
          if lay_dis ~= -1 then
            r4_70:setSubLayerVisible(r0_70.MenuInf.SetName, r0_70.TipsMenu.keyname, lay_dis, 0)
          end
          if lay_def ~= -1 then
            r4_70:setSubLayerVisible(r0_70.MenuInf.SetName, r0_70.TipsMenu.keyname, lay_def, 0)
          end
        end
        lay_dis, lay_def = r0_70:TipsLayer(r1_70, r8_70)
        local r9_70 = r0_70:GetTipsFlag(r1_70, r8_70)
        if r9_70 == 1 and lay_def ~= -1 then
          r4_70:initSubLayer(r0_70.MenuInf.SetName, r0_70.TipsMenu.keyname, lay_def, 0)
          r4_70:setSubLayerVisible(r0_70.MenuInf.SetName, r0_70.TipsMenu.keyname, lay_def, 1)
        end
        if r9_70 == 0 and lay_dis ~= -1 then
          r4_70:initSubLayer(r0_70.MenuInf.SetName, r0_70.TipsMenu.keyname, lay_dis, 0)
          r4_70:setSubLayerVisible(r0_70.MenuInf.SetName, r0_70.TipsMenu.keyname, lay_dis, 1)
        end
      end
      r0_70:DeleteTipsThumbnail(r2_70)
      r0_70:LoadTipsThumbnail(r1_70)
    end
    function r0_61.GalleryTipsButtonJob(r0_71, r1_71)
      -- line: [2645, 2657] id: 71
      if 401 <= r1_71 and r1_71 <= 430 then
        local r2_71 = r1_71 - 400
        r0_71.MenuButton.selDownCursor = -1
        r0_71.MenuButton.selDownKey = nil
      end
      if 101 <= r1_71 and r1_71 <= 110 then
        r0_71:TipsPageInit(r1_71 - 100, g_GalleryInfo.TipsPage, false)
      end
    end
    function r0_61.GetTipsFlag(r0_72, r1_72, r2_72)
      -- line: [2662, 2732] id: 72
      local r3_72 = {
        TIPS_001 = 1080,
        TIPS_002 = 1081,
        TIPS_003 = 1082,
        TIPS_004 = 1083,
        TIPS_005 = 1084,
        TIPS_006 = 1085,
        TIPS_007 = 1086,
        TIPS_008 = 1087,
        TIPS_009 = 1088,
        TIPS_010 = 1089,
        TIPS_011 = 1090,
        TIPS_012 = 1091,
        TIPS_013 = 1092,
        TIPS_014 = 1093,
        TIPS_015 = 1094,
        TIPS_016 = 1095,
        TIPS_017 = 1096,
        TIPS_018 = 1097,
        TIPS_019 = 1098,
        TIPS_020 = 1099,
        TIPS_021 = 1100,
        TIPS_022 = 1101,
        TIPS_023 = 1102,
        TIPS_024 = 1103,
        TIPS_025 = 1104,
        TIPS_026 = 1105,
        TIPS_027 = 1106,
        TIPS_028 = 1107,
        TIPS_029 = 1108,
        TIPS_030 = 1109,
        TIPS_031 = 1110,
        TIPS_032 = 1111,
        TIPS_033 = 1112,
        TIPS_034 = 1113,
      }
      local r4_72 = {
        {
          r3_72.TIPS_001,
          r3_72.TIPS_002,
          r3_72.TIPS_003,
          r3_72.TIPS_004,
          r3_72.TIPS_005,
          r3_72.TIPS_007,
          r3_72.TIPS_006,
          r3_72.TIPS_008,
          r3_72.TIPS_009
        },
        {
          r3_72.TIPS_010,
          r3_72.TIPS_011,
          r3_72.TIPS_012,
          r3_72.TIPS_013,
          r3_72.TIPS_014,
          r3_72.TIPS_015,
          r3_72.TIPS_016,
          r3_72.TIPS_017,
          r3_72.TIPS_018
        },
        {
          r3_72.TIPS_019,
          r3_72.TIPS_020,
          r3_72.TIPS_021,
          r3_72.TIPS_022,
          r3_72.TIPS_023,
          r3_72.TIPS_024,
          r3_72.TIPS_025,
          r3_72.TIPS_026,
          r3_72.TIPS_027
        },
        {
          r3_72.TIPS_028,
          r3_72.TIPS_029,
          r3_72.TIPS_030,
          r3_72.TIPS_031,
          r3_72.TIPS_032,
          r3_72.TIPS_033,
          r3_72.TIPS_034,
          nil,
          nil
        }
      }
      local r5_72 = 0
      if r4_72[r1_72][r2_72] ~= nil then
        if cfunc.LegacyGame__lua_GetFlag(r4_72[r1_72][r2_72]) then
          r5_72 = 1
        else
          r5_72 = 0
        end
      else
        r5_72 = -1
      end
      return r5_72
    end
  end
end
GalleryCharacterMenu = function(r0_73)
  -- line: [2744, 4143] id: 73
  function r0_73.MenuCharaGetItemName(r0_74, r1_74)
    -- line: [2747, 2751] id: 74
    return ({
      "char",
      "size",
      "pose",
      "poDi",
      "clot",
      "expr",
      "opex",
      "back",
      "time",
      "chEn",
      "bgEn"
    })[r1_74]
  end
  function r0_73.ItemParamSet(r0_75, r1_75)
    -- line: [2754, 2762] id: 75
    local r2_75 = {}
    for r6_75 = 1, 9, 1 do
      r2_75[r0_75:MenuCharaGetItemName(r6_75)] = r1_75
    end
    return r2_75
  end
  function r0_73.MenuItemChara(r0_76, r1_76, r2_76, r3_76, r4_76)
    -- line: [2764, 2777] id: 76
    local r5_76 = MenuItem.new(r1_76, r2_76, -1, -1)
    r5_76:addLayer("act", r3_76)
    r5_76:addLayer("dis", r4_76)
    r5_76.actKey = -2
    r5_76:SetAct("def")
    r5_76.enable = true
    return r5_76
  end
  r0_73.CharEnable = true
  r0_73.BackEnable = true
  r0_73.BT_CharaPage = {}
  r0_73.ChItem = {}
  r0_73.ChItemData = {}
  function r0_73.GalleryCharaPage(r0_77)
    -- line: [2789, 2910] id: 77
    r0_77.BT_CharaPage = {}
    r0_77:MenuButtonSet(r0_77.BT_CharaPage, "ChClose", 1, "GalleryChara", 502, 502, 503, -1, -1, 500, 0, 0)
    for r4_77 = 1, 11, 1 do
      local r7_77 = r4_77 - 1 + 429
      r0_77:MenuButtonSet(r0_77.BT_CharaPage, "ChOptionL" .. r0_77:MenuCharaGetItemName(r4_77), 1, "GalleryChara", r4_77 - 1 + 477, r4_77 - 1 + 405, r7_77, r7_77, r4_77 - 1 + 453, 400 + r4_77, 0, 0)
    end
    for r4_77 = 1, 11, 1 do
      local r7_77 = r4_77 - 1 + 440
      r0_77:MenuButtonSet(r0_77.BT_CharaPage, "ChOptionR" .. r0_77:MenuCharaGetItemName(r4_77), 1, "GalleryChara", r4_77 - 1 + 488, r4_77 - 1 + 416, r7_77, r7_77, r4_77 - 1 + 464, 420 + r4_77, 0, 0)
    end
    r0_77.ChItem = r0_77:ItemSetInit(1)
    for r4_77 = 1, 11, 1 do
      r0_77.ChItem["OptionItem" .. r0_77:MenuCharaGetItemName(r4_77)] = MenuItem.new("Gallery", "GalleryChara", 3 + r4_77 - 1, 16 + r4_77 - 1)
    end
    r0_77.ChItemData = {}
    r0_77.ChItemData.IT = r0_77:ItemParamSet(1)
    r0_77.ChItemData.IT_dat = r0_77:ItemParamSet(0)
    r0_77.ChItemData.IT_max = r0_77:ItemParamSet(0)
    r0_77.ChItemData.IT_dat.char = cfunc.LegacyGame__lua_GetVariable(115)
    r0_77.ChItemData.IT_dat.size = cfunc.LegacyGame__lua_GetVariable(116)
    r0_77.ChItemData.IT_dat.pose = cfunc.LegacyGame__lua_GetVariable(117)
    r0_77.ChItemData.IT_dat.poDi = cfunc.LegacyGame__lua_GetVariable(118)
    r0_77.ChItemData.IT_dat.clot = cfunc.LegacyGame__lua_GetVariable(119)
    r0_77.ChItemData.IT_dat.expr = cfunc.LegacyGame__lua_GetVariable(120)
    r0_77.ChItemData.IT_dat.opex = cfunc.LegacyGame__lua_GetVariable(121)
    r0_77.ChItemData.IT_dat.back = cfunc.LegacyGame__lua_GetVariable(122)
    r0_77.ChItemData.IT_dat.time = cfunc.LegacyGame__lua_GetVariable(123)
    r0_77.CharEnable = true
    r0_77.BackEnable = true
    r0_77.ChItemData.Max = r0_77:ItemParamSet(0)
    r0_77.ChItemData.Max.char = 23
    r0_77.ChItemData.Max.size = 4
    r0_77.ChItemData.Max.pose = 5
    r0_77.ChItemData.Max.poDi = 7
    r0_77.ChItemData.Max.clot = 7
    r0_77.ChItemData.Max.expr = 60
    r0_77.ChItemData.Max.opex = 5
    r0_77.ChItemData.Max.back = 35
    r0_77.ChItemData.Max.time = 20
    r0_77.ChItemData.IT_max.char = 23
    r0_77.ChItemData.IT_max.back = 35
    local r1_77 = r0_77:ItemParamSet(0)
    local r2_77 = r0_77:ItemParamSet(0)
    r1_77.char = 213
    r1_77.size = 188
    r1_77.pose = 182
    r1_77.poDi = 175
    r1_77.clot = 166
    r1_77.expr = 157
    r1_77.opex = 95
    r1_77.back = 88
    r1_77.time = 51
    r2_77.char = 399
    r2_77.size = 374
    r2_77.pose = 368
    r2_77.poDi = 361
    r2_77.clot = 352
    r2_77.expr = 343
    r2_77.opex = 281
    r2_77.back = 274
    r2_77.time = 237
    r0_77.ChItemData.Data = {}
    for r6_77 = 1, 9, 1 do
      local r7_77 = r0_77:MenuCharaGetItemName(r6_77)
      r0_77.ChItemData.Data[r7_77] = {}
      for r11_77 = 1, r0_77.ChItemData.Max[r7_77], 1 do
        r0_77.ChItemData.Data[r7_77][r11_77] = r0_77:MenuItemChara("Gallery", "GalleryChara", r1_77[r7_77] - r11_77 - 1, r2_77[r7_77] - r11_77 - 1)
        r0_77.ChItemData.Data[r7_77][r11_77]:SetAct("def")
      end
    end
    r0_77:GalleryCharaSetCharaParamInit()
    r0_77:GalleryCharaSetCharaParam("char")
    r0_77:GalleryCharaSetBackParam(1)
  end
  function r0_73.GalleryCharaChangeItem(r0_78, r1_78, r2_78)
    -- line: [2913, 2945] id: 78
    local r3_78 = r0_78:MenuCharaGetItemName(r2_78)
    local r4_78 = r0_78.ChItemData.IT[r3_78]
    for r8_78 = 1, r0_78.ChItemData.Max[r3_78], 1 do
      if r1_78 == 0 then
        r4_78 = r4_78 - 1
        if r4_78 <= 0 then
          r4_78 = r0_78.ChItemData.Max[r3_78]
        end
      else
        r4_78 = r4_78 + 1
        if r0_78.ChItemData.Max[r3_78] < r4_78 then
          r4_78 = 1
        end
      end
      if r0_78.ChItemData.Data[r3_78][r4_78].enable == true then
        break
      end
    end
    r0_78.ChItemData.IT[r3_78] = r4_78
    if r3_78 == "char" or r3_78 == "size" or r3_78 == "pose" then
      r0_78:GalleryCharaSetCharaParam(r3_78)
    end
    if r3_78 == "back" then
      r0_78:GalleryCharaSetBackParam(r4_78)
    end
  end
  r0_73.GalleryCharaParamInit = false
  function r0_73.GalleryCharaSetCharaParamInit(r0_79)
    -- line: [2948, 2965] id: 79
    r0_79.GalleryCharaParamInit = true
    local function r1_79(r0_80, r1_80, r2_80, r3_80, r4_80, r5_80, r6_80)
      -- line: [2953, 2963] id: 80
      return {
        char = r0_80,
        size = r1_80,
        pose = r2_80,
        poDi = r3_80,
        clot = r4_80,
        expr = r5_80,
        opex = r6_80,
      }
    end
  end
  function r0_73.GalleryCharaSetCharaParam(r0_81, r1_81)
    -- line: [2968, 3093] id: 81
    if r1_81 == "back" or r1_81 == "time" then
      return 
    end
    for r5_81 = 1, 7, 1 do
      local r6_81 = r0_81:MenuCharaGetItemName(r5_81)
      if r1_81 == "char" and r6_81 ~= "char" then
        r0_81.ChItemData.IT[r6_81] = 1
      end
      if r1_81 == "pose" and r6_81 ~= "pose" and r6_81 ~= "char" and r6_81 ~= "size" then
        r0_81.ChItemData.IT[r6_81] = 1
      end
    end
    local r2_81 = r0_81.ChItemData.IT.char
    local r3_81 = r0_81.ChItemData.IT.pose
    for r7_81 = 1, 7, 1 do
      local r8_81 = r0_81:MenuCharaGetItemName(r7_81)
      if r8_81 == "size" then
        for r12_81 = 1, r0_81.ChItemData.Max[r8_81], 1 do
          if r0_81.CharaFile[r2_81][r3_81][r12_81] ~= nil then
            r0_81.ChItemData.Data[r8_81][r12_81].enable = true
          else
            r0_81.ChItemData.Data[r8_81][r12_81].enable = false
          end
        end
      end
      if r8_81 == "pose" then
        for r12_81 = 1, r0_81.ChItemData.Max[r8_81], 1 do
          if r12_81 <= #r0_81.CharaLayer[r2_81] then
            r0_81.ChItemData.Data[r8_81][r12_81].enable = true
          else
            r0_81.ChItemData.Data[r8_81][r12_81].enable = false
          end
        end
      end
      if r8_81 == "poDi" then
        for r12_81 = 1, r0_81.ChItemData.Max[r8_81], 1 do
          if r12_81 <= r0_81.CharaLayer[r2_81][r3_81].poDi then
            r0_81.ChItemData.Data[r8_81][r12_81].enable = true
          else
            r0_81.ChItemData.Data[r8_81][r12_81].enable = false
          end
        end
      end
      if r8_81 == "clot" then
        for r12_81 = 1, r0_81.ChItemData.Max[r8_81], 1 do
          if r0_81.CharaLayer[r2_81][r3_81].clot[r12_81] ~= -1 then
            r0_81.ChItemData.Data[r8_81][r12_81].enable = true
          else
            r0_81.ChItemData.Data[r8_81][r12_81].enable = false
          end
        end
      end
      if r8_81 == "expr" then
        local r9_81 = r0_81.CharaLayer[r2_81][r3_81].expr1[1] - r0_81.CharaLayer[r2_81][r3_81].expr1[2] + 1
        if r2_81 == 23 then
          r9_81 = 6
        end
        for r13_81 = 1, r0_81.ChItemData.Max[r8_81], 1 do
          if r13_81 <= r9_81 then
            r0_81.ChItemData.Data[r8_81][r13_81].enable = true
          else
            r0_81.ChItemData.Data[r8_81][r13_81].enable = false
          end
        end
      end
      if r8_81 == "opex" then
        r0_81.ChItemData.Data[r8_81][1].enable = true
        for r12_81 = 2, 4, 1 do
          if r0_81.CharaLayer[r2_81][r3_81].opex[r12_81 - 1] ~= -1 then
            r0_81.ChItemData.Data[r8_81][r12_81].enable = true
          else
            r0_81.ChItemData.Data[r8_81][r12_81].enable = false
          end
        end
        if r0_81.CharaLayer[r2_81][r3_81].opex[1] ~= -1 and r0_81.CharaLayer[r2_81][r3_81].opex[3] ~= -1 then
          r0_81.ChItemData.Data[r8_81][5].enable = true
        else
          r0_81.ChItemData.Data[r8_81][5].enable = false
        end
      end
      if r8_81 ~= "char" then
        local r9_81 = 0
        local r10_81 = 0
        local r11_81 = false
        for r15_81 = 1, r0_81.ChItemData.Max[r8_81], 1 do
          if r0_81.ChItemData.Data[r8_81][r15_81].enable == true then
            r9_81 = r9_81 + 1
            if r10_81 == 0 then
              r10_81 = r15_81
            end
          elseif r0_81.ChItemData.IT[r8_81] == r15_81 then
            r11_81 = true
          end
        end
        r0_81.ChItemData.IT_max[r8_81] = r9_81
        if r11_81 == true then
          r0_81.ChItemData.IT[r8_81] = r10_81
        end
      end
    end
  end
  function r0_73.GalleryCharaSetBackParam(r0_82, r1_82)
    -- line: [3096, 3119] id: 82
    r0_82.ChItemData.IT.time = 1
    r0_82.ChItemData.IT_max.time = #r0_82.BackFile[r1_82]
    for r5_82 = 1, r0_82.ChItemData.Max.time, 1 do
      if r5_82 <= r0_82.ChItemData.IT_max.time then
        r0_82.ChItemData.Data.time[r5_82].enable = true
      else
        r0_82.ChItemData.Data.time[r5_82].enable = false
      end
    end
    r0_82.BackPosY = 0
    if r1_82 == 16 then
      r0_82.BackPosY = -550
    end
    if r1_82 == 27 then
      r0_82.BackPosY = 0
    end
    if r1_82 == 1 then
      r0_82.BackPosY = -550
    end
  end
  function r0_73.GalleryCharaWheel(r0_83, r1_83)
    -- line: [3122, 3146] id: 83
    if r0_83:GetMenuMouseEnable() and r1_83 ~= 0 and (r0_83.ChItemData.IT.back == 1 or r0_83.ChItemData.IT.back == 16 or r0_83.ChItemData.IT.back == 27) then
      r0_83.BackPosY = r0_83.BackPosY + r1_83 * 20
      if r0_83.BackPosY > 0 then
        r0_83.BackPosY = 0
      end
      if r0_83.ChItemData.IT.back == 16 and r0_83.BackPosY < -560 then
        r0_83.BackPosY = -560
      elseif r0_83.ChItemData.IT.back == 27 and r0_83.BackPosY < -240 then
        r0_83.BackPosY = -240
      elseif r0_83.BackPosY < -720 then
        r0_83.BackPosY = -720
      end
      cclass.lua_Layers:create():setParam("Gallery", "GalleryBack", LUA_PARAM_POS, 0, r0_83.BackPosY, 0, 0)
    end
  end
  function r0_73.GalleryCharaAct(r0_84)
    -- line: [3150, 3241] id: 84
    local r1_84 = ""
    local r2_84 = ""
    for r6_84, r7_84 in pairs(r0_84.ChItemData.Data) do
      local r8_84 = r0_84.ChItemData.IT_max[r6_84]
      if r0_84.ChItemData.IT.char == 7 and r0_84.ChItemData.IT.pose == 2 and r0_84.ChItemData.IT.clot ~= 5 and r0_84.ChItemData.IT.clot ~= 6 and r6_84 == "poDi" then
        r0_84.ChItemData.IT[r6_84] = 1
        r8_84 = 1
      end
      if r0_84.ChItemData.IT_dat[r6_84] ~= 0 then
        r7_84[r0_84.ChItemData.IT_dat[r6_84]]:SetAct("def")
      end
      r0_84.ChItemData.IT_dat[r6_84] = r0_84.ChItemData.IT[r6_84]
      r1_84 = "ChOptionL" .. r6_84
      r2_84 = "ChOptionR" .. r6_84
      if r8_84 > 1 then
        r0_84.BT_CharaPage[r1_84]:bt_SetActive(0)
        r0_84.BT_CharaPage[r2_84]:bt_SetActive(0)
        r7_84[r0_84.ChItemData.IT_dat[r6_84]]:SetAct("act")
      else
        r0_84.BT_CharaPage[r1_84]:bt_SetActive(2)
        r0_84.BT_CharaPage[r2_84]:bt_SetActive(2)
        r7_84[r0_84.ChItemData.IT_dat[r6_84]]:SetAct("dis")
      end
    end
    r1_84 = "ChOptionL" .. r0_84:MenuCharaGetItemName(10)
    r2_84 = "ChOptionR" .. r0_84:MenuCharaGetItemName(10)
    if r0_84.CharEnable == true then
      r0_84.BT_CharaPage[r1_84]:bt_SetActive(1)
      r0_84.BT_CharaPage[r2_84]:bt_SetActive(0)
    else
      r0_84.BT_CharaPage[r1_84]:bt_SetActive(0)
      r0_84.BT_CharaPage[r2_84]:bt_SetActive(1)
    end
    r1_84 = "ChOptionL" .. r0_84:MenuCharaGetItemName(11)
    r2_84 = "ChOptionR" .. r0_84:MenuCharaGetItemName(11)
    if r0_84.BackEnable == true then
      r0_84.BT_CharaPage[r1_84]:bt_SetActive(1)
      r0_84.BT_CharaPage[r2_84]:bt_SetActive(0)
    else
      r0_84.BT_CharaPage[r1_84]:bt_SetActive(0)
      r0_84.BT_CharaPage[r2_84]:bt_SetActive(1)
    end
    cfunc.LegacyGame__lua_SetVariable(115, r0_84.ChItemData.IT_dat.char)
    cfunc.LegacyGame__lua_SetVariable(116, r0_84.ChItemData.IT_dat.size)
    cfunc.LegacyGame__lua_SetVariable(117, r0_84.ChItemData.IT_dat.pose)
    cfunc.LegacyGame__lua_SetVariable(118, r0_84.ChItemData.IT_dat.poDi)
    cfunc.LegacyGame__lua_SetVariable(119, r0_84.ChItemData.IT_dat.clot)
    cfunc.LegacyGame__lua_SetVariable(120, r0_84.ChItemData.IT_dat.expr)
    cfunc.LegacyGame__lua_SetVariable(121, r0_84.ChItemData.IT_dat.opex)
    cfunc.LegacyGame__lua_SetVariable(122, r0_84.ChItemData.IT_dat.back)
    cfunc.LegacyGame__lua_SetVariable(123, r0_84.ChItemData.IT_dat.time)
    r0_84:GalleryCharaDeletePic()
    r0_84:GalleryCharaSetPic(false)
    local r3_84 = cclass.lua_Layers:create()
  end
  function r0_73.GalleryCharaSelCursor(r0_85, r1_85, r2_85, r3_85, r4_85, r5_85, r6_85)
    -- line: [3246, 3274] id: 85
    local r7_85 = r0_85.MenuButton.selCursor
    local r8_85 = 0
    local r9_85 = 0
    if r7_85 ~= -1 then
      bt = r0_85.MenuButton.selListKey[r7_85]
      r9_85 = bt.arg
      r8_85 = bt.bt_l
    end
    if r7_85 == -1 then
      r0_85:ItemSet(r0_85.ChItem, -1, -1)
    elseif 401 <= r8_85 and r8_85 <= 431 then
      local r10_85 = 0
      if r8_85 <= 420 then
        r10_85 = r8_85 - 400
      else
        r10_85 = r8_85 - 420
      end
      r0_85:ItemSet(r0_85.ChItem, r7_85, "OptionItem" .. r0_85:MenuCharaGetItemName(r10_85))
    else
      r0_85:ItemSet(r0_85.ChItem, -1, -1)
    end
  end
  function r0_73.GalleryCharaMenuClose(r0_86, r1_86)
    -- line: [3277, 3304] id: 86
    local r2_86 = cclass.lua_Layers:create()
    if r1_86 then
      r2_86:setVisible("Gallery", "GalleryChara", 0)
      r2_86:setVisible("Gallery", "GalleryBace", 0)
      r0_86.MenuButton:InitList()
      r2_86:setSubLayerParam("Gallery", "GalleryBace", 49, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_86:setSubLayerParam("Gallery", "GalleryBace", 51, LUA_PARAM_COLOR, 1, 1, 1, 0)
    else
      r2_86:setVisible("Gallery", "GalleryChara", 1)
      r2_86:setVisible("Gallery", "GalleryBace", 1)
      r0_86.MenuButton:InitList()
      r0_86.MenuButton:SetList("BT_CharaPage", r0_86.BT_CharaPage)
      r0_86.MenuButton:SetList("BT_DataBace", r0_86.BT_DataBace)
      r2_86:setSubLayerParam("Gallery", "GalleryBace", 49, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r2_86:setSubLayerParam("Gallery", "GalleryBace", 51, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r0_86:MenuMouseMove("Gallery", "GalleryBace", -1, 0, 0, 0)
    end
  end
  function r0_73.CharaButtonJob(r0_87, r1_87, r2_87, r3_87, r4_87)
    -- line: [3306, 3352] id: 87
    local r5_87 = cclass.lua_Layers:create()
    if r0_87:GetMenuMouseEnable() and r2_87 == "LU" then
      if r5_87:isVisible("Gallery", "GalleryChara") == false then
        r0_87:GalleryCharaMenuClose(false)
      else
        if 401 <= r1_87 and r1_87 <= 409 then
          r0_87:GalleryCharaChangeItem(0, r1_87 - 400)
        end
        if 421 <= r1_87 and r1_87 <= 429 then
          r0_87:GalleryCharaChangeItem(1, r1_87 - 420)
        end
        if r1_87 == 410 then
          r0_87.CharEnable = true
        end
        if r1_87 == 411 then
          r0_87.BackEnable = true
        end
        if r1_87 == 430 then
          r0_87.CharEnable = false
        end
        if r1_87 == 431 then
          r0_87.BackEnable = false
        end
        if r1_87 == 500 then
          r0_87:GalleryCharaMenuClose(true)
        end
        if r1_87 == 500 or 401 <= r1_87 and r1_87 <= 432 then
          r0_87:GalleryCharaAct()
        end
      end
    end
  end
  function r0_73.CharaButtonRUJob(r0_88)
    -- line: [3354, 3362] id: 88
    if cclass.lua_Layers:create():isVisible("Gallery", "GalleryChara") == false then
      r0_88:GalleryCharaMenuClose(false)
      return true
    end
    return false
  end
  r0_73.BackPosY = 0
  function r0_73.GalleryCharaSetPicInit(r0_89)
    -- line: [3368, 3876] id: 89
    r0_89.BackPosY = 0
    r0_89.BackFile = {}
    r0_89.BackFile[1] = {
      "BG01_01S.png",
      "BG01_02S.png",
      "BG01_03S.png",
      "BG01_04S.png",
      "BG01_14S.png"
    }
    r0_89.BackFile[2] = {
      "BG02_01S.png",
      "BG02_02S.png",
      "BG02_03S.png",
      "BG02_04S.png",
      "BG02_05S.png"
    }
    r0_89.BackFile[3] = {
      "BG03_01S.png",
      "BG03_02S.png",
      "BG03_05S.png"
    }
    r0_89.BackFile[4] = {
      "BG04_01S.png",
      "BG04_02S.png",
      "BG04_05S.png"
    }
    r0_89.BackFile[5] = {
      "BG05A_01S.png",
      "BG05B_01S.png",
      "BG05B_02S.png",
      "BG05B_03S.png",
      "BG05B_04S.png",
      "BG05B_05S.png",
      "BG05C_01S.png",
      "BG05C_02S.png",
      "BG05C_03S.png",
      "BG05C_04S.png",
      "BG05C_05S.png",
      "BG05E_01S.png",
      "BG05E_02S.png",
      "BG05E_03S.png"
    }
    r0_89.BackFile[6] = {
      "BG06_01S.png"
    }
    r0_89.BackFile[7] = {
      "BG07_01S.png",
      "BG07_02S.png"
    }
    r0_89.BackFile[8] = {
      "BG08_01S.png",
      "BG08_02S.png",
      "BG08_03S.png",
      "BG08_04S.png",
      "BG08_05S.png",
      "BG08_06S.png"
    }
    r0_89.BackFile[9] = {
      "BG09_01S.png",
      "BG09_02S.png",
      "BG09_03S.png",
      "BG09_04S.png",
      "BG09_05S.png"
    }
    r0_89.BackFile[10] = {
      "BG10_01S.png",
      "BG10_02S.png",
      "BG10_03S.png",
      "BG10_04S.png"
    }
    r0_89.BackFile[11] = {
      "BG11_01S.png",
      "BG11_02S.png",
      "BG11_03S.png",
      "BG11_04S.png",
      "BG11_05S.png"
    }
    r0_89.BackFile[12] = {
      "BG12_01S.png",
      "BG12_02S.png",
      "BG12_03S.png",
      "BG12_05S.png",
      "BG12_06S.png"
    }
    r0_89.BackFile[13] = {
      "BG13_01S.png",
      "BG13_02S.png",
      "BG13_03S.png",
      "BG13_04S.png",
      "BG13_05S.png",
      "BG13_11S.png"
    }
    r0_89.BackFile[14] = {
      "BG14_01S.png",
      "BG14_02S.png"
    }
    r0_89.BackFile[15] = {
      "BG15B_01S.png",
      "BG15B_02S.png",
      "BG15B_03S.png",
      "BG15B_05S.png",
      "BG15_01S.png",
      "BG15_02S.png",
      "BG15_03S.png",
      "BG15_05S.png"
    }
    r0_89.BackFile[16] = {
      "BG16_01S.png",
      "BG16_02S.png",
      "BG16_03S.png",
      "BG16_05S.png",
      "BG16_08S.png",
      "BG16_13S.png",
      "BG16_14S.png"
    }
    r0_89.BackFile[17] = {
      "BG17_01S.png",
      "BG17_02S.png",
      "BG17_03S.png"
    }
    r0_89.BackFile[18] = {
      "BG18_01S.png",
      "BG18_02S.png",
      "BG18_03S.png",
      "BG18_11S.png"
    }
    r0_89.BackFile[19] = {
      "BG19_01S.png",
      "BG19_02S.png",
      "BG19_04S.png",
      "BG19_05S.png",
      "BG19_08S.png",
      "BG19_11S.png",
      "BG19_12S.png",
      "BG19_13S.png",
      "BG19_14S.png",
      "BG19_15S.png",
      "BG19_16S.png"
    }
    r0_89.BackFile[20] = {
      "BG20B_01S.png",
      "BG20C_01S.png",
      "BG20D_01S.png",
      "BG20_01S.png"
    }
    r0_89.BackFile[21] = {
      "BG21_01S.png"
    }
    r0_89.BackFile[22] = {
      "BG22_01S.png",
      "BG22_02S.png",
      "BG22_03S.png",
      "BG22_05S.png",
      "BG22_11S.png",
      "BG22_14S.png",
      "BG22_15S.png"
    }
    r0_89.BackFile[23] = {
      "BG23_01S.png",
      "BG23_03S.png",
      "BG23_14S.png",
      "BG23_15S.png",
      "BG23_16S.png"
    }
    r0_89.BackFile[24] = {
      "BG24_01S.png",
      "BG24_02S.png",
      "BG24_03S.png"
    }
    r0_89.BackFile[25] = {
      "BG25_01S.png"
    }
    r0_89.BackFile[26] = {
      "BG26_01S.png"
    }
    r0_89.BackFile[27] = {
      "BG27_01S.png",
      "BG27_02S.png",
      "BG27_03S.png",
      "BG27_04S.png",
      "BG27_08S.png"
    }
    r0_89.BackFile[28] = {
      "BG28_01S.png",
      "BG28_03S.png",
      "BG28_05S.png"
    }
    r0_89.BackFile[29] = {
      "BG29_01S.png",
      "BG29_05S.png"
    }
    r0_89.BackFile[30] = {
      "BG30_01S.png"
    }
    r0_89.BackFile[31] = {
      "BG31_01S.png"
    }
    r0_89.BackFile[32] = {
      "SKY01_01S.png",
      "SKY01_02S.png",
      "SKY01_03S.png",
      "SKY01_04S.png",
      "SKY01_05S.png",
      "SKY01_06S.png",
      "SKY01_07S.png",
      "SKY01_08S.png"
    }
    r0_89.BackFile[33] = {
      "SKY02_01S.png",
      "SKY02_07S.png",
      "SKY02_08S.png"
    }
    r0_89.BackFile[34] = {
      "SKY06_01S.png",
      "SKY06_07S.png",
      "SKY06_08S.png",
      "SKY06_09S.png",
      "SKY07_07S.png",
      "SKY07_08S.png",
      "SKY08_01S.png"
    }
    r0_89.BackFile[35] = {
      "SKY09_01S.png",
      "SKY09_07S.png",
      "SKY09_08S.png",
      "SKY10_01S.png",
      "SKY10_07S.png",
      "SKY10_08S.png"
    }
    r0_89.BackTime = {}
    r0_89.BackTime["BG01_01S.png"] = 1
    r0_89.BackTime["BG01_02S.png"] = 1
    r0_89.BackTime["BG01_03S.png"] = 1
    r0_89.BackTime["BG01_04S.png"] = 1
    r0_89.BackTime["BG01_14S.png"] = 1
    r0_89.BackTime["BG02_01S.png"] = 1
    r0_89.BackTime["BG02_02S.png"] = 6
    r0_89.BackTime["BG02_03S.png"] = 2
    r0_89.BackTime["BG02_04S.png"] = 3
    r0_89.BackTime["BG02_05S.png"] = 8
    r0_89.BackTime["BG03_01S.png"] = 1
    r0_89.BackTime["BG03_05S.png"] = 7
    r0_89.BackTime["BG04_01S.png"] = 1
    r0_89.BackTime["BG04_02S.png"] = 5
    r0_89.BackTime["BG04_03S.png"] = 7
    r0_89.BackTime["BG05A_01S.png"] = 1
    r0_89.BackTime["BG05B_01S.png"] = 1
    r0_89.BackTime["BG05B_02S.png"] = 5
    r0_89.BackTime["BG05B_03S.png"] = 2
    r0_89.BackTime["BG05B_04S.png"] = 4
    r0_89.BackTime["BG05B_05S.png"] = 7
    r0_89.BackTime["BG05C_01S.png"] = 1
    r0_89.BackTime["BG05C_02S.png"] = 5
    r0_89.BackTime["BG05C_03S.png"] = 2
    r0_89.BackTime["BG05C_04S.png"] = 4
    r0_89.BackTime["BG05C_05S.png"] = 7
    r0_89.BackTime["BG06_01S.png"] = 1
    r0_89.BackTime["BG07_01S.png"] = 1
    r0_89.BackTime["BG07_02S.png"] = 6
    r0_89.BackTime["BG08_01S.png"] = 1
    r0_89.BackTime["BG08_02S.png"] = 5
    r0_89.BackTime["BG08_03S.png"] = 1
    r0_89.BackTime["BG08_04S.png"] = 4
    r0_89.BackTime["BG08_05S.png"] = 7
    r0_89.BackTime["BG08_06S.png"] = 2
    r0_89.BackTime["BG09_01S.png"] = 1
    r0_89.BackTime["BG09_02S.png"] = 5
    r0_89.BackTime["BG09_03S.png"] = 1
    r0_89.BackTime["BG09_04S.png"] = 4
    r0_89.BackTime["BG09_05S.png"] = 7
    r0_89.BackTime["BG10_01S.png"] = 1
    r0_89.BackTime["BG10_02S.png"] = 5
    r0_89.BackTime["BG10_03S.png"] = 1
    r0_89.BackTime["BG10_04S.png"] = 4
    r0_89.BackTime["BG11_01S.png"] = 1
    r0_89.BackTime["BG11_02S.png"] = 6
    r0_89.BackTime["BG11_03S.png"] = 5
    r0_89.BackTime["BG11_04S.png"] = 4
    r0_89.BackTime["BG11_05S.png"] = 8
    r0_89.BackTime["BG12_01S.png"] = 1
    r0_89.BackTime["BG12_02S.png"] = 6
    r0_89.BackTime["BG12_03S.png"] = 5
    r0_89.BackTime["BG12_05S.png"] = 7
    r0_89.BackTime["BG12_06S.png"] = 7
    r0_89.BackTime["BG13_01S.png"] = 1
    r0_89.BackTime["BG13_02S.png"] = 6
    r0_89.BackTime["BG13_03S.png"] = 3
    r0_89.BackTime["BG13_04S.png"] = 4
    r0_89.BackTime["BG13_05S.png"] = 8
    r0_89.BackTime["BG13_11S.png"] = 10
    r0_89.BackTime["BG14_01S.png"] = 1
    r0_89.BackTime["BG14_02S.png"] = 5
    r0_89.BackTime["BG15_01S.png"] = 1
    r0_89.BackTime["BG15_02S.png"] = 6
    r0_89.BackTime["BG15_03S.png"] = 3
    r0_89.BackTime["BG15_05S.png"] = 8
    r0_89.BackTime["BG15B_01S.png"] = 1
    r0_89.BackTime["BG15B_02S.png"] = 6
    r0_89.BackTime["BG15B_03S.png"] = 3
    r0_89.BackTime["BG15B_05S.png"] = 8
    r0_89.BackTime["BG16_01S.png"] = 1
    r0_89.BackTime["BG16_02S.png"] = 6
    r0_89.BackTime["BG16_03S.png"] = 3
    r0_89.BackTime["BG16_05S.png"] = 8
    r0_89.BackTime["BG16_08S.png"] = 4
    r0_89.BackTime["BG16_13S.png"] = 12
    r0_89.BackTime["BG16_14S.png"] = 14
    r0_89.BackTime["BG17_01S.png"] = 1
    r0_89.BackTime["BG17_02S.png"] = 6
    r0_89.BackTime["BG17_03S.png"] = 3
    r0_89.BackTime["BG18_01S.png"] = 1
    r0_89.BackTime["BG18_02S.png"] = 6
    r0_89.BackTime["BG18_03S.png"] = 3
    r0_89.BackTime["BG18_11S.png"] = 10
    r0_89.BackTime["BG19_01S.png"] = 1
    r0_89.BackTime["BG19_02S.png"] = 6
    r0_89.BackTime["BG19_04S.png"] = 4
    r0_89.BackTime["BG19_05S.png"] = 8
    r0_89.BackTime["BG19_11S.png"] = 9
    r0_89.BackTime["BG19_12S.png"] = 13
    r0_89.BackTime["BG19_13S.png"] = 11
    r0_89.BackTime["BG19_14S.png"] = 14
    r0_89.BackTime["BG19_15S.png"] = 12
    r0_89.BackTime["BG19_16S.png"] = 1
    r0_89.BackTime["BG20_01S.png"] = 1
    r0_89.BackTime["BG20B_01S.png"] = 1
    r0_89.BackTime["BG20C_01S.png"] = 1
    r0_89.BackTime["BG20D_01S.png"] = 1
    r0_89.BackTime["BG21_01S.png"] = 1
    r0_89.BackTime["BG22_01S.png"] = 1
    r0_89.BackTime["BG22_02S.png"] = 6
    r0_89.BackTime["BG22_03S.png"] = 3
    r0_89.BackTime["BG22_05S.png"] = 8
    r0_89.BackTime["BG22_11S.png"] = 10
    r0_89.BackTime["BG22_14S.png"] = 14
    r0_89.BackTime["BG22_15S.png"] = 12
    r0_89.BackTime["BG23_01S.png"] = 1
    r0_89.BackTime["BG23_03S.png"] = 3
    r0_89.BackTime["BG23_14S.png"] = 14
    r0_89.BackTime["BG23_15S.png"] = 12
    r0_89.BackTime["BG24_01S.png"] = 1
    r0_89.BackTime["BG24_02S.png"] = 5
    r0_89.BackTime["BG25_01S.png"] = 1
    r0_89.BackTime["BG26_01S.png"] = 1
    r0_89.BackTime["BG27_01S.png"] = 1
    r0_89.BackTime["BG27_02S.png"] = 1
    r0_89.BackTime["BG27_03S.png"] = 1
    r0_89.BackTime["BG27_04S.png"] = 1
    r0_89.BackTime["BG27_08S.png"] = 1
    r0_89.BackTime["BG28_01S.png"] = 1
    r0_89.BackTime["BG28_03S.png"] = 1
    r0_89.BackTime["BG28_05S.png"] = 7
    r0_89.BackTime["BG29_01S.png"] = 1
    r0_89.BackTime["BG29_05S.png"] = 8
    r0_89.BackTime["BG30_01S.png"] = 1
    r0_89.BackTime["BG31_01S.png"] = 1
    r0_89.BackTimeColor = {}
    r0_89.BackTimeColor[1] = {
      r = 1,
      g = 1,
      b = 1,
      a = 1,
    }
    r0_89.BackTimeColor[2] = {
      r = 0.9,
      g = 0.95,
      b = 1,
      a = 1,
    }
    r0_89.BackTimeColor[3] = {
      r = 0.84,
      g = 0.91,
      b = 1,
      a = 1,
    }
    r0_89.BackTimeColor[4] = {
      r = 0.55,
      g = 0.66,
      b = 0.74,
      a = 1,
    }
    r0_89.BackTimeColor[5] = {
      r = 1,
      g = 0.95,
      b = 0.92,
      a = 1,
    }
    r0_89.BackTimeColor[6] = {
      r = 1,
      g = 0.92,
      b = 0.83,
      a = 1,
    }
    r0_89.BackTimeColor[7] = {
      r = 0.95,
      g = 0.95,
      b = 0.97,
      a = 1,
    }
    r0_89.BackTimeColor[8] = {
      r = 0.89,
      g = 0.89,
      b = 0.94,
      a = 1,
    }
    r0_89.BackTimeColor[9] = {
      r = 1,
      g = 0.91,
      b = 0.97,
      a = 1,
    }
    r0_89.BackTimeColor[10] = {
      r = 0.98,
      g = 0.86,
      b = 0.94,
      a = 1,
    }
    r0_89.BackTimeColor[11] = {
      r = 0.95,
      g = 0.95,
      b = 1,
      a = 1,
    }
    r0_89.BackTimeColor[12] = {
      r = 0.92,
      g = 0.92,
      b = 1,
      a = 1,
    }
    r0_89.BackTimeColor[13] = {
      r = 0.9,
      g = 0.9,
      b = 0.94,
      a = 1,
    }
    r0_89.BackTimeColor[14] = {
      r = 0.89,
      g = 0.89,
      b = 0.94,
      a = 1,
    }
    local function r1_89(r0_90, r1_90)
      -- line: [3562, 3568] id: 90
      return {
        x = r0_90,
        y = r1_90,
      }
    end
    r0_89.CharaPos = {}
    r0_89.CharaPos["A\x8f\xac\x92\xb9_01S.pna"] = r1_89(367, -100)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_02S.pna"] = r1_89(274, -99)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_03S.pna"] = r1_89(425, -100)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_01S.pna"] = r1_89(383, -100)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_02S.pna"] = r1_89(463, -100)
    r0_89.CharaPos["C\x93V\x89\xb9_01S.pna"] = r1_89(347, -100)
    r0_89.CharaPos["C\x93V\x89\xb9_02S.pna"] = r1_89(494, -100)
    r0_89.CharaPos["C\x93V\x89\xb9_03S.pna"] = r1_89(434, -101)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_01S.pna"] = r1_89(428, -100)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_02S.pna"] = r1_89(463, -100)
    r0_89.CharaPos["E\x96\xe9\x97\xda_01S.pna"] = r1_89(428, -100)
    r0_89.CharaPos["E\x96\xe9\x97\xda_02S.pna"] = r1_89(421, -100)
    r0_89.CharaPos["F\x82Ђ\u{382}\xe8_01S.pna"] = r1_89(492, -100)
    r0_89.CharaPos["G\x82ق\xbd\x82\xe9_01S.pna"] = r1_89(498, -100)
    r0_89.CharaPos["H\x8e\xe9\xe4\xbb_01S.pna"] = r1_89(455, -100)
    r0_89.CharaPos["I\x89\xc0\x93ގq_01S.pna"] = r1_89(473, -100)
    r0_89.CharaPos["J\x92B\x96\xe7_01S.pna"] = r1_89(394, -91)
    r0_89.CharaPos["K\x96\x8f\x8e\x9f_01S.pna"] = r1_89(479, -100)
    r0_89.CharaPos["L\x8c~_01S.pna"] = r1_89(435, -101)
    r0_89.CharaPos["M\x95\xc9_01S.pna"] = r1_89(472, -100)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_01M.pna"] = r1_89(378, -100)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_02M.pna"] = r1_89(281, -100)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_03M.pna"] = r1_89(384, -100)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_01M.pna"] = r1_89(290, -101)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_02M.pna"] = r1_89(408, -100)
    r0_89.CharaPos["C\x93V\x89\xb9_01M.pna"] = r1_89(237, -100)
    r0_89.CharaPos["C\x93V\x89\xb9_02M.pna"] = r1_89(443, -100)
    r0_89.CharaPos["C\x93V\x89\xb9_03M.pna"] = r1_89(359, -99)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_01M.pna"] = r1_89(351, -100)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_02M.pna"] = r1_89(396, -100)
    r0_89.CharaPos["E\x96\xe9\x97\xda_01M.pna"] = r1_89(351, -100)
    r0_89.CharaPos["E\x96\xe9\x97\xda_02M.pna"] = r1_89(341, -99)
    r0_89.CharaPos["F\x82Ђ\u{382}\xe8_01M.pna"] = r1_89(440, -100)
    r0_89.CharaPos["G\x82ق\xbd\x82\xe9_01M.pna"] = r1_89(462, -100)
    r0_89.CharaPos["H\x8e\xe9\xe4\xbb_01M.pna"] = r1_89(388, -100)
    r0_89.CharaPos["I\x89\xc0\x93ގq_01M.pna"] = r1_89(413, -100)
    r0_89.CharaPos["J\x92B\x96\xe7_01M.pna"] = r1_89(303, -100)
    r0_89.CharaPos["K\x96\x8f\x8e\x9f_01M.pna"] = r1_89(423, -100)
    r0_89.CharaPos["L\x8c~_01M.pna"] = r1_89(341, -100)
    r0_89.CharaPos["M\x95\xc9_01M.pna"] = r1_89(405, -100)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_01L.pna"] = r1_89(121, -101)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_02L.pna"] = r1_89(360, -100)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_03L.pna"] = r1_89(169, -99)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_01L.pna"] = r1_89(344, -100)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_02L.pna"] = r1_89(300, -99)
    r0_89.CharaPos["C\x93V\x89\xb9_01L.pna"] = r1_89(132, -100)
    r0_89.CharaPos["C\x93V\x89\xb9_02L.pna"] = r1_89(283, -100)
    r0_89.CharaPos["C\x93V\x89\xb9_03L.pna"] = r1_89(172, -101)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_01L.pna"] = r1_89(169, -100)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_02L.pna"] = r1_89(246, -100)
    r0_89.CharaPos["E\x96\xe9\x97\xda_01L.pna"] = r1_89(169, -100)
    r0_89.CharaPos["E\x96\xe9\x97\xda_02L.pna"] = r1_89(54, -99)
    r0_89.CharaPos["F\x82Ђ\u{382}\xe8_01L.pna"] = r1_89(289, -100)
    r0_89.CharaPos["G\x82ق\xbd\x82\xe9_01L.pna"] = r1_89(297, -110)
    r0_89.CharaPos["H\x8e\xe9\xe4\xbb_01L.pna"] = r1_89(190, -141)
    r0_89.CharaPos["I\x89\xc0\x93ގq_01L.pna"] = r1_89(182, -99)
    r0_89.CharaPos["J\x92B\x96\xe7_01L.pna"] = r1_89(66, -100)
    r0_89.CharaPos["K\x96\x8f\x8e\x9f_01L.pna"] = r1_89(243, -180)
    r0_89.CharaPos["L\x8c~_01L.pna"] = r1_89(78, -102)
    r0_89.CharaPos["M\x95\xc9_01L.pna"] = r1_89(265, -100)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_02W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["A\x8f\xac\x92\xb9_03W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_02W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["C\x93V\x89\xb9_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["C\x93V\x89\xb9_02W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["C\x93V\x89\xb9_03W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_02W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["E\x96\xe9\x97\xda_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["E\x96\xe9\x97\xda_02W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["F\x82Ђ\u{382}\xe8_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["G\x82ق\xbd\x82\xe9_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["H\x8e\xe9\xe4\xbb_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["I\x89\xc0\x93ގq_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["J\x92B\x96\xe7_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["K\x96\x8f\x8e\x9f_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["L\x8c~_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["M\x95\xc9_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_03S.pna"] = r1_89(513, -110)
    r0_89.CharaPos["N\x83C\x83X\x83J_01S.pna"] = r1_89(452, -94)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_03S.pna"] = r1_89(429, -100)
    r0_89.CharaPos["E\x96\xe9\x97\xda_03S.pna"] = r1_89(429, -100)
    r0_89.CharaPos["O\x91\x81\x95c_01S.pna"] = r1_89(524, -120)
    r0_89.CharaPos["Q\x97R\x89\xc0_01S.pna"] = r1_89(481, -100)
    r0_89.CharaPos["P\x97\xba\x8eq_01S.pna"] = r1_89(496, -113)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_03M.pna"] = r1_89(470, -100)
    r0_89.CharaPos["N\x83C\x83X\x83J_01M.pna"] = r1_89(410, -96)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_03M.pna"] = r1_89(333, -99)
    r0_89.CharaPos["E\x96\xe9\x97\xda_03M.pna"] = r1_89(333, -99)
    r0_89.CharaPos["O\x91\x81\x95c_01M.pna"] = r1_89(498, -100)
    r0_89.CharaPos["Q\x97R\x89\xc0_01M.pna"] = r1_89(440, -100)
    r0_89.CharaPos["P\x97\xba\x8eq_01M.pna"] = r1_89(450, -100)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_03L.pna"] = r1_89(309, -100)
    r0_89.CharaPos["N\x83C\x83X\x83J_01L.pna"] = r1_89(243, -82)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_03L.pna"] = r1_89(4, -100)
    r0_89.CharaPos["E\x96\xe9\x97\xda_03L.pna"] = r1_89(4, -100)
    r0_89.CharaPos["B\x82\xa0\x82\xb0\x82\xcd_03W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["N\x83C\x83X\x83J_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["D\x88\x9f\x8e\xd1_03W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["E\x96\xe9\x97\xda_03W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["O\x91\x81\x95c_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["Q\x97R\x89\xc0_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["P\x97\xba\x8eq_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["R\x83n\x83b\x83g_01M.pna"] = r1_89(260, 0)
    r0_89.CharaPos["R\x83n\x83b\x83g_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["S\x97\xb2\x95v_01S.pna"] = r1_89(430, -99)
    r0_89.CharaPos["S\x97\xb2\x95v_01M.pna"] = r1_89(331, -100)
    r0_89.CharaPos["S\x97\xb2\x95v_01L.pna"] = r1_89(144, -100)
    r0_89.CharaPos["S\x97\xb2\x95v_01W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["\x90\xb0\x8aCST01_S.pna"] = r1_89(379, -100)
    r0_89.CharaPos["\x8f\xac\x92\xb9FDST02_S.pna"] = r1_89(434, -100)
    r0_89.CharaPos["\x8f\xac\x92\xb9FDST01_S.pna"] = r1_89(454, -100)
    r0_89.CharaPos["\x89\xc0\x93ގqST02_S.pna"] = r1_89(446, -100)
    r0_89.CharaPos["\x82ق\xbd\x82\xe9ST02_S.pna"] = r1_89(492, -100)
    r0_89.CharaPos["\x83C\x83X\x83JFDST01_S.pna"] = r1_89(448, -100)
    r0_89.CharaPos["\xea\xa1ST01_S.pna"] = r1_89(495, -100)
    r0_89.CharaPos["\x92B\x96\xe7FDST01_S.pna"] = r1_89(431, -100)
    r0_89.CharaPos["\x90\xb0\x8aCST01_M.pna"] = r1_89(327, -100)
    r0_89.CharaPos["\x8f\xac\x92\xb9FDST02_M.pna"] = r1_89(378, -100)
    r0_89.CharaPos["\x8f\xac\x92\xb9FDST01_M.pna"] = r1_89(385, -100)
    r0_89.CharaPos["\x89\xc0\x93ގqST02_M.pna"] = r1_89(368, -100)
    r0_89.CharaPos["\x82ق\xbd\x82\xe9ST02_M.pna"] = r1_89(446, -100)
    r0_89.CharaPos["\x83C\x83X\x83JFDST01_M.pna"] = r1_89(394, -100)
    r0_89.CharaPos["\xea\xa1ST01_M.pna"] = r1_89(447, -100)
    r0_89.CharaPos["\x92B\x96\xe7FDST01_M.pna"] = r1_89(379, -100)
    r0_89.CharaPos["\x90\xb0\x8aCST01_L.pna"] = r1_89(71, -130)
    r0_89.CharaPos["\x8f\xac\x92\xb9FDST02_L.pna"] = r1_89(107, -100)
    r0_89.CharaPos["\x8f\xac\x92\xb9FDST01_L.pna"] = r1_89(160, -100)
    r0_89.CharaPos["\x89\xc0\x93ގqST02_L.pna"] = r1_89(201, -142)
    r0_89.CharaPos["\x82ق\xbd\x82\xe9ST02_L.pna"] = r1_89(263, -100)
    r0_89.CharaPos["\x83C\x83X\x83JFDST01_L.pna"] = r1_89(205, -100)
    r0_89.CharaPos["\xea\xa1ST01_L.pna"] = r1_89(264, -100)
    r0_89.CharaPos["\x92B\x96\xe7FDST01_L.pna"] = r1_89(110, -180)
    r0_89.CharaPos["\x90\xb0\x8aCST01_W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["\x8f\xac\x92\xb9FDST02_W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["\x8f\xac\x92\xb9FDST01_W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["\x89\xc0\x93ގqST02_W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["\x82ق\xbd\x82\xe9ST02_W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["\x83C\x83X\x83JFDST01_W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["\xea\xa1ST01_W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["\x92B\x96\xe7FDST01_W.pna"] = r1_89(431, 29)
    r0_89.CharaPos["R\x83n\x83b\x83g_01\x92ǉ\xc1_M.pna"] = r1_89(384, 2)
    r0_89.CharaPos["R\x83n\x83b\x83g_01\x92ǉ\xc1_W.pna"] = r1_89(431, 29)
    local function r2_89(r0_91, r1_91, r2_91, r3_91, r4_91, r5_91, r6_91, r7_91)
      -- line: [3725, 3736] id: 91
      return {
        clot = r0_91,
        opex = r1_91,
        etc = r2_91,
        frame = r3_91,
        poDi = r4_91,
        expr1 = r5_91,
        expr2 = r6_91,
        expr3 = r7_91,
      }
    end
    r0_89.CharaLayer = {}
    r0_89.CharaLayer[1] = {}
    r0_89.CharaLayer[1][1] = r2_89({
      54,
      51,
      48,
      45,
      -1,
      -1,
      -1
    }, {
      0,
      1,
      -1
    }, 58, 59, 3, {
      42,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[1][2] = r2_89({
      52,
      54,
      50,
      48,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 57, 1, {
      46,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[1][3] = r2_89({
      39,
      37,
      33,
      35,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, 31, 42, 2, {
      30,
      4
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[1][4] = r2_89({
      47,
      45,
      -1,
      -1,
      -1,
      -1,
      43
    }, {
      0,
      -1,
      -1
    }, -1, 50, 2, {
      41,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[1][5] = r2_89({
      29,
      26,
      -1,
      -1,
      -1,
      -1,
      23
    }, {
      0,
      -1,
      -1
    }, -1, 33, 3, {
      20,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[2] = {}
    r0_89.CharaLayer[2][1] = r2_89({
      49,
      47,
      45,
      43,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 52, 2, {
      41,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[2][2] = r2_89({
      33,
      31,
      29,
      27,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 36, 2, {
      25,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[2][3] = r2_89({
      38,
      37,
      35,
      36,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 40, 1, {
      34,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[3] = {}
    r0_89.CharaLayer[3][1] = r2_89({
      57,
      54,
      48,
      45,
      -1,
      -1,
      -1
    }, {
      1,
      0,
      2
    }, -1, 61, 3, {
      42,
      3
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[3][2] = r2_89({
      59,
      56,
      47,
      53,
      -1,
      -1,
      -1
    }, {
      2,
      -1,
      0
    }, 1, 63, 3, {
      44,
      24
    }, {
      -1,
      -1
    }, {
      23,
      3
    })
    r0_89.CharaLayer[3][3] = r2_89({
      48,
      47,
      45,
      44,
      -1,
      -1,
      -1
    }, {
      2,
      1,
      0
    }, -1, 50, 1, {
      43,
      3
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[4] = {}
    r0_89.CharaLayer[4][1] = r2_89({
      68,
      66,
      62,
      64,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, 0, 71, 2, {
      60,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[4][2] = r2_89({
      46,
      44,
      42,
      40,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, 1, 49, 2, {
      38,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[4][3] = r2_89({
      62,
      59,
      53,
      56,
      -1,
      -1,
      -1
    }, {
      1,
      -1,
      -1
    }, 0, 66, 3, {
      50,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[5] = {}
    r0_89.CharaLayer[5][1] = r2_89({
      68,
      66,
      62,
      64,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, 0, 71, 2, {
      60,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[5][2] = r2_89({
      34,
      33,
      32,
      31,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, 1, 36, 1, {
      30,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[5][3] = r2_89({
      62,
      59,
      53,
      56,
      -1,
      -1,
      -1
    }, {
      1,
      -1,
      -1
    }, 0, 66, 3, {
      50,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[6] = {}
    r0_89.CharaLayer[6][1] = r2_89({
      48,
      46,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 49, 2, {
      44,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[6][2] = r2_89({
      29,
      27,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 32, 2, {
      25,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[7] = {}
    r0_89.CharaLayer[7][1] = r2_89({
      88,
      86,
      -1,
      84,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 89, 2, {
      82,
      42
    }, {
      41,
      1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[7][2] = r2_89({
      23,
      24,
      -1,
      25,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 30, 1, {
      22,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[8] = {}
    r0_89.CharaLayer[8][1] = r2_89({
      -1,
      46,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 47, 2, {
      44,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[9] = {}
    r0_89.CharaLayer[9][1] = r2_89({
      48,
      46,
      44,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 49, 2, {
      42,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[10] = {}
    r0_89.CharaLayer[10][1] = r2_89({
      23,
      22,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 24, 1, {
      21,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[11] = {}
    r0_89.CharaLayer[11][1] = r2_89({
      -1,
      41,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 42, 2, {
      39,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[12] = {}
    r0_89.CharaLayer[12][1] = r2_89({
      44,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 47, 1, {
      40,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[13] = {}
    r0_89.CharaLayer[13][1] = r2_89({
      41,
      40,
      -1,
      -1,
      -1,
      -1,
      42
    }, {
      1,
      -1,
      -1
    }, 0, 43, 1, {
      39,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[14] = {}
    r0_89.CharaLayer[14][1] = r2_89({
      42,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 43, 1, {
      41,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[15] = {}
    r0_89.CharaLayer[15][1] = r2_89({
      -1,
      67,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 70, 1, {
      63,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[16] = {}
    r0_89.CharaLayer[16][1] = r2_89({
      46,
      43,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 49, 1, {
      39,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[17] = {}
    r0_89.CharaLayer[17][1] = r2_89({
      45,
      42,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 48, 1, {
      38,
      2
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[18] = {}
    r0_89.CharaLayer[18][1] = r2_89({
      -1,
      27,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, 0, 28, 1, {
      26,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[19] = {}
    r0_89.CharaLayer[19][1] = r2_89({
      -1,
      34,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, 35, 1, {
      33,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[20] = {}
    r0_89.CharaLayer[20][1] = r2_89({
      35,
      34,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      0,
      -1,
      -1
    }, -1, 36, 1, {
      33,
      1
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[21] = {}
    r0_89.CharaLayer[21][1] = r2_89({
      32,
      33,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      31,
      -1,
      -1
    }, -1, 34, 1, {
      30,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[22] = {}
    r0_89.CharaLayer[22][1] = r2_89({
      33,
      34,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      32,
      -1,
      -1
    }, -1, 35, 1, {
      31,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaLayer[23] = {}
    r0_89.CharaLayer[23][1] = r2_89({
      -1,
      -2,
      -1,
      -1,
      -1,
      -1,
      -1
    }, {
      -1,
      -1,
      -1
    }, -1, -1, 1, {
      4,
      0
    }, {
      -1,
      -1
    }, {
      -1,
      -1
    })
    r0_89.CharaFile = {}
    r0_89.CharaFile[1] = {}
    r0_89.CharaFile[1][1] = {
      "A\x8f\xac\x92\xb9_01M.pna",
      "A\x8f\xac\x92\xb9_01S.pna",
      "A\x8f\xac\x92\xb9_01L.pna",
      "A\x8f\xac\x92\xb9_01W.pna"
    }
    r0_89.CharaFile[1][2] = {
      "A\x8f\xac\x92\xb9_02M.pna",
      "A\x8f\xac\x92\xb9_02S.pna",
      "A\x8f\xac\x92\xb9_02L.pna",
      "A\x8f\xac\x92\xb9_02W.pna"
    }
    r0_89.CharaFile[1][3] = {
      "A\x8f\xac\x92\xb9_03M.pna",
      "A\x8f\xac\x92\xb9_03S.pna",
      "A\x8f\xac\x92\xb9_03L.pna",
      "A\x8f\xac\x92\xb9_03W.pna"
    }
    r0_89.CharaFile[1][4] = {
      "\x8f\xac\x92\xb9FDST01_M.pna",
      "\x8f\xac\x92\xb9FDST01_S.pna",
      "\x8f\xac\x92\xb9FDST01_L.pna",
      "\x8f\xac\x92\xb9FDST01_W.pna"
    }
    r0_89.CharaFile[1][5] = {
      "\x8f\xac\x92\xb9FDST02_M.pna",
      "\x8f\xac\x92\xb9FDST02_S.pna",
      "\x8f\xac\x92\xb9FDST02_L.pna",
      "\x8f\xac\x92\xb9FDST02_W.pna"
    }
    r0_89.CharaFile[2] = {}
    r0_89.CharaFile[2][1] = {
      "B\x82\xa0\x82\xb0\x82\xcd_01M.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_01S.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_01L.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_01W.pna"
    }
    r0_89.CharaFile[2][2] = {
      "B\x82\xa0\x82\xb0\x82\xcd_02M.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_02S.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_02L.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_02W.pna"
    }
    r0_89.CharaFile[2][3] = {
      "B\x82\xa0\x82\xb0\x82\xcd_03M.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_03S.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_03L.pna",
      "B\x82\xa0\x82\xb0\x82\xcd_03W.pna"
    }
    r0_89.CharaFile[3] = {}
    r0_89.CharaFile[3][1] = {
      "C\x93V\x89\xb9_01M.pna",
      "C\x93V\x89\xb9_01S.pna",
      "C\x93V\x89\xb9_01L.pna",
      "C\x93V\x89\xb9_01W.pna"
    }
    r0_89.CharaFile[3][2] = {
      "C\x93V\x89\xb9_02M.pna",
      "C\x93V\x89\xb9_02S.pna",
      "C\x93V\x89\xb9_02L.pna",
      "C\x93V\x89\xb9_02W.pna"
    }
    r0_89.CharaFile[3][3] = {
      "C\x93V\x89\xb9_03M.pna",
      "C\x93V\x89\xb9_03S.pna",
      "C\x93V\x89\xb9_03L.pna",
      "C\x93V\x89\xb9_03W.pna"
    }
    r0_89.CharaFile[4] = {}
    r0_89.CharaFile[4][1] = {
      "D\x88\x9f\x8e\xd1_01M.pna",
      "D\x88\x9f\x8e\xd1_01S.pna",
      "D\x88\x9f\x8e\xd1_01L.pna",
      "D\x88\x9f\x8e\xd1_01W.pna"
    }
    r0_89.CharaFile[4][2] = {
      "D\x88\x9f\x8e\xd1_02M.pna",
      "D\x88\x9f\x8e\xd1_02S.pna",
      "D\x88\x9f\x8e\xd1_02L.pna",
      "D\x88\x9f\x8e\xd1_02W.pna"
    }
    r0_89.CharaFile[4][3] = {
      "D\x88\x9f\x8e\xd1_03M.pna",
      "D\x88\x9f\x8e\xd1_03S.pna",
      "D\x88\x9f\x8e\xd1_03L.pna",
      "D\x88\x9f\x8e\xd1_03W.pna"
    }
    r0_89.CharaFile[5] = {}
    r0_89.CharaFile[5][1] = {
      "E\x96\xe9\x97\xda_01M.pna",
      "E\x96\xe9\x97\xda_01S.pna",
      "E\x96\xe9\x97\xda_01L.pna",
      "E\x96\xe9\x97\xda_01W.pna"
    }
    r0_89.CharaFile[5][2] = {
      "E\x96\xe9\x97\xda_02M.pna",
      "E\x96\xe9\x97\xda_02S.pna",
      "E\x96\xe9\x97\xda_02L.pna",
      "E\x96\xe9\x97\xda_02W.pna"
    }
    r0_89.CharaFile[5][3] = {
      "E\x96\xe9\x97\xda_03M.pna",
      "E\x96\xe9\x97\xda_03S.pna",
      "E\x96\xe9\x97\xda_03L.pna",
      "E\x96\xe9\x97\xda_03W.pna"
    }
    r0_89.CharaFile[6] = {}
    r0_89.CharaFile[6][1] = {
      "G\x82ق\xbd\x82\xe9_01M.pna",
      "G\x82ق\xbd\x82\xe9_01S.pna",
      "G\x82ق\xbd\x82\xe9_01L.pna",
      "G\x82ق\xbd\x82\xe9_01W.pna"
    }
    r0_89.CharaFile[6][2] = {
      "\x82ق\xbd\x82\xe9ST02_M.pna",
      "\x82ق\xbd\x82\xe9ST02_S.pna",
      "\x82ق\xbd\x82\xe9ST02_L.pna",
      "\x82ق\xbd\x82\xe9ST02_W.pna"
    }
    r0_89.CharaFile[7] = {}
    r0_89.CharaFile[7][1] = {
      "I\x89\xc0\x93ގq_01M.pna",
      "I\x89\xc0\x93ގq_01S.pna",
      "I\x89\xc0\x93ގq_01L.pna",
      "I\x89\xc0\x93ގq_01W.pna"
    }
    r0_89.CharaFile[7][2] = {
      "\x89\xc0\x93ގqST02_M.pna",
      "\x89\xc0\x93ގqST02_S.pna",
      "\x89\xc0\x93ގqST02_L.pna",
      "\x89\xc0\x93ގqST02_W.pna"
    }
    r0_89.CharaFile[8] = {}
    r0_89.CharaFile[8][1] = {
      "F\x82Ђ\u{382}\xe8_01M.pna",
      "F\x82Ђ\u{382}\xe8_01S.pna",
      "F\x82Ђ\u{382}\xe8_01L.pna",
      "F\x82Ђ\u{382}\xe8_01W.pna"
    }
    r0_89.CharaFile[9] = {}
    r0_89.CharaFile[9][1] = {
      "H\x8e\xe9\xe4\xbb_01M.pna",
      "H\x8e\xe9\xe4\xbb_01S.pna",
      "H\x8e\xe9\xe4\xbb_01L.pna",
      "H\x8e\xe9\xe4\xbb_01W.pna"
    }
    r0_89.CharaFile[10] = {}
    r0_89.CharaFile[10][1] = {
      "M\x95\xc9_01M.pna",
      "M\x95\xc9_01S.pna",
      "M\x95\xc9_01L.pna",
      "M\x95\xc9_01W.pna"
    }
    r0_89.CharaFile[11] = {}
    r0_89.CharaFile[11][1] = {
      "J\x92B\x96\xe7_01M.pna",
      "J\x92B\x96\xe7_01S.pna",
      "J\x92B\x96\xe7_01L.pna",
      "J\x92B\x96\xe7_01W.pna"
    }
    r0_89.CharaFile[12] = {}
    r0_89.CharaFile[12][1] = {
      "\x92B\x96\xe7FDST01_M.pna",
      "\x92B\x96\xe7FDST01_S.pna",
      "\x92B\x96\xe7FDST01_L.pna",
      "\x92B\x96\xe7FDST01_W.pna"
    }
    r0_89.CharaFile[13] = {}
    r0_89.CharaFile[13][1] = {
      "K\x96\x8f\x8e\x9f_01M.pna",
      "K\x96\x8f\x8e\x9f_01S.pna",
      "K\x96\x8f\x8e\x9f_01L.pna",
      "K\x96\x8f\x8e\x9f_01W.pna"
    }
    r0_89.CharaFile[14] = {}
    r0_89.CharaFile[14][1] = {
      "N\x83C\x83X\x83J_01M.pna",
      "N\x83C\x83X\x83J_01S.pna",
      "N\x83C\x83X\x83J_01L.pna",
      "N\x83C\x83X\x83J_01W.pna"
    }
    r0_89.CharaFile[15] = {}
    r0_89.CharaFile[15][1] = {
      "\x83C\x83X\x83JFDST01_M.pna",
      "\x83C\x83X\x83JFDST01_S.pna",
      "\x83C\x83X\x83JFDST01_L.pna",
      "\x83C\x83X\x83JFDST01_W.pna"
    }
    r0_89.CharaFile[16] = {}
    r0_89.CharaFile[16][1] = {
      "\xea\xa1ST01_M.pna",
      "\xea\xa1ST01_S.pna",
      "\xea\xa1ST01_L.pna",
      "\xea\xa1ST01_W.pna"
    }
    r0_89.CharaFile[17] = {}
    r0_89.CharaFile[17][1] = {
      "\x90\xb0\x8aCST01_M.pna",
      "\x90\xb0\x8aCST01_S.pna",
      "\x90\xb0\x8aCST01_L.pna",
      "\x90\xb0\x8aCST01_W.pna"
    }
    r0_89.CharaFile[18] = {}
    r0_89.CharaFile[18][1] = {
      "L\x8c~_01M.pna",
      "L\x8c~_01S.pna",
      "L\x8c~_01L.pna",
      "L\x8c~_01W.pna"
    }
    r0_89.CharaFile[19] = {}
    r0_89.CharaFile[19][1] = {
      "S\x97\xb2\x95v_01M.pna",
      "S\x97\xb2\x95v_01S.pna",
      "S\x97\xb2\x95v_01L.pna",
      "S\x97\xb2\x95v_01W.pna"
    }
    r0_89.CharaFile[20] = {}
    r0_89.CharaFile[20][1] = {
      "Q\x97R\x89\xc0_01M.pna",
      "Q\x97R\x89\xc0_01S.pna",
      nil,
      "Q\x97R\x89\xc0_01W.pna"
    }
    r0_89.CharaFile[21] = {}
    r0_89.CharaFile[21][1] = {
      "O\x91\x81\x95c_01M.pna",
      "O\x91\x81\x95c_01S.pna",
      nil,
      "O\x91\x81\x95c_01W.pna"
    }
    r0_89.CharaFile[22] = {}
    r0_89.CharaFile[22][1] = {
      "P\x97\xba\x8eq_01M.pna",
      "P\x97\xba\x8eq_01S.pna",
      nil,
      "P\x97\xba\x8eq_01W.pna"
    }
    r0_89.CharaFile[23] = {}
    r0_89.CharaFile[23][1] = {
      "R\x83n\x83b\x83g_01M.pna",
      nil,
      nil,
      "R\x83n\x83b\x83g_01W.pna"
    }
    r0_89.CharaFile[24] = {}
    r0_89.CharaFile[24][1] = {
      "R\x83n\x83b\x83g_01\x92ǉ\xc1_M.pna",
      nil,
      nil,
      "R\x83n\x83b\x83g_01\x92ǉ\xc1_W.pna"
    }
  end
  function r0_73.GalleryCharaSetPic(r0_92, r1_92)
    -- line: [3879, 4100] id: 92
    local r2_92 = 1
    local r3_92 = 1
    local r4_92 = 1
    local r5_92 = 1
    local r6_92 = 1
    local r7_92 = 1
    local r8_92 = 1
    local r9_92 = 1
    local r10_92 = 1
    local r11_92 = cclass.lua_Layers:create()
    if r1_92 == false then
      r2_92 = r0_92.ChItemData.IT_dat.back
      r3_92 = r0_92.ChItemData.IT_dat.time
      r4_92 = r0_92.ChItemData.IT_dat.char
      r5_92 = r0_92.ChItemData.IT_dat.size
      r6_92 = r0_92.ChItemData.IT_dat.pose
      r7_92 = r0_92.ChItemData.IT_dat.poDi
      r8_92 = r0_92.ChItemData.IT_dat.clot
      r9_92 = r0_92.ChItemData.IT_dat.expr
      r10_92 = r0_92.ChItemData.IT_dat.opex
    end
    local r12_92 = r0_92.BackFile[r2_92][r3_92]
    local r13_92 = r0_92.CharaFile[r4_92][r6_92][r5_92]
    if r4_92 == 23 and r9_92 == 6 then
      r13_92 = r0_92.CharaFile[24][r6_92][r5_92]
    end
    local r14_92 = r0_92:MenuLoadLayer("GalleryBack", r12_92)
    if r0_92.BackEnable == true then
      r11_92:setVisible("Gallery", "GalleryBack", 1)
    else
      r11_92:setVisible("Gallery", "GalleryBack", 0)
    end
    r11_92:setParam("Gallery", "GalleryBack", LUA_PARAM_POS, 0, r0_92.BackPosY, 0, 0)
    local r15_92 = r0_92:MenuLoadLayer("GalleryCharaBu", r13_92)
    if r0_92.CharEnable == true then
      r11_92:setVisible("Gallery", "GalleryCharaBu", 1)
    else
      r11_92:setVisible("Gallery", "GalleryCharaBu", 0)
    end
    local r16_92 = r0_92.CharaPos[r13_92].x
    local r17_92 = r0_92.CharaPos[r13_92].y
    if r5_92 == 4 or r4_92 == 23 then
      r11_92:setParam("Gallery", "GalleryCharaBu", LUA_PARAM_POS, r16_92, r17_92 + 90, 0, 0)
    else
      r11_92:setParam("Gallery", "GalleryCharaBu", LUA_PARAM_POS, r16_92, r17_92, 0, 0)
    end
    if r0_92.BackEnable == true then
      local r18_92 = r0_92.BackTime[r12_92]
      if r18_92 ~= nil then
        r11_92:setParam("Gallery", "GalleryCharaBu", LUA_PARAM_COLOR, r0_92.BackTimeColor[r18_92].r, r0_92.BackTimeColor[r18_92].g, r0_92.BackTimeColor[r18_92].b, r0_92.BackTimeColor[r18_92].a)
      end
    end
    local r18_92 = 0
    local r19_92 = r0_92.CharaLayer[r4_92][r6_92].clot[r8_92]
    if r19_92 >= 0 then
      r11_92:initSubLayer("Gallery", "GalleryCharaBu", r19_92 - r7_92 - 1 + r18_92, 1)
    end
    if r10_92 ~= 1 then
      if r10_92 == 5 then
        r19_92 = r0_92.CharaLayer[r4_92][r6_92].opex[1]
        if r19_92 >= 0 then
          r11_92:initSubLayer("Gallery", "GalleryCharaBu", r19_92 + r18_92, 1)
        end
        r19_92 = r0_92.CharaLayer[r4_92][r6_92].opex[3]
        if r19_92 >= 0 then
          r11_92:initSubLayer("Gallery", "GalleryCharaBu", r19_92 + r18_92, 1)
        end
      else
        r19_92 = r0_92.CharaLayer[r4_92][r6_92].opex[r10_92 - 1]
        if r19_92 >= 0 then
          r11_92:initSubLayer("Gallery", "GalleryCharaBu", r19_92 + r18_92, 1)
        end
      end
    end
    r19_92 = r0_92.CharaLayer[r4_92][r6_92].etc
    if r19_92 >= 0 then
      r11_92:initSubLayer("Gallery", "GalleryCharaBu", r19_92 + r18_92, 1)
    end
    if r5_92 == 4 then
      r19_92 = r0_92.CharaLayer[r4_92][r6_92].frame
      if r19_92 >= 0 then
        r11_92:initSubLayer("Gallery", "GalleryCharaBu", r19_92 + r18_92, 1)
      end
    end
    r19_92 = r0_92.CharaLayer[r4_92][r6_92].expr1[1]
    if r7_92 == 2 then
      local r20_92 = r0_92.CharaLayer[r4_92][r6_92].expr2[1]
      if r20_92 >= 0 then
        r19_92 = r20_92
      end
    end
    if r7_92 == 3 then
      local r20_92 = r0_92.CharaLayer[r4_92][r6_92].expr3[1]
      if r20_92 >= 0 then
        r19_92 = r20_92
      end
    end
    if r4_92 == 23 and r5_92 == 4 and 0 <= r19_92 then
      r19_92 = r19_92 + 1
    end
    if r4_92 == 1 then
      local r20_92 = 0
      if r6_92 == 2 and 34 <= r9_92 then
        r20_92 = r20_92 + 1
      end
      if r6_92 == 3 and 9 <= r9_92 then
        r20_92 = r20_92 + 1
      end
      if r6_92 == 3 and 22 <= r9_92 then
        r20_92 = r20_92 + 1
      end
      if r6_92 == 3 and 25 <= r9_92 then
        r20_92 = r20_92 + 1
      end
      r9_92 = r9_92 + r20_92
    end
    if r19_92 >= 0 then
      r19_92 = r19_92 - r9_92 - 1
      if r4_92 == 23 and r9_92 == 6 then
        r19_92 = 0
      end
      r11_92:initSubLayer("Gallery", "GalleryCharaBu", r19_92 + r18_92, 1)
    end
    r11_92:forwardLayerOrder("Gallery", "GalleryBack", "GalleryDefaultBack")
    r11_92:forwardLayerOrder("Gallery", "GalleryCharaBu", "GalleryDefaultBack")
    r11_92:forwardLayerOrder("Gallery", "GalleryBace", "GalleryDefaultBack")
    r11_92:forwardLayerOrder("Gallery", "GalleryChara", "GalleryDefaultBack")
    r11_92:forwardLayerOrder("Gallery", "GalleryCharaBu", "GalleryBack")
    r11_92:forwardLayerOrder("Gallery", "GalleryBace", "GalleryBack")
    r11_92:forwardLayerOrder("Gallery", "GalleryChara", "GalleryBack")
    r11_92:forwardLayerOrder("Gallery", "GalleryBace", "GalleryCharaBu")
    r11_92:forwardLayerOrder("Gallery", "GalleryChara", "GalleryCharaBu")
    r11_92:forwardLayerOrder("Gallery", "GalleryChara", "GalleryBace")
    -- warn: not visited block [34]
    -- block#34:
    -- r19_92 = r19_92 + r18_92
    -- r11_92:initSubLayer("Gallery", "GalleryCharaBu", r19_92, 1)
    -- goto label_251
  end
  function r0_73.GalleryCharaDeletePic(r0_93)
    -- line: [4103, 4108] id: 93
    local r1_93 = cclass.lua_Layers:create()
    r1_93:removeLayer("Gallery", "GalleryBack")
    r1_93:removeLayer("Gallery", "GalleryCharaBu")
  end
  r0_73.CharaMenu = {}
  r0_73.CharaMenu.keyname = "GalleryChara"
  function r0_73.InitCharaMenu(r0_94)
    -- line: [4114, 4141] id: 94
    local r1_94 = cclass.lua_Layers:create()
    local r2_94 = getUItype()
    local r3_94 = "SYS_GalleryChara.pna"
    if r2_94 == 1 then
      r3_94 = "SYS_c_GalleryChara.pna"
    end
    r0_94:MenuLoadLayer(r0_94.CharaMenu.keyname, r3_94)
    r0_94:GalleryCharaPage()
    r0_94.MenuButton:SetList("BT_CharaPage", r0_94.BT_CharaPage)
    r0_94:MenuButtonInit()
    r0_94:GalleryCharaAct()
    r1_94:initSubLayer("Gallery", r0_94.CharaMenu.keyname, 507, 1)
    r1_94:initSubLayer("Gallery", r0_94.CharaMenu.keyname, 508, 1)
    r1_94:initSubLayer("Gallery", r0_94.CharaMenu.keyname, 509, 1)
    r1_94:initSubLayer("Gallery", r0_94.CharaMenu.keyname, 510, 1)
    return r0_94.CharaMenu.keyname
  end
end
if g_EnableNMS then
  GetNmsThumbnailNo = function(r0_95)
    -- line: [4160, 4174] id: 95
    local r1_95 = 183 + r0_95
    local r2_95 = 1 + r0_95
    if cfunc.LegacyGame__lua_GetFlag(1005) and 180 <= r0_95 then
      r1_95 = 183 + r0_95 - 180
      r2_95 = 1 + r0_95 - 180
    end
    return r1_95, r2_95
  end
  GalleryNmsMenu = function(r0_96)
    -- line: [4181, 6371] id: 96
    r0_96.NmsMenu = {}
    r0_96.NmsMenu.keyname = "NmsBace"
    r0_96.NmsMenu.FileName = "sys_nms.pna"
    r0_96.NmsMenu.ThumbOnNo = -1
    r0_96.NmsMenu.ExpTextNo = 0
    r0_96.NmsMenu.SlideFlag = 0
    r0_96.NmsMenu.BarMoveNo = -1
    r0_96.NmsMenu.ItemNMS = {}
    r0_96.NmsMenu.StandbyDragFlag = false
    r0_96.NmsMenu.StandbyDragParam = {}
    r0_96.NmsMenu.ENTRY_MAX = 250
    r0_96.NmsMenu.DropRepeatArg = 0
    r0_96.NmsMenu.DropRepeatTime = 0
    r0_96.NmsMenu.TH_PosLayer = 59
    r0_96.NmsSubKey = {}
    r0_96.NmsSubKey.NmsThTitle = "NmsThTitle"
    r0_96.NmsSubKey.NmsTitle = "NmsTitle"
    r0_96.NmsSubKey.NmsNo = "NmsNo"
    r0_96.NmsSubKey.NmsThumb = "NmsThumb"
    r0_96.NmsSubKey.NmsListTh = "NmsListTh"
    r0_96.NmsSubKey.NmsIconTh = "NmsIconTh"
    r0_96.NmsSubKey.PNmsThumb = "PNmsThumb"
    r0_96.NmsSubKey.PNmsListTh = "PNmsListTh"
    r0_96.NmsMenu.NmsButton = {}
    r0_96.NmsMenu.NmsEntry = {}
    r0_96.NmsMenu.NmsDrop = {}
    function r0_96.NmsMenuInitParam(r0_97)
      -- line: [4242, 4245] id: 97
      g_NmsData.THP_Slide = 0
      g_NmsData.THP_Param = 0
    end
    function r0_96.nmsGetTitleTextName(r0_98, r1_98)
      -- line: [4248, 4254] id: 98
      if r1_98 == -1 then
        return r0_98.NmsSubKey.NmsThTitle
      end
      return string.format("NmsTitle%03d", r1_98)
    end
    function r0_96.nmsCreateTitleLayer(r0_99)
      -- line: [4257, 4264] id: 99
      local r1_99 = cclass.lua_Layers:create()
      r1_99:insertTextLayer(r0_99.MenuInf.SetName, r0_99.NmsSubKey.NmsThTitle, 350, 32, 2, 2, 2, 2, 0, 1)
      for r5_99 = 0, 9, 1 do
        r1_99:insertTextLayer(r0_99.MenuInf.SetName, r0_99:nmsGetTitleTextName(r5_99), 350, 32, 2, 2, 2, 2, 0, 1)
      end
    end
    function r0_96.nmsDeleteTitleLayer(r0_100)
      -- line: [4267, 4273] id: 100
      local r1_100 = cclass.lua_Layers:create()
      for r5_100 = 0, 9, 1 do
        r1_100:removeLayer(r0_100.MenuInf.SetName, r0_100:nmsGetTitleTextName(r5_100))
      end
    end
    function r0_96.nmsSetTitle(r0_101, r1_101, r2_101)
      -- line: [4276, 4286] id: 101
      local r3_101 = cclass.lua_Layers:create()
      local r4_101 = r0_101:nmsGetTitleTextName(r1_101)
      r3_101:clearText(r0_101.MenuInf.SetName, r4_101)
      if r2_101 ~= nil and r2_101 ~= -1 then
        r3_101:setText(r0_101.MenuInf.SetName, r4_101, g_nmsTitleList[r2_101], g_NmsFonts.name, g_NmsFonts.size, 0, 0, 4294967295, 255)
      end
    end
    r0_96.nmsDrawThumbKeyNo = {}
    function r0_96.InitNmsMenu(r0_102)
      -- line: [4290, 4552] id: 102
      NmsSLMenuInitSaveData()
      g_NmsData.OneInit = true
      NmsMenuLoadBookMark()
      local r1_102 = cclass.lua_Layers:create()
      r0_102:MenuLoadLayer(r0_102.NmsMenu.keyname, r0_102.NmsMenu.FileName)
      r0_102:MenuLoadLayer(r0_102.NmsSubKey.NmsNo, "sys_nms_no.pna")
      r0_102:MenuLoadLayer(r0_102.NmsSubKey.NmsThumb, "sys_nms_th.pna")
      r0_102:MenuLoadLayer(r0_102.NmsSubKey.NmsListTh, "sys_nms_th.pna")
      r0_102:nmsCreateTitleLayer()
      if r0_102.PatchFlag then
        r0_102:MenuLoadLayer(r0_102.NmsSubKey.PNmsThumb, "Psys_nms_th.pna")
        r0_102:MenuLoadLayer(r0_102.NmsSubKey.PNmsListTh, "Psys_nms_th.pna")
      end
      r0_102:MenuLoadLayer(r0_102.NmsSubKey.NmsIconTh, "sys_nms_ic.pna")
      r1_102:initSubLayer(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, 121, 1)
      r1_102:initSubLayer(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, 124, 1)
      r1_102:initSubLayer(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, 37, 1)
      r1_102:initSubLayer(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, 189, 1)
      r1_102:initSubLayer(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, 219, 1)
      r1_102:initSubLayer(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, 216, 1)
      r1_102:initSubLayer(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, 217, 1)
      local r2_102 = 0
      local r3_102 = 0
      local r4_102 = 0
      local r5_102 = 0
      r2_102 = 281
      r3_102 = 168
      r1_102:setParam(r0_102.MenuInf.SetName, r0_102.NmsSubKey.NmsListTh, LUA_PARAM_POS, r2_102, r3_102, r4_102, r5_102)
      if r0_102.PatchFlag then
        r1_102:setParam(r0_102.MenuInf.SetName, r0_102.NmsSubKey.PNmsListTh, LUA_PARAM_POS, r2_102, r3_102, r4_102, r5_102)
      end
      r0_102.NmsMenu.NmsButton = {}
      local r6_102 = r0_102.NmsMenu.NmsButton
      r0_102:MakeYSlideBar(r6_102, "SL_Bar1", 1, r0_102.NmsMenu.keyname, 115, 116, 200, 0, 0)
      r0_102:MenuButtonSet(r6_102, "SL_BarBk1", 1, r0_102.NmsMenu.keyname, 118, -1, -1, -1, -1, 201, 0, -1)
      r0_102.NmsMenu.NmsButton.SL_BarBk1.se_click = -1
      r0_102:MenuButtonSet(r6_102, "SL_Bar1Up", 1, r0_102.NmsMenu.keyname, 106, 106, 107, -1, 108, 202, 0, 0)
      r0_102:MenuButtonSet(r6_102, "SL_Bar1Do", 1, r0_102.NmsMenu.keyname, 111, 111, 112, -1, 113, 203, 0, 0)
      r0_102:MakeYSlideBar(r6_102, "SL_Bar2", 1, r0_102.NmsMenu.keyname, 183, 184, 210, 0, 0)
      r0_102:MenuButtonSet(r6_102, "SL_BarBk2", 1, r0_102.NmsMenu.keyname, 186, -1, -1, -1, -1, 211, 0, -1)
      r0_102.NmsMenu.NmsButton.SL_BarBk2.se_click = -1
      r0_102:MenuButtonSet(r6_102, "SL_Bar2Up", 1, r0_102.NmsMenu.keyname, 174, 174, 175, -1, 176, 212, 0, 0)
      r0_102:MenuButtonSet(r6_102, "SL_Bar2Do", 1, r0_102.NmsMenu.keyname, 179, 179, 180, -1, 181, 213, 0, 0)
      r0_102:MenuButtonSet(r6_102, "TH_Reset", 1, r0_102.NmsMenu.keyname, 42, 42, 47, -1, 52, 110, 0, 0)
      r0_102:MenuButtonSet(r6_102, "TH_AllSet", 1, r0_102.NmsMenu.keyname, 43, 43, 48, -1, 53, 111, 0, 0)
      r0_102:MenuButtonSet(r6_102, "TH_Entry", 1, r0_102.NmsMenu.keyname, 44, 44, 49, -1, 54, 112, 0, 0)
      r0_102:MenuButtonSet(r6_102, "TH_AllPlay", 1, r0_102.NmsMenu.keyname, 127, 127, 128, -1, 129, 120, 0, 0)
      for r10_102 = 1, 9, 1 do
        local r11_102 = string.format("TH_%d", r10_102)
        local r12_102 = 71 + r10_102 - 1
        local r14_102 = -1
        r0_102:MenuButtonSet(r6_102, r11_102, 1, r0_102.NmsMenu.keyname, r12_102, r12_102, 82 + r10_102 - 1, -1, 93 + r10_102 - 1, 700 + r10_102 - 1, 0, -1)
        r11_102 = string.format("TH_%dplay", r10_102)
        r12_102 = 54 + (r10_102 - 1) * 5
        r0_102:MenuButtonSet(r6_102, r11_102, 1, r0_102.NmsSubKey.NmsIconTh, r12_102, r12_102, 55 + (r10_102 - 1) * 5, -1, -1, 800 + r10_102 - 1, 0, 1)
        r11_102 = string.format("TH_%dbmk", r10_102)
        r12_102 = 7 + (r10_102 - 1) * 5
        r0_102:MenuButtonSet(r6_102, r11_102, 1, r0_102.NmsSubKey.NmsIconTh, r12_102, r12_102, 8 + (r10_102 - 1) * 5, 9 + (r10_102 - 1) * 5, -1, 900 + r10_102 - 1, 0, 1)
        r0_102.nmsDrawThumbKeyNo[r10_102] = {
          key = -1,
          no = -1,
        }
      end
      r0_102:MenuButtonSet(r6_102, "EN_Load", 1, r0_102.NmsMenu.keyname, 24, 24, 29, -1, 34, 170, 0, 0)
      r0_102:MenuButtonSet(r6_102, "EN_Save", 1, r0_102.NmsMenu.keyname, 23, 23, 28, -1, 33, 171, 0, 0)
      r0_102:MenuButtonSet(r6_102, "EN_Reset", 1, r0_102.NmsMenu.keyname, 22, 22, 27, -1, 32, 172, 0, 0)
      r0_102:MenuButtonSet(r6_102, "EN_PlayTW", 1, r0_102.NmsMenu.keyname, 9, 9, 13, -1, 17, 181, 0, 0)
      r0_102:MenuButtonSet(r6_102, "EN_PlayTT", 1, r0_102.NmsMenu.keyname, 8, 8, 12, -1, 16, 180, 0, 0)
      r0_102:MenuButtonSet(r6_102, "EN_bmk", 1, r0_102.NmsSubKey.NmsIconTh, 1, 1, 2, 3, -1, 190, 0, 1)
      r0_102.NmsMenu.NmsEntry = {}
      local r7_102 = r0_102.NmsMenu.NmsEntry
      for r11_102 = 0, 9, 1 do
        local r12_102 = string.format("EN_List%d", r11_102)
        local r13_102 = 137 + r11_102
        r0_102:MenuButtonSet(r7_102, r12_102, 1, r0_102.NmsMenu.keyname, r13_102, r13_102, 149 + r11_102, 161 + r11_102, -1, 130 + r11_102, 150 + r11_102, 0)
      end
      r0_102.NmsMenu.NmsDrop = {}
      local r8_102 = r0_102.NmsMenu.NmsDrop
      r0_102:MenuButtonSet(r8_102, "EntryDrop", 1, r0_102.NmsMenu.keyname, 134, -1, 133, -1, -1, 500, 0, -1)
      r0_102:MenuButtonSet(r8_102, "DropListUp", 1, r0_102.NmsSubKey.NmsIconTh, 100, -1, 100, -1, -1, 501, 0, 0)
      r0_102:MenuButtonSet(r8_102, "DropListDown", 1, r0_102.NmsSubKey.NmsIconTh, 101, -1, 101, -1, -1, 502, 0, 0)
      for r12_102 = 0, 10, 1 do
        local r13_102 = "DropBetween" .. tostring(r12_102)
        r0_102:MenuButtonSet(r8_102, string.format("DropBetween%d", r12_102), 1, r0_102.NmsSubKey.NmsIconTh, 117 + r12_102, -1, 104 + r12_102, -1, -1, 400 + r12_102, 0, 0)
      end
      r0_102.MenuButton:SetList("BT_NmsButton", r6_102)
      r0_102.MenuButton:SetList("BT_NmsEntry", r7_102)
      r0_102.MenuButton:SetDropList("BT_NmsDrop", r8_102)
      r0_102:MenuButtonInit()
      r0_102.NmsMenu.ItemNMS = r0_102:ItemSetInit()
      r0_102.NmsMenu.ItemNMS.expSL_Bar1 = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 213)
      r0_102.NmsMenu.ItemNMS.expSL_Bar2 = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 210)
      r0_102.NmsMenu.ItemNMS.expTH_Reset = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 209)
      r0_102.NmsMenu.ItemNMS.expTH_AllSet = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 208)
      r0_102.NmsMenu.ItemNMS.expTH_Entry = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 207)
      r0_102.NmsMenu.ItemNMS.expTH_AllPlay = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 206)
      r0_102.NmsMenu.ItemNMS.expEN_Load = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 214)
      r0_102.NmsMenu.ItemNMS.expEN_Save = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 211)
      r0_102.NmsMenu.ItemNMS.expEN_Reset = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 203)
      r0_102.NmsMenu.ItemNMS.expEN_PlayTT = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 201)
      r0_102.NmsMenu.ItemNMS.expEN_PlayTW = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 202)
      r0_102.NmsMenu.ItemNMS.expTH_X_bmk = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 200)
      r0_102.NmsMenu.ItemNMS.expTH_X_bmkRE = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 199)
      r0_102.NmsMenu.ItemNMS.expTH_X_max = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 198)
      r0_102.NmsMenu.ItemNMS.expTH_X = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 197)
      r0_102.NmsMenu.ItemNMS.expTH_X_Play = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 196)
      r0_102.NmsMenu.ItemNMS.expEN_List_X = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 195)
      r0_102.NmsMenu.ItemNMS.expEntryDrop = MenuItem.new(r0_102.MenuInf.SetName, r0_102.NmsMenu.keyname, -1, 194)
      r0_102:StartSetParam()
      r0_102:InitEntryTextSur()
      r0_102:InitNumEntryTextSur()
      r0_102.NmsMenu.NmsButton.SL_Bar1:bt_SlidebarYInit(g_NmsData.THP_Param, 3, 20, 118, 119)
      r0_102.NmsMenu.NmsButton.SL_Bar2:bt_SlidebarYInit(g_NmsData.Param, 10, 20, 186, 187)
      r0_102:SetthumbBarParam(g_NmsData.THP_Slide, g_NmsData.THP_Param)
      r0_102:InitEntryList()
      r0_102:SetEntryText()
      r0_102:SetNumEntryTextSur()
      r0_102:SetThumb()
      r0_102:ThumbOn(-1)
      return r0_102.NmsMenu.keyname
    end
    function r0_96.ItemSetInit(r0_103)
      -- line: [4555, 4561] id: 103
      return {
        selCursor_selName = -1,
        selCursor_Conf = -1,
      }
    end
    function r0_96.ItemSet(r0_104, r1_104, r2_104, r3_104, r4_104)
      -- line: [4562, 4584] id: 104
      r1_104.selCursor_selName = r2_104
      if r1_104.selCursor_Item ~= -1 then
        r1_104.selCursor_Item = -1
      end
      if r1_104.selCursor_Conf ~= -1 then
        r1_104.selCursor_Conf:SetAct("def")
        r1_104.selCursor_Conf = -1
      end
      if r3_104 ~= -1 then
      end
      if r4_104 ~= -1 then
        r1_104.selCursor_Conf = r1_104[r4_104]
        r1_104.selCursor_Conf:SetAct("on")
      end
    end
    function r0_96.DeleteNmsMenu(r0_105)
      -- line: [4588, 4606] id: 105
      local r1_105 = cclass.lua_Layers:create()
      r1_105:removeLayer(r0_105.MenuInf.SetName, r0_105.NmsMenu.keyname)
      for r5_105, r6_105 in pairs(r0_105.NmsSubKey) do
        r1_105:removeLayer(r0_105.MenuInf.SetName, r6_105)
      end
      r0_105:nmsDeleteTitleLayer()
      for r5_105 = 1, 3, 1 do
        r1_105:removeLayer(r0_105.MenuInf.SetName, string.format("NmsNo%d", r5_105))
      end
    end
    function r0_96.NmsButtonJob(r0_106, r1_106, r2_106, r3_106, r4_106)
      -- line: [4615, 4942] id: 106
      if r1_106 ~= 0 and r2_106 == "LD" then
        if 700 <= r1_106 and r1_106 <= 709 then
          r0_106:StandbyDrag(r1_106 - 700 + 1, false, r3_106, r4_106)
        end
        if 800 <= r1_106 and r1_106 <= 809 then
          local r5_106 = r1_106 - 800 + 1
        end
        if 900 <= r1_106 and r1_106 <= 909 then
          local r5_106 = r1_106 - 900 + 1
        end
        if 130 <= r1_106 and r1_106 <= 139 and 2 <= g_NmsData.Param then
          r0_106:StandbyDrag(r1_106 - 130 + 1 + g_NmsData.Slide, true, r3_106, r4_106)
        end
        if r1_106 == 200 then
          r0_106.NmsMenu.BarMoveNo = 1
        end
        if r1_106 == 210 then
          r0_106.NmsMenu.BarMoveNo = 2
        end
      end
      if r2_106 == "LU" then
        if r0_106.NmsMenu.BarMoveNo == 1 then
          local r5_106 = r0_106.NmsMenu.NmsButton.SL_Bar1
          r5_106:bt_SetParamY(r5_106:bt_GetParamY())
          r0_106.NmsMenu.BarMoveNo = -1
          r0_106:SetThumb()
        end
        if r0_106.NmsMenu.BarMoveNo == 2 then
          local r5_106 = r0_106.NmsMenu.NmsButton.SL_Bar2
          r5_106:bt_SetParamY(r5_106:bt_GetParamY())
          r0_106.NmsMenu.BarMoveNo = -1
        end
        local r5_106 = 0
        if r0_106.MenuButton.selCursor ~= -1 then
          r5_106 = r0_106.MenuButton.selListKey[r0_106.MenuButton.selCursor].bt_l
        end
        r0_106:ThumbDragEnd(r5_106, r3_106, r4_106)
      end
      if r1_106 ~= 0 and r2_106 == "LU" then
        if nil and not nil then
          goto label_109	-- block#30 is visited secondly
        end
        if 130 <= r1_106 and r1_106 <= 139 then
          g_NmsData.Act = r1_106 - 130 + 1 + g_NmsData.Slide
          r0_106:SetEntryBarParam(r0_106.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY(), g_NmsData.Param)
          r0_106:EntryTh(-1)
        end
        if r1_106 == 201 then
          local r5_106 = r0_106.NmsMenu.NmsButton.SL_BarBk1.EVENT_RECT.h / (g_NmsData.THP_Param + 1 - r0_106.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PSIZE_Y)
          local r6_106 = r4_106 - r0_106.NmsMenu.NmsButton.SL_BarBk1.DRAW_POS.y
          if r6_106 < 0 then
            r6_106 = 0
          end
          r0_106:SetthumbBarParam(math.floor(r6_106 / r5_106), g_NmsData.THP_Param)
          r0_106:SetThumb()
        end
        if r1_106 == 202 then
          r0_106:SetthumbBarParam(r0_106.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PAR_Y - 1, g_NmsData.THP_Param)
          r0_106:SetThumb()
        end
        if r1_106 == 203 then
          r0_106:SetthumbBarParam(r0_106.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PAR_Y + 1, g_NmsData.THP_Param)
          r0_106:SetThumb()
        end
        if r1_106 == 211 then
          local r5_106 = r0_106.NmsMenu.NmsButton.SL_BarBk2.EVENT_RECT.h / (g_NmsData.Param + 1 - r0_106.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PSIZE_Y)
          local r6_106 = r4_106 - r0_106.NmsMenu.NmsButton.SL_BarBk2.DRAW_POS.y
          if r6_106 < 0 then
            r6_106 = 0
          end
          local r7_106 = math.floor(r6_106 / r5_106)
          r0_106.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(r7_106)
          r0_106:SetEntryBarParam(r7_106, g_NmsData.Param)
        end
        if r1_106 == 212 then
          local r5_106 = r0_106.NmsMenu.NmsButton.SL_Bar2
          local r6_106 = r5_106.MOVABLE.PAR_Y - 1
          r5_106:bt_SetParamY(r6_106)
          r0_106:SetEntryBarParam(r6_106, g_NmsData.Param)
        end
        if r1_106 == 213 then
          local r5_106 = r0_106.NmsMenu.NmsButton.SL_Bar2
          local r6_106 = r5_106.MOVABLE.PAR_Y + 1
          r5_106:bt_SetParamY(r6_106)
          r0_106:SetEntryBarParam(r6_106, g_NmsData.Param)
        end
        if r1_106 == 110 then
          NmsMenuSetBookMarkAll(0)
          r0_106:EntryTh(-1)
          r0_106:SetThumb()
        end
        if r1_106 == 111 then
          NmsMenuSetBookMarkAll(1)
          r0_106:EntryTh(-1)
          r0_106:SetThumb()
        end
        if r1_106 == 112 then
          for r8_106 = 1, #g_NmsData.THP_List, 1 do
            if g_NmsData.THP_ListEnable[r8_106] == true then
              local r9_106 = g_NmsData.THP_List[r8_106] + 1
              if g_NmsData.THP_BookMark[r9_106] == 1 then
                local r10_106 = g_NmsData.Act
                if r10_106 == -1 then
                  r10_106 = 0
                end
                if r0_106:AddEntryList(r10_106 + 1, r9_106 - 1) == false then
                  break
                end
              end
            end
          end
        end
        if r1_106 == 120 then
          g_NmsPlay.Slide = 0
          g_NmsPlay.List = {}
          g_NmsPlay.Act = 1
          g_NmsPlay.Param = 0
          for r8_106 = 1, #g_NmsData.THP_List, 1 do
            if g_NmsData.THP_ListEnable[r8_106] == true then
              g_NmsPlay.Param = g_NmsPlay.Param + 1
              g_NmsPlay.List[g_NmsPlay.Param] = g_NmsData.THP_List[r8_106]
            end
          end
          r0_106:endMenu(1000, 1)
        end
        if r1_106 == 170 then
          r0_106:endMenu(-10, 1)
        end
        if r1_106 == 171 then
          r0_106:endMenu(-20, 1)
        end
        if r1_106 == 172 then
          NmsMenuInitENP()
          r0_106:InitEntryList()
        end
        if r1_106 == 180 then
          g_NmsPlay.Slide = 0
          g_NmsPlay.List = g_NmsData.List
          g_NmsPlay.Act = 1
          g_NmsPlay.Param = g_NmsData.Param
          r0_106:endMenu(2000, 1)
        end
        if r1_106 == 181 then
          g_NmsPlay.Slide = g_NmsData.Slide
          g_NmsPlay.List = g_NmsData.List
          g_NmsPlay.Act = g_NmsData.Act
          g_NmsPlay.Param = g_NmsData.Param
          r0_106:endMenu(3000, g_NmsData.Act)
        end
        if r1_106 == 190 then
          local r5_106 = g_NmsData.List[g_NmsData.Act] + 1
          if g_NmsData.THP_BookMark[r5_106] == 0 then
            g_NmsData.THP_BookMark[r5_106] = 1
          else
            g_NmsData.THP_BookMark[r5_106] = 0
          end
          NmsMenuSaveBookMark()
          r0_106:EntryTh(-1)
          r0_106:SetThumb()
          r0_106.NmsMenu.ExpTextNo = 0
        end
        if 800 <= r1_106 and r1_106 <= 808 then
          local r5_106 = r1_106 - 800 + g_NmsData.THP_Slide * 3 + 1
          g_NmsPlay.Slide = 0
          g_NmsPlay.List = {}
          g_NmsPlay.List[1] = g_NmsData.THP_List[r5_106]
          g_NmsPlay.Act = 1
          g_NmsPlay.Param = 1
          r0_106:endMenu(g_NmsData.THP_List[r5_106], 1)
        end
        if 900 <= r1_106 and r1_106 <= 908 then
          local r6_106 = g_NmsData.THP_List[r1_106 - 900 + g_NmsData.THP_Slide * 3 + 1] + 1
          if g_NmsData.THP_BookMark[r6_106] == 0 then
            g_NmsData.THP_BookMark[r6_106] = 1
          else
            g_NmsData.THP_BookMark[r6_106] = 0
          end
          NmsMenuSaveBookMark()
          r0_106:EntryTh(-1)
          r0_106:SetThumb()
          r0_106.NmsMenu.ExpTextNo = 0
        end
        if r1_106 == 999 then
          r0_106:endMenu(-1, -1)
        end
        if r1_106 == 1000 then
        end
      end
      if r2_106 == "RU" then
        r0_106:DelEntryList(r1_106 - 150 + 1 + g_NmsData.Slide)
        local r7_106 = cclass.lua_Layers:create():getCursorPos(r0_106.MenuInf.SetName, r3_106, r4_106, 0) - 1
        r0_106.MenuButton:changeButton(r0_106.MenuInf.SetName, r7_106, r3_106, r4_106)
        r0_106:SetEntryBarParam(r0_106.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY(), g_NmsData.Param)
        r0_106:SetThumbTitle()
        r0_106:defaultMenuMouseMove(r0_106.MenuInf.SetName, -1, r7_106, r3_106, r4_106, false)
        local r10_106 = -1
        for r14_106 = 0, 9, 1 do
          if r0_106.MenuButton.selCursor == string.format("EN_List%d", r14_106) then
            r10_106 = r14_106
            break
          end
        end
        r0_106:EntryTh(r10_106)
      end
    end
    function r0_96.InitEntryTextSur(r0_107)
      -- line: [4958, 4964] id: 107
      local r1_107 = cclass.lua_Layers:create()
      for r5_107 = 0, 9, 1 do
        r0_107:nmsSetTitle(r5_107, -1)
      end
    end
    function r0_96.SetEntryText(r0_108)
      -- line: [4967, 5024] id: 108
      local r1_108 = cclass.lua_Layers:create()
      local r2_108 = ""
      local r3_108 = g_NmsData.Param
      for r7_108 = 0, 9, 1 do
        local r8_108 = "EN_List" .. tostring(r7_108)
        local r9_108 = string.format("EN_List%d", r7_108)
        if r0_108.NmsMenu.NmsEntry[r9_108].active == 0 or r0_108.NmsMenu.NmsEntry[r9_108].active == 4 then
          r0_108:nmsSetTitle(r7_108, g_NmsData.List[r7_108 + g_NmsData.Slide + 1] + 1)
          local r11_108 = r0_108:nmsGetTitleTextName(r7_108)
          r1_108:setParam(r0_108.MenuInf.SetName, r11_108, LUA_PARAM_POS, r0_108.NmsMenu.NmsEntry[r9_108].DRAW_POS.x + 5, r0_108.NmsMenu.NmsEntry[r9_108].DRAW_POS.y, 0, 0)
          if r0_108.DD_Param.no ~= -1 then
            r1_108:swapLayerOrder(r0_108.MenuInf.SetName, "NmsDragTh", r11_108)
          end
        else
          r0_108:nmsSetTitle(r7_108, -1)
        end
      end
    end
    function r0_96.InitNumEntryTextSur(r0_109)
      -- line: [5028, 5035] id: 109
      local r1_109 = cclass.lua_Layers:create()
      for r5_109 = 0, 9, 1 do
        r1_109:initSubLayer(r0_109.MenuInf.SetName, r0_109.NmsSubKey.NmsNo, r5_109, 0)
      end
    end
    function r0_96.SetNumEntryTextSur(r0_110)
      -- line: [5038, 5065] id: 110
      local r1_110 = cclass.lua_Layers:create()
      local r2_110 = {
        [1] = g_NmsData.Param % 10,
        [2] = math.floor(g_NmsData.Param / 10) % 10,
        [3] = math.floor(g_NmsData.Param / 100),
      }
      for r6_110 = 1, 3, 1 do
        local r7_110 = 4 - r6_110 - 1
        r1_110:initSubLayer(r0_110.MenuInf.SetName, r0_110.NmsMenu.keyname, r7_110, 0)
        local r8_110 = 0
        local r9_110 = 0
        r8_110, r9_110, r10_110, r11_110 = r1_110:getSubLayerParam(r0_110.MenuInf.SetName, r0_110.NmsMenu.keyname, r7_110, LUA_PARAM_POS, r8_110, r9_110, 0, 0)
        local r12_110 = string.format("NmsNo%d", r6_110)
        r1_110:removeLayer(r0_110.MenuInf.SetName, r12_110)
        r1_110:insertPNARefLayer(r0_110.MenuInf.SetName, r12_110, r0_110.NmsSubKey.NmsNo, r2_110[r6_110], 1)
        r1_110:setParam(r0_110.MenuInf.SetName, r12_110, LUA_PARAM_POS, r8_110, r9_110, 0, 0)
      end
    end
    function r0_96.NmsMouseMove(r0_111, r1_111, r2_111, r3_111, r4_111, r5_111, r6_111)
      -- line: [5069, 5247] id: 111
      if r0_111.NmsMenu.StandbyDragFlag == true then
        r0_111:ThumbDragStart(r0_111.NmsMenu.StandbyDragParam.no, r0_111.NmsMenu.StandbyDragParam.move, r0_111.NmsMenu.StandbyDragParam.x, r0_111.NmsMenu.StandbyDragParam.y)
      end
      if r0_111.MenuButton.selDownCursor ~= -1 then
        r0_111:ThumbDragOn(r4_111, r5_111)
      end
      local r7_111 = r0_111.MenuButton.selCursor
      if r7_111 == -1 or r0_111.NmsMenu.ItemNMS.selCursor_selName ~= r7_111 then
        r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, -1, -1, -1)
      end
      if r7_111 ~= r0_111.NmsMenu.ExpTextNo or r0_111.NmsMenu.SlideFlag ~= 0 then
        if r0_111.NmsMenu.SlideFlag ~= 0 then
        end
        r0_111.NmsMenu.SlideFlag = 0
        r0_111.NmsMenu.ExpTextNo = r7_111
        if r7_111 == "SL_Bar1" then
          r0_111.NmsMenu.SlideFlag = 1
          r0_111:SetthumbBarParam(r0_111.NmsMenu.NmsButton.SL_Bar1:bt_GetParamY(), g_NmsData.THP_Param)
          r0_111:SetThumb()
          text_no = 7
        end
        if r7_111 == "SL_Bar2" then
          r0_111.NmsMenu.SlideFlag = 2
          r0_111:SetEntryBarParam(r0_111.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY(), g_NmsData.Param)
          text_no = 8
        end
        if "SL_Bar1" == r7_111 or "SL_BarBk1" == r7_111 or "SL_Bar1Up" == r7_111 or "SL_Bar1Do" == r7_111 then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expSL_Bar1")
        end
        if "SL_Bar2" == r7_111 or "SL_BarBk2" == r7_111 or "SL_Bar2Up" == r7_111 or "SL_Bar2Do" == r7_111 then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expSL_Bar2")
        end
        if r7_111 == "TH_Reset" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_Reset")
        end
        if r7_111 == "TH_AllSet" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_AllSet")
        end
        if r7_111 == "TH_Entry" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_Entry")
        end
        if r7_111 == "TH_AllPlay" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_AllPlay")
        end
        local r8_111 = -1
        for r12_111 = 1, 9, 1 do
          if string.format("TH_%d", r12_111) == r7_111 then
            if r0_111.NmsMenu.ENTRY_MAX <= g_NmsData.Param then
              r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_X_max")
            else
              r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_X")
            end
            r8_111 = r12_111
            break
          elseif string.format("TH_%dplay", r12_111) == r7_111 then
            r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_X_Play")
            r8_111 = r12_111
            break
          elseif string.format("TH_%dbmk", r12_111) == r7_111 then
            if g_NmsData.THP_BookMark[g_NmsData.THP_List[g_NmsData.THP_Slide * 3 + r12_111] + 1] == 0 then
              r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_X_bmk")
            else
              r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_X_bmkRE")
            end
            r8_111 = r12_111
            break
          end
        end
        r0_111.NmsMenu.ThumbOnNo = r8_111
        r0_111:ThumbOn(r8_111)
        r0_111:SetThumbTitle()
        if r7_111 == "EN_Load" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expEN_Load")
        end
        if r7_111 == "EN_Save" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expEN_Save")
        end
        if r7_111 == "EN_Reset" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expEN_Reset")
        end
        if r7_111 == "EN_PlayTT" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expEN_PlayTT")
        end
        if r7_111 == "EN_PlayTW" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expEN_PlayTW")
        end
        if r7_111 == "EN_bmk" then
          if g_NmsData.THP_BookMark[g_NmsData.List[g_NmsData.Act] + 1] == 0 then
            r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_X_bmk")
          else
            r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expTH_X_bmkRE")
          end
        end
        local r9_111 = -1
        for r13_111 = 0, 9, 1 do
          if string.format("EN_List%d", r13_111) == r7_111 then
            r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expEN_List_X")
            r9_111 = r13_111
            break
          end
        end
        r0_111:EntryTh(r9_111)
        if r7_111 == "EntryDrop" then
          r0_111:ItemSet(r0_111.NmsMenu.ItemNMS, r7_111, -1, "expEntryDrop")
        end
      end
    end
    function r0_96.NmsMouseWheel(r0_112, r1_112, r2_112)
      -- line: [5251, 5330] id: 112
      if r0_112:GetMenuMouseEnable() then
        local r3_112 = 0
        local r4_112 = 0
        local r5_112 = cclass.lua_AutoCursor:new()
        r3_112, r4_112 = r5_112:GetCursorPos(r3_112, r4_112)
        r5_112:delete()
        r2_112 = r2_112 / 2
        if 0 <= r3_112 and r3_112 < 490 and 0 <= r4_112 and r4_112 < APP_INTERNAL_HEIGHT and 10 < g_NmsData.Param then
          local r6_112 = r0_112.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PAR_Y - r2_112
          if r6_112 < 0 then
            r6_112 = 0
          end
          local r7_112 = g_NmsData.Param - r0_112.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PSIZE_Y
          if r7_112 < r6_112 then
            r6_112 = r7_112
          end
          r0_112.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(r6_112)
          r0_112:SetEntryBarParam(r6_112, g_NmsData.Param)
          r0_112:defaultMenuMouseMove(r0_112.MenuInf.SetName, -1, cclass.lua_Layers:create():getCursorPos(r0_112.MenuInf.SetName, r3_112, r4_112, 0) - 1, r3_112, r4_112, false)
          local r10_112 = -1
          for r14_112 = 0, 9, 1 do
            if r0_112.MenuButton.selCursor == string.format("EN_List%d", r14_112) then
              r10_112 = r14_112
              break
            end
          end
          r0_112:EntryTh(r10_112)
        end
        if 490 <= r3_112 and r3_112 < 1280 and 0 <= r4_112 and r4_112 < APP_INTERNAL_HEIGHT and 3 < g_NmsData.THP_Param then
          local r6_112 = r0_112.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PAR_Y - r2_112
          if r6_112 < 0 then
            r6_112 = 0
          end
          local r7_112 = g_NmsData.THP_Param - r0_112.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PSIZE_Y
          if r7_112 < r6_112 then
            r6_112 = r7_112
          end
          r0_112:SetthumbBarParam(r6_112, g_NmsData.THP_Param)
          r0_112:SetThumb()
          r0_112:MenuMouseMove(r0_112.MenuInf.SetName, -1, cclass.lua_Layers:create():getCursorPos(r0_112.MenuInf.SetName, r3_112, r4_112, 0) - 1, r3_112, r4_112, false)
        end
        r0_112:SetThumbTitle()
      end
    end
    function r0_96.endMenu(r0_113, r1_113, r2_113)
      -- line: [5334, 5361] id: 113
      local r3_113 = cclass.lua_Layers:create()
      cfunc.LegacyGame__lua_SetVariable(99, r1_113)
      cfunc.LegacyGame__lua_SetVariable(98, r2_113)
      if r1_113 == -1 then
        r0_113:closeGallery(0)
        cfunc.LegacyGame__lua_SetFlag(140, false)
      elseif r1_113 == -10 or r1_113 == -20 then
        r0_113:closeGallery(1)
        cfunc.LegacyGame__lua_SetFlag(140, true)
      else
        r0_113:GalleryBgmStop()
        r0_113:closeGallery(4)
        g_menuExecute = false
        cfunc.LegacyGame__lua_SetFlag(140, true)
      end
    end
    function r0_96.SetthumbBarParam(r0_114, r1_114, r2_114)
      -- line: [5364, 5397] id: 114
      g_NmsData.THP_Param = r2_114
      g_NmsData.THP_Slide = r1_114
      r0_114.NmsMenu.NmsButton.SL_Bar1:bt_SetParamY(g_NmsData.THP_Slide)
      r2_114 = r2_114 - r0_114.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PSIZE_Y
      if r2_114 <= 0 then
        r0_114.NmsMenu.NmsButton.SL_Bar1:bt_SetActive(2)
        r0_114.NmsMenu.NmsButton.SL_BarBk1:bt_SetActive(2)
        r0_114.NmsMenu.NmsButton.SL_Bar1Up:bt_SetActive(2)
        r0_114.NmsMenu.NmsButton.SL_Bar1Do:bt_SetActive(2)
      else
        if r2_114 <= g_NmsData.THP_Slide then
          g_NmsData.THP_Slide = r2_114
        end
        r0_114.NmsMenu.NmsButton.SL_Bar1:bt_SetActive(0)
        r0_114.NmsMenu.NmsButton.SL_BarBk1:bt_SetActive(0)
        if g_NmsData.THP_Slide <= 0 then
          r0_114.NmsMenu.NmsButton.SL_Bar1Up:bt_SetActive(2)
        else
          r0_114.NmsMenu.NmsButton.SL_Bar1Up:bt_SetActive(0)
        end
        if r2_114 <= g_NmsData.THP_Slide then
          r0_114.NmsMenu.NmsButton.SL_Bar1Do:bt_SetActive(2)
        else
          r0_114.NmsMenu.NmsButton.SL_Bar1Do:bt_SetActive(0)
        end
      end
    end
    function r0_96.SetEntryBarParam(r0_115, r1_115, r2_115)
      -- line: [5401, 5443] id: 115
      g_NmsData.Param = r2_115
      g_NmsData.Slide = r1_115
      r2_115 = r2_115 - r0_115.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PSIZE_Y
      if r2_115 <= 0 then
        r0_115.NmsMenu.NmsButton.SL_Bar2:bt_SetActive(2)
        r0_115.NmsMenu.NmsButton.SL_BarBk2:bt_SetActive(2)
        r0_115.NmsMenu.NmsButton.SL_Bar2Up:bt_SetActive(2)
        r0_115.NmsMenu.NmsButton.SL_Bar2Do:bt_SetActive(2)
        r0_115.NmsMenu.NmsDrop.DropListUp:bt_SetActive(3)
        r0_115.NmsMenu.NmsDrop.DropListDown:bt_SetActive(3)
      else
        if r2_115 <= g_NmsData.Slide then
          g_NmsData.Slide = r2_115
        end
        r0_115.NmsMenu.NmsButton.SL_Bar2:bt_SetActive(0)
        r0_115.NmsMenu.NmsButton.SL_BarBk2:bt_SetActive(0)
        if g_NmsData.Slide <= 0 then
          r0_115.NmsMenu.NmsButton.SL_Bar2Up:bt_SetActive(2)
          r0_115.NmsMenu.NmsDrop.DropListUp:bt_SetActive(3)
        else
          r0_115.NmsMenu.NmsButton.SL_Bar2Up:bt_SetActive(0)
          r0_115.NmsMenu.NmsDrop.DropListUp:bt_SetActive(0)
        end
        if r2_115 <= g_NmsData.Slide then
          r0_115.NmsMenu.NmsButton.SL_Bar2Do:bt_SetActive(2)
          r0_115.NmsMenu.NmsDrop.DropListDown:bt_SetActive(3)
        else
          r0_115.NmsMenu.NmsButton.SL_Bar2Do:bt_SetActive(0)
          r0_115.NmsMenu.NmsDrop.DropListDown:bt_SetActive(0)
        end
      end
      r0_115:SetEntryBarBt()
      r0_115:SetEntryText()
      r0_115:SetNumEntryTextSur()
    end
    function r0_96.SetEntryBarBt(r0_116)
      -- line: [5446, 5471] id: 116
      for r4_116 = 0, 9, 1 do
        local r5_116 = string.format("EN_List%d", r4_116)
        if r4_116 < g_NmsData.Param then
          local r6_116 = g_NmsData.Act
          if r6_116 ~= -1 then
            r6_116 = r6_116 - g_NmsData.Slide
          end
          if r6_116 == r4_116 + 1 then
            r0_116.NmsMenu.NmsEntry[r5_116]:bt_SetActive(4)
          else
            r0_116.NmsMenu.NmsEntry[r5_116]:bt_SetActive(0)
          end
        else
          r0_116.NmsMenu.NmsEntry[r5_116]:bt_SetActive(2)
        end
      end
      r0_116:SetDropBetween()
    end
    function r0_96.SetDropBetween(r0_117)
      -- line: [5474, 5494] id: 117
      if g_NmsData.Param > 0 then
        r0_117.NmsMenu.NmsDrop.DropBetween0:bt_SetActive(0)
      else
        r0_117.NmsMenu.NmsDrop.DropBetween0:bt_SetActive(2)
      end
      for r4_117 = 1, 10, 1 do
        local r5_117 = string.format("DropBetween%d", r4_117)
        if r4_117 <= g_NmsData.Param then
          r0_117.NmsMenu.NmsDrop[r5_117]:bt_SetActive(0)
        else
          r0_117.NmsMenu.NmsDrop[r5_117]:bt_SetActive(2)
        end
      end
    end
    function r0_96.SetThumbOnOff(r0_118)
      -- line: [5496, 5528] id: 118
      local r1_118 = cclass.lua_Layers:create()
      for r5_118 = 1, 9, 1 do
        if r0_118.nmsDrawThumbKeyNo[r5_118].key ~= -1 and r0_118.nmsDrawThumbKeyNo[r5_118].no ~= -1 then
          local r6_118 = -1
          local r7_118 = -1
          r6_118, r7_118 = GetNmsThumbnailNo(r0_118.nmsDrawThumbKeyNo[r5_118].no)
          if r6_118 ~= -1 then
            if string.format("TH_%d", r5_118) == r0_118.MenuButton.selCursor then
              r1_118:setSubLayerVisible(r0_118.MenuInf.SetName, r0_118.nmsDrawThumbKeyNo[r5_118].key, r6_118, 0)
              if r7_118 ~= -1 then
                r1_118:setSubLayerVisible(r0_118.MenuInf.SetName, r0_118.nmsDrawThumbKeyNo[r5_118].key, r7_118, 1)
              end
            else
              r1_118:setSubLayerVisible(r0_118.MenuInf.SetName, r0_118.nmsDrawThumbKeyNo[r5_118].key, r6_118, 1)
              if r7_118 ~= -1 then
                r1_118:setSubLayerVisible(r0_118.MenuInf.SetName, r0_118.nmsDrawThumbKeyNo[r5_118].key, r7_118, 0)
              end
            end
          elseif r7_118 ~= -1 then
            r1_118:setSubLayerVisible(r0_118.MenuInf.SetName, r0_118.nmsDrawThumbKeyNo[r5_118].key, r7_118, 1)
          end
        end
      end
    end
    function r0_96.SetThumb(r0_119)
      -- line: [5531, 5661] id: 119
      local r1_119 = cclass.lua_Layers:create()
      for r5_119 = 1, 9, 1 do
        if r0_119.nmsDrawThumbKeyNo[r5_119].key ~= -1 and r0_119.nmsDrawThumbKeyNo[r5_119].no ~= -1 then
          local r6_119 = -1
          local r7_119 = -1
          r6_119, r7_119 = GetNmsThumbnailNo(r0_119.nmsDrawThumbKeyNo[r5_119].no)
          if r6_119 ~= -1 then
            r1_119:setSubLayerVisible(r0_119.MenuInf.SetName, r0_119.nmsDrawThumbKeyNo[r5_119].key, r6_119, 0)
          end
          if r7_119 ~= -1 then
            r1_119:setSubLayerVisible(r0_119.MenuInf.SetName, r0_119.nmsDrawThumbKeyNo[r5_119].key, r7_119, 0)
          end
          r0_119.nmsDrawThumbKeyNo[r5_119].key = -1
          r0_119.nmsDrawThumbKeyNo[r5_119].no = -1
        end
      end
      local r2_119 = g_NmsData.THP_Slide * 3 + 1
      local r3_119 = 1
      for r7_119 = 1, 9, 1 do
        local r8_119 = string.format("TH_%d", r7_119)
        local r9_119 = r0_119.NmsMenu.TH_PosLayer + r7_119 - 1
        if r2_119 <= #g_NmsData.THP_List and g_NmsData.THP_ListEnable[r2_119] == true then
          local r10_119 = 0
          local r11_119 = 0
          local r12_119 = 0
          local r13_119 = 0
          r1_119:initSubLayer(r0_119.MenuInf.SetName, r0_119.NmsMenu.keyname, r9_119, 0)
          r10_119, r11_119, r12_119, r13_119 = r1_119:getSubLayerParam(r0_119.MenuInf.SetName, r0_119.NmsMenu.keyname, r9_119, LUA_PARAM_POS, r10_119, r11_119, r12_119, r13_119)
          local r14_119 = g_NmsData.THP_List[r2_119]
          local r15_119 = r0_119.NmsSubKey.NmsThumb
          if g_NmsData.MAX_THUMB <= r14_119 then
            r15_119 = r0_96.NmsSubKey.PNmsThumb
          end
          local r16_119 = -1
          local r17_119 = -1
          r16_119, r17_119 = GetNmsThumbnailNo(r14_119)
          r0_119.nmsDrawThumbKeyNo[r7_119].key = r15_119
          r0_119.nmsDrawThumbKeyNo[r7_119].no = r14_119
          if r16_119 ~= -1 then
            r1_119:initSubLayer(r0_119.MenuInf.SetName, r15_119, r16_119, 0)
            r1_119:setSubLayerParam(r0_119.MenuInf.SetName, r15_119, r16_119, LUA_PARAM_POS, r10_119, r11_119, r12_119, r13_119)
          end
          if r17_119 ~= -1 then
            r1_119:initSubLayer(r0_119.MenuInf.SetName, r15_119, r17_119, 0)
            r1_119:setSubLayerParam(r0_119.MenuInf.SetName, r15_119, r17_119, LUA_PARAM_POS, r10_119, r11_119, r12_119, r13_119)
          end
          r0_119.NmsMenu.NmsButton[r8_119]:bt_SetActive(0)
        else
          r0_119.NmsMenu.NmsButton[r8_119]:bt_SetActive(2)
          r0_119.NmsMenu.NmsButton[string.format("TH_%dplay", r7_119)]:bt_SetActive(2)
          r0_119.NmsMenu.NmsButton[string.format("TH_%dbmk", r7_119)]:bt_SetActive(2)
        end
        if g_NmsData.MAX_THUMB < r2_119 then
          r0_119.NmsMenu.NmsButton[string.format("TH_%d", r7_119)]:bt_SetActive(3)
        end
        r2_119 = r2_119 + 1
      end
      r0_119:SetThumbOnOff()
      r0_119:InitBookMarkBt()
      if g_NmsData.THP_EnableCount > 0 then
        r0_119.NmsMenu.NmsButton.TH_AllPlay:bt_SetActive(0)
      else
        r0_119.NmsMenu.NmsButton.TH_AllPlay:bt_SetActive(2)
      end
    end
    function r0_96.SetThumbTitle(r0_120)
      -- line: [5664, 5680] id: 120
      local r1_120 = cclass.lua_Layers:create()
      local r2_120 = -1
      if r0_120.NmsMenu.ThumbOnNo ~= -1 then
        r2_120 = r0_120.NmsMenu.ThumbOnNo - 1 + g_NmsData.THP_Slide * 3
      end
      if r0_120.DD_Param.no ~= -1 and r0_120.DD_Param.move == false then
        r2_120 = r0_120.DD_Param.no
      end
      r0_120:nmsSetTitle(-1, r2_120 + 1)
    end
    function r0_96.InitBookMarkBt(r0_121)
      -- line: [5684, 5707] id: 121
      local r1_121 = cclass.lua_Layers:create()
      for r5_121 = 1, 9, 1 do
        local r6_121 = "TH_" .. tostring(r5_121) .. "bmk"
        local r7_121 = string.format("TH_%dbmk", r5_121)
        local r8_121 = g_NmsData.THP_Slide * 3 + r5_121
        if r8_121 <= #g_NmsData.THP_List and g_NmsData.THP_ListEnable[r8_121] == true then
          if g_NmsData.THP_BookMark[g_NmsData.THP_List[r8_121] + 1] == 0 then
            r0_121.NmsMenu.NmsButton[r7_121]:bt_SetActive(0)
          else
            r0_121.NmsMenu.NmsButton[r7_121]:bt_SetActive(4)
          end
        else
          r0_121.NmsMenu.NmsButton[r7_121]:bt_SetActive(3)
        end
      end
      r0_121:InitTHBookMarkBt()
    end
    function r0_96.InitTHBookMarkBt(r0_122)
      -- line: [5710, 5717] id: 122
      if r0_122.NmsMenu.ENTRY_MAX <= g_NmsData.Param then
        r0_122.NmsMenu.NmsButton.TH_Entry:bt_SetActive(2)
      else
        r0_122.NmsMenu.NmsButton.TH_Entry:bt_SetActive(0)
      end
    end
    function r0_96.ThumbOn(r0_123, r1_123)
      -- line: [5721, 5738] id: 123
      local r2_123 = cclass.lua_Layers:create()
      for r6_123 = 1, 9, 1 do
        local r7_123 = string.format("TH_%dplay", r6_123)
        if r1_123 == r6_123 then
          r0_123.NmsMenu.NmsButton[r7_123]:bt_SetActive(0)
        else
          r0_123.NmsMenu.NmsButton[r7_123]:bt_SetActive(2)
        end
      end
      r0_123:SetThumbOnOff()
    end
    r0_96.DD_Param = {
      no = -1,
      move = false,
      POS_X = 0,
      POS_Y = 0,
      DRAGST_X = 0,
      DRAGST_Y = 0,
      list_pos = -1,
    }
    function r0_96.StandbyDrag(r0_124, r1_124, r2_124, r3_124, r4_124)
      -- line: [5753, 5763] id: 124
      if r0_124.NmsMenu.ENTRY_MAX > g_NmsData.Param then
        r0_124.NmsMenu.StandbyDragFlag = true
        r0_124.NmsMenu.StandbyDragParam = {}
        r0_124.NmsMenu.StandbyDragParam.no = r1_124
        r0_124.NmsMenu.StandbyDragParam.move = r2_124
        r0_124.NmsMenu.StandbyDragParam.x = r3_124
        r0_124.NmsMenu.StandbyDragParam.y = r4_124
      end
    end
    function r0_96.ThumbDragStart(r0_125, r1_125, r2_125, r3_125, r4_125)
      -- line: [5766, 5838] id: 125
      if r0_125.NmsMenu.StandbyDragFlag == true then
        r0_125.NmsMenu.StandbyDragFlag = false
      end
      if r0_125.NmsMenu.ENTRY_MAX > g_NmsData.Param then
        local r5_125 = cclass.lua_Layers:create()
        r0_125.MenuButton.onDropFlag = true
        r0_125.DD_Param.move = r2_125
        if r0_125.DD_Param.move == true then
          r0_125.DD_Param.no = g_NmsData.List[r1_125]
          r0_125.DD_Param.POS_X = 0
          r0_125.DD_Param.POS_Y = 0
          r0_125.DD_Param.DRAGST_X = -70
          r0_125.DD_Param.DRAGST_Y = -52
          r0_125.DD_Param.list_pos = r1_125
          r0_125.NmsMenu.NmsDrop.EntryDrop:bt_SetActive(2)
        else
          local r6_125 = "TH_" .. tostring(r1_125)
          local r7_125 = string.format("TH_%d", i)
          r0_125.DD_Param.no = g_NmsData.THP_List[g_NmsData.THP_Slide * 3 + r1_125]
          r0_125.DD_Param.POS_X = r0_125.NmsMenu.NmsButton[r7_125].DRAW_POS.x
          r0_125.DD_Param.POS_Y = r0_125.NmsMenu.NmsButton[r7_125].DRAW_POS.y
          r0_125.DD_Param.DRAGST_X = r0_125.DD_Param.POS_X - r3_125
          r0_125.DD_Param.DRAGST_Y = r0_125.DD_Param.POS_Y - r4_125
          r0_125.DD_Param.list_pos = -1
          r0_125.NmsMenu.NmsDrop.EntryDrop:bt_SetActive(0)
        end
        local r6_125 = r3_125 + r0_125.DD_Param.DRAGST_X
        local r7_125 = r4_125 + r0_125.DD_Param.DRAGST_Y
        local r8_125 = r0_125.DD_Param.no
        local r9_125 = r0_125.NmsSubKey.NmsThumb
        if g_NmsData.MAX_THUMB <= r8_125 then
          r9_125 = r0_96.NmsSubKey.PNmsThumb
        end
        local r10_125 = -1
        local r11_125 = -1
        r10_125, r11_125 = GetNmsThumbnailNo(r8_125)
        if r11_125 ~= -1 then
          r5_125:initSubLayer(r0_125.MenuInf.SetName, r9_125, r11_125, 0)
          r5_125:insertPNARefLayer(r0_125.MenuInf.SetName, "NmsDragTh", r9_125, r11_125, 1)
        else
          r5_125:initSubLayer(r0_125.MenuInf.SetName, r9_125, r10_125, 0)
          r5_125:insertPNARefLayer(r0_125.MenuInf.SetName, "NmsDragTh", r9_125, r10_125, 1)
        end
        r5_125:setParam(r0_125.MenuInf.SetName, "NmsDragTh", LUA_PARAM_POS, r6_125, r7_125, 0, 0)
        r5_125:setParam(r0_125.MenuInf.SetName, "NmsDragTh", LUA_PARAM_COLOR, 1, 1, 1, 0.7)
      end
    end
    function r0_96.ThumbDragEnd(r0_126, r1_126, r2_126, r3_126)
      -- line: [5841, 5896] id: 126
      if r0_126.NmsMenu.StandbyDragFlag == true then
        r0_126.NmsMenu.StandbyDragFlag = false
      end
      local r4_126 = false
      local r5_126 = -1
      if r0_126.DD_Param.no ~= -1 then
        r0_126.MenuButton.onDropFlag = false
        local r6_126 = cclass.lua_Layers:create()
        if 400 <= r1_126 and r1_126 <= 410 then
          r5_126 = r1_126 - 400 + 1 + g_NmsData.Slide
          if r0_126:AddEntryList(r5_126, r0_126.DD_Param.no) == true then
            r4_126 = true
          end
        end
        if r1_126 == 500 then
          r5_126 = g_NmsData.Act
          if r5_126 == -1 then
            r5_126 = 0
          end
          r5_126 = r5_126 + 1
          if r0_126:AddEntryList(r5_126, r0_126.DD_Param.no) == true then
            r4_126 = true
          end
        end
        r6_126:removeLayer(r0_126.MenuInf.SetName, "NmsDragTh")
        if r0_126.DD_Param.move == true and r4_126 == true then
          local r7_126 = r0_126.DD_Param.list_pos
          if r5_126 <= r7_126 then
            r7_126 = r7_126 + 1
          end
          r0_126:DelEntryList(r7_126)
          r4_126 = true
        end
        r0_126.DD_Param.no = -1
      end
      return r4_126
    end
    function r0_96.ThumbDragOn(r0_127, r1_127, r2_127)
      -- line: [5899, 5908] id: 127
      if r0_127.DD_Param.no ~= -1 then
        local r3_127 = cclass.lua_Layers:create()
        local r4_127 = 0
        local r5_127 = 0
        r3_127:setParam(r0_127.MenuInf.SetName, "NmsDragTh", LUA_PARAM_POS, r1_127 + r0_127.DD_Param.DRAGST_X, r2_127 + r0_127.DD_Param.DRAGST_Y, 0, 0)
        r3_127:setVisible(r0_127.MenuInf.SetName, "NmsDragTh", 1)
      end
    end
    function r0_96.EntryTh(r0_128, r1_128)
      -- line: [5914, 6015] id: 128
      local r2_128 = cclass.lua_Layers:create()
      local r3_128 = -1
      if g_NmsData.Param >= 1 then
        r3_128 = g_NmsData.List[r1_128 + 1 + g_NmsData.Slide]
      end
      for r8_128 = 0, g_NmsData.MAX_THUMB - 1, 1 do
        local r9_128 = r0_128.NmsSubKey.NmsListTh
        local r10_128 = g_NmsData.MAX_THUMB
        if r10_128 <= r8_128 then
          r10_128 = r0_128.PatchFlag
          if r10_128 then
            r10_128 = r0_128.NmsSubKey
            r9_128 = r10_128.PNmsListTh
          end
        end
        if r3_128 == r8_128 then
          r10_128 = 1 or 0
        else
          goto label_51	-- block#11 is visited secondly
        end
        local r11_128 = -1
        local r12_128 = -1
        r11_128, r12_128 = GetNmsThumbnailNo(r8_128)
        if r9_128 ~= nil then
          if r12_128 ~= -1 then
            r2_128:initSubLayer(r0_128.MenuInf.SetName, r9_128, r12_128, 0)
            r2_128:setSubLayerVisible(r0_128.MenuInf.SetName, r9_128, r12_128, r10_128)
          elseif r11_128 ~= -1 then
            r2_128:initSubLayer(r0_128.MenuInf.SetName, r9_128, r11_128, 0)
            r2_128:setSubLayerVisible(r0_128.MenuInf.SetName, r9_128, r11_128, r10_128)
          end
        end
      end
      if g_NmsData.Act == -1 then
        r0_128.NmsMenu.NmsButton.EN_bmk:bt_SetActive(2)
      elseif r3_128 ~= -1 and g_NmsData.THP_BookMark[r3_128 + 1] == 1 then
        r0_128.NmsMenu.NmsButton.EN_bmk:bt_SetActive(4)
      else
        r0_128.NmsMenu.NmsButton.EN_bmk:bt_SetActive(0)
      end
      if g_NmsData.Param > 0 then
        r0_128.NmsMenu.NmsButton.EN_Save:bt_SetActive(0)
        r0_128.NmsMenu.NmsButton.EN_Reset:bt_SetActive(0)
        r0_128.NmsMenu.NmsButton.EN_PlayTT:bt_SetActive(0)
        r0_128.NmsMenu.NmsButton.EN_PlayTW:bt_SetActive(0)
      else
        r0_128.NmsMenu.NmsButton.EN_Save:bt_SetActive(2)
        r0_128.NmsMenu.NmsButton.EN_Reset:bt_SetActive(2)
        r0_128.NmsMenu.NmsButton.EN_PlayTT:bt_SetActive(2)
        r0_128.NmsMenu.NmsButton.EN_PlayTW:bt_SetActive(2)
      end
      local r5_128 = false
      for r9_128 = 1, g_NmsSLDataMax, 1 do
        if g_NmsSLData[r9_128] ~= nil and 0 < g_NmsSLData[r9_128].Param then
          r5_128 = true
          break
        end
      end
      if r5_128 == true then
        r0_128.NmsMenu.NmsButton.EN_Load:bt_SetActive(0)
      else
        r0_128.NmsMenu.NmsButton.EN_Load:bt_SetActive(2)
      end
      r0_128:InitTHBookMarkBt()
      -- warn: not visited block [3]
      -- block#3:
      -- r3_128 = _u0.g_NmsData.List[_u0.g_NmsData.Act]
      -- goto label_28
    end
    function r0_96.InitEntryList(r0_129)
      -- line: [6019, 6025] id: 129
      r0_129:SetEntryBarParam(g_NmsData.Slide, g_NmsData.Param)
      r0_129.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(g_NmsData.Slide)
      r0_129:EntryTh(-1)
    end
    function r0_96.AddEntryList(r0_130, r1_130, r2_130)
      -- line: [6028, 6063] id: 130
      if r0_130.NmsMenu.ENTRY_MAX <= g_NmsData.Param then
        return false
      end
      if r1_130 <= g_NmsData.Param and 1 <= g_NmsData.Param then
        for r6_130 = g_NmsData.Param + 1, r1_130, -1 do
          g_NmsData.List[r6_130] = g_NmsData.List[r6_130 - 1]
        end
      end
      g_NmsData.List[r1_130] = r2_130
      g_NmsData.Param = g_NmsData.Param + 1
      g_NmsData.Act = r1_130
      if g_NmsData.Param > 10 then
        if g_NmsData.Act < g_NmsData.Slide then
          g_NmsData.Slide = g_NmsData.Act - 1
        end
        if g_NmsData.Slide + 10 <= g_NmsData.Act then
          g_NmsData.Slide = g_NmsData.Act - 10
        end
      end
      r0_130.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PAR_MAX_Y = g_NmsData.Param
      r0_130.NmsMenu.NmsButton.SL_Bar2:bt_SetSlidebarPos()
      r0_130:SetEntryBarParam(g_NmsData.Slide, g_NmsData.Param)
      r0_130.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(g_NmsData.Slide)
      r0_130:EntryTh(-1)
      r0_130:InitTHBookMarkBt()
      return true
    end
    function r0_96.DelEntryList(r0_131, r1_131)
      -- line: [6066, 6102] id: 131
      g_NmsData.List[r1_131] = -1
      if g_NmsData.Param >= 2 then
        for r5_131 = r1_131, g_NmsData.Param - 1, 1 do
          g_NmsData.List[r5_131] = g_NmsData.List[r5_131 + 1]
        end
      end
      g_NmsData.Param = g_NmsData.Param - 1
      if r1_131 <= g_NmsData.Act then
        if g_NmsData.Act > 1 then
          g_NmsData.Act = g_NmsData.Act - 1
        else
          g_NmsData.Act = 1
        end
        if g_NmsData.Param == 0 then
          g_NmsData.Act = -1
        end
      end
      if g_NmsData.Param <= 10 then
        g_NmsData.Slide = 0
      end
      r0_131.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PAR_MAX_Y = g_NmsData.Param
      r0_131.NmsMenu.NmsButton.SL_Bar2:bt_SetSlidebarPos()
      r0_131:SetEntryBarParam(g_NmsData.Slide, g_NmsData.Param)
      r0_131.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(g_NmsData.Slide)
      r0_131:EntryTh(-1)
      r0_131:InitTHBookMarkBt()
    end
    function r0_96.InitThumb(r0_132)
      -- line: [6107, 6168] id: 132
      local r1_132 = cclass.lua_Layers:create()
      local r2_132 = 1
      g_NmsData.THP_List = {}
      g_NmsData.THP_ListEnable = {}
      g_NmsData.THP_EnableCount = 0
      for r6_132 = 1, g_NmsData.MAX_THUMB, 1 do
        g_NmsData.THP_List[r2_132] = r6_132 - 1
        if NmsMenuGetFlag(r6_132 - 1) then
          g_NmsData.THP_ListEnable[r2_132] = true
          g_NmsData.THP_EnableCount = g_NmsData.THP_EnableCount + 1
        else
          g_NmsData.THP_ListEnable[r2_132] = false
        end
        r2_132 = r2_132 + 1
      end
      g_NmsData.THP_Param = math.ceil((r2_132 - 1) / 3)
    end
    function r0_96.StartSetParam(r0_133)
      -- line: [6172, 6183] id: 133
      r0_133:InitThumb()
      cclass.lua_Layers:create():setParam(r0_133.MenuInf.SetName, r0_133.NmsSubKey.NmsThTitle, LUA_PARAM_POS, 546, 169, 0, 0)
    end
    function r0_96.DropRepeatLD(r0_134, r1_134, r2_134, r3_134, r4_134, r5_134, r6_134)
      -- line: [6192, 6257] id: 134
      if r6_134 == false then
        return 
      end
      if r0_134.DD_Param.no ~= -1 then
        local r7_134 = 0
        local r8_134 = -1
        if r0_134.MenuButton.selCursor ~= -1 then
          r7_134 = r0_134.MenuButton.selListKey[r0_134.MenuButton.selCursor].arg
        end
        if r0_134.NmsMenu.DropRepeatArg ~= r7_134 then
          r0_134.NmsMenu.DropRepeatArg = r7_134
          r0_134.NmsMenu.DropRepeatTime = 0
        end
        local r9_134 = false
        if r7_134 == "DropListUp" and 0 < g_NmsData.Slide then
          if r0_134.NmsMenu.DropRepeatTime < 10 then
            r0_134.NmsMenu.DropRepeatTime = r0_134.NmsMenu.DropRepeatTime + 1
          else
            local r10_134 = r0_134.NmsMenu.NmsButton.SL_Bar2
            local r11_134 = r10_134.MOVABLE.PAR_Y - 1
            r10_134:bt_SetParamY(r11_134)
            r0_134:SetEntryBarParam(r11_134, g_NmsData.Param)
          end
          r9_134 = true
        end
        if r7_134 == "DropListDown" then
          if r0_134.NmsMenu.DropRepeatTime < 10 then
            r0_134.NmsMenu.DropRepeatTime = r0_134.NmsMenu.DropRepeatTime + 1
          else
            local r10_134 = r0_134.NmsMenu.NmsButton.SL_Bar2
            local r11_134 = r10_134.MOVABLE.PAR_Y + 1
            r10_134:bt_SetParamY(r11_134)
            r0_134:SetEntryBarParam(r11_134, g_NmsData.Param)
          end
          r9_134 = true
        end
        if r9_134 == false then
          r0_134.NmsMenu.DropRepeatArg = 0
          r0_134.NmsMenu.DropRepeatTime = 0
        end
      else
        r0_134.NmsMenu.DropRepeatArg = 0
        r0_134.NmsMenu.DropRepeatTime = 0
      end
    end
    function r0_96.MakeYSlideBar(r0_135, r1_135, r2_135, r3_135, r4_135, r5_135, r6_135, r7_135, r8_135, r9_135)
      -- line: [6260, 6266] id: 135
      r1_135[r2_135] = r0_135.MenuButton:SlidebarY(r5_135, r6_135, r0_135.MenuButton:Movable(r0_135.MenuButton:ButtonCreate(r2_135, r3_135, r4_135, r5_135, -1, -1, -1, -1, r7_135, r8_135, g_SysSEName.ok, -1, r9_135)))
    end
    function r0_96.NmsChangeEffect(r0_136, r1_136, r2_136, r3_136)
      -- line: [6269, 6365] id: 136
      local r4_136 = cclass.lua_Layers:create()
      local r5_136 = getEffectRate()
      for r9_136, r10_136 in pairs(r0_136.NmsSubKey) do
        if r3_136 == false then
          r4_136:setParam(r0_136.MenuInf.SetName, r10_136, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r4_136:setEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r2_136 * r5_136, 0, 0)
          r11_136, r12_136, r13_136, r14_136 = r4_136:getParam(r0_136.MenuInf.SetName, r10_136, LUA_PARAM_POS, 0, 0, 0, 0)
          r4_136:startEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", 0)
        else
          r4_136:setParam(r0_136.MenuInf.SetName, r10_136, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r4_136:setEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r2_136 * r5_136, 0, 0)
          r4_136:startEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", 0)
        end
      end
      for r9_136 = 0, 9, 1 do
        local r10_136 = r0_136:nmsGetTitleTextName(r9_136)
        if r3_136 == false then
          r4_136:setParam(r0_136.MenuInf.SetName, r10_136, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r4_136:setEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r2_136 * r5_136, 0, 0)
          r11_136, r12_136, r13_136, r14_136 = r4_136:getParam(r0_136.MenuInf.SetName, r10_136, LUA_PARAM_POS, 0, 0, 0, 0)
          r4_136:startEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", 0)
        else
          r4_136:setParam(r0_136.MenuInf.SetName, r10_136, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r4_136:setEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r2_136 * r5_136, 0, 0)
          r4_136:startEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", 0)
        end
      end
      for r9_136 = 1, 3, 1 do
        local r10_136 = string.format("NmsNo%d", r9_136)
        if r3_136 == false then
          r4_136:setParam(r0_136.MenuInf.SetName, r10_136, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r4_136:setEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r2_136 * r5_136, 0, 0)
          r11_136, r12_136, r13_136, r14_136 = r4_136:getParam(r0_136.MenuInf.SetName, r10_136, LUA_PARAM_POS, 0, 0, 0, 0)
          r4_136:startEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", 0)
        else
          r4_136:setParam(r0_136.MenuInf.SetName, r10_136, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r4_136:setEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r2_136 * r5_136, 0, 0)
          r4_136:startEffect(r0_136.MenuInf.SetName, r10_136, "GalleryPageEff", 0)
        end
      end
      return r0_136.NmsMenu.keyname
    end
  end
  GetNmsList = function(r0_137, r1_137)
    -- line: [6379, 6405] id: 137
    local r2_137 = cfunc.LegacyGame__lua_GetVariable(98)
    cfunc.LegacyGame__lua_SetVariable(97, -1)
    if r2_137 <= g_NmsPlay.Param then
      cfunc.LegacyGame__lua_SetVariable(97, g_NmsPlay.List[r2_137])
      g_NmsPlay.Act = r2_137
    else
      cfunc.LegacyGame__lua_SetVariable(97, -1)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
    end
  end
  NmsMenuGetFlag = function(r0_138)
    -- line: [6440, 6452] id: 138
    local r2_138 = cfunc.LegacyGame__lua_GetFlag(1150 + r0_138)
    return true
  end
  NmsMenuSetBookMarkAll = function(r0_139)
    -- line: [6458, 6498] id: 139
    g_NmsData.THP_BookMark = {}
    local r1_139 = 1
    for r5_139 = 1, g_NmsData.MAX_THUMB, 1 do
      if NmsMenuGetFlag(r5_139 - 1) then
        g_NmsData.THP_BookMark[r5_139] = r0_139
      else
        g_NmsData.THP_BookMark[r5_139] = 0
      end
      r1_139 = r1_139 + 1
    end
  end
  NmsMenuLoadBookMark = function()
    -- line: [6500, 6519] id: 140
    local r1_140 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmsBookMark.dat", "r")
    if r1_140 ~= nil then
      for r6_140 = 1, g_NmsData.MAX_THUMB, 1 do
        g_NmsData.THP_BookMark[r6_140] = r1_140:read("*n")
        if g_NmsData.THP_BookMark[r6_140] == nil then
          g_NmsData.THP_BookMark[r6_140] = 0
        end
      end
      r1_140:close()
    else
      NmsMenuSetBookMarkAll(0)
    end
  end
  g_nmsBookMarkFlag = false
  NmsMenuSaveBookMark = function()
    -- line: [6522, 6547] id: 141
    if g_nmsBookMarkFlag then
      local r1_141 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmsBookMark.dat", "w")
      if r1_141 ~= nil then
        for r6_141 = 1, g_NmsData.MAX_THUMB, 1 do
          if g_NmsData.THP_BookMark[r6_141] == nil then
            g_NmsData.THP_BookMark[r6_141] = 0
          end
          if r6_141 <= #g_NmsData.THP_BookMark then
            r1_141:write(g_NmsData.THP_BookMark[r6_141] .. "\n")
          else
            r1_141:write(0 .. "\n")
            g_NmsData.THP_BookMark[r6_141] = 0
          end
        end
        r1_141:close()
      end
    end
  end
  NmsMenuInitENP = function()
    -- line: [6551, 6557] id: 142
    g_NmsData.Slide = 0
    g_NmsData.List = {}
    g_NmsData.Act = -1
    g_NmsData.Param = 0
  end
  openNmsSaveLoad = function(r0_143, r1_143)
    -- line: [6568, 7085] id: 143
    g_Menu.NmsSaveLoad.ptr = Menu.new("NmsSLMenu")
    g_Menu.NmsSaveLoad.ptr.SaveLoadFlag = r1_143
    g_Menu.NmsSaveLoad.ptr.ExpTextNo = -1
    g_Menu.NmsSaveLoad.ptr.defaultMenuMouseMove = g_Menu.NmsSaveLoad.ptr.MenuMouseMove
    g_Menu.NmsSaveLoad.ptr.MenuMouseMove = function(r0_144, r1_144, r2_144, r3_144, r4_144, r5_144, r6_144)
      -- line: [6583, 6593] id: 144
      r0_144:defaultMenuMouseMove(r1_144, r2_144, r3_144, r4_144, r5_144, r6_144)
      local r7_144 = 0
      local r8_144 = -1
      if r0_144.MenuButton.selCursor ~= -1 then
        r7_144 = r0_144.MenuButton.selListKey[r0_144.MenuButton.selCursor].arg
      end
    end
    g_Menu.NmsSaveLoad.ptr.MenuEffectEndJob = function(r0_145)
      -- line: [6596, 6623] id: 145
      local r1_145 = cclass.lua_Layers:create()
      if r0_145.MenuInf.enabled == true then
        local r2_145 = 0
        local r3_145 = 0
        local r4_145 = cclass.lua_AutoCursor:new()
        r2_145, r3_145 = r4_145:GetCursorPos(r2_145, r3_145)
        r4_145:delete()
        r0_145.MenuButton:changeButton(r0_145.MenuInf.SetName, r1_145:getCursorPos(r0_145.MenuInf.SetName, r2_145, r3_145, 0) - 1, r2_145, r3_145)
      else
        r1_145:remove(r0_145.MenuInf.SetName)
        r0_145.MenuInf.ButtonLayer = ""
        r0_145.MenuInf.ButtonPna = ""
      end
    end
    g_Menu.NmsSaveLoad.ptr.MenuButtonJobPos = function(r0_146, r1_146, r2_146, r3_146, r4_146)
      -- line: [6626, 6671] id: 146
      if nil and not nil then
        goto label_2	-- block#1 is visited secondly
      end
      if r2_146 == "LU" then
      end
      if r2_146 == "LU" and r1_146 ~= 0 then
        if r1_146 == 999 then
          r0_146:endMenu()
        end
        if 1 <= r1_146 and r1_146 <= g_NmsSLDataMax then
          if r0_146.SaveLoadFlag == 0 then
            g_Menu.NmsSaveLoad.ptrSaveNo = r1_146
            if g_NmsSLData[g_Menu.NmsSaveLoad.ptrSaveNo].Param == 0 then
              NmsSLMenuSave()
            else
              openConfirm(LUA_CONFIRM_NMSSAVE)
            end
          else
            NmsSLMenuLoadData(r1_146)
            if r0_146.DataActNo ~= -1 then
              r0_146.ButtonSlide.SlideBar.MOVABLE.PAR_MAX_Y = r0_146.DispSave.Param
              r0_146.ButtonSlide.SlideBar:bt_SetSlidebarPos()
            end
            r0_146:endMenu()
          end
          r0_146:SetActive()
        end
      end
      if r2_146 == "RU" and r1_146 == 0 then
        r0_146:SystemSePlay(g_SysSEName.cancel)
        r0_146:endMenu()
      end
    end
    g_Menu.NmsSaveLoad.ptr.MenuMouseWheel = function(r0_147, r1_147, r2_147, r3_147)
      -- line: [6675, 6680] id: 147
      local r4_147 = cclass.lua_Layers:create()
    end
    g_Menu.NmsSaveLoad.ptr.NmsSLMenuSaveData = function(r0_148, r1_148)
      -- line: [6687, 6722] id: 148
      g_NmsSLData[r1_148] = {}
      g_NmsSLData[r1_148].Act = g_Menu.NmsSaveLoad.ptr.DispSave.Act
      g_NmsSLData[r1_148].List = {
        unpack(g_NmsData.List)
      }
      g_NmsSLData[r1_148].Param = g_NmsData.Param
      g_NmsSLData[r1_148].Slide = g_Menu.NmsSaveLoad.ptr.DispSave.Slide
      g_NmsSLData[r1_148].ts = os.date("%Y-%m-%d %H:%M:%S")
      local r4_148 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. string.format("nmssave%d.dat", r1_148), "w")
      if r4_148 ~= nil then
        r4_148:write(g_NmsSLData[r1_148].ts .. "\n")
        r4_148:write(g_NmsSLData[r1_148].Param .. "\n")
        r4_148:write(g_NmsSLData[r1_148].Act .. "\n")
        r4_148:write(g_NmsSLData[r1_148].Slide .. "\n")
        for r8_148 = 1, g_NmsSLData[r1_148].Param, 1 do
          r4_148:write(g_NmsSLData[r1_148].List[r8_148] .. "\n")
        end
        r4_148:close()
      end
    end
    g_Menu.NmsSaveLoad.ptr.startMenu = function(r0_149)
      -- line: [6725, 6734] id: 149
      cclass.lua_Layers:create():copySnap("NmsSLMenu", "system")
      r0_149:MenuEffectStart(500, 0)
      r0_149.MenuInf.enabled = true
      r0_149.MenuInf.effect = true
    end
    g_Menu.NmsSaveLoad.ptr.endMenu = function(r0_150)
      -- line: [6736, 6740] id: 150
      r0_150:MenuEffectToMenu(500)
      r0_150.MenuInf.enabled = false
      r0_150.MenuInf.effect = true
    end
    g_Menu.NmsSaveLoad.ptr.GetDataPos = function(r0_151, r1_151)
      -- line: [6743, 6748] id: 151
      return 197 + 224 * (r1_151 - 1) % 4, 175 + 210 * math.floor((r1_151 - 1) / 4)
    end
    g_Menu.NmsSaveLoad.ptr.MakeDataTh = function(r0_152, r1_152)
      -- line: [6751, 6837] id: 152
      local r2_152 = 0
      local r3_152 = 0
      r2_152, r3_152 = r0_152:GetDataPos(r1_152)
      local r4_152 = string.format("NmsSLThumb%d", r1_152)
      local r5_152 = cclass.lua_Layers:create()
      local r6_152 = 0
      local r7_152 = 0
      local r8_152 = 0
      local r9_152 = 0
      r5_152:removeLayer("NmsSLMenu", r4_152)
      if 0 < g_NmsSLData[r1_152].Param and 0 < g_NmsSLData[r1_152].Act then
        r6_152 = 12 + r2_152
        r7_152 = 12 + r3_152
        local r10_152 = g_NmsSLData[r1_152].List[g_NmsSLData[r1_152].Act]
        local r11_152 = "NmsSLThumb"
        if g_NmsData.MAX_THUMB <= r10_152 then
        end
        local r12_152 = -1
        local r13_152 = -1
        r12_152, r13_152 = GetNmsThumbnailNo(r10_152)
        if r13_152 ~= -1 then
          r5_152:initSubLayer("NmsSLMenu", r11_152, r13_152, 0)
          r5_152:insertPNARefLayer("NmsSLMenu", r4_152, r11_152, r13_152, 1)
        elseif r12_152 ~= -1 then
          r5_152:initSubLayer("NmsSLMenu", r11_152, r12_152, 0)
          r5_152:insertPNARefLayer("NmsSLMenu", r4_152, r11_152, r12_152, 1)
        end
        r5_152:setParam("NmsSLMenu", r4_152, LUA_PARAM_POS, r6_152, r7_152, 0, 0)
      end
      local r10_152 = {
        [1] = g_NmsSLData[r1_152].Param % 10,
        [2] = math.floor(g_NmsSLData[r1_152].Param / 10) % 10,
        [3] = math.floor(g_NmsSLData[r1_152].Param / 100),
      }
      local r11_152 = g_NmsSLData[r1_152].Param
      if r11_152 > 0 then
        r11_152 = 1 or 0.2
      else
        goto label_128	-- block#10 is visited secondly
      end
      for r15_152 = 1, 3, 1 do
        local r16_152 = string.format("NmsData%dNo%d", r1_152, r15_152)
        r5_152:removeLayer("NmsSLMenu", r16_152)
        r5_152:insertPNARefLayer("NmsSLMenu", r16_152, "NmsSLNo", r10_152[r15_152], 1)
        r5_152:setParam("NmsSLMenu", r16_152, LUA_PARAM_POS, 93 - (r15_152 - 1) * 21 + r2_152, 165 + r3_152, 0, 0)
        r5_152:setParam("NmsSLMenu", r16_152, LUA_PARAM_COLOR, 1, 1, 1, r11_152)
      end
      r4_152 = string.format("NmsSLTime%d", r1_152)
      r5_152:clearText("NmsSLMenu", r4_152)
      if g_NmsSLData[r1_152].Param > 0 then
        r5_152:setText("NmsSLMenu", r4_152, g_NmsSLData[r1_152].ts, g_NmsFonts.name, 14, 0, 0, 4294967295, 255)
        r5_152:setParam("NmsSLMenu", r4_152, LUA_PARAM_POS, 5 + r2_152, 125 + r3_152, 0, 0)
      end
    end
    g_Menu.NmsSaveLoad.ptr.DataActNo = -1
    g_Menu.NmsSaveLoad.ptr.InitNmsSL = function(r0_153)
      -- line: [6841, 6998] id: 153
      local r1_153 = cclass.lua_Layers:create()
      local r2_153 = "sys_nms_save.pna"
      if r0_153.SaveLoadFlag == 1 then
        r2_153 = "sys_nms_load.pna"
      end
      local r3_153 = r0_153:MenuInit("NmsSLBace00", r2_153)
      if res == false then
        return false
      end
      r0_153:MenuLoadLayer("NmsSLNo", "sys_nms_no.pna")
      r0_153:MenuLoadLayer("NmsSLThumb", "sys_nms_th.pna")
      for r7_153 = 0, 9, 1 do
        r1_153:initSubLayer("NmsSLMenu", "NmsSLNo", r7_153, 0)
      end
      r1_153:initSubLayer("NmsSLMenu", "NmsSLBace00", 0, 1)
      r1_153:initSubLayer("NmsSLMenu", "NmsSLBace00", 271, 1)
      r1_153:initSubLayer("NmsSLMenu", "NmsSLBace00", 272, 1)
      for r7_153 = 1, g_NmsSLDataMax, 1 do
        r1_153:insertTextLayer("NmsSLMenu", string.format("NmsSLTime%d", r7_153), 220, 30, 16, 0, 0, 0, 0, 1)
        local r9_153 = 0
        local r10_153 = 0
        local r11_153 = 0
        local r12_153 = 0
        local r13_153 = string.format("SaveLoad%d", r7_153)
        local r14_153 = r7_153
        local r15_153 = -1
        local r16_153 = -1
        local r17_153 = -1
        if r0_153.SaveLoadFlag == 0 then
          r15_153 = 19 + (r7_153 - 1) * 5
          r16_153 = 61 + (r7_153 - 1) * 5
        else
          r15_153 = 19 + (r7_153 - 1) * 5
          r16_153 = 61 + (r7_153 - 1) * 5
          r17_153 = 103 + (r7_153 - 1) * 5
        end
        r0_153:MenuButtonSet(r0_153.MenuButtonData, r13_153, 1, "NmsSLBace00", r15_153, r15_153, r16_153, -1, r17_153, r14_153, 0, 1)
        r13_153 = "Data" .. tostring(r7_153)
        r13_153 = string.format("Data%d", r7_153)
        if r0_153.SaveLoadFlag == 0 then
          r1_153:initSubLayer("NmsSLMenu", "NmsSLBace00", 148 + (r7_153 - 1) * 5, 1)
          r1_153:initSubLayer("NmsSLMenu", "NmsSLBace00", 146 + (r7_153 - 1) * 5, 1)
        else
          r15_153 = 148 + (r7_153 - 1) * 5
          r17_153 = 232 + (r7_153 - 1) * 5
          r1_153:initSubLayer("NmsSLMenu", "NmsSLBace00", r15_153, 0)
          r1_153:initSubLayer("NmsSLMenu", "NmsSLBace00", r17_153, 0)
          if g_NmsSLData[r7_153].Param > 0 then
            r1_153:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r15_153, 1)
            r1_153:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_153, 0)
          else
            r1_153:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r15_153, 0)
            r1_153:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_153, 1)
          end
          r15_153 = 146 + (r7_153 - 1) * 5
          r17_153 = 230 + (r7_153 - 1) * 5
          r1_153:initSubLayer("NmsSLMenu", "NmsSLBace00", r15_153, 0)
          r1_153:initSubLayer("NmsSLMenu", "NmsSLBace00", r17_153, 0)
          if g_NmsSLData[r7_153].Param > 0 then
            r1_153:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r15_153, 1)
            r1_153:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_153, 0)
          else
            r1_153:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r15_153, 0)
            r1_153:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_153, 1)
          end
        end
        r0_153:MakeDataTh(r7_153)
      end
      r0_153:MenuButtonSet(r0_153.MenuButtonData, "RETURN", 0, "NmsSLBace00", 2, 2, 3, -1, -1, 999, 0, 0)
      r0_153.MenuButton:SetList("MenuButtonData", r0_153.MenuButtonData)
      r0_153:MenuButtonInit()
      if r0_153.SaveLoadFlag == 0 then
        r0_153.DispSave.Act = g_NmsData.Act
        r0_153.DispSave.List = {
          unpack(g_NmsData.List)
        }
        r0_153.DispSave.Param = g_NmsData.Param
        r0_153.DispSave.Slide = g_NmsData.Slide
      elseif 1 <= r0_153.DataActNo and r0_153.DataActNo <= 6 then
        r0_153.DispSave.Act = g_NmsSLData[r0_153.DataActNo].Act
        r0_153.DispSave.List = {
          unpack(g_NmsSLData[r0_153.DataActNo].List)
        }
        r0_153.DispSave.Param = g_NmsSLData[r0_153.DataActNo].Param
        r0_153.DispSave.Slide = g_NmsSLData[r0_153.DataActNo].Slide
      else
        r0_153.DispSave.Act = -1
        r0_153.DispSave.List = -1
        r0_153.DispSave.Param = 0
        r0_153.DispSave.Slide = 0
      end
      r0_153:SetActive()
      return true
    end
    g_Menu.NmsSaveLoad.ptr.SetActive = function(r0_154)
      -- line: [7003, 7048] id: 154
      for r4_154 = 1, g_NmsSLDataMax, 1 do
        local r5_154 = string.format("SaveLoad%d", r4_154)
        if r0_154.SaveLoadFlag == 0 then
          r0_154.MenuButtonData[r5_154]:bt_SetActive(0)
        else
          if g_NmsSLData[r4_154].Param > 0 then
            r0_154.MenuButtonData[r5_154]:bt_SetActive(0)
          else
            r0_154.MenuButtonData[r5_154]:bt_SetActive(2)
          end
          local r6_154 = cclass.lua_Layers:create()
          local r7_154 = 19 + (r4_154 - 1) * 5
          local r8_154 = 103 + (r4_154 - 1) * 5
          if g_NmsSLData[r4_154].Param > 0 then
            r6_154:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_154, 1)
            r6_154:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_154, 0)
          else
            r6_154:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_154, 0)
            r6_154:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_154, 1)
          end
          r7_154 = 17 + (r4_154 - 1) * 5
          r8_154 = 101 + (r4_154 - 1) * 5
          if g_NmsSLData[r4_154].Param > 0 then
            r6_154:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_154, 1)
            r6_154:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_154, 0)
          else
            r6_154:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_154, 0)
            r6_154:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_154, 1)
          end
        end
      end
    end
    g_Menu.NmsSaveLoad.ptr.DispSave = {}
    g_Menu.NmsSaveLoad.ptr.DispSave.Act = -1
    g_Menu.NmsSaveLoad.ptr.DispSave.List = -1
    g_Menu.NmsSaveLoad.ptr.DispSave.Param = 0
    g_Menu.NmsSaveLoad.ptr.DispSave.Slide = 0
    g_Menu.NmsSaveLoad.ptr.PatchFlag1 = false
    g_Menu.NmsSaveLoad.ptr.PatchFlag2 = false
    local r2_143 = g_Menu.NmsSaveLoad.ptr:InitNmsSL()
    if res == false then
      return false
    end
    g_Menu.NmsSaveLoad.ptr:startMenu()
    return true
  end
  g_Menu.NmsSaveLoad.ptrSaveNo = -1
  NmsSLMenuSave = function()
    -- line: [7088, 7093] id: 155
    if g_Menu.NmsSaveLoad.ptr ~= nil and 1 <= g_Menu.NmsSaveLoad.ptrSaveNo and g_Menu.NmsSaveLoad.ptrSaveNo <= g_NmsSLDataMax then
      g_Menu.NmsSaveLoad.ptr:NmsSLMenuSaveData(g_Menu.NmsSaveLoad.ptrSaveNo)
      g_Menu.NmsSaveLoad.ptr:MakeDataTh(g_Menu.NmsSaveLoad.ptrSaveNo)
    end
  end
  NmsSLMenuInitSaveData = function()
    -- line: [7095, 7131] id: 156
    if g_NmsData.OneInit == true then
      return 
    end
    for r3_156 = 1, g_NmsSLDataMax, 1 do
      g_NmsSLData[r3_156] = {}
      g_NmsSLData[r3_156].Act = -1
      g_NmsSLData[r3_156].List = {}
      g_NmsSLData[r3_156].Param = 0
      g_NmsSLData[r3_156].ts = ""
      local r6_156 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. string.format("nmssave%d.dat", r3_156), "r")
      if r6_156 ~= nil then
        g_NmsSLData[r3_156].ts = r6_156:read("*l")
        g_NmsSLData[r3_156].Param = r6_156:read("*n")
        g_NmsSLData[r3_156].Act = r6_156:read("*n")
        g_NmsSLData[r3_156].Slide = r6_156:read("*n")
        for r10_156 = 1, g_NmsSLData[r3_156].Param, 1 do
          g_NmsSLData[r3_156].List[r10_156] = r6_156:read("*n")
        end
        r6_156:close()
      end
    end
  end
  NmsSLMenuLoadData = function(r0_157)
    -- line: [7135, 7140] id: 157
    g_NmsData.Act = g_NmsSLData[r0_157].Act
    g_NmsData.List = {
      unpack(g_NmsSLData[r0_157].List)
    }
    g_NmsData.Param = g_NmsSLData[r0_157].Param
    g_NmsData.Slide = g_NmsSLData[r0_157].Slide
  end
end
g_CgBrowserList = {
  Count = 0,
  Layer = {},
}
InitPnaCgBrowser = function(r0_158, r1_158)
  -- line: [7193, 7203] id: 158
  if r1_158 == -1 then
    g_CgBrowserList.Count = 0
    g_CgBrowserList.Layer = {}
  else
    g_CgBrowserList.Count = g_CgBrowserList.Count + 1
    g_CgBrowserList.Layer[string.format("Cg%d", g_CgBrowserList.Count)] = r1_158
  end
end
openCgBrowser = function(r0_159, r1_159)
  -- line: [7208, 7910] id: 159
  g_Menu.CgBrowser.ptr = Menu.new("CgBrowser")
  g_Menu.CgBrowser.ptr.UseButton = true
  g_Menu.CgBrowser.ptr.MenuEffect = function(r0_160)
    -- line: [7221, 7238] id: 160
    local r1_160 = false
    r1_160 = r0_160:MenuEffectTransJob()
    if r0_160.MenuInf.effect == true and r1_160 == false then
      r0_160:MenuEffectEndJob()
      r0_160.MenuInf.effect = false
    end
    if false and r0_160.MenuInf.enabled == true and r0_160.MenuInf.effect == false then
      r0_160:MovePictCheck()
    end
    return r1_160
  end
  g_Menu.CgBrowser.ptr.MenuInit = function(r0_161)
    -- line: [7242, 7254] id: 161
    local r1_161 = true
    r0_161.MenuInf.enabled = true
    r0_161.MenuInf.effect = true
    if cclass.lua_Layers:create():add(r0_161.MenuInf.SetName) == false then
      return false
    end
    return r1_161
  end
  g_Menu.CgBrowser.ptr.LoadSystemMenu = function(r0_162, r1_162, r2_162)
    -- line: [7257, 7267] id: 162
    r0_162.MenuInf.ButtonLayer = r1_162
    r0_162.MenuInf.ButtonPna = r2_162
    r0_162:MenuLoadLayer(r1_162, r2_162)
    r0_162.MenuButton = Button.new(r0_162.MenuInf.SetName)
    r0_162.MenuButton:InitList()
    r0_162.MenuButtonData = {}
  end
  g_Menu.CgBrowser.ptr.MenuEffectEndJob = function(r0_163)
    -- line: [7270, 7283] id: 163
    local r1_163 = cclass.lua_Layers:create()
    if r0_163.MenuInf.enabled ~= true then
      r1_163:remove(r0_163.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_163.MenuInf.ButtonLayer = ""
      r0_163.MenuInf.ButtonPna = ""
    end
  end
  g_Menu.CgBrowser.ptr.MenuEffectStart = function(r0_164, r1_164)
    -- line: [7286, 7294] id: 164
    cclass.lua_Layers:create():startTransition(r0_164.MenuInf.SetName, 0, 1, r1_164 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_164.MenuInf.enabled = true
    r0_164.MenuInf.effect = true
  end
  g_Menu.CgBrowser.ptr.GetMenuMouseEnable = function(r0_165)
    -- line: [7297, 7307] id: 165
    local r1_165 = false
    if r0_165.MenuInf.enabled == true and r0_165.MenuInf.effect == false then
      r1_165 = true
    end
    return r1_165
  end
  g_Menu.CgBrowser.ptr.MenuMouseMove = function(r0_166, r1_166, r2_166, r3_166, r4_166, r5_166, r6_166)
    -- line: [7313, 7331] id: 166
    if r6_166 == true then
      return 
    end
    if r0_166:GetMenuMouseEnable() then
      r0_166:DragMoveCg(r4_166, r5_166)
      r0_166:Cursor()
      r0_166.MenuButton:mouseMove(r2_166, r3_166, r4_166, r5_166)
    elseif r0_166.DragMoveFlag then
      r0_166.DragMoveFlag = false
      r0_166:Cursor()
    end
  end
  g_Menu.CgBrowser.ptr.MenuLButtonDown = function(r0_167, r1_167, r2_167, r3_167, r4_167, r5_167, r6_167)
    -- line: [7333, 7350] id: 167
    local r7_167 = 0
    if r6_167 == true then
      return r7_167
    end
    if r0_167.DragMoveFlag then
      r0_167.DragMoveFlag = false
      r0_167:Cursor()
    elseif r0_167:GetMenuMouseEnable() then
      r7_167 = r0_167.MenuButton:mouseLdown(r2_167, r3_167, r4_167, r5_167, r6_167)
    end
    return r7_167
  end
  g_Menu.CgBrowser.ptr.MenuLButtonUp = function(r0_168, r1_168, r2_168, r3_168, r4_168, r5_168, r6_168)
    -- line: [7352, 7406] id: 168
    -- notice: unreachable block#18
    local r7_168 = 0
    if r6_168 == true then
      return r7_168
    end
    if r0_168.DragMoveFlag then
      r0_168.DragMoveFlag = false
      r0_168:Cursor()
    else
      r7_168 = r0_168.MenuButton:mouseLup(r2_168, r3_168, r4_168, r5_168, r6_168)
      if r7_168 == 99 then
        if r0_168.CloseButton then
          r0_168.CloseButton = false
          r0_168:ActiveBrowserButton()
        else
          cfunc.LegacyGame__lua_SetVariable(99, 0)
          r0_168:closeBrowser()
        end
      end
      local r8_168 = r0_168.LoadCgInf.EventCG.posx
      local r9_168 = r0_168.LoadCgInf.EventCG.posy
      if r7_168 == 1 then
        r9_168 = r9_168 - 100
        r0_168:MoveCgPos(r8_168, r9_168)
        r0_168:ActiveBrowserButton()
      end
      if r7_168 == 2 then
        r9_168 = r9_168 + 100
        r0_168:MoveCgPos(r8_168, r9_168)
        r0_168:ActiveBrowserButton()
      end
      if r7_168 == 3 then
        r8_168 = r8_168 - 100
        r0_168:MoveCgPos(r8_168, r9_168)
        r0_168:ActiveBrowserButton()
      end
      if r7_168 == 4 then
        r0_168:MoveCgPos(r8_168 + 100, r9_168)
        r0_168:ActiveBrowserButton()
      end
      if r7_168 == 5 then
        r0_168.CloseButton = true
        r0_168:ActiveBrowserButton()
      end
    end
    return r7_168
  end
  g_Menu.CgBrowser.ptr.MenuRButtonDown = function(r0_169, r1_169, r2_169, r3_169, r4_169, r5_169, r6_169)
    -- line: [7408, 7424] id: 169
    local r7_169 = 0
    if r6_169 == true then
      return r7_169
    end
    if r0_169:GetMenuMouseEnable() then
      r7_169 = r0_169.MenuButton:mouseRdown(r2_169, r3_169, r4_169, r5_169, r6_169)
    elseif r0_169.DragMoveFlag then
      r0_169.DragMoveFlag = false
      r0_169:Cursor()
    end
    return r7_169
  end
  g_Menu.CgBrowser.ptr.MenuRButtonUp = function(r0_170, r1_170, r2_170, r3_170, r4_170, r5_170, r6_170)
    -- line: [7426, 7450] id: 170
    local r7_170 = 0
    if r6_170 == true then
      return r7_170
    end
    if r0_170:GetMenuMouseEnable() then
      r7_170 = r0_170.MenuButton:mouseRup(r2_170, r3_170, r4_170, r5_170, r6_170)
      if r0_170.CloseButton then
        r0_170.CloseButton = false
      else
        cfunc.LegacyGame__lua_SetVariable(99, -1)
        r0_170:closeBrowser()
      end
    elseif r0_170.DragMoveFlag then
      r0_170.DragMoveFlag = false
      r0_170:Cursor()
    end
    return r7_170
  end
  g_Menu.CgBrowser.ptr.MenuMButtonDown = function(r0_171, r1_171, r2_171, r3_171, r4_171, r5_171, r6_171)
    -- line: [7452, 7466] id: 171
    local r7_171 = 0
    if r6_171 == true then
      return r7_171
    end
    if r0_171:GetMenuMouseEnable() then
      r0_171:DragStart(r4_171, r5_171)
    elseif r0_171.DragMoveFlag then
      r0_171.DragMoveFlag = false
      r0_171:Cursor()
    end
    return r7_171
  end
  g_Menu.CgBrowser.ptr.MenuMButtonUp = function(r0_172, r1_172, r2_172, r3_172, r4_172, r5_172, r6_172)
    -- line: [7468, 7480] id: 172
    if r0_172:GetMenuMouseEnable() and r0_172.DragMoveFlag then
      r0_172.DragMoveFlag = false
      r0_172:Cursor()
    elseif r0_172.DragMoveFlag then
      r0_172.DragMoveFlag = false
      r0_172:Cursor()
    end
  end
  g_Menu.CgBrowser.ptr.MenuMouseWheel = function(r0_173, r1_173, r2_173)
    -- line: [7482, 7506] id: 173
    if false then
      if r0_173:GetMenuMouseEnable() and r2_173 ~= 0 then
        r0_173:ScaleCg(r0_173.LoadCgInf.EventCG.Scale + r2_173 * 0.05)
      elseif r0_173.DragMoveFlag then
        r0_173.DragMoveFlag = false
        r0_173:Cursor()
      end
    elseif r0_173:GetMenuMouseEnable() then
      r0_173:MoveCgPos(r0_173.LoadCgInf.EventCG.posx, r0_173.LoadCgInf.EventCG.posy + r2_173 * 10)
      r0_173:ActiveBrowserButton()
    end
  end
  g_Menu.CgBrowser.ptr.MoveCgPos = function(r0_174, r1_174, r2_174)
    -- line: [7511, 7519] id: 174
    local r3_174 = cclass.lua_Layers:create()
    r1_174, r2_174 = r0_174:PosCalc(r1_174, r2_174)
    r0_174.LoadCgInf.EventCG.posx = r1_174
    r0_174.LoadCgInf.EventCG.posy = r2_174
    r3_174:setParam(r0_174.MenuInf.SetName, "EventCG", LUA_PARAM_POS, r1_174, r2_174, 0, 0)
    r0_174:Cursor()
  end
  g_Menu.CgBrowser.ptr.ScaleCg = function(r0_175, r1_175)
    -- line: [7521, 7536] id: 175
    local r2_175 = cclass.lua_Layers:create()
    if r1_175 < r0_175.LoadCgInf.EventCG.MinScale then
      r1_175 = r0_175.LoadCgInf.EventCG.MinScale
    end
    if r1_175 > 1 then
      r1_175 = 1
    end
    r2_175:setParam(r0_175.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, r1_175, r1_175, 0, 0)
    r0_175.LoadCgInf.EventCG.Scale = r1_175
    r0_175:MoveCgPos(r0_175.LoadCgInf.EventCG.posx, r0_175.LoadCgInf.EventCG.posy)
    r0_175:Cursor()
  end
  g_Menu.CgBrowser.ptr.DragMoveFlag = false
  g_Menu.CgBrowser.ptr.CloseButton = false
  g_Menu.CgBrowser.ptr.DragMovePosx = 0
  g_Menu.CgBrowser.ptr.DragMovePosy = 0
  g_Menu.CgBrowser.ptr.DragMoveCg = function(r0_176, r1_176, r2_176)
    -- line: [7543, 7563] id: 176
    if r0_176.DragMoveFlag then
      if 0 <= r1_176 and 0 <= r2_176 and r1_176 < APP_INTERNAL_WIDTH and r2_176 < APP_INTERNAL_HEIGHT then
        r0_176.DragMovePosx = r1_176
        r0_176.DragMovePosy = r2_176
        r0_176:MoveCgPos(r1_176 - r0_176.DragMovePosx + r0_176.LoadCgInf.EventCG.posx, r2_176 - r0_176.DragMovePosy + r0_176.LoadCgInf.EventCG.posy)
      end
      r0_176:ActiveBrowserButton()
    end
  end
  g_Menu.CgBrowser.ptr.MovePictCheck = function(r0_177)
    -- line: [7566, 7604] id: 177
    if r0_177.DragMoveFlag == false and r0_177.LoadCgInf.EventCG.Movable then
      local r1_177 = 0
      local r2_177 = 0
      local r3_177 = cclass.lua_AutoCursor:new()
      r1_177, r2_177 = r3_177:GetCursorPos(r1_177, r2_177)
      r3_177:delete()
      if 0 <= r1_177 and r1_177 <= 100 then
        r0_177:MoveCgPos(r0_177.LoadCgInf.EventCG.posx + 100 - r1_177, r0_177.LoadCgInf.EventCG.posy)
      end
      if r1_177 < APP_INTERNAL_WIDTH and APP_INTERNAL_WIDTH - 100 <= r1_177 then
        r0_177:MoveCgPos(r0_177.LoadCgInf.EventCG.posx - r1_177 - APP_INTERNAL_WIDTH - 100, r0_177.LoadCgInf.EventCG.posy)
      end
      if 0 <= r2_177 and r2_177 <= 100 then
        r0_177:MoveCgPos(r0_177.LoadCgInf.EventCG.posx, r0_177.LoadCgInf.EventCG.posy + 100 - r2_177)
      end
      if r2_177 < APP_INTERNAL_HEIGHT and APP_INTERNAL_HEIGHT - 100 <= r2_177 then
        r0_177:MoveCgPos(r0_177.LoadCgInf.EventCG.posx, r0_177.LoadCgInf.EventCG.posy - r2_177 - APP_INTERNAL_HEIGHT - 100)
      end
    end
  end
  g_Menu.CgBrowser.ptr.DragStart = function(r0_178, r1_178, r2_178)
    -- line: [7607, 7611] id: 178
    r0_178.DragMoveFlag = true
    r0_178.DragMovePosx = r1_178
    r0_178.DragMovePosy = r2_178
  end
  g_Menu.CgBrowser.ptr.PosCalc = function(r0_179, r1_179, r2_179)
    -- line: [7613, 7647] id: 179
    local r3_179 = 0
    local r4_179 = 0
    local r5_179 = 0
    local r6_179 = nil
    local r7_179 = 0
    local r8_179 = 0
    r5_179, r6_179, r7_179, r8_179 = cclass.lua_Layers:create():getParam(r0_179.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, 0, 0, 0, 0)
    r3_179 = (r0_179.LoadCgInf.EventCG.size_w * r5_179 - r0_179.LoadCgInf.EventCG.size_w) / 2
    r4_179 = (r0_179.LoadCgInf.EventCG.size_h * r6_179 - r0_179.LoadCgInf.EventCG.size_h) / 2
    local r10_179 = 0 - r0_179.LoadCgInf.EventCG.size_w - APP_INTERNAL_WIDTH - r3_179
    local r11_179 = 0 - r0_179.LoadCgInf.EventCG.size_h - APP_INTERNAL_HEIGHT - r4_179
    if r0_179.LoadCgInf.EventCG.size_w * r5_179 < APP_INTERNAL_WIDTH then
      r1_179 = (APP_INTERNAL_WIDTH - r0_179.LoadCgInf.EventCG.size_w) / 2
    else
      if r1_179 < r10_179 then
        r1_179 = r10_179
      end
      if r3_179 < r1_179 then
        r1_179 = r3_179
      end
    end
    if r0_179.LoadCgInf.EventCG.size_h * r6_179 < APP_INTERNAL_HEIGHT then
      r2_179 = (APP_INTERNAL_HEIGHT - r0_179.LoadCgInf.EventCG.size_h) / 2
    else
      if r2_179 < r11_179 then
        r2_179 = r11_179
      end
      if r4_179 < r2_179 then
        r2_179 = r4_179
      end
    end
    return r1_179, r2_179
  end
  g_Menu.CgBrowser.ptr.Cursor = function(r0_180)
    -- line: [7650, 7664] id: 180
    local r1_180 = cclass.lua_AutoCursor:new()
    local r2_180 = 0
    local r3_180 = cclass.lua_Layers:create()
    local r4_180 = 0
    local r5_180 = 0
    r4_180, r5_180, r6_180, r7_180 = r3_180:getParam(r0_180.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, r4_180, r5_180, 0, 0)
    if (APP_INTERNAL_WIDTH < r0_180.LoadCgInf.EventCG.size_w * r4_180 or APP_INTERNAL_HEIGHT < r0_180.LoadCgInf.EventCG.size_h * r5_180) and (not r0_180.DragMoveFlag or 2) then
      r2_180 = 1
    end
    r1_180:SetCursor(0)
    r1_180:delete()
  end
  g_Menu.CgBrowser.ptr.InitBrowserButton = function(r0_181)
    -- line: [7668, 7692] id: 181
    r0_181.CloseButton = false
    r0_181:LoadSystemMenu("CgBrowser01", "SYS_GalleryBrowser.pna")
    r0_181:MenuButtonSet(r0_181.MenuButtonData, "Down", 0, "CgBrowser01", 9, 9, 2, -1, -1, 1, 0, 0)
    r0_181:MenuButtonSet(r0_181.MenuButtonData, "Up", 0, "CgBrowser01", 10, 10, 3, -1, -1, 2, 0, 0)
    r0_181:MenuButtonSet(r0_181.MenuButtonData, "Right", 0, "CgBrowser01", 11, 11, 4, -1, -1, 3, 0, 0)
    r0_181:MenuButtonSet(r0_181.MenuButtonData, "Left", 0, "CgBrowser01", 12, 12, 5, -1, -1, 4, 0, 0)
    r0_181:MenuButtonSet(r0_181.MenuButtonData, "Close", 0, "CgBrowser01", 13, 13, 6, -1, -1, 5, 0, 0)
    r0_181:MenuButtonSet(r0_181.MenuButtonData, "Next", 0, "CgBrowser01", 16, -1, -1, -1, -1, 99, 0, 0)
    r0_181.MenuButtonData.Next.se_click = -1
    r0_181.MenuButtonData.Next.se_on = -1
    cclass.lua_Layers:create():initSubLayer(r0_181.MenuInf.SetName, "CgBrowser01", 15, 1)
    r0_181:MenuButtonInit()
    r0_181:ActiveBrowserButton()
  end
  g_Menu.CgBrowser.ptr.ActiveBrowserButton = function(r0_182)
    -- line: [7695, 7792] id: 182
    -- notice: unreachable block#21
    -- notice: unreachable block#17
    -- notice: unreachable block#22
    -- notice: unreachable block#16
    -- notice: unreachable block#23
    -- notice: unreachable block#29
    -- notice: unreachable block#25
    -- notice: unreachable block#24
    -- notice: unreachable block#30
    -- notice: unreachable block#26
    -- notice: unreachable block#19
    -- notice: unreachable block#20
    -- notice: unreachable block#18
    -- notice: unreachable block#27
    -- notice: unreachable block#31
    -- notice: unreachable block#28
    local r1_182 = cclass.lua_Layers:create()
    local r2_182 = {
      "Down",
      "Up",
      "Right",
      "Left",
      "Close"
    }
    if r0_182.LoadCgInf.EventCG.Movable then
      if r0_182.CloseButton then
        for r6_182, r7_182 in pairs(r2_182) do
          r0_182.MenuButtonData[r7_182]:bt_SetActive(3)
        end
        r1_182:setSubLayerVisible(r0_182.MenuInf.SetName, "CgBrowser01", 15, 0)
      else
        r0_182.MenuButtonData.Close:bt_SetActive(0)
        r1_182:setSubLayerVisible(r0_182.MenuInf.SetName, "CgBrowser01", 15, 1)
        local r3_182 = 0
        local r4_182 = 0
        local r5_182 = 0
        local r6_182 = nil
        local r7_182 = 0
        local r8_182 = 0
        r5_182, r6_182, r7_182, r8_182 = r1_182:getParam(r0_182.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, 0, 0, 0, 0)
        local r9_182 = r0_182.LoadCgInf.EventCG.size_w
        local r10_182 = r0_182.LoadCgInf.EventCG.size_h
        if r5_182 ~= 1 then
          r9_182 = r0_182.LoadCgInf.EventCG.size_w * r5_182
        end
        if r6_182 ~= 1 then
          r10_182 = r0_182.LoadCgInf.EventCG.size_h * r6_182
        end
        if r9_182 <= APP_INTERNAL_WIDTH then
          r0_182.MenuButtonData.Left:bt_SetActive(3)
          r0_182.MenuButtonData.Right:bt_SetActive(3)
        else
          r0_182.MenuButtonData.Left:bt_SetActive(0)
          r0_182.MenuButtonData.Right:bt_SetActive(0)
        end
        if r10_182 <= APP_INTERNAL_HEIGHT then
          r0_182.MenuButtonData.Up:bt_SetActive(3)
          r0_182.MenuButtonData.Down:bt_SetActive(3)
        else
          r0_182.MenuButtonData.Up:bt_SetActive(0)
          r0_182.MenuButtonData.Down:bt_SetActive(0)
        end
      end
    else
      for r6_182, r7_182 in pairs(r2_182) do
        r0_182.MenuButtonData[r7_182]:bt_SetActive(3)
      end
      r1_182:setSubLayerVisible(r0_182.MenuInf.SetName, "CgBrowser01", 15, 0)
    end
  end
  g_Menu.CgBrowser.ptr.Different = 1
  g_Menu.CgBrowser.ptr.LoadCgInf = {}
  g_Menu.CgBrowser.ptr.LoadCg = function(r0_183, r1_183, r2_183)
    -- line: [7801, 7865] id: 183
    local r3_183 = r0_183:MenuLoadLayer(r1_183, r2_183)
    local r4_183 = cclass.lua_Layers:create()
    for r8_183, r9_183 in pairs(g_CgBrowserList.Layer) do
      r4_183:initSubLayer(r0_183.MenuInf.SetName, r1_183, r9_183, 1)
    end
    local r5_183 = 0
    local r6_183 = 0
    r5_183, r6_183, r7_183, r8_183 = r4_183:getParam(r0_183.MenuInf.SetName, r1_183, LUA_PARAM_SIZE, r5_183, r6_183, 0, 0)
    local r9_183 = r5_183
    local r10_183 = r6_183
    local r11_183 = 1
    local r12_183 = 0.5
    if false and r4_183:isMosaic(r0_183.MenuInf.SetName, r1_183) == false and (APP_INTERNAL_WIDTH <= r5_183 or APP_INTERNAL_HEIGHT <= r6_183) then
      r5_183 = APP_INTERNAL_WIDTH / r5_183
      r6_183 = APP_INTERNAL_HEIGHT / r6_183
      if r6_183 < r5_183 then
        r11_183 = r5_183 or r6_183
      else
        goto label_68	-- block#9 is visited secondly
      end
      if r11_183 < 0.5 then
        r11_183 = 0.5
      end
      r12_183 = r11_183
      r4_183:setParam(r0_183.MenuInf.SetName, r1_183, LUA_PARAM_SCALE, r11_183, r11_183, 0, 0)
    end
    local r13_183 = false
    if APP_INTERNAL_WIDTH < r5_183 or APP_INTERNAL_HEIGHT < r6_183 then
      r13_183 = true
    end
    local r14_183 = (APP_INTERNAL_WIDTH - r9_183) / 2
    local r15_183 = (APP_INTERNAL_HEIGHT - r10_183) / 2
    r4_183:setParam(r0_183.MenuInf.SetName, r1_183, LUA_PARAM_POS, r14_183, r15_183, 0, 0)
    r0_183.LoadCgInf[r1_183] = {
      posx = r14_183,
      posy = r15_183,
      size_w = r9_183,
      size_h = r10_183,
      Scale = r11_183,
      MinScale = r12_183,
      Movable = r13_183,
    }
    r0_183:Cursor()
    return r3_183
  end
  g_Menu.CgBrowser.ptr.closeBrowser = function(r0_184)
    -- line: [7868, 7879] id: 184
    r0_184:MenuEffectToMenu(0)
    r0_184.MenuInf.enabled = false
    r0_184.MenuInf.effect = true
    cclass.lua_Layers:create():rtSnap("system")
    local r2_184 = cclass.lua_AutoCursor:new()
    r2_184:SetCursor(0)
    r2_184:delete()
  end
  local r2_159 = g_Menu.CgBrowser.ptr:MenuInit()
  if res == false then
    return false
  end
  if g_Menu.CgBrowser.ptr:LoadCg("EventCG", r0_159) == false then
    print("\x83t\x83@\x83C\x83\x8b\x82\xaa\x96\xb3\x82\xa9\x82\xc1\x82\xbd")
  end
  g_Menu.CgBrowser.ptr:InitBrowserButton()
  cclass.lua_Layers:create():copySnap("CgBrowser", "system")
  g_Menu.CgBrowser.ptr:MenuEffectStart(200)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
ScriptLogOut = function(r0_185, r1_185)
  -- line: [7916, 7928] id: 185
  if getAppInfo() ~= 0 then
    local r3_185 = nil
    if r1_185 ~= 0 then
      r3_185 = io.open("\x83V\x81[\x83\x93\x92ʉ߃\x8d\x83O.txt", "w")
    else
      r3_185 = io.open("\x83V\x81[\x83\x93\x92ʉ߃\x8d\x83O.txt", "a")
    end
    r3_185:write(r0_185 .. "\n")
    r3_185:close()
  end
end
openMoveBrowser = function(r0_186, r1_186)
  -- line: [7935, 8107] id: 186
  g_Menu.MoveBrowser.ptr = Menu.new("MoveBrowser")
  g_Menu.MoveBrowser.ptr.MenuInit = function(r0_187)
    -- line: [7947, 7959] id: 187
    local r1_187 = true
    r0_187.MenuInf.enabled = true
    r0_187.MenuInf.effect = true
    if cclass.lua_Layers:create():add(r0_187.MenuInf.SetName) == false then
      return false
    end
    return r1_187
  end
  g_Menu.MoveBrowser.ptr.MenuEffectEndJob = function(r0_188)
    -- line: [7962, 7976] id: 188
    local r1_188 = cclass.lua_Layers:create()
    if r0_188.MenuInf.enabled ~= true then
      r1_188:removeLayer(r0_188.MenuInf.SetName, "%EventMove%")
      r1_188:remove(r0_188.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_188.MenuInf.ButtonLayer = ""
      r0_188.MenuInf.ButtonPna = ""
    end
  end
  g_Menu.MoveBrowser.ptr.MenuEffectStart = function(r0_189, r1_189)
    -- line: [7979, 7987] id: 189
    cclass.lua_Layers:create():startTransition(r0_189.MenuInf.SetName, 0, 1, r1_189 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_189.MenuInf.enabled = true
    r0_189.MenuInf.effect = true
  end
  g_Menu.MoveBrowser.ptr.GetMenuMouseEnable = function(r0_190)
    -- line: [7989, 8000] id: 190
    local r1_190 = false
    if r0_190.MenuInf.enabled == true and r0_190.MenuInf.effect == false then
      r1_190 = true
    end
    return r1_190
  end
  g_Menu.MoveBrowser.ptr.MenuMouseMove = function(r0_191, r1_191, r2_191, r3_191, r4_191, r5_191, r6_191)
    -- line: [8006, 8012] id: 191
    if r6_191 == true then
      return 
    end
    if r0_191:GetMenuMouseEnable() then
    end
  end
  g_Menu.MoveBrowser.ptr.MenuLButtonDown = function(r0_192, r1_192, r2_192, r3_192, r4_192, r5_192, r6_192)
    -- line: [8014, 8025] id: 192
    local r7_192 = 0
    if r6_192 == true then
      return r7_192
    end
    if r0_192:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, 0)
      r0_192:closeBrowser()
    end
    return r7_192
  end
  g_Menu.MoveBrowser.ptr.MenuLButtonUp = function(r0_193, r1_193, r2_193, r3_193, r4_193, r5_193, r6_193)
    -- line: [8027, 8033] id: 193
    local r7_193 = 0
    if r6_193 == true then
      return r7_193
    end
    return r7_193
  end
  g_Menu.MoveBrowser.ptr.MenuRButtonDown = function(r0_194, r1_194, r2_194, r3_194, r4_194, r5_194, r6_194)
    -- line: [8035, 8043] id: 194
    local r7_194 = 0
    if r6_194 == true then
      return r7_194
    end
    if r0_194:GetMenuMouseEnable() then
    end
    return r7_194
  end
  g_Menu.MoveBrowser.ptr.MenuRButtonUp = function(r0_195, r1_195, r2_195, r3_195, r4_195, r5_195, r6_195)
    -- line: [8045, 8058] id: 195
    local r7_195 = 0
    if r6_195 == true then
      return r7_195
    end
    if r0_195:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_195:closeBrowser()
    end
    return r7_195
  end
  g_Menu.MoveBrowser.ptr.LoadMove = function(r0_196, r1_196, r2_196)
    -- line: [8064, 8069] id: 196
    return cclass.lua_Layers:create():insertMovieLayer(r0_196.MenuInf.SetName, r1_196, r2_196, 1)
  end
  g_Menu.MoveBrowser.ptr.closeBrowser = function(r0_197)
    -- line: [8073, 8081] id: 197
    r0_197:MenuEffectToMenu(0)
    r0_197.MenuInf.enabled = false
    r0_197.MenuInf.effect = true
    cclass.lua_Layers:create():rtSnap("system")
  end
  local r2_186 = g_Menu.MoveBrowser.ptr:MenuInit()
  if res == false then
    return false
  end
  g_Menu.MoveBrowser.ptr._number = r1_186
  if g_Menu.MoveBrowser.ptr:LoadMove("%EventMove%", r0_186) == false then
    print("\x83t\x83@\x83C\x83\x8b\x82\xaa\x96\xb3\x82\xa9\x82\xc1\x82\xbd")
  end
  cclass.lua_Layers:create():copySnap("MoveBrowser", "system")
  g_Menu.MoveBrowser.ptr:MenuEffectStart(200)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
