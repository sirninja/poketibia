function doPlayerGiveItem(cid, itemid, amount, subType)
	local item = 0
	if(isItemStackable(itemid)) then
		item = doCreateItemEx(itemid, amount)
		if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	else
		for i = 1, amount do
			item = doCreateItemEx(itemid, subType)
			if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
				return false
			end
		end
	end

	return true
end

function getPlayerBoost(cid)
    local x = 0
    local item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
    local desc = getItemSpecialDescription(item.uid)
    if(item.uid > 0 and desc:match("\+(%d+)"))then
        x = tonumber(desc:match("\+(%d+)"))
    end
    return x + getPlayerLevel(cid)
end

function getPokeBoost(cid,item)
    local x = 0

    local desc = getItemSpecialDescription(item.uid)
    if(item.uid > 0 and desc:match("\+(%d+)"))then
        x = tonumber(desc:match("\+(%d+)"))
    end
    return x
end

function doPlayerGiveItemContainer(cid, containerid, itemid, amount, subType)
	for i = 1, amount do
		local container = doCreateItemEx(containerid, 1)
		for x = 1, getContainerCapById(containerid) do
			doAddContainerItem(container, itemid, subType)
		end

		if(doPlayerAddItemEx(cid, container, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	end

	return true
end

function doPlayerTakeItem(cid, itemid, amount)
	return getPlayerItemCount(cid, itemid) >= amount and doPlayerRemoveItem(cid, itemid, amount)
end

function doPlayerBuyItem(cid, itemid, count, cost, charges)
	return doPlayerRemoveMoney(cid, cost) and doPlayerGiveItem(cid, itemid, count, charges)
end

function doPlayerBuyItemContainer(cid, containerid, itemid, count, cost, charges)
	return doPlayerRemoveMoney(cid, cost) and doPlayerGiveItemContainer(cid, containerid, itemid, count, charges)
end

function doPlayerSellItem(cid, itemid, count, cost)
	if(not doPlayerTakeItem(cid, itemid, count)) then
		return false
	end

	if(not doPlayerAddMoney(cid, cost)) then
		error('[doPlayerSellItem] Could not add money to: ' .. getPlayerName(cid) .. ' (' .. cost .. 'gp).')
	end

	return true
end

function doPlayerWithdrawMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	local balance = getPlayerBalance(cid)
	if(amount > balance or not doPlayerAddMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, balance - amount)
	return true
end

function doPlayerDepositMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	if(not doPlayerRemoveMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
	return true
end

function isPremium(cid)
	return (isPlayer(cid) and (getPlayerPremiumDays(cid) > 0 or getBooleanFromString(getConfigInfo('freePremium'))))
end

function getMonthDayEnding(day)
	if(day == "01" or day == "21" or day == "31") then
		return "st"
	elseif(day == "02" or day == "22") then
		return "nd"
	elseif(day == "03" or day == "23") then
		return "rd"
	end

	return "th"
end

function getMonthString(m)
	return os.date("%B", os.time{year = 1970, month = m, day = 1})
end

function getArticle(str)
	return str:find("[AaEeIiOoUuYy]") == 1 and "an" or "a"
end

function isNumber(str)
	return tonumber(str) ~= nil
end

function doPlayerAddAddons(cid, addon)
	for i = 0, table.maxn(maleOutfits) do
		doPlayerAddOutfit(cid, maleOutfits[i], addon)
	end

	for i = 0, table.maxn(femaleOutfits) do
		doPlayerAddOutfit(cid, femaleOutfits[i], addon)
	end
end

function doPlayerWithdrawAllMoney(cid)
	return doPlayerWithdrawMoney(cid, getPlayerBalance(cid))
end

function doPlayerDepositAllMoney(cid)
	return doPlayerDepositMoney(cid, getPlayerMoney(cid))
end

function doPlayerTransferAllMoneyTo(cid, target)
	return doPlayerTransferMoneyTo(cid, target, getPlayerBalance(cid))
end

function playerExists(name)
	return getPlayerGUIDByName(name) ~= 0
end

function getTibiaTime()
	local minutes = getWorldTime()
	local hours = 0
	while (minutes > 60) do
		hours = hours + 1
		minutes = minutes - 60
	end

	return {hours = hours, minutes = minutes}
end

function doWriteLogFile(file, text)
	local f = io.open(file, "a+")
	if(not f) then
		return false
	end

	f:write("[" .. os.date("%d/%m/%Y %H:%M:%S") .. "] " .. text .. "\n")
	f:close()
	return true
end

function getExperienceForLevel(lv)
	lv = lv - 1
	return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end

function doMutePlayer(cid, time)
	local condition = createConditionObject(CONDITION_MUTED)
	setConditionParam(condition, CONDITION_PARAM_TICKS, time * 1000)
	return doAddCondition(cid, condition)
end

function getPlayerGroupName(cid)
	return getGroupInfo(getPlayerGroupId(cid)).name
end

function getPlayerVocationName(cid)
	return getVocationInfo(getPlayerVocation(cid)).name
end

function getPromotedVocation(vid)
	return getVocationInfo(vid).promotedVocation
end

function doPlayerRemovePremiumDays(cid, days)
	return doPlayerAddPremiumDays(cid, -days)
end

function getPlayerMasterPos(cid)
	return getTownTemplePosition(getPlayerTown(cid))
end

function getHouseOwner(houseId)
	return getHouseInfo(houseId).owner
end

function getHouseName(houseId)
	return getHouseInfo(houseId).name
end

function getHouseEntry(houseId)
	return getHouseInfo(houseId).entry
end

function getHouseRent(houseId)
	return getHouseInfo(houseId).rent
end

function getHousePrice(houseId)
	return getHouseInfo(houseId).price
end

function getHouseTown(houseId)
	return getHouseInfo(houseId).town
end

function getHouseTilesCount(houseId)
	return getHouseInfo(houseId).tiles
end

function getItemNameById(itemid)
	return getItemDescriptionsById(itemid).name
end

function getItemPluralNameById(itemid)
	return getItemDescriptionsById(itemid).plural
end

function getItemArticleById(itemid)
	return getItemDescriptionsById(itemid).article
end

function getItemName(uid)
	return getItemDescriptions(uid).name
end

function getItemPluralName(uid)
	return getItemDescriptions(uid).plural
end

function getItemArticle(uid)
	return getItemDescriptions(uid).article
end

function getItemText(uid)
	return getItemDescriptions(uid).text
end

function getItemSpecialDescription(uid)
	return getItemDescriptions(uid).special
end

function getItemWriter(uid)
	return getItemDescriptions(uid).writer
end

function getItemDate(uid)
	return getItemDescriptions(uid).date
end

function getTilePzInfo(pos)
	return getTileInfo(pos).protection
end

function getTileZoneInfo(pos)
	local tmp = getTileInfo(pos)
	if(tmp.pvp) then
		return 2
	end

	if(tmp.nopvp) then
		return 1
	end

	return 0
end

function doShutdown()
	return doSetGameState(GAMESTATE_SHUTDOWN)
end

function doSummonCreature(name, pos, displayError)
	local displayError, cid = displayError or true, doCreateMonster(name, pos, displayError)
	if(not cid) then
		cid = doCreateNpc(name, pos, displayError)
	end

	return cid
end

function getOnlinePlayers()
	local tmp = getPlayersOnline()
	local players = {}
	for i, cid in ipairs(tmp) do
		table.insert(players, getCreatureName(cid))
	end

	return players
end

function getPlayerByName(name)
	local cid = getCreatureByName(name)
	return isPlayer(cid) and cid or nil
end

function isPlayer(cid)
	return isCreature(cid) and cid >= AUTOID_PLAYERS and cid < AUTOID_MONSTERS
end

function isPlayerGhost(cid)
	if(not isPlayer(cid)) then
		return false
	end

	return getCreatureCondition(cid, CONDITION_GAMEMASTER, GAMEMASTER_INVISIBLE) or getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN)
end

function isMonster(cid)
	return isCreature(cid) and cid >= AUTOID_MONSTERS and cid < AUTOID_NPCS
end

function isNpc(cid)
	return isCreature(cid) and cid >= AUTOID_NPCS
end

function doPlayerSetExperienceRate(cid, value)
	return doPlayerSetRate(cid, SKILL__LEVEL, value)
end

function doPlayerSetMagicRate(cid, value)
	return doPlayerSetRate(cid, SKILL__MAGLEVEL, value)
end

function doPlayerAddLevel(cid, amount, round)
	local experience, level = 0, getPlayerLevel(cid)
	if(amount > 0) then
		experience = getExperienceForLevel(level + amount) - (round and getPlayerExperience(cid) or getExperienceForLevel(level))
	else
		experience = -((round and getPlayerExperience(cid) or getExperienceForLevel(level)) - getExperienceForLevel(level + amount))
	end

	return doPlayerAddExperience(cid, experience)
end

function doPlayerAddMagLevel(cid, amount)
	for i = 1, amount do
		doPlayerAddSpentMana(cid, (getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true) + 1) - getPlayerSpentMana(cid)) / getConfigInfo('rateMagic'))
	end
	return true
