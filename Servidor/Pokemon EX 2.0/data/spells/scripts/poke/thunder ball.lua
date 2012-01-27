local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, ELECTRICDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 11)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 34)

local area = createCombatArea(AREA_SQUARE1X1)


setCombatArea(combat, area)



function onCastSpell(cid, var)
	doCreatureSay(cid, "THUNDER BALL!", TALKTYPE_MONSTER)
	if getPlayerStorageValue(cid, 3) >= 1 then
	doSendAnimatedText(getThingPos(cid), "MISS", 215)
	setPlayerStorageValue(cid, 3, -1)
	return true
	end
	return doCombat(cid, combat, var)
end
