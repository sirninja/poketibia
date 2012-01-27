local monsters = {
        --name = storage
        ["charmander"] = 75004
}

function onKill(cid, target)
        local monster = monsters[getCreatureName(target):lower()]
        if(isPlayer(target) == FALSE and monster and getPlayerStorageValue(cid, 96669) == 2) then
                if getPlayerStorageValue(cid, monster) < 100 then 
                        local killedMonsters = getPlayerStorageValue(cid, monster)
            if(killedMonsters == -1) then
                killedMonsters = 1
                        end
                        setPlayerStorageValue(cid, monster, killedMonsters + 1)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed " .. killedMonsters .. " of 100 charmanders.")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed enough charmanders.")
                        setPlayerStorageValue(cid, 96669, 3)
                end
        end
        return TRUE
end