local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 118)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 11)

setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0)

function onCastSpell(cid, var)

	doCreatureSay(cid, "STRENGTH!", TALKTYPE_MONSTER)
	local msg = getCreatureMaster(cid)
	if isPlayer(msg) == true then
	local mon = getCreatureName(cid)
	doCreatureSay(msg, ""..mon..", use Strength!", TALKTYPE_SAY)
	end
	return doCombat(cid, combat, var)

end 
