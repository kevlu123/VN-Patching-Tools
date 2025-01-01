-- filename: 
-- version: lua51
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
  function makeNmsList()
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
function openGallery(r0_2, r1_2)
  -- line: [71, 1054] id: 2
  g_Menu.GalleryMenu.ptr = Menu.new("Gallery")
  function g_Menu.GalleryMenu.ptr.MenuInit(r0_3, r1_3)
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
    local r8_3 = cfunc.LegacyGame__lua_GetVariable(120)
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
  function g_Menu.GalleryMenu.ptr.MenuButtonJobPos(r0_4, r1_4, r2_4, r3_4, r4_4)
    -- line: [123, 202] id: 4
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
    if r1_4 ~= 0 and r2_4 == "LU" then
      local r5_4 = cclass.lua_Layers:create()
      if 1 <= r1_4 and r1_4 <= 5 then
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
    if r2_4 == "RU" and r0_4:GetMenuMouseEnable() and r1_4 == 0 then
      r0_4:SystemSePlay(g_SysSEName.cancel)
      cfunc.LegacyGame__lua_SetVariable(99, 0)
      r0_4:closeGallery(0)
      r0_4:PlayTitleSound()
    end
  end
  g_Menu.GalleryMenu.ptr.MenuInf.PageEffect = false
  g_Menu.GalleryMenu.ptr.MenuInf.PageEffect2 = false
  g_Menu.GalleryMenu.ptr.MenuInf.GalleryEff = false
  function g_Menu.GalleryMenu.ptr.MenuEffect(r0_5)
    -- line: [213, 292] id: 5
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
        r0_5.beforePage = 0
        local r3_5 = 0
        local r4_5 = 0
        local r5_5 = cclass.lua_AutoCursor:new()
        r3_5, r4_5 = r5_5:GetCursorPos(r3_5, r4_5)
        r5_5:delete()
        r0_5.MenuButton:changeButton(r0_5.MenuInf.SetName, r2_5:getCursorPos(r0_5.MenuInf.SetName, r3_5, r4_5, 0) - 1, r3_5, r4_5)
        r0_5.MenuInf.PageEffect = false
        r0_5:UpButtonMoveEnd(g_GalleryInfo.Page)
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
  function g_Menu.GalleryMenu.ptr.MenuEffectEndJob(r0_6)
    -- line: [294, 320] id: 6
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
  function g_Menu.GalleryMenu.ptr.MenuEffectStart(r0_7, r1_7, r2_7)
    -- line: [322, 332] id: 7
    local r3_7 = cclass.lua_Layers:create()
    local r4_7 = cclass.lua_MeasureTime:new()
    local r5_7 = getEffectRate()
    r3_7:startTransition(r0_7.MenuInf.SetName, 0, 1, r1_7 * r5_7, r2_7 * r4_7:diff() * r5_7, LUA_TRANSITION_NORMAL)
    r4_7:delete()
    r0_7.MenuInf.enabled = true
    r0_7.MenuInf.effect = true
  end
  function g_Menu.GalleryMenu.ptr.GetMenuMouseEnable(r0_8)
    -- line: [337, 348] id: 8
    local r1_8 = false
    if r0_8.MenuInf.enabled == true and r0_8.MenuInf.effect == false and r0_8.MenuInf.PageEffect == false and r0_8.MenuInf.PageEffect2 == false and r0_8.MenuInf.GalleryEff == false and r0_8.MenuButton ~= nil then
      r1_8 = true
    end
    return r1_8
  end
  g_Menu.GalleryMenu.ptr.defaultMenuMouseMove = g_Menu.GalleryMenu.ptr.MenuMouseMove
  function g_Menu.GalleryMenu.ptr.MenuMouseMove(r0_9, r1_9, r2_9, r3_9, r4_9, r5_9, r6_9)
    -- line: [352, 382] id: 9
    r0_9:defaultMenuMouseMove(r1_9, r2_9, r3_9, r4_9, r5_9, r6_9)
    local r7_9 = cclass.lua_Layers:create()
    for r12_9, r13_9 in pairs({
      "CG",
      "Scene",
      "BGM"
    }) do
      if r13_9 == r0_9.MenuButton.selCursor then
        r7_9:setSubLayerVisible("Gallery", "GalleryBace", 46 - r12_9 - 1, 1)
      elseif r0_9.BT_DataBace[r13_9] ~= nil and r0_9.BT_DataBace[r13_9].active == 0 then
        r7_9:setSubLayerVisible("Gallery", "GalleryBace", 46 - r12_9 - 1, 0)
      end
    end
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
  end
  g_Menu.GalleryMenu.ptr.defaultMenuLButtonDown = g_Menu.GalleryMenu.ptr.MenuLButtonDown
  function g_Menu.GalleryMenu.ptr.MenuLButtonDown(r0_10, r1_10, r2_10, r3_10, r4_10, r5_10, r6_10)
    -- line: [386, 392] id: 10
    r0_10:defaultMenuLButtonDown(r1_10, r2_10, r3_10, r4_10, r5_10, r6_10)
    if g_GalleryInfo.Page == 4 and g_EnableNMS then
      r0_10:DropRepeatLD(r1_10, r2_10, r3_10, r4_10, r5_10, r6_10)
    end
  end
  function g_Menu.GalleryMenu.ptr.MenuMouseWheel(r0_11, r1_11, r2_11)
    -- line: [396, 406] id: 11
    if g_GalleryInfo.Page == 1 then
      r0_11:CgMouseWheel(r1_11, r2_11)
    end
    if g_GalleryInfo.Page == 2 then
      r0_11:ReplayMouseWheel(r1_11, r2_11)
    end
    if g_GalleryInfo.Page == 4 and g_EnableNMS then
      r0_11:NmsMouseWheel(r1_11, r2_11)
    end
  end
  g_Menu.GalleryMenu.ptr.GalleryItemP1 = {}
  g_Menu.GalleryMenu.ptr.GalleryItemP2 = {}
  g_Menu.GalleryMenu.ptr.GalleryItemP3 = {}
  function g_Menu.GalleryMenu.ptr.ItemSetInit(r0_12, r1_12)
    -- line: [418, 427] id: 12
    local r2_12 = {
      selCursor_selName = -1,
      selCursor_Item = {},
    }
    for r6_12 = 1, r1_12, 1 do
      r2_12.selCursor_Item[r6_12] = -1
    end
    return r2_12
  end
  function g_Menu.GalleryMenu.ptr.ItemSet(r0_13, r1_13, r2_13, ...)
    -- line: [431, 452] id: 13
    item = {
      ...
    }
    r1_13.selCursor_selName = r2_13
    for r7_13 = 1, #r1_13.selCursor_Item, 1 do
      if r1_13.selCursor_Item[r7_13] ~= -1 then
        r1_13.selCursor_Item[r7_13]:SetAct("def")
      end
      r1_13.selCursor_Item[r7_13] = -1
      if r7_13 <= #item and item[r7_13] ~= -1 then
        r1_13.selCursor_Item[r7_13] = r1_13[item[r7_13]]
        r1_13.selCursor_Item[r7_13]:SetAct("on")
      end
    end
  end
  function g_Menu.GalleryMenu.ptr.ConfigLogo(r0_14, r1_14, r2_14, r3_14, r4_14)
    -- line: [456, 514] id: 14
    if r1_14 == 0 then
      return 
    end
    local r5_14 = cclass.lua_Layers:create()
    local r6_14 = 0
    local r7_14 = 51 + (r1_14 - 1) * 4
    local r8_14 = r7_14 - 1
    local r9_14 = 51 + (r2_14 - 1) * 4
    local r10_14 = r9_14 - 1
    if r3_14 > 0 then
      if r2_14 >= 1 then
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r9_14, LUA_PARAM_POS, r0_14.LogoMainPos[r2_14].posx, r0_14.LogoMainPos[r2_14].posy, 0, 0)
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r10_14, LUA_PARAM_POS, r0_14.LogoSubPos[r2_14].posx, r0_14.LogoSubPos[r2_14].posy, 0, 0)
        r5_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r9_14, LUA_EFFECT_POS, -500, 0, 0, 0, 0, r3_14 / 2, 0, r6_14)
        r5_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r10_14, LUA_EFFECT_POS, 250, 0, 0, 0, 0, r3_14 / 2, 0, r6_14)
        r5_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r9_14, 0)
        r5_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r10_14, 0)
        r6_14 = r3_14 / 2
      end
      if r1_14 >= 1 then
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r7_14, LUA_PARAM_POS, r0_14.LogoMainPos[r1_14].posx - 500, r0_14.LogoMainPos[r1_14].posy, 0, 0)
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r8_14, LUA_PARAM_POS, r0_14.LogoSubPos[r1_14].posx + 250, r0_14.LogoSubPos[r1_14].posy, 0, 0)
        r5_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r7_14, LUA_EFFECT_POS, 500, 0, 0, 0, 0, r3_14 / 2, 0, r6_14)
        r5_14:setSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r8_14, LUA_EFFECT_POS, -250, 0, 0, 0, 0, r3_14 / 2, 0, r6_14)
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r7_14, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r8_14, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r7_14, 0)
        r5_14:startSubLayerEffect("Gallery", "GalleryBace", "GalleryPageEff", r8_14, 0)
      end
    else
      if r2_14 >= 1 then
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r9_14, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r10_14, LUA_PARAM_COLOR, 1, 1, 1, 0)
      end
      if r1_14 >= 1 then
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r7_14, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r5_14:setSubLayerParam("Gallery", "GalleryBace", r8_14, LUA_PARAM_COLOR, 1, 1, 1, 1)
      end
    end
  end
  g_Menu.GalleryMenu.ptr.beforePage = 0
  function g_Menu.GalleryMenu.ptr.initPageGallery(r0_15, r1_15, r2_15)
    -- line: [518, 776] id: 15
    if r1_15 == 0 then
      r1_15 = g_GalleryInfo.Page
    end
    if r1_15 == 1 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ACHIEVEMENT, 4)
    end
    if r1_15 == 3 then
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_ACHIEVEMENT, 5)
    end
    local r3_15 = 300
    local r4_15 = cclass.lua_Layers:create()
    local r5_15 = getEffectRate()
    local r6_15 = 0
    local r7_15 = 0
    local r8_15 = 0
    local r9_15 = 0
    local r10_15 = -1
    r0_15.MenuButton:InitList()
    if r0_15:GetBgmNo() == 0 then
      r0_15.BT_DataBace.stop:bt_SetActive(2)
    else
      r0_15.BT_DataBace.stop:bt_SetActive(0)
    end
    for r15_15, r16_15 in pairs({
      "CG",
      "Scene",
      "BGM"
    }) do
      if r0_15.BT_DataBace[r16_15] == nil then
        r4_15:setSubLayerVisible("Gallery", "GalleryBace", 46 - r15_15 - 1, 0)
      elseif r15_15 == r1_15 then
        r4_15:setSubLayerVisible("Gallery", "GalleryBace", 46 - r15_15 - 1, 1)
        r0_15.BT_DataBace[r16_15]:bt_SetActive(1)
      else
        if r16_15 == r0_15.MenuButton.selCursor then
          r4_15:setSubLayerVisible("Gallery", "GalleryBace", 46 - r15_15 - 1, 1)
        else
          r4_15:setSubLayerVisible("Gallery", "GalleryBace", 46 - r15_15 - 1, 0)
        end
        r0_15.BT_DataBace[r16_15]:bt_SetActive(0)
      end
    end
    if r1_15 == 1 then
      r10_15 = r0_15:InitCgMenu()
      r0_15.BT_DataBace.CG:bt_SetActive(1)
      r0_15.BT_DataBace.BGM:bt_SetActive(0)
      if r0_15.BT_DataBace.TIPS ~= nil then
        r0_15.BT_DataBace.TIPS:bt_SetActive(0)
      end
      if r0_15.BT_DataBace.NMS ~= nil then
        r0_15.BT_DataBace.NMS:bt_SetActive(0)
      end
    end
    if r1_15 == 2 then
      r10_15 = r0_15:InitSceneMenu()
      r0_15.BT_DataBace.CG:bt_SetActive(0)
      r0_15.BT_DataBace.BGM:bt_SetActive(0)
      if r0_15.BT_DataBace.TIPS ~= nil then
        r0_15.BT_DataBace.TIPS:bt_SetActive(0)
      end
      if r0_15.BT_DataBace.NMS ~= nil then
        r0_15.BT_DataBace.NMS:bt_SetActive(0)
      end
    end
    if r1_15 == 3 then
      r10_15 = r0_15:InitBgmMenu()
      r0_15.BT_DataBace.CG:bt_SetActive(0)
      r0_15.BT_DataBace.BGM:bt_SetActive(1)
      if r0_15.BT_DataBace.TIPS ~= nil then
        r0_15.BT_DataBace.TIPS:bt_SetActive(0)
      end
      if r0_15.BT_DataBace.NMS ~= nil then
        r0_15.BT_DataBace.NMS:bt_SetActive(0)
      end
    end
    if r1_15 == 4 and g_EnableNMS then
      r10_15 = r0_15:InitNmsMenu()
      r0_15.BT_DataBace.CG:bt_SetActive(0)
      r0_15.BT_DataBace.BGM:bt_SetActive(0)
      if r0_15.BT_DataBace.TIPS ~= nil then
        r0_15.BT_DataBace.TIPS:bt_SetActive(0)
      end
      if r0_15.BT_DataBace.NMS ~= nil then
        r0_15.BT_DataBace.NMS:bt_SetActive(1)
      end
    end
    if r1_15 == 5 and g_EnableTips then
      r10_15 = r0_15:InitTipsMenu()
      r0_15.BT_DataBace.CG:bt_SetActive(0)
      r0_15.BT_DataBace.BGM:bt_SetActive(0)
      if r0_15.BT_DataBace.TIPS ~= nil then
        r0_15.BT_DataBace.TIPS:bt_SetActive(1)
      end
      if r0_15.BT_DataBace.NMS ~= nil then
        r0_15.BT_DataBace.NMS:bt_SetActive(0)
      end
    end
    r0_15.MenuButton:SetList("BT_DataBace", r0_15.BT_DataBace)
    if r2_15 == true then
      r0_15:DashboardMove(r1_15, 0)
      r0_15:UpButtonMove(r1_15, 0)
      r0_15:ConfigLogo(r1_15, r0_15.beforePage, 0, 0)
    else
      r0_15.beforePage = g_GalleryInfo.Page
      local r12_15 = r0_15.beforePage
      if r1_15 < r12_15 then
        r12_15 = APP_INTERNAL_WIDTH or -1 * APP_INTERNAL_WIDTH
      else
        goto label_312	-- block#50 is visited secondly
      end
      local r13_15 = r0_15.beforePage
      if r1_15 < r13_15 then
        r13_15 = 90 or -90
      else
        goto label_320	-- block#53 is visited secondly
      end
      local r14_15 = r3_15 * r5_15
      local r15_15 = 0
      r0_15.MenuInf.PageEffect = true
      if r1_15 == 1 then
        r0_15:CgThumbnailEffect(g_GalleryInfo.CgPage, r12_15, r14_15, r13_15, false)
      end
      if r1_15 == 2 then
        r0_15:ReplayThumbnailEffect(g_GalleryInfo.ScenePage, r12_15, r14_15, r13_15, false)
      end
      if r1_15 == 3 then
      end
      if r1_15 == 4 and g_EnableNMS then
        r0_15:NmsChangeEffect(r12_15, r3_15, false)
      end
      if r1_15 == 5 and g_EnableTips then
        r0_15:TipsThumbnailEffect(g_GalleryInfo.ScenePage, r12_15, r14_15, r13_15, false)
      end
      local r16_15 = ""
      if r0_15.beforePage == 1 then
        r16_15 = r0_15.CgMenu.keyname
        r0_15:CgThumbnailEffect(g_GalleryInfo.CgPage, r12_15, r14_15, r13_15, true)
      end
      if r0_15.beforePage == 2 then
        r16_15 = r0_15.SceneMenu.keyname
        r0_15:ReplayThumbnailEffect(g_GalleryInfo.ScenePage, r12_15, r14_15, r13_15, true)
      end
      if r0_15.beforePage == 3 then
        r16_15 = r0_15.BgmMenu.keyname
      end
      if r0_15.beforePage == 4 and g_EnableNMS then
        r16_15 = r0_15:NmsChangeEffect(r12_15, r3_15, true)
      end
      if r0_15.beforePage == 5 and g_EnableTips then
        r16_15 = r0_15.TipsMenu.keyname
        r0_15:TipsThumbnailEffect(g_GalleryInfo.ScenePage, r12_15, r14_15, r13_15, true)
      end
      r4_15:setEffect("Gallery", r16_15, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_15 * r5_15, 0, 0)
      r4_15:setEffect("Gallery", r16_15, "GalleryPageEff", LUA_EFFECT_POS, r12_15, 0, 0, 0, 0, r3_15 * r5_15, 0, 0)
      r4_15:startEffect("Gallery", r16_15, "GalleryPageEff", 0)
      if r10_15 ~= -1 then
        r4_15:setParam("Gallery", r10_15, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r4_15:setEffect("Gallery", r10_15, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_15 * r5_15, 0, 0)
        r4_15:setParam("Gallery", r10_15, LUA_PARAM_POS, -1 * r12_15, 0, 0, 0)
        r4_15:setEffect("Gallery", r10_15, "GalleryPageEff", LUA_EFFECT_POS, r12_15, 0, 0, 0, 0, r3_15 * r5_15, 0, 0)
        r4_15:startEffect("Gallery", r10_15, "GalleryPageEff", 0)
      end
      r0_15:DashboardMove(r1_15, r3_15)
      r0_15:UpButtonMove(r1_15, r3_15)
      r0_15:ConfigLogo(r1_15, r0_15.beforePage, r3_15, r5_15)
    end
    g_GalleryInfo.Page = r1_15
    cfunc.LegacyGame__lua_SetVariable(103, r1_15)
  end
  function g_Menu.GalleryMenu.ptr.MenuEffectToMenu(r0_16, r1_16)
    -- line: [784, 792] id: 16
    local r2_16 = cclass.lua_Layers:create()
    r2_16:removeSnap("system")
    r2_16:rtSnap("system")
    r2_16:startTransition(r0_16.MenuInf.SetName, 0, 1, r1_16 * getEffectRate(), 0, LUA_TRANSITION_ERASE)
  end
  function g_Menu.GalleryMenu.ptr.closeGallery(r0_17, r1_17)
    -- line: [796, 834] id: 17
    cfunc.LegacyGame__lua_SetVariable(100, g_GalleryInfo.CgPage)
    cfunc.LegacyGame__lua_SetVariable(101, g_GalleryInfo.ScenePage)
    cfunc.LegacyGame__lua_SetVariable(102, g_GalleryInfo.BgmPage)
    if g_EnableTips then
      cfunc.LegacyGame__lua_SetVariable(104, g_GalleryInfo.TipsPage)
    end
    if g_EnableNMS then
      NmsMenuSaveBookMark()
    end
    if r1_17 == 2 or r1_17 == 4 then
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      cclass.lua_Layers:create():removeSnap("system")
      r0_17:MenuEffectEnd(0)
      if g_MenuMsgWin ~= nil then
        g_MenuMsgWin.MenuInf.enabled = false
        g_MenuMsgWin.MenuInf.effect = false
      end
    else
      if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == true then
        cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
      end
      r0_17:MenuEffectToMenu(0)
    end
    r0_17.MenuInf.enabled = false
    r0_17.MenuInf.effect = true
  end
  function g_Menu.GalleryMenu.ptr.PlayTitleSound(r0_18)
    -- line: [836, 858] id: 18
    local r1_18 = cclass.lua_Sounds:new()
    if r0_18.CompFlag and r0_18:GetBgmNo() ~= 2 then
      r1_18:BgmPlay("systembgm", getSoundArcFileName("bgm", ".ogg"), "bgm01.ogg", getSoundVolume("bgm"))
      cfunc.LegacyGame__lua_SetVariable(120, 2)
    elseif r0_18:GetBgmNo() ~= 26 then
      r1_18:BgmPlay("systembgm", getSoundArcFileName("bgm", ".ogg"), "bgm26.ogg", getSoundVolume("bgm"))
      cfunc.LegacyGame__lua_SetVariable(120, 26)
    end
    r1_18:delete()
  end
  function g_Menu.GalleryMenu.ptr.DashboardMove(r0_19, r1_19, r2_19)
    -- line: [863, 864] id: 19
  end
  function g_Menu.GalleryMenu.ptr.UpButtonMove(r0_20, r1_20, r2_20)
    -- line: [867, 868] id: 20
  end
  function g_Menu.GalleryMenu.ptr.UpButtonMoveEnd(r0_21, r1_21)
    -- line: [872, 873] id: 21
  end
  g_Menu.GalleryMenu.ptr.LogoMainPos = {}
  g_Menu.GalleryMenu.ptr.LogoSubPos = {}
  function g_Menu.GalleryMenu.ptr.InitGallery(r0_22, r1_22)
    -- line: [881, 977] id: 22
    local r2_22 = cclass.lua_Layers:create()
    g_Menu.GalleryMenu.ptr:MenuLoadLayer("GalleryBace", "SYS_GalleryBase.pna")
    g_Menu.GalleryMenu.ptr:MenuLoadLayer("GalleryBaceBack", "SYS_Gallery_bg.png")
    r2_22:swapLayerOrder("Gallery", "GalleryBace", "GalleryBaceBack")
    for r6_22 = 0, 2, 1 do
      local r7_22 = 51 + r6_22 * 4
      local r8_22 = r7_22 - 1
      r2_22:initSubLayer("Gallery", "GalleryBace", r7_22, 1)
      r2_22:initSubLayer("Gallery", "GalleryBace", r8_22, 1)
      local r9_22 = 0
      local r10_22 = 0
      r9_22, r10_22, r11_22, r12_22 = r2_22:getSubLayerParam("Gallery", "GalleryBace", r7_22, LUA_PARAM_POS, r9_22, r10_22, 0, 0)
      r0_22.LogoMainPos[r6_22 + 1] = {
        posx = r9_22,
        posy = r10_22,
      }
      local r13_22 = 0
      local r14_22 = 0
      r13_22, r14_22, r15_22, r16_22 = r2_22:getSubLayerParam("Gallery", "GalleryBace", r8_22, LUA_PARAM_POS, r13_22, r14_22, 0, 0)
      r0_22.LogoSubPos[r6_22 + 1] = {
        posx = r13_22,
        posy = r14_22,
      }
      r2_22:setSubLayerParam("Gallery", "GalleryBace", r7_22, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_22:setSubLayerParam("Gallery", "GalleryBace", r8_22, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r2_22:initSubLayer("Gallery", "GalleryBace", 46 - r6_22, 0)
    end
    r2_22:initSubLayer("Gallery", "GalleryBace", 62, 1)
    r2_22:initSubLayer("Gallery", "GalleryBace", 63, 1)
    r2_22:initSubLayer("Gallery", "GalleryBace", 64, 1)
    r0_22.BT_DataBace = {}
    r0_22:MenuButtonSet(r0_22.BT_DataBace, "CG", 1, "GalleryBace", 21, 36, 26, 31, 41, 1, 0, 0)
    r0_22:MenuButtonSet(r0_22.BT_DataBace, "BGM", 1, "GalleryBace", 19, 34, 24, 29, 39, 3, 0, 0)
    r0_22:MenuButtonSet(r0_22.BT_DataBace, "stop", 1, "GalleryBace", 9, 9, 4, -1, 14, 10, 0, 0)
    r0_22:MenuButtonSet(r0_22.BT_DataBace, "back", 1, "GalleryBace", 8, 8, 3, -1, 13, 13, 0, 0)
    r0_22:MenuButtonSet(r0_22.BT_DataBace, "quit", 1, "GalleryBace", 7, 7, 2, -1, 12, 12, 0, 0)
    r0_22.MenuButton:SetList("BT_DataBace", r0_22.BT_DataBace)
    r0_22:MenuButtonInit()
    local r3_22 = cfunc.LegacyGame__lua_GetVariable(103)
    if r1_22 ~= 0 or cfunc.LegacyGame__lua_GetFlag(124) then
      if r0_22.CompFlag then
        r0_22:GalleryBgmPlay(2)
      else
        r0_22:GalleryBgmPlay(26)
      end
    end
    cfunc.LegacyGame__lua_SetFlag(124, false)
    r0_22:initPageGallery(r3_22, true)
  end
  g_Menu.GalleryMenu.ptr.CompFlag = cfunc.LegacyGame__lua_GetFlag(1000)
  GalleryCgMenu(g_Menu.GalleryMenu.ptr)
  GallerySceneMenu(g_Menu.GalleryMenu.ptr)
  GalleryBgmMenu(g_Menu.GalleryMenu.ptr)
  if g_EnableTips then
    GalleryTipsMenu(g_Menu.GalleryMenu.ptr)
  end
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
function GalleryCgMenu(r0_23)
  -- line: [1061, 1546] id: 23
  r0_23.CgMenu = {}
  r0_23.CgMenu.DataTh = {}
  r0_23.CgMenu.keyname = "GalleryCg"
  r0_23.CgMenu.LayerName = "SYS_CgThumbnail"
  r0_23.CgMenu.FileName = "SYS_GalleryCg.pna"
  r0_23.CgMenu.ThFileName = "SYS_GalleryCgTH.pna"
  r0_23.CgMenu.LayerNameOff = "SYS_CgThumbnailOff"
  r0_23.CgMenu.ThFileNameOff = nil
  r0_23.CgMenu.ThXLineMax = 4
  r0_23.CgMenu.ThYLineMax = 3
  r0_23.CgMenu.ThAllMax = r0_23.CgMenu.ThXLineMax * r0_23.CgMenu.ThYLineMax
  r0_23.CgMenu.BarMoveNo = -1
  r0_23.CgMenu.PageMax = 7
  function r0_23.CgMouseWheel(r0_24, r1_24, r2_24)
    -- line: [1088, 1089] id: 24
  end
  function r0_23.CgButtonJob(r0_25, r1_25, r2_25, r3_25, r4_25)
    -- line: [1093, 1127] id: 25
    if nil and not nil then
      goto label_2	-- block#1 is visited secondly
    end
    if r2_25 == "LU" then
    end
    if r1_25 ~= 0 and r2_25 == "LU" then
      local r5_25 = 201 + r0_25.CgMenu.ThAllMax
      if 201 <= r1_25 and r1_25 <= r5_25 then
        local r7_25 = r0_25:GetCgRetNo(g_GalleryInfo.CgPage, r1_25 - 200)
        cfunc.LegacyGame__lua_SetVariable(99, 1)
        cfunc.LegacyGame__lua_SetVariable(105, r7_25)
        if r7_25 >= 93 then
          r0_25:GalleryBgmStop()
          r0_25:closeGallery(2)
          g_menuExecute = false
          cfunc.LegacyGame__lua_SetFlag(124, true)
        else
          r0_25:closeGallery(0)
        end
      end
      if 101 <= r1_25 and r1_25 <= 115 then
        r0_25:CGPageInit(r1_25 - 100, false)
      end
    end
  end
  function r0_23.InitCgButton(r0_26, r1_26)
    -- line: [1131, 1166] id: 26
    local r2_26 = cclass.lua_Layers:create()
    r0_26.CgMenu.DataPage = {}
    for r6_26 = 1, r0_26.CgMenu.PageMax, 1 do
      local r8_26 = 80 - r6_26 - 1
      r0_26:MenuButtonSet(r0_26.CgMenu.DataPage, "Page" .. tostring(r6_26), 1, r1_26, r8_26, r8_26, 56 - r6_26 - 1, 68 - r6_26 - 1, 92 - r6_26 - 1, 100 + r6_26, 0, 0)
    end
    r0_26.CgMenu.DataTh = {}
    for r6_26 = 1, r0_26.CgMenu.ThAllMax, 1 do
      local r8_26 = 28 - r6_26 - 1
      r0_26:MenuButtonSet(r0_26.CgMenu.DataTh, "TH" .. tostring(r6_26), 1, r1_26, r8_26, r8_26, 14 - r6_26 - 1, -1, 42 - r6_26 - 1, 200 + r6_26, 0, 0)
    end
  end
  function r0_23.InitCgMenu(r0_27)
    -- line: [1169, 1207] id: 27
    local r1_27 = cclass.lua_Layers:create()
    r0_27:MenuLoadLayer(r0_27.CgMenu.keyname, r0_27.CgMenu.FileName)
    r0_27:LoadCgThumbnail()
    r0_27:InitCgButton(r0_27.CgMenu.keyname)
    r0_27.MenuButton:SetList("BT_CgDataPage", r0_27.CgMenu.DataPage)
    r0_27.MenuButton:SetList("BT_CgDataTh", r0_27.CgMenu.DataTh)
    r0_27:MenuButtonInit()
    r0_27:CGPageInit(g_GalleryInfo.CgPage, true)
    return r0_27.CgMenu.keyname
  end
  function r0_23.GetCgRetNo(r0_28, r1_28, r2_28)
    -- line: [1210, 1213] id: 28
    return r2_28 + (r1_28 - 1) * r0_28.CgMenu.ThAllMax
  end
  function r0_23.GetCgThumbnailOnOff(r0_29, r1_29, r2_29)
    -- line: [1217, 1236] id: 29
    local r3_29 = 178 - (r1_29 - 1) * 30 + r2_29 - 1
    local r4_29 = 192 - (r1_29 - 1) * 30 + r2_29 - 1
    if r1_29 == 7 then
      r3_29 = 6 - r2_29 - 1
      r4_29 = 12 - r2_29 - 1
    end
    local r5_29 = r0_29.CgMenu.LayerName
    local r6_29 = r0_29.CgMenu.LayerNameOff
    if r0_29.CgMenu.ThFileNameOff == nil then
      r6_29 = r0_29.CgMenu.LayerName
    end
    return r3_29, r4_29, r5_29, r6_29
  end
  function r0_23.LoadCgThumbnail(r0_30)
    -- line: [1239, 1244] id: 30
    r0_30:MenuLoadLayer(r0_30.CgMenu.LayerName, r0_30.CgMenu.ThFileName)
    if r0_30.CgMenu.ThFileNameOff ~= nil then
      r0_30:MenuLoadLayer(r0_30.CgMenu.LayerNameOff, r0_30.CgMenu.ThFileNameOff)
    end
  end
  function r0_23.DeleteCgThumbnail(r0_31)
    -- line: [1247, 1253] id: 31
    local r1_31 = cclass.lua_Layers:create()
    r1_31:removeLayer(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerName)
    if r0_31.CgMenu.ThFileNameOff ~= nil then
      r1_31:removeLayer(r0_31.MenuInf.SetName, r0_31.CgMenu.LayerNameOff)
    end
  end
  function r0_23.DeleteCgMenu(r0_32)
    -- line: [1256, 1260] id: 32
    cclass.lua_Layers:create():removeLayer(r0_32.MenuInf.SetName, r0_32.CgMenu.keyname)
    r0_32:DeleteCgThumbnail()
  end
  function r0_23.CgThumbnailEffect(r0_33, r1_33, r2_33, r3_33, r4_33, r5_33)
    -- line: [1264, 1314] id: 33
    local r6_33 = cclass.lua_Layers:create()
    local r7_33 = true
    if r5_33 == false then
      r6_33:setParam(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r6_33:setEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_33, 0, 0)
      if r7_33 then
        r6_33:setParam(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerName, LUA_PARAM_POS, -1 * r2_33, 0, 0, 0)
        r6_33:setEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_33, 0, 0, 0, 0, r3_33, 0, 0)
      end
      r6_33:startEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerName, "GalleryPageEff", 0)
      if r0_33.CgMenu.ThFileNameOff ~= nil then
        r6_33:setParam(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r6_33:setEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_33, 0, 0)
        if r7_33 then
          r6_33:setParam(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, LUA_PARAM_POS, -1 * r2_33, 0, 0, 0)
          r6_33:setEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_POS, r2_33, 0, 0, 0, 0, r3_33, 0, 0)
        end
        r6_33:startEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, "GalleryPageEff", 0)
      end
    else
      r6_33:setParam(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r6_33:setEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_33, 0, 0)
      if r7_33 then
        r6_33:setEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_33, 0, 0, 0, 0, r3_33, 0, 0)
        if r0_33.CgMenu.ThFileNameOff ~= nil then
          r6_33:setEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_POS, r2_33, 0, 0, 0, 0, r3_33, 0, 0)
        end
      end
      r6_33:startEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerName, "GalleryPageEff", 0)
      if r0_33.CgMenu.ThFileNameOff ~= nil then
        r6_33:setParam(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r6_33:setEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_33, 0, 0)
        if r7_33 then
          r6_33:setEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_POS, r2_33, 0, 0, 0, 0, r3_33, 0, 0)
        end
        r6_33:startEffect(r0_33.MenuInf.SetName, r0_33.CgMenu.LayerNameOff, "GalleryPageEff", 0)
      end
    end
  end
  function r0_23.CgThumbnailOver(r0_34, r1_34, r2_34, r3_34, r4_34, r5_34, r6_34)
    -- line: [1317, 1358] id: 34
    local r7_34 = cclass.lua_Layers:create()
    local r8_34 = 0
    local r9_34 = 0
    local r10_34 = -1
    if r0_34.MenuButton.selCursor ~= -1 then
      r10_34 = r0_34.MenuButton.selListKey[r0_34.MenuButton.selCursor]
      r9_34 = r10_34.arg
      r8_34 = r10_34.bt_l
    end
    local r11_34 = -1
    local r12_34 = 201 + r0_34.CgMenu.ThAllMax
    if 201 <= r8_34 and r8_34 <= r12_34 then
      r11_34 = r8_34 - 200
    end
    for r16_34 = 1, r0_34.CgMenu.ThAllMax, 1 do
      if r0_34:GetCgFlag(g_GalleryInfo.CgPage, r16_34) == 1 then
        local r18_34 = 0
        local r19_34 = 0
        local r20_34 = r0_34.CgMenu.LayerName
        local r21_34 = r0_34.CgMenu.LayerNameOff
        r18_34, r19_34, r20_34, r21_34 = r0_34:GetCgThumbnailOnOff(g_GalleryInfo.CgPage, r16_34)
        if r18_34 ~= -1 and r19_34 ~= -1 then
          if r11_34 == r16_34 then
            r7_34:setSubLayerVisible(r0_34.MenuInf.SetName, r20_34, r18_34, 1)
            r7_34:setSubLayerVisible(r0_34.MenuInf.SetName, r21_34, r19_34, 0)
          else
            r7_34:setSubLayerVisible(r0_34.MenuInf.SetName, r20_34, r18_34, 0)
            r7_34:setSubLayerVisible(r0_34.MenuInf.SetName, r21_34, r19_34, 1)
          end
        end
      end
    end
  end
  function r0_23.GetCgFlag(r0_35, r1_35, r2_35)
    -- line: [1362, 1441] id: 35
    local r3_35 = {
      EVCOM_01 = 1120,
      EVCOM_02 = 1121,
      EVCOM_03 = 1122,
      EVCOM_04 = 1123,
      EVCOM_05 = 1124,
      EVCOM_06 = 1125,
      EVHIK_01 = 1126,
      EVHIK_02 = 1127,
      EVHIK_03 = 1128,
      EVHIK_04 = 1129,
      EVHIK_05 = 1130,
      EVHIK_06 = 1131,
      EVHIK_07 = 1132,
      EVHIK_08 = 1133,
      EVHIK_09 = 1134,
      EVHIK_10 = 1135,
      EVHIK_11 = 1136,
      EVHIK_12 = 1137,
      EVHIK_13 = 1138,
      EVHIK_14 = 1139,
      EVSAY_01 = 1149,
      EVSAY_02 = 1150,
      EVSAY_03 = 1151,
      EVSAY_04 = 1152,
      EVSAY_05 = 1153,
      EVSAY_06 = 1154,
      EVSAY_07 = 1155,
      EVSAY_08 = 1156,
      EVSAY_09 = 1157,
      EVSAY_10 = 1158,
      EVSAY_11 = 1159,
      EVSAY_12 = 1160,
      EVSAY_13 = 1161,
      EVSAY_14 = 1162,
      EVSAY_15 = 1163,
      EVORI_01 = 1172,
      EVORI_02 = 1173,
      EVORI_03 = 1175,
      EVORI_04 = 1174,
      EVORI_05 = 1176,
      EVORI_07 = 1177,
      EVORI_08 = 1178,
      EVORI_09 = 1179,
      EVORI_10 = 1180,
      EVORI_11 = 1181,
      EVORI_12 = 1182,
      EVKOR_01 = 1190,
      EVKOR_02 = 1191,
      EVKOR_03 = 1192,
      EVKOR_04 = 1193,
      EVKOR_07 = 1194,
      EVKOR_08 = 1195,
      EVKOR_09 = 1196,
      EVKOR_10 = 1197,
      SDEV_01 = 1207,
      SDEV_02 = 1208,
      SDEV_03 = 1209,
      SDEV_04 = 1210,
      SDEV_05 = 1211,
      SDEV_06 = 1212,
      SDEV_07 = 1213,
      SDEV_08 = 1214,
      SDEV_09 = 1215,
      SDEV_10 = 1216,
      SDEV_11 = 1217,
      SDEV_12 = 1218,
      SDEV_13 = 1219,
      SDEV_14 = 1220,
      SDEV_15 = 1221,
      SDEV_16 = 1222,
      SDEV_17 = 1223,
      SDEV_18 = 1224,
      SDEV_19 = 1225,
      SDEV_20 = 1226,
      SDEV_21 = 1227,
      SDEV_22 = 1228,
    }
    local r6_35 = ({
      r3_35.EVCOM_01,
      r3_35.EVCOM_02,
      r3_35.EVCOM_03,
      r3_35.EVCOM_04,
      r3_35.EVCOM_05,
      r3_35.EVCOM_06,
      r3_35.EVHIK_02,
      r3_35.EVHIK_03,
      r3_35.EVHIK_04,
      r3_35.EVHIK_01,
      r3_35.EVHIK_05,
      r3_35.EVHIK_06,
      r3_35.EVHIK_07,
      r3_35.EVHIK_08,
      r3_35.EVHIK_09,
      r3_35.EVHIK_10,
      r3_35.EVHIK_11,
      r3_35.EVHIK_12,
      r3_35.EVHIK_13,
      r3_35.EVHIK_14,
      r3_35.EVSAY_03,
      r3_35.EVSAY_05,
      r3_35.EVSAY_09,
      r3_35.EVSAY_01,
      r3_35.EVSAY_02,
      r3_35.EVSAY_04,
      r3_35.EVSAY_06,
      r3_35.EVSAY_07,
      r3_35.EVSAY_08,
      r3_35.EVSAY_10,
      r3_35.EVSAY_11,
      r3_35.EVSAY_12,
      r3_35.EVSAY_13,
      r3_35.EVSAY_14,
      r3_35.EVSAY_15,
      r3_35.EVORI_01,
      r3_35.EVORI_02,
      r3_35.EVORI_03,
      r3_35.EVORI_04,
      r3_35.EVORI_05,
      r3_35.EVORI_07,
      r3_35.EVORI_08,
      r3_35.EVORI_09,
      r3_35.EVORI_10,
      r3_35.EVORI_11,
      r3_35.EVORI_12,
      r3_35.EVKOR_01,
      r3_35.EVKOR_02,
      r3_35.EVKOR_03,
      r3_35.EVKOR_04,
      r3_35.EVKOR_07,
      r3_35.EVKOR_08,
      r3_35.EVKOR_09,
      r3_35.EVKOR_10,
      r3_35.SDEV_03,
      r3_35.SDEV_04,
      r3_35.SDEV_01,
      r3_35.SDEV_05,
      r3_35.SDEV_02,
      r3_35.SDEV_07,
      r3_35.SDEV_10,
      r3_35.SDEV_06,
      r3_35.SDEV_08,
      r3_35.SDEV_09,
      r3_35.SDEV_11,
      r3_35.SDEV_12,
      r3_35.SDEV_13,
      r3_35.SDEV_14,
      r3_35.SDEV_19,
      r3_35.SDEV_15,
      r3_35.SDEV_17,
      r3_35.SDEV_16,
      r3_35.SDEV_18,
      r3_35.SDEV_20,
      r3_35.SDEV_21,
      r3_35.SDEV_22,
      nil,
      nil,
      nil,
      nil
    })[(r1_35 - 1) * r0_35.CgMenu.ThAllMax + r2_35]
    if r6_35 == nil then
      return -1
    end
    if cfunc.LegacyGame__lua_GetFlag(r6_35) then
      return 1
    else
      return 0
    end
  end
  function r0_23.CGPageInit(r0_36, r1_36, r2_36)
    -- line: [1445, 1544] id: 36
    for r6_36 = 1, r0_36.CgMenu.PageMax, 1 do
      local r7_36 = "Page" .. tostring(r6_36)
      if r1_36 == r6_36 then
        r0_36.CgMenu.DataPage[r7_36]:bt_SetActive(1)
      else
        r0_36.CgMenu.DataPage[r7_36]:bt_SetActive(0)
      end
    end
    local r3_36 = cclass.lua_Layers:create()
    if r2_36 == false then
      for r7_36 = 1, r0_36.CgMenu.ThAllMax, 1 do
        if r0_36:GetCgFlag(g_GalleryInfo.CgPage, r7_36) == 1 then
          local r9_36 = 0
          local r10_36 = 0
          local r11_36 = r0_36.CgMenu.LayerName
          local r12_36 = r0_36.CgMenu.LayerNameOff
          r9_36, r10_36, r11_36, r12_36 = r0_36:GetCgThumbnailOnOff(g_GalleryInfo.CgPage, r7_36)
          if r9_36 ~= -1 then
            r3_36:setSubLayerVisible(r0_36.MenuInf.SetName, r11_36, r9_36, 0)
          end
          if r10_36 ~= -1 then
            r3_36:setSubLayerVisible(r0_36.MenuInf.SetName, r12_36, r10_36, 0)
          end
        end
      end
    end
    local r4_36 = 1
    for r8_36 = 1, r0_36.CgMenu.ThYLineMax, 1 do
      for r12_36 = 1, r0_36.CgMenu.ThXLineMax, 1 do
        local r13_36 = r0_36:GetCgFlag(r1_36, r4_36)
        local r14_36 = "TH" .. tostring(r4_36)
        if r13_36 == 1 then
          r0_36.CgMenu.DataTh[r14_36]:bt_SetActive(0)
        end
        if r13_36 == 0 then
          r0_36.CgMenu.DataTh[r14_36]:bt_SetActive(2)
        end
        if r13_36 == -1 then
          r0_36.CgMenu.DataTh[r14_36]:bt_SetActive(3)
        end
        local r15_36 = -1
        local r16_36 = -1
        local r17_36 = 0
        local r18_36 = 0
        local r19_36 = r0_36.CgMenu.LayerName
        local r20_36 = r0_36.CgMenu.LayerNameOff
        r17_36, r18_36, r19_36, r20_36 = r0_36:GetCgThumbnailOnOff(r1_36, r4_36)
        if r13_36 == 1 then
          if r17_36 ~= -1 then
            r3_36:initSubLayer(r0_36.MenuInf.SetName, r19_36, r17_36, 1)
            if r15_36 ~= -1 and r16_36 ~= -1 then
              r3_36:setSubLayerParam(r0_36.MenuInf.SetName, r19_36, r17_36, LUA_PARAM_POS, r15_36, r16_36, 0, 0)
            end
            r3_36:setSubLayerVisible(r0_36.MenuInf.SetName, r19_36, r17_36, 0)
          end
          if r18_36 ~= -1 then
            r3_36:initSubLayer(r0_36.MenuInf.SetName, r20_36, r18_36, 1)
            if r15_36 ~= -1 and r16_36 ~= -1 then
              r3_36:setSubLayerParam(r0_36.MenuInf.SetName, r20_36, r18_36, LUA_PARAM_POS, r15_36, r16_36, 0, 0)
            end
            r3_36:setSubLayerVisible(r0_36.MenuInf.SetName, r20_36, r18_36, 1)
          end
        elseif r13_36 == 0 then
          if r17_36 ~= -1 then
            r3_36:initSubLayer(r0_36.MenuInf.SetName, r19_36, r17_36, 0)
            r3_36:setSubLayerVisible(r0_36.MenuInf.SetName, r19_36, r17_36, 0)
          end
          if r18_36 ~= -1 then
            r3_36:initSubLayer(r0_36.MenuInf.SetName, r20_36, r18_36, 0)
            r3_36:setSubLayerVisible(r0_36.MenuInf.SetName, r20_36, r18_36, 0)
          end
        end
        r4_36 = r4_36 + 1
      end
    end
    g_GalleryInfo.CgPage = r1_36
  end
