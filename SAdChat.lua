local addonName = ...
local SAdCore = LibStub("SAdCore-1")
local addon = SAdCore:GetAddon(addonName)

addon.sadCore.savedVarsGlobalName = "SAdChat_Settings_Global"
addon.sadCore.savedVarsPerCharName = "SAdChat_Settings_Char"
addon.sadCore.compartmentFuncName = "SAdChat_Compartment_Func"
addon.activeChatFilters = {}

function addon:CreateChatFilter(chatEvent)
    return function(self, event, message, sender, ...)
        addon:Debug(string.format("Filtered %s from %s", chatEvent, sender))
        return true
    end
end

function addon:Initialize()
    self.author = "Rôkk-Wyrmrest Accord"

    for _, zoneName in ipairs(addon.zones) do
        self:AddSettingsPanel(zoneName, {
            title = zoneName .. "Title",
            controls = {
                {
                    type = "checkbox",
                    name = "allowBnetWhispers",
                    default = true,
                    onValueChange = self.ApplyChatFiltersForZone
                },
                {
                    type = "checkbox",
                    name = "allowWhispers",
                    default = true,
                    onValueChange = self.ApplyChatFiltersForZone
                },                
                {
                    type = "checkbox",
                    name = "allowSay",
                    default = true,
                    onValueChange = self.ApplyChatFiltersForZone
                },
                {
                    type = "checkbox",
                    name = "allowPartyChat",
                    default = true,
                    onValueChange = self.ApplyChatFiltersForZone
                },
                {
                    type = "checkbox",
                    name = "allowRaidChat",
                    default = true,
                    onValueChange = self.ApplyChatFiltersForZone
                },
                {
                    type = "checkbox",
                    name = "allowGuildChat",
                    default = true,
                    onValueChange = self.ApplyChatFiltersForZone
                },
            }
        })
    end
end

function addon:OnZoneChange(currentZone)
    self:ApplyChatFiltersForZone()
end

function addon:ApplyChatFiltersForZone(currentZone)
    addon:Debug(string.format("Applying chat filters for zone: %s", tostring(self.currentZone)))

    self:allowBnetWhispers(self:GetValue(self.currentZone, "allowBnetWhispers"))
    self:allowWhispers(self:GetValue(self.currentZone, "allowWhispers"))
    self:allowSay(self:GetValue(self.currentZone, "allowSay"))
    self:allowPartyChat(self:GetValue(self.currentZone, "allowPartyChat"))
    self:allowRaidChat(self:GetValue(self.currentZone, "allowRaidChat"))
    self:allowGuildChat(self:GetValue(self.currentZone, "allowGuildChat"))
end

function addon:SetChatMessageFilter(chatEvent, allowChat)
    if allowChat then
        if addon.activeChatFilters[chatEvent] then
            ChatFrame_RemoveMessageEventFilter(chatEvent, addon.activeChatFilters[chatEvent])
            addon.activeChatFilters[chatEvent] = nil
            addon:Debug(string.format("Removed filter for %s", chatEvent))
        end
    else
        if not addon.activeChatFilters[chatEvent] then
            local filterFunc = self:CreateChatFilter(chatEvent)
            ChatFrame_AddMessageEventFilter(chatEvent, filterFunc)
            addon.activeChatFilters[chatEvent] = filterFunc
            addon:Debug(string.format("Added filter for %s", chatEvent))
        end
    end
end

function addon:allowBnetWhispers(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_BN_WHISPER", allowChat)
    addon:Debug("Set allowBnetWhispers to: " .. tostring(allowChat))
end

function addon:allowWhispers(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_WHISPER", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_WHISPER_INFORM", allowChat)
    addon:Debug("Set allowWhispers to: " .. tostring(allowChat))
end

function addon:allowSay(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_SAY", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_YELL", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_EMOTE", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_TEXT_EMOTE", allowChat)
    addon:Debug("Set allowSay to: " .. tostring(allowChat))
end

function addon:allowPartyChat(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_PARTY", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_PARTY_LEADER", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_INSTANCE_CHAT", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", allowChat)
    addon:Debug("Set allowPartyChat to: " .. tostring(allowChat))
end

function addon:allowRaidChat(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_RAID", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_RAID_LEADER", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_RAID_WARNING", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_INSTANCE_CHAT", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", allowChat)    
    addon:Debug("Set allowRaidChat to: " .. tostring(allowChat))
end

function addon:allowGuildChat(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_GUILD", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_OFFICER", allowChat)
    addon:Debug("Set allowGuildChat to: " .. tostring(allowChat))
end