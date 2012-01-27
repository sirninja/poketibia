local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 128)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -1000, -1, -20000, 5, 5, 1000.4, 2000.1)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
