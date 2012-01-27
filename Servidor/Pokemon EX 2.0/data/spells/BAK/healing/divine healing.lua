local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 208)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.01, 0, 0.02, 0)

local arr = {
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 3, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell1(parameters)
      doCombat(parameters.cid, parameters.combat, parameters.var)
end

function onCastSpell(cid, var) 
local parameters = { cid = cid, var = var, combat = combat }
addEvent(onCastSpell1, 1000, parameters) 
addEvent(onCastSpell1, 2000, parameters) 
addEvent(onCastSpell1, 3000, parameters)
addEvent(onCastSpell1, 4000, parameters) 
addEvent(onCastSpell1, 5000, parameters) 
addEvent(onCastSpell1, 6000, parameters) 
addEvent(onCastSpell1, 7000, parameters)
addEvent(onCastSpell1, 8000, parameters) 
addEvent(onCastSpell1, 9000, parameters) 
addEvent(onCastSpell1, 10000, parameters) 
addEvent(onCastSpell1, 11000, parameters)
addEvent(onCastSpell1, 12000, parameters) 
addEvent(onCastSpell1, 13000, parameters)
addEvent(onCastSpell1, 14000, parameters) 
end