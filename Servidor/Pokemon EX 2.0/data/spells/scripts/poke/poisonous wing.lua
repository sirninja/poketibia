local combatn = createCombatObject()
setCombatParam(combatn, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combatn, COMBAT_PARAM_EFFECT, 128)
setCombatFormula(combatn, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0, -0, -0, -0, -0)

local combats = createCombatObject()
setCombatParam(combats, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combats, COMBAT_PARAM_EFFECT, 131)
setCombatFormula(combats, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0, -0, -0, -0, -0)

local combate = createCombatObject()
setCombatParam(combate, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combate, COMBAT_PARAM_EFFECT, 129)
setCombatFormula(combate, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0, -0, -0, -0, -0)

local combatw = createCombatObject()
setCombatParam(combatw, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combatw, COMBAT_PARAM_EFFECT, 130)
setCombatFormula(combatw, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0, -0, -0, -0, -0)

local combatds = createCombatObject()
setCombatParam(combatds, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combatds, COMBAT_PARAM_EFFECT, 114)

local combatdn = createCombatObject()
setCombatParam(combatdn, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combatdn, COMBAT_PARAM_EFFECT, 114)

local combatde = createCombatObject()
setCombatParam(combatde, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combatde, COMBAT_PARAM_EFFECT, 114)

local combatdw = createCombatObject()
setCombatParam(combatdw, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combatdw, COMBAT_PARAM_EFFECT, 114)


north = {
{0, 0, 0},
{0, 0, 0},
{1, 2, 0},
{0, 0, 0}
}

south = {
{1, 0, 0},
{0, 2, 0},
{0, 0, 0},
{0, 0, 0}
}

east = {
{0, 0, 0, 0},
{0, 1, 0, 0},
{0, 0, 2, 0},
{0, 0, 0, 0},
{0, 0, 0, 0}
}

west = {
{0, 0, 2, 3},
{0, 0, 2, 2},
{0, 0, 0, 0},
{0, 0, 0, 0},
{0, 0, 0, 0}
}

damages = {
{0, 0, 0},
{1, 1, 1},
{0, 2, 0},
{0, 0, 0},
{0, 0, 0}
}

damagen = {
{0, 0, 0},
{0, 0, 0},
{0, 2, 0},
{1, 1, 1},
{0, 0, 0}
}

damagee = {
{0, 0, 0, 0},
{0, 1, 0, 0},
{0, 1, 2, 0},
{0, 1, 0, 0},
{0, 0, 0, 0}
}

damagew = {
{0, 0, 0, 0, 0},
{0, 0, 0, 1, 0},
{0, 0, 2, 1, 0},
{0, 0, 0, 1, 0},
{0, 0, 0, 0, 0}
}

local arean = createCombatArea(north)
local areas = createCombatArea(south)
local areae = createCombatArea(east)
local areaw = createCombatArea(west)
local areadn = createCombatArea(damagen)
local areads = createCombatArea(damages)
local areade = createCombatArea(damagee)
local areadw = createCombatArea(damagew)

setCombatArea(combatn, arean)
setCombatArea(combatw, areaw)
setCombatArea(combats, areas)
setCombatArea(combate, areae)
setCombatArea(combatdn, areadn)
setCombatArea(combatds, areads)
setCombatArea(combatde, areade)
setCombatArea(combatdw, areadw)

function onCastSpell(cid, var)
	doCreatureSay(cid, "POISONOUS WING!", TALKTYPE_MONSTER)
	if getPlayerStorageValue(cid, 3) >= 1 then
	doSendAnimatedText(getThingPos(cid), "MISS", 215)
	setPlayerStorageValue(cid, 3, -1)
	return true
	end
	if getPlayerStorageValue(cid, 5) >= 1 then
		if math.random(1,100) <= 33 then
		doSendAnimatedText(getThingPos(cid), "SELF HIT", 180)
			if isPlayer(getCreatureTarget(cid)) then
			huah = getPlayerLevel(getCreatureTarget(cid))
			else
			huah = getPlayerLevel(getCreatureMaster(getCreatureTarget(cid)))
			end
		local levels = huah
		doTargetCombatHealth(getCreatureTarget(cid), cid, COMBAT_PHYSICALDAMAGE, -(math.random((levels*3),(levels*5))), -((math.random((levels*3),(levels*5))+10)), 3)
		return true
		end
	end
if getCreatureLookDir(cid) == 0 then
doCombat(cid, combatn, var)
doCombat(cid, combatdn, var)
elseif getCreatureLookDir(cid) == 1 then
doCombat(cid, combate, var)
doCombat(cid, combatde, var)
elseif getCreatureLookDir(cid) == 2 then
doCombat(cid, combats, var)
doCombat(cid, combatds, var)
elseif getCreatureLookDir(cid) == 3 then
doCombat(cid, combatw, var)
doCombat(cid, combatdw, var)
end
return TRUE
end