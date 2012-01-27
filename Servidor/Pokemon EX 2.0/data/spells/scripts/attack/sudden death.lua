local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 20)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -1, -20, 5, 5, 4, 7)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