end

function doPlayerAddSkill(cid, skill, amount, round)
	if(skill == SKILL__LEVEL) then
		return doPlayerAddLevel(cid, amount, round)
	elseif(skill == SKILL__MAGLEVEL) then
		return doPlayerAddMagLevel(cid, amount)
	end

	return doPlayerAddSkillTry(cid, skill, (getPlayerRequiredSkillTries(cid, skill, getPlayerSkillLevel(cid, skill) + 1) - getPlayerSkillTries(cid, skill)) / getConfigInfo('rateSkill'))
end

function getPartyLeader(cid)
	local party = getPartyMembers(cid)
	if(type(party) ~= 'table') then
		return 0
	end

	return party[1]
end

function isInParty(cid)
	return type(getPartyMembers(cid)) == 'table'
end

function isPrivateChannel(channelId)
	return channelId >= CHANNEL_PRIVATE
end

function doPlayerResetIdleTime(cid)
	return doPlayerSetIdleTime(cid, 0)
end

function doBroadcastMessage(text, class)
	local class = class or MESSAGE_STATUS_WARNING
	if(type(class) == 'string') then
		local className = MESSAGE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
		return false
	end

	local players = getPlayersOnline()
	for _, pid in ipairs(players) do
		doPlayerSendTextMessage(pid, class, text)
	end

	print("> Broadcasted message: \"" .. text .. "\".")
	return true
