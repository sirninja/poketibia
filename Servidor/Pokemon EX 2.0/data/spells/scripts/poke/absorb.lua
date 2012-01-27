function onCastSpell(cid, var)
	doCreatureSay(cid, "ABSORB!", TALKTYPE_MONSTER)
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
if getCreatureName(cid) == "Gloom" then
x = 110
elseif getCreatureName(cid) == "Golbat" then
x = 85
elseif getCreatureName(cid) == "Oddish" then
x = 20
elseif getCreatureName(cid) == "Zubat" then
x = 30
elseif getCreatureName(cid) == "Vileplume" then
x = 260
end
local x = x
	local life = getCreatureHealth(getCreatureTarget(cid))
	doTargetCombatHealth(cid, getCreatureTarget(cid), GRASSDAMAGE, -x, -(x+1), 255)
	local newlife = life - getCreatureHealth(getCreatureTarget(cid))
	if newlife >= 1 then
	doCreatureAddHealth(cid, newlife)
	doSendMagicEffect(getThingPos(cid), 14)
	doSendMagicEffect(getThingPos(getCreatureTarget(cid)), 14)
	doSendAnimatedText(getThingPos(cid), "+"..newlife.."", 35)
	end

end
