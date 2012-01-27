local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, ELECTRICDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 48)

local area = createCombatArea(AREA_BEAM5, AREADIAGONAL_BEAM5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	doCreatureSay(cid, "CHARGE BEAM!", TALKTYPE_MONSTER)
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
for pa = -1, 1 do
		for pb = -1, 1 do
			local sumpos = getThingPos(cid)
			sumpos.x = sumpos.x+pa
			sumpos.y = sumpos.y+pb
			if sumpos ~= getThingPos(cid) then
			doSendDistanceShoot(sumpos, getThingPos(cid), 40)
			end
		end
		end

local function cbem(params)
if isCreature(params.cid) then
doCombat(cid, combat, var)
end
end
addEvent(cbem, 500, {cid = cid})
end
