function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você deve especificar o nome de um pokémon.")
return true
end

local ret = doPlayerAddItem(cid, 2222) -- Id da ball
local effect = CONST_ME_MAGIC_RED
doItemSetAttribute(ret, "name", param.." Poke ball")
doItemSetAttribute(ret, "description", "It has been created by staff ")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
return true
end