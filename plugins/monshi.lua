--Start By @Tele_Sudo
local function run(msg, matches) 
if matches[1] == "setpm" then 
if not is_sudo(msg) then 
return '��� ���� ������' 
end 
local pm = matches[2] 
redis:set('bot:pm',pm) 
return '��� ���� ���� ��� ��' 
end 
 
if matches[1] == "pm" and is_sudo(msg) then
local hash = ('bot:pm') 
    local pm = redis:get(hash) 
    if not pm then 
    return ' ��� ����' 
    else 
	   return edit_msg(msg.to.id, msg.id, '����� ����� ����:\n\n'..pm, "html")
    end
end

if matches[1]=="monshi" then 
if not is_sudo(msg) then 
return '��� ���� ������' 
end 
if matches[2]=="on"then 
redis:set("bot:pm", "no pm")
return "���� ���� �� ���� ������ ����� �� ����� ����" 
end 
if matches[2]=="off"then 
redis:del("bot:pm")
return "���� ������� ��" 
end
 end
  if gp_type(msg.chat_id_) == "pv" and  msg.content_.text_ then
    local hash = ('bot:pm') 
    local pm = redis:get(hash)
if gp_type(msg.chat_id_) == "channel" or gp_type(msg.chat_id_) == "chat" then
return
else
     return  edit_msg(msg.to.id, msg.id, pm, "html")

    end 
    end
end
return { 
patterns ={ 
"^[!#/](setpm) (.*)$", 
"^[!#/](monshi) (on)$", 
"^[!#/](monshi) (off)$", 
"^[!#/](pm)$", 
"^(.*)$", 
}, 
run = run 
}

--End By @Tele_Sudo
--Channel @LuaError
