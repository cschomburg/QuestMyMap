local function handleModified(self, button)
	if(IsModifiedClick("CHATLINK") and ChatFrameEditBox:IsVisible()) then
		local questLink = GetQuestLink(self.questLogIndex)
		if(questLink) then
			ChatEdit_InsertLink(questLink)
		end
		return true
	end
	if(button == "RightButton") then
		QuestLogFrame:Show()
		QuestLog_SetSelection(self.questLogIndex)
		WorldMapFrame:Hide()
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