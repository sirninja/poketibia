function onAttack(cid, target)
if isPlayer(getCreatureMaster(cid)) then
return true
end

local name = ""..getCreatureName(getCreatureMaster(target))..","   
if not string.find(getPlayerStorageValue(cid,200), name) then
setPlayerStorageValue(cid, 17, 4)
doMonsterChangeTarget(cid)
	local function walkagain(params)
	if isCreature(params.cid) then
	if not isCreature(getCreatureTarget(params.cid)) then
		if getCreatureSpeed(cid) == 0 then
		doChangeSpeed(cid, 110)
		end
	end
	end
	end
addEvent(walkagain, 2000, {cid = cid})
if isCreature(getCreatureTarget(cid)) then
	if getPlayerStorageValue(cid, 16) >= 1 then
	return true
	end
	local newdir = math.random(0,3)
	if isWalkable(getPosByDir(getThingPos(cid), newdir), cid) then
	doPushCreature(cid, newdir, 1, 0)
		local function delay(params)
		if isCreature(cid) then
		setPlayerStorageValue(cid, 16, 0)
		end
		end
	setPlayerStorageValue(cid, 16, 1)
	addEvent(delay, math.random(2200, 3200), {cid = cid})
	end
end
return true
end
if getPlayerStorageValue(cid, 17) == 4 then
setPlayerStorageValue(cid, 17, 5)
end
if isPlayer(getCreatureTarget(cid)) and #getCreatureSummons(target) >= 1 then
doMonsterSetTarget(cid, getCreatureSummons(target)[1])
end
return true
end


function onCast(cid, target)
if getPlayerStorageValue(cid, 17) == 4 then
return false
end
return true
end

function onDirection(cid, old, current)
if isPlayer(cid) then
return true
end
if isPlayer(getCreatureMaster(cid)) then
return true
end
if getPlayerStorageValue(cid, 17) == 4 then
	if getCreatureSpeed(cid) >= 1 then
doChangeSpeed(cid, -getCreatureSpeed(cid))
	end

return false
end
if getPlayerStorageValue(cid, 17) == 5 then
	if getCreatureSpeed(cid) == 0 and isCreature(getCreatureTarget(cid)) then
	doChangeSpeed(cid, getCreatureBaseSpeed(cid))
	end
return true
end
return true
end













