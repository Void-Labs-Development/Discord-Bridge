local HttpService = game:GetService("HttpService")

local MessageClass = require(script.Parent.Message)

--[=[
	@class Hook
	A hook handles sending messages to the webhook URLs it is tied to.
]=]
local Hook = {}
Hook.__index = Hook

--[=[
	@private
	@readonly
	@prop _Urls {string}
	@within Hook

	A table containing all the URLs the hook sends messages to
]=]

--[=[
	@param WebhookURLs {string}

	Create a new hook tied to the given webhook URL
]=]
function Hook.new(WebhookURLs :{string})
	local self = setmetatable({}, Hook)
	self._Urls = WebhookURLs
	return self
end

--[=[
	@param URL string
	Add a URL to the hook
]=]
function Hook:AddURL(URL :string)
	table.insert(self._Url, URL)
end

--[=[
	@param Message Message
	@yields
]=]
function Hook:SendMessage(Message :MessageClass.Message)
	local Success, Content = Message:GetJSON()
	if not Success then return end
	for _, URL :string in pairs(self._Urls) do
		HttpService:PostAsync(URL, Content, Enum.HttpContentType.ApplicationJson, false)
	end
end

return Hook