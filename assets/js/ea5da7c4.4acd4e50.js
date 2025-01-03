"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[839],{1404:e=>{e.exports=JSON.parse('{"functions":[{"name":"new","desc":"Create a new holder for fields.","params":[],"returns":[],"function_type":"static","source":{"line":43,"path":"Lib/EmbedFields.luau"}},{"name":"AddField","desc":"Adds a new field and returns `self` to allow for chaining. For example:\\n```lua\\nlocal Fields = EmbedFields.new():AddEmbed(\\"First\\", \\"Hello World!\\", true):AddEmbed(\\"Another\\", \\"Bye World\\", true)\\n```","params":[{"name":"Title","desc":"","lua_type":"string"},{"name":"Content","desc":"","lua_type":"string"},{"name":"Inline","desc":"","lua_type":"boolean"}],"returns":[],"function_type":"method","source":{"line":59,"path":"Lib/EmbedFields.luau"}}],"properties":[{"name":"Fields","desc":"","lua_type":"Fields","private":true,"readonly":true,"source":{"line":16,"path":"Lib/EmbedFields.luau"}}],"types":[{"name":"Fields","desc":"An alias for a table filled with type EmbedField","lua_type":"{EmbedField}","source":{"line":23,"path":"Lib/EmbedFields.luau"}},{"name":"EmbedField","desc":"Describes what a single field looks like","fields":[{"name":"Title","lua_type":"string","desc":""},{"name":"Content","lua_type":"string","desc":""},{"name":"Inline","lua_type":"boolean","desc":""}],"source":{"line":34,"path":"Lib/EmbedFields.luau"}}],"name":"EmbedFields","desc":"Allows you to easiy add fields to embeds in messages.","source":{"line":5,"path":"Lib/EmbedFields.luau"}}')}}]);