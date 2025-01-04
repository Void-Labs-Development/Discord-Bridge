---
sidebar_position: 4
---

# Creating Messages
This page goes over everything there is to know while creating a message to send to your Webhook. It goes over everything from simple text messages, to embed, to polls (coming soon).

Messages can contain everything, For example a single message can contain a text message and a embed, they don't need to be split up into different messages.

## Message Config
Firstly we can configure our message to make the webhook have a different name:
```lua
local Message = DiscordBridge.Message.new()
	:WithName("Cool Name")
```
This makes the webhook appear to have a different name while sending the message. By default if you don't add a name the name will appear as "Discord Bridge".

:::tip
In the future there will be support for setting the avatar URL
:::

## Text Messages
A message can only contain 1 normal text message. If you try to add more than one it will just override the previous text. To add text to your message you can use `:WithMessage()` and passing in your desired text. For example:
```lua
local Message = DiscordBridge.Message.new()
	:WithName("Cool Name")
	:WithMessage("Very cool message")
```

## Messages with embeds
A message can contain up to 10 different embeds, if a message has more discord will refuse to send the message. DiscordBridge currently doesn't allow you to add more than 10 for this reason. In the future it will allow you to add more and then send the embeds in multiple messages to make it look like its all in one message.

Since an embed doesn't *require* fields there are sections for both below.

### Without Fields
You can simply use the `:WithEmbed()` to add an embed to your message. As mentioned before you can have up to 10 per message. Here is an example:
```lua
local Message = DiscordBridge.Message.new()
	:WithName("Cool Name")
	:WithMessage("Very cool message")
	:WithEmbed("My awesome embed", "A cool person", "This is a very cool embedded message!", "Sent with DiscordBridge", Color3.new(0, 1, 0))
```

### With Fields
Adding fields requires you create an EmbedFields object, this is because an embed can have multiple fields so it made sense to move them into a separate objects. There is no limit (to my knowledge) of how many fields an embed can have. Below is an example of an embed with a few fields:
```lua
local Fields = DiscordBridge.EmbedFields.new()
	:AddField("Left", "I will show up on the left side of the embed", true)
	:AddField("Right", "I will show up on the right side of the embed", true)
	:AddField("Bottom", "I will show up below 'Left' and 'Right'", false)

local Message = DiscordBridge.Message.new()
	:WithName("Cool Name")
	:WithMessage("Very cool message")
	:WithEmbed("My awesome embed", "A cool person", "This is a very cool embedded message!", "Sent with DiscordBridge", Color3.new(0, 1, 0), Fields)
```
If you look at the [API](http://localhost:3000/Discord-Bridge/api/EmbedFields#AddField) you will see you need to pass an "inline" Boolean. An inline field means it is on the same line as other Inline embeds.