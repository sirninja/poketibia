function onUse(cid, item, frompos, item2, topos)
if item2.actionid == 1003 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Oh dear, you took the wrong decision, sorry.")
doTeleportThing(cid, {x=1003,y=1018,z=7})
doSendMagicEffect({x=1003,y=1018,z=7}, CONST_ME_TELEPORT)
elseif item2.actionid == 1004 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You found my hidden magical lever, good job, but from now on you will need a lot of luck.")
doTeleportThing(cid, {x=991,y=1014,z=6})
doSendMagicEffect({x=991,y=1014,z=6}, CONST_ME_TELEPORT)
elseif item2.actionid == 1006 then
doCreatureSetLookDir(cid, 2)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Are you lucky today or did you really figure out my secret codes? Well done anyway, you seem to be very clever.")
doTeleportThing(cid, {x=984,y=1017,z=6})
doSendMagicEffect({x=984,y=1017,z=6}, CONST_ME_TELEPORT)
elseif item2.actionid == 1010 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A magical leaf has fallen on you and mysteriously teleported you over here.")
doTeleportThing(cid, {x=984,y=1019,z=3})
doSendMagicEffect({x=984,y=1019,z=3}, CONST_ME_TELEPORT)
elseif item2.actionid == 1012 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You are getting closer.")
doTeleportThing(cid, {x=987,y=1017,z=2})
doSendMagicEffect({x=987,y=1017,z=2}, CONST_ME_TELEPORT)
elseif item2.actionid == 1013 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Nicely thought.")
doTeleportThing(cid, {x=984,y=1016,z=5})
doSendMagicEffect({x=984,y=1016,z=5}, CONST_ME_TELEPORT)
end
end