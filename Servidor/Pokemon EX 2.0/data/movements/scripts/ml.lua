function onStepIn(cid, item, frompos, item2, topos)
if not isPlayer(cid) then
return true
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Ouch! You stepped on something weird.")
end