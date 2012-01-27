local efeito = 1 -- coloque 0 para remover o efeito quando o pokemon teleportar
local max = 6 -- distancia max entre o pokemon e o player


function onThink(cid, interval)
if not isCreature(cid) then
return true
end
if isInArray({'4820', '4821', '4822', '4823', '4824', '4825'}, getTileInfo(getThingPos(cid)).itemid) then
if getPlayerGroupId(cid) == 1 then
setPlayerGroupId(cid, 8)
end
return true
end
if #getCreatureSummons(cid) >= 1 then
	if getPlayerGroupId(cid) == 1 then
	setPlayerGroupId(cid, 8)
	end
elseif #getCreatureSummons(cid) == 0 then
	if getPlayerGroupId(cid) == 8 then
	setPlayerGroupId(cid, 1)
	end
end
if #getCreatureSummons(cid) >= 1 and not isCreature(getCreatureTarget(cid)) then
if math.abs((getThingPos(cid).x) - (getThingPos(getCreatureSummons(cid)[1]).x)) > max+1 then
doTeleportThing(getCreatureSummons(cid)[1], getThingPos(cid))
	if efeito == 1 then
	doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 37)
	end
return true
end
if math.abs((getThingPos(cid).y) - (getThingPos(getCreatureSummons(cid)[1]).y)) > max-1 then
doTeleportThing(getCreatureSummons(cid)[1], getThingPos(cid))
	if efeito == 1 then
	doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 37)
	end
return true
end
end
return true
end