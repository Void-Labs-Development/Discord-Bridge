local HttpService = game:GetService("HttpService")

local EmbedFields = require(script.Parent.EmbedFields)

--[=[
	@class Message
	This class is a way to describe what a message looks like. It allows you to add a single normal message and
	multiple embedded messages.
]=]
local Message = {}
Message.__index = Message

local function CreateDataTable(Username :string, Content :string, Embeds :{Embed})
	return {
		["content"] = Content,
		["embeds"] = Embeds,
		["username"] = Username,
		["attachments"] = {}
	}
end

local function CreateEmbedColorValue(Color :Color3) :number
	local AsRGB = {}
	AsRGB.Red = (Color.R * 255)
	AsRGB.Green = (Color.G * 255)
	AsRGB.Blue = (Color.B * 255)

	local DecimalColor = (AsRGB.Red * math.pow(255, 2)) + (AsRGB.Green * 256) + AsRGB.Blue
	return DecimalColor
end

--[=[
	@within Message
	@interface Embed
	.Title string
	.Author string
	.Content string
	.Footer string
	.Color Color3

	Describes what an embed looks like in code
]=]
type Embed = {
	Title :string;
	Author :string;
	Content :string;
	Footer :string;
	Color :Color3;
}

--[=[
	@readonly
	@private
	@prop WebhookName string
	@within Message

	When this message is sent the webhook's name will appear as this.
]=]

--[=[
	@readonly
	@private
	@prop RawMessageContent string
	@within Message

	This is the normal raw text of the message, you can only have 1 per message.
]=]

--[=[
	@readonly
	@private
	@prop Embeds {Embed}
	@within Message

	A table containing all of the message's embeds.
]=]

--[=[
	Create a new [Message] instance. This can later be passed into a [Hook] to send the message content to the hook's webhook
]=]
function Message.new()
	local self = setmetatable({}, Message)
	self.RawMessageContent = ""
	self.WebhookName = "Bridge"
	self.Embeds = {} :: {Embed}
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
	@param Title string
	@param Author string
	@param Content string
	@param Footer string
	@param Color Color3

	Adds an embed into the message
	:::info
	A message can only contain 10 embeds. This is outlined in the [discord docs](https://discord.com/developers/docs/resources/webhook#execute-webhook)
	:::
]=]
function Message:AddEmbed(Title :string, Author :string, Content :string, Footer :string, Color :Color3, Fields :EmbedFields.EmbedFields)
	if #self.Embeds >= 10 then
		warn("There is a maximum of 10 embeds per message, embed dropped")
		return
	end

	local FieldsTable = {}

	for _, Field in pairs(Fields.Fields) do
		table.insert(FieldsTable, {
			["name"] = Field.Title;
			["value"] = Field.Content;
			["inline"] = Field.Inline;
		})
	end

	table.insert(self.Embeds, {
		["author"] = {
			["name"] = Author;
			["url"] = "";
			["icon_url"] = "";
		};
		["title"] = Title;
		["url"] = "";
		["description"] = Content;
		["color"] = CreateEmbedColorValue(Color);
		["fields"] = FieldsTable;
		["footer"] = {
			["text"] = Footer;
			["icon_url"] = "";
		}
	})
end

--[=[
	@return boolean -- Did it get encoded
	@return string -- Encoded message)

	Returns the message as a JSON string ready to be sent to the webhook
]=]
function Message:GetJSON() :(boolean, string)
	local ContentTable = CreateDataTable(self.WebhookName, self.RawMessageContent, self.Embeds)

	local JSON = ""

	local Success, ErrorMessage = pcall(function()
		JSON = HttpService:JSONEncode(ContentTable)
	end)

	if not Success then
		warn("Failed to encode message: "..ErrorMessage)
	end

	return Success, JSON
end

return Message