local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, FLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 42)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, FLYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 42)
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, FLYDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 42)
local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 2)
local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 2)
local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(combat6, COMBAT_PARAM_EFFECT, 2)

combat_arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

combat_arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

combat_arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(combat_arr1)
local area2 = createCombatArea(combat_arr2)
local area3 = createCombatArea(combat_arr3)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area1)
setCombatArea(combat5, area2)
setCombatArea(combat6, area3)

function onCastSpell(cid, var)
	doCreatureSay(cid, "TORNADO!", TALKTYPE_MONSTER)
	local function tornado(params)
	if isCreature(params.cid) then
	doCombat(cid, params.cbtornado, var)
	end
	end
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
addEvent(tornado, 0, {cid = cid, cbtornado = combat1, var = var})
addEvent(tornado, 800, {cid = cid, cbtornado = combat2, var = var})
addEvent(tornado, 1600, {cid = cid, cbtornado = combat3, var = var})

addEvent(tornado, 800, {cid = cid, cbtornado = combat4, var = var})
addEvent(tornado, 1600, {cid = cid, cbtornado = combat5, var = var})
addEvent(tornado, 2400, {cid = cid, cbtornado = combat6, var = var})
end