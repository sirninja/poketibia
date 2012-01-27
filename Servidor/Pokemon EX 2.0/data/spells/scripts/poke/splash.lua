local splasharea = createCombatArea{
{1, 1, 1},
{1, 2, 1},
{1, 1, 1},
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 53)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 120)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)

function onCastSpell(cid, var)
	doCreatureSay(cid,"Splash", TALKTYPE_SAY)
	return doCombat(cid, combat, var)
end