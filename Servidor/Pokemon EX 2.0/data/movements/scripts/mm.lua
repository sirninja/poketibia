function onStepIn(cid, item, topos, item2, frompos)
if not isPlayer(cid) then
return true
end
if getPlayerLevel(cid) <= 24 then
doPlayerSendCancel(cid, "Only players level 25 or more are allowed in this place.")
doTeleportThing(cid, frompos)
return true
end
if getTileInfo(frompos).action == 1001 then
return true
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You feel strange powers all over your body.")
end