local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, GROUNDDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 130)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 18)

function onCastSpell(cid, var)

	doCreatureSay(cid, "MUD SHOT!", TALKTYPE_MONSTER)
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
setPlayerStorageValue(getCreatureTarget(cid), 3, 1)
	local function backg(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureTarget(cid)) then
	if getPlayerStorageValue(getCreatureTarget(cid), 3) >= 1 then
	setPlayerStorageValue(getCreatureTarget(cid), 3, -1)
	end
	end
	end
	end
doCombat(cid, combat, var)
	local function effect(params)
	if isCreature(params.cid) then
	if getPlayerStorageValue(params.cid, 3) >= 1 then
	doSendMagicEffect(getThingPos(params.cid), 34)
	end
	end
	end
addEvent(backg, 3500, {cid = cid})
local aqrvui = getCreatureTarget(cid)
for vx = 1, 7 do
addEvent(effect, vx*500, {cid = aqrvui})
end
return true
end