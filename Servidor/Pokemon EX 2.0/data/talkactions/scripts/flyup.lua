function onSay(cid)
if getPlayerStorageValue(cid, 17000) <= 0 then
return true
end
if getThingPos(cid).z == 0 then
doPlayerSendCancel(cid, "You can\'t go higher!")
return true
end
local pos = getCreaturePosition(cid)
	pos.stackpos = 0
	local g = getTileThingByPos(pos)
	pos.z = pos.z-1
	pos.x = pos.x+1
	pos.y = pos.y+1
if getTileThingByPos(pos).itemid == 0 then
doCombatAreaHealth(cid, 0, pos, 0, 0, 0, CONST_ME_NONE)
doCreateItem(1023, 1, pos)
doTeleportThing(cid, pos)
else
doPlayerSendCancel(cid, "You can\'t fly through constructions.")
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
doCreateItem(1023, 1, pos)
end
return true
end