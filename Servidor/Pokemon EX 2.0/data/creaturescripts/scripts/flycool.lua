function onThink(cid, interval)
if(not isCreature(cid)) then
return
end
if getPlayerStorageValue(cid, 17000) >= 1 then
if getThingPos(cid).z <= 6 then
if getTileThingByPos(getThingPos(cid)).itemid ~= 460 then
for x=-1,1 do
		for y=-1,1 do
			posa = {x=getThingPos(cid).x+x,y=getThingPos(cid).y+y,z=getThingPos(cid).z}
			if getTileThingByPos(posa).itemid == 0 then
			doCombatAreaHealth(cid, 0, posa, 0, 0, 0, CONST_ME_NONE)
			doCreateItem(460, 1, posa)
end
end
end
elseif getTileThingByPos(getThingPos(cid)).itemid == 0 then
for x=-1,1 do
		for y=-1,1 do
			posa = {x=getThingPos(cid).x+x,y=getThingPos(cid).y+y,z=getThingPos(cid).z}
			if getTileThingByPos(posa).itemid == 0 then
			doCombatAreaHealth(cid, 0, posa, 0, 0, 0, CONST_ME_NONE)
			doCreateItem(460, 1, posa)
end
end
end
end
end
end
return true
end