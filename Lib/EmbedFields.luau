--[=[
	@class EmbedFields

	Handles adding fields to embeds. This was seperated into a different class to keep the API simple and
	the code readable.
]=]
local EmbedFields = {}
EmbedFields.__index = EmbedFields

export type EmbedFields = {};

--[=[
	@private
	@readonly
	@within EmbedFields
	@prop Fields Fields
]=]

--[=[
	@within EmbedFields
	@type Fields {EmbedField}

	An alias for a table filled with type EmbedField
]=]
export type Fields = {EmbedField}

--[=[
	@within EmbedFields
	@interface EmbedField
	.Title string
	.Content string
	.Inline boolean

	Describes what a single field looks like.
]=]
export type EmbedField = {
	Title :string;
	Content :string;
	Inline :boolean;
}

--[=[
	@return EmbedFields
]=]
function EmbedFields.new()
	local self = setmetatable({}, EmbedFields)
	self.Fields = {}
	return self
end

--[=[
	@param Title string
	@param Content string
	@param Inline boolean
	@return EmbedFields

	Adds a new field and returns `self` to allow for chaining. For example:
	```lua
	local Fields = EmbedFields.new()
		:AddField("First", "Hello World!", true)
		:AddField("Another", "Bye World", true)
	```
]=]
function EmbedFields:AddField(Title :string, Content :string, Inline :boolean)
	table.insert(self.Fields, {
		Title = Title;
		Content = Content;
		Inline = Inline;
	})
	return self
end

return EmbedFields