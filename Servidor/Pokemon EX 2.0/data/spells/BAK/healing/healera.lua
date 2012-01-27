local master = getCreatureMaster(cid)

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_TARGETPLAYERSORSUMMONS, true)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 20, 30)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

local su = getCreatureSummons(cid)
function onCastSpell(cid, var)
if isCreature(cid) then
	if #getCreatureSummons(cid) < 1 then
	return doPlayerSendCancel(cid, "Sorry...")
	end

end
	return doCombat(cid, combat, var)
end
