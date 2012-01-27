local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, NORMALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 3)

local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

function onCastSpell(cid, var)

	
	doCreatureSay(cid, "DOUBLESLAP!", TALKTYPE_MONSTER)
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
	local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
	local function slap(params)
	if not isMonster(params.cid) then
	return true
	end
	if not isCreature(getCreatureTarget(params.cid)) then
	return true
	end
	doCombat(params.cid, params.combat, var)
	end

addEvent(slap, 0, {cid = cid, combat = combat1})
addEvent(slap, 550, {cid = cid, combat = combat1})

return true
end