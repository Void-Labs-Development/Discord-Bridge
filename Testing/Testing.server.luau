local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DiscordBridge = require(ReplicatedStorage.Packages.DiscordBridge)

-- Note that this webhook URL is now invalid
local URL = "https://discord.com/api/webhooks/1324818601055617104/urlv_XmpMBEEcE-t9woN4k2n_mUaJZwfDlLA5ZeBK87bkKZycuQ2xjAMJTLyTyCFiMP1"

local Hook = DiscordBridge.Hook.new(URL)

local HelloWorldMessage = DiscordBridge.Message.new():WithName("Me webhook"):WithMessage("Hello World")
local _, HelloWorldMessageJSON = HelloWorldMessage:GetJSON()

Hook:SendMessage(HelloWorldMessageJSON)