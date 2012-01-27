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
setCombatParam(combat4, COMBAT_PARAM_TYPE, FLYDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 42)
local combat5 = createCombatObject()
local meteore = createCombatObject()
setCombatParam(meteore, COMBAT_PARAM_TYPE, COMBAT_PDAMAGE)
setCombatParam(meteore, COMBAT_PARAM_EFFECT, 2)

combat_arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0},
{0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

combat_arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 1, 0, 1, 0, 0},
{0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

combat_arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 1, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

combat_arr4 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 1, 0, 1, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0},
{0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

combat_arr5 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 2, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(combat_arr1)
setCombatArea(combat1, area1)

local area2 = createCombatArea(combat_arr2)
setCombatArea(combat2, area2)

local area3 = createCombatArea(combat_arr3)
setCombatArea(combat3, area3)

local area4 = createCombatArea(combat_arr4)
setCombatArea(combat4, area4)

local area5 = createCombatArea(combat_arr5)
setCombatArea(combat5, area5)
local function meteorCast(p)
        doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

function onTargetTile(cid, pos)
addEvent(meteorCast, 50, {cid = cid,pos = pos, combat = meteore})
end

setCombatCallback(combat5, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
	doCreatureSay(cid, "LEGENDARY STORM!", TALKTYPE_MONSTER)
	local function storm(params)
	if isCreature(params.cid) then
	doCombat(params.cid, params.cb, var)
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
addEvent(storm, 0, {cid = cid, cb = combat1})
addEvent(storm, 500, {cid = cid, cb = combat2})
addEvent(storm, 1000, {cid = cid, cb = combat3})
addEvent(storm, 1500, {cid = cid, cb = combat4})
	addEvent(doCombat, 150, cid, combat5, var)
	addEvent(doCombat, 450, cid, combat5, var)
	addEvent(doCombat, 750, cid, combat5, var)
	addEvent(doCombat, 950, cid, combat5, var)
	addEvent(doCombat, 1050, cid, combat5, var)
end