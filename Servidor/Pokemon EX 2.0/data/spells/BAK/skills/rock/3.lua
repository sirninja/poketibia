local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 44)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0, -300, -1, -500, 5, 5, 4, 7)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 44)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0, -300, -1, -500, 5, 5, 4, 7)



local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end


function onCastSpell(cid, var)
local summons = getCreatureSummons(cid)
if #summons <= 0 then
return doPlayerSendCancel(cid,"You don't have pokemon")
end
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 500, parameters)
return TRUE
end







