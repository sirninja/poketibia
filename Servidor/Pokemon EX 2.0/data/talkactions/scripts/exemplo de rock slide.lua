function onSay(cid)
for i = 1, 40 do
	pos = getThingPos(cid)
	pos.x = pos.x + math.random(-4,4)
	pos.y = pos.y + math.random(-4,4)
	pos.z = pos.z
	pos[i] = pos
	addEvent(doAreaCombatHealth, 400, cid, COMBAT_EARTHDAMAGE, pos[i], 0, -10, -20, 118)
	addEvent(doAreaCombatHealth, 500, cid, COMBAT_EARTHDAMAGE, pos[i], 0, -10, -20, 44)
	frompos = getThingPos(cid)
	frompos.x = pos.x - 7
	frompos.y = pos.y - 6
	frompos.z = pos.z
	frompos[i] = frompos
	doSendDistanceShoot(frompos[i], pos[i], 11)
end
return 0
end