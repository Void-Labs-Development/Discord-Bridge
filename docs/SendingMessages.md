---
sidebar_position: 3
---

# Sending Messages
This page goes over how to send messages with Discord Bridge.

## Setting up a hook
A hook is what actually sends the message to Discord. It is tied to 1 webhook URL and can send any amount of messages.
:::info
Later there will be support for adding more than 1 URL to a hook
:::

Creating a hook is as simple as doing:
```lua
local URL = "https://discord.com/api/webhooks/xxx/xxx"
local Hook = DiscordBridge.Hook.new(URL)
```

## Sending a message
Now that you have a hook setup you can send a hello world message to see if it goes through. Firstly you will have to create your message like this:
```lua
local HelloWorld = DiscordBridge.Message.new():WithName("My webhook"):WithMessage("Hello World!")
```
now this message can be passed off to the hook to send the message:
```lua
Hook:SendMessage(HelloWorld)
```

## Full Example
```lua
local DiscordBridge = require(Path.To.DiscordBridge)

local URL = "Your URL goes here" -- Make sure the URL goes between the speach marks
local Hook = DiscordBridge.Hook.new(URL)

local HelloWorld = DiscordBridge.Message.new():WithName("My webhook"):WithMessage("Hello World")
Hook:SendMessage(HelloWorld)
```