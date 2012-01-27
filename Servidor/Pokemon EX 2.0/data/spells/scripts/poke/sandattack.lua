local combat1a = createCombatObject()
setCombatParam(combat1a, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat1a, COMBAT_PARAM_EFFECT, 120)


local combat2a = createCombatObject()
setCombatParam(combat2a, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat2a, COMBAT_PARAM_EFFECT, 121)


local combat3a = createCombatObject()
setCombatParam(combat3a, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat3a, COMBAT_PARAM_EFFECT, 122)

local combat4a = createCombatObject()
setCombatParam(combat4a, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat4a, COMBAT_PARAM_EFFECT, 119)






local combat1b = createCombatObject()
setCombatParam(combat1b, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat1b, COMBAT_PARAM_EFFECT, 120)


local combat2b = createCombatObject()
setCombatParam(combat2b, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat2b, COMBAT_PARAM_EFFECT, 121)


local combat3b = createCombatObject()
setCombatParam(combat3b, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat3b, COMBAT_PARAM_EFFECT, 122)


local combat4b = createCombatObject()
setCombatParam(combat4b, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat4b, COMBAT_PARAM_EFFECT, 119)







local combat1c = createCombatObject()
setCombatParam(combat1c, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat1c, COMBAT_PARAM_EFFECT, 120)

local combat2c = createCombatObject()
setCombatParam(combat2c, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat2c, COMBAT_PARAM_EFFECT, 121)


local combat3c = createCombatObject()
setCombatParam(combat3c, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat3c, COMBAT_PARAM_EFFECT, 122)


local combat4c = createCombatObject()
setCombatParam(combat4c, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat4c, COMBAT_PARAM_EFFECT, 119)



arr1s = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr2s = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr3s = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area1s = createCombatArea(arr1s)
local area2s = createCombatArea(arr2s)
local area3s = createCombatArea(arr3s)
setCombatArea(combat1a, area1s)
setCombatArea(combat1b, area2s)
setCombatArea(combat1c, area3s)
setCombatArea(combat2a, area1s)
setCombatArea(combat2b, area2s)
setCombatArea(combat2c, area3s)
setCombatArea(combat3a, area1s)
setCombatArea(combat3b, area2s)
setCombatArea(combat3c, area3s)
setCombatArea(combat4a, area1s)
setCombatArea(combat4b, area2s)
setCombatArea(combat4c, area3s)
function onCastSpell(cid, var)
	doCreatureSay(cid, "SAND ATTACK!", TALKTYPE_MONSTER)
local function sand(params)
if isCreature(params.cid) then
doCombat(params.cid, params.cb, var)
else
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
	if getCreatureLookDir(cid) == 0 then
	addEvent(sand, 0, {cid = cid, cb = combat1a})
	addEvent(sand, 440, {cid = cid, cb = combat1b})
	addEvent(sand, 840, {cid = cid, cb = combat1c})
	elseif getCreatureLookDir(cid) == 1 then
	addEvent(sand, 0, {cid = cid, cb = combat2a})
	addEvent(sand, 440, {cid = cid, cb = combat2b})
	addEvent(sand, 840, {cid = cid, cb = combat2c})
	elseif getCreatureLookDir(cid) == 2 then
	addEvent(sand, 0, {cid = cid, cb = combat3a})
	addEvent(sand, 440, {cid = cid, cb = combat3b})
	addEvent(sand, 840, {cid = cid, cb = combat3c})
	elseif getCreatureLookDir(cid) == 3 then
	addEvent(sand, 0, {cid = cid, cb = combat4a})
	addEvent(sand, 440, {cid = cid, cb = combat4b})
	addEvent(sand, 840, {cid = cid, cb = combat4c})
	end
return TRUE
end