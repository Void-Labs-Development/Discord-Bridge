local HttpService = game:GetService("HttpService")

local MessageClass = require(script.Parent.Message)

--[=[
	@class Hook
	A hook handles communication with Webhooks. It can have many URLs attached to it at a time,
	when you send a message the hook sends the message to all of the URLs in serial meaning
	that some URLs will get the message delayed. This will be fixed when eventually sending messages
	will be multithreaded
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
	@return Hook

	Create a new hook with the given URLs. You HAVE to pass a table, you can pass a single url
	by just surrounding it with `{}` and it will work.
]=]
function Hook.new(WebhookURLs :{string})
	local self = setmetatable({}, Hook)
	self._Urls = WebhookURLs
	return self
end

--[=[
	@param URL string

	Adds a single URL to the hook.
]=]
function Hook:AddURL(URL :string)
	table.insert(self._Url, URL)
end

--[=[
	@param Message Message
	@yields

	Send the given [Message] to all the URLs under this hook. This does not happen in a seperate
	thread and all URLs are posted to in serial. Eventually this will be moved into a promise
	and multithreaded.
]=]
function Hook:SendMessage(Message :MessageClass.Message)
	local Success, Content = Message:GetJSON()
	if not Success then return end
	for _, URL :string in pairs(self._Urls) do
		HttpService:PostAsync(URL, Content, Enum.HttpContentType.ApplicationJson, false)
	end
end

return Hook