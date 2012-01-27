
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 42)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 1, 2)

local area = createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4)
setCombatArea(combat, area)

function doPlayerCastSpell(cid, var)
local clone = getCreatureSummons(cid)[1]
	return doCombat(clone, combat, var)
end
