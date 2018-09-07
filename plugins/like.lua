local function run(msg, matches)
local bot_f = 190601014
if matches[1]:lower() == 'like' and is_sudo(msg) then
local function botf(arg, data)
if data.results_ and data.results_[0] then
tdcli.sendInlineQueryResultMessage(msg.chat_id_, msg.id_, 0, 1, data.inline_query_id_, data.results_[0].id_)
else
tdcli.sendMessage(msg.chat_id_, msg.id_, 0, 1, nil,':>', 'md')
end
end
tdcli.getInlineQueryResults(bot_f, msg.chat_id_, 0, 0, matches[2], 0, botf, nil)
end
end
return {               
	patterns = {
		"^[/#!](like) (.*)"
		}, 
	run = run,
	}