-----------------------------------------
--                                     --
--         Graphics correction         --
--                                     --
-----------------------------------------

graphics_arc = "Graphic.arc"

function SetIsJPWs2(self, arg)
  if arg == 1 then
    graphics_arc = "Graphic_JP.arc"
  else
    graphics_arc = "Graphic.arc"
  end
end

function getGraphicsArcFileName(self, asset)
  if string.lower(string.sub(asset, 1, 4)) == "sys_" then return "SysGraphic.arc" end
  if string.lower(string.sub(asset, 1, 5)) == "efmsk" then return graphics_arc end
  if string.lower(string.sub(asset, 1, 5)) == "layer" then return graphics_arc end
  if string.lower(string.sub(asset, 1, 6)) == "cutin_" then return "Chip2.arc" end
  if string.lower(string.sub(asset, 1, 6)) == "hoshi_" then return "Chip2.arc" end
  if string.lower(string.sub(asset, 1, 6)) == "appli_" then return "Chip2.arc" end
  if string.lower(string.sub(asset, 1, 2)) == "bg" then
    if string.lower(string.sub(asset, -6)) == "_l.png" then
      return "Chip1A.arc"
    end
    return "Chip1.arc"
  end
  if string.lower(string.sub(asset, 1, 3)) == "sky" then return "Chip1.arc" end
  if string.lower(string.sub(asset, 1, 4)) == "com_" then return "Chip3.arc" end
  if string.lower(string.sub(asset, 1, 4)) == "hik_" then return "Chip3.arc" end
  if string.lower(string.sub(asset, 1, 4)) == "kor_" then return "Chip3A.arc" end
  if string.lower(string.sub(asset, 1, 4)) == "ori_" then return "Chip3A.arc" end
  if string.lower(string.sub(asset, 1, 4)) == "say_" then return "Chip3B.arc" end
  if string.lower(string.sub(asset, 1, 5)) == "sdev_" then return "Chip4.arc" end
  if string.lower(string.sub(asset, 1, 2)) == "ef" then return "Chip2.arc" end
  if string.lower(string.sub(asset, 1, 3)) == "est" then return "Chip2.arc" end
  if string.lower(string.sub(asset, 1, 2)) == "im" then return "Chip2.arc" end
  if string.lower(string.sub(asset, 1, 5)) == "noise" then return "Chip2.arc" end
  if string.lower(string.sub(asset, 1, 4)) == "hand" then return "Chip2.arc" end
  if string.lower(string.sub(asset, 1, 4)) == "fall" then return "Chip2.arc" end
  if string.lower(string.sub(asset, 1, 5)) == "grass" then return "Chip2.arc" end
  return graphics_arc
end

-----------------------------------------
--                                     --
--            Restore Scene            --
--                                     --
-----------------------------------------

