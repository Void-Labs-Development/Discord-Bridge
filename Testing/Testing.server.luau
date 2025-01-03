local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DiscordBridge = require(ReplicatedStorage.Packages.DiscordBridge)

-- Note that this webhook URL is now invalid
local URL = "https://discord.com/api/webhooks/1324738675518603325/BMpZja91JRJuBfOTRpNTeBkGrbwzMvXjMQXgZ8pk7Uw0RtBAbNNndZawhy4iDF6mButE"

local MessageData = {
	["content"] = "Hello World!"
}

local JSONData = HttpService:JSONEncode(MessageData)
HttpService:PostAsync(URL, JSONData)