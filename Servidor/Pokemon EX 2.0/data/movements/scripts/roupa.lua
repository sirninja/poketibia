function onStepIn(cid, item, frompos, item2, topos)
if not isPlayer(cid) then
return true
end
    if getPlayerStorageValue(cid, 17000) >= 1 then
	return true
	end
    if getPlayerStorageValue(cid, 17001) >= 1 then
	return true
	end
    doRemoveCondition(cid, CONDITION_OUTFIT)
    setPlayerStorageValue(cid, 10, 0)
end