end
function GallerySceneMenu(r0_37)
  -- line: [1552, 1982] id: 37
  r0_37.SceneMenu = {}
  r0_37.SceneMenu.DataTh = {}
  r0_37.SceneMenu.keyname = "GalleryScene"
  r0_37.SceneMenu.LayerName = "SYS_SceneThumbnail"
  r0_37.SceneMenu.FileName = "SYS_GalleryRe.pna"
  r0_37.SceneMenu.ThFileName = "SYS_GalleryReTH.pna"
  r0_37.SceneMenu.LayerNameOff = "SYS_SceneThumbnailOff"
  r0_37.SceneMenu.ThFileNameOff = nil
  r0_37.SceneMenu.ThXLineMax = 4
  r0_37.SceneMenu.ThYLineMax = 3
  r0_37.SceneMenu.ThAllMax = r0_37.SceneMenu.ThXLineMax * r0_37.SceneMenu.ThYLineMax
  r0_37.SceneMenu.BarMoveNo = -1
  r0_37.SceneMenu.PageMax = 2
  function r0_37.ReplayMouseWheel(r0_38, r1_38, r2_38)
    -- line: [1580, 1581] id: 38
  end
  function r0_37.SceneButtonJob(r0_39, r1_39, r2_39, r3_39, r4_39)
    -- line: [1585, 1612] id: 39
    if nil and not nil then
      goto label_2	-- block#1 is visited secondly
    end
    if r2_39 == "LU" then
    end
    if r1_39 ~= 0 and r2_39 == "LU" then
      local r5_39 = 201 + r0_39.SceneMenu.ThAllMax
      if 201 <= r1_39 and r1_39 <= r5_39 then
        local r7_39 = r0_39:GetReplayRetNo(g_GalleryInfo.ScenePage, r1_39 - 200)
        cfunc.LegacyGame__lua_SetVariable(99, 2)
        cfunc.LegacyGame__lua_SetVariable(110, r7_39)
        r0_39:GalleryBgmStop()
        r0_39:closeGallery(2)
        g_menuExecute = false
      end
      if 101 <= r1_39 and r1_39 <= 115 then
        r0_39:ScenePageInit(r1_39 - 100, false)
      end
    end
  end
  function r0_37.InitSceneButton(r0_40, r1_40)
    -- line: [1616, 1649] id: 40
    local r2_40 = cclass.lua_Layers:create()
    r0_40.SceneMenu.DataPage = {}
    for r6_40 = 1, r0_40.SceneMenu.PageMax, 1 do
      local r8_40 = 56 - r6_40 - 1
      r0_40:MenuButtonSet(r0_40.SceneMenu.DataPage, "Page" .. tostring(r6_40), 1, r1_40, r8_40, r8_40, 48 - r6_40 - 1, 52 - r6_40 - 1, 60 - r6_40 - 1, 100 + r6_40, 0, 0)
    end
    r0_40.SceneMenu.DataTh = {}
    for r6_40 = 1, r0_40.SceneMenu.ThAllMax, 1 do
      local r8_40 = 28 - r6_40 - 1
      r0_40:MenuButtonSet(r0_40.SceneMenu.DataTh, "TH" .. tostring(r6_40), 1, r1_40, r8_40, r8_40, 14 - r6_40 - 1, -1, 42 - r6_40 - 1, 200 + r6_40, 0, 0)
    end
  end
  function r0_37.InitSceneMenu(r0_41)
    -- line: [1652, 1679] id: 41
    local r1_41 = cclass.lua_Layers:create()
    r0_41:MenuLoadLayer(r0_41.SceneMenu.keyname, r0_41.SceneMenu.FileName)
    r0_41:LoadSceneThumbnail()
    r0_41:InitSceneButton(r0_41.SceneMenu.keyname)
    r0_41.MenuButton:SetList("BT_SceneDataPage", r0_41.SceneMenu.DataPage)
    r0_41.MenuButton:SetList("BT_SceneDataTh", r0_41.SceneMenu.DataTh)
    r0_41:MenuButtonInit()
    r0_41:ScenePageInit(g_GalleryInfo.ScenePage, true)
    return r0_41.SceneMenu.keyname
  end
  function r0_37.GetReplayRetNo(r0_42, r1_42, r2_42)
    -- line: [1683, 1686] id: 42
    return r2_42 + (r1_42 - 1) * r0_42.SceneMenu.ThAllMax
  end
  function r0_37.GetReplayThumbnailOnOff(r0_43, r1_43, r2_43)
    -- line: [1689, 1706] id: 43
    local r3_43 = 0 - r2_43 - 1 + 13
    local r4_43 = 0 - r2_43 - 1 + 27
    if r1_43 == 2 then
      r3_43 = 0 - r2_43 - 1 + 36
      r4_43 = 0 - r2_43 - 1 + 43
    end
    if r1_43 == 3 then
      r3_43 = 0 - r2_43 - 1 + 59
      r4_43 = 0 - r2_43 - 1 + 73
    end
    return r3_43, r4_43, r0_43.SceneMenu.LayerName, r0_43.SceneMenu.LayerName
  end
  function r0_37.LoadSceneThumbnail(r0_44)
    -- line: [1709, 1714] id: 44
    r0_44:MenuLoadLayer(r0_44.SceneMenu.LayerName, r0_44.SceneMenu.ThFileName)
    if r0_44.SceneMenu.ThFileNameOff ~= nil then
      r0_44:MenuLoadLayer(r0_44.SceneMenu.LayerNameOff, r0_44.SceneMenu.ThFileNameOff)
    end
  end
  function r0_37.DeleteSceneThumbnail(r0_45)
    -- line: [1717, 1723] id: 45
    local r1_45 = cclass.lua_Layers:create()
    r1_45:removeLayer(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerName)
    if r0_45.SceneMenu.ThFileNameOff ~= nil then
      r1_45:removeLayer(r0_45.MenuInf.SetName, r0_45.SceneMenu.LayerNameOff)
    end
  end
  function r0_37.DeleteReplayMenu(r0_46)
    -- line: [1726, 1730] id: 46
    cclass.lua_Layers:create():removeLayer(r0_46.MenuInf.SetName, r0_46.SceneMenu.keyname)
    r0_46:DeleteSceneThumbnail()
  end
  function r0_37.ReplayThumbnailEffect(r0_47, r1_47, r2_47, r3_47, r4_47, r5_47)
    -- line: [1734, 1777] id: 47
    local r6_47 = cclass.lua_Layers:create()
    local r7_47 = true
    if r5_47 == false then
      r6_47:setParam(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 0)
      r6_47:setEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_47, 0, 0)
      if r7_47 then
        r6_47:setParam(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerName, LUA_PARAM_POS, -1 * r2_47, 0, 0, 0)
        r6_47:setEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_47, 0, 0, 0, 0, r3_47, 0, 0)
      end
      r6_47:startEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerName, "GalleryPageEff", 0)
      if r0_47.SceneMenu.ThFileNameOff ~= nil then
        r6_47:setParam(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerNameOff, LUA_PARAM_COLOR, 1, 1, 1, 0)
        r6_47:setEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r3_47, 0, 0)
        if r7_47 then
          r6_47:setParam(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerNameOff, LUA_PARAM_POS, -1 * r2_47, 0, 0, 0)
          r6_47:setEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_POS, r2_47, 0, 0, 0, 0, r3_47, 0, 0)
        end
        r6_47:startEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerNameOff, "GalleryPageEff", 0)
      end
    else
      r6_47:setParam(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerName, LUA_PARAM_COLOR, 1, 1, 1, 1)
      r6_47:setEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_47, 0, 0)
      if r7_47 then
        r6_47:setEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerName, "GalleryPageEff", LUA_EFFECT_POS, r2_47, 0, 0, 0, 0, r3_47, 0, 0)
      end
      r6_47:startEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerName, "GalleryPageEff", 0)
      if r0_47.SceneMenu.ThFileNameOff ~= nil then
        r6_47:setParam(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerNameOff, LUA_PARAM_COLOR, 1, 1, 1, 1)
        r6_47:setEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r3_47, 0, 0)
        if r7_47 then
          r6_47:setEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerNameOff, "GalleryPageEff", LUA_EFFECT_POS, r2_47, 0, 0, 0, 0, r3_47, 0, 0)
        end
        r6_47:startEffect(r0_47.MenuInf.SetName, r0_47.SceneMenu.LayerNameOff, "GalleryPageEff", 0)
      end
    end
  end
  function r0_37.ReplayThumbnailOver(r0_48, r1_48, r2_48, r3_48, r4_48, r5_48, r6_48)
    -- line: [1780, 1820] id: 48
    local r7_48 = cclass.lua_Layers:create()
    local r8_48 = 0
    local r9_48 = 0
    local r10_48 = -1
    if r0_48.MenuButton.selCursor ~= -1 then
      r10_48 = r0_48.MenuButton.selListKey[r0_48.MenuButton.selCursor]
      r9_48 = r10_48.arg
      r8_48 = r10_48.bt_l
    end
    local r11_48 = -1
    local r12_48 = 201 + r0_48.SceneMenu.ThAllMax
    if 201 <= r8_48 and r8_48 <= r12_48 then
      r11_48 = r8_48 - 200
    end
    for r16_48 = 1, r0_48.SceneMenu.ThAllMax, 1 do
      if r0_48:GetSceneFlag(g_GalleryInfo.ScenePage, r16_48) == 1 then
        local r18_48 = 0
        local r19_48 = 0
        local r20_48 = r0_48.SceneMenu.LayerName
        local r21_48 = r0_48.SceneMenu.LayerNameOff
        r18_48, r19_48, r20_48, r21_48 = r0_48:GetReplayThumbnailOnOff(g_GalleryInfo.ScenePage, r16_48)
        if r18_48 ~= -1 and r19_48 ~= -1 then
          if r11_48 == r16_48 then
            r7_48:setSubLayerVisible(r0_48.MenuInf.SetName, r20_48, r18_48, 1)
            r7_48:setSubLayerVisible(r0_48.MenuInf.SetName, r21_48, r19_48, 0)
          else
            r7_48:setSubLayerVisible(r0_48.MenuInf.SetName, r20_48, r18_48, 0)
            r7_48:setSubLayerVisible(r0_48.MenuInf.SetName, r21_48, r19_48, 1)
          end
        end
      end
    end
  end
  function r0_37.GetSceneFlag(r0_49, r1_49, r2_49)
    -- line: [1824, 1879] id: 49
    local r3_49 = {
      REPLAY_001 = 1090,
      REPLAY_002 = 1091,
      REPLAY_003 = 1092,
      REPLAY_004 = 1093,
      REPLAY_005 = 1094,
      REPLAY_006 = 1095,
      REPLAY_007 = 1096,
      REPLAY_008 = 1097,
      REPLAY_009 = 1098,
      REPLAY_010 = 1099,
      REPLAY_011 = 1100,
      REPLAY_012 = 1101,
      REPLAY_013 = 1102,
      REPLAY_014 = 1103,
      REPLAY_015 = 1104,
      REPLAY_016 = 1105,
      REPLAY_017 = 1106,
    }
    local r4_49 = {
      r3_49.REPLAY_001,
      r3_49.REPLAY_002,
      r3_49.REPLAY_003,
      r3_49.REPLAY_004,
      r3_49.REPLAY_005,
      r3_49.REPLAY_006,
      r3_49.REPLAY_007,
      r3_49.REPLAY_008,
      r3_49.REPLAY_009,
      r3_49.REPLAY_010,
      r3_49.REPLAY_011,
      r3_49.REPLAY_012,
      r3_49.REPLAY_013,
      r3_49.REPLAY_014,
      r3_49.REPLAY_015,
      r3_49.REPLAY_016,
      r3_49.REPLAY_017
    }
    local r6_49 = g_GalleryInfo.SceneThMax
    local r7_49 = r4_49[(r1_49 - 1) * r0_49.SceneMenu.ThAllMax + r2_49]
    if r7_49 == nil then
      return -1
    end
    local r8_49 = cfunc.LegacyGame__lua_GetFlag(r7_49)
    if true then
      return 1
    else
      return 0
    end
  end
  function r0_37.ScenePageInit(r0_50, r1_50, r2_50)
    -- line: [1883, 1980] id: 50
    for r6_50 = 1, r0_50.SceneMenu.PageMax, 1 do
      local r7_50 = "Page" .. tostring(r6_50)
      if r6_50 == r1_50 then
        r0_50.SceneMenu.DataPage[r7_50]:bt_SetActive(1)
      else
        r0_50.SceneMenu.DataPage[r7_50]:bt_SetActive(0)
      end
    end
    local r3_50 = 1
    local r4_50 = cclass.lua_Layers:create()
    if r2_50 == false then
      for r8_50 = 1, r0_50.SceneMenu.ThAllMax, 1 do
        if r0_50:GetSceneFlag(g_GalleryInfo.ScenePage, r8_50) == 1 then
          local r10_50 = 0
          local r11_50 = 0
          local r12_50 = r0_50.SceneMenu.LayerName
          lay_off = r0_50.SceneMenu.LayerNameOff
          r10_50, r11_50, r12_50, lay_off = r0_50:GetReplayThumbnailOnOff(g_GalleryInfo.ScenePage, r8_50)
          if r10_50 ~= -1 then
            r4_50:setSubLayerVisible(r0_50.MenuInf.SetName, r12_50, r10_50, 0)
          end
          if r11_50 ~= -1 then
            r4_50:setSubLayerVisible(r0_50.MenuInf.SetName, lay_off, r11_50, 0)
          end
        end
      end
    end
    local r5_50 = 1
    for r9_50 = 1, r0_50.SceneMenu.ThYLineMax, 1 do
      for r13_50 = 1, r0_50.SceneMenu.ThXLineMax, 1 do
        local r14_50 = r0_50:GetSceneFlag(r1_50, r5_50)
        local r15_50 = "TH" .. tostring(r5_50)
        if r14_50 == 1 then
          r0_50.SceneMenu.DataTh[r15_50]:bt_SetActive(0)
        end
        if r14_50 == 0 then
          r0_50.SceneMenu.DataTh[r15_50]:bt_SetActive(2)
        end
        if r14_50 == -1 then
          r0_50.SceneMenu.DataTh[r15_50]:bt_SetActive(3)
        end
        local r16_50 = -1
        local r17_50 = -1
        local r18_50 = 0
        local r19_50 = 0
        local r20_50 = r0_50.SceneMenu.LayerName
        lay_off = r0_50.SceneMenu.LayerNameOff
        r18_50, r19_50, r20_50, lay_off = r0_50:GetReplayThumbnailOnOff(r1_50, r5_50)
        if r14_50 == 1 then
          if r18_50 ~= -1 then
            r4_50:initSubLayer(r0_50.MenuInf.SetName, r20_50, r18_50, 0)
            if r16_50 ~= -1 and r17_50 ~= -1 then
              r4_50:setSubLayerParam(r0_50.MenuInf.SetName, r20_50, r18_50, LUA_PARAM_POS, r16_50, r17_50, 0, 0)
            end
            r4_50:setSubLayerVisible(r0_50.MenuInf.SetName, r20_50, r18_50, 0)
          end
          if r19_50 ~= -1 then
            r4_50:initSubLayer(r0_50.MenuInf.SetName, lay_off, r19_50, 0)
            if r16_50 ~= -1 and r17_50 ~= -1 then
              r4_50:setSubLayerParam(r0_50.MenuInf.SetName, lay_off, r19_50, LUA_PARAM_POS, r16_50, r17_50, 0, 0)
            end
            r4_50:setSubLayerVisible(r0_50.MenuInf.SetName, lay_off, r19_50, 1)
          end
        elseif r14_50 == 0 then
          if r18_50 ~= -1 then
            r4_50:initSubLayer(r0_50.MenuInf.SetName, r20_50, r18_50, 0)
            r4_50:setSubLayerVisible(r0_50.MenuInf.SetName, r20_50, r18_50, 0)
          end
          if r19_50 ~= -1 then
            r4_50:initSubLayer(r0_50.MenuInf.SetName, lay_off, r19_50, 0)
            r4_50:setSubLayerVisible(r0_50.MenuInf.SetName, lay_off, r19_50, 0)
          end
        end
        r5_50 = r5_50 + 1
      end
    end
    g_GalleryInfo.ScenePage = r1_50
  end
