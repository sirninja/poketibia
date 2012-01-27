local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, GRASSDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 45)

function onCastSpell(cid, var)
	doCreatureSay(cid, "LEECH SEED!", TALKTYPE_MONSTER)
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
		life = 10
		local alvo = getCreatureTarget(cid)
		local function suck(params)
		if isCreature(params.cid) then
		if isCreature(params.alvo) then
		if getCreatureTarget(params.cid) == alvo then
		doTargetCombatHealth(cid, alvo, GRASSDAMAGE, -9, -14, 45)
		doCreatureAddHealth(cid, 10)
		doSendMagicEffect(getThingPos(cid), 14)
		doSendAnimatedText(getThingPos(cid), "+10", 35)
		end
		end
		end
		end
		addEvent(suck, 1800, {cid = cid, alvo = alvo, cb = combat, var = var})
		addEvent(suck, 3600, {cid = cid, alvo = alvo, cb = combat, var = var})
		addEvent(suck, 5400, {cid = cid, alvo = alvo, cb = combat, var = var})
		addEvent(suck, 7200, {cid = cid, alvo = alvo, cb = combat, var = var})
		addEvent(suck, 9000, {cid = cid, alvo = alvo, cb = combat, var = var}) 
return true
end
