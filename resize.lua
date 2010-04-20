local dummy = function() end

WORLDMAP_QUESTLIST_SIZE = WORLDMAP_FULLMAP_SIZE
WORLDMAP_SETTINGS.size = WORLDMAP_QUESTLIST_SIZE
WorldMapFrame_SetPOIMaxBounds()

WorldMapQuestScrollFrame:ClearAllPoints()
WorldMapQuestScrollFrame:SetPoint("TOPRIGHT", WorldMapDetailFrame, "TOPRIGHT", -20, 0)

local bg = WorldMapQuestScrollFrame:CreateTexture(nil, "BACKGROUND")
bg:SetPoint("TOPLEFT")
bg:SetPoint("BOTTOMRIGHT", 20, 0)
bg:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
bg:SetVertexColor(0, 0, 0)
bg:SetAlpha(0.5)

for k,v in pairs{
	WorldMapQuestRewardScrollFrame,
	WorldMapQuestDetailScrollFrame,
} do v:Hide(); v.Show = v.Hide end

hooksecurefunc("WorldMapFrame_SetQuestMapView", function()
	WorldMapQuestScrollFrame:SetFrameLevel(30)
	WorldMapDetailFrame:SetPoint("TOPLEFT", WorldMapPositioningGuide, "TOP", -502, -69)
	for i = NUM_WORLDMAP_DETAIL_TILES + 1, NUM_WORLDMAP_DETAIL_TILES + NUM_WORLDMAP_PATCH_TILES do
		_G["WorldMapFrameTexture"..i]:Show()
	end
end)