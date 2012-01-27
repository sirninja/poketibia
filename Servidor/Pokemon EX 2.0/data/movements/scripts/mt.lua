function onStepIn(cid, item, frompos, item2, topos)
if not isPlayer(cid) then
return true
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You stepped on an enchanted tile, and you were teleported to somewhere.")
doTeleportThing(cid, {x=1003,y=1018,z=7})
doSendMagicEffect({x=1003,y=1018,z=7}, CONST_ME_TELEPORT)
if item.actionid == 1026 then
doCreateItem(1304, 1, {x=989,y=1019,z=6})
doCreateItem(1304, 1, {x=987,y=1019,z=6})
end
end