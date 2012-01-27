function onStepOut(cid, item, position, fromPosition)
if #getCreatureSummons(cid) >= 1 then
doTeleportThing(getCreatureSummons(cid)[1], getThingPos(cid))
doSendMagicEffect(getThingPos(cid), 21)
end
end

function onStepIn(cid, item, fromPosition, item2, topos)
for x=-1,1 do
		for y=-1,1 do
			posa = {x=topos.x+x,y=topos.y+y,z=topos.z}
			if getTileThingByPos(posa).itemid == 460 then
			doRemoveItem(getTileThingByPos(posa).uid, 1)
			end
end
end
end