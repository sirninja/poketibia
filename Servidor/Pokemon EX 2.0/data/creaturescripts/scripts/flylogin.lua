function onLogin(cid)
fly.login(cid)
if getPlayerStorageValue(cid,8888) >= 1 and getPlayerStorageValue(cid,9999) >= 1 then
outfit = getCreatureOutfit(cid)
outfit.lookType = getPlayerStorageValue(cid,9999)
doChangeSpeed(cid,getPlayerStorageValue(cid,8888))
doSetCreatureOutfit(cid, outfit,-1)
end

        return TRUE
end