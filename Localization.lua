local addonName = ...
local SAdCore = LibStub("SAdCore-1")
local addon = SAdCore:GetAddon(addonName)

-- English
addon.locale.enEN = {
    arenaTitle = "Arena",
    battlegroundTitle = "Battleground",
    dungeonTitle = "Dungeon",
    raidTitle = "Raid",
    worldTitle = "World",
    allowBnetWhispers = "Allow Battle.net Whispers",
    allowBnetWhispersTooltip = "Enable Battle.net whisper messages in this zone",
    allowWhispers = "Allow Whispers",
    allowWhispersTooltip = "Enable whisper messages in this zone",
    allowSay = "Allow Say/Yell",
    allowSayTooltip = "Enable /say and /yell custom emote messages in this zone",
    allowPartyChat = "Allow Party Chat",
    allowPartyChatTooltip = "Enable party chat messages in this zone",
    allowRaidChat = "Allow Raid Chat",
    allowRaidChatTooltip = "Enable raid chat messages in this zone",
    allowGuildChat = "Allow Guild Chat",
    allowGuildChatTooltip = "Enable guild chat messages in this zone"
}

-- Spanish
addon.locale.esES = {
    arenaTitle = "Arena",
    battlegroundTitle = "Campo de Batalla",
    dungeonTitle = "Mazmorra",
    raidTitle = "Banda",
    worldTitle = "Mundo",
    allowBnetWhispers = "Permitir Susurros de Battle.net",
    allowBnetWhispersTooltip = "Habilitar mensajes de susurro de Battle.net en esta zona",
    allowWhispers = "Permitir Susurros",
    allowWhispersTooltip = "Habilitar mensajes de susurro en esta zona",
    allowSay = "Permitir Decir/Gritar",
    allowSayTooltip = "Habilitar mensajes de emotes personalizados /decir y /gritar en esta zona",
    allowPartyChat = "Permitir Chat de Grupo",
    allowPartyChatTooltip = "Habilitar mensajes de chat de grupo en esta zona",
    allowRaidChat = "Permitir Chat de Banda",
    allowRaidChatTooltip = "Habilitar mensajes de chat de banda en esta zona",
    allowGuildChat = "Permitir Chat de Hermandad",
    allowGuildChatTooltip = "Habilitar mensajes de chat de hermandad en esta zona"
}

addon.locale.esMX = addon.locale.esES

-- Portuguese
addon.locale.ptBR = {
    arenaTitle = "Arena",
    battlegroundTitle = "Campo de Batalha",
    dungeonTitle = "Masmorra",
    raidTitle = "Raide",
    worldTitle = "Mundo",
    allowBnetWhispers = "Permitir Sussurros do Battle.net",
    allowBnetWhispersTooltip = "Habilitar mensagens de sussurro do Battle.net nesta zona",
    allowWhispers = "Permitir Sussurros",
    allowWhispersTooltip = "Habilitar mensagens de sussurro nesta zona",
    allowSay = "Permitir Dizer/Gritar",
    allowSayTooltip = "Habilitar mensagens de emotes personalizadas /dizer e /gritar nesta zona",
    allowPartyChat = "Permitir Chat do Grupo",
    allowPartyChatTooltip = "Habilitar mensagens de chat do grupo nesta zona",
    allowRaidChat = "Permitir Chat da Raide",
    allowRaidChatTooltip = "Habilitar mensagens de chat da raide nesta zona",
    allowGuildChat = "Permitir Chat da Guilda",
    allowGuildChatTooltip = "Habilitar mensagens de chat da guilda nesta zona"
}

-- French
addon.locale.frFR = {
    arenaTitle = "Arène",
    battlegroundTitle = "Champ de Bataille",
    dungeonTitle = "Donjon",
    raidTitle = "Raid",
    worldTitle = "Monde",
    allowBnetWhispers = "Autoriser les Chuchotements Battle.net",
    allowBnetWhispersTooltip = "Activer les messages de chuchotement Battle.net dans cette zone",
    allowWhispers = "Autoriser les Chuchotements",
    allowWhispersTooltip = "Activer les messages de chuchotement dans cette zone",
    allowSay = "Autoriser Dire/Crier",
    allowSayTooltip = "Activer les messages d'émotes personnalisées /dire et /crier dans cette zone",
    allowPartyChat = "Autoriser le Chat de Groupe",
    allowPartyChatTooltip = "Activer les messages du chat de groupe dans cette zone",
    allowRaidChat = "Autoriser le Chat de Raid",
    allowRaidChatTooltip = "Activer les messages du chat de raid dans cette zone",
    allowGuildChat = "Autoriser le Chat de Guilde",
    allowGuildChatTooltip = "Activer les messages du chat de guilde dans cette zone"
}

-- German
addon.locale.deDE = {
    arenaTitle = "Arena",
    battlegroundTitle = "Schlachtfeld",
    dungeonTitle = "Dungeon",
    raidTitle = "Schlachtzug",
    worldTitle = "Welt",
    allowBnetWhispers = "Battle.net-Flüstern erlauben",
    allowBnetWhispersTooltip = "Battle.net-Flüsternachrichten in dieser Zone aktivieren",
    allowWhispers = "Flüstern erlauben",
    allowWhispersTooltip = "Flüsternachrichten in dieser Zone aktivieren",
    allowSay = "Sagen/Schreien erlauben",
    allowSayTooltip = "Benutzerdefinierte Emote-Nachrichten /sagen und /schreien in dieser Zone aktivieren",
    allowPartyChat = "Gruppenchat erlauben",
    allowPartyChatTooltip = "Gruppenchat-Nachrichten in dieser Zone aktivieren",
    allowRaidChat = "Schlachtzugchat erlauben",
    allowRaidChatTooltip = "Schlachtzugchat-Nachrichten in dieser Zone aktivieren",
    allowGuildChat = "Gildenchat erlauben",
    allowGuildChatTooltip = "Gildenchat-Nachrichten in dieser Zone aktivieren"
}

-- Russian
addon.locale.ruRU = {
    arenaTitle = "Арена",
    battlegroundTitle = "Поле Боя",
    dungeonTitle = "Подземелье",
    raidTitle = "Рейд",
    worldTitle = "Мир",
    allowBnetWhispers = "Разрешить шепот Battle.net",
    allowBnetWhispersTooltip = "Включить сообщения шепота Battle.net в этой зоне",
    allowWhispers = "Разрешить Шепот",
    allowWhispersTooltip = "Включить сообщения шепота в этой зоне",
    allowSay = "Разрешить Сказать/Крикнуть",
    allowSayTooltip = "Включить пользовательские сообщения эмоций /сказать и /крикнуть в этой зоне",
    allowPartyChat = "Разрешить Чат Группы",
    allowPartyChatTooltip = "Включить сообщения чата группы в этой зоне",
    allowRaidChat = "Разрешить Чат Рейда",
    allowRaidChatTooltip = "Включить сообщения чата рейда в этой зоне",
    allowGuildChat = "Разрешить Чат Гильдии",
    allowGuildChatTooltip = "Включить сообщения чата гильдии в этой зоне"
}
