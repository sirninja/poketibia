local escada = {x=984,y=1017,z=6}
function onStepIn(cid, item, frompos, item2, topos)
if not isPlayer(cid) then
return true
end
doSendMagicEffect(escada, 133)
end