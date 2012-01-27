local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, BUGDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 137)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 23)


function onCastSpell(cid, var)
	doCreatureSay(cid, "STRING SHOT!", TALKTYPE_MONSTER)
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
local target = getCreatureTarget(cid)
local function string(params)
	if isCreature(params.cid) then
	if isCreature(params.target) then
	if getPlayerStorageValue(params.target, 3) >= 1 then
	doSendMagicEffect(getThingPos(params.target), 137)
	end
	end
	end
end
local function voltars(params)
if isCreature(params.target) then
if getPlayerStorageValue(params.target, 3) >= 1 then
setPlayerStorageValue(params.target, 3, -1)
end
end
end
setPlayerStorageValue(getCreatureTarget(cid), 3, 1)
 doCombat(cid, combat, var)
		addEvent(string, 250, {cid = cid, target = target})
		addEvent(string, 500, {cid = cid, target = target})
		addEvent(string, 750, {cid = cid, target = target})
		addEvent(string, 1000, {cid = cid, target = target})
		addEvent(string, 1250, {cid = cid, target = target})
		addEvent(string, 1500, {cid = cid, target = target})
		addEvent(string, 1750, {cid = cid, target = target})
		addEvent(string, 2000, {cid = cid, target = target})
		addEvent(string, 2250, {cid = cid, target = target})
		addEvent(string, 2500, {cid = cid, target = target})
		addEvent(string, 2750, {cid = cid, target = target})
		addEvent(string, 3000, {cid = cid, target = target})
		addEvent(voltars, 3050, {target = target})
return true
end
