local function handleModified(self, button)
	local index = self.questLogIndex

	if(IsModifiedClick()) then
		QuestLogTitleButton_OnClick(self, _G["QuestLogScrollFrameButton"..index])
		local questLink = GetQuestLink(index)
		return true
	end
	if(button == "RightButton") then
		QuestLog_SetSelection(index)
		QuestLogDetailFrame:Show()
		return true
	end
end

WorldMapQuestFrame_OnMouseUp = function(self, button)
	self.title:SetPoint("TOPLEFT", 34, -8)
	if(handleModified(self, button)) then return end
	if(self:IsMouseOver() and WorldMapQuestScrollChildFrame.selected ~= self) then
		WorldMapQuestHighlightedFrame:Hide()
		WorldMapFrame_SelectQuest(self)
	end
end

_WorldMapQuestPOI_OnClick = WorldMapQuestPOI_OnClick
WorldMapQuestPOI_OnClick = function(self, button)
	if(handleModified(self.quest, button)) then return end
	return _WorldMapQuestPOI_OnClick(self, button)
end