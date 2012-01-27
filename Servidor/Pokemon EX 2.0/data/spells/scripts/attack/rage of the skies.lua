local acombat1 = createCombatObject()
local acombat3 = createCombatObject()
local acombat2 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 133)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.3, 0, -0.4, 0)
 
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 133)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -0.3, 0, -0.4, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 133)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.3, 0, -0.4, 0)

arr1 = {
{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}
}

arr3 = {
{0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0}
}
 
arr2 = {
{0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0},
{1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1},
{0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0},
{0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0},
{0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0},
{1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1},
{0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0}
}
 
local area1 = createCombatArea(arr1)
local area3 = createCombatArea(arr3)
local area2 = createCombatArea(arr2)
setCombatArea(acombat1, area1)
setCombatArea(acombat3, area3)
setCombatArea(acombat2, area2)


local function onCastSpell1(parameters)
    doCombat(parameters.cid, acombat1, parameters.var)
end
 
local function onCastSpell3(parameters)
    doCombat(parameters.cid, acombat3, parameters.var)
end

local function onCastSpell2(parameters)
    doCombat(parameters.cid, acombat2, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell3, 500, parameters)
addEvent(onCastSpell2, 900, parameters)

end