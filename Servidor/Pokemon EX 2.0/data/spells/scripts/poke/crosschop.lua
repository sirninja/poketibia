local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 113)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 42)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.5, 0, -3.0, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 112)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 42)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -2.5, 0, -3.0, 0)



local function onCastSpell1(parameters)
    doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters)
    doCombat(parameters.cid, parameters.combat2, parameters.var)
end




function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, }
addEvent(onCastSpell1, 0, parameters)    
addEvent(onCastSpell2, 900, parameters)       
doCreatureSay(cid,"Cross Chop", TALKTYPE_SAY)        

end






