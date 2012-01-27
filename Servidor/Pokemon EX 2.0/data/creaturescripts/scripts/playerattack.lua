function onAttack(cid, target)
if getPlayerStorageValue(target, 201) ~= -1 then
for a, b in pairs(ginasios) do
if getPlayerStorageValue(target, ginasios[getPlayerStorageValue(target, 201)].storage) == 1 then
        if getPlayerStorageValue(cid, ginasios[getPlayerStorageValue(target, 201)].storage) ~= 1 then
        doPlayerSendCancel(cid, "You can't attack this pokemon.")
        return false
        end
end
end
end
if getPlayerStorageValue(target, 17) == 4 then
setPlayerStorageValue(target, 17, 5)
if getPlayerStorageValue(target, 200) == -1 then
setPlayerStorageValue(target, 200, "!, ")
end

setPlayerStorageValue(target, 200, getPlayerStorageValue(target, 200)..""..getCreatureName(cid)..", ")

if #getCreatureSummons(cid) >= 1 then
doMonsterSetTarget(target, getCreatureSummons(cid)[1])
else
doMonsterSetTarget(target, cid)  
end

end
return TRUE
end