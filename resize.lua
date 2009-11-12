local dummy = function() end

WorldMapQuestScrollFrame:ClearAllPoints()
WorldMapQuestScrollFrame:SetPoint("TOPRIGHT", WorldMapDetailFrame, "TOPRIGHT", -20, 0)
WorldMapQuestScrollFrame:SetFrameLevel(3)

local bg = WorldMapQuestScrollFrame:CreateTexture(nil, "BACKGROUND")
bg:SetPoint("TOPLEFT")
bg:SetPoint("BOTTOMRIGHT", 20, 0)
bg:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
bg:SetVertexColor(0, 0, 0)
bg:SetAlpha(0.5)

local init = true

local function adjustToBig()
	WorldMapFrame.bigMap = true
	WorldMapFrame.scale = WORLDMAP_RATIO_FULL
	WorldMapDetailFrame:SetScale(WORLDMAP_RATIO_FULL)
	WorldMapButton:SetScale(WORLDMAP_RATIO_FULL)
	WorldMapDetailFrame:SetPoint("TOPLEFT", WorldMapPositioningGuide, "TOP", -502, -69)
	WorldMapPOIFrame.ratio = 1
	WorldMapBlobFrame:SetScale(WORLDMAP_RATIO_FULL);
	init = nil
end

WorldMapFrame_AdjustMapAndQuestList = function()
	if(WorldMapFrame.sizedDown) then return end

	if(init) then adjustToBig() end

	if(WatchFrame.showObjectives and WorldMapFrame.numQuests > 0) then
		WorldMapQuestScrollFrame:Show()
		WorldMapBlobFrame:Show()
		WorldMapPOIFrame:Show()
	else
		WorldMapQuestScrollFrame:Hide()
		WorldMapBlobFrame:Hide()
		WorldMapPOIFrame:Hide()
	end
	WorldMapQuestDetailScrollFrame:Hide()
	WorldMapQuestRewardScrollFrame:Hide()
end

hooksecurefunc("WorldMap_ToggleSizeUp", adjustToBig)