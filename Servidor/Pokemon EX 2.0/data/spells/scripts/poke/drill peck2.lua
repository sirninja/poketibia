local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_FLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 110)


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

local area1 = createCombatArea(arr1s)
setCombatArea(combat1, area1)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end


function onCastSpell(cid, var)
	doCreatureSay(cid, "DRILL PECK!", TALKTYPE_MONSTER)
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
local pecktarget = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}
if getCreatureName(cid) == "Spearow" then
damagepeck = 25
elseif getCreatureName(cid) == "Fearow" then
damagepeck = 95
elseif getCreatureName(cid) == "Pidgey" then
damagepeck = 95
elseif getCreatureName(cid) == "Pidgeotto" then
damagepeck = 95
elseif getCreatureName(cid) == "Pidgeot" then
damagepeck = 95
elseif getCreatureName(cid) == "Doduo" then
damagepeck = 36
elseif getCreatureName(cid) == "Dodrio" then
damagepeck = 79
end
local xpeck = damagepeck
local function peck(params)
if isCreature(params.cid) then
if isCreature(getCreatureTarget(params.cid)) then
if getCreatureTarget(params.cid) == params.pecktarget then
doAreaCombatHealth(params.cid, FLYDAMAGE, getThingPos(getCreatureTarget(params.cid)), 0, -(params.x), -((params.x)+15), 110)
end
end
end
end
addEvent(peck, 0, {cid = cid, pecktarget = pecktarget, x = xpeck})
addEvent(peck, 480, {cid = cid, pecktarget = pecktarget, x = xpeck})
addEvent(peck, 880, {cid = cid, pecktarget = pecktarget, x = xpeck})
return TRUE
end