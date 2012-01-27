local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, NONE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0, -90, 0.7, -50)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 127)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, 0, 0, 0)

arr1 = {
{1, 1, 1},
{1, 2, 1},
{1, 1, 1}
}

arr2 = {
{1, 0, 0},
{0, 2, 0},
{0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end
local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
	local msg = getCreatureMaster(cid)
	if isPlayer(msg) == true then
	local mon = getCreatureName(cid)
	doCreatureSay(msg, ""..mon..", use Earthshock!", TALKTYPE_SAY)
	end
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 000, parameters)
addEvent(onCastSpell2, 000, parameters)
return TRUE

end