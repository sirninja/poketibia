function onLogin(cid)
if getPlayerStorageValue(cid, 30003) == -1 then
doPlayerAddAddons(cid, 1)
doPlayerAddAddons(cid, 2)
setPlayerStorageValue(cid, 30003, 1)
end
return TRUE
end 