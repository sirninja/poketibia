local monsters = {
        --name = storage
        ["squirtle"] = 77777,
        ["wartorlte"] = 77778
}

function onKill(cid, target)
        local monster = monsters[getCreatureName(target):lower()]
        if(isPlayer(target) == FALSE and monster and getPlayerStorageValue(cid, 700001) and getPlayerStorageValue(cid, 700002) == 2) then
                if getPlayerStorageValue(cid, monster) < 100 then 
                        local killedMonsters = getPlayerStorageValue(cid, monster)
            if(killedMonsters == -1) then
                killedMonsters = 1
                        end
                        setPlayerStorageValue(cid, monster, killedMonsters + 1)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed " .. killedMonsters .. " of 100 squirtles.")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed enough squirtle.")
                        setPlayerStorageValue(cid, 700001, 3)
                        end
                elseif getPlayerStorageValue(cid, monster) < 10 then 
                        local killedMonsters = getPlayerStorageValue(cid, monster)
                if (killedMonsters == -1) then
                killedMonsters = 1
                        setPlayerStorageValue(cid, monster, killedMonsters + 1)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed " .. killedMonsters .. " of 100 w.")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed enough w.")
                        setPlayerStorageValue(cid, 700002, 3)
                        end
        end
        return TRUE
end