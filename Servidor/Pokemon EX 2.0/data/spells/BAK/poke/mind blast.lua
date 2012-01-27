local psy1 = createCombatArea{
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 1, 1, 1, 2, 1, 1, 1, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
local psy2 = createCombatArea{
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
	{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

function onCastSpell(cid, var)

	doCreatureSay(cid, "MIND BLAST!", TALKTYPE_MONSTER)
	if getPlayerStorageValue(cid, 3) >= 1 then
	doSendAnimatedText(getThingPos(cid), "MISS", 215)
	setPlayerStorageValue(cid, 3, -1)
	return true
	end
	if getPlayerStorageValue(cid, 5) >= 1 then
		if math.random(1,100) <= 33 then
		doSendAnimatedText(getThingPos(cid), "SELF HIT", 180)
			if isPlayer(getCreatureTarget(cid)) then
			huah = getPlayerLevel(getCreatureTarget(cid))
			else
			huah = getPlayerLevel(getCreatureMaster(getCreatureTarget(cid)))
			end
		local levels = huah
		doTargetCombatHealth(getCreatureTarget(cid), cid, COMBAT_PHYSICALDAMAGE, -(math.random((levels*3),(levels*5))), -((math.random((levels*3),(levels*5))+10)), 3)
		return true
		end
	end
		if math.random(1,3) == 1 then
		random = 133
		else
		if math.random(1,2) == 2 then
		random = 134
		else
		random = 136
		end
		end
		doAreaCombatHealth(cid, PSYCHICDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -(700), -(850), random)
		if math.random(1,3) == 1 then
		random = 133
		else
		if math.random(1,2) == 2 then
		random = 134
		else
		random = 136
		end
		end
		local function go(params)
		if isCreature(cid) then
		if isCreature(getCreatureTarget(cid)) then
		doAreaCombatHealth(cid, PSYCHICDAMAGE, getThingPos(getCreatureTarget(cid)), psy2, -(700), -(850), random)
		end
		end
		end
		addEvent(go, 150, {cid = cid})
		if math.random(1,3) == 1 then
		random = 133
		else
		if math.random(1,2) == 2 then
		random = 134
		else
		random = 136
		end
		end
		doAreaCombatHealth(cid, PSYCHICDAMAGE, getThingPos(getCreatureTarget(cid)), psy1, -(700), -(850), random)
end 
