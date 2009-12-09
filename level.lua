local function tagMe(id)
	local name, lvl = GetQuestLogTitle(id)
	return ("[%d] %s"):format(lvl, name)
end

hooksecurefunc("WorldMapFrame_UpdateQuests", function()
	i = 1
	local frame = _G["WorldMapQuestFrame"..i]
	while(frame) do
		frame.title:SetText(tagMe(frame.questLogIndex))
		i = i+1
		frame = _G["WorldMapQuestFrame"..i]
	end
end)

hooksecurefunc("WorldMapQuestPOI_SetTooltip", function(self, questLogIndex)
	WorldMapTooltipTextLeft1:SetText(tagMe(questLogIndex))
	local color = GetQuestDifficultyColor(select(2, GetQuestLogTitle(questLogIndex)))
	WorldMapTooltipTextLeft1:SetTextColor(color.r, color.g, color.b)
	WorldMapTooltip:AppendText("")
end)