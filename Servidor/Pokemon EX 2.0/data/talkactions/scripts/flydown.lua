local lower = {'460', '1022', '1023'}

function onSay(cid)
local houses = {'919', '1015', '1590', '1591', '1592', '1593', '1582', '1584', '1586', '1588', '5248', '5189'}
if getPlayerStorageValue(cid, 17000) <= 0 then
return true
end
if getThingPos(cid).z == 7 then
doPlayerSendCancel(cid, "You can\'t go lower!")
return true
end
if not isInArray(lower, getTileInfo(getThingPos(cid)).itemid) then
doPlayerSendCancel(cid, "You can\'t go lower!")
return true
end
local pos = getCreaturePosition(cid)
pos.stackpos = 0
pos.z = pos.z+1
pos.x = pos.x-1
pos.y = pos.y-1
if isInArray(houses, getTileThingByPos(pos).itemid) then
doPlayerSendCancel(cid, "You can\'t go lower!")
return true
end
if getTileThingByPos(pos).itemid >= 1 then
	if getTilePzInfo(pos) == true then
	doPlayerSendCancel(cid, "You can\'t go down here.")
	return true
	end
	if not isWalkable(pos, cid, 0, 0) then
	doPlayerSendCancel(cid, "You can\'t go there.")
	return true
	end
	ground = getTileInfo(pos).itemid
	doCreateItem(460, 1, pos)
	doTeleportThing(cid, pos)
	doCreateItem(ground, 1, pos)
	else
	doCombatAreaHealth(cid, 0, pos, 0, 0, 0, CONST_ME_NONE)
	doCreateItem(1022, 1, pos)
	doTeleportThing(cid, pos)
return true
end
for x=-1,1 do
		for y=-1,1 do
			posa = {x=getThingPos(cid).x+x,y=getThingPos(cid).y+y,z=getThingPos(cid).z}
			if getTileThingByPos(posa).itemid == 0 then
			doCombatAreaHealth(cid, 0, posa, 0, 0, 0, CONST_ME_NONE)
			doCreateItem(460, 1, posa)
end
end
end
return true
end