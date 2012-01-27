local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 79)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 8)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -500, -500, -500, -500)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 79)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 8)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -500, -500, -500, -500)

local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end
local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)
	local msg = getCreatureMaster(cid)
	if isPlayer(msg) == true then
	local mon = getCreatureName(cid)
	doCreatureSay(msg, ""..mon..", use Razor Leaf!", TALKTYPE_SAY)
	end
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 550, parameters)
end