oldMenuNew = Menu.new
function Menu.new(type)
  local ret = oldMenuNew(type)
  if type ~= "Gallery" then
    return ret
  end

  function newindex(self, field, value)
    if field ~= "InitGallery" then
      rawset(self, field, value)
      return
    end
    
    function InitGallery(self, arg)
      local layer = cclass.lua_Layers:create()
      g_Menu.GalleryMenu.ptr:MenuLoadLayer("GalleryBace", "SYS_GalleryBase.pna")
      g_Menu.GalleryMenu.ptr:MenuLoadLayer("GalleryBaceBack", "SYS_Gallery_bg.png")
      layer:swapLayerOrder("Gallery", "GalleryBace", "GalleryBaceBack")
      for i = 0, 2, 1 do
        local image1 = 51 + i * 4
        local image2 = image1 - 1
        layer:initSubLayer("Gallery", "GalleryBace", image1, 1)
        layer:initSubLayer("Gallery", "GalleryBace", image2, 1)
        local posx = 0
        local posy = 0
        posx, posy, unused, unused = layer:getSubLayerParam("Gallery", "GalleryBace", image1, LUA_PARAM_POS, 0, 0, 0, 0)
        self.LogoMainPos[i + 1] = {
          posx = posx,
          posy = posy,
        }
        posx, posy, unused, unused = layer:getSubLayerParam("Gallery", "GalleryBace", image2, LUA_PARAM_POS, 0, 0, 0, 0)
        self.LogoSubPos[i + 1] = {
          posx = posx,
          posy = posy,
        }
        layer:setSubLayerParam("Gallery", "GalleryBace", image1, LUA_PARAM_COLOR, 1, 1, 1, 0)
        layer:setSubLayerParam("Gallery", "GalleryBace", image2, LUA_PARAM_COLOR, 1, 1, 1, 0)
        layer:initSubLayer("Gallery", "GalleryBace", 46 - i, 0)
      end
      layer:initSubLayer("Gallery", "GalleryBace", 62, 1)
      layer:initSubLayer("Gallery", "GalleryBace", 63, 1)
      layer:initSubLayer("Gallery", "GalleryBace", 64, 1)
      self.BT_DataBace = {}
      self:MenuButtonSet(self.BT_DataBace, "CG", 1, "GalleryBace",    21, 36, 26, 31, 41, 1, 0, 0)
      self:MenuButtonSet(self.BT_DataBace, "Scene", 1, "GalleryBace", 20, 35, 25, 30, 40, 2, 0, 0) -- NOTE: Added entry
      self:MenuButtonSet(self.BT_DataBace, "BGM", 1, "GalleryBace",   19, 34, 24, 29, 39, 3, 0, 0)
      self:MenuButtonSet(self.BT_DataBace, "stop", 1, "GalleryBace", 9, 9, 4, -1, 14, 10, 0, 0)
      self:MenuButtonSet(self.BT_DataBace, "back", 1, "GalleryBace", 8, 8, 3, -1, 13, 13, 0, 0)
      self:MenuButtonSet(self.BT_DataBace, "quit", 1, "GalleryBace", 7, 7, 2, -1, 12, 12, 0, 0)
      self.MenuButton:SetList("BT_DataBace", self.BT_DataBace)
      self:MenuButtonInit()
      local var103 = cfunc.LegacyGame__lua_GetVariable(103)
      if arg ~= 0 or cfunc.LegacyGame__lua_GetFlag(124) then
        if self.CompFlag then
          self:GalleryBgmPlay(2)
        else
          self:GalleryBgmPlay(26)
        end
      end
      cfunc.LegacyGame__lua_SetFlag(124, false)
      self:initPageGallery(var103, true)
    end

    rawset(self, field, InitGallery)
  end
  
  setmetatable(ret, { __newindex = newindex })
  return ret
end

oldGallerySceneMenu = GallerySceneMenu
GallerySceneMenu = function(arg)
  oldGallerySceneMenu(arg)

  function arg.GetSceneFlag(self, page, index)
    local thumbnail = (page - 1) * 12 + index
    if thumbnail > 17 then
      return -1
    end
    if cfunc.LegacyGame__lua_GetFlag(1089 + thumbnail) then
      return 1
    else
      return 0
    end
  end
end

-----------------------------------------
--                                     --
--              Restore CG             --
--                                     --
-----------------------------------------

