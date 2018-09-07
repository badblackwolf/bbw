do
--Begin Fun.lua By @cw_chnl
--Special Thx To @To0fan
--------------------------------

local function run_bash(str)
    local cmd = io.popen(str)
    local result = cmd:read('*all')
    return result
end
--------------------------------
--------------------------------
function exi_file(path, suffix)
    local files = {}
    local pth = tostring(path)
	local psv = tostring(suffix)
    for k, v in pairs(scandir(pth)) do
        if (v:match('.'..psv..'$')) then
            table.insert(files, v)
        end
    end
    return files
end
--------------------------------
function file_exi(name, path, suffix)
	local fname = tostring(name)
	local pth = tostring(path)
	local psv = tostring(suffix)
    for k,v in pairs(exi_file(pth, psv)) do
        if fname == v then
            return true
        end
    end
    return false
end
--------------------------------
function run(msg, matches) 
if matches[1] == "helpfun" and is_sudo(msg) then
local text = [[
دستورات قسمت سرگرمی سلف بات شما :

▫️!time
دریافت زمان در قالب یک استیکر

▫️!sticker [word]
تبدیل متن به استیکر

▫️!photo [word]
تبدیل متن به عکس

▫️!tosticker [reply]
تبدیل عکس به استیکر

▫️!tophoto [reply]
تبدیل متن به عکس

شما میتونید استفاده کنید از [!/#] در استفاده از دستورات ربات.

وقت بخیر ;)
]]
tdcli.sendMessage(msg.sender_user_id_, "", 0, text, 0, "md")
            return edit_msg(msg.to.id, msg.id, '_Help was send in your private message_', "md")
end
--------------------------------
--------------------------------
	if matches[1]:lower() == 'tophoto' and is_sudo(msg) and msg.reply_id then
		function tophoto(arg, data)
			function tophoto_cb(arg,data)
				if data.content_.sticker_ then
					local file = data.content_.sticker_.sticker_.path_
					local secp = tostring(tcpath)..'/data/sticker/'
					local ffile = string.gsub(file, '-', '')
					local fsecp = string.gsub(secp, '-', '')
					local name = string.gsub(ffile, fsecp, '')
					local sname = string.gsub(name, 'webp', 'jpg')
					local pfile = 'data/photos/'..sname
					local pasvand = 'webp'
					local apath = tostring(tcpath)..'/data/sticker'
					if file_exi(tostring(name), tostring(apath), tostring(pasvand)) then
						os.rename(file, pfile)
   if msg.to.type == "channel" then
    del_msg(msg.to.id, msg.id)
       else
     edit_msg(msg.to.id, msg.id, "??", "md")
   end
						tdcli.sendPhoto(msg.to.id, 0, 0, 1, nil, pfile, "@cw_chnl", dl_cb, nil)
					else
         edit_msg(msg.to.id, msg.id, '_This sticker does not exist. Send sticker again._', "md")
					end
				else
         edit_msg(msg.to.id, msg.id, '_This is not a sticker._', "md")
				end
			end
            tdcli_function ({ ID = 'GetMessage', chat_id_ = msg.chat_id_, message_id_ = data.id_ }, tophoto_cb, nil)
		end
		tdcli_function ({ ID = 'GetMessage', chat_id_ = msg.chat_id_, message_id_ = msg.reply_id }, tophoto, nil)
    end
--------------------------------
	if matches[1]:lower() == 'tosticker' and is_sudo(msg) and msg.reply_id then
		function tosticker(arg, data)
			function tosticker_cb(arg,data)
				if data.content_.ID == 'MessagePhoto' then
					file = data.content_.photo_.id_
					local pathf = tcpath..'/data/photo/'..file..'_(1).jpg'
					local pfile = 'data/photos/'..file..'.webp'
					if file_exi(file..'_(1).jpg', tcpath..'/data/photo', 'jpg') then
						os.rename(pathf, pfile)
   if msg.to.type == "channel" then
    del_msg(msg.to.id, msg.id)
       else
     edit_msg(msg.to.id, msg.id, "??", "md")
   end
						tdcli.sendDocument(msg.chat_id_, 0, 0, 1, nil, pfile, '@cw_chnl', dl_cb, nil)
					else
         edit_msg(msg.to.id, msg.id, '_This photo does not exist. Send sticker again._', "md")
					end
				else
         edit_msg(msg.to.id, msg.id, '_This is not a photo._', "md")
				end
			end
			tdcli_function ({ ID = 'GetMessage', chat_id_ = msg.chat_id_, message_id_ = data.id_ }, tosticker_cb, nil)
		end
		tdcli_function ({ ID = 'GetMessage', chat_id_ = msg.chat_id_, message_id_ = msg.reply_id }, tosticker, nil)
    end
