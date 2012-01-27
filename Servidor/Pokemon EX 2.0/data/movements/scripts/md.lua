function onStepIn(cid, item, frompos, item2, topos)
if not isPlayer(cid) then
return true
end
if getCreatureLookDir(cid) == 0 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Very smart! But now you are all by yourself, no tips anymore.")
doTeleportThing(cid, {x=985,y=1015,z=7})
doSendMagicEffect({x=985,y=1015,z=7}, CONST_ME_TELEPORT)
else
return true
end
end