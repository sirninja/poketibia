local config = {
    lottery_hour = "3 Hours", -- Time to next lottery (only for broadcast message, real time you can set on globalevents.xml)
    rewards_id = {2494, 2472, 2514, 2160}, -- Rewards ID
    crystal_counts = 10, -- Used only if on rewards_id is crystal coin (ID: 2160).
    website = "yes" -- Only if you have php scripts and table `lottery` in your database!
    }
function onThink(interval, lastExecution)
    local list = {}
    for i, tid in ipairs(getPlayersOnline()) do
    list[i] = tid
end

        local winner = list[math.random(1, #list)]
        local random_item = config.rewards_id[math.random(1, #config.rewards_id)]
       
        if(random_item == 2160) then
                doPlayerAddItem(winner, random_item, config.crystal_counts)
                doBroadcastMessage("[LOTTERY SYSTEM] Winner: " .. getCreatureName(winner) .. ", Reward: " .. config.crystal_counts .. " " .. getItemNameById(random_item) .. "s! Congratulations! (Next Lottery in " .. config.lottery_hour .. "")
        else
                doBroadcastMessage("[LOTTERY SYSTEM] Winner: " .. getCreatureName(winner) .. ", Reward: " .. getItemNameById(random_item) .. "! Congratulations! (Next Lottery in " .. config.lottery_hour .. "")
                doPlayerAddItem(winner, random_item, 1)
        end
       
        if(config.website == "yes") then
                db.executeQuery("INSERT INTO `lottery` (`name`, `item`) VALUES ('".. getCreatureName(winner) .."', '".. getItemNameById(random_item) .."');")
        end
        return true
end