end

function doPlayerBroadcastMessage(cid, text, class, checkFlag, ghost)
	local checkFlag, ghost, class = checkFlag or true, ghost or false, class or TALKTYPE_BROADCAST
	if(checkFlag and not getPlayerFlagValue(cid, PLAYERFLAG_CANBROADCAST)) then
		return false
	end

	if(type(class) == 'string') then
		local className = TALKTYPE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < TALKTYPE_FIRST or class > TALKTYPE_LAST) then
		return false
	end

	local players = getPlayersOnline()
	for _, pid in ipairs(players) do
		doCreatureSay(cid, text, class, ghost, pid)
	end

	print("> " .. getCreatureName(cid) .. " broadcasted message: \"" .. text .. "\".")
	return true
end

function getBooleanFromString(input)
	local tmp = type(input)
	if(tmp == 'boolean') then
		return input
	end

	if(tmp == 'number') then
		return input > 0
	end

	local str = string.lower(tostring(input))
	return (str == "yes" or str == "true" or (tonumber(str) ~= nil and tonumber(str) > 0))
end

function doCopyItem(item, attributes)
	local attributes = attributes or false

	local ret = doCreateItemEx(item.itemid, item.type)
	if(attributes) then
		if(item.actionid > 0) then
			doItemSetAttribute(ret, "aid", item.actionid)
		end
	end

	if(isContainer(item.uid)) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
			end
		end
	end

	return getThing(ret)
end

function doRemoveThing(uid)
	if(isCreature(uid)) then
		return doRemoveCreature(uid)
	end

	return doRemoveItem(uid)
end

function setAttackFormula(combat, type, minl, maxl, minm, maxm, min, max)
	local min, max = min or 0, max or 0
	return setCombatFormula(combat, type, -1, 0, -1, 0, minl, maxl, minm, maxm, min, max)
end

function setHealingFormula(combat, type, minl, maxl, minm, maxm, min, max)
	local min, max = min or 0, max or 0
	return setCombatFormula(combat, type, 1, 0, 1, 0, minl, maxl, minm, maxm, min, max)
end

function doChangeTypeItem(uid, subtype)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local subtype = subtype or 1
	return doTransformItem(thing.uid, thing.itemid, subtype)
end

function doSetItemText(uid, text, writer, date)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	doItemSetAttribute(uid, "text", text)
	if(writer ~= nil) then
		doItemSetAttribute(uid, "writer", tostring(writer))
		if(date ~= nil) then
			doItemSetAttribute(uid, "date", tonumber(date))
		end
	end

	return true
end

function getFluidSourceType(itemid)
	local item = getItemInfo(itemid)
	return item and item.fluidSource or false
end

function getDepotId(uid)
	return getItemAttribute(uid, "depotid") or false
end

