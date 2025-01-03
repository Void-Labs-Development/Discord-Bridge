local HttpService = game:GetService("HttpService")

local MessageClass = require(script.Parent.Message)

--[=[
	@class Hook
	A hook handles sending messages to the webhook URL it is tied to. Note that you cannot
	change the URL the hook is tied to.
]=]
local Hook = {}
Hook.__index = Hook

--[=[
	@param WebhookURL string

	Create a new hook tied to the given webhook URL
]=]
function Hook.new(WebhookURL :string)
	assert(type(WebhookURL) == "string", "WebhookURL has to be a string")

	local self = setmetatable({}, Hook)
	self._Url = WebhookURL
	return self
end

--[=[
	@param Message Message
]=]
function Hook:SendMessage(Message :MessageClass.Message)
	local Success, Content = Message:GetJSON()
	if not Success then return end
	print(Content)
	HttpService:PostAsync(self._Url, Content, Enum.HttpContentType.ApplicationJson, false)
end

return Hook