local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 15)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0, -300, -1, -500, 5, 5, 4, 7)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 36)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -0, -300, -1, -500, 5, 5, 4, 7)


local function onCastSpell2(parameters)
    doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local function onCastSpell3(parameters)
    doCombat(parameters.cid, parameters.combat3, parameters.var)
end


function onCastSpell(cid, var)
local summons = getCreatureSummons(cid)
if #summons <= 0 then
return doPlayerSendCancel(cid,"You don't have pokemon")
end
local parameters = { cid = cid, var = var, combat2 = combat2, combat3 = combat3, }  
addEvent(onCastSpell2, 300, parameters)       
addEvent(onCastSpell3, 600, parameters)       
      
   

end






