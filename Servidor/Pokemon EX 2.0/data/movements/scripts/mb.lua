function onStepIn(cid, item, frompos, item2, topos)
if not isPlayer(cid) then
return true
end
if item.actionid == 1002 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Don\'t be so stupid, it would never be that obvious the mansion\'s secret.")
doTeleportThing(cid, {x=1003,y=1018,z=7})
doSendMagicEffect({x=1003,y=1018,z=7}, CONST_ME_TELEPORT)
elseif item.actionid == 1036 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Back to the start point.")
doTeleportThing(cid, {x=1003,y=1018,z=7})
doSendMagicEffect({x=1003,y=1018,z=7}, CONST_ME_TELEPORT)
end
end