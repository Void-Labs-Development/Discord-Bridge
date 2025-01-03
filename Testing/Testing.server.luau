local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DiscordBridge = require(ReplicatedStorage.Packages.DiscordBridge)

-- Note that this webhook URL is now invalid
local URL = "https://discord.com/api/webhooks/1324818601055617104/urlv_XmpMBEEcE-t9woN4k2n_mUaJZwfDlLA5ZeBK87bkKZycuQ2xjAMJTLyTyCFiMP1"

local Hook = DiscordBridge.Hook.new(URL)

local Fields = DiscordBridge.EmbedFields.new():AddField("Left", "I will show up on the left side of the embed", true):AddField("Right", "I will show up on the right side of the embed", true):AddField("Bottom", "I will show up below 'Left' and 'Right'", false)
local EmbedMessage = DiscordBridge.Message.new():WithName("My webhook"):WithEmbed("Hello World!", "Test Message", "This is my first embedded message", "Test message", Color3.fromRGB(0, 255, 0), Fields)

Hook:SendMessage(EmbedMessage)