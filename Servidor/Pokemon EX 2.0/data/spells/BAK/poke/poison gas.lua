local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 114)

local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	doCreatureSay(cid, "POISON GAS!", TALKTYPE_MONSTER)
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
local function gas(params)
	if isCreature(params.cid) then
	doAreaCombatHealth(cid, POISONDAMAGE, getThingPos(cid), area, -(params.x), -(params.y), 114)
	end
	end
if getCreatureName(cid) == "Articuno" then
min = 5
elseif getCreatureName(cid) == "Vileplume" then
min = 85
elseif getCreatureName(cid) == "Gloom" then
min = 25
elseif getCreatureName(cid) == "Koffing" then
min = 10
elseif getCreatureName(cid) == "Weezing" then
min = 55
end
local x = min
local y = x + 10
addEvent(gas, 000, {cid = cid, x = x, y = y})
addEvent(gas, 500, {cid = cid, x = x, y = y})
addEvent(gas, 1000, {cid = cid, x = x, y = y})
addEvent(gas, 1500, {cid = cid, x = x, y = y})
addEvent(gas, 2200, {cid = cid, x = x, y = y})
addEvent(gas, 2700, {cid = cid, x = x, y = y})
addEvent(gas, 3200, {cid = cid, x = x, y = y})
addEvent(gas, 3900, {cid = cid, x = x, y = y})
addEvent(gas, 4400, {cid = cid, x = x, y = y})
addEvent(gas, 4900, {cid = cid, x = x, y = y})
end