end
function GalleryBgmMenu(r0_51)
  -- line: [1988, 2272] id: 51
  r0_51.BgmMenu = {}
  r0_51.BgmMenu.BgmSoundList = {}
  r0_51.BgmMenu.DataPage = {}
  r0_51.BgmMenu.keyname = "GalleryBgm"
  r0_51.BgmMenu.FileName = "SYS_GalleryBGM.pna"
  r0_51.BgmMenu.BGM_SoundNo = 0
  r0_51.BgmMenu.BGM_Max = 32
  function r0_51.SetBgmNo(r0_52, r1_52)
    -- line: [2003, 2005] id: 52
    r0_52.BgmMenu.BGM_SoundNo = r1_52
  end
  function r0_51.GetBgmNo(r0_53)
    -- line: [2007, 2009] id: 53
    return r0_53.BgmMenu.BGM_SoundNo
  end
  function r0_51.InitBgmButton(r0_54, r1_54)
    -- line: [2012, 2046] id: 54
    r0_54.BgmMenu.BgmSoundList = {}
    local r2_54 = 1
    for r6_54 = 1, 2, 1 do
      for r10_54 = 1, 20, 1 do
        if r0_54.BgmMenu.BGM_Max < r2_54 then
          break
        else
          local r12_54 = 112 - r10_54 - 1 - (r6_54 - 1) * 22
          r0_54:MenuButtonSet(r0_54.BgmMenu.BgmSoundList, "S" .. tostring(r2_54), 1, r1_54, r12_54, r12_54, 74 - r10_54 - 1 - (r6_54 - 1) * 22, 36 - r10_54 - 1 - (r6_54 - 1) * 22, 150 - r10_54 - 1 - (r6_54 - 1) * 22, 300 + r2_54, 0, 0)
          r2_54 = r2_54 + 1
        end
      end
    end
    for r6_54 = 1, 2, 1 do
      local r8_54 = 164 - r6_54 - 1
      r0_54:MenuButtonSet(r0_54.BgmMenu.DataPage, "SPage" .. tostring(r6_54), 1, r1_54, r8_54, r8_54, 156 - r6_54 - 1, 160 - r6_54 - 1, -1, 100 + r6_54, 0, 0)
    end
  end
  function r0_51.InitBgmMenu(r0_55)
    -- line: [2049, 2069] id: 55
    local r1_55 = cclass.lua_Layers:create()
    r0_55:MenuLoadLayer(r0_55.BgmMenu.keyname, r0_55.BgmMenu.FileName)
    r1_55:setVisible(r0_55.MenuInf.SetName, r0_55.BgmMenu.keyname, 1)
    r0_55:InitBgmButton(r0_55.BgmMenu.keyname)
    r0_55.MenuButton:SetList("BT_BgmSoundList", r0_55.BgmMenu.BgmSoundList)
    r0_55.MenuButton:SetList("BT_DataPage", r0_55.BgmMenu.DataPage)
    r0_55:MenuButtonInit()
    r1_55:initSubLayer(r0_55.MenuInf.SetName, r0_55.BgmMenu.keyname, 172, 1)
    r1_55:initSubLayer(r0_55.MenuInf.SetName, r0_55.BgmMenu.keyname, 173, 1)
    r0_55:BGMPageInit(g_GalleryInfo.BgmPage, g_GalleryInfo.BgmPage, true)
    return r0_55.BgmMenu.keyname
  end
  function r0_51.GallerySetBgmButton(r0_56, r1_56)
    -- line: [2071, 2094] id: 56
    if r0_56.BgmMenu.BGM_SoundNo ~= 0 and r0_56:GetBgmPageEnable(g_GalleryInfo.BgmPage, r0_56.BgmMenu.BGM_SoundNo) == true then
      local r3_56 = "S" .. tostring(r0_56.BgmMenu.BGM_SoundNo)
      if r0_56.BgmMenu.BgmSoundList[r3_56] ~= nil then
        r0_56.BgmMenu.BgmSoundList[r3_56]:bt_SetActive(0)
      end
    end
    r0_56.BgmMenu.BgmSoundList["S" .. tostring(r1_56)]:bt_SetActive(1)
    r0_56.BT_DataBace.stop:bt_SetActive(0)
    local r3_56 = cclass.lua_Layers:create()
    local r4_56 = getEffectRate()
    r0_56.MenuInf.GalleryEff = true
    r0_56:GalleryBgmPlay(r1_56)
  end
  function r0_51.GalleryBgmPlay(r0_57, r1_57)
    -- line: [2096, 2138] id: 57
    r0_57.BgmMenu.BGM_SoundNo = r1_57
    cfunc.LegacyGame__lua_SetVariable(120, r0_57.BgmMenu.BGM_SoundNo)
    local r2_57 = {
      [1] = "bgm34.ogg",
      [2] = "bgm01.ogg",
      [3] = "bgm06.ogg",
      [4] = "bgm05.ogg",
      [5] = "bgm08.ogg",
      [6] = "bgm09.ogg",
      [7] = "bgm03.ogg",
      [8] = "bgm07.ogg",
      [9] = "bgm04.ogg",
      [10] = "bgm10.ogg",
      [11] = "bgm11.ogg",
      [12] = "bgm12.ogg",
      [13] = "bgm23.ogg",
      [14] = "bgm13.ogg",
      [15] = "bgm22.ogg",
      [16] = "bgm14.ogg",
      [17] = "bgm15.ogg",
      [18] = "bgm16.ogg",
      [19] = "bgm17.ogg",
      [20] = "bgm18.ogg",
      [21] = "bgm19.ogg",
      [22] = "bgm21.ogg",
      [23] = "bgm20.ogg",
      [24] = "bgm02.ogg",
      [25] = "bgm25.ogg",
      [26] = "bgm26.ogg",
      [27] = "bgm28b.ogg",
      [28] = "bgm29.ogg",
      [29] = "bgm30.ogg",
      [30] = "bgm27.ogg",
      [31] = "bgm24c1.ogg",
      [32] = "bgm31.ogg",
    }
    local r3_57 = cclass.lua_Sounds:new()
    r3_57:BgmPlay("systembgm", getSoundArcFileName("BGM", ".ogg"), r2_57[r1_57], getSoundVolume("BGM"))
    r3_57:delete()
  end
  function r0_51.GalleryBgmStop(r0_58)
    -- line: [2141, 2160] id: 58
    if r0_58.BgmMenu.BGM_SoundNo > 0 then
      if g_GalleryInfo.Page == 3 and r0_58:GetBgmPageEnable(g_GalleryInfo.BgmPage, r0_58.BgmMenu.BGM_SoundNo) then
        local r1_58 = "S" .. tostring(r0_58.BgmMenu.BGM_SoundNo)
        if r0_58.BgmMenu.BgmSoundList[r1_58] ~= nil then
          r0_58.BgmMenu.BgmSoundList[r1_58]:bt_SetActive(0)
        end
      end
      local r1_58 = cclass.lua_Sounds:new()
      r1_58:BgmStop("systembgm", 200)
      r1_58:delete()
      r0_58.BgmMenu.BGM_SoundNo = 0
      cfunc.LegacyGame__lua_SetVariable(120, r0_58.BgmMenu.BGM_SoundNo)
    end
  end
  function r0_51.GetBgmPageEnable(r0_59, r1_59, r2_59)
    -- line: [2163, 2181] id: 59
    if r1_59 > 2 then
      return false
    end
    if r1_59 == 1 and 20 < r2_59 then
      return false
    end
    if r1_59 == 2 and r2_59 <= 20 then
      return false
    end
    return true
  end
  function r0_51.GetBgmFlag(r0_60, r1_60, r2_60)
    -- line: [2184, 2217] id: 60
    local r3_60 = {
      BGM01 = 1050,
      BGM02 = 1051,
      BGM03 = 1052,
      BGM04 = 1053,
      BGM05 = 1054,
      BGM06 = 1055,
      BGM07 = 1056,
      BGM08 = 1057,
      BGM09 = 1058,
      BGM10 = 1059,
      BGM11 = 1060,
      BGM12 = 1061,
      BGM13 = 1062,
      BGM14 = 1063,
      BGM15 = 1064,
      BGM16 = 1065,
      BGM17 = 1066,
      BGM18 = 1067,
      BGM19 = 1068,
      BGM20 = 1069,
      BGM21 = 1070,
      BGM22 = 1071,
      BGM23 = 1072,
      BGM24 = 1073,
      BGM25 = 1074,
      BGM26 = 1075,
      BGM27 = 1076,
      BGM28 = 1077,
      BGM29 = 1078,
      BGM30 = 1079,
      BGM31 = 1080,
      BGM34 = 1081,
    }
    local r6_60 = ({
      r3_60.BGM34,
      r3_60.BGM01,
      r3_60.BGM06,
      r3_60.BGM05,
      r3_60.BGM08,
      r3_60.BGM09,
      r3_60.BGM03,
      r3_60.BGM07,
      r3_60.BGM04,
      r3_60.BGM10,
      r3_60.BGM11,
      r3_60.BGM12,
      r3_60.BGM23,
      r3_60.BGM13,
      r3_60.BGM22,
      r3_60.BGM14,
      r3_60.BGM15,
      r3_60.BGM16,
      r3_60.BGM17,
      r3_60.BGM18,
      r3_60.BGM19,
      r3_60.BGM21,
      r3_60.BGM20,
      r3_60.BGM02,
      r3_60.BGM25,
      r3_60.BGM26,
      r3_60.BGM28,
      r3_60.BGM29,
      r3_60.BGM30,
      r3_60.BGM27,
      r3_60.BGM24,
      r3_60.BGM31
    })[r2_60]
    if r6_60 == nil then
      return false
    end
    if cfunc.LegacyGame__lua_GetFlag(r6_60) then
      return true
    else
      return false
    end
  end
  function r0_51.BGMPageInit(r0_61, r1_61, r2_61, r3_61)
    -- line: [2220, 2249] id: 61
    g_GalleryInfo.BgmPage = r1_61
    if g_GalleryInfo.BgmPage == 1 then
      r0_61.BgmMenu.DataPage.SPage1:bt_SetActive(1)
      r0_61.BgmMenu.DataPage.SPage2:bt_SetActive(0)
    else
      r0_61.BgmMenu.DataPage.SPage1:bt_SetActive(0)
      r0_61.BgmMenu.DataPage.SPage2:bt_SetActive(1)
    end
    for r7_61 = 1, r0_61.BgmMenu.BGM_Max, 1 do
      local r8_61 = "S" .. tostring(r7_61)
      if r0_61:GetBgmPageEnable(r1_61, r7_61) then
        if r0_61:GetBgmFlag(r1_61, r7_61) then
          if r0_61.BgmMenu.BGM_SoundNo == r7_61 then
            r0_61.BgmMenu.BgmSoundList[r8_61]:bt_SetActive(1)
          else
            r0_61.BgmMenu.BgmSoundList[r8_61]:bt_SetActive(0)
          end
        else
          r0_61.BgmMenu.BgmSoundList[r8_61]:bt_SetActive(2)
        end
      else
        r0_61.BgmMenu.BgmSoundList[r8_61]:bt_SetActive(3)
      end
    end
  end
  function r0_51.GalleryBgmButtonJob(r0_62, r1_62)
    -- line: [2252, 2269] id: 62
    if 301 <= r1_62 and r1_62 <= 390 then
      r0_62.MenuButton.selDownCursor = -1
      r0_62.MenuButton.selDownKey = nil
      r0_62:GallerySetBgmButton(r1_62 - 300)
    end
    if r1_62 == 101 then
      r0_62:BGMPageInit(1, g_GalleryInfo.BgmPage, false)
    end
    if r1_62 == 102 then
      r0_62:BGMPageInit(2, g_GalleryInfo.BgmPage, false)
    end
  end
