local addonName = ...
local SAdCore = LibStub("SAdCore-1")
local addon = SAdCore:GetAddon(addonName)

addon.savedVarsGlobalName = "SAdChat_Settings_Global"
addon.savedVarsPerCharName = "SAdChat_Settings_Char"
addon.compartmentFuncName = "SAdChat_Compartment_Func"
addon.activeChatFilters = {}

function addon:LoadConfig()
    self.config.version = "1.0"
    self.author = "Rôkk-Wyrmrest Accord"

    for _, zoneName in ipairs(addon.zones) do
        self.config.settings[zoneName] = {
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
        }
    end
end

function addon:OnZoneChange(currentZone)
    self:ApplyChatFiltersForZone()
end

function addon:ApplyChatFiltersForZone(currentZone)
    local zoneSettings = self.settings[self.currentZone]
    if not zoneSettings then
        addon:debug(string.format("No settings found for zone: %s", tostring(self.currentZone)))
        return
    end

    addon:debug(string.format("Applying chat filters for zone: %s", tostring(self.currentZone)))

    self:allowBnetWhispers(zoneSettings.allowBnetWhispers)
    self:allowWhispers(zoneSettings.allowWhispers)
    self:allowSay(zoneSettings.allowSay)
    self:allowPartyChat(zoneSettings.allowPartyChat)
    self:allowRaidChat(zoneSettings.allowRaidChat)
    self:allowGuildChat(zoneSettings.allowGuildChat)
end

function addon:SetChatMessageFilter(chatEvent, allowChat)
    if allowChat then
        if addon.activeChatFilters[chatEvent] then
            ChatFrame_RemoveMessageEventFilter(chatEvent, addon.activeChatFilters[chatEvent])
            addon.activeChatFilters[chatEvent] = nil
        end
    else
        if not addon.activeChatFilters[chatEvent] then
            local filterFunc = function(self, event, ...)
                return true
            end
            
            ChatFrame_AddMessageEventFilter(chatEvent, filterFunc)
            addon.activeChatFilters[chatEvent] = filterFunc
        end
    end
end

function addon:allowBnetWhispers(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_BN_WHISPER", allowChat)
    addon:debug("Set allowBnetWhispers to: " .. tostring(allowChat))
end

function addon:allowWhispers(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_WHISPER", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_WHISPER_INFORM", allowChat)
    addon:debug("Set allowWhispers to: " .. tostring(allowChat))
end

function addon:allowSay(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_SAY", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_YELL", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_EMOTE", allowChat)
    addon:debug("Set allowSay to: " .. tostring(allowChat))
end

function addon:allowPartyChat(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_PARTY", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_PARTY_LEADER", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_INSTANCE_CHAT", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", allowChat)
    addon:debug("Set allowPartyChat to: " .. tostring(allowChat))
end

function addon:allowRaidChat(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_RAID", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_RAID_LEADER", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_RAID_WARNING", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_INSTANCE_CHAT", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", allowChat)    
    addon:debug("Set allowRaidChat to: " .. tostring(allowChat))
end

function addon:allowGuildChat(allow)
    local allowChat = allow == true
    addon:SetChatMessageFilter("CHAT_MSG_GUILD", allowChat)
    addon:SetChatMessageFilter("CHAT_MSG_OFFICER", allowChat)
    addon:debug("Set allowGuildChat to: " .. tostring(allowChat))
end