--------------------------------
	if matches[1]:lower() == 'time' and is_sudo(msg) then
		local url , res = http.request('http://irapi.ir/time/')
		if res ~= 200 then
			return "No connection"
		end
		local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
		local fonts = {'mathbf','mathit','mathfrak','mathrm'}
		local jdat = json:decode(url)
		local url = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..jdat.ENtime..'}}'
		local file = download_to_file(url,'time.webp')
   if msg.to.type == "channel" then
    del_msg(msg.to.id, msg.id)
       else
     edit_msg(msg.to.id, msg.id, "??", "md")
   end
		tdcli.sendDocument(msg.to.id, 0, 0, 1, nil, file, '', dl_cb, nil)

	end
 --------------------------------
if matches[1] == "tr" and is_sudo(msg) then 
		url = https.request('https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160119T111342Z.fd6bf13b3590838f.6ce9d8cca4672f0ed24f649c1b502789c9f4687a&format=plain&lang='..URL.escape(matches[2])..'&text='..URL.escape(matches[3]))
		data = json:decode(url)
		local text = '���� : '..data.lang..'\n����� : '..data.text[1]..'\n____________________\n @cw_chnl :)'
   return tdcli.sendMessage(msg.sender_user_id_, "", 0, text, 0, "md")
	end
--------------------------------
	if matches[1]:lower() == "sticker" and is_sudo(msg) then 
		local eq = URL.escape(matches[2])
		local w = "500"
		local h = "500"
		local txtsize = "100"
		local txtclr = "ff2e4357"
		if matches[3] then 
			txtclr = matches[3]
		end
		if matches[4] then 
			txtsize = matches[4]
		end
		if matches[5] and matches[6] then 
			w = matches[5]
			h = matches[6]
		end
		local url = "https://assets.imgix.net/examples/clouds.jpg?blur=150&w="..w.."&h="..h.."&fit=crop&txt="..eq.."&txtsize="..txtsize.."&txtclr="..txtclr.."&txtalign=middle,center&txtfont=Futura%20Condensed%20Medium&mono=ff6598cc"
		local receiver = msg.to.id
		local  file = download_to_file(url,'text.webp')
   if msg.to.type == "channel" then
    del_msg(msg.to.id, msg.id)
       else
     edit_msg(msg.to.id, msg.id, "??", "md")
   end
		tdcli.sendDocument(msg.to.id, 0, 0, 1, nil, file, '', dl_cb, nil)
	end
--------------------------------
	if matches[1]:lower() == "photo" and is_sudo(msg) then 
		local eq = URL.escape(matches[2])
		local w = "500"
		local h = "500"
		local txtsize = "100"
		local txtclr = "ff2e4357"
		if matches[3] then 
			txtclr = matches[3]
		end
		if matches[4] then 
			txtsize = matches[4]
		end
		if matches[5] and matches[6] then 
			w = matches[5]
			h = matches[6]
		end
		local url = "https://assets.imgix.net/examples/clouds.jpg?blur=150&w="..w.."&h="..h.."&fit=crop&txt="..eq.."&txtsize="..txtsize.."&txtclr="..txtclr.."&txtalign=middle,center&txtfont=Futura%20Condensed%20Medium&mono=ff6598cc"
		local receiver = msg.to.id
		local  file = download_to_file(url,'text.jpg')
   if msg.to.type == "channel" then
    del_msg(msg.to.id, msg.id)
       else
     edit_msg(msg.to.id, msg.id, "??", "md")
   end
		tdcli.sendPhoto(msg.to.id, 0, 0, 1, nil, file, "@cw_chnl", dl_cb, nil)
	end
end
end
--------------------------------
return {               
	patterns = {
		"^[#!/](helpfun)$",
		"^[#!/](time)$",
		"^[#!/](tophoto)$",
		"^[#!/](tosticker)$",
        "^[!/]([Tt]r) ([^%s]+) (.*)$",
		"^[!/](photo) (.+)$",
		"^[!/](sticker) (.+)$"
		}, 
	run = run,
	}

--#by @cw_chnl :)