end
if g_EnableTips then
  function GalleryTipsMenu(r0_63)
    -- line: [2279, 2551] id: 63
    r0_63.TipsMenu = {}
    r0_63.TipsMenu.DataPage = {}
    r0_63.TipsMenu.keyname = "GalleryTips"
    r0_63.TipsMenu.FileName = "SYS_GalleryTips.pna"
    g_GalleryInfo.TipsPageMax = 4
    function r0_63.InitTipsButton(r0_64, r1_64)
      -- line: [2293, 2308] id: 64
      r0_64.TipsMenu.DataPage = {}
      for r5_64 = 1, g_GalleryInfo.TipsPageMax, 1 do
        local r7_64 = 130 - r5_64 - 1
        r0_64:MenuButtonSet(r0_64.TipsMenu.DataPage, "P" .. tostring(r5_64), 1, r1_64, r7_64, r7_64, 106 - r5_64 - 1, 118 - r5_64 - 1, -1, 100 + r5_64, 0, 0)
      end
    end
    function r0_63.TipsMouseMove(r0_65, r1_65, r2_65, r3_65, r4_65, r5_65, r6_65)
      -- line: [2311, 2313] id: 65
    end
    function r0_63.DeleteTipsThumbnail(r0_66, r1_66)
      -- line: [2316, 2321] id: 66
      if r1_66 ~= -1 then
        local r2_66 = cclass.lua_Layers:create()
      end
    end
    function r0_63.LoadTipsThumbnail(r0_67, r1_67)
      -- line: [2325, 2327] id: 67
    end
    function r0_63.InitTipsMenu(r0_68)
      -- line: [2330, 2355] id: 68
      local r1_68 = cclass.lua_Layers:create()
      r0_68:MenuLoadLayer(r0_68.TipsMenu.keyname, r0_68.TipsMenu.FileName)
      r1_68:swapLayerOrder("Gallery", "GalleryBace", r0_68.TipsMenu.keyname)
      r1_68:setVisible(r0_68.MenuInf.SetName, r0_68.TipsMenu.keyname, 1)
      r0_68:InitTipsButton(r0_68.TipsMenu.keyname)
      r0_68.MenuButton:SetList("BT_DataPage", r0_68.TipsMenu.DataPage)
      r0_68:MenuButtonInit()
      r1_68:initSubLayer(r0_68.MenuInf.SetName, r0_68.TipsMenu.keyname, 133, 1)
      r0_68:TipsPageInit(g_GalleryInfo.TipsPage, -1, true)
      return r0_68.TipsMenu.keyname
    end
    function r0_63.DeleteTipsMenu(r0_69)
      -- line: [2359, 2363] id: 69
      cclass.lua_Layers:create():removeLayer(r0_69.MenuInf.SetName, r0_69.TipsMenu.keyname)
    end
    function r0_63.TipsThumbnailEffect(r0_70, r1_70, r2_70, r3_70, r4_70, r5_70)
      -- line: [2366, 2388] id: 70
    end
    function r0_63.TipsLayer(r0_71, r1_71, r2_71)
      -- line: [2392, 2406] id: 71
      local r3_71 = -1
      local r4_71 = -1
      if r1_71 == 4 then
        if r2_71 <= 7 then
          r3_71 = 19 - r2_71 - 1
          r4_71 = 10 - r2_71 - 1
        end
      else
        r3_71 = 91 - r2_71 - 1 - 24 * (r1_71 - 1)
        r4_71 = 80 - r2_71 - 1 - 24 * (r1_71 - 1)
      end
      return r3_71, r4_71
    end
    function r0_63.TipsPageInit(r0_72, r1_72, r2_72, r3_72)
      -- line: [2409, 2459] id: 72
      g_GalleryInfo.TipsPage = r1_72
      local r4_72 = cclass.lua_Layers:create()
      for r8_72 = 1, g_GalleryInfo.TipsPageMax, 1 do
        local r9_72 = "P" .. tostring(g_GalleryInfo.TipsPage)
        for r13_72, r14_72 in pairs(r0_72.TipsMenu.DataPage) do
          if r14_72.arg == r9_72 then
            r14_72:bt_SetActive(1)
          else
            r14_72:bt_SetActive(0)
          end
        end
      end
      for r8_72 = 1, 9, 1 do
        if r2_72 ~= -1 then
          lay_dis, lay_def = r0_72:TipsLayer(r2_72, r8_72)
          if lay_dis ~= -1 then
            r4_72:setSubLayerVisible(r0_72.MenuInf.SetName, r0_72.TipsMenu.keyname, lay_dis, 0)
          end
          if lay_def ~= -1 then
            r4_72:setSubLayerVisible(r0_72.MenuInf.SetName, r0_72.TipsMenu.keyname, lay_def, 0)
          end
        end
        lay_dis, lay_def = r0_72:TipsLayer(r1_72, r8_72)
        local r9_72 = r0_72:GetTipsFlag(r1_72, r8_72)
        if r9_72 == 1 and lay_def ~= -1 then
          r4_72:initSubLayer(r0_72.MenuInf.SetName, r0_72.TipsMenu.keyname, lay_def, 0)
          r4_72:setSubLayerVisible(r0_72.MenuInf.SetName, r0_72.TipsMenu.keyname, lay_def, 1)
        end
        if r9_72 == 0 and lay_dis ~= -1 then
          r4_72:initSubLayer(r0_72.MenuInf.SetName, r0_72.TipsMenu.keyname, lay_dis, 0)
          r4_72:setSubLayerVisible(r0_72.MenuInf.SetName, r0_72.TipsMenu.keyname, lay_dis, 1)
        end
      end
      r0_72:DeleteTipsThumbnail(r2_72)
      r0_72:LoadTipsThumbnail(r1_72)
    end
    function r0_63.GalleryTipsButtonJob(r0_73, r1_73)
      -- line: [2462, 2474] id: 73
      if 401 <= r1_73 and r1_73 <= 430 then
        local r2_73 = r1_73 - 400
        r0_73.MenuButton.selDownCursor = -1
        r0_73.MenuButton.selDownKey = nil
      end
      if 101 <= r1_73 and r1_73 <= 110 then
        r0_73:TipsPageInit(r1_73 - 100, g_GalleryInfo.TipsPage, false)
      end
    end
    function r0_63.GetTipsFlag(r0_74, r1_74, r2_74)
      -- line: [2479, 2549] id: 74
      local r3_74 = {
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
      local r4_74 = {
        {
          r3_74.TIPS_001,
          r3_74.TIPS_002,
          r3_74.TIPS_003,
          r3_74.TIPS_004,
          r3_74.TIPS_005,
          r3_74.TIPS_007,
          r3_74.TIPS_006,
          r3_74.TIPS_008,
          r3_74.TIPS_009
        },
        {
          r3_74.TIPS_010,
          r3_74.TIPS_011,
          r3_74.TIPS_012,
          r3_74.TIPS_013,
          r3_74.TIPS_014,
          r3_74.TIPS_015,
          r3_74.TIPS_016,
          r3_74.TIPS_017,
          r3_74.TIPS_018
        },
        {
          r3_74.TIPS_019,
          r3_74.TIPS_020,
          r3_74.TIPS_021,
          r3_74.TIPS_022,
          r3_74.TIPS_023,
          r3_74.TIPS_024,
          r3_74.TIPS_025,
          r3_74.TIPS_026,
          r3_74.TIPS_027
        },
        {
          r3_74.TIPS_028,
          r3_74.TIPS_029,
          r3_74.TIPS_030,
          r3_74.TIPS_031,
          r3_74.TIPS_032,
          r3_74.TIPS_033,
          r3_74.TIPS_034,
          nil,
          nil
        }
      }
      local r5_74 = 0
      if r4_74[r1_74][r2_74] ~= nil then
        if cfunc.LegacyGame__lua_GetFlag(r4_74[r1_74][r2_74]) then
          r5_74 = 1
        else
          r5_74 = 0
        end
      else
        r5_74 = -1
      end
      return r5_74
    end
  end
end
if g_EnableNMS then
  function GetNmsThumbnailNo(r0_75)
    -- line: [2570, 2584] id: 75
    local r1_75 = 183 + r0_75
    local r2_75 = 1 + r0_75
    if cfunc.LegacyGame__lua_GetFlag(1005) and 180 <= r0_75 then
      r1_75 = 183 + r0_75 - 180
      r2_75 = 1 + r0_75 - 180
    end
    return r1_75, r2_75
  end
  function GalleryNmsMenu(r0_76)
    -- line: [2591, 4748] id: 76
    r0_76.NmsMenu = {}
    r0_76.NmsMenu.keyname = "NmsBace"
    r0_76.NmsMenu.FileName = "sys_nms.pna"
    r0_76.NmsMenu.ThumbOnNo = -1
    r0_76.NmsMenu.ExpTextNo = 0
    r0_76.NmsMenu.SlideFlag = 0
    r0_76.NmsMenu.BarMoveNo = -1
    r0_76.NmsMenu.ItemNMS = {}
    r0_76.NmsMenu.StandbyDragFlag = false
    r0_76.NmsMenu.StandbyDragParam = {}
    r0_76.NmsMenu.ENTRY_MAX = 250
    r0_76.NmsMenu.DropRepeatArg = 0
    r0_76.NmsMenu.DropRepeatTime = 0
    r0_76.NmsMenu.TH_PosLayer = 59
    r0_76.NmsSubKey = {}
    r0_76.NmsSubKey.NmsThTitle = "NmsThTitle"
    r0_76.NmsSubKey.NmsTitle = "NmsTitle"
    r0_76.NmsSubKey.NmsNo = "NmsNo"
    r0_76.NmsSubKey.NmsThumb = "NmsThumb"
    r0_76.NmsSubKey.NmsListTh = "NmsListTh"
    r0_76.NmsSubKey.NmsIconTh = "NmsIconTh"
    r0_76.NmsSubKey.PNmsThumb = "PNmsThumb"
    r0_76.NmsSubKey.PNmsListTh = "PNmsListTh"
    r0_76.NmsMenu.NmsButton = {}
    r0_76.NmsMenu.NmsEntry = {}
    r0_76.NmsMenu.NmsDrop = {}
    function r0_76.NmsMenuInitParam(r0_77)
      -- line: [2652, 2655] id: 77
      g_NmsData.THP_Slide = 0
      g_NmsData.THP_Param = 0
    end
    function r0_76.nmsGetTitleTextName(r0_78, r1_78)
      -- line: [2658, 2664] id: 78
      if r1_78 == -1 then
        return r0_78.NmsSubKey.NmsThTitle
      end
      return string.format("NmsTitle%03d", r1_78)
    end
    function r0_76.nmsCreateTitleLayer(r0_79)
      -- line: [2667, 2674] id: 79
      local r1_79 = cclass.lua_Layers:create()
      r1_79:insertTextLayer(r0_79.MenuInf.SetName, r0_79.NmsSubKey.NmsThTitle, 350, 32, 2, 2, 2, 2, 0, 1)
      for r5_79 = 0, 9, 1 do
        r1_79:insertTextLayer(r0_79.MenuInf.SetName, r0_79:nmsGetTitleTextName(r5_79), 350, 32, 2, 2, 2, 2, 0, 1)
      end
    end
    function r0_76.nmsDeleteTitleLayer(r0_80)
      -- line: [2677, 2683] id: 80
      local r1_80 = cclass.lua_Layers:create()
      for r5_80 = 0, 9, 1 do
        r1_80:removeLayer(r0_80.MenuInf.SetName, r0_80:nmsGetTitleTextName(r5_80))
      end
    end
    function r0_76.nmsSetTitle(r0_81, r1_81, r2_81)
      -- line: [2686, 2696] id: 81
      local r3_81 = cclass.lua_Layers:create()
      local r4_81 = r0_81:nmsGetTitleTextName(r1_81)
      r3_81:clearText(r0_81.MenuInf.SetName, r4_81)
      if r2_81 ~= nil and r2_81 ~= -1 then
        r3_81:setText(r0_81.MenuInf.SetName, r4_81, g_nmsTitleList[r2_81], g_NmsFonts.name, g_NmsFonts.size, 0, 0, 4294967295, 255)
      end
    end
    r0_76.nmsDrawThumbKeyNo = {}
    function r0_76.InitNmsMenu(r0_82)
      -- line: [2700, 2956] id: 82
      NmsSLMenuInitSaveData()
      g_NmsData.OneInit = true
      NmsMenuLoadBookMark()
      local r1_82 = cclass.lua_Layers:create()
      r0_82:MenuLoadLayer(r0_82.NmsMenu.keyname, r0_82.NmsMenu.FileName)
      r0_82:MenuLoadLayer(r0_82.NmsSubKey.NmsNo, "sys_nms_no.pna")
      r0_82:MenuLoadLayer(r0_82.NmsSubKey.NmsThumb, "sys_nms_th.pna")
      r0_82:MenuLoadLayer(r0_82.NmsSubKey.NmsListTh, "sys_nms_th.pna")
      r0_82:nmsCreateTitleLayer()
      if r0_82.PatchFlag then
        r0_82:MenuLoadLayer(r0_82.NmsSubKey.PNmsThumb, "Psys_nms_th.pna")
        r0_82:MenuLoadLayer(r0_82.NmsSubKey.PNmsListTh, "Psys_nms_th.pna")
      end
      r0_82:MenuLoadLayer(r0_82.NmsSubKey.NmsIconTh, "sys_nms_ic.pna")
      r1_82:initSubLayer(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, 121, 1)
      r1_82:initSubLayer(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, 124, 1)
      r1_82:initSubLayer(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, 37, 1)
      r1_82:initSubLayer(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, 189, 1)
      r1_82:initSubLayer(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, 219, 1)
      r1_82:initSubLayer(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, 216, 1)
      r1_82:initSubLayer(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, 217, 1)
      local r2_82 = 0
      local r3_82 = 0
      local r4_82 = 0
      local r5_82 = 0
      r2_82 = 281
      r3_82 = 168
      r1_82:setParam(r0_82.MenuInf.SetName, r0_82.NmsSubKey.NmsListTh, LUA_PARAM_POS, r2_82, r3_82, r4_82, r5_82)
      if r0_82.PatchFlag then
        r1_82:setParam(r0_82.MenuInf.SetName, r0_82.NmsSubKey.PNmsListTh, LUA_PARAM_POS, r2_82, r3_82, r4_82, r5_82)
      end
      r0_82.NmsMenu.NmsButton = {}
      local r6_82 = r0_82.NmsMenu.NmsButton
      r0_82:MakeYSlideBar(r6_82, "SL_Bar1", 1, r0_82.NmsMenu.keyname, 115, 116, 200, 0, 0)
      r0_82:MenuButtonSet(r6_82, "SL_BarBk1", 1, r0_82.NmsMenu.keyname, 118, -1, -1, -1, -1, 201, 0, -1)
      r0_82.NmsMenu.NmsButton.SL_BarBk1.se_click = -1
      r0_82:MenuButtonSet(r6_82, "SL_Bar1Up", 1, r0_82.NmsMenu.keyname, 106, 106, 107, -1, 108, 202, 0, 0)
      r0_82:MenuButtonSet(r6_82, "SL_Bar1Do", 1, r0_82.NmsMenu.keyname, 111, 111, 112, -1, 113, 203, 0, 0)
      r0_82:MakeYSlideBar(r6_82, "SL_Bar2", 1, r0_82.NmsMenu.keyname, 183, 184, 210, 0, 0)
      r0_82:MenuButtonSet(r6_82, "SL_BarBk2", 1, r0_82.NmsMenu.keyname, 186, -1, -1, -1, -1, 211, 0, -1)
      r0_82.NmsMenu.NmsButton.SL_BarBk2.se_click = -1
      r0_82:MenuButtonSet(r6_82, "SL_Bar2Up", 1, r0_82.NmsMenu.keyname, 174, 174, 175, -1, 176, 212, 0, 0)
      r0_82:MenuButtonSet(r6_82, "SL_Bar2Do", 1, r0_82.NmsMenu.keyname, 179, 179, 180, -1, 181, 213, 0, 0)
      r0_82:MenuButtonSet(r6_82, "TH_Reset", 1, r0_82.NmsMenu.keyname, 42, 42, 47, -1, 52, 110, 0, 0)
      r0_82:MenuButtonSet(r6_82, "TH_AllSet", 1, r0_82.NmsMenu.keyname, 43, 43, 48, -1, 53, 111, 0, 0)
      r0_82:MenuButtonSet(r6_82, "TH_Entry", 1, r0_82.NmsMenu.keyname, 44, 44, 49, -1, 54, 112, 0, 0)
      r0_82:MenuButtonSet(r6_82, "TH_AllPlay", 1, r0_82.NmsMenu.keyname, 127, 127, 128, -1, 129, 120, 0, 0)
      for r10_82 = 1, 9, 1 do
        local r12_82 = 71 + r10_82 - 1
        local r14_82 = -1
        r0_82:MenuButtonSet(r6_82, "TH_" .. tostring(r10_82), 1, r0_82.NmsMenu.keyname, r12_82, r12_82, 82 + r10_82 - 1, -1, 93 + r10_82 - 1, 700 + r10_82 - 1, 0, -1)
        r12_82 = 54 + (r10_82 - 1) * 5
        r0_82:MenuButtonSet(r6_82, "TH_" .. tostring(r10_82) .. "play", 1, r0_82.NmsSubKey.NmsIconTh, r12_82, r12_82, 55 + (r10_82 - 1) * 5, -1, -1, 800 + r10_82 - 1, 0, 1)
        r12_82 = 7 + (r10_82 - 1) * 5
        r0_82:MenuButtonSet(r6_82, "TH_" .. tostring(r10_82) .. "bmk", 1, r0_82.NmsSubKey.NmsIconTh, r12_82, r12_82, 8 + (r10_82 - 1) * 5, 9 + (r10_82 - 1) * 5, -1, 900 + r10_82 - 1, 0, 1)
        r0_82.nmsDrawThumbKeyNo[r10_82] = {
          key = -1,
          no = -1,
        }
      end
      r0_82:MenuButtonSet(r6_82, "EN_Load", 1, r0_82.NmsMenu.keyname, 24, 24, 29, -1, 34, 170, 0, 0)
      r0_82:MenuButtonSet(r6_82, "EN_Save", 1, r0_82.NmsMenu.keyname, 23, 23, 28, -1, 33, 171, 0, 0)
      r0_82:MenuButtonSet(r6_82, "EN_Reset", 1, r0_82.NmsMenu.keyname, 22, 22, 27, -1, 32, 172, 0, 0)
      r0_82:MenuButtonSet(r6_82, "EN_PlayTW", 1, r0_82.NmsMenu.keyname, 9, 9, 13, -1, 17, 181, 0, 0)
      r0_82:MenuButtonSet(r6_82, "EN_PlayTT", 1, r0_82.NmsMenu.keyname, 8, 8, 12, -1, 16, 180, 0, 0)
      r0_82:MenuButtonSet(r6_82, "EN_bmk", 1, r0_82.NmsSubKey.NmsIconTh, 1, 1, 2, 3, -1, 190, 0, 1)
      r0_82.NmsMenu.NmsEntry = {}
      local r7_82 = r0_82.NmsMenu.NmsEntry
      for r11_82 = 0, 9, 1 do
        local r13_82 = 137 + r11_82
        r0_82:MenuButtonSet(r7_82, "EN_List" .. tostring(r11_82), 1, r0_82.NmsMenu.keyname, r13_82, r13_82, 149 + r11_82, 161 + r11_82, -1, 130 + r11_82, 150 + r11_82, 0)
      end
      r0_82.NmsMenu.NmsDrop = {}
      local r8_82 = r0_82.NmsMenu.NmsDrop
      r0_82:MenuButtonSet(r8_82, "EntryDrop", 1, r0_82.NmsMenu.keyname, 134, -1, 133, -1, -1, 500, 0, -1)
      r0_82:MenuButtonSet(r8_82, "DropListUp", 1, r0_82.NmsSubKey.NmsIconTh, 100, -1, 100, -1, -1, 501, 0, 0)
      r0_82:MenuButtonSet(r8_82, "DropListDown", 1, r0_82.NmsSubKey.NmsIconTh, 101, -1, 101, -1, -1, 502, 0, 0)
      for r12_82 = 0, 10, 1 do
        r0_82:MenuButtonSet(r8_82, "DropBetween" .. tostring(r12_82), 1, r0_82.NmsSubKey.NmsIconTh, 117 + r12_82, -1, 104 + r12_82, -1, -1, 400 + r12_82, 0, 0)
      end
      r0_82.MenuButton:SetList("BT_NmsButton", r6_82)
      r0_82.MenuButton:SetList("BT_NmsEntry", r7_82)
      r0_82.MenuButton:SetDropList("BT_NmsDrop", r8_82)
      r0_82:MenuButtonInit()
      r0_82.NmsMenu.ItemNMS = r0_82:ItemSetInit()
      r0_82.NmsMenu.ItemNMS.expSL_Bar1 = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 213)
      r0_82.NmsMenu.ItemNMS.expSL_Bar2 = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 210)
      r0_82.NmsMenu.ItemNMS.expTH_Reset = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 209)
      r0_82.NmsMenu.ItemNMS.expTH_AllSet = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 208)
      r0_82.NmsMenu.ItemNMS.expTH_Entry = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 207)
      r0_82.NmsMenu.ItemNMS.expTH_AllPlay = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 206)
      r0_82.NmsMenu.ItemNMS.expEN_Load = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 214)
      r0_82.NmsMenu.ItemNMS.expEN_Save = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 211)
      r0_82.NmsMenu.ItemNMS.expEN_Reset = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 203)
      r0_82.NmsMenu.ItemNMS.expEN_PlayTT = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 201)
      r0_82.NmsMenu.ItemNMS.expEN_PlayTW = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 202)
      r0_82.NmsMenu.ItemNMS.expTH_X_bmk = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 200)
      r0_82.NmsMenu.ItemNMS.expTH_X_bmkRE = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 199)
      r0_82.NmsMenu.ItemNMS.expTH_X_max = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 198)
      r0_82.NmsMenu.ItemNMS.expTH_X = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 197)
      r0_82.NmsMenu.ItemNMS.expTH_X_Play = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 196)
      r0_82.NmsMenu.ItemNMS.expEN_List_X = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 195)
      r0_82.NmsMenu.ItemNMS.expEntryDrop = MenuItem.new(r0_82.MenuInf.SetName, r0_82.NmsMenu.keyname, -1, 194)
      r0_82:StartSetParam()
      r0_82:InitEntryTextSur()
      r0_82:InitNumEntryTextSur()
      r0_82.NmsMenu.NmsButton.SL_Bar1:bt_SlidebarYInit(g_NmsData.THP_Param, 3, 20, 118, 119)
      r0_82.NmsMenu.NmsButton.SL_Bar2:bt_SlidebarYInit(g_NmsData.Param, 10, 20, 186, 187)
      r0_82:SetthumbBarParam(g_NmsData.THP_Slide, g_NmsData.THP_Param)
      r0_82:InitEntryList()
      r0_82:SetEntryText()
      r0_82:SetNumEntryTextSur()
      r0_82:SetThumb()
      r0_82:ThumbOn(-1)
      return r0_82.NmsMenu.keyname
    end
    function r0_76.ItemSetInit(r0_83)
      -- line: [2959, 2965] id: 83
      return {
        selCursor_selName = -1,
        selCursor_Conf = -1,
      }
    end
    function r0_76.ItemSet(r0_84, r1_84, r2_84, r3_84, r4_84)
      -- line: [2966, 2988] id: 84
      r1_84.selCursor_selName = r2_84
      if r1_84.selCursor_Item ~= -1 then
        r1_84.selCursor_Item = -1
      end
      if r1_84.selCursor_Conf ~= -1 then
        r1_84.selCursor_Conf:SetAct("def")
        r1_84.selCursor_Conf = -1
      end
      if r3_84 ~= -1 then
      end
      if r4_84 ~= -1 then
        r1_84.selCursor_Conf = r1_84[r4_84]
        r1_84.selCursor_Conf:SetAct("on")
      end
    end
    function r0_76.DeleteNmsMenu(r0_85)
      -- line: [2992, 3008] id: 85
      local r1_85 = cclass.lua_Layers:create()
      r1_85:removeLayer(r0_85.MenuInf.SetName, r0_85.NmsMenu.keyname)
      for r5_85, r6_85 in pairs(r0_85.NmsSubKey) do
        r1_85:removeLayer(r0_85.MenuInf.SetName, r6_85)
      end
      r0_85:nmsDeleteTitleLayer()
      for r5_85 = 1, 3, 1 do
        r1_85:removeLayer(r0_85.MenuInf.SetName, r0_85.NmsSubKey.NmsNo .. tostring(r5_85))
      end
    end
    function r0_76.NmsButtonJob(r0_86, r1_86, r2_86, r3_86, r4_86)
      -- line: [3017, 3342] id: 86
      if r1_86 ~= 0 and r2_86 == "LD" then
        if 700 <= r1_86 and r1_86 <= 709 then
          r0_86:StandbyDrag(r1_86 - 700 + 1, false, r3_86, r4_86)
        end
        if 800 <= r1_86 and r1_86 <= 809 then
          local r5_86 = r1_86 - 800 + 1
        end
        if 900 <= r1_86 and r1_86 <= 909 then
          local r5_86 = r1_86 - 900 + 1
        end
        if 130 <= r1_86 and r1_86 <= 139 and 2 <= g_NmsData.Param then
          r0_86:StandbyDrag(r1_86 - 130 + 1 + g_NmsData.Slide, true, r3_86, r4_86)
        end
        if r1_86 == 200 then
          r0_86.NmsMenu.BarMoveNo = 1
        end
        if r1_86 == 210 then
          r0_86.NmsMenu.BarMoveNo = 2
        end
      end
      if r2_86 == "LU" then
        if r0_86.NmsMenu.BarMoveNo == 1 then
          local r5_86 = r0_86.NmsMenu.NmsButton.SL_Bar1
          r5_86:bt_SetParamY(r5_86:bt_GetParamY())
          r0_86.NmsMenu.BarMoveNo = -1
          r0_86:SetThumb()
        end
        if r0_86.NmsMenu.BarMoveNo == 2 then
          local r5_86 = r0_86.NmsMenu.NmsButton.SL_Bar2
          r5_86:bt_SetParamY(r5_86:bt_GetParamY())
          r0_86.NmsMenu.BarMoveNo = -1
        end
        local r5_86 = 0
        if r0_86.MenuButton.selCursor ~= -1 then
          r5_86 = r0_86.MenuButton.selListKey[r0_86.MenuButton.selCursor].bt_l
        end
        r0_86:ThumbDragEnd(r5_86, r3_86, r4_86)
      end
      if r1_86 ~= 0 and r2_86 == "LU" then
        if nil and not nil then
          goto label_109	-- block#30 is visited secondly
        end
        if 130 <= r1_86 and r1_86 <= 139 then
          g_NmsData.Act = r1_86 - 130 + 1 + g_NmsData.Slide
          r0_86:SetEntryBarParam(r0_86.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY(), g_NmsData.Param)
          r0_86:EntryTh(-1)
        end
        if r1_86 == 201 then
          local r5_86 = r0_86.NmsMenu.NmsButton.SL_BarBk1.EVENT_RECT.h / (g_NmsData.THP_Param + 1 - r0_86.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PSIZE_Y)
          local r6_86 = r4_86 - r0_86.NmsMenu.NmsButton.SL_BarBk1.DRAW_POS.y
          if r6_86 < 0 then
            r6_86 = 0
          end
          r0_86:SetthumbBarParam(math.floor(r6_86 / r5_86), g_NmsData.THP_Param)
          r0_86:SetThumb()
        end
        if r1_86 == 202 then
          r0_86:SetthumbBarParam(r0_86.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PAR_Y - 1, g_NmsData.THP_Param)
          r0_86:SetThumb()
        end
        if r1_86 == 203 then
          r0_86:SetthumbBarParam(r0_86.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PAR_Y + 1, g_NmsData.THP_Param)
          r0_86:SetThumb()
        end
        if r1_86 == 211 then
          local r5_86 = r0_86.NmsMenu.NmsButton.SL_BarBk2.EVENT_RECT.h / (g_NmsData.Param + 1 - r0_86.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PSIZE_Y)
          local r6_86 = r4_86 - r0_86.NmsMenu.NmsButton.SL_BarBk2.DRAW_POS.y
          if r6_86 < 0 then
            r6_86 = 0
          end
          local r7_86 = math.floor(r6_86 / r5_86)
          r0_86.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(r7_86)
          r0_86:SetEntryBarParam(r7_86, g_NmsData.Param)
        end
        if r1_86 == 212 then
          local r5_86 = r0_86.NmsMenu.NmsButton.SL_Bar2
          local r6_86 = r5_86.MOVABLE.PAR_Y - 1
          r5_86:bt_SetParamY(r6_86)
          r0_86:SetEntryBarParam(r6_86, g_NmsData.Param)
        end
        if r1_86 == 213 then
          local r5_86 = r0_86.NmsMenu.NmsButton.SL_Bar2
          local r6_86 = r5_86.MOVABLE.PAR_Y + 1
          r5_86:bt_SetParamY(r6_86)
          r0_86:SetEntryBarParam(r6_86, g_NmsData.Param)
        end
        if r1_86 == 110 then
          NmsMenuSetBookMarkAll(0)
          r0_86:EntryTh(-1)
          r0_86:SetThumb()
        end
        if r1_86 == 111 then
          NmsMenuSetBookMarkAll(1)
          r0_86:EntryTh(-1)
          r0_86:SetThumb()
        end
        if r1_86 == 112 then
          for r8_86 = 1, #g_NmsData.THP_List, 1 do
            if g_NmsData.THP_ListEnable[r8_86] == true then
              local r9_86 = g_NmsData.THP_List[r8_86] + 1
              if g_NmsData.THP_BookMark[r9_86] == 1 then
                local r10_86 = g_NmsData.Act
                if r10_86 == -1 then
                  r10_86 = 0
                end
                if r0_86:AddEntryList(r10_86 + 1, r9_86 - 1) == false then
                  break
                end
              end
            end
          end
        end
        if r1_86 == 120 then
          g_NmsPlay.Slide = 0
          g_NmsPlay.List = {}
          g_NmsPlay.Act = 1
          g_NmsPlay.Param = 0
          for r8_86 = 1, #g_NmsData.THP_List, 1 do
            if g_NmsData.THP_ListEnable[r8_86] == true then
              g_NmsPlay.Param = g_NmsPlay.Param + 1
              g_NmsPlay.List[g_NmsPlay.Param] = g_NmsData.THP_List[r8_86]
            end
          end
          r0_86:endMenu(1000, 1)
        end
        if r1_86 == 170 then
          r0_86:endMenu(-10, 1)
        end
        if r1_86 == 171 then
          r0_86:endMenu(-20, 1)
        end
        if r1_86 == 172 then
          NmsMenuInitENP()
          r0_86:InitEntryList()
        end
        if r1_86 == 180 then
          g_NmsPlay.Slide = 0
          g_NmsPlay.List = g_NmsData.List
          g_NmsPlay.Act = 1
          g_NmsPlay.Param = g_NmsData.Param
          r0_86:endMenu(2000, 1)
        end
        if r1_86 == 181 then
          g_NmsPlay.Slide = g_NmsData.Slide
          g_NmsPlay.List = g_NmsData.List
          g_NmsPlay.Act = g_NmsData.Act
          g_NmsPlay.Param = g_NmsData.Param
          r0_86:endMenu(3000, g_NmsData.Act)
        end
        if r1_86 == 190 then
          local r5_86 = g_NmsData.List[g_NmsData.Act] + 1
          if g_NmsData.THP_BookMark[r5_86] == 0 then
            g_NmsData.THP_BookMark[r5_86] = 1
          else
            g_NmsData.THP_BookMark[r5_86] = 0
          end
          NmsMenuSaveBookMark()
          r0_86:EntryTh(-1)
          r0_86:SetThumb()
          r0_86.NmsMenu.ExpTextNo = 0
        end
        if 800 <= r1_86 and r1_86 <= 808 then
          local r5_86 = r1_86 - 800 + g_NmsData.THP_Slide * 3 + 1
          g_NmsPlay.Slide = 0
          g_NmsPlay.List = {}
          g_NmsPlay.List[1] = g_NmsData.THP_List[r5_86]
          g_NmsPlay.Act = 1
          g_NmsPlay.Param = 1
          r0_86:endMenu(g_NmsData.THP_List[r5_86], 1)
        end
        if 900 <= r1_86 and r1_86 <= 908 then
          local r6_86 = g_NmsData.THP_List[r1_86 - 900 + g_NmsData.THP_Slide * 3 + 1] + 1
          if g_NmsData.THP_BookMark[r6_86] == 0 then
            g_NmsData.THP_BookMark[r6_86] = 1
          else
            g_NmsData.THP_BookMark[r6_86] = 0
          end
          NmsMenuSaveBookMark()
          r0_86:EntryTh(-1)
          r0_86:SetThumb()
          r0_86.NmsMenu.ExpTextNo = 0
        end
        if r1_86 == 999 then
          r0_86:endMenu(-1, -1)
        end
        if r1_86 == 1000 then
        end
      end
      if r2_86 == "RU" then
        r0_86:DelEntryList(r1_86 - 150 + 1 + g_NmsData.Slide)
        local r7_86 = cclass.lua_Layers:create():getCursorPos(r0_86.MenuInf.SetName, r3_86, r4_86, 0) - 1
        r0_86.MenuButton:changeButton(r0_86.MenuInf.SetName, r7_86, r3_86, r4_86)
        r0_86:SetEntryBarParam(r0_86.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY(), g_NmsData.Param)
        r0_86:SetThumbTitle()
        r0_86:defaultMenuMouseMove(r0_86.MenuInf.SetName, -1, r7_86, r3_86, r4_86, false)
        local r10_86 = -1
        for r14_86 = 0, 9, 1 do
          if r0_86.MenuButton.selCursor == "EN_List" .. tostring(r14_86) then
            r10_86 = r14_86
            break
          end
        end
        r0_86:EntryTh(r10_86)
      end
    end
    function r0_76.InitEntryTextSur(r0_87)
      -- line: [3358, 3364] id: 87
      local r1_87 = cclass.lua_Layers:create()
      for r5_87 = 0, 9, 1 do
        r0_87:nmsSetTitle(r5_87, -1)
      end
    end
    function r0_76.SetEntryText(r0_88)
      -- line: [3367, 3423] id: 88
      local r1_88 = cclass.lua_Layers:create()
      local r2_88 = ""
      local r3_88 = g_NmsData.Param
      for r7_88 = 0, 9, 1 do
        local r8_88 = "EN_List" .. tostring(r7_88)
        if r0_88.NmsMenu.NmsEntry[r8_88].active == 0 or r0_88.NmsMenu.NmsEntry[r8_88].active == 4 then
          r0_88:nmsSetTitle(r7_88, g_NmsData.List[r7_88 + g_NmsData.Slide + 1] + 1)
          local r10_88 = r0_88:nmsGetTitleTextName(r7_88)
          r1_88:setParam(r0_88.MenuInf.SetName, r10_88, LUA_PARAM_POS, r0_88.NmsMenu.NmsEntry[r8_88].DRAW_POS.x + 5, r0_88.NmsMenu.NmsEntry[r8_88].DRAW_POS.y, 0, 0)
          if r0_88.DD_Param.no ~= -1 then
            r1_88:swapLayerOrder(r0_88.MenuInf.SetName, "NmsDragTh", r10_88)
          end
        else
          r0_88:nmsSetTitle(r7_88, -1)
        end
      end
    end
    function r0_76.InitNumEntryTextSur(r0_89)
      -- line: [3427, 3434] id: 89
      local r1_89 = cclass.lua_Layers:create()
      for r5_89 = 0, 9, 1 do
        r1_89:initSubLayer(r0_89.MenuInf.SetName, r0_89.NmsSubKey.NmsNo, r5_89, 0)
      end
    end
    function r0_76.SetNumEntryTextSur(r0_90)
      -- line: [3437, 3462] id: 90
      local r1_90 = cclass.lua_Layers:create()
      local r2_90 = {
        [1] = g_NmsData.Param % 10,
        [2] = math.floor(g_NmsData.Param / 10) % 10,
        [3] = math.floor(g_NmsData.Param / 100),
      }
      for r6_90 = 1, 3, 1 do
        local r7_90 = 4 - r6_90 - 1
        r1_90:initSubLayer(r0_90.MenuInf.SetName, r0_90.NmsMenu.keyname, r7_90, 0)
        local r8_90 = 0
        local r9_90 = 0
        r8_90, r9_90, r10_90, r11_90 = r1_90:getSubLayerParam(r0_90.MenuInf.SetName, r0_90.NmsMenu.keyname, r7_90, LUA_PARAM_POS, r8_90, r9_90, 0, 0)
        local r12_90 = r0_90.NmsSubKey.NmsNo .. tostring(r6_90)
        r1_90:removeLayer(r0_90.MenuInf.SetName, r12_90)
        r1_90:insertPNARefLayer(r0_90.MenuInf.SetName, r12_90, r0_90.NmsSubKey.NmsNo, r2_90[r6_90], 1)
        r1_90:setParam(r0_90.MenuInf.SetName, r12_90, LUA_PARAM_POS, r8_90, r9_90, 0, 0)
      end
    end
    function r0_76.NmsMouseMove(r0_91, r1_91, r2_91, r3_91, r4_91, r5_91, r6_91)
      -- line: [3466, 3639] id: 91
      if r0_91.NmsMenu.StandbyDragFlag == true then
        r0_91:ThumbDragStart(r0_91.NmsMenu.StandbyDragParam.no, r0_91.NmsMenu.StandbyDragParam.move, r0_91.NmsMenu.StandbyDragParam.x, r0_91.NmsMenu.StandbyDragParam.y)
      end
      if r0_91.MenuButton.selDownCursor ~= -1 then
        r0_91:ThumbDragOn(r4_91, r5_91)
      end
      local r7_91 = r0_91.MenuButton.selCursor
      if r7_91 == -1 or r0_91.NmsMenu.ItemNMS.selCursor_selName ~= r7_91 then
        r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, -1, -1, -1)
      end
      if r7_91 ~= r0_91.NmsMenu.ExpTextNo or r0_91.NmsMenu.SlideFlag ~= 0 then
        if r0_91.NmsMenu.SlideFlag ~= 0 then
        end
        r0_91.NmsMenu.SlideFlag = 0
        r0_91.NmsMenu.ExpTextNo = r7_91
        if r7_91 == "SL_Bar1" then
          r0_91.NmsMenu.SlideFlag = 1
          r0_91:SetthumbBarParam(r0_91.NmsMenu.NmsButton.SL_Bar1:bt_GetParamY(), g_NmsData.THP_Param)
          r0_91:SetThumb()
          text_no = 7
        end
        if r7_91 == "SL_Bar2" then
          r0_91.NmsMenu.SlideFlag = 2
          r0_91:SetEntryBarParam(r0_91.NmsMenu.NmsButton.SL_Bar2:bt_GetParamY(), g_NmsData.Param)
          text_no = 8
        end
        if "SL_Bar1" == r7_91 or "SL_BarBk1" == r7_91 or "SL_Bar1Up" == r7_91 or "SL_Bar1Do" == r7_91 then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expSL_Bar1")
        end
        if "SL_Bar2" == r7_91 or "SL_BarBk2" == r7_91 or "SL_Bar2Up" == r7_91 or "SL_Bar2Do" == r7_91 then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expSL_Bar2")
        end
        if r7_91 == "TH_Reset" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_Reset")
        end
        if r7_91 == "TH_AllSet" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_AllSet")
        end
        if r7_91 == "TH_Entry" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_Entry")
        end
        if r7_91 == "TH_AllPlay" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_AllPlay")
        end
        local r8_91 = -1
        for r12_91 = 1, 9, 1 do
          if "TH_" .. tostring(r12_91) == r7_91 then
            if r0_91.NmsMenu.ENTRY_MAX <= g_NmsData.Param then
              r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_X_max")
            else
              r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_X")
            end
            r8_91 = r12_91
            break
          elseif "TH_" .. tostring(r12_91) .. "play" == r7_91 then
            r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_X_Play")
            r8_91 = r12_91
            break
          elseif "TH_" .. tostring(r12_91) .. "bmk" == r7_91 then
            if g_NmsData.THP_BookMark[g_NmsData.THP_List[g_NmsData.THP_Slide * 3 + r12_91] + 1] == 0 then
              r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_X_bmk")
            else
              r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_X_bmkRE")
            end
            r8_91 = r12_91
            break
          end
        end
        r0_91.NmsMenu.ThumbOnNo = r8_91
        r0_91:ThumbOn(r8_91)
        r0_91:SetThumbTitle()
        if r7_91 == "EN_Load" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expEN_Load")
        end
        if r7_91 == "EN_Save" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expEN_Save")
        end
        if r7_91 == "EN_Reset" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expEN_Reset")
        end
        if r7_91 == "EN_PlayTT" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expEN_PlayTT")
        end
        if r7_91 == "EN_PlayTW" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expEN_PlayTW")
        end
        if r7_91 == "EN_bmk" then
          if g_NmsData.THP_BookMark[g_NmsData.List[g_NmsData.Act] + 1] == 0 then
            r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_X_bmk")
          else
            r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expTH_X_bmkRE")
          end
        end
        local r9_91 = -1
        for r13_91 = 0, 9, 1 do
          if "EN_List" .. tostring(r13_91) == r7_91 then
            r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expEN_List_X")
            r9_91 = r13_91
            break
          end
        end
        r0_91:EntryTh(r9_91)
        if r7_91 == "EntryDrop" then
          r0_91:ItemSet(r0_91.NmsMenu.ItemNMS, r7_91, -1, "expEntryDrop")
        end
      end
    end
    function r0_76.NmsMouseWheel(r0_92, r1_92, r2_92)
      -- line: [3643, 3721] id: 92
      if r0_92:GetMenuMouseEnable() then
        local r3_92 = 0
        local r4_92 = 0
        local r5_92 = cclass.lua_AutoCursor:new()
        r3_92, r4_92 = r5_92:GetCursorPos(r3_92, r4_92)
        r5_92:delete()
        r2_92 = r2_92 / 2
        if 0 <= r3_92 and r3_92 < 490 and 0 <= r4_92 and r4_92 < APP_INTERNAL_HEIGHT and 10 < g_NmsData.Param then
          local r6_92 = r0_92.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PAR_Y - r2_92
          if r6_92 < 0 then
            r6_92 = 0
          end
          local r7_92 = g_NmsData.Param - r0_92.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PSIZE_Y
          if r7_92 < r6_92 then
            r6_92 = r7_92
          end
          r0_92.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(r6_92)
          r0_92:SetEntryBarParam(r6_92, g_NmsData.Param)
          r0_92:defaultMenuMouseMove(r0_92.MenuInf.SetName, -1, cclass.lua_Layers:create():getCursorPos(r0_92.MenuInf.SetName, r3_92, r4_92, 0) - 1, r3_92, r4_92, false)
          local r10_92 = -1
          for r14_92 = 0, 9, 1 do
            if r0_92.MenuButton.selCursor == "EN_List" .. tostring(r14_92) then
              r10_92 = r14_92
              break
            end
          end
          r0_92:EntryTh(r10_92)
        end
        if 490 <= r3_92 and r3_92 < 1280 and 0 <= r4_92 and r4_92 < APP_INTERNAL_HEIGHT and 3 < g_NmsData.THP_Param then
          local r6_92 = r0_92.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PAR_Y - r2_92
          if r6_92 < 0 then
            r6_92 = 0
          end
          local r7_92 = g_NmsData.THP_Param - r0_92.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PSIZE_Y
          if r7_92 < r6_92 then
            r6_92 = r7_92
          end
          r0_92:SetthumbBarParam(r6_92, g_NmsData.THP_Param)
          r0_92:SetThumb()
          r0_92:MenuMouseMove(r0_92.MenuInf.SetName, -1, cclass.lua_Layers:create():getCursorPos(r0_92.MenuInf.SetName, r3_92, r4_92, 0) - 1, r3_92, r4_92, false)
        end
        r0_92:SetThumbTitle()
      end
    end
    function r0_76.endMenu(r0_93, r1_93, r2_93)
      -- line: [3725, 3752] id: 93
      local r3_93 = cclass.lua_Layers:create()
      cfunc.LegacyGame__lua_SetVariable(99, r1_93)
      cfunc.LegacyGame__lua_SetVariable(98, r2_93)
      if r1_93 == -1 then
        NmsMenuSaveBookMark()
        r0_93:closeGallery(0)
        cfunc.LegacyGame__lua_SetFlag(140, false)
      elseif r1_93 == -10 or r1_93 == -20 then
        NmsMenuSaveBookMark()
        r0_93:closeGallery(1)
        cfunc.LegacyGame__lua_SetFlag(140, true)
      else
        r0_93:GalleryBgmStop()
        r0_93:closeGallery(4)
        g_menuExecute = false
        cfunc.LegacyGame__lua_SetFlag(140, true)
      end
    end
    function r0_76.SetthumbBarParam(r0_94, r1_94, r2_94)
      -- line: [3755, 3788] id: 94
      g_NmsData.THP_Param = r2_94
      g_NmsData.THP_Slide = r1_94
      r0_94.NmsMenu.NmsButton.SL_Bar1:bt_SetParamY(g_NmsData.THP_Slide)
      r2_94 = r2_94 - r0_94.NmsMenu.NmsButton.SL_Bar1.MOVABLE.PSIZE_Y
      if r2_94 <= 0 then
        r0_94.NmsMenu.NmsButton.SL_Bar1:bt_SetActive(2)
        r0_94.NmsMenu.NmsButton.SL_BarBk1:bt_SetActive(2)
        r0_94.NmsMenu.NmsButton.SL_Bar1Up:bt_SetActive(2)
        r0_94.NmsMenu.NmsButton.SL_Bar1Do:bt_SetActive(2)
      else
        if r2_94 <= g_NmsData.THP_Slide then
          g_NmsData.THP_Slide = r2_94
        end
        r0_94.NmsMenu.NmsButton.SL_Bar1:bt_SetActive(0)
        r0_94.NmsMenu.NmsButton.SL_BarBk1:bt_SetActive(0)
        if g_NmsData.THP_Slide <= 0 then
          r0_94.NmsMenu.NmsButton.SL_Bar1Up:bt_SetActive(2)
        else
          r0_94.NmsMenu.NmsButton.SL_Bar1Up:bt_SetActive(0)
        end
        if r2_94 <= g_NmsData.THP_Slide then
          r0_94.NmsMenu.NmsButton.SL_Bar1Do:bt_SetActive(2)
        else
          r0_94.NmsMenu.NmsButton.SL_Bar1Do:bt_SetActive(0)
        end
      end
    end
    function r0_76.SetEntryBarParam(r0_95, r1_95, r2_95)
      -- line: [3792, 3834] id: 95
      g_NmsData.Param = r2_95
      g_NmsData.Slide = r1_95
      r2_95 = r2_95 - r0_95.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PSIZE_Y
      if r2_95 <= 0 then
        r0_95.NmsMenu.NmsButton.SL_Bar2:bt_SetActive(2)
        r0_95.NmsMenu.NmsButton.SL_BarBk2:bt_SetActive(2)
        r0_95.NmsMenu.NmsButton.SL_Bar2Up:bt_SetActive(2)
        r0_95.NmsMenu.NmsButton.SL_Bar2Do:bt_SetActive(2)
        r0_95.NmsMenu.NmsDrop.DropListUp:bt_SetActive(3)
        r0_95.NmsMenu.NmsDrop.DropListDown:bt_SetActive(3)
      else
        if r2_95 <= g_NmsData.Slide then
          g_NmsData.Slide = r2_95
        end
        r0_95.NmsMenu.NmsButton.SL_Bar2:bt_SetActive(0)
        r0_95.NmsMenu.NmsButton.SL_BarBk2:bt_SetActive(0)
        if g_NmsData.Slide <= 0 then
          r0_95.NmsMenu.NmsButton.SL_Bar2Up:bt_SetActive(2)
          r0_95.NmsMenu.NmsDrop.DropListUp:bt_SetActive(3)
        else
          r0_95.NmsMenu.NmsButton.SL_Bar2Up:bt_SetActive(0)
          r0_95.NmsMenu.NmsDrop.DropListUp:bt_SetActive(0)
        end
        if r2_95 <= g_NmsData.Slide then
          r0_95.NmsMenu.NmsButton.SL_Bar2Do:bt_SetActive(2)
          r0_95.NmsMenu.NmsDrop.DropListDown:bt_SetActive(3)
        else
          r0_95.NmsMenu.NmsButton.SL_Bar2Do:bt_SetActive(0)
          r0_95.NmsMenu.NmsDrop.DropListDown:bt_SetActive(0)
        end
      end
      r0_95:SetEntryBarBt()
      r0_95:SetEntryText()
      r0_95:SetNumEntryTextSur()
    end
    function r0_76.SetEntryBarBt(r0_96)
      -- line: [3837, 3861] id: 96
      for r4_96 = 0, 9, 1 do
        local r5_96 = "EN_List" .. tostring(r4_96)
        if r4_96 < g_NmsData.Param then
          local r6_96 = g_NmsData.Act
          if r6_96 ~= -1 then
            r6_96 = r6_96 - g_NmsData.Slide
          end
          if r6_96 == r4_96 + 1 then
            r0_96.NmsMenu.NmsEntry[r5_96]:bt_SetActive(4)
          else
            r0_96.NmsMenu.NmsEntry[r5_96]:bt_SetActive(0)
          end
        else
          r0_96.NmsMenu.NmsEntry[r5_96]:bt_SetActive(2)
        end
      end
      r0_96:SetDropBetween()
    end
    function r0_76.SetDropBetween(r0_97)
      -- line: [3864, 3883] id: 97
      if g_NmsData.Param > 0 then
        r0_97.NmsMenu.NmsDrop.DropBetween0:bt_SetActive(0)
      else
        r0_97.NmsMenu.NmsDrop.DropBetween0:bt_SetActive(2)
      end
      for r4_97 = 1, 10, 1 do
        local r5_97 = "DropBetween" .. tostring(r4_97)
        if r4_97 <= g_NmsData.Param then
          r0_97.NmsMenu.NmsDrop[r5_97]:bt_SetActive(0)
        else
          r0_97.NmsMenu.NmsDrop[r5_97]:bt_SetActive(2)
        end
      end
    end
    function r0_76.SetThumbOnOff(r0_98)
      -- line: [3885, 3915] id: 98
      local r1_98 = cclass.lua_Layers:create()
      for r5_98 = 1, 9, 1 do
        if r0_98.nmsDrawThumbKeyNo[r5_98].key ~= -1 and r0_98.nmsDrawThumbKeyNo[r5_98].no ~= -1 then
          local r6_98 = -1
          local r7_98 = -1
          r6_98, r7_98 = GetNmsThumbnailNo(r0_98.nmsDrawThumbKeyNo[r5_98].no)
          if r6_98 ~= -1 then
            if "TH_" .. tostring(r5_98) == r0_98.MenuButton.selCursor then
              r1_98:setSubLayerVisible(r0_98.MenuInf.SetName, r0_98.nmsDrawThumbKeyNo[r5_98].key, r6_98, 0)
              if r7_98 ~= -1 then
                r1_98:setSubLayerVisible(r0_98.MenuInf.SetName, r0_98.nmsDrawThumbKeyNo[r5_98].key, r7_98, 1)
              end
            else
              r1_98:setSubLayerVisible(r0_98.MenuInf.SetName, r0_98.nmsDrawThumbKeyNo[r5_98].key, r6_98, 1)
              if r7_98 ~= -1 then
                r1_98:setSubLayerVisible(r0_98.MenuInf.SetName, r0_98.nmsDrawThumbKeyNo[r5_98].key, r7_98, 0)
              end
            end
          elseif r7_98 ~= -1 then
            r1_98:setSubLayerVisible(r0_98.MenuInf.SetName, r0_98.nmsDrawThumbKeyNo[r5_98].key, r7_98, 1)
          end
        end
      end
    end
    function r0_76.SetThumb(r0_99)
      -- line: [3918, 4043] id: 99
      local r1_99 = cclass.lua_Layers:create()
      for r5_99 = 1, 9, 1 do
        if r0_99.nmsDrawThumbKeyNo[r5_99].key ~= -1 and r0_99.nmsDrawThumbKeyNo[r5_99].no ~= -1 then
          local r6_99 = -1
          local r7_99 = -1
          r6_99, r7_99 = GetNmsThumbnailNo(r0_99.nmsDrawThumbKeyNo[r5_99].no)
          if r6_99 ~= -1 then
            r1_99:setSubLayerVisible(r0_99.MenuInf.SetName, r0_99.nmsDrawThumbKeyNo[r5_99].key, r6_99, 0)
          end
          if r7_99 ~= -1 then
            r1_99:setSubLayerVisible(r0_99.MenuInf.SetName, r0_99.nmsDrawThumbKeyNo[r5_99].key, r7_99, 0)
          end
          r0_99.nmsDrawThumbKeyNo[r5_99].key = -1
          r0_99.nmsDrawThumbKeyNo[r5_99].no = -1
        end
      end
      local r2_99 = g_NmsData.THP_Slide * 3 + 1
      local r3_99 = 1
      for r7_99 = 1, 9, 1 do
        local r8_99 = "TH_" .. tostring(r7_99)
        local r9_99 = r0_99.NmsMenu.TH_PosLayer + r7_99 - 1
        if r2_99 <= #g_NmsData.THP_List and g_NmsData.THP_ListEnable[r2_99] == true then
          local r10_99 = 0
          local r11_99 = 0
          local r12_99 = 0
          local r13_99 = 0
          r1_99:initSubLayer(r0_99.MenuInf.SetName, r0_99.NmsMenu.keyname, r9_99, 0)
          r10_99, r11_99, r12_99, r13_99 = r1_99:getSubLayerParam(r0_99.MenuInf.SetName, r0_99.NmsMenu.keyname, r9_99, LUA_PARAM_POS, r10_99, r11_99, r12_99, r13_99)
          local r14_99 = g_NmsData.THP_List[r2_99]
          local r15_99 = r0_99.NmsSubKey.NmsThumb
          if g_NmsData.MAX_THUMB <= r14_99 then
            r15_99 = r0_76.NmsSubKey.PNmsThumb
          end
          local r16_99 = -1
          local r17_99 = -1
          r16_99, r17_99 = GetNmsThumbnailNo(r14_99)
          r0_99.nmsDrawThumbKeyNo[r7_99].key = r15_99
          r0_99.nmsDrawThumbKeyNo[r7_99].no = r14_99
          if r16_99 ~= -1 then
            r1_99:initSubLayer(r0_99.MenuInf.SetName, r15_99, r16_99, 0)
            r1_99:setSubLayerParam(r0_99.MenuInf.SetName, r15_99, r16_99, LUA_PARAM_POS, r10_99, r11_99, r12_99, r13_99)
          end
          if r17_99 ~= -1 then
            r1_99:initSubLayer(r0_99.MenuInf.SetName, r15_99, r17_99, 0)
            r1_99:setSubLayerParam(r0_99.MenuInf.SetName, r15_99, r17_99, LUA_PARAM_POS, r10_99, r11_99, r12_99, r13_99)
          end
          r0_99.NmsMenu.NmsButton[r8_99]:bt_SetActive(0)
        else
          r0_99.NmsMenu.NmsButton[r8_99]:bt_SetActive(2)
          r0_99.NmsMenu.NmsButton["TH_" .. tostring(r7_99) .. "play"]:bt_SetActive(2)
          r0_99.NmsMenu.NmsButton["TH_" .. tostring(r7_99) .. "bmk"]:bt_SetActive(2)
        end
        if g_NmsData.MAX_THUMB < r2_99 then
          r0_99.NmsMenu.NmsButton["TH_" .. tostring(r7_99)]:bt_SetActive(3)
        end
        r2_99 = r2_99 + 1
      end
      r0_99:SetThumbOnOff()
      r0_99:InitBookMarkBt()
      if g_NmsData.THP_EnableCount > 0 then
        r0_99.NmsMenu.NmsButton.TH_AllPlay:bt_SetActive(0)
      else
        r0_99.NmsMenu.NmsButton.TH_AllPlay:bt_SetActive(2)
      end
    end
    function r0_76.SetThumbTitle(r0_100)
      -- line: [4046, 4062] id: 100
      local r1_100 = cclass.lua_Layers:create()
      local r2_100 = -1
      if r0_100.NmsMenu.ThumbOnNo ~= -1 then
        r2_100 = r0_100.NmsMenu.ThumbOnNo - 1 + g_NmsData.THP_Slide * 3
      end
      if r0_100.DD_Param.no ~= -1 and r0_100.DD_Param.move == false then
        r2_100 = r0_100.DD_Param.no
      end
      r0_100:nmsSetTitle(-1, r2_100 + 1)
    end
    function r0_76.InitBookMarkBt(r0_101)
      -- line: [4066, 4087] id: 101
      local r1_101 = cclass.lua_Layers:create()
      for r5_101 = 1, 9, 1 do
        local r6_101 = "TH_" .. tostring(r5_101) .. "bmk"
        local r7_101 = g_NmsData.THP_Slide * 3 + r5_101
        if r7_101 <= #g_NmsData.THP_List and g_NmsData.THP_ListEnable[r7_101] == true then
          if g_NmsData.THP_BookMark[g_NmsData.THP_List[r7_101] + 1] == 0 then
            r0_101.NmsMenu.NmsButton[r6_101]:bt_SetActive(0)
          else
            r0_101.NmsMenu.NmsButton[r6_101]:bt_SetActive(4)
          end
        else
          r0_101.NmsMenu.NmsButton[r6_101]:bt_SetActive(3)
        end
      end
      r0_101:InitTHBookMarkBt()
    end
    function r0_76.InitTHBookMarkBt(r0_102)
      -- line: [4090, 4097] id: 102
      if r0_102.NmsMenu.ENTRY_MAX <= g_NmsData.Param then
        r0_102.NmsMenu.NmsButton.TH_Entry:bt_SetActive(2)
      else
        r0_102.NmsMenu.NmsButton.TH_Entry:bt_SetActive(0)
      end
    end
    function r0_76.ThumbOn(r0_103, r1_103)
      -- line: [4101, 4117] id: 103
      local r2_103 = cclass.lua_Layers:create()
      for r6_103 = 1, 9, 1 do
        local r7_103 = "TH_" .. tostring(r6_103) .. "play"
        if r1_103 == r6_103 then
          r0_103.NmsMenu.NmsButton[r7_103]:bt_SetActive(0)
        else
          r0_103.NmsMenu.NmsButton[r7_103]:bt_SetActive(2)
        end
      end
      r0_103:SetThumbOnOff()
    end
    r0_76.DD_Param = {
      no = -1,
      move = false,
      POS_X = 0,
      POS_Y = 0,
      DRAGST_X = 0,
      DRAGST_Y = 0,
      list_pos = -1,
    }
    function r0_76.StandbyDrag(r0_104, r1_104, r2_104, r3_104, r4_104)
      -- line: [4132, 4142] id: 104
      if r0_104.NmsMenu.ENTRY_MAX > g_NmsData.Param then
        r0_104.NmsMenu.StandbyDragFlag = true
        r0_104.NmsMenu.StandbyDragParam = {}
        r0_104.NmsMenu.StandbyDragParam.no = r1_104
        r0_104.NmsMenu.StandbyDragParam.move = r2_104
        r0_104.NmsMenu.StandbyDragParam.x = r3_104
        r0_104.NmsMenu.StandbyDragParam.y = r4_104
      end
    end
    function r0_76.ThumbDragStart(r0_105, r1_105, r2_105, r3_105, r4_105)
      -- line: [4145, 4216] id: 105
      if r0_105.NmsMenu.StandbyDragFlag == true then
        r0_105.NmsMenu.StandbyDragFlag = false
      end
      if r0_105.NmsMenu.ENTRY_MAX > g_NmsData.Param then
        local r5_105 = cclass.lua_Layers:create()
        r0_105.MenuButton.onDropFlag = true
        r0_105.DD_Param.move = r2_105
        if r0_105.DD_Param.move == true then
          r0_105.DD_Param.no = g_NmsData.List[r1_105]
          r0_105.DD_Param.POS_X = 0
          r0_105.DD_Param.POS_Y = 0
          r0_105.DD_Param.DRAGST_X = -70
          r0_105.DD_Param.DRAGST_Y = -52
          r0_105.DD_Param.list_pos = r1_105
          r0_105.NmsMenu.NmsDrop.EntryDrop:bt_SetActive(2)
        else
          local r6_105 = "TH_" .. tostring(r1_105)
          r0_105.DD_Param.no = g_NmsData.THP_List[g_NmsData.THP_Slide * 3 + r1_105]
          r0_105.DD_Param.POS_X = r0_105.NmsMenu.NmsButton[r6_105].DRAW_POS.x
          r0_105.DD_Param.POS_Y = r0_105.NmsMenu.NmsButton[r6_105].DRAW_POS.y
          r0_105.DD_Param.DRAGST_X = r0_105.DD_Param.POS_X - r3_105
          r0_105.DD_Param.DRAGST_Y = r0_105.DD_Param.POS_Y - r4_105
          r0_105.DD_Param.list_pos = -1
          r0_105.NmsMenu.NmsDrop.EntryDrop:bt_SetActive(0)
        end
        local r6_105 = r3_105 + r0_105.DD_Param.DRAGST_X
        local r7_105 = r4_105 + r0_105.DD_Param.DRAGST_Y
        local r8_105 = r0_105.DD_Param.no
        local r9_105 = r0_105.NmsSubKey.NmsThumb
        if g_NmsData.MAX_THUMB <= r8_105 then
          r9_105 = r0_76.NmsSubKey.PNmsThumb
        end
        local r10_105 = -1
        local r11_105 = -1
        r10_105, r11_105 = GetNmsThumbnailNo(r8_105)
        if r11_105 ~= -1 then
          r5_105:initSubLayer(r0_105.MenuInf.SetName, r9_105, r11_105, 0)
          r5_105:insertPNARefLayer(r0_105.MenuInf.SetName, "NmsDragTh", r9_105, r11_105, 1)
        else
          r5_105:initSubLayer(r0_105.MenuInf.SetName, r9_105, r10_105, 0)
          r5_105:insertPNARefLayer(r0_105.MenuInf.SetName, "NmsDragTh", r9_105, r10_105, 1)
        end
        r5_105:setParam(r0_105.MenuInf.SetName, "NmsDragTh", LUA_PARAM_POS, r6_105, r7_105, 0, 0)
        r5_105:setParam(r0_105.MenuInf.SetName, "NmsDragTh", LUA_PARAM_COLOR, 1, 1, 1, 0.7)
      end
    end
    function r0_76.ThumbDragEnd(r0_106, r1_106, r2_106, r3_106)
      -- line: [4219, 4274] id: 106
      if r0_106.NmsMenu.StandbyDragFlag == true then
        r0_106.NmsMenu.StandbyDragFlag = false
      end
      local r4_106 = false
      local r5_106 = -1
      if r0_106.DD_Param.no ~= -1 then
        r0_106.MenuButton.onDropFlag = false
        local r6_106 = cclass.lua_Layers:create()
        if 400 <= r1_106 and r1_106 <= 410 then
          r5_106 = r1_106 - 400 + 1 + g_NmsData.Slide
          if r0_106:AddEntryList(r5_106, r0_106.DD_Param.no) == true then
            r4_106 = true
          end
        end
        if r1_106 == 500 then
          r5_106 = g_NmsData.Act
          if r5_106 == -1 then
            r5_106 = 0
          end
          r5_106 = r5_106 + 1
          if r0_106:AddEntryList(r5_106, r0_106.DD_Param.no) == true then
            r4_106 = true
          end
        end
        r6_106:removeLayer(r0_106.MenuInf.SetName, "NmsDragTh")
        if r0_106.DD_Param.move == true and r4_106 == true then
          local r7_106 = r0_106.DD_Param.list_pos
          if r5_106 <= r7_106 then
            r7_106 = r7_106 + 1
          end
          r0_106:DelEntryList(r7_106)
          r4_106 = true
        end
        r0_106.DD_Param.no = -1
      end
      return r4_106
    end
    function r0_76.ThumbDragOn(r0_107, r1_107, r2_107)
      -- line: [4277, 4286] id: 107
      if r0_107.DD_Param.no ~= -1 then
        local r3_107 = cclass.lua_Layers:create()
        local r4_107 = 0
        local r5_107 = 0
        r3_107:setParam(r0_107.MenuInf.SetName, "NmsDragTh", LUA_PARAM_POS, r1_107 + r0_107.DD_Param.DRAGST_X, r2_107 + r0_107.DD_Param.DRAGST_Y, 0, 0)
        r3_107:setVisible(r0_107.MenuInf.SetName, "NmsDragTh", 1)
      end
    end
    function r0_76.EntryTh(r0_108, r1_108)
      -- line: [4292, 4393] id: 108
      local r2_108 = cclass.lua_Layers:create()
      local r3_108 = -1
      if g_NmsData.Param >= 1 then
        r3_108 = g_NmsData.List[r1_108 + 1 + g_NmsData.Slide]
      end
      for r8_108 = 0, g_NmsData.MAX_THUMB - 1, 1 do
        local r9_108 = r0_108.NmsSubKey.NmsListTh
        local r10_108 = g_NmsData.MAX_THUMB
        if r10_108 <= r8_108 then
          r10_108 = r0_108.PatchFlag
          if r10_108 then
            r10_108 = r0_108.NmsSubKey
            r9_108 = r10_108.PNmsListTh
          end
        end
        if r3_108 == r8_108 then
          r10_108 = 1 or 0
        else
          goto label_51	-- block#11 is visited secondly
        end
        local r11_108 = -1
        local r12_108 = -1
        r11_108, r12_108 = GetNmsThumbnailNo(r8_108)
        if r9_108 ~= nil then
          if r12_108 ~= -1 then
            r2_108:initSubLayer(r0_108.MenuInf.SetName, r9_108, r12_108, 0)
            r2_108:setSubLayerVisible(r0_108.MenuInf.SetName, r9_108, r12_108, r10_108)
          elseif r11_108 ~= -1 then
            r2_108:initSubLayer(r0_108.MenuInf.SetName, r9_108, r11_108, 0)
            r2_108:setSubLayerVisible(r0_108.MenuInf.SetName, r9_108, r11_108, r10_108)
          end
        end
      end
      if g_NmsData.Act == -1 then
        r0_108.NmsMenu.NmsButton.EN_bmk:bt_SetActive(2)
      elseif r3_108 ~= -1 and g_NmsData.THP_BookMark[r3_108 + 1] == 1 then
        r0_108.NmsMenu.NmsButton.EN_bmk:bt_SetActive(4)
      else
        r0_108.NmsMenu.NmsButton.EN_bmk:bt_SetActive(0)
      end
      if g_NmsData.Param > 0 then
        r0_108.NmsMenu.NmsButton.EN_Save:bt_SetActive(0)
        r0_108.NmsMenu.NmsButton.EN_Reset:bt_SetActive(0)
        r0_108.NmsMenu.NmsButton.EN_PlayTT:bt_SetActive(0)
        r0_108.NmsMenu.NmsButton.EN_PlayTW:bt_SetActive(0)
      else
        r0_108.NmsMenu.NmsButton.EN_Save:bt_SetActive(2)
        r0_108.NmsMenu.NmsButton.EN_Reset:bt_SetActive(2)
        r0_108.NmsMenu.NmsButton.EN_PlayTT:bt_SetActive(2)
        r0_108.NmsMenu.NmsButton.EN_PlayTW:bt_SetActive(2)
      end
      local r5_108 = false
      for r9_108 = 1, g_NmsSLDataMax, 1 do
        if g_NmsSLData[r9_108] ~= nil and 0 < g_NmsSLData[r9_108].Param then
          r5_108 = true
          break
        end
      end
      if r5_108 == true then
        r0_108.NmsMenu.NmsButton.EN_Load:bt_SetActive(0)
      else
        r0_108.NmsMenu.NmsButton.EN_Load:bt_SetActive(2)
      end
      r0_108:InitTHBookMarkBt()
      -- warn: not visited block [3]
      -- block#3:
      -- r3_108 = g_NmsData.List[g_NmsData.Act]
      -- goto label_28
    end
    function r0_76.InitEntryList(r0_109)
      -- line: [4397, 4403] id: 109
      r0_109:SetEntryBarParam(g_NmsData.Slide, g_NmsData.Param)
      r0_109.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(g_NmsData.Slide)
      r0_109:EntryTh(-1)
    end
    function r0_76.AddEntryList(r0_110, r1_110, r2_110)
      -- line: [4406, 4441] id: 110
      if r0_110.NmsMenu.ENTRY_MAX <= g_NmsData.Param then
        return false
      end
      if r1_110 <= g_NmsData.Param and 1 <= g_NmsData.Param then
        for r6_110 = g_NmsData.Param + 1, r1_110, -1 do
          g_NmsData.List[r6_110] = g_NmsData.List[r6_110 - 1]
        end
      end
      g_NmsData.List[r1_110] = r2_110
      g_NmsData.Param = g_NmsData.Param + 1
      g_NmsData.Act = r1_110
      if g_NmsData.Param > 10 then
        if g_NmsData.Act < g_NmsData.Slide then
          g_NmsData.Slide = g_NmsData.Act - 1
        end
        if g_NmsData.Slide + 10 <= g_NmsData.Act then
          g_NmsData.Slide = g_NmsData.Act - 10
        end
      end
      r0_110.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PAR_MAX_Y = g_NmsData.Param
      r0_110.NmsMenu.NmsButton.SL_Bar2:bt_SetSlidebarPos()
      r0_110:SetEntryBarParam(g_NmsData.Slide, g_NmsData.Param)
      r0_110.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(g_NmsData.Slide)
      r0_110:EntryTh(-1)
      r0_110:InitTHBookMarkBt()
      return true
    end
    function r0_76.DelEntryList(r0_111, r1_111)
      -- line: [4444, 4480] id: 111
      g_NmsData.List[r1_111] = -1
      if g_NmsData.Param >= 2 then
        for r5_111 = r1_111, g_NmsData.Param - 1, 1 do
          g_NmsData.List[r5_111] = g_NmsData.List[r5_111 + 1]
        end
      end
      g_NmsData.Param = g_NmsData.Param - 1
      if r1_111 <= g_NmsData.Act then
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
      r0_111.NmsMenu.NmsButton.SL_Bar2.MOVABLE.PAR_MAX_Y = g_NmsData.Param
      r0_111.NmsMenu.NmsButton.SL_Bar2:bt_SetSlidebarPos()
      r0_111:SetEntryBarParam(g_NmsData.Slide, g_NmsData.Param)
      r0_111.NmsMenu.NmsButton.SL_Bar2:bt_SetParamY(g_NmsData.Slide)
      r0_111:EntryTh(-1)
      r0_111:InitTHBookMarkBt()
    end
    function r0_76.InitThumb(r0_112)
      -- line: [4485, 4546] id: 112
      local r1_112 = cclass.lua_Layers:create()
      local r2_112 = 1
      g_NmsData.THP_List = {}
      g_NmsData.THP_ListEnable = {}
      g_NmsData.THP_EnableCount = 0
      for r6_112 = 1, g_NmsData.MAX_THUMB, 1 do
        g_NmsData.THP_List[r2_112] = r6_112 - 1
        if NmsMenuGetFlag(r6_112 - 1) then
          g_NmsData.THP_ListEnable[r2_112] = true
          g_NmsData.THP_EnableCount = g_NmsData.THP_EnableCount + 1
        else
          g_NmsData.THP_ListEnable[r2_112] = false
        end
        r2_112 = r2_112 + 1
      end
      g_NmsData.THP_Param = math.ceil((r2_112 - 1) / 3)
    end
    function r0_76.StartSetParam(r0_113)
      -- line: [4550, 4561] id: 113
      r0_113:InitThumb()
      cclass.lua_Layers:create():setParam(r0_113.MenuInf.SetName, r0_113.NmsSubKey.NmsThTitle, LUA_PARAM_POS, 546, 169, 0, 0)
    end
    function r0_76.DropRepeatLD(r0_114, r1_114, r2_114, r3_114, r4_114, r5_114, r6_114)
      -- line: [4570, 4635] id: 114
      if r6_114 == false then
        return 
      end
      if r0_114.DD_Param.no ~= -1 then
        local r7_114 = 0
        local r8_114 = -1
        if r0_114.MenuButton.selCursor ~= -1 then
          r7_114 = r0_114.MenuButton.selListKey[r0_114.MenuButton.selCursor].arg
        end
        if r0_114.NmsMenu.DropRepeatArg ~= r7_114 then
          r0_114.NmsMenu.DropRepeatArg = r7_114
          r0_114.NmsMenu.DropRepeatTime = 0
        end
        local r9_114 = false
        if r7_114 == "DropListUp" and 0 < g_NmsData.Slide then
          if r0_114.NmsMenu.DropRepeatTime < 10 then
            r0_114.NmsMenu.DropRepeatTime = r0_114.NmsMenu.DropRepeatTime + 1
          else
            local r10_114 = r0_114.NmsMenu.NmsButton.SL_Bar2
            local r11_114 = r10_114.MOVABLE.PAR_Y - 1
            r10_114:bt_SetParamY(r11_114)
            r0_114:SetEntryBarParam(r11_114, g_NmsData.Param)
          end
          r9_114 = true
        end
        if r7_114 == "DropListDown" then
          if r0_114.NmsMenu.DropRepeatTime < 10 then
            r0_114.NmsMenu.DropRepeatTime = r0_114.NmsMenu.DropRepeatTime + 1
          else
            local r10_114 = r0_114.NmsMenu.NmsButton.SL_Bar2
            local r11_114 = r10_114.MOVABLE.PAR_Y + 1
            r10_114:bt_SetParamY(r11_114)
            r0_114:SetEntryBarParam(r11_114, g_NmsData.Param)
          end
          r9_114 = true
        end
        if r9_114 == false then
          r0_114.NmsMenu.DropRepeatArg = 0
          r0_114.NmsMenu.DropRepeatTime = 0
        end
      else
        r0_114.NmsMenu.DropRepeatArg = 0
        r0_114.NmsMenu.DropRepeatTime = 0
      end
    end
    function r0_76.MakeYSlideBar(r0_115, r1_115, r2_115, r3_115, r4_115, r5_115, r6_115, r7_115, r8_115, r9_115)
      -- line: [4638, 4644] id: 115
      r1_115[r2_115] = r0_115.MenuButton:SlidebarY(r5_115, r6_115, r0_115.MenuButton:Movable(r0_115.MenuButton:ButtonCreate(r2_115, r3_115, r4_115, r5_115, -1, -1, -1, -1, r7_115, r8_115, g_SysSEName.ok, -1, r9_115)))
    end
    function r0_76.NmsChangeEffect(r0_116, r1_116, r2_116, r3_116)
      -- line: [4647, 4742] id: 116
      local r4_116 = cclass.lua_Layers:create()
      local r5_116 = getEffectRate()
      for r9_116, r10_116 in pairs(r0_116.NmsSubKey) do
        if r3_116 == false then
          r4_116:setParam(r0_116.MenuInf.SetName, r10_116, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r4_116:setEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r2_116 * r5_116, 0, 0)
          r11_116, r12_116, r13_116, r14_116 = r4_116:getParam(r0_116.MenuInf.SetName, r10_116, LUA_PARAM_POS, 0, 0, 0, 0)
          r4_116:startEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", 0)
        else
          r4_116:setParam(r0_116.MenuInf.SetName, r10_116, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r4_116:setEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r2_116 * r5_116, 0, 0)
          r4_116:startEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", 0)
        end
      end
      for r9_116 = 0, 9, 1 do
        local r10_116 = r0_116:nmsGetTitleTextName(r9_116)
        if r3_116 == false then
          r4_116:setParam(r0_116.MenuInf.SetName, r10_116, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r4_116:setEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r2_116 * r5_116, 0, 0)
          r11_116, r12_116, r13_116, r14_116 = r4_116:getParam(r0_116.MenuInf.SetName, r10_116, LUA_PARAM_POS, 0, 0, 0, 0)
          r4_116:startEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", 0)
        else
          r4_116:setParam(r0_116.MenuInf.SetName, r10_116, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r4_116:setEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r2_116 * r5_116, 0, 0)
          r4_116:startEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", 0)
        end
      end
      for r9_116 = 1, 3, 1 do
        local r10_116 = r0_116.NmsSubKey.NmsNo .. tostring(r9_116)
        if r3_116 == false then
          r4_116:setParam(r0_116.MenuInf.SetName, r10_116, LUA_PARAM_COLOR, 1, 1, 1, 0)
          r4_116:setEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, 1, 0, r2_116 * r5_116, 0, 0)
          r11_116, r12_116, r13_116, r14_116 = r4_116:getParam(r0_116.MenuInf.SetName, r10_116, LUA_PARAM_POS, 0, 0, 0, 0)
          r4_116:startEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", 0)
        else
          r4_116:setParam(r0_116.MenuInf.SetName, r10_116, LUA_PARAM_COLOR, 1, 1, 1, 1)
          r4_116:setEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", LUA_EFFECT_OPACITY, 0, 0, 0, -1, 0, r2_116 * r5_116, 0, 0)
          r4_116:startEffect(r0_116.MenuInf.SetName, r10_116, "GalleryPageEff", 0)
        end
      end
      return r0_116.NmsMenu.keyname
    end
  end
  function GetNmsList(r0_117, r1_117)
    -- line: [4756, 4782] id: 117
    local r2_117 = cfunc.LegacyGame__lua_GetVariable(98)
    cfunc.LegacyGame__lua_SetVariable(97, -1)
    if r2_117 <= g_NmsPlay.Param then
      cfunc.LegacyGame__lua_SetVariable(97, g_NmsPlay.List[r2_117])
      g_NmsPlay.Act = r2_117
    else
      cfunc.LegacyGame__lua_SetVariable(97, -1)
    end
    if cfunc.LegacyGame__lua_GetGameState(LUA_STATE_DISABLEDATA) == false then
      cfunc.LegacyGame__lua_SetGameState(LUA_STATE_DISABLEDATA)
    end
  end
  function NmsMenuGetFlag(r0_118)
    -- line: [4817, 4829] id: 118
    local r2_118 = cfunc.LegacyGame__lua_GetFlag(1150 + r0_118)
    return true
  end
  function NmsMenuSetBookMarkAll(r0_119)
    -- line: [4835, 4875] id: 119
    g_NmsData.THP_BookMark = {}
    local r1_119 = 1
    for r5_119 = 1, g_NmsData.MAX_THUMB, 1 do
      if NmsMenuGetFlag(r5_119 - 1) then
        g_NmsData.THP_BookMark[r5_119] = r0_119
      else
        g_NmsData.THP_BookMark[r5_119] = 0
      end
      r1_119 = r1_119 + 1
    end
    NmsMenuSaveBookMark()
  end
  function NmsMenuLoadBookMark()
    -- line: [4877, 4896] id: 120
    local r1_120 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmsBookMark.dat", "r")
    if r1_120 ~= nil then
      for r6_120 = 1, g_NmsData.MAX_THUMB, 1 do
        g_NmsData.THP_BookMark[r6_120] = r1_120:read("*n")
        if g_NmsData.THP_BookMark[r6_120] == nil then
          g_NmsData.THP_BookMark[r6_120] = 0
        end
      end
      r1_120:close()
    else
      NmsMenuSetBookMarkAll(0)
    end
  end
  g_nmsBookMarkFlag = false
  function NmsMenuSaveBookMark()
    -- line: [4899, 4924] id: 121
    if g_nmsBookMarkFlag then
      local r1_121 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmsBookMark.dat", "w")
      if r1_121 ~= nil then
        for r6_121 = 1, g_NmsData.MAX_THUMB, 1 do
          if g_NmsData.THP_BookMark[r6_121] == nil then
            g_NmsData.THP_BookMark[r6_121] = 0
          end
          if r6_121 <= #g_NmsData.THP_BookMark then
            r1_121:write(g_NmsData.THP_BookMark[r6_121] .. "\n")
          else
            r1_121:write(0 .. "\n")
            g_NmsData.THP_BookMark[r6_121] = 0
          end
        end
        r1_121:close()
      end
    end
  end
  function NmsMenuInitENP()
    -- line: [4928, 4934] id: 122
    g_NmsData.Slide = 0
    g_NmsData.List = {}
    g_NmsData.Act = -1
    g_NmsData.Param = 0
  end
  function openNmsSaveLoad(r0_123, r1_123)
    -- line: [4945, 5454] id: 123
    g_Menu.NmsSaveLoad.ptr = Menu.new("NmsSLMenu")
    g_Menu.NmsSaveLoad.ptr.SaveLoadFlag = r1_123
    g_Menu.NmsSaveLoad.ptr.ExpTextNo = -1
    g_Menu.NmsSaveLoad.ptr.defaultMenuMouseMove = g_Menu.NmsSaveLoad.ptr.MenuMouseMove
    function g_Menu.NmsSaveLoad.ptr.MenuMouseMove(r0_124, r1_124, r2_124, r3_124, r4_124, r5_124, r6_124)
      -- line: [4960, 4970] id: 124
      r0_124:defaultMenuMouseMove(r1_124, r2_124, r3_124, r4_124, r5_124, r6_124)
      local r7_124 = 0
      local r8_124 = -1
      if r0_124.MenuButton.selCursor ~= -1 then
        r7_124 = r0_124.MenuButton.selListKey[r0_124.MenuButton.selCursor].arg
      end
    end
    function g_Menu.NmsSaveLoad.ptr.MenuEffectEndJob(r0_125)
      -- line: [4973, 5000] id: 125
      local r1_125 = cclass.lua_Layers:create()
      if r0_125.MenuInf.enabled == true then
        local r2_125 = 0
        local r3_125 = 0
        local r4_125 = cclass.lua_AutoCursor:new()
        r2_125, r3_125 = r4_125:GetCursorPos(r2_125, r3_125)
        r4_125:delete()
        r0_125.MenuButton:changeButton(r0_125.MenuInf.SetName, r1_125:getCursorPos(r0_125.MenuInf.SetName, r2_125, r3_125, 0) - 1, r2_125, r3_125)
      else
        r1_125:remove(r0_125.MenuInf.SetName)
        r0_125.MenuInf.ButtonLayer = ""
        r0_125.MenuInf.ButtonPna = ""
      end
    end
    function g_Menu.NmsSaveLoad.ptr.MenuButtonJobPos(r0_126, r1_126, r2_126, r3_126, r4_126)
      -- line: [5003, 5048] id: 126
      if nil and not nil then
        goto label_2	-- block#1 is visited secondly
      end
      if r2_126 == "LU" then
      end
      if r2_126 == "LU" and r1_126 ~= 0 then
        if r1_126 == 999 then
          r0_126:endMenu()
        end
        if 1 <= r1_126 and r1_126 <= g_NmsSLDataMax then
          if r0_126.SaveLoadFlag == 0 then
            g_Menu.NmsSaveLoad.ptrSaveNo = r1_126
            if g_NmsSLData[g_Menu.NmsSaveLoad.ptrSaveNo].Param == 0 then
              NmsSLMenuSave()
            else
              openConfirm(LUA_CONFIRM_NMSSAVE)
            end
          else
            NmsSLMenuLoadData(r1_126)
            if r0_126.DataActNo ~= -1 then
              r0_126.ButtonSlide.SlideBar.MOVABLE.PAR_MAX_Y = r0_126.DispSave.Param
              r0_126.ButtonSlide.SlideBar:bt_SetSlidebarPos()
            end
            r0_126:endMenu()
          end
          r0_126:SetActive()
        end
      end
      if r2_126 == "RU" and r1_126 == 0 then
        r0_126:SystemSePlay(g_SysSEName.cancel)
        r0_126:endMenu()
      end
    end
    function g_Menu.NmsSaveLoad.ptr.MenuMouseWheel(r0_127, r1_127, r2_127, r3_127)
      -- line: [5052, 5057] id: 127
      local r4_127 = cclass.lua_Layers:create()
    end
    function g_Menu.NmsSaveLoad.ptr.NmsSLMenuSaveData(r0_128, r1_128)
      -- line: [5064, 5098] id: 128
      g_NmsSLData[r1_128] = {}
      g_NmsSLData[r1_128].Act = g_Menu.NmsSaveLoad.ptr.DispSave.Act
      g_NmsSLData[r1_128].List = {
        unpack(g_NmsData.List)
      }
      g_NmsSLData[r1_128].Param = g_NmsData.Param
      g_NmsSLData[r1_128].Slide = g_Menu.NmsSaveLoad.ptr.DispSave.Slide
      g_NmsSLData[r1_128].ts = os.date("%Y-%m-%d %H:%M:%S")
      local r4_128 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmssave" .. tostring(r1_128) .. ".dat", "w")
      if r4_128 ~= nil then
        r4_128:write(g_NmsSLData[r1_128].ts .. "\n")
        r4_128:write(g_NmsSLData[r1_128].Param .. "\n")
        r4_128:write(g_NmsSLData[r1_128].Act .. "\n")
        r4_128:write(g_NmsSLData[r1_128].Slide .. "\n")
        for r8_128 = 1, g_NmsSLData[r1_128].Param, 1 do
          r4_128:write(g_NmsSLData[r1_128].List[r8_128] .. "\n")
        end
        r4_128:close()
      end
    end
    function g_Menu.NmsSaveLoad.ptr.startMenu(r0_129)
      -- line: [5101, 5110] id: 129
      cclass.lua_Layers:create():copySnap("NmsSLMenu", "system")
      r0_129:MenuEffectStart(500, 0)
      r0_129.MenuInf.enabled = true
      r0_129.MenuInf.effect = true
    end
    function g_Menu.NmsSaveLoad.ptr.endMenu(r0_130)
      -- line: [5112, 5116] id: 130
      r0_130:MenuEffectToMenu(500)
      r0_130.MenuInf.enabled = false
      r0_130.MenuInf.effect = true
    end
    function g_Menu.NmsSaveLoad.ptr.GetDataPos(r0_131, r1_131)
      -- line: [5119, 5124] id: 131
      return 197 + 224 * (r1_131 - 1) % 4, 175 + 210 * math.floor((r1_131 - 1) / 4)
    end
    function g_Menu.NmsSaveLoad.ptr.MakeDataTh(r0_132, r1_132)
      -- line: [5127, 5210] id: 132
      local r2_132 = 0
      local r3_132 = 0
      r2_132, r3_132 = r0_132:GetDataPos(r1_132)
      local r4_132 = "NmsSLThumb" .. tostring(r1_132)
      local r5_132 = cclass.lua_Layers:create()
      local r6_132 = 0
      local r7_132 = 0
      local r8_132 = 0
      local r9_132 = 0
      r5_132:removeLayer("NmsSLMenu", r4_132)
      if 0 < g_NmsSLData[r1_132].Param and 0 < g_NmsSLData[r1_132].Act then
        r6_132 = 12 + r2_132
        r7_132 = 12 + r3_132
        local r10_132 = g_NmsSLData[r1_132].List[g_NmsSLData[r1_132].Act]
        local r11_132 = "NmsSLThumb"
        if g_NmsData.MAX_THUMB <= r10_132 then
        end
        local r12_132 = -1
        local r13_132 = -1
        r12_132, r13_132 = GetNmsThumbnailNo(r10_132)
        if r13_132 ~= -1 then
          r5_132:initSubLayer("NmsSLMenu", r11_132, r13_132, 0)
          r5_132:insertPNARefLayer("NmsSLMenu", r4_132, r11_132, r13_132, 1)
        elseif r12_132 ~= -1 then
          r5_132:initSubLayer("NmsSLMenu", r11_132, r12_132, 0)
          r5_132:insertPNARefLayer("NmsSLMenu", r4_132, r11_132, r12_132, 1)
        end
        r5_132:setParam("NmsSLMenu", r4_132, LUA_PARAM_POS, r6_132, r7_132, 0, 0)
      end
      local r10_132 = {
        [1] = g_NmsSLData[r1_132].Param % 10,
        [2] = math.floor(g_NmsSLData[r1_132].Param / 10) % 10,
        [3] = math.floor(g_NmsSLData[r1_132].Param / 100),
      }
      local r11_132 = g_NmsSLData[r1_132].Param
      if r11_132 > 0 then
        r11_132 = 1 or 0.2
      else
        goto label_128	-- block#10 is visited secondly
      end
      for r15_132 = 1, 3, 1 do
        local r16_132 = "NmsData" .. tostring(r1_132) .. "No" .. tostring(r15_132)
        r5_132:removeLayer("NmsSLMenu", r16_132)
        r5_132:insertPNARefLayer("NmsSLMenu", r16_132, "NmsSLNo", r10_132[r15_132], 1)
        r5_132:setParam("NmsSLMenu", r16_132, LUA_PARAM_POS, 93 - (r15_132 - 1) * 21 + r2_132, 165 + r3_132, 0, 0)
        r5_132:setParam("NmsSLMenu", r16_132, LUA_PARAM_COLOR, 1, 1, 1, r11_132)
      end
      r4_132 = "NmsSLTime" .. tostring(r1_132)
      r5_132:clearText("NmsSLMenu", r4_132)
      if g_NmsSLData[r1_132].Param > 0 then
        r5_132:setText("NmsSLMenu", r4_132, g_NmsSLData[r1_132].ts, g_NmsFonts.name, 14, 0, 0, 4294967295, 255)
        r5_132:setParam("NmsSLMenu", r4_132, LUA_PARAM_POS, 5 + r2_132, 125 + r3_132, 0, 0)
      end
    end
    g_Menu.NmsSaveLoad.ptr.DataActNo = -1
    function g_Menu.NmsSaveLoad.ptr.InitNmsSL(r0_133)
      -- line: [5214, 5368] id: 133
      local r1_133 = cclass.lua_Layers:create()
      local r2_133 = "sys_nms_save.pna"
      if r0_133.SaveLoadFlag == 1 then
        r2_133 = "sys_nms_load.pna"
      end
      local r3_133 = r0_133:MenuInit("NmsSLBace00", r2_133)
      if res == false then
        return false
      end
      r0_133:MenuLoadLayer("NmsSLNo", "sys_nms_no.pna")
      r0_133:MenuLoadLayer("NmsSLThumb", "sys_nms_th.pna")
      for r7_133 = 0, 9, 1 do
        r1_133:initSubLayer("NmsSLMenu", "NmsSLNo", r7_133, 0)
      end
      r1_133:initSubLayer("NmsSLMenu", "NmsSLBace00", 0, 1)
      r1_133:initSubLayer("NmsSLMenu", "NmsSLBace00", 271, 1)
      r1_133:initSubLayer("NmsSLMenu", "NmsSLBace00", 272, 1)
      for r7_133 = 1, g_NmsSLDataMax, 1 do
        r1_133:insertTextLayer("NmsSLMenu", "NmsSLTime" .. tostring(r7_133), 220, 30, 16, 0, 0, 0, 0, 1)
        local r9_133 = 0
        local r10_133 = 0
        local r11_133 = 0
        local r12_133 = 0
        local r13_133 = "SaveLoad" .. tostring(r7_133)
        local r14_133 = r7_133
        local r15_133 = -1
        local r16_133 = -1
        local r17_133 = -1
        if r0_133.SaveLoadFlag == 0 then
          r15_133 = 19 + (r7_133 - 1) * 5
          r16_133 = 61 + (r7_133 - 1) * 5
        else
          r15_133 = 19 + (r7_133 - 1) * 5
          r16_133 = 61 + (r7_133 - 1) * 5
          r17_133 = 103 + (r7_133 - 1) * 5
        end
        r0_133:MenuButtonSet(r0_133.MenuButtonData, r13_133, 1, "NmsSLBace00", r15_133, r15_133, r16_133, -1, r17_133, r14_133, 0, 1)
        r13_133 = "Data" .. tostring(r7_133)
        if r0_133.SaveLoadFlag == 0 then
          r1_133:initSubLayer("NmsSLMenu", "NmsSLBace00", 148 + (r7_133 - 1) * 5, 1)
          r1_133:initSubLayer("NmsSLMenu", "NmsSLBace00", 146 + (r7_133 - 1) * 5, 1)
        else
          r15_133 = 148 + (r7_133 - 1) * 5
          r17_133 = 232 + (r7_133 - 1) * 5
          r1_133:initSubLayer("NmsSLMenu", "NmsSLBace00", r15_133, 0)
          r1_133:initSubLayer("NmsSLMenu", "NmsSLBace00", r17_133, 0)
          if g_NmsSLData[r7_133].Param > 0 then
            r1_133:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r15_133, 1)
            r1_133:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_133, 0)
          else
            r1_133:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r15_133, 0)
            r1_133:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_133, 1)
          end
          r15_133 = 146 + (r7_133 - 1) * 5
          r17_133 = 230 + (r7_133 - 1) * 5
          r1_133:initSubLayer("NmsSLMenu", "NmsSLBace00", r15_133, 0)
          r1_133:initSubLayer("NmsSLMenu", "NmsSLBace00", r17_133, 0)
          if g_NmsSLData[r7_133].Param > 0 then
            r1_133:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r15_133, 1)
            r1_133:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_133, 0)
          else
            r1_133:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r15_133, 0)
            r1_133:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r17_133, 1)
          end
        end
        r0_133:MakeDataTh(r7_133)
      end
      r0_133:MenuButtonSet(r0_133.MenuButtonData, "RETURN", 0, "NmsSLBace00", 2, 2, 3, -1, -1, 999, 0, 0)
      r0_133.MenuButton:SetList("MenuButtonData", r0_133.MenuButtonData)
      r0_133:MenuButtonInit()
      if r0_133.SaveLoadFlag == 0 then
        r0_133.DispSave.Act = g_NmsData.Act
        r0_133.DispSave.List = {
          unpack(g_NmsData.List)
        }
        r0_133.DispSave.Param = g_NmsData.Param
        r0_133.DispSave.Slide = g_NmsData.Slide
      elseif 1 <= r0_133.DataActNo and r0_133.DataActNo <= 6 then
        r0_133.DispSave.Act = g_NmsSLData[r0_133.DataActNo].Act
        r0_133.DispSave.List = {
          unpack(g_NmsSLData[r0_133.DataActNo].List)
        }
        r0_133.DispSave.Param = g_NmsSLData[r0_133.DataActNo].Param
        r0_133.DispSave.Slide = g_NmsSLData[r0_133.DataActNo].Slide
      else
        r0_133.DispSave.Act = -1
        r0_133.DispSave.List = -1
        r0_133.DispSave.Param = 0
        r0_133.DispSave.Slide = 0
      end
      r0_133:SetActive()
      return true
    end
    function g_Menu.NmsSaveLoad.ptr.SetActive(r0_134)
      -- line: [5373, 5417] id: 134
      for r4_134 = 1, g_NmsSLDataMax, 1 do
        local r5_134 = "SaveLoad" .. tostring(r4_134)
        if r0_134.SaveLoadFlag == 0 then
          r0_134.MenuButtonData[r5_134]:bt_SetActive(0)
        else
          if g_NmsSLData[r4_134].Param > 0 then
            r0_134.MenuButtonData[r5_134]:bt_SetActive(0)
          else
            r0_134.MenuButtonData[r5_134]:bt_SetActive(2)
          end
          local r6_134 = cclass.lua_Layers:create()
          local r7_134 = 19 + (r4_134 - 1) * 5
          local r8_134 = 103 + (r4_134 - 1) * 5
          if g_NmsSLData[r4_134].Param > 0 then
            r6_134:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_134, 1)
            r6_134:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_134, 0)
          else
            r6_134:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_134, 0)
            r6_134:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_134, 1)
          end
          r7_134 = 17 + (r4_134 - 1) * 5
          r8_134 = 101 + (r4_134 - 1) * 5
          if g_NmsSLData[r4_134].Param > 0 then
            r6_134:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_134, 1)
            r6_134:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_134, 0)
          else
            r6_134:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r7_134, 0)
            r6_134:setSubLayerVisible("NmsSLMenu", "NmsSLBace00", r8_134, 1)
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
    local r2_123 = g_Menu.NmsSaveLoad.ptr:InitNmsSL()
    if res == false then
      return false
    end
    g_Menu.NmsSaveLoad.ptr:startMenu()
    return true
  end
  g_Menu.NmsSaveLoad.ptrSaveNo = -1
  function NmsSLMenuSave()
    -- line: [5457, 5462] id: 135
    if g_Menu.NmsSaveLoad.ptr ~= nil and 1 <= g_Menu.NmsSaveLoad.ptrSaveNo and g_Menu.NmsSaveLoad.ptrSaveNo <= g_NmsSLDataMax then
      g_Menu.NmsSaveLoad.ptr:NmsSLMenuSaveData(g_Menu.NmsSaveLoad.ptrSaveNo)
      g_Menu.NmsSaveLoad.ptr:MakeDataTh(g_Menu.NmsSaveLoad.ptrSaveNo)
    end
  end
  function NmsSLMenuInitSaveData()
    -- line: [5464, 5498] id: 136
    if g_NmsData.OneInit == true then
      return 
    end
    for r3_136 = 1, g_NmsSLDataMax, 1 do
      g_NmsSLData[r3_136] = {}
      g_NmsSLData[r3_136].Act = -1
      g_NmsSLData[r3_136].List = {}
      g_NmsSLData[r3_136].Param = 0
      g_NmsSLData[r3_136].ts = ""
      local r6_136 = io.open(cfunc.CSaveDataManager__lua_GetSavePath() .. "nmssave" .. tostring(r3_136) .. ".dat", "r")
      if r6_136 ~= nil then
        g_NmsSLData[r3_136].ts = r6_136:read("*l")
        g_NmsSLData[r3_136].Param = r6_136:read("*n")
        g_NmsSLData[r3_136].Act = r6_136:read("*n")
        g_NmsSLData[r3_136].Slide = r6_136:read("*n")
        for r10_136 = 1, g_NmsSLData[r3_136].Param, 1 do
          g_NmsSLData[r3_136].List[r10_136] = r6_136:read("*n")
        end
        r6_136:close()
      end
    end
  end
  function NmsSLMenuLoadData(r0_137)
    -- line: [5502, 5507] id: 137
    g_NmsData.Act = g_NmsSLData[r0_137].Act
    g_NmsData.List = {
      unpack(g_NmsSLData[r0_137].List)
    }
    g_NmsData.Param = g_NmsSLData[r0_137].Param
    g_NmsData.Slide = g_NmsSLData[r0_137].Slide
  end
