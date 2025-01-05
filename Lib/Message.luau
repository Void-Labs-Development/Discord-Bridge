local HttpService = game:GetService("HttpService")

local EmbedFields = require(script.Parent.EmbedFields)

--[=[
	@class Message

	A message is exactly what it sounds like it is. A message. Notably there are a couple of thing you have to keep
	in mind when creating your messages:
	- Maximum of 10 embeds
		- Eventually you will be allowed to add more and DiscordHook will automatically split it up into another message for you
	- You must have either a message or at least one embed

	All methods return themselves to allow for chaining functions.
]=]
local Message = {}
Message.__index = Message

export type Message = {};

local function CreateDataTable(AvatarURL :string, Username :string, Content :string, Embeds :{Embed})
	return {
		["content"] = Content,
		["embeds"] = Embeds,
		["username"] = Username,
		["avatar_url"] = AvatarURL,
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
	.Fields Fields

	Describes what an embed looks like in code.
]=]
type Embed = {
	Title :string;
	Author :string;
	Content :string;
	Footer :string;
	Color :Color3;
	Fields :EmbedFields.Fields;
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
	@prop AvatarURL string
	@within Message

	The URL of the icon the webhook will use when sending this message
]=]


--[=[
	@readonly
	@private
	@prop Embeds {Embed}
	@within Message

	A table containing all of the message's embeds.
]=]

--[=[
	@return Message

	Create a new Message. You can then pass this Message into a [Hook] to send it to a webhook.
]=]
function Message.new()
	local self = setmetatable({}, Message)
	self.RawMessageContent = ""
	self.WebhookName = "Bridge"
	self.Embeds = {} :: {Embed}
	self.AvatarURL = ""
	return self
end

--[=[
	@param Content string
	@return Message

	Sets the text the message will have. Since you can only have 1 message when sending a message calling this twice will
	cause the message to get overriden with the new one.
]=]
function Message:WithMessage(Content :string)
	self.RawMessageContent = Content
	return self
end

--[=[
	@param AvatarImage string
	@since v1.1.0
	@return Message

	Sets the image URL of the avatar which the webhook will use when sending this message. The URL must be an actual URL
	not a roblox URI (`rbxassetid://`).
]=]
function Message:WithAvatar(AvatarImage :string)
	self.AvatarURL = AvatarImage
	return self
end

--[=[
	@param Name string
	@return Message

	Sets the Webhooks username when sending this message.
]=]
function Message:WithName(Name :string)
	self.WebhookName = Name
	return self
end

--[=[
	@param Title string
	@param Author string
	@param Content string
	@param Footer string
	@param Color Color3
	@param Fields EmbedFields?
	@return Message

	Add an embed to the message.
	:::info
	A message can only contain 10 embeds. This is outlined in the [discord docs](https://discord.com/developers/docs/resources/webhook#execute-webhook)
	:::
]=]
function Message:AddEmbed(Title :string, Author :string, Content :string, Footer :string, Color :Color3, Fields :EmbedFields.EmbedFields?)
	if #self.Embeds >= 10 then
		warn("There is a maximum of 10 embeds per message, embed dropped")
		return self
	end

	local FieldsTable = {}

	if Fields then
		for _, Field in pairs(Fields.Fields) do
			table.insert(FieldsTable, {
				["name"] = Field.Title;
				["value"] = Field.Content;
				["inline"] = Field.Inline;
			})
		end
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

	return self
end

--[=[
	@param Title string
	@param Author string
	@param Content string
	@param Footer string
	@param Color Color3
	@param Fields EmbedFields?
	@return Message

	@deprecated v1.1.0 -- Use `AddEmbed` instead

	This fuction still works but causes a warning.
]=]
function Message:WithEmbed(Title :string, Author :string, Content :string, Footer :string, Color :Color3, Fields :EmbedFields.EmbedFields?)
	warn("WithEmbed() has been deprecated. Please use :AddEmbed() instead!")
	return self:AddEmbed(Title, Author, Content, Footer, Color, Fields)
end

--[=[
	@private
	@return boolean -- Did it get encoded
	@return string -- Encoded message)

	Returns the message as a JSON string ready to be sent to the webhook.
]=]
function Message:GetJSON() :(boolean, string)
	local ContentTable = CreateDataTable(self.AvatarURL, self.WebhookName, self.RawMessageContent, self.Embeds)

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