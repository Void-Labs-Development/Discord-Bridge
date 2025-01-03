local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DiscordBridge = require(ReplicatedStorage.Packages.DiscordBridge)

-- Note that this webhook URL is now invalid
local URL = "https://discord.com/api/webhooks/1324738675518603325/BMpZja91JRJuBfOTRpNTeBkGrbwzMvXjMQXgZ8pk7Uw0RtBAbNNndZawhy4iDF6mButE"

local Hook = DiscordBridge.Hook.new(URL)

local NoNameMessage = DiscordBridge.Message.new()
NoNameMessage:SetMessageContent("No Named Message")

local NamedMessage = DiscordBridge.Message.new()
NamedMessage:SetBotName("WOW")
NamedMessage:SetMessageContent("Named Message")

local _, NoNameMessageJSON = NoNameMessage:GetJSON()
local _, NamedMessageJSON = NamedMessage:GetJSON()
Hook:SendMessage(NoNameMessageJSON)
Hook:SendMessage(NamedMessageJSON)