local charge = createCombatArea{
{1, 1, 1}, 
{1, 2, 1}, 
{1, 1, 1}, 
}

function onCastSpell(cid, var)
		doSendMagicEffect(getThingPos(cid), 48)
		doSendAnimatedText(getThingPos(cid), "CHARGING", 210)
local parameters = { cid = cid, var = var}
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
if getCreatureName(cid) == "Electrode" then
charged = 75
end
local dmg = charged
			local function discharge(params)
			if isCreature(params.cid) then
			if getPlayerStorageValue(params.cid, 15) >= 1 then
			return true
			end
				if math.random(1,100) >= 75 then
				doCreatureSay(cid, "DISCHARGE!", TALKTYPE_MONSTER)
				doAreaCombatHealth(cid, ELECTRICDAMAGE, getThingPos(params.cid), charge, -(dmg), -((dmg)+20), 48)
				setPlayerStorageValue(params.cid, 15, 1)
				else
					if params.charges == 5 then
					doSendAnimatedText(getThingPos(params.cid), "FAIL", 215)
					else
				doSendAnimatedText(getThingPos(params.cid), "CHARGING", 210)
				doSendMagicEffect(getThingPos(params.cid), 48)
				end
				end
			end
			end
		for charges = 1, 5 do
		addEvent(discharge, charges*1000, {cid = cid, charges = charges})
		end
end