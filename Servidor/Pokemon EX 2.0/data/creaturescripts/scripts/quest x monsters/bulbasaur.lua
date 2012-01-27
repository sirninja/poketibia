local monsters = {
        --name = storage
        ["bulbasaur"] = 55004
}

function onKill(cid, target)
        local monster = monsters[getCreatureName(target):lower()]
        if(isPlayer(target) == FALSE and monster and getPlayerStorageValue(cid, 76669) == 2) then
                if getPlayerStorageValue(cid, monster) < 100 then 
                        local killedMonsters = getPlayerStorageValue(cid, monster)
            if(killedMonsters == -1) then
                killedMonsters = 1
                        end
                        setPlayerStorageValue(cid, monster, killedMonsters + 1)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed " .. killedMonsters .. " of 100 bulbasaurs.")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed enough bulbasaurs.")
                        setPlayerStorageValue(cid, 76669, 3)
                end
        end
        return TRUE
end