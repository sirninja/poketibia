local combatn = createCombatObject()
setCombatParam(combatn, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combatn, COMBAT_PARAM_EFFECT, 80)
setCombatFormula(combatn, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0, -0, -0, -0, -0)

local combats = createCombatObject()
setCombatParam(combats, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combats, COMBAT_PARAM_EFFECT, 81)
setCombatFormula(combats, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0, -0, -0, -0, -0)

local combate = createCombatObject()
setCombatParam(combate, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combate, COMBAT_PARAM_EFFECT, 83)
setCombatFormula(combate, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0, -0, -0, -0, -0)

local combatw = createCombatObject()
setCombatParam(combatw, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combatw, COMBAT_PARAM_EFFECT, 82)
setCombatFormula(combatw, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0, -0, -0, -0, -0)

local combatds1 = createCombatObject()
setCombatParam(combatds1, COMBAT_PARAM_TYPE, GRASSDAMAGE)

local combatdn1 = createCombatObject()
setCombatParam(combatdn1, COMBAT_PARAM_TYPE, GRASSDAMAGE)

local combatde1 = createCombatObject()
setCombatParam(combatde1, COMBAT_PARAM_TYPE, GRASSDAMAGE)

local combatdw1 = createCombatObject()
setCombatParam(combatdw1, COMBAT_PARAM_TYPE, GRASSDAMAGE)


north = {
{0, 0, 0},
{0, 0, 0},
{0, 2, 0},
{1, 0, 0}
}

south = {
{1, 0, 0},
{0, 0, 0},
{0, 2, 0},
{0, 0, 0},
{0, 0, 0}
}

east = {
{0, 0, 0, 0},
{1, 0, 0, 0},
{0, 0, 2, 0},
{0, 0, 0, 0},
{0, 0, 0, 0}
}

west = {
{0, 0, 0, 3},
{0, 0, 2, 0},
{0, 0, 0, 0},
{0, 0, 0, 0},
{0, 0, 0, 0}
}

damages = {
{1, 1, 1},
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
{1, 1, 1}
}

damagee = {
{0, 0, 0, 0},
{1, 1, 0, 0},
{1, 1, 2, 0},
{1, 1, 0, 0},
{0, 0, 0, 0}
}

damagew = {
{0, 0, 0, 0, 0},
{0, 0, 0, 1, 1},
{0, 0, 2, 1, 1},
{0, 0, 0, 1, 1},
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
setCombatArea(combatdn1, areadn)
setCombatArea(combatds1, areads)
setCombatArea(combatde1, areade)
setCombatArea(combatdw1, areadw)

function onCastSpell(cid, var)
	doCreatureSay(cid, "VINE WHIP!", TALKTYPE_MONSTER)
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
doCombat(cid, combatdn1, var)
elseif getCreatureLookDir(cid) == 1 then
doCombat(cid, combate, var)
doCombat(cid, combatde1, var)
elseif getCreatureLookDir(cid) == 2 then
doCombat(cid, combats, var)
doCombat(cid, combatds1, var)
elseif getCreatureLookDir(cid) == 3 then
doCombat(cid, combatw, var)
doCombat(cid, combatdw1, var)
end
return TRUE
end