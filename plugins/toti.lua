--start by @Tele_Sudo
local function run(msg, matches)
  local text = matches[1]
  return text
  end 

  return {
   description = "reply msg.",
   usage = {
      "reply [msg]"
   },
   patterns = {
      "^(.*)$"
   },
   run = run,
   hide = true
}
--End by @Tele_Sudo
--channel @luaError