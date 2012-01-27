function onDeath(cid)
local health,maxhealth = getSummonLifes(cid)
if #getCreatureSummons(cid) >= 1 then
setPlayerStorageValue(cid, 61205, health)
setPlayerStorageValue(cid, 61206, maxhealth)
setPlayerStorageValue(cid, 61204, 0)
setPlayerStorageValue(cid, 61207, 1)
end

if getPlayerStorageValue(cid, 63215) >= 1 then
setPlayerStorageValue(cid, 61205, getPlayerStorageValue(cid, 61210))
setPlayerStorageValue(cid, 61206, getPlayerStorageValue(cid, 61209))
setPlayerStorageValue(cid, 61204, 0)
setPlayerStorageValue(cid, 63215, 0)
setPlayerStorageValue(cid, 61207, 1)
end

if getPlayerStorageValue(cid, 62314) >= 1 then
setPlayerStorageValue(cid, 61205, getPlayerStorageValue(cid, 61262))
setPlayerStorageValue(cid, 61206, getPlayerStorageValue(cid, 61263))
setPlayerStorageValue(cid, 61204, 0)
setPlayerStorageValue(cid, 62314, 0)
setPlayerStorageValue(cid, 61207, 1)
end
setPlayerGroupId(cid, 1)
doRemoveCreature(cid)
return TRUE
end