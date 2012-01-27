function onStepIn(cid, item, frompos, item2, topos)
if not isPlayer(cid) then
return true
end
-- NORTH
if item2.itemid == 1394 or item2.itemid == 5259 or item2.itemid == 1385 then
playerpos = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z-1}
-- SOUTH
elseif item2.itemid == 1392 then
playerpos = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z-1}
-- EAST
elseif item2.itemid == 1388 then
playerpos = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z-1}
-- WEST
elseif item2.itemid == 1390 or item2.itemid == 5260 or item2.itemid == 5258 then
playerpos = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z-1}
--DOWN
elseif item2.itemid == 383 or item2.itemid == 385 or item2.itemid == 392 or item2.itemid == 469 or item2.itemid == 482 or item2.itemid == 484 then 
playerpos = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z+1}

end