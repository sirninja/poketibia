local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, WATERDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 68)


waterspout = {
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1}
}
local area = createCombatArea(waterspout)
setCombatArea(combat, area)

function onCastSpell(cid, var)

doSendDistanceShoot(getThingPos(cid), {x=getThingPos(cid).x, y=getThingPos(cid).y-5, z=getThingPos(cid).z}, 2)
		local function spout(params)
		if isCreature(params.cid) then
		for x = -2,2 do
			for y = -2,2 do
		local newpos = getThingPos(params.cid)
		newpos.x = newpos.x+x
		newpos.y = newpos.y+y
		doSendDistanceShoot({x=getThingPos(params.cid).x, y=getThingPos(params.cid).y-5, z=getThingPos(params.cid).z}, newpos, 2)
		end
		end
		end
		end
		
		local function spdmg(params)
		if isCreature(params.cid) then
		doCombat(params.cid, params.cb, params.var)
		end
		end
		if isInArray(water2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(water1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	doCreatureSay(cid, "WATER SPOUT!", TALKTYPE_MONSTER)
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
		addEvent(spout, 300, {cid = cid})
		addEvent(spdmg, 450, {cid = cid, cb = combat, var = var})
return true
end 
