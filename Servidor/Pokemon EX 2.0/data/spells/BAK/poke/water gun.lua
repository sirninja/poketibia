local combata, effect, area, words, dir = {}, {74, 75, 76, 69, 70, 71, 77, 75, 78, 72, 70, 73}, {
{ {2}, {1} }, { {2}, {0}, {1}, {1} }, { {2}, {0}, {0}, {0}, {1} },
{ {1, 2} }, { {1, 1, 1, 0, 2} }, { {1, 0, 0, 0, 0, 2} },
{ {1}, {2} }, { {1}, {1}, {0}, {2} }, { {1}, {0}, {0}, {0}, {2} },
{ {2, 1} }, { {2, 0, 1, 1, 1} }, { {2, 0, 0, 0, 0, 1} }
}, {'Solarbeam'},
{ [0] = {1, 3}, [1] = {4, 6}, [2] = {7, 9}, [3] = {10, 12} }

for i = 1, 12 do
        table.insert(combata, createCombatObject())
        setCombatParam(combata[i], COMBAT_PARAM_TYPE, WATERDAMAGE)
        setCombatParam(combata[i], COMBAT_PARAM_EFFECT, effect[i])
        setCombatFormula(combata[i], COMBAT_FORMULA_LEVELMAGIC, -7, 0, -8, 0)
        setCombatArea(combata[i], createCombatArea(area[i]))
end


function onCastSpell(cid, var)
		doCreatureSay(cid, "WATER GUN!", TALKTYPE_MONSTER)
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
        local d = getCreatureLookDirection(cid)

        for i = dir[d][1], dir[d][2] do addEvent(doCombat, 0, cid, combata[i], numberToVariant(cid)) end
return true
end