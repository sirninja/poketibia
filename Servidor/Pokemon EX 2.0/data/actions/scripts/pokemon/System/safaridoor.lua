function onUse (cid,item,frompos,item2,topos)
pos = {x=1051, y=1490, z=7}
doTeleportThing(cid,pos)
doSendMagicEffect(pos, CONST_ME_TELEPORT)
return 1
end