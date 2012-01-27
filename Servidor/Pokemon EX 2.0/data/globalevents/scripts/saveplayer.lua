function onThink(cid, interval) 
    for _, cid in ipairs(getPlayersOnline()) do 
        doPlayerSave(cid, true) 
        return true 
    end 
end