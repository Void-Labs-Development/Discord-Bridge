<div align="center">
	<h1>DiscordBridge</h1>
</div>

A powerful and lightweight wrapper for the Discord API, designed specifically for Roblox developers. Easily integrate Discord features into your Roblox game, from sending webhook messages to handling bot interactions.

You can find detailed installation instructions, a full API reference, and tutorials on the [documentation website](https://void-labs-development.github.io/Discord-Bridge/).


## Features
- **✨ Super Simple**  
  Easily send messages to a Discord webhook with lots of customization options!
  
- **📖 Lots of Documentation**  
  Pretty much everything is documented and there are tutorials for everything which include images.

- **⚡ Lightning Fast**  
  Optimized for speed and efficiency, ensuring seamless communication between your game and Discord.

## Getting Started
Here’s a quick example of how to send a message to a Discord webhook:

```lua
local DiscordBridge = require(Path.To.DiscordBridge)
local URL = "Your URL goes here" -- Make sure the URL goes between the speach marks

local Hook = DiscordBridge.Hook.new({URL})

local HelloWorldMessage = DiscordBridge.Message.new():WithName("My webhook"):WithMessage("Hello World")
Hook:SendMessage(HelloWorldMessage)
```
