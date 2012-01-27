local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, PDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 146)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 5)

function onCastSpell(cid, var)

	doCreatureSay(cid, "FIRE FANG!", TALKTYPE_MONSTER)
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
	doCombat(cid, combat, var)
	local function fang(params)
	if isCreature(params.cid) then
	doCombat(cid, combat2, var)
	end
	end
	addEvent(fang, 200, {cid = cid})
end
