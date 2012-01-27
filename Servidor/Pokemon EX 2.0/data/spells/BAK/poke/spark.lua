function onCastSpell(cid, var)
	doCreatureSay(cid, "SPARK!", TALKTYPE_MONSTER)
local parameters = { cid = cid, var = var}
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
if getCreatureName(cid) == "Voltorb" then
sparkd = 40
else
sparkd = 150
end
local dmg = sparkd
				local function spark(params)
				if isCreature(params.cid) then
				doSendDistanceShoot(getThingPos(params.cid), params.cidpos, 40)
				doAreaCombatHealth(params.cid, ELECTRICDAMAGE, params.cidpos, 0, -(dmg), -((dmg)+35), 48)
				end
				end
		for a = -1, 1 do
			for b = -1, 1 do
			cidpos = getThingPos(cid)
			cidpos.x = cidpos.x+a
			cidpos.y = cidpos.y+b
			addEvent(spark, math.abs(a)*350 + math.abs(b)*650, {cid = cid, cidpos = cidpos, dmg = dmg})
			end
		end
end