local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 5)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -37, -4.0, 0)
setCombatParam(combat1, COMBAT_PARAM_CREATEITEM, 6299)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 36)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3.0, -37, -4.0, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 5)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -4.0, -15, -15, 0)
setCombatParam(combat3, COMBAT_PARAM_CREATEITEM, 6299)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 36)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -4.0, -15, -15, 0)

arr1 = {
{0, 0, 0, 1, 1, 1, 1},
{0, 0, 0, 1, 1, 1, 1},
{0, 0, 0, 1, 1, 1, 1},
{0, 0, 0, 3, 1, 1, 1},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
}

arr2 = {
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1},
{0, 0, 0, 1, 1, 1, 1},
{0, 0, 0, 1, 1, 1, 1},
}

arr3 = {
{1, 1, 1, 0, 0, 0, 0},
{1, 1, 1, 0, 0, 0, 0},
{1, 1, 1, 0, 0, 0, 0},
{1, 1, 1, 3, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
}

arr4 = {
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
{1, 1, 1, 0, 0, 0, 0},
{1, 1, 1, 0, 0, 0, 0},
{1, 1, 1, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)

local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

local function onCastSpell4(parameters)
doCombat(parameters.cid, parameters.combat4, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4 }
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell3, 300, parameters)
addEvent(onCastSpell4, 400, parameters)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "spell by Gabriel,edsmorte@hotmail.com")
return TRUE
end