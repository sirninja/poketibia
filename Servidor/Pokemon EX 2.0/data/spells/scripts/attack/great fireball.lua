local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 114)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT,14)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 1.4, 2.8, 40, 70)



local area = createCombatArea(AREA_CIRCLE3X3)

setCombatArea(combat, area)



function onCastSpell(cid, var)

	return doCombat(cid, combat, var)

end
