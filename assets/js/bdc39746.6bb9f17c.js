"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[933],{7891:(e,s,i)=>{i.r(s),i.d(s,{assets:()=>l,contentTitle:()=>r,default:()=>c,frontMatter:()=>n,metadata:()=>t,toc:()=>a});const t=JSON.parse('{"id":"Advanced/Embeds","title":"Embeds","description":"Sending messages with embeds is super simple. You can either do it with or without fields, This page covers both. Fields are a way to add \\"sections of information\\" into your embed, they can be lined next to each other or be in a list. Each one has a title and content.","source":"@site/docs/Advanced/Embeds.md","sourceDirName":"Advanced","slug":"/Advanced/Embeds","permalink":"/Discord-Bridge/docs/Advanced/Embeds","draft":false,"unlisted":false,"editUrl":"https://github.com/Void-Labs-Development/Discord-Bridge/edit/master/docs/Advanced/Embeds.md","tags":[],"version":"current","sidebarPosition":2,"frontMatter":{"sidebar_position":2},"sidebar":"defaultSidebar","previous":{"title":"Creating Webhooks","permalink":"/Discord-Bridge/docs/SettingUpWebhook"}}');var d=i(4848),o=i(8453);const n={sidebar_position:2},r="Embeds",l={},a=[{value:"Without Fields",id:"without-fields",level:2},{value:"With Fields",id:"with-fields",level:2}];function h(e){const s={a:"a",code:"code",h1:"h1",h2:"h2",header:"header",p:"p",pre:"pre",...(0,o.R)(),...e.components};return(0,d.jsxs)(d.Fragment,{children:[(0,d.jsx)(s.header,{children:(0,d.jsx)(s.h1,{id:"embeds",children:"Embeds"})}),"\n",(0,d.jsx)(s.p,{children:'Sending messages with embeds is super simple. You can either do it with or without fields, This page covers both. Fields are a way to add "sections of information" into your embed, they can be lined next to each other or be in a list. Each one has a title and content.'}),"\n",(0,d.jsx)(s.p,{children:"Discord limits each message to have a maximum of 10 embeds per message before refusing to send the message. Don't worry, Discord Bridge will drop any extra embeds you add after the tenth although in the future it will split it into a second message which will make it look like all the embeds are from the same message."}),"\n",(0,d.jsx)(s.h2,{id:"without-fields",children:"Without Fields"}),"\n",(0,d.jsxs)(s.p,{children:["Assuming you are following on from ",(0,d.jsx)(s.a,{href:"/Discord-Bridge/docs/SettingUpWebhook",children:"Creating Webhooks"})," you can just add the ",(0,d.jsx)(s.code,{children:":withEmbed"})," function and fill out the params yourself. Otherwise here is more code you can copy and paste:"]}),"\n",(0,d.jsx)(s.pre,{children:(0,d.jsx)(s.code,{className:"language-lua",children:'local EmbedMessage = DiscordBridge.Message.new():WithName("My webhook"):WithEmbed("Hello World!", "Test Message", "This is my first embedded message", "Test message", Color3.fromRGB(0, 255, 0))\n'})}),"\n",(0,d.jsx)(s.p,{children:"Which results in a message like this:"}),"\n",(0,d.jsx)("img",{src:"../../EmbedNoFields.png"}),"\n",(0,d.jsx)(s.h2,{id:"with-fields",children:"With Fields"}),"\n",(0,d.jsx)(s.p,{children:"Adding fields is super simple. First you will have to create a EmbedFields which describes all the fields in your embed, here is an example:"}),"\n",(0,d.jsx)(s.pre,{children:(0,d.jsx)(s.code,{className:"language-lua",children:'local Fields = DiscordBridge.EmbedFields.new():AddField("Left", "I will show up on the left side of the embed", true):AddField("Right", "I will show up on the right side of the embed", true):AddField("Bottom", "I will show up below \'Left\' and \'Right\'", false)\n'})}),"\n",(0,d.jsxs)(s.p,{children:["Then simply pass that into your ",(0,d.jsx)(s.code,{children:":WithEmbed"})," call. Here is the previous example from above with the fields:"]}),"\n",(0,d.jsx)(s.pre,{children:(0,d.jsx)(s.code,{className:"language-lua",children:'local Fields = DiscordBridge.EmbedFields.new():AddField("Left", "I will show up on the left side of the embed", true):AddField("Right", "I will show up on the right side of the embed", true):AddField("Bottom", "I will show up below \'Left\' and \'Right\'", false)\r\n\r\nlocal EmbedMessage = DiscordBridge.Message.new():WithName("My webhook"):WithEmbed("Hello World!", "Test Message", "This is my first embedded message", "Test message", Color3.fromRGB(0, 255, 0), Fields)\n'})}),"\n",(0,d.jsx)(s.p,{children:"Sending this message will result with a message like this:"}),"\n",(0,d.jsx)("img",{src:"../../EmbedWithFields.png"})]})}function c(e={}){const{wrapper:s}={...(0,o.R)(),...e.components};return s?(0,d.jsx)(s,{...e,children:(0,d.jsx)(h,{...e})}):h(e)}},8453:(e,s,i)=>{i.d(s,{R:()=>n,x:()=>r});var t=i(6540);const d={},o=t.createContext(d);function n(e){const s=t.useContext(o);return t.useMemo((function(){return"function"==typeof e?e(s):{...s,...e}}),[s,e])}function r(e){let s;return s=e.disableParentContext?"function"==typeof e.components?e.components(d):e.components||d:n(e.components),t.createElement(o.Provider,{value:s},e.children)}}}]);