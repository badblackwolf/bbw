local function run(msg, matches)
local bot_si = 654792646
if matches[1]:lower() == 'sik' and is_sudo(msg) then
local function botsi(arg, data)
if data.results_ and data.results_[0] then
tdcli.sendInlineQueryResultMessage(msg.chat_id_, msg.id_, 0, 1, data.inline_query_id_, data.results_[0].id_)
else
tdcli.sendMessage(msg.chat_id_, msg.id_, 0, 1, nil,':>', 'md')
end
end
tdcli.getInlineQueryResults(bot_si, msg.chat_id_, 0, 0, matches[2], 0, botsi, nil)
end
end
return {
patterns = {
"^[/#!](sik) (.*)"
},
run = run,
}