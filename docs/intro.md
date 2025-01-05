---
sidebar_position: 1
---

# Getting Started

## What is Discord Bridge?

Discord Bridge is a library designed to make interacting with discord webhooks as simple as possible. Below is a table of support webhook features:  
*a full list of possible features can be found [here](https://discord.com/developers/docs/resources/webhook#execute-webhook-jsonform-params)*

| Feature | Supported | Will get support | Status |
|---------|-----------|------------------|--------|
| Content | ✅ | - | <span style={{color: "rgb(0, 210, 106)"}}> Fully added </span> |
| username | ✅ | - | <span style={{color: "rgb(0, 210, 106)"}}> Fully added </span> |
| avatar_url | ⚠️ | - | <span style={{color: "rgb(255, 176, 46)"}}> Needs support for using Roblox URIs like `rbxassetid://` </span> |
| tts | ❌ | ❌ | - |
| embeds | ⚠️ | - | <span style={{color: "rgb(255, 176, 46)"}}> Messages with >10 embeds need to be split up </span> |
| allow_mentions | ❌ | ✅ | - |
| components * | ❌ | ❌ | - |
| files[n] ** | ❌ | ❌ | - |
| payload_json ** | ❌ | ❌ | - |
| attachments ** | ❌ | ❌ | This might get added in the future |
| flags | - | - | - |
| thread_name | - | - | - |
| applied_tags | -| - | - |
| poll | ❌ | ✅ | - |

This list is subject to change.

## Installing
### Wally
Add the following to your `wally.toml`:
```toml
discordbridge = "sebastian2852/discordbridge@1.0.0"
```
and then run:
```bash
wally install
```

### Git submodule
TODO