function onCastSpell(cid, var)
	doCreatureSay(cid, "Ancient Power!", TALKTYPE_MONSTER)
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
local parameters = { cid = cid, var = var}
if getCreatureName(cid) == "Graveler" then
dmga = 350
elseif getCreatureName(cid) == "Golem" then
dmga = 550
end
local dmg = dmga

		local function fall(params)
		if isCreature(params.cid) then
		local pos = getThingPos(cid)
		pos.x = pos.x + math.random(-3,3)
		pos.y = pos.y + math.random(-3,3)
		local frompos = getThingPos(cid)
		frompos.x = pos.x - 7
		frompos.y = pos.y - 6
		doSendDistanceShoot(frompos, pos, 11)
		doAreaCombatHealth(cid, ROCKDAMAGE, pos, 0, -(dmg), -(dmg+45), 44)
		end
		end

for rocks = 1, 20 do
addEvent(fall, rocks*150, {cid = cid})
end
for rocks = 1, 20 do
addEvent(fall, rocks*110, {cid = cid})
end
end