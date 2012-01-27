local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 142)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -100, -1000, -100, -2000, 500, 500, 100.400, 200.1)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
