function onStepIn(cid, item, frompos, item2, topos)
if not isPlayer(cid) then
return true
end
if item.actionid == 1030 then
pedra2 = getTileItemById({x=987,y=1018,z=4}, 1355)
if pedra2.itemid == 1355 then
doRemoveItem(pedra2.uid, 1)
else
end
elseif item.actionid == 1031 then
pedra3 = getTileItemById({x=986,y=1018,z=4}, 1355)
if pedra3.itemid == 1355 then
doRemoveItem(pedra3.uid, 1)
else
end
elseif item.actionid == 1033 then
pedra6 = getTileItemById({x=984,y=1017,z=4}, 1355)
if pedra6.itemid == 1355 then
doRemoveItem(pedra6.uid, 1)
else
end
elseif item.actionid == 1040 then
pedra7 = getTileItemById({x=989,y=1018,z=4}, 1354)
if pedra7.itemid == 1354 then
doRemoveItem(pedra7.uid, 1)
else
end
elseif item.actionid == 1041 then
pedra8 = getTileItemById({x=988,y=1019,z=4}, 1353)
if pedra8.itemid == 1353 then
doRemoveItem(pedra8.uid, 1)
else
end
elseif item.actionid == 1042 then
pedra9 = getTileItemById({x=987,y=1019,z=4}, 1354)
if pedra9.itemid == 1354 then
doRemoveItem(pedra9.uid, 1)
else
end
elseif item.actionid == 1043 then
pedra10 = getTileItemById({x=986,y=1019,z=4}, 1514)
if pedra10.itemid == 1514 then
doRemoveItem(pedra10.uid, 1)
else
end
elseif item.actionid == 1044 then
pedra11 = getTileItemById({x=985,y=1018,z=4}, 1355)
if pedra11.itemid == 1355 then
doRemoveItem(pedra11.uid, 1)
else
end
end
end

function onStepOut(cid, item, position, fromPosition)
if not isPlayer(cid) then
return true
end
if item.actionid >= 1031 and item.actionid < 1040 and item.actionid ~= 1032 then
doCreateItem(1355, 1, fromPosition)
elseif item.actionid == 1032 then
pedra4 = getTileItemById({x=988,y=1017,z=4}, 1304)
doCreateItem(1355, 1, fromPosition)
doCreateItem(1355, 1, {x=987,y=1018,z=4})
if pedra4.itemid == 1304 then
doRemoveItem(pedra4.uid, 1)
else
end
elseif item.actionid == 1040 then
doCreateItem(1304, 1, fromPosition)
elseif item.actionid == 1041 then
doCreateItem(1354, 1, fromPosition)
elseif item.actionid == 1042 then
doCreateItem(1353, 1, fromPosition)
elseif item.actionid == 1043 then
doCreateItem(1354, 1, fromPosition)
elseif item.actionid == 1044 then
doCreateItem(1514, 1, fromPosition)
end
end