end
g_CgBrowserList = {
  Count = 0,
  Layer = {},
}
function InitPnaCgBrowser(r0_138, r1_138)
  -- line: [5560, 5569] id: 138
  if r1_138 == -1 then
    g_CgBrowserList.Count = 0
    g_CgBrowserList.Layer = {}
  else
    g_CgBrowserList.Count = g_CgBrowserList.Count + 1
    g_CgBrowserList.Layer["Cg" .. tostring(g_CgBrowserList.Count)] = r1_138
  end
end
function openCgBrowser(r0_139, r1_139)
  -- line: [5574, 6276] id: 139
  g_Menu.CgBrowser.ptr = Menu.new("CgBrowser")
  g_Menu.CgBrowser.ptr.UseButton = true
  function g_Menu.CgBrowser.ptr.MenuEffect(r0_140)
    -- line: [5587, 5604] id: 140
    -- notice: unreachable block#4
    -- notice: unreachable block#5
    -- notice: unreachable block#3
    local r1_140 = false
    r1_140 = r0_140:MenuEffectTransJob()
    if r0_140.MenuInf.effect == true and r1_140 == false then
      r0_140:MenuEffectEndJob()
      r0_140.MenuInf.effect = false
    end
    return r1_140
  end
  function g_Menu.CgBrowser.ptr.MenuInit(r0_141)
    -- line: [5608, 5620] id: 141
    local r1_141 = true
    r0_141.MenuInf.enabled = true
    r0_141.MenuInf.effect = true
    if cclass.lua_Layers:create():add(r0_141.MenuInf.SetName) == false then
      return false
    end
    return r1_141
  end
  function g_Menu.CgBrowser.ptr.LoadSystemMenu(r0_142, r1_142, r2_142)
    -- line: [5623, 5633] id: 142
    r0_142.MenuInf.ButtonLayer = r1_142
    r0_142.MenuInf.ButtonPna = r2_142
    r0_142:MenuLoadLayer(r1_142, r2_142)
    r0_142.MenuButton = Button.new(r0_142.MenuInf.SetName)
    r0_142.MenuButton:InitList()
    r0_142.MenuButtonData = {}
  end
  function g_Menu.CgBrowser.ptr.MenuEffectEndJob(r0_143)
    -- line: [5636, 5649] id: 143
    local r1_143 = cclass.lua_Layers:create()
    if r0_143.MenuInf.enabled ~= true then
      r1_143:remove(r0_143.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_143.MenuInf.ButtonLayer = ""
      r0_143.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.CgBrowser.ptr.MenuEffectStart(r0_144, r1_144)
    -- line: [5652, 5660] id: 144
    cclass.lua_Layers:create():startTransition(r0_144.MenuInf.SetName, 0, 1, r1_144 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_144.MenuInf.enabled = true
    r0_144.MenuInf.effect = true
  end
  function g_Menu.CgBrowser.ptr.GetMenuMouseEnable(r0_145)
    -- line: [5663, 5673] id: 145
    local r1_145 = false
    if r0_145.MenuInf.enabled == true and r0_145.MenuInf.effect == false then
      r1_145 = true
    end
    return r1_145
  end
  function g_Menu.CgBrowser.ptr.MenuMouseMove(r0_146, r1_146, r2_146, r3_146, r4_146, r5_146, r6_146)
    -- line: [5679, 5697] id: 146
    if r6_146 == true then
      return 
    end
    if r0_146:GetMenuMouseEnable() then
      r0_146:DragMoveCg(r4_146, r5_146)
      r0_146:Cursor()
      r0_146.MenuButton:mouseMove(r2_146, r3_146, r4_146, r5_146)
    elseif r0_146.DragMoveFlag then
      r0_146.DragMoveFlag = false
      r0_146:Cursor()
    end
  end
  function g_Menu.CgBrowser.ptr.MenuLButtonDown(r0_147, r1_147, r2_147, r3_147, r4_147, r5_147, r6_147)
    -- line: [5699, 5716] id: 147
    local r7_147 = 0
    if r6_147 == true then
      return r7_147
    end
    if r0_147.DragMoveFlag then
      r0_147.DragMoveFlag = false
      r0_147:Cursor()
    elseif r0_147:GetMenuMouseEnable() then
      r7_147 = r0_147.MenuButton:mouseLdown(r2_147, r3_147, r4_147, r5_147, r6_147)
    end
    return r7_147
  end
  function g_Menu.CgBrowser.ptr.MenuLButtonUp(r0_148, r1_148, r2_148, r3_148, r4_148, r5_148, r6_148)
    -- line: [5718, 5772] id: 148
    -- notice: unreachable block#18
    local r7_148 = 0
    if r6_148 == true then
      return r7_148
    end
    if r0_148.DragMoveFlag then
      r0_148.DragMoveFlag = false
      r0_148:Cursor()
    else
      r7_148 = r0_148.MenuButton:mouseLup(r2_148, r3_148, r4_148, r5_148, r6_148)
      if r7_148 == 99 then
        if r0_148.CloseButton then
          r0_148.CloseButton = false
          r0_148:ActiveBrowserButton()
        else
          cfunc.LegacyGame__lua_SetVariable(99, 0)
          r0_148:closeBrowser()
        end
      end
      local r8_148 = r0_148.LoadCgInf.EventCG.posx
      local r9_148 = r0_148.LoadCgInf.EventCG.posy
      if r7_148 == 1 then
        r9_148 = r9_148 - 100
        r0_148:MoveCgPos(r8_148, r9_148)
        r0_148:ActiveBrowserButton()
      end
      if r7_148 == 2 then
        r9_148 = r9_148 + 100
        r0_148:MoveCgPos(r8_148, r9_148)
        r0_148:ActiveBrowserButton()
      end
      if r7_148 == 3 then
        r8_148 = r8_148 - 100
        r0_148:MoveCgPos(r8_148, r9_148)
        r0_148:ActiveBrowserButton()
      end
      if r7_148 == 4 then
        r0_148:MoveCgPos(r8_148 + 100, r9_148)
        r0_148:ActiveBrowserButton()
      end
      if r7_148 == 5 then
        r0_148.CloseButton = true
        r0_148:ActiveBrowserButton()
      end
    end
    return r7_148
  end
  function g_Menu.CgBrowser.ptr.MenuRButtonDown(r0_149, r1_149, r2_149, r3_149, r4_149, r5_149, r6_149)
    -- line: [5774, 5790] id: 149
    local r7_149 = 0
    if r6_149 == true then
      return r7_149
    end
    if r0_149:GetMenuMouseEnable() then
      r7_149 = r0_149.MenuButton:mouseRdown(r2_149, r3_149, r4_149, r5_149, r6_149)
    elseif r0_149.DragMoveFlag then
      r0_149.DragMoveFlag = false
      r0_149:Cursor()
    end
    return r7_149
  end
  function g_Menu.CgBrowser.ptr.MenuRButtonUp(r0_150, r1_150, r2_150, r3_150, r4_150, r5_150, r6_150)
    -- line: [5792, 5816] id: 150
    local r7_150 = 0
    if r6_150 == true then
      return r7_150
    end
    if r0_150:GetMenuMouseEnable() then
      r7_150 = r0_150.MenuButton:mouseRup(r2_150, r3_150, r4_150, r5_150, r6_150)
      if r0_150.CloseButton then
        r0_150.CloseButton = false
      else
        cfunc.LegacyGame__lua_SetVariable(99, -1)
        r0_150:closeBrowser()
      end
    elseif r0_150.DragMoveFlag then
      r0_150.DragMoveFlag = false
      r0_150:Cursor()
    end
    return r7_150
  end
  function g_Menu.CgBrowser.ptr.MenuMButtonDown(r0_151, r1_151, r2_151, r3_151, r4_151, r5_151, r6_151)
    -- line: [5818, 5832] id: 151
    local r7_151 = 0
    if r6_151 == true then
      return r7_151
    end
    if r0_151:GetMenuMouseEnable() then
      r0_151:DragStart(r4_151, r5_151)
    elseif r0_151.DragMoveFlag then
      r0_151.DragMoveFlag = false
      r0_151:Cursor()
    end
    return r7_151
  end
  function g_Menu.CgBrowser.ptr.MenuMButtonUp(r0_152, r1_152, r2_152, r3_152, r4_152, r5_152, r6_152)
    -- line: [5834, 5846] id: 152
    if r0_152:GetMenuMouseEnable() and r0_152.DragMoveFlag then
      r0_152.DragMoveFlag = false
      r0_152:Cursor()
    elseif r0_152.DragMoveFlag then
      r0_152.DragMoveFlag = false
      r0_152:Cursor()
    end
  end
  function g_Menu.CgBrowser.ptr.MenuMouseWheel(r0_153, r1_153, r2_153)
    -- line: [5848, 5872] id: 153
    -- notice: unreachable block#5
    -- notice: unreachable block#1
    -- notice: unreachable block#3
    -- notice: unreachable block#4
    -- notice: unreachable block#2
    if r0_153:GetMenuMouseEnable() then
      r0_153:MoveCgPos(r0_153.LoadCgInf.EventCG.posx, r0_153.LoadCgInf.EventCG.posy + r2_153 * 10)
      r0_153:ActiveBrowserButton()
    end
  end
  function g_Menu.CgBrowser.ptr.MoveCgPos(r0_154, r1_154, r2_154)
    -- line: [5877, 5885] id: 154
    local r3_154 = cclass.lua_Layers:create()
    r1_154, r2_154 = r0_154:PosCalc(r1_154, r2_154)
    r0_154.LoadCgInf.EventCG.posx = r1_154
    r0_154.LoadCgInf.EventCG.posy = r2_154
    r3_154:setParam(r0_154.MenuInf.SetName, "EventCG", LUA_PARAM_POS, r1_154, r2_154, 0, 0)
    r0_154:Cursor()
  end
  function g_Menu.CgBrowser.ptr.ScaleCg(r0_155, r1_155)
    -- line: [5887, 5902] id: 155
    local r2_155 = cclass.lua_Layers:create()
    if r1_155 < r0_155.LoadCgInf.EventCG.MinScale then
      r1_155 = r0_155.LoadCgInf.EventCG.MinScale
    end
    if r1_155 > 1 then
      r1_155 = 1
    end
    r2_155:setParam(r0_155.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, r1_155, r1_155, 0, 0)
    r0_155.LoadCgInf.EventCG.Scale = r1_155
    r0_155:MoveCgPos(r0_155.LoadCgInf.EventCG.posx, r0_155.LoadCgInf.EventCG.posy)
    r0_155:Cursor()
  end
  g_Menu.CgBrowser.ptr.DragMoveFlag = false
  g_Menu.CgBrowser.ptr.CloseButton = false
  g_Menu.CgBrowser.ptr.DragMovePosx = 0
  g_Menu.CgBrowser.ptr.DragMovePosy = 0
  function g_Menu.CgBrowser.ptr.DragMoveCg(r0_156, r1_156, r2_156)
    -- line: [5909, 5929] id: 156
    if r0_156.DragMoveFlag then
      if 0 <= r1_156 and 0 <= r2_156 and r1_156 < APP_INTERNAL_WIDTH and r2_156 < APP_INTERNAL_HEIGHT then
        r0_156.DragMovePosx = r1_156
        r0_156.DragMovePosy = r2_156
        r0_156:MoveCgPos(r1_156 - r0_156.DragMovePosx + r0_156.LoadCgInf.EventCG.posx, r2_156 - r0_156.DragMovePosy + r0_156.LoadCgInf.EventCG.posy)
      end
      r0_156:ActiveBrowserButton()
    end
  end
  function g_Menu.CgBrowser.ptr.MovePictCheck(r0_157)
    -- line: [5932, 5970] id: 157
    if r0_157.DragMoveFlag == false and r0_157.LoadCgInf.EventCG.Movable then
      local r1_157 = 0
      local r2_157 = 0
      local r3_157 = cclass.lua_AutoCursor:new()
      r1_157, r2_157 = r3_157:GetCursorPos(r1_157, r2_157)
      r3_157:delete()
      if 0 <= r1_157 and r1_157 <= 100 then
        r0_157:MoveCgPos(r0_157.LoadCgInf.EventCG.posx + 100 - r1_157, r0_157.LoadCgInf.EventCG.posy)
      end
      if r1_157 < APP_INTERNAL_WIDTH and APP_INTERNAL_WIDTH - 100 <= r1_157 then
        r0_157:MoveCgPos(r0_157.LoadCgInf.EventCG.posx - r1_157 - APP_INTERNAL_WIDTH - 100, r0_157.LoadCgInf.EventCG.posy)
      end
      if 0 <= r2_157 and r2_157 <= 100 then
        r0_157:MoveCgPos(r0_157.LoadCgInf.EventCG.posx, r0_157.LoadCgInf.EventCG.posy + 100 - r2_157)
      end
      if r2_157 < APP_INTERNAL_HEIGHT and APP_INTERNAL_HEIGHT - 100 <= r2_157 then
        r0_157:MoveCgPos(r0_157.LoadCgInf.EventCG.posx, r0_157.LoadCgInf.EventCG.posy - r2_157 - APP_INTERNAL_HEIGHT - 100)
      end
    end
  end
  function g_Menu.CgBrowser.ptr.DragStart(r0_158, r1_158, r2_158)
    -- line: [5973, 5977] id: 158
    r0_158.DragMoveFlag = true
    r0_158.DragMovePosx = r1_158
    r0_158.DragMovePosy = r2_158
  end
  function g_Menu.CgBrowser.ptr.PosCalc(r0_159, r1_159, r2_159)
    -- line: [5979, 6013] id: 159
    local r3_159 = 0
    local r4_159 = 0
    local r5_159 = 0
    local r6_159 = nil
    local r7_159 = 0
    local r8_159 = 0
    r5_159, r6_159, r7_159, r8_159 = cclass.lua_Layers:create():getParam(r0_159.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, 0, 0, 0, 0)
    r3_159 = (r0_159.LoadCgInf.EventCG.size_w * r5_159 - r0_159.LoadCgInf.EventCG.size_w) / 2
    r4_159 = (r0_159.LoadCgInf.EventCG.size_h * r6_159 - r0_159.LoadCgInf.EventCG.size_h) / 2
    local r10_159 = 0 - r0_159.LoadCgInf.EventCG.size_w - APP_INTERNAL_WIDTH - r3_159
    local r11_159 = 0 - r0_159.LoadCgInf.EventCG.size_h - APP_INTERNAL_HEIGHT - r4_159
    if r0_159.LoadCgInf.EventCG.size_w * r5_159 < APP_INTERNAL_WIDTH then
      r1_159 = (APP_INTERNAL_WIDTH - r0_159.LoadCgInf.EventCG.size_w) / 2
    else
      if r1_159 < r10_159 then
        r1_159 = r10_159
      end
      if r3_159 < r1_159 then
        r1_159 = r3_159
      end
    end
    if r0_159.LoadCgInf.EventCG.size_h * r6_159 < APP_INTERNAL_HEIGHT then
      r2_159 = (APP_INTERNAL_HEIGHT - r0_159.LoadCgInf.EventCG.size_h) / 2
    else
      if r2_159 < r11_159 then
        r2_159 = r11_159
      end
      if r4_159 < r2_159 then
        r2_159 = r4_159
      end
    end
    return r1_159, r2_159
  end
  function g_Menu.CgBrowser.ptr.Cursor(r0_160)
    -- line: [6016, 6030] id: 160
    local r1_160 = cclass.lua_AutoCursor:new()
    local r2_160 = 0
    local r3_160 = cclass.lua_Layers:create()
    local r4_160 = 0
    local r5_160 = 0
    r4_160, r5_160, r6_160, r7_160 = r3_160:getParam(r0_160.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, r4_160, r5_160, 0, 0)
    if (APP_INTERNAL_WIDTH < r0_160.LoadCgInf.EventCG.size_w * r4_160 or APP_INTERNAL_HEIGHT < r0_160.LoadCgInf.EventCG.size_h * r5_160) and (not r0_160.DragMoveFlag or 2) then
      r2_160 = 1
    end
    r1_160:SetCursor(0)
    r1_160:delete()
  end
  function g_Menu.CgBrowser.ptr.InitBrowserButton(r0_161)
    -- line: [6034, 6058] id: 161
    r0_161.CloseButton = false
    r0_161:LoadSystemMenu("CgBrowser01", "SYS_GalleryBrowser.pna")
    r0_161:MenuButtonSet(r0_161.MenuButtonData, "Down", 0, "CgBrowser01", 9, 9, 2, -1, -1, 1, 0, 0)
    r0_161:MenuButtonSet(r0_161.MenuButtonData, "Up", 0, "CgBrowser01", 10, 10, 3, -1, -1, 2, 0, 0)
    r0_161:MenuButtonSet(r0_161.MenuButtonData, "Right", 0, "CgBrowser01", 11, 11, 4, -1, -1, 3, 0, 0)
    r0_161:MenuButtonSet(r0_161.MenuButtonData, "Left", 0, "CgBrowser01", 12, 12, 5, -1, -1, 4, 0, 0)
    r0_161:MenuButtonSet(r0_161.MenuButtonData, "Close", 0, "CgBrowser01", 13, 13, 6, -1, -1, 5, 0, 0)
    r0_161:MenuButtonSet(r0_161.MenuButtonData, "Next", 0, "CgBrowser01", 16, -1, -1, -1, -1, 99, 0, 0)
    r0_161.MenuButtonData.Next.se_click = -1
    r0_161.MenuButtonData.Next.se_on = -1
    cclass.lua_Layers:create():initSubLayer(r0_161.MenuInf.SetName, "CgBrowser01", 15, 1)
    r0_161:MenuButtonInit()
    r0_161:ActiveBrowserButton()
  end
  function g_Menu.CgBrowser.ptr.ActiveBrowserButton(r0_162)
    -- line: [6061, 6158] id: 162
    -- notice: unreachable block#23
    -- notice: unreachable block#30
    -- notice: unreachable block#31
    -- notice: unreachable block#22
    -- notice: unreachable block#16
    -- notice: unreachable block#20
    -- notice: unreachable block#21
    -- notice: unreachable block#27
    -- notice: unreachable block#28
    -- notice: unreachable block#24
    -- notice: unreachable block#19
    -- notice: unreachable block#26
    -- notice: unreachable block#18
    -- notice: unreachable block#29
    -- notice: unreachable block#25
    -- notice: unreachable block#17
    local r1_162 = cclass.lua_Layers:create()
    local r2_162 = {
      "Down",
      "Up",
      "Right",
      "Left",
      "Close"
    }
    if r0_162.LoadCgInf.EventCG.Movable then
      if r0_162.CloseButton then
        for r6_162, r7_162 in pairs(r2_162) do
          r0_162.MenuButtonData[r7_162]:bt_SetActive(3)
        end
        r1_162:setSubLayerVisible(r0_162.MenuInf.SetName, "CgBrowser01", 15, 0)
      else
        r0_162.MenuButtonData.Close:bt_SetActive(0)
        r1_162:setSubLayerVisible(r0_162.MenuInf.SetName, "CgBrowser01", 15, 1)
        local r3_162 = 0
        local r4_162 = 0
        local r5_162 = 0
        local r6_162 = nil
        local r7_162 = 0
        local r8_162 = 0
        r5_162, r6_162, r7_162, r8_162 = r1_162:getParam(r0_162.MenuInf.SetName, "EventCG", LUA_PARAM_SCALE, 0, 0, 0, 0)
        local r9_162 = r0_162.LoadCgInf.EventCG.size_w
        local r10_162 = r0_162.LoadCgInf.EventCG.size_h
        if r5_162 ~= 1 then
          r9_162 = r0_162.LoadCgInf.EventCG.size_w * r5_162
        end
        if r6_162 ~= 1 then
          r10_162 = r0_162.LoadCgInf.EventCG.size_h * r6_162
        end
        if r9_162 <= APP_INTERNAL_WIDTH then
          r0_162.MenuButtonData.Left:bt_SetActive(3)
          r0_162.MenuButtonData.Right:bt_SetActive(3)
        else
          r0_162.MenuButtonData.Left:bt_SetActive(0)
          r0_162.MenuButtonData.Right:bt_SetActive(0)
        end
        if r10_162 <= APP_INTERNAL_HEIGHT then
          r0_162.MenuButtonData.Up:bt_SetActive(3)
          r0_162.MenuButtonData.Down:bt_SetActive(3)
        else
          r0_162.MenuButtonData.Up:bt_SetActive(0)
          r0_162.MenuButtonData.Down:bt_SetActive(0)
        end
      end
    else
      for r6_162, r7_162 in pairs(r2_162) do
        r0_162.MenuButtonData[r7_162]:bt_SetActive(3)
      end
      r1_162:setSubLayerVisible(r0_162.MenuInf.SetName, "CgBrowser01", 15, 0)
    end
  end
  g_Menu.CgBrowser.ptr.Different = 1
  g_Menu.CgBrowser.ptr.LoadCgInf = {}
  function g_Menu.CgBrowser.ptr.LoadCg(r0_163, r1_163, r2_163)
    -- line: [6167, 6231] id: 163
    -- notice: unreachable block#6
    -- notice: unreachable block#12
    -- notice: unreachable block#8
    -- notice: unreachable block#9
    -- notice: unreachable block#11
    -- notice: unreachable block#4
    -- notice: unreachable block#7
    -- notice: unreachable block#5
    -- notice: unreachable block#10
    local r3_163 = r0_163:MenuLoadLayer(r1_163, r2_163)
    local r4_163 = cclass.lua_Layers:create()
    for r8_163, r9_163 in pairs(g_CgBrowserList.Layer) do
      r4_163:initSubLayer(r0_163.MenuInf.SetName, r1_163, r9_163, 1)
    end
    local r5_163 = 0
    local r6_163 = 0
    r5_163, r6_163, r7_163, r8_163 = r4_163:getParam(r0_163.MenuInf.SetName, r1_163, LUA_PARAM_SIZE, r5_163, r6_163, 0, 0)
    local r9_163 = r5_163
    local r10_163 = r6_163
    local r11_163 = 1
    local r12_163 = 0.5
    local r13_163 = false
    if APP_INTERNAL_WIDTH < r5_163 or APP_INTERNAL_HEIGHT < r6_163 then
      r13_163 = true
    end
    local r14_163 = (APP_INTERNAL_WIDTH - r9_163) / 2
    local r15_163 = (APP_INTERNAL_HEIGHT - r10_163) / 2
    r4_163:setParam(r0_163.MenuInf.SetName, r1_163, LUA_PARAM_POS, r14_163, r15_163, 0, 0)
    r0_163.LoadCgInf[r1_163] = {
      posx = r14_163,
      posy = r15_163,
      size_w = r9_163,
      size_h = r10_163,
      Scale = r11_163,
      MinScale = r12_163,
      Movable = r13_163,
    }
    r0_163:Cursor()
    return r3_163
  end
  function g_Menu.CgBrowser.ptr.closeBrowser(r0_164)
    -- line: [6234, 6245] id: 164
    r0_164:MenuEffectToMenu(0)
    r0_164.MenuInf.enabled = false
    r0_164.MenuInf.effect = true
    cclass.lua_Layers:create():rtSnap("system")
    local r2_164 = cclass.lua_AutoCursor:new()
    r2_164:SetCursor(0)
    r2_164:delete()
  end
  local r2_139 = g_Menu.CgBrowser.ptr:MenuInit()
  if res == false then
    return false
  end
  if g_Menu.CgBrowser.ptr:LoadCg("EventCG", r0_139) == false then
    print("ファイルが無かった")
  end
  g_Menu.CgBrowser.ptr:InitBrowserButton()
  cclass.lua_Layers:create():copySnap("CgBrowser", "system")
  g_Menu.CgBrowser.ptr:MenuEffectStart(200)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
function ScriptLogOut(r0_165, r1_165)
  -- line: [6282, 6294] id: 165
  if getAppInfo() ~= 0 then
    local r3_165 = nil
    if r1_165 ~= 0 then
      r3_165 = io.open("シーン通過ログ.txt", "w")
    else
      r3_165 = io.open("シーン通過ログ.txt", "a")
    end
    r3_165:write(r0_165 .. "\n")
    r3_165:close()
  end
end
function openMoveBrowser(r0_166, r1_166)
  -- line: [6301, 6473] id: 166
  g_Menu.MoveBrowser.ptr = Menu.new("MoveBrowser")
  function g_Menu.MoveBrowser.ptr.MenuInit(r0_167)
    -- line: [6313, 6325] id: 167
    local r1_167 = true
    r0_167.MenuInf.enabled = true
    r0_167.MenuInf.effect = true
    if cclass.lua_Layers:create():add(r0_167.MenuInf.SetName) == false then
      return false
    end
    return r1_167
  end
  function g_Menu.MoveBrowser.ptr.MenuEffectEndJob(r0_168)
    -- line: [6328, 6342] id: 168
    local r1_168 = cclass.lua_Layers:create()
    if r0_168.MenuInf.enabled ~= true then
      r1_168:removeLayer(r0_168.MenuInf.SetName, "%EventMove%")
      r1_168:remove(r0_168.MenuInf.SetName)
      cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_UNPAUSED, 0)
      r0_168.MenuInf.ButtonLayer = ""
      r0_168.MenuInf.ButtonPna = ""
    end
  end
  function g_Menu.MoveBrowser.ptr.MenuEffectStart(r0_169, r1_169)
    -- line: [6345, 6353] id: 169
    cclass.lua_Layers:create():startTransition(r0_169.MenuInf.SetName, 0, 1, r1_169 * getEffectRate(), 0, LUA_TRANSITION_NORMAL)
    r0_169.MenuInf.enabled = true
    r0_169.MenuInf.effect = true
  end
  function g_Menu.MoveBrowser.ptr.GetMenuMouseEnable(r0_170)
    -- line: [6355, 6366] id: 170
    local r1_170 = false
    if r0_170.MenuInf.enabled == true and r0_170.MenuInf.effect == false then
      r1_170 = true
    end
    return r1_170
  end
  function g_Menu.MoveBrowser.ptr.MenuMouseMove(r0_171, r1_171, r2_171, r3_171, r4_171, r5_171, r6_171)
    -- line: [6372, 6378] id: 171
    if r6_171 == true then
      return 
    end
    if r0_171:GetMenuMouseEnable() then
    end
  end
  function g_Menu.MoveBrowser.ptr.MenuLButtonDown(r0_172, r1_172, r2_172, r3_172, r4_172, r5_172, r6_172)
    -- line: [6380, 6391] id: 172
    local r7_172 = 0
    if r6_172 == true then
      return r7_172
    end
    if r0_172:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, 0)
      r0_172:closeBrowser()
    end
    return r7_172
  end
  function g_Menu.MoveBrowser.ptr.MenuLButtonUp(r0_173, r1_173, r2_173, r3_173, r4_173, r5_173, r6_173)
    -- line: [6393, 6399] id: 173
    local r7_173 = 0
    if r6_173 == true then
      return r7_173
    end
    return r7_173
  end
  function g_Menu.MoveBrowser.ptr.MenuRButtonDown(r0_174, r1_174, r2_174, r3_174, r4_174, r5_174, r6_174)
    -- line: [6401, 6409] id: 174
    local r7_174 = 0
    if r6_174 == true then
      return r7_174
    end
    if r0_174:GetMenuMouseEnable() then
    end
    return r7_174
  end
  function g_Menu.MoveBrowser.ptr.MenuRButtonUp(r0_175, r1_175, r2_175, r3_175, r4_175, r5_175, r6_175)
    -- line: [6411, 6424] id: 175
    local r7_175 = 0
    if r6_175 == true then
      return r7_175
    end
    if r0_175:GetMenuMouseEnable() then
      cfunc.LegacyGame__lua_SetVariable(99, -1)
      r0_175:closeBrowser()
    end
    return r7_175
  end
  function g_Menu.MoveBrowser.ptr.LoadMove(r0_176, r1_176, r2_176)
    -- line: [6430, 6435] id: 176
    return cclass.lua_Layers:create():insertMovieLayer(r0_176.MenuInf.SetName, r1_176, r2_176, 1)
  end
  function g_Menu.MoveBrowser.ptr.closeBrowser(r0_177)
    -- line: [6439, 6447] id: 177
    r0_177:MenuEffectToMenu(0)
    r0_177.MenuInf.enabled = false
    r0_177.MenuInf.effect = true
    cclass.lua_Layers:create():rtSnap("system")
  end
  local r2_166 = g_Menu.MoveBrowser.ptr:MenuInit()
  if res == false then
    return false
  end
  g_Menu.MoveBrowser.ptr._number = r1_166
  if g_Menu.MoveBrowser.ptr:LoadMove("%EventMove%", r0_166) == false then
    print("ファイルが無かった")
  end
  cclass.lua_Layers:create():copySnap("MoveBrowser", "system")
  g_Menu.MoveBrowser.ptr:MenuEffectStart(200)
  cfunc.LegacyGame__lua_NeedProcess(LUA_PROCESS_GAME_PAUSED, 0)
  g_menuExecute = true
  return true
end