oldGalleryCgMenu = GalleryCgMenu
function GalleryCgMenu(arg)
  oldGalleryCgMenu(arg)

  arg.CgMenu.PageMax = 10

  function arg.GetCgFlag(self, page, index)
    local thumbnail = (page - 1) * 12 + index
    if thumbnail > 109 then
      return -1
    end

    local flags = {
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
      EVHIK_15 = 1140,
      EVHIK_16 = 1141,
      EVHIK_17 = 1142,
      EVHIK_18 = 1143,
      EVHIK_19 = 1144,
      EVHIK_20 = 1145,
      EVHIK_21 = 1146,
      EVHIK_22 = 1147,
      EVHIK_23 = 1148,
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
      EVSAY_16 = 1164,
      EVSAY_17 = 1165,
      EVSAY_18 = 1166,
      EVSAY_19 = 1167,
      EVSAY_20 = 1168,
      EVSAY_21 = 1169,
      EVSAY_22 = 1170,
      EVSAY_23 = 1171,
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
      EVORI_13 = 1183,
      EVORI_14 = 1184,
      EVORI_15 = 1185,
      EVORI_16 = 1186,
      EVORI_17 = 1187,
      EVORI_18 = 1188,
      EVORI_19 = 1189,
      EVKOR_01 = 1190,
      EVKOR_02 = 1191,
      EVKOR_03 = 1192,
      EVKOR_04 = 1193,
      EVKOR_07 = 1194,
      EVKOR_08 = 1195,
      EVKOR_09 = 1196,
      EVKOR_10 = 1197,
      EVKOR_11 = 1198,
      EVKOR_12 = 1199,
      EVKOR_13 = 1200,
      EVKOR_14 = 1201,
      EVKOR_15 = 1202,
      EVKOR_16 = 1203,
      EVKOR_17 = 1204,
      EVKOR_18 = 1205,
      EVKOR_19 = 1206,
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
    local flag = ({
        flags.EVCOM_01,
        flags.EVCOM_02,
        flags.EVCOM_03,
        flags.EVCOM_04,
        flags.EVCOM_05,
        flags.EVCOM_06,
        flags.EVHIK_02,
        flags.EVHIK_03,
        flags.EVHIK_04,
        flags.EVHIK_01,
        flags.EVHIK_05,
        flags.EVHIK_06,
        flags.EVHIK_07,
        flags.EVHIK_08,
        flags.EVHIK_09,
        flags.EVHIK_10,
        flags.EVHIK_11,
        flags.EVHIK_12,
        flags.EVHIK_13,
        flags.EVHIK_14,
        flags.EVHIK_15,
        flags.EVHIK_16,
        flags.EVHIK_17,
        flags.EVHIK_18,
        flags.EVHIK_19,
        flags.EVHIK_20,
        flags.EVHIK_21,
        flags.EVHIK_22,
        flags.EVHIK_23,
        flags.EVSAY_03,
        flags.EVSAY_05,
        flags.EVSAY_09,
        flags.EVSAY_01,
        flags.EVSAY_02,
        flags.EVSAY_04,
        flags.EVSAY_06,
        flags.EVSAY_07,
        flags.EVSAY_08,
        flags.EVSAY_10,
        flags.EVSAY_11,
        flags.EVSAY_12,
        flags.EVSAY_13,
        flags.EVSAY_14,
        flags.EVSAY_15,
        flags.EVSAY_16,
        flags.EVSAY_17,
        flags.EVSAY_18,
        flags.EVSAY_19,
        flags.EVSAY_20,
        flags.EVSAY_21,
        flags.EVSAY_22,
        flags.EVSAY_23,
        flags.EVORI_01,
        flags.EVORI_02,
        flags.EVORI_03,
        flags.EVORI_04,
        flags.EVORI_05,
        flags.EVORI_07,
        flags.EVORI_08,
        flags.EVORI_09,
        flags.EVORI_10,
        flags.EVORI_11,
        flags.EVORI_12,
        flags.EVORI_13,
        flags.EVORI_14,
        flags.EVORI_15,
        flags.EVORI_16,
        flags.EVORI_17,
        flags.EVORI_18,
        flags.EVORI_19,
        flags.EVKOR_01,
        flags.EVKOR_02,
        flags.EVKOR_03,
        flags.EVKOR_04,
        flags.EVKOR_07,
        flags.EVKOR_08,
        flags.EVKOR_09,
        flags.EVKOR_10,
        flags.EVKOR_11,
        flags.EVKOR_12,
        flags.EVKOR_13,
        flags.EVKOR_14,
        flags.EVKOR_15,
        flags.EVKOR_16,
        flags.EVKOR_17,
        flags.EVKOR_18,
        flags.EVKOR_19,
        flags.SDEV_03,
        flags.SDEV_04,
        flags.SDEV_01,
        flags.SDEV_05,
        flags.SDEV_02,
        flags.SDEV_07,
        flags.SDEV_10,
        flags.SDEV_06,
        flags.SDEV_08,
        flags.SDEV_09,
        flags.SDEV_11,
        flags.SDEV_12,
        flags.SDEV_13,
        flags.SDEV_14,
        flags.SDEV_19,
        flags.SDEV_15,
        flags.SDEV_17,
        flags.SDEV_16,
        flags.SDEV_18,
        flags.SDEV_20,
        flags.SDEV_21,
        flags.SDEV_22,
    })[thumbnail]
    
    if cfunc.LegacyGame__lua_GetFlag(flag) then
      return 1
    else
      return 0
    end
  end

  function arg.GetCgThumbnailOnOff(self, page, index)
    local a = (page - 1) * 30 - (index - 1) + 13
    local b = (page - 1) * 30 - (index - 1) + 27
    if page == 10 then
      a = -(index - 1) + 272
      b = -(index - 1) + 275
    end
    local layerName = self.CgMenu.LayerName
    local layerNameOff = self.CgMenu.LayerNameOff
    if self.CgMenu.ThFileNameOff == nil then
      layerNameOff = self.CgMenu.LayerName
    end
    return a, b, layerName, layerNameOff
  end
end
