local HttpService = game:GetService("HttpService")
--[=[
	@class Message
	This class is a way to describe what a message looks like. It allows you to add a single normal message and
	multiple embedded messages.
]=]
local Message = {}
Message.__index = Message

local function CreateDataTable(Username :string, Content :string)
	return {
		["content"] = Content,
		["embeds"] = {},
		["username"] = Username,
		["attachments"] = {}
	}
end

--[=[
	@readonly
	@prop WebhookName string
	@within Message

	When this message is sent the webhook's name will appear as this.

	:::warning
	You are not meant to set this value maually. Please use [Message:SetBotName] to set this value
	:::
]=]

--[=[
	@readonly
	@prop RawMessageContent string
	@within Message

	This is the normal raw text of the message, you can only have 1 per message.

	:::warning
	You are not meant to set this value maually. Please use [Message:SetMessageContent] to set this value
	:::
]=]

--[=[
	Create a new [Message] instance. This can later be passed into a [Hook] to send the message content to the hook's webhook
]=]
function Message.new()
	local self = setmetatable({}, Message)
	self.RawMessageContent = ""
	self.WebhookName = "Bridge"
	return self
end

--[=[
	@param Content string
	This function allows you to add some normal text to your message.
]=]
function Message:SetMessageContent(Content :string)
	self.RawMessageContent = Content
end

--[=[
	@param Name string
	Sets the displayed name of the webhook when the message is sent
]=]
function Message:SetBotName(Name :string)
	self.WebhookName = Name
end

--[=[
	@return boolean -- Did it get encoded
	@return string -- Encoded message)

	Returns the message as a JSON string ready to be sent to the webhook
]=]
function Message:GetJSON() :(boolean, string)
	local ContentTable = CreateDataTable(self.WebhookName, self.RawMessageContent)

	local JSON = ""

	local Success, ErrorMessage = pcall(function()
		JSON = HttpService:JSONEncode(ContentTable)
	end)

	if not Success then
		warn(ErrorMessage)
	end

	return Success, JSON
end

return Message