local monsters = {
	--name = storage
	["squirtle"] = 3500000001,
        ["wartortle"] = 350000002
	}

function onKill(cid, target)
	if(isPlayer(target) ~= TRUE) then
		local name = getCreatureName(target)
		local monster = monsters[string.lower(name)]
		if(monster) then
			local killedMonsters = getPlayerStorageValue(cid, monster)
			if(killedMonsters == -1) then
				killedMonsters = 1
			end
			if((name == "squirtle") and getPlayerStorageValue(cid, 6000000) == 2) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You killed " .. killedMonsters .. " of 100 dwarf's.")
				setPlayerStorageValue(cid, monster, killedMonsters + 1)
				if getPlayerStorageValue(cid, 3500000001)>=10 then 
					setPlayerStorageValue(cid, 6000000, 4)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You killed enought dwarf's.")
				end
			if ((name == "wartortle") and getPlayerStorageValue(cid, 6000000) == 3) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You killed " .. killedMonsters .. " of 100 elves.")
				setPlayerStorageValue(cid, monster, killedMonsters + 1)
				if getPlayerStorageValue(cid, 350000002)>=20 then 
					setPlayerStorageValue(cid, 6000000, 4)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You killed enought elves's.")
				end
			end			
		end
	end
	return TRUE
end