function getItemDescriptions(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local item = getItemInfo(thing.itemid)
	return {
		name = getItemAttribute(uid, "name") or item.name,
		plural = getItemAttribute(uid, "pluralname") or item.plural,
		article = getItemAttribute(uid, "article") or item.article,
		special = getItemAttribute(uid, "description") or "",
		text = getItemAttribute(uid, "text") or "",
		writer = getItemAttribute(uid, "writer") or "",
		date = getItemAttribute(uid, "date") or 0
	}
end

function getItemWeightById(itemid, count, precision)
	local item, count, precision = getItemInfo(itemid), count or 1, precision or false
	if(not item) then
		return false
	end

	if(count > 100) then
		-- print a warning, as its impossible to have more than 100 stackable items without "cheating" the count
		print('[Warning] getItemWeightById', 'Calculating weight for more than 100 items!')
	end

	local weight = item.weight * count
	--[[if(precision) then
		return weight
	end

	local t = string.explode(tostring(weight), ".")
	if(table.maxn(t) == 2) then
		return tonumber(t[1] .. "." .. string.sub(t[2], 1, 2))
	end]]--

	return weight
end

function getItemWeaponType(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	return getItemInfo(thing.itemid).weaponType
end

function getItemRWInfo(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local item, flags = getItemInfo(thing.itemid), 0
	if(item.readable) then
		flags = 1
	end

	if(item.writable) then
		flags = flags + 2
	end

	return flags
end

function getItemLevelDoor(itemid)
	local item = getItemInfo(itemid)
	return item and item.levelDoor or false
end

function isItemStackable(itemid)
	local item = getItemInfo(itemid)
	return item and item.stackable or false
end

function isItemRune(itemid)
	local item = getItemInfo(itemid)
	return item and item.clientCharges or false
end

function isItemDoor(itemid)
	local item = getItemInfo(itemid)
	return item and item.type == 5 or false
end

function isItemContainer(itemid)
	local item = getItemInfo(itemid)
	return item and item.group == 2 or false
end

function isItemFluidContainer(itemid)
	local item = getItemInfo(itemid)
	return item and item.group == 12 or false
end

function isItemMovable(itemid)
	local item = getItemInfo(itemid)
	return item and item.movable or false
end

function isCorpse(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local item = getItemInfo(thing.itemid)
	return item and item.corpseType ~= 0 or false
end

function getContainerCapById(itemid)
	local item = getItemInfo(itemid)
	if(not item or item.group ~= 2) then
		return false
	end

	return item.maxItems
end

function getMonsterAttackSpells(name)
	local monster = getMonsterInfo(name)
	return monster and monster.attacks or false
end

function getMonsterHealingSpells(name)
	local monster = getMonsterInfo(name)
	return monster and monster.defenses or false
end

function getMonsterLootList(name)
	local monster = getMonsterInfo(name)
	return monster and monster.loot or false
end

function getMonsterSummonList(name)
	local monster = getMonsterInfo(name)
	return monster and monster.summons or false
end

PlayerSpeed = 250

flys = {
["Moltres"] = {229, 2300}, -- moltres
["Articuno"] = {230, 2100}, -- artic
["Zapdos"] = {224, 2600}, -- zapdos
["Mew"] = {232, 2200}, -- 1000
["Mewtwo"] = {233, 2200},-- two
["Dragonite"] = {221, 1300},-- nite
["Pidgeot"] = {222, 900}, -- geot
["Fearow"] = {226, 800}, -- fearow
["Aerodactyl"] = {227, 1100}, -- aero
["Charizard"] = {216, 1000}, -- chari
["Porygon"] = {316, 600}, -- porygon
}

rides = {
["Tauros"] = {128, 580}, -- tauros
["Ninetales"] = {129, 800}, -- kyuubi
["Rapidash"] = {130, 800}, -- rapid
["Ponyta"] = {131, 410}, -- ponyta
["Rhyhorn"] = {132, 400}, -- rhyhorn
["Arcanine"] = {12, 900}, -- arcan
["Shiny Arcanine"] = {492, 1000}, -- shiny arca
["Shiny Venusaur"] = {494, 420}, -- shiny vneu
["Crystal Onix"] = {293, 480}, -- cristal onix
["Onix"] = {126, 450}, -- onix
["Venusaur"] = {134, 390}, -- venu
["Dodrio"] = {133, 750}, -- dodrio
["Doduo"] = {135, 420}, -- doduo
}

pokes = {
["Bulbasaur"] = {level = 18, cons = 23},
["Ivysaur"] = {level = 38, cons = 46},
["Venusaur"] = {level = 75, cons = 92},
["Charmander"] = {level = 18, cons = 22},
["Charmeleon"] = {level = 38, cons = 44},
["Charizard"] = {level = 75, cons = 88},
["Squirtle"] = {level = 18, cons = 25},
["Wartortle"] = {level = 38, cons = 50},
["Blastoise"] = {level = 75, cons = 100},
["Caterpie"] = {level = 1, cons = 11},
["Metapod"] = {level = 10, cons = 22},
["Butterfree"] = {level = 30, cons = 44},
["Weedle"] = {level = 1, cons = 13},
["Kakuna"] = {level = 10, cons = 26},
["Beedrill"] = {level = 30, cons = 52},
["Pidgey"] = {level = 1, cons = 16},
["Pidgeotto"] = {level = 20, cons = 32},
["Pidgeot"] = {level = 60, cons = 69},
["Rattata"] = {level = 1, cons = 12},
["Raticate"] = {level = 20, cons = 24},
["Spearow"] = {level = 5, cons = 13},
["Fearow"] = {level = 50, cons = 52},
["Ekans"] = {level = 12, cons = 17},
["Arbok"] = {level = 30, cons = 36},
["Pikachu"] = {level = 20, cons = 20},
["Raichu"] = {level = 50, cons = 50},
["Sandshrew"] = {level = 18, cons = 19},
["Sandslash"] = {level = 55, cons = 73},
["Nidoran Female"] = {level = 10, cons = 21},
["Nidorina"] = {level = 25, cons = 46},
["Nidoqueen"] = {level = 65, cons = 80},
["Nidoran Male"] = {level = 10, cons = 20},
["Nidorino"] = {level = 25, cons = 42},
["Nidoking"] = {level = 65, cons = 71},
["Clefairy"] = {level = 10, cons = 17},
["Clefable"] = {level = 35, cons = 49},
["Vulpix"] = {level = 16, cons = 18},
["Ninetales"] = {level = 65, cons = 63},
["Jigglypuff"] = {level = 10, cons = 15},
["Wigglytuff"] = {level = 42, cons = 47},
["Zubat"] = {level = 5, cons = 12},
["Golbat"] = {level = 30, cons = 39},
["Oddish"] = {level = 5, cons = 14},
["Gloom"] = {level = 18, cons = 30},
["Vileplume"] = {level = 50, cons = 59},
["Paras"] = {level = 1, cons = 16},
["Parasect"] = {level = 40, cons = 48},
["Venonat"] = {level = 14, cons = 15},
["Venomoth"] = {level = 40, cons = 45},
["Diglett"] = {level = 5, cons = 16},
["Dugtrio"] = {level = 35, cons = 49},
["Meowth"] = {level = 12, cons = 14},
["Persian"] = {level = 25, cons = 41},
["Psyduck"] = {level = 12, cons = 15},
["Golduck"] = {level = 55, cons = 53},
["Mankey"] = {level = 10, cons = 17},
["Primeape"] = {level = 45, cons = 59},
["Growlithe"] = {level = 16, cons = 14},
["Arcanine"] = {level = 70, cons = 66},
["Poliwag"] = {level = 5, cons = 11},
["Poliwhirl"] = {level = 20, cons = 22},
["Poliwrath"] = {level = 60, cons = 63},
["Abra"] = {level = 12, cons = 14},
["Kadabra"] = {level = 40, cons = 30},
["Alakazam"] = {level = 70, cons = 61},
["Machop"] = {level = 16, cons = 18},
["Machoke"] = {level = 38, cons = 42},
["Machamp"] = {level = 70, cons = 79},
["Bellsprout"] = {level = 5, cons = 14},
["Weepinbell"] = {level = 18, cons = 29},
["Victreebel"] = {level = 50, cons = 57},
["Tentacool"] = {level = 12, cons = 16},
["Tentacruel"] = {level = 70, cons = 72},
["Geodude"] = {level = 15, cons = 17},
["Graveler"] = {level = 40, cons = 44},
["Golem"] = {level = 70, cons = 82},
["Ponyta"] = {level = 15, cons = 16},
["Rapidash"] = {level = 55, cons = 58},
["Slowpoke"] = {level = 12, cons = 14},
["Slowbro"] = {level = 45, cons = 44},
["Magnemite"] = {level = 15, cons = 14},
["Magneton"] = {level = 38, cons = 37},
["Farfetchd"] = {level = 35, cons = 35},
["Doduo"] = {level = 12, cons = 13},
["Dodrio"] = {level = 42, cons = 49},
["Seel"] = {level = 14, cons = 14},
["Dewgong"] = {level = 55, cons = 59},
["Grimer"] = {level = 12, cons = 15},
["Muk"] = {level = 30, cons = 45},
["Shellder"] = {level = 10, cons = 12},
["Cloyster"] = {level = 65, cons = 61},
["Gastly"] = {level = 14, cons = 13},
["Haunter"] = {level = 40, cons = 33},
["Gengar"] = {level = 70, cons = 75},
["Onix"] = {level = 50, cons = 66},
["Drowzee"] = {level = 18, cons = 17},
["Hypno"] = {level = 50, cons = 56},
["Krabby"] = {level = 5, cons = 14},
["Kingler"] = {level = 35, cons = 38},
["Voltorb"] = {level = 14, cons = 14},
["Electrode"] = {level = 38, cons = 43},
["Exeggcute"] = {level = 8, cons = 12},
["Exeggutor"] = {level = 48, cons = 48},
["Cubone"] = {level = 18, cons = 18},
["Marowak"] = {level = 45, cons = 53},
["Hitmonlee"] = {level = 60, cons = 69},
["Hitmonchan"] = {level = 60, cons = 69},
["Lickitung"] = {level = 45, cons = 55},
["Koffing"] = {level = 15, cons = 13},
["Weezing"] = {level = 30, cons = 39},
["Rhyhorn"] = {level = 35, cons = 22},
["Rhydon"] = {level = 65, cons = 75},
["Chansey"] = {level = 50, cons = 70},
["Tangela"] = {level = 35, cons = 35},
["Kangaskhan"] = {level = 65, cons = 72},
["Horsea"] = {level = 5, cons = 14},
["Seadra"] = {level = 40, cons = 41},
["Goldeen"] = {level = 10, cons = 15},
["Seaking"] = {level = 25, cons = 35},
["Staryu"] = {level = 15, cons = 15},
["Starmie"] = {level = 38, cons = 50},
["Mr. Mime"] = {level = 45, cons = 51},
["Scyther"] = {level = 60, cons = 62},
["Jynx"] = {level = 55, cons = 53},
["Electabuzz"] = {level = 60, cons = 71},
["Magmar"] = {level = 60, cons = 73},
["Pinsir"] = {level = 42, cons = 64},
["Tauros"] = {level = 40, cons = 66},
["Magikarp"] = {level = 1, cons = 7},
["Gyarados"] = {level = 75, cons = 83},
["Lapras"] = {level = 65, cons = 70},
["Ditto"] = {level = 40, cons = 35},
["Eevee"] = {level = 20, cons = 18},
["Vaporeon"] = {level = 55, cons = 44},
["Jolteon"] = {level = 55, cons = 42},
["Flareon"] = {level = 55, cons = 45},
["Porygon"] = {level = 45, cons = 33},
["Omanyte"] = {level = 20, cons = 17},
["Omastar"] = {level = 70, cons = 68},
["Kabuto"] = {level = 20, cons = 17},
["Kabutops"] = {level = 70, cons = 76},
["Aerodactyl"] = {level = 85, cons = 79},
["Snorlax"] = {level = 85, cons = 107},
["Articuno"] = {level = 100, cons = 82},
["Zapdos"] = {level = 100, cons = 80},
["Moltres"] = {level = 100, cons = 86},
["Dratini"] = {level = 15, cons = 16},
["Dragonair"] = {level = 45, cons = 66},
["Dragonite"] = {level = 85, cons = 94},
["Mewtwo"] = {level = 100, cons = 80},
["Mew"] = {level = 100, cons = 67},
}

function getTime(number)
local s = number
local m = 0
local h = 0
    for a = 1, math.floor(number/60) do
    if s <= 59 then
    return {h = h, m = m, s = s}
    else
    s = s - 60
    m = m + 1
        if m >= 60 then
        m = 0
        h = h + 1
        end
    end
    end
    return {h = h, m = m, s = s}
end

function getPokemonName(cid)
    local x = getPlayerStorageValue(cid, 333)
    if x ~= -1 then
    return ""..x..""
    else
    return getCreatureName(cid)
    end
end

function getStringTime(number)
local hour = ""
local minu = ""
local seco = ""
    if getTime(number).h <= 9 then
    hour = "0"..getTime(number).h..""
    else
    hour = ""..getTime(number).h..""
    end
    if getTime(number).m <= 9 then
    minu = "0"..getTime(number).m..""
    else
    minu = ""..getTime(number).m..""
    end
     if getTime(number).s <= 9 then
    seco = "0"..getTime(number).s..""
    else
    seco = ""..getTime(number).s..""
    end
return ""..hour..":"..minu..":"..seco..""
end

ballcooldown =
{

    check = function (cid, type)

        if(getPlayerFlagValue(cid, PLAYERFLAG_HASNOEXHAUSTION)) then

            return false

        end


    if tonumber(getItemAttribute(getPlayerSlotItem(cid, 8).uid, type)) == nil then
    return false
    end
    return tonumber(getItemAttribute(getPlayerSlotItem(cid, 8).uid, type)) >= os.time(t)

    end,



    get = function (cid, type)
        if getItemAttribute(getPlayerSlotItem(cid, 8).uid, type) == nil then
        return ""
        end
        local time = math.ceil(getItemAttribute(getPlayerSlotItem(cid, 8).uid, type) - os.time())
        local x = getStringTime(time)
        return x
    end,



    set = function (cid, type, time)

        doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, type, os.time(t) + time)

    end,

    clean = function (cid, type)
        doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, type, 0)
    end
}


function isWalkable(pos, creature, proj, pz)-- by Nord
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
if isInArray({4820, 4821, 4822, 4823, 4824, 4825}, getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid) then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
local n = not proj and 3 or 2
for i = 0, 255 do
pos.stackpos = i
local tile = getTileThingByPos(pos)
if tile.itemid ~= 0 and not isCreature(tile.uid) then
if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
return false
end
end
end
return true
end

function doPushCreature(uid,direction,distance,time)
   if isCreature(uid) == TRUE then
   local rand = (2*math.random(0,1))-1
   local rand2 = math.random(-1,0)
      if direction == 0 then
      signal = {0,rand,-rand,rand,-rand,0,-1,-1,-1,0,0,0}
      elseif direction == 1 then
      signal = {1,1,1,0,0,0,0,rand,-rand,rand,-rand,0}
      elseif direction == 2 then
      signal = {0,rand,-rand,rand,-rand,0,1,1,1,0,0,0}

      elseif direction == 3 then

      signal = {-1,-1,-1,0,0,0,0,rand,-rand,rand,-rand,0}

      elseif direction == 4 then

      signal = {-1,rand2,(-rand2)-1,0,1,rand2+1,rand2,0}

      elseif direction == 5 then

      signal = {1,-rand2,-((-rand2)-1),0,1,rand2+1,rand2,0}

      elseif direction == 6 then

      signal = {-1,rand2,(-rand2)-1,0,-1,(-rand2)-1,rand2,0}

      else

      signal = {1,-rand2,-((-rand2)-1),0,-1,(-rand2)-1,rand2,0}

      end

   local pos = getThingPos(uid)

   nsig = #signal

   nvar = 0



   repeat

   nvar = nvar+1

   newpos = {x=pos.x+(signal[nvar]),y=pos.y+(signal[(nsig/2)+nvar]),z=pos.z}

   newtile = {x=newpos.x,y=newpos.y,z=newpos.z,stackpos=0}

   until getTileThingByPos(newtile).uid ~= 0 and hasProperty(getTileThingByPos(newtile).uid,3) == FALSE and queryTileAddThing(uid,newpos) == 1 or nvar == (nsig/2)



      if distance == nil or distance == 1 then

      doTeleportThing(uid,newpos,TRUE)

      else

      distance = distance-1

      doTeleportThing(uid,newpos,TRUE)

         if time ~= nil then

         addEvent(doPushCreature,time,uid,direction,distance,time)

         else

         addEvent(doPushCreature,500,uid,direction,distance,500)

         end

      end

   end

end

function walkTo(cid, direction, finalpos, skill)
if not isCreature(cid) then return false end
--if getDistanceBetween(getThingPos(cid), finalpos) <= 1 and getDirectionTo(getThingPos(cid), finalpos) <= 3 and getThingPos(getCreatureMaster(cid)).x == finalpos.x and getThingPos(getCreatureMaster(cid)).y == finalpos.y and (skill == "ride" or skill == "fly") then
--doTeleportThing(cid, finalpos, true)
--return true
--end
if isWalkable(getPosByDir(getThingPos(cid), direction), 0, 0, 0) and direction <= 3 then
doPushCreature(cid, direction, 1, 0)
return true
end

if direction >= 4 then
    if direction == 4 then
        if math.random(1,2) == 1 then
            if isWalkable(getPosByDir(getThingPos(cid), 3), 0, 0, 0) then
            newdir = 3
            else
            newdir = 2
            end
        else
            if isWalkable(getPosByDir(getThingPos(cid), 2), 0, 0, 0) then
            newdir = 2
            else
            newdir = 3
            end
        end
    elseif direction == 5 then
        if math.random(1,2) == 1 then
            if isWalkable(getPosByDir(getThingPos(cid), 2), 0, 0, 0) then
            newdir = 2
            else
            newdir = 1
            end
        else
            if isWalkable(getPosByDir(getThingPos(cid), 1), 0, 0, 0) then
            newdir = 1
            else
            newdir = 2
            end
        end
    elseif direction == 6 then
        if math.random(1,2) == 1 then
            if isWalkable(getPosByDir(getThingPos(cid), 0), 0, 0, 0) then
            newdir = 0
            else
            newdir = 3
            end
        else
            if isWalkable(getPosByDir(getThingPos(cid), 3), 0, 0, 0) then
            newdir = 3
            else
            newdir = 0
            end
        end
    elseif direction == 7 then
        if math.random(1,2) == 1 then
            if isWalkable(getPosByDir(getThingPos(cid), 1), 0, 0, 0) then
            newdir = 1
            else
            newdir = 0
            end
        else
            if isWalkable(getPosByDir(getThingPos(cid), 0), 0, 0, 0) then
            newdir = 0
            else
            newdir = 1
            end
        end
    end
doPushCreature(cid, newdir, 1, 0)
return true
end

if direction <= 3 and not isWalkable(getPosByDir(getThingPos(cid), direction), 0, 0, 0) then
    if direction == 0 then
        if getDirectionTo(getThingPos(cid), finalpos) == 6 then
            if isWalkable(getPosByDir(getThingPos(cid), 3), 0, 0, 0) then
            newdir = 3
            else
            newdir = 6
            end
        elseif getDirectionTo(getThingPos(cid), finalpos) == 7 then
            if isWalkable(getPosByDir(getThingPos(cid), 1), 0, 0, 0) then
            newdir = 1
            else
            newdir = 7
            end
        end
    elseif direction == 1 then
        if getDirectionTo(getThingPos(cid), finalpos) == 7 then
            if isWalkable(getPosByDir(getThingPos(cid), 0), 0, 0, 0) then
            newdir = 0
            else
            newdir = 7
            end
        elseif getDirectionTo(getThingPos(cid), finalpos) == 5 then
            if isWalkable(getPosByDir(getThingPos(cid), 2), 0, 0, 0) then
            newdir = 2
            else
            newdir = 5
            end
        end
    elseif direction == 2 then
        if getDirectionTo(getThingPos(cid), finalpos) == 4 then
            if isWalkable(getPosByDir(getThingPos(cid), 3), 0, 0, 0) then
            newdir = 3
            else
            newdir = 4
            end
        elseif getDirectionTo(getThingPos(cid), finalpos) == 5 then
            if isWalkable(getPosByDir(getThingPos(cid), 1), 0, 0, 0) then
            newdir = 1
            else
            newdir = 5
            end
        end
    elseif direction == 3 then
        if getDirectionTo(getThingPos(cid), finalpos) == 4 then
            if isWalkable(getPosByDir(getThingPos(cid), 2), 0, 0, 0) then
            newdir = 2
            else
            newdir = 4
            end
        elseif getDirectionTo(getThingPos(cid), finalpos) == 6 then
            if isWalkable(getPosByDir(getThingPos(cid), 0), 0, 0, 0) then
            newdir = 0
            else
            newdir = 6
            end
        end
    end
doPushCreature(cid, newdir, 1, 0)
return true
end
doPushCreature(cid, direction, 1, 0)
end


function markPos(sid, pos)
if not isCreature(sid) then return end
setPlayerStorageValue(sid, 145, pos.x)
setPlayerStorageValue(sid, 146, pos.y)
setPlayerStorageValue(sid, 147, pos.z)
end

function getMarkedPos(sid)
if not isCreature(sid) then return end
local xx = getPlayerStorageValue(sid, 145)
local yy = getPlayerStorageValue(sid, 146)
local zz = getPlayerStorageValue(sid, 147)
return {x = xx, y = yy, z = zz}
end

function getOwnerPos(sid)
if not isCreature(sid) then return end
local xx = getPlayerStorageValue(sid, 148)
local yy = getPlayerStorageValue(sid, 149)
local zz = getPlayerStorageValue(sid, 150)
return {x = xx, y = yy, z = zz}
end

function markOwnerPos(sid, pos)
if not isCreature(sid) then return end
setPlayerStorageValue(sid, 148, pos.x)
setPlayerStorageValue(sid, 149, pos.y)
setPlayerStorageValue(sid, 150, pos.z)
end

function doFaceCreature(sid, pos)
if getDirectionTo(getThingPos(sid), pos) == 4 then
    return doCreatureSetLookDir(sid, math.random(2, 3))
elseif getDirectionTo(getThingPos(sid), pos) == 5 then
    return doCreatureSetLookDir(sid, math.random(1, 2))
elseif getDirectionTo(getThingPos(sid), pos) == 6 then
    local dirs = {0, 3}
    return doCreatureSetLookDir(sid, dirs[math.random(1, 2)])
elseif getDirectionTo(getThingPos(sid), pos) == 7 then
    return doCreatureSetLookDir(sid, math.random(0, 1))
end
    return doCreatureSetLookDir(sid, getDirectionTo(getThingPos(sid), pos))
end


function recheck(sid, skill, pos)
local cid = getCreatureMaster(sid)
local stoAnda = getPlayerStorageValue(cid, 12)
		if stoAnda <= 0 or ( getOwnerPos(cid).x ~= getThingPos(getCreatureMaster(sid)).x or getOwnerPos(cid).y ~= getThingPos(getCreatureMaster(sid)).y or isCreature(getCreatureTarget(getCreatureMaster(sid))) ) then
				doChangeSpeed(sid, -getCreatureSpeed(sid))
				doChangeSpeed(sid, getCreatureBaseSpeed(sid))
				markPos(sid, {x=1,y=1,z=7})
				doCreatureSetNoMove(sid,false)
				return true
		else
			addEvent(recheck, 120, sid)
		end
end

function goThere(sid, thepos, skill, target)
if not isCreature(sid) then return true end
if thepos.x ~= getMarkedPos(sid).x or thepos.y ~= getMarkedPos(sid).y then return true end
if isCreature(getCreatureTarget(getCreatureMaster(sid))) and target == false then
doChangeSpeed(sid, -getCreatureSpeed(sid))
doChangeSpeed(sid, getCreatureBaseSpeed(sid))
markPos(sid, {x=1,y=1,z=7})
return true
end
if skill ~= "move" then
if getDistanceBetween(getThingPos(sid), getMarkedPos(sid)) <= 1 then
    if skill == "ride" or skill == "fly" then

        if getThingPos(sid).x == getThingPos(getCreatureMaster(sid)).x and getThingPos(sid).y == getThingPos(getCreatureMaster(sid)).y then
        recheck(sid, skill, thepos)
        return true
        end

        if getThingPos(getCreatureMaster(sid)).x == thepos.x and getThingPos(getCreatureMaster(sid)).y == thepos.y then

            if getDirectionTo(getThingPos(sid), getThingPos(getCreatureMaster(sid))) <= 3 then
            doChangeSpeed(sid, getCreatureBaseSpeed(sid))
            doTeleportThing(sid, thepos, true)
            doChangeSpeed(sid, -getCreatureSpeed(sid))
            markPos(sid, getThingPos(getCreatureMaster(sid)))
            addEvent(goThere, 1030 - (2.2 * (getCreatureBaseSpeed(sid))), sid, getMarkedPos(sid), skill, target)
            else
            doChangeSpeed(sid, - getCreatureSpeed(sid))
            doChangeSpeed(sid, getCreatureBaseSpeed(sid))
            markPos(sid, getThingPos(getCreatureMaster(sid)))
            walkTo(sid, getDirectionTo(getThingPos(sid), getMarkedPos(sid)), getMarkedPos(sid))
            doChangeSpeed(sid, - getCreatureSpeed(sid))
            addEvent(goThere, 1030 - (2.2 * (getCreatureBaseSpeed(sid))), sid, getMarkedPos(sid), skill, target)
            end

        else

        markPos(sid, getThingPos(getCreatureMaster(sid)))
        doChangeSpeed(sid, - getCreatureSpeed(sid))
        doChangeSpeed(sid, getCreatureBaseSpeed(sid))
        if getDirectionTo(getThingPos(sid), getMarkedPos(sid)) >= 4 then
        walkTo(sid, getDirectionTo(getThingPos(sid), getMarkedPos(sid)), getMarkedPos(sid))
        else
        doTeleportThing(sid, getPosByDir(getThingPos(sid), getDirectionTo(getThingPos(sid), getMarkedPos(sid))))
        end
        doChangeSpeed(sid, - getCreatureSpeed(sid))
        addEvent(goThere, 1030 - (2.2 * (getCreatureBaseSpeed(sid))), sid, getMarkedPos(sid), skill, target)
        end

    return true
    end

addEvent(recheck, 350, sid, skill, thepos)
return true
end
end
if getThingPos(sid).x == getMarkedPos(sid).x and getThingPos(sid).y == getMarkedPos(sid).y then
addEvent(recheck, 350, sid, skill, thepos)
return true
end
if (getOwnerPos(sid).x ~= getThingPos(getCreatureMaster(sid)).x or getOwnerPos(sid).y ~= getThingPos(getCreatureMaster(sid)).y) and isCreature(getCreatureTarget(getCreatureMaster(sid))) == false and skill == "move" then
doChangeSpeed(sid, -getCreatureSpeed(sid))
doChangeSpeed(sid, getCreatureBaseSpeed(sid))
markPos(sid, {x=1,y=1,z=7})
return true
end
doChangeSpeed(sid, - getCreatureSpeed(sid))
doChangeSpeed(sid, getCreatureBaseSpeed(sid))
if getDistanceBetween(getThingPos(sid), getMarkedPos(sid)) <= 1 and not isWalkable(getPosByDir(getThingPos(sid), getDirectionTo(getThingPos(sid), getMarkedPos(sid))), 1, 0, 0) then
addEvent(recheck, 350, sid, skill, thepos)
doChangeSpeed(sid, - getCreatureSpeed(sid))
return true
end
walkTo(sid, getDirectionTo(getThingPos(sid), getMarkedPos(sid)), getMarkedPos(sid))
doChangeSpeed(sid, - getCreatureSpeed(sid))
addEvent(goThere, 1030 - (2.2 * (getCreatureBaseSpeed(sid))), sid, getMarkedPos(sid), skill, target)
end
