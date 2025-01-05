local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DiscordBridge = require(ReplicatedStorage.Packages.DiscordBridge)

-- Note that this webhook URL is now invalid
local URL = "https://discord.com/api/webhooks/1324818601055617104/urlv_XmpMBEEcE-t9woN4k2n_mUaJZwfDlLA5ZeBK87bkKZycuQ2xjAMJTLyTyCFiMP1"

local Hook = DiscordBridge.Hook.new(URL)

local Fields = DiscordBridge.EmbedFields.new()
	:AddField("[X] ore found", "This is the [x] [ORE] ever found in manic mines", true)
	:AddField("Found in cave", "This [ORE] was found in a cave", true)

local EmbedMessage = DiscordBridge.Message.new()
	:WithName("Manic Mines Bot Of Coolness!")
	:WithAvatar("https://tr.rbxcdn.com/180DAY-f70f664de100cb2ff72a965097f570ef/256/256/Image/Webp/noFilter")
	:AddEmbed("[PLAYER] found Iron!", "", "[PLAYER] found Iron which is a (x/x) rare ore. This is [PLAYER]'s [X] time getting [ORE]", "", Color3.new(1, 0, 0), Fields)

Hook:SendMessage(EmbedMessage)