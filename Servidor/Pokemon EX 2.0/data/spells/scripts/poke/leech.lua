local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 84)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 6)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)

function onCastSpell(cid, var) doCreatureSay(cid,"Leech Seed", TALKTYPE_SAY)
	return doCombat(cid, combat, var)
end
