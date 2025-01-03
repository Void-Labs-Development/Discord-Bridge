"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[918],{7823:e=>{e.exports=JSON.parse('{"functions":[{"name":"new","desc":"Create a new [Message] instance. This can later be passed into a [Hook] to send the message content to the hook\'s webhook","params":[],"returns":[],"function_type":"static","source":{"line":46,"path":"Lib/Message.luau"}},{"name":"SetMessageContent","desc":"This function allows you to add some normal text to your message.","params":[{"name":"Content","desc":"","lua_type":"string"}],"returns":[],"function_type":"method","source":{"line":57,"path":"Lib/Message.luau"}},{"name":"SetBotName","desc":"Sets the displayed name of the webhook when the message is sent","params":[{"name":"Name","desc":"","lua_type":"string"}],"returns":[],"function_type":"method","source":{"line":65,"path":"Lib/Message.luau"}},{"name":"GetJSON","desc":"Returns the message as a JSON string ready to be sent to the webhook","params":[],"returns":[{"desc":"Did it get encoded","lua_type":"boolean"},{"desc":"Encoded message)","lua_type":"string"}],"function_type":"method","source":{"line":75,"path":"Lib/Message.luau"}}],"properties":[{"name":"WebhookName","desc":"When this message is sent the webhook\'s name will appear as this.\\n\\n:::warning\\nYou are not meant to set this value maually. Please use [Message:SetBotName] to set this value\\n:::","lua_type":"string","readonly":true,"source":{"line":30,"path":"Lib/Message.luau"}},{"name":"RawMessageContent","desc":"This is the normal raw text of the message, you can only have 1 per message.\\n\\n:::warning\\nYou are not meant to set this value maually. Please use [Message:SetMessageContent] to set this value\\n:::","lua_type":"string","readonly":true,"source":{"line":42,"path":"Lib/Message.luau"}}],"types":[],"name":"Message","desc":"This class is a way to describe what a message looks like. It allows you to add a single normal message and\\nmultiple embedded messages.","source":{"line":7,"path":"Lib/Message.luau"}}')}}]);