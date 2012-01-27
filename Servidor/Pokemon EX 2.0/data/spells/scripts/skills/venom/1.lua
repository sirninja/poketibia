local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 8)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0, -10, -1, -50, 5, 5, 4, 7)

function onCastSpell(cid, var)
local summons = getCreatureSummons(cid)
if #summons <= 0 then
return doPlayerSendCancel(cid,"You don't have pokemon")
end
	return doCombat(cid, combat, var)
end
