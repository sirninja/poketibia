local del = {'460', '1022', '1023'}
local updown = {'1', '3'}

function onStepIn(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 17000) <= 0 then
doTeleportThing(cid, topos, false)
doRemoveItem(getTileThingByPos(frompos).uid, 1)
if isPlayer(cid) then
doPlayerSendCancel(cid, "You can't fly.")
end
return true
end
if getPlayerStorageValue(cid, 17000) >= 1 then
if topos.z == frompos.z then
if getCreatureOutfit(cid).lookType == 316 then
effect = 136
else
effect = 2
end
doSendMagicEffect(topos, effect)
end
end
for x=-1,1 do
		for y=-1,1 do
			posa = {x=topos.x+x,y=topos.y+y,z=topos.z}
			if isInArray(del, getTileThingByPos(posa).itemid) then
			doRemoveItem(getTileThingByPos(posa).uid, 1)
			end
end
end
for x=-1,1 do
		for y=-1,1 do
			pose = {x=frompos.x+x,y=frompos.y+y,z=frompos.z}
			if getTileThingByPos(pose).itemid == 0 then
			doCombatAreaHealth(cid, 0, pose, 0, 0, 0, CONST_ME_NONE)
			doCreateItem(460, 1, pose)
end
end
end
doCombatAreaHealth(cid, 0, topos, 0, 0, 0, CONST_ME_NONE)
doCreateItem(460, 1, frompos)
			if topos.z > frompos.z then
			doCreateItem(1023, 1, frompos)
			doTransformItem(getTileThingByPos(frompos).uid, 1023)
			elseif topos.z < frompos.z then
			doCreateItem(1022, 1, frompos)
			doTransformItem(getTileThingByPos(frompos).uid, 1022)
			end
return true
end    