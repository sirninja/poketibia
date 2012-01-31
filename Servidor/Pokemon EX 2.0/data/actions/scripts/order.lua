-- feito por brun123, editado por glugluguga


local nao = {'4820', '4821', '4822', '4823', '4824', '4825', '1395', '1389', '1391', '1393', '460'}

local direction = {'4', '5', '6', '7'}
-- ridefly
local ridefly = {'Shiny Charizard','Crystal Onix','Bayleef', 'Meganium', 'Houndoom', 'Ninetales' , 'Piloswine', 'Stantler','Porygon2','Skarmory','Mareep','Crobat','Lugia','Ho-oh','Celebi', 'Venusaur', 'Ninetales', 'Arcanine', 'Ponyta', 'Rapidash', 'Dodrio', 'Onix', 'Rhyhorn', 'Tauros', 'Porygon', 'Aerodactyl', 'Dragonite', 'Charizard', 'Pidgeot', 'Fearow', 'Moltres', 'Zapdos', 'Articuno', 'Mew', 'Mewtwo'}
local ride = {'Crystal Onix', 'Venusaur', 'Mareep', 'Bayleef', 'Meganium', 'Houndoom', 'Ninetales' , 'Piloswine', 'Stantler', 'Arcanine', 'Ponyta', 'Rapidash', 'Entei', 'Raikou', 'Suicune', 'Doduo', 'Dodrio', 'Onix', 'Rhyhorn', 'Tauros'}
local fly = {'Shiny Charizard','Porygon','Porygon2','Skarmory','Crobat','Lugia','Ho-oh','Celebi', 'Aerodactyl', 'Dragonite', 'Charizard', 'Pidgeot', 'Fearow', 'Zapdos', 'Moltres', 'Articuno', 'Mew', 'Mewtwo'}
local flys = {
[265] = {229, 2300, 350}, -- moltres
[283] = {230, 2100, 350}, -- artic
[199] = {224, 2600, 350}, -- zapdos
[9] = {232, 2200, 525}, -- 1000
[34] = {233, 2200, 525},-- two
[210] = {221, 1300, 500},-- nite
[80] = {222, 900, 375}, -- geot
[17] = {226, 800, 400}, -- fearow
[10] = {227, 1100, 410}, -- aero
[67] = {216, 1000, 410}, -- chari
[97] = {316, 600, 440}, -- porygon
[385] = {461, 1200, 500}, -- porygon2
[398] = {462, 850, 600}, -- skarmory
[338] = {478, 900, 500}, -- crobat
[294] = {295, 1500, 410}, -- shiny zard
[0] = {0, 500, 430}, -- Lugia
[0] = {0, 500, 430}, -- Ho-oh
[0] = {0, 500, 430}, -- Celebi
}

local rides = {
[0] = {0, 500, 430}, -- raikou
[0] = {0, 500, 430}, -- suicune
[0] = {0, 500, 430}, -- entei
[349] = {569, 450, 430}, -- mareep
[320] = {564, 500, 430}, -- meganium
[319] = {565, 450, 430}, -- bayleef
[409] = {567, 700, 430}, -- stantler
[395] = {460, 950, 430}, -- houndoom
[390] = {570, 500, 430}, -- piloswine
[93] = {128, 780, 400}, -- tauros
[114] = {129, 800, 375}, -- ninetales
[220] = {130, 800, 395}, -- rapid
[16] = {131, 410, 500}, -- ponyta
[77] = {132, 400, 510}, -- rhyhorn
[88] = {12, 900, 390}, -- arcanine
[493] = {492, 1000, 360}, -- shiny arcanine
[496] = {494, 420, 420}, -- shiny venusaur
[292] = {293, 480, 430}, -- cristal onix
[248] = {126, 450, 450}, -- onix
[369] = {459, 900, 430}, -- steelix
[22] = {134, 390, 450}, -- venusaur
[120] = {133, 750, 380}, -- dodrio
[26] = {135, 420, 500}, -- doduo
}
local bolas = {'2222', '2223', '2224'}
local ultra = {'2220', '2221', '2227'}
local etudao = 9506

local mind = 9507

-- ROCK SMASH
local rocksmash = {'Sandshrew', 'Sandslash', 'Diglett', 'Dugtrio', 'Primeape', 'Machop', 'Machoke', 'Machamp', 'Geodude', 'Graveler', 'Golem' , 'Onix', 'Cubone', 'Marowak', 'Rhyhorn', 'Rhydon', 'Kangaskhan', 'Tauros', 'Snorlax', 'Poliwrath'}
local erockmash = 9502
local cdrocksmash = 0
-- ROCK SMASH

-- DIG
local digholes = {'468', '481', '483'}
local dig = {'Raticate', 'Sandshrew', 'Sandslash', 'Diglett', 'Dugtrio', 'Primeape', 'Machop', 'Machoke', 'Machamp', 'Geodude', 'Graveler', 'Golem' , 'Onix', 'Cubone', 'Marowak', 'Rhyhorn', 'Rhydon', 'Kangaskhan', 'Tauros', 'Snorlax'}
local edig = 9504
local cddig = 0
-- DIG

-- CUT
local cut = {'Raticate', 'Bulbasaur', 'Ivysaur', 'Venusaur', 'Charmeleon', 'Sandshrew', 'Sandslash', 'Gloom', 'Vileplume', 'Paras', 'Parasect', 'Meowth', 'Persian', 'Bellsprout', 'Weepinbell', 'Victreebel', 'Farfetchd', 'Krabby', 'Kingler', 'Exeggutor', 'Cubone', 'Marowak', 'Tangela', 'Scyther', 'Pinsir'}
local ecut = 9503
local cdcut = 0
-- CUT

-- BLINK
local blink = {'Abra', 'Kadabra', 'Alakazam', 'Porygon'}
local exhaustblink = 9501
local cdblink = 10
-- BLINK

-- LIGHT
local light = {'Abra', 'Kadabra', 'Alakazam', 'Magnemite', 'Magneton', 'Drowzee', 'Hypno', 'Voltorb', 'Electrode', 'Mrmime', 'Electabuzz','Elekid', 'Jolteon', 'Porygon', 'Pikachu','Pichu', 'Raichu','Chinchou','Lanturn','Natu','Xatu','Togepi','Togetic','Raikou','Mareep','Flaafy','Ampharos','Blissey','Espeon'}
local exhautStorage = 9500
local time = 600
local cd = 5
-- LIGHT

function onUse(cid, item, frompos, item2, topos)
if getPlayerItemCount(cid, item2.itemid) >= 1 then
return false
end
if exhaustion.get(cid, etudao) then
	doPlayerSendCancel(cid, "Please wait a few seconds before using order again!")
	return true
	end
if isMonster(item2.uid) and item2.uid ~= getCreatureSummons(cid)[1] and item2.uid ~= cid then
if #getCreatureSummons(cid) == 0 then
	doPlayerSendCancel(cid, "You need a pokemon to use order.")
	return true
	end
if exhaustion.get(cid, mind) then
doPlayerSendCancel(cid, "Your pokemon is too exhausted from the last control, this ability has 2 minutes cooldown.")
return true
end
if isPlayer(getCreatureMaster(item2.uid)) then
doPlayerSendCancel(cid, "You cant control the mind of someone's else pokemon.")
return true
end
if not isInArray({"Alakazam","Shiny Alakazam", "Tentacruel","Shiny Tentacruel", "Gengar","Shiny Gengar"}, getCreatureName(getCreatureSummons(cid)[1])) then
doPlayerSendCancel(cid, "This pokemon cant control minds.")
return true
end
exhaustion.set(cid, mind, 240)
doCreatureSay(getCreatureSummons(cid)[1], "CONTROL MIND!", TALKTYPE_MONSTER)
doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(item2.uid), 39)
registerCreatureEvent(item2.uid, "Controled")
doSendMagicEffect(getThingPos(item2.uid), 136)
doSendMagicEffect(getThingPos(item2.uid), 134)
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 133)
setPlayerStorageValue(cid, 61209, getCreatureMaxHealth(getCreatureSummons(cid)[1]))
setPlayerStorageValue(cid, 61210, getCreatureHealth(getCreatureSummons(cid)[1]))
doConvinceCreature(cid, item2.uid)
if getCreatureSpeed(item2.uid) == 0 then
doChangeSpeed(item2.uid, 180)
end
doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", control "..string.lower(getCreatureName(item2.uid)).."'s mind!", 1)
local cmed = item2.uid
local cmname = getCreatureName(getCreatureSummons(cid)[1])
local cmpos = getThingPos(getCreatureSummons(cid)[1])
doRemoveCreature(getCreatureSummons(cid)[1])
local cmzao = doSummonCreature(""..cmname.." cm", cmpos)
doConvinceCreature(cid, cmzao)
setPlayerStorageValue(cid, 888, 1)
	local function check(params)
	if isCreature(params.cid) then
	if getPlayerStorageValue(params.cid, 888) <= 0 then
	return true
	end
	if not isCreature(cmed) then
local pkcmpos = getThingPos(getCreatureSummons(cid)[1])
doRemoveCreature(getCreatureSummons(cid)[1])
local item = getPlayerSlotItem(cid, 8)
local pk = doSummonCreature(getItemAttribute(item.uid, "poke"):match("This is (.-)'s pokeball."), pkcmpos)
doConvinceCreature(cid, pk)
doCreatureSetLookDir(getCreatureSummons(cid)[1], 2)
registerCreatureEvent(pk, "DiePoke")
registerCreatureEvent(pk, "Exp")
registerCreatureEvent(cid, "PlayerPokeDeath")
setCreatureMaxHealth(pk, (getPlayerStorageValue(cid, 61209)))
doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61209)))
doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61210))-(getPlayerStorageValue(cid, 61209)))
setPlayerStorageValue(cid, 888, 0)
	end
	if params.rod == 20 then
	local lifecmed = getCreatureMaxHealth(cmed) - getCreatureHealth(cmed)
	local poscmed = getThingPos(cmed)
	local cmeddir = getCreatureLookDir(cmed)
	local namecmed = getCreatureName(cmed)
	doRemoveCreature(getCreatureSummons(cid)[1])
	local back = doSummonCreature(""..namecmed.." s", poscmed)
	if getCreatureSpeed(back) == 0 then
	doChangeSpeed(back, 180)
	end
	doCreatureSetLookDir(back, cmeddir)
	doCreatureAddHealth(back, -lifecmed)
local item = getPlayerSlotItem(cid, 8)
local mynewpos = getThingPos(getCreatureSummons(cid)[1])
doRemoveCreature(getCreatureSummons(cid)[1])
pk = doSummonCreature(getItemAttribute(item.uid, "poke"):match("This is (.-)'s pokeball."), mynewpos)
doConvinceCreature(cid, pk)
doCreatureSetLookDir(getCreatureSummons(cid)[1], 2)
registerCreatureEvent(pk, "DiePoke")
registerCreatureEvent(pk, "Exp")
registerCreatureEvent(cid, "PlayerPokeDeath")
setCreatureMaxHealth(pk, (getPlayerStorageValue(cid, 61209)))
doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61209)))
doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61210))-(getPlayerStorageValue(cid, 61209)))
setPlayerStorageValue(cid, 888, 0)
	else
	doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 220)
	end
	end
	end
for rod = 1, 20 do
addEvent(check, rod*500, {cid = cid, rod = rod})
end
return true
end

if item2.uid == cid then
	if getPlayerStorageValue(cid, 888) >= 1 then
	doPlayerSendCancel(cid, "You cant fly neither ride pokemons being controled.")
	return true
	end
	if #getCreatureSummons(cid) == 0 and getPlayerStorageValue(cid, 17000) <= 0 and getPlayerStorageValue(cid, 17001) <= 0 then
	doPlayerSendCancel(cid, "You need a pokemon to use order.")
	return true
	end

	if getPlayerStorageValue(cid, 17000) <= 0 and getPlayerStorageValue(cid, 17001) <= 0 and not isInArray(ridefly, getCreatureName(getCreatureSummons(cid)[1])) then
	doPlayerSendCancel(cid, "You can't ride this pokemon nor fly with it.")
	return true
	end

	if getPlayerStorageValue(cid, 17000) <= 0 and getPlayerStorageValue(cid, 17001) <= 0 and getCreatureSpeed(getCreatureSummons(cid)[1]) == 0 then
	return true
	end


	if getPlayerStorageValue(cid, 17001) <= 0 and getPlayerStorageValue(cid, 17000) <= 0 and isInArray(ride, getCreatureName(getCreatureSummons(cid)[1])) then
	local pokemon = rides[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType]
	if getCreatureSpeed(getCreatureSummons(cid)[1]) >= 1 then
	doChangeSpeed(getCreatureSummons(cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
	end
	local function ride(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	if getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), getThingPos(cid)) <= params.d then
	doChangeSpeed(cid, -250)
	doChangeSpeed(cid, pokemon[2])
	exhaustion.set(cid, etudao, 4)
	setPlayerStorageValue(cid, 17001, 1)
	doSetCreatureOutfit(cid, {lookType = pokemon[1], lookHead = 0, lookAddons = 0, lookLegs = 0, lookBody = 0, lookFeet = 0}, -1)
	setPlayerStorageValue(cid, 61209, getCreatureMaxHealth(getCreatureSummons(cid)[1]))
	setPlayerStorageValue(cid, 61210, getCreatureHealth(getCreatureSummons(cid)[1]))
	doRemoveCreature(getCreatureSummons(cid)[1])
	else
	dirh = getDirectionTo(getThingPos(getCreatureSummons(params.cid)[1]), getThingPos(params.cid))
	if dirh == NORTHWEST then
		if math.random(1,100) >= 51 then
		dirh = NORTH
		else
		dirh = WEST
		end
	elseif dirh == SOUTHWEST then
		if math.random(1,100) >= 51 then
		dirh = SOUTH
		else
		dirh = WEST
		end
	elseif dirh == SOUTHEAST then
		if math.random(1,100) >= 51 then
		dirh = SOUTH
		else
		dirh = EAST
		end
	elseif dirh == NORTHEAST then
		if math.random(1,100) >= 51 then
		dirh = NORTH
		else
		dirh = EAST
		end
	end
	local dirh = dirh
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
	doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(cid)[1]))
	doPushCreature(getCreatureSummons(params.cid)[1], dirh, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
	else
	doPushCreature(getCreatureSummons(params.cid)[1], dirh, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
	end
	end
	end
	end
	end

	local function speed(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
	doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(cid)[1]))
	end
	end
	end
	end
	doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", let me ride you!", 1)
exhaustion.set(cid, etudao, 4)
	if getPlayerGroupId(cid) >= 2 and getPlayerGroupId(cid) <= 6 then
	distanc = 1
	else
	distanc = 0
	end
	local distance = distanc
	for i=1,12 do
	addEvent(ride, pokemon[3]*i, {cid = cid, d = distance})
	addEvent(speed, ((pokemon[3]*12)+100), {cid = cid})
	end
	return true
	end

	if getPlayerStorageValue(cid, 17001) >= 1 then
	setPlayerStorageValue(cid, 17001, 0)
	if getPlayerGroupId(cid) ~= 6 then
	setPlayerGroupId(cid, 8)
	end
	doCreatureSetLookDir(cid, 2)
	doChangeSpeed(cid, -(getCreatureSpeed(cid)))
	if getPlayerGroupId(cid) >= 2 and getPlayerGroupId(cid) <= 7 then
	doChangeSpeed(cid, 400*getPlayerGroupId(cid))
	else
	doChangeSpeed(cid, 250)
	end
	doRemoveCondition(cid, CONDITION_OUTFIT)
	local item = getPlayerSlotItem(cid, 8)
	doCreatureSay(cid, "" .. getItemAttribute(item.uid, "poke"):match("This is (.-)'s pokeball.")..", let me get down!", 1)
	doSummonMonster(cid, getItemAttribute(item.uid, "poke"):match("This is (.-)'s pokeball."))
	local pk = getCreatureSummons(cid)[1]
	registerCreatureEvent(cid, "PlayerPokeDeath")
	registerCreatureEvent(pk, "DiePoke")
	registerCreatureEvent(pk, "Exp")
	setCreatureMaxHealth(pk, (getPlayerStorageValue(cid, 61209)))
	doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61209)))
	doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61210))-(getPlayerStorageValue(cid, 61209)))
	return true
	end


if getPlayerStorageValue(cid, 17000) >= 1 then
	if isInArray({460, 1022, 1023}, getTileInfo(getThingPos(cid)).itemid) then
	doPlayerSendCancel(cid, "You can\'t stop flying at this height!")
	return true
	end
	if getTileInfo(getThingPos(cid)).itemid >= 4820 and getTileInfo(getThingPos(cid)).itemid <= 4825 then
	doPlayerSendCancel(cid, "You can\'t stop flying above the water!")
	return true
	end
	if getPlayerGroupId(cid) ~= 6 then
	setPlayerGroupId(cid, 8)
	end
	doCreatureSetLookDir(cid, 2)
	setPlayerStorageValue(cid, 17000, 0)
	doChangeSpeed(cid, -(getCreatureSpeed(cid)))
	if getPlayerGroupId(cid) >= 2 and getPlayerGroupId(cid) <= 7 then
	doChangeSpeed(cid, 200*getPlayerGroupId(cid))
	else
	doChangeSpeed(cid, 250)
	end
	doRemoveCondition(cid, CONDITION_OUTFIT)
	local item = getPlayerSlotItem(cid, 8)
	doCreatureSay(cid, "" .. getItemAttribute(item.uid, "poke"):match("This is (.-)'s pokeball.")..", let me get down!", 1)
	doSummonMonster(cid, getItemAttribute(item.uid, "poke"):match("This is (.-)'s pokeball."))
	local pk = getCreatureSummons(cid)[1]
	registerCreatureEvent(cid, "PlayerPokeDeath")
	registerCreatureEvent(pk, "DiePoke")
	registerCreatureEvent(pk, "Exp")
	setCreatureMaxHealth(pk, (getPlayerStorageValue(cid, 61209)))
	doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61209)))
	doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61210))-(getPlayerStorageValue(cid, 61209)))
return true
end

	if getPlayerStorageValue(cid, 17000) <= 0 and getPlayerStorageValue(cid, 17001) <= 0 and isInArray(fly, getCreatureName(getCreatureSummons(cid)[1])) then
	if getPlayerStorageValue(cid, 17000) <= 0 then
	local pokemon = flys[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType]
	local function fly(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	if getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), getThingPos(cid)) <= params.dd then
	doPlayerSendTextMessage(cid,27, "Type \"up\" or \"h1\" to fly higher and \"down\" or \"h2\" to fly lower." )
	setPlayerStorageValue(cid, 61209, getCreatureMaxHealth(getCreatureSummons(cid)[1]))
	setPlayerStorageValue(cid, 61210, getCreatureHealth(getCreatureSummons(cid)[1]))
	setPlayerStorageValue(cid, 17000, 1)
	registerCreatureEvent(cid, "Flying")
	doChangeSpeed(cid, -250)
	doChangeSpeed(cid, pokemon[2])
	exhaustion.set(cid, etudao, 4)
	doSetCreatureOutfit(cid, {lookType = pokemon[1], lookHead = 0, lookAddons = 0, lookLegs = 0, lookBody = 0, lookFeet = 0}, -1)
	doRemoveCreature(getCreatureSummons(cid)[1])
	else
	dir = getDirectionTo(getThingPos(getCreatureSummons(params.cid)[1]), getThingPos(params.cid))
	if dir == NORTHWEST then
		if math.random(1,100) >= 51 then
		dir = NORTH
		else
		dir = WEST
		end
	elseif dir == SOUTHWEST then
		if math.random(1,100) >= 51 then
		dir = SOUTH
		else
		dir = WEST
		end
	elseif dir == SOUTHEAST then
		if math.random(1,100) >= 51 then
		dir = SOUTH
		else
		dir = EAST
		end
	elseif dir == NORTHEAST then
		if math.random(1,100) >= 51 then
		dir = NORTH
		else
		dir = EAST
		end
	end
	local dir = dir
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
	doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(cid)[1]))
	doPushCreature(getCreatureSummons(params.cid)[1], dir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
	else
	doPushCreature(getCreatureSummons(params.cid)[1], dir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
	end
	end
	end
	end
	end

	local function speed(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
	doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(cid)[1]))
	end
	end
	end
	end

	doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", lets fly!", 1)
exhaustion.set(cid, etudao, 4)
	if getPlayerGroupId(cid) >= 2 and getPlayerGroupId(cid) <= 6 then
	distancc = 1
	else
	distancc = 0
	end
	local distancee = distancc
	for i=1,12 do
	addEvent(fly, pokemon[3]*i, {cid = cid, dd = distancee})
	addEvent(speed, ((pokemon[3]*12)+100), {cid = cid})
	end
	return true
	end
return true
end
end
-- ROCK SMASH
if item2.itemid == 1285 and getPlayerStorageValue(cid, 63215) <= 0 then
if #getCreatureSummons(cid) == 0 then
doPlayerSendCancel(cid, "You need a pokemon to use rock smash.")
return true
end
if not isInArray(rocksmash, getCreatureName(getCreatureSummons(cid)[1])) then
doPlayerSendCancel(cid, "This pokemon can't use rock smash.")
return true
end
if isInArray(rocksmash, getCreatureName(getCreatureSummons(cid)[1])) then
	if exhaustion.get(cid, erocksmash) then
	doPlayerSendCancel(cid, "Please wait a few seconds before using rock smash again!")
	return true
	end


if getCreatureSpeed(getCreatureSummons(cid)[1]) == 0 then
return true
end
doChangeSpeed(getCreatureSummons(cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
	local function tocut(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) >= 1 then
	return true
	end
	if getPlayerStorageValue(getCreatureSummons(params.cid)[1], 100) >= 1 then
	return true
	end
	if getDistanceBetween(getThingPos(getCreatureSummons(params.cid)[1]), topos) == 1 then
	doSendMagicEffect(topos, 118)
	doTransformItem(getTileItemById(topos, 1285).uid, 2257)
	exhaustion.set(cid, erocksmash, cdrocksmash)
	setPlayerStorageValue(getCreatureSummons(params.cid)[1], 100, 1)
		local function detrans(params)
		doTransformItem(getTileItemById(topos, 2257).uid, 1285)
			if isCreature(getCreatureSummons(params.ciddd)[1]) then
			setPlayerStorageValue(getCreatureSummons(params.ciddd)[1], 100, 0)
			end
		end
	addEvent(detrans, 5500, {ciddd = cid})
	doCreatureSay(getCreatureSummons(cid)[1], "ROCK SMASH!", TALKTYPE_MONSTER)
	local function nmr(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
		if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
		doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(params.cid)[1]))
		end
	end
	end
	end
	addEvent(nmr, 400, {cid = cid})
	else
	local badir = getDirectionTo(getThingPos(getCreatureSummons(cid)[1]), topos)
	if badir == NORTHWEST then
		if math.random(1,100) >= 51 then
		badir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), badir), params.ccid, 0, 0) then
			badir = NORTH
			else
			badir = WEST
			end
		else
		badir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), badir), params.ccid, 0, 0) then
			badir = WEST
			else
			badir = NORTH
			end
		end
	elseif badir == SOUTHWEST then
		if math.random(1,100) >= 51 then
		badir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), badir), params.ccid, 0, 0) then
			badir = SOUTH
			else
			badir = WEST
			end
		else
		badir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), badir), params.ccid, 0, 0) then
			badir = WEST
			else
			badir = SOUTH
			end
		end
	elseif badir == SOUTHEAST then
		if math.random(1,100) >= 51 then
		badir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), badir), params.ccid, 0, 0) then
			badir = SOUTH
			else
			badir = EAST
			end
		else
		badir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), badir), params.ccid, 0, 0) then
			badir = EAST
			else
			badir = SOUTH
			end
		end
	elseif badir == NORTHEAST then
		if math.random(1,100) >= 51 then
		badir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), badir), params.ccid, 0, 0) then
			badir = NORTH
			else
			badir = EAST
			end
		else
		badir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), badir), params.ccid, 0, 0) then
			badir = EAST
			else
			badir = NORTH
			end
		end
	end
	local badir = badir
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
	doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(params.cid)[1]))
	doPushCreature(getCreatureSummons(params.cid)[1], badir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	else
	doPushCreature(getCreatureSummons(params.cid)[1], badir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	end
	end
	end
	end
	end

doPlayerSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", smash this rock!", 1)
local speed = getCreatureBaseSpeed(getCreatureSummons(cid)[1])
local temk = 1000 -(2.3 * speed)
addEvent(tocut, 0, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = topos})
for i = 1, getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), topos) * 2 do
addEvent(tocut, temk*i, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = topos})
end
return true
end
end
-- ROCK SMASH END

-- CUT
if item2.itemid == 2767 and getPlayerStorageValue(cid, 63215) <= 0 then
if #getCreatureSummons(cid) == 0 then
doPlayerSendCancel(cid, "You need a pokemon to use cut.")
return true
end
if not isInArray(cut, getCreatureName(getCreatureSummons(cid)[1])) then
doPlayerSendCancel(cid, "This pokemon can't use cut.")
return true
end
if isInArray(cut, getCreatureName(getCreatureSummons(cid)[1])) then
	if exhaustion.get(cid, ecut) then
	doPlayerSendCancel(cid, "Please wait a few seconds before using cut again!")
	return true
	end
if getCreatureSpeed(getCreatureSummons(cid)[1]) == 0 then
return true
end
doChangeSpeed(getCreatureSummons(cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
	local function tocut(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) >= 1 then
	return true
	end
	if getPlayerStorageValue(getCreatureSummons(params.cid)[1], 101) >= 1 then
	return true
	end
	if getDistanceBetween(getThingPos(getCreatureSummons(params.cid)[1]), topos) == 1 then
	doSendMagicEffect(topos, 141)
	doTransformItem(getTileItemById(topos, 2767).uid, 6216)
	exhaustion.set(cid, ecut, cdcut)
	setPlayerStorageValue(getCreatureSummons(params.cid)[1], 101, 1)
		local function detrans(params)
		doTransformItem(getTileItemById(topos, 6216).uid, 2767)
			if isCreature(getCreatureSummons(params.ciddd)[1]) then
			setPlayerStorageValue(getCreatureSummons(params.ciddd)[1], 101, 0)
			end
		end
	addEvent(detrans, 5500, {ciddd = cid})
	doCreatureSay(getCreatureSummons(cid)[1], "CUT!", TALKTYPE_MONSTER)
	local function nmr(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
		if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
		doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(params.cid)[1]))
		end
	end
	end
	end
	addEvent(nmr, 400, {cid = cid})
	else
	adir = getDirectionTo(getThingPos(getCreatureSummons(cid)[1]), topos)
	if adir == NORTHWEST then
		if math.random(1,100) >= 51 then
		adir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), adir), params.ccid, 0, 0) then
			adir = NORTH
			else
			adir = WEST
			end
		else
		adir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), adir), params.ccid, 0, 0) then
			adir = WEST
			else
			adir = NORTH
			end
		end
	elseif adir == SOUTHWEST then
		if math.random(1,100) >= 51 then
		adir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), adir), params.ccid, 0, 0) then
			adir = SOUTH
			else
			adir = WEST
			end
		else
		adir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), adir), params.ccid, 0, 0) then
			adir = WEST
			else
			adir = SOUTH
			end
		end
	elseif adir == SOUTHEAST then
		if math.random(1,100) >= 51 then
		adir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), adir), params.ccid, 0, 0) then
			adir = SOUTH
			else
			adir = EAST
			end
		else
		adir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), adir), params.ccid, 0, 0) then
			adir = EAST
			else
			adir = SOUTH
			end
		end
	elseif adir == NORTHEAST then
		if math.random(1,100) >= 51 then
		adir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), adir), params.ccid, 0, 0) then
			adir = NORTH
			else
			adir = EAST
			end
		else
		adir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), adir), params.ccid, 0, 0) then
			adir = EAST
			else
			adir = NORTH
			end
		end
	end
	local adir = adir
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
	doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(params.cid)[1]))
	doPushCreature(getCreatureSummons(params.cid)[1], adir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	else
	doPushCreature(getCreatureSummons(params.cid)[1], adir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	end
	end
	end
	end
	end

doPlayerSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", cut this bush!", 1)
local speed = getCreatureBaseSpeed(getCreatureSummons(cid)[1])
temk = 1000 -(2.3 * speed)
addEvent(tocut, 0, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = topos})
for i = 1, getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), topos) * 2 do
addEvent(tocut, temk*i, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = topos})
end

return true
end
end
-- CUT END

-- DIG
if isInArray(digholes, item2.itemid) and getPlayerStorageValue(cid, 63215) <= 0 then
if #getCreatureSummons(cid) == 0 then
doPlayerSendCancel(cid, "You need a pokemon to use dig.")
return true
end
if not isInArray(dig, getCreatureName(getCreatureSummons(cid)[1])) then
doPlayerSendCancel(cid, "This pokemon can't use dig.")
return true
end
if isInArray(dig, getCreatureName(getCreatureSummons(cid)[1])) then
	if exhaustion.get(cid, edig) then
	doPlayerSendCancel(cid, "Please wait a few seconds before using dig again!")
	return true
	end
if getCreatureSpeed(getCreatureSummons(cid)[1]) == 0 then
return true
end
doChangeSpeed(getCreatureSummons(cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
	local function tocut(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) >= 1 then
	return true
	end
	if getPlayerStorageValue(getCreatureSummons(params.cid)[1], 99) >= 1 then
	return true
	end
	if getDistanceBetween(getThingPos(getCreatureSummons(params.cid)[1]), topos) == 1 then
	doSendMagicEffect(topos, 3)
	setPlayerStorageValue(getCreatureSummons(params.cid)[1], 99, 1)
	doTransformItem(getTileItemById(topos, item2.itemid).uid, item2.itemid+1)
	exhaustion.set(cid, edig, cddig)
		local function detrans(params)
		doTransformItem(getTileItemById(topos, item2.itemid+1).uid, item2.itemid)
			if isCreature(getCreatureSummons(params.ciddd)[1]) then
			setPlayerStorageValue(getCreatureSummons(params.ciddd)[1], 99, 0)
			end
		end
	addEvent(detrans, 5500, {ciddd = cid})
	doCreatureSay(getCreatureSummons(cid)[1], "DIG!", TALKTYPE_MONSTER)
	local function nmr(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
		if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
		doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(params.cid)[1]))
		end
	end
	end
	end
	addEvent(nmr, 400, {cid = cid})
	else
	local cdir = getDirectionTo(getThingPos(getCreatureSummons(cid)[1]), topos)
	if cdir == NORTHWEST then
		if math.random(1,100) >= 51 then
		cdir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), cdir), params.ccid, 0, 0) then
			cdir = NORTH
			else
			cdir = WEST
			end
		else
		cdir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), cdir), params.ccid, 0, 0) then
			cdir = WEST
			else
			cdir = NORTH
			end
		end
	elseif cdir == SOUTHWEST then
		if math.random(1,100) >= 51 then
		cdir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), cdir), params.ccid, 0, 0) then
			cdir = SOUTH
			else
			cdir = WEST
			end
		else
		cdir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), cdir), params.ccid, 0, 0) then
			cdir = WEST
			else
			cdir = SOUTH
			end
		end
	elseif cdir == SOUTHEAST then
		if math.random(1,100) >= 51 then
		cdir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), cdir), params.ccid, 0, 0) then
			cdir = SOUTH
			else
			cdir = EAST
			end
		else
		cdir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), cdir), params.ccid, 0, 0) then
			cdir = EAST
			else
			cdir = SOUTH
			end
		end
	elseif cdir == NORTHEAST then
		if math.random(1,100) >= 51 then
		cdir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), cdir), params.ccid, 0, 0) then
			cdir = NORTH
			else
			cdir = EAST
			end
		else
		cdir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), cdir), params.ccid, 0, 0) then
			cdir = EAST
			else
			cdir = NORTH
			end
		end
	end
	local cdir = cdir
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
	doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(params.cid)[1]))
	doPushCreature(getCreatureSummons(params.cid)[1], cdir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	else
	doPushCreature(getCreatureSummons(params.cid)[1], cdir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	end
	end
	end
	end
	end

doPlayerSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", open this hole!", 1)
local speed = getCreatureBaseSpeed(getCreatureSummons(cid)[1])
temk = 1000 -(2.3 * speed)
addEvent(tocut, 0, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = topos})
for i = 1, getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), topos) * 2 do
addEvent(tocut, temk*i, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = topos})
end
return true
end
end
-- DIG END

-- BLINK
if #getCreatureSummons(cid) == 0 and getPlayerStorageValue(cid, 63215) <= 0 and getPlayerStorageValue(cid, 17000) <= 0 then
doPlayerSendCancel(cid, "You need a pokemon to use order.")
return true
end
if not isMonster(item2.uid) and getPlayerStorageValue(cid, 63215) <= 0 and getPlayerStorageValue(cid, 17000) <= 0 then
if isInArray(blink, getCreatureName(getCreatureSummons(cid)[1])) then
if exhaustion.get(cid, exhaustblink) then
if getCreatureSpeed(getCreatureSummons(cid)[1]) == 0 then
doPlayerSendCancel(cid, "You can\'t order your pokemon to move now.")
return true
end
	doPlayerSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", move!", 1)
doChangeSpeed(getCreatureSummons(cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
setPlayerStorageValue(getCreatureSummons(cid)[1], 12, 1)
local function move(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	if getPlayerStorageValue(getCreatureSummons(params.cid)[1], 12) == 0 then
	return true
	end
		if getDistanceBetween(getThingPos(getCreatureSummons(params.cid)[1]), topos) == 0 then
			if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
				local function speeed(params)
				if isCreature(params.sum) then
				if getCreatureSpeed(params.sum) == 0 then
				doChangeSpeed(params.sum, getCreatureBaseSpeed(params.sum))
				end
				end
				end
				addEvent(speeed, 600, {sum = getCreatureSummons(params.cid)[1]})
			end
		setPlayerStorageValue(getCreatureSummons(params.cid)[1], 12, 0)
		return true
		end
	local edir = getDirectionTo(getThingPos(getCreatureSummons(cid)[1]), params.topos)
	if edir >= 0 and edir <= 7 then
	if edir == NORTHWEST then
		if math.random(1,100) >= 51 then
		edir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), edir), params.ccid, 0, 0) then
			edir = NORTH
			else
			edir = WEST
			end
		else
		edir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), edir), params.ccid, 0, 0) then
			edir = WEST
			else
			edir = NORTH
			end
		end
	elseif edir == SOUTHWEST then
		if math.random(1,100) >= 51 then
		edir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), edir), params.ccid, 0, 0) then
			edir = SOUTH
			else
			edir = WEST
			end
		else
		edir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), edir), params.ccid, 0, 0) then
			edir = WEST
			else
			edir = SOUTH
			end
		end
	elseif edir == SOUTHEAST then
		if math.random(1,100) >= 51 then
		edir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), edir), params.ccid, 0, 0) then
			edir = SOUTH
			else
			edir = EAST
			end
		else
		edir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), edir), params.ccid, 0, 0) then
			edir = EAST
			else
			edir = SOUTH
			end
		end
	elseif edir == NORTHEAST then
		if math.random(1,100) >= 51 then
		edir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), edir), params.ccid, 0, 0) then
			edir = NORTH
			else
			edir = EAST
			end
		else
		edir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), edir), params.ccid, 0, 0) then
			edir = EAST
			else
			edir = NORTH
			end
		end
	end
	local edir = edir
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
	doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(params.cid)[1]))
	doPushCreature(getCreatureSummons(params.cid)[1], edir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	else
	doPushCreature(getCreatureSummons(params.cid)[1], edir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	end
	end
	end
end
end

local function voltarnormal(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
				if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
				local function speeed(params)
				if isCreature(params.sum) then
				doChangeSpeed(params.sum, getCreatureBaseSpeed(params.sum))
				end
				end
				addEvent(speeed, 0, {sum = getCreatureSummons(params.cid)[1]})
			end
		setPlayerStorageValue(getCreatureSummons(params.cid)[1], 12, 0)
	end
	end
end

local pois = getThingPos(item2.uid)
local speed = getCreatureBaseSpeed(getCreatureSummons(cid)[1])
local temk = 1000 -(2.3 * speed)
local SumPos = getThingPos(getCreatureSummons(cid)[1])
local travelx = math.abs((topos.x) - (SumPos.x))
local travely = math.abs((topos.y) - (SumPos.y))
local travel = ((travelx) + (travely))
addEvent(move, 0, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = pois, item2 = item2.uid})
for i = 1, travel do
addEvent(move, temk*i, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = pois, item2 = item2.uid})
end
addEvent(voltarnormal, temk * travel, {cid = cid})
exhaustion.set(cid, etudao, travel)
else
if not isWalkable(topos, cid, 0, 0) then
doPlayerSendCancel(cid, "Your pokemon cannot teleport there.")
return true
end
if getItemName(item2.uid) == "shallow water" then
doPlayerSendCancel(cid, "Your pokemon cannot teleport there.")
return true
end
doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), topos, 39)
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 211)
doTeleportThing(getCreatureSummons(cid)[1], topos, false)
doSendMagicEffect(topos, 134)
doPlayerSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", teleport there!", 1)
doCreatureSay(getCreatureSummons(cid)[1], "BLINK!", TALKTYPE_MONSTER)
exhaustion.set(cid, exhaustblink, cdblink)
return true
end
return true
end
end
--- BLINK END

-- LIGHT --
if isCreature(item2.uid) and getCreatureMaster(item2.uid) == cid and getPlayerStorageValue(cid, 63215) <= 0 and getPlayerStorageValue(cid, 17000) <= 0 and item2.uid ~= cid then
if not isInArray(light, getCreatureName(getCreatureSummons(cid)[1])) then
doPlayerSendCancel(cid, "This pokemon can't use flash.")
return true
end
if isInArray(light, getCreatureName(getCreatureSummons(cid)[1])) then
        if not isMonster(item2.uid) and getCreatureMaster(item2.uid) ~= cid then
        return doPlayerSendCancel(cid,"Please use flash on your pokemon.")
        end
        if exhaustion.get(cid, exhautStorage) then
        doPlayerSendCancel(cid,"Please wait a few seconds before using flash again!")
        return true
        end
exhaustion.set(cid, exhautStorage, cd)
doPlayerSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use flash!", 1)
doCreatureSay(getCreatureSummons(cid)[1], "FLASH!", TALKTYPE_MONSTER)
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 28)
doSetCreatureLight(getCreatureSummons(cid)[1], 8, 215, time*1000)
return true
end
end
-- LIGHT END --
if #getCreatureSummons(cid) == 0 then
return true
end
if getCreatureSpeed(getCreatureSummons(cid)[1]) == 0 then
doPlayerSendCancel(cid, "You can\'t order your pokemon to move now.")
return true
end
if getPlayerStorageValue(getCreatureSummons(cid)[1], 12) == 1 then
doPlayerSendCancel(cid, "You can\'t order your pokemon to move now.")
return true
end
	doPlayerSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", move!", 1)
doChangeSpeed(getCreatureSummons(cid)[1], -getCreatureSpeed(getCreatureSummons(cid)[1]))
setPlayerStorageValue(getCreatureSummons(cid)[1], 12, 1)
local function move(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	if getPlayerStorageValue(getCreatureSummons(params.cid)[1], 12) == 0 then
	return true
	end
		if getDistanceBetween(getThingPos(getCreatureSummons(params.cid)[1]), topos) == 0 then
			if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
				local function speeed(params)
				if isCreature(params.sum) then
				if getCreatureSpeed(params.sum) == 0 then
				doChangeSpeed(params.sum, getCreatureBaseSpeed(params.sum))
				end
				end
				end
				addEvent(speeed, 600, {sum = getCreatureSummons(params.cid)[1]})
			end
		setPlayerStorageValue(getCreatureSummons(params.cid)[1], 12, 0)
		setPlayerStorageValue(cid, etudao, -1)
		return true
		end
	local dir = getDirectionTo(getThingPos(getCreatureSummons(cid)[1]), params.topos)
	if dir >= 0 and dir <= 7 then
	if dir == NORTHWEST then
		if math.random(1,100) >= 51 then
		dir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), dir), params.ccid, 0, 0) then
			dir = NORTH
			else
			dir = WEST
			end
		else
		dir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), dir), params.ccid, 0, 0) then
			dir = WEST
			else
			dir = NORTH
			end
		end
	elseif dir == SOUTHWEST then
		if math.random(1,100) >= 51 then
		dir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), dir), params.ccid, 0, 0) then
			dir = SOUTH
			else
			dir = WEST
			end
		else
		dir = WEST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), dir), params.ccid, 0, 0) then
			dir = WEST
			else
			dir = SOUTH
			end
		end
	elseif dir == SOUTHEAST then
		if math.random(1,100) >= 51 then
		dir = SOUTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), dir), params.ccid, 0, 0) then
			dir = SOUTH
			else
			dir = EAST
			end
		else
		dir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), dir), params.ccid, 0, 0) then
			dir = EAST
			else
			dir = SOUTH
			end
		end
	elseif dir == NORTHEAST then
		if math.random(1,100) >= 51 then
		dir = NORTH
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), dir), params.ccid, 0, 0) then
			dir = NORTH
			else
			dir = EAST
			end
		else
		dir = EAST
			if isWalkable(getPosByDir(getThingPos(getCreatureSummons(params.cid)[1]), dir), params.ccid, 0, 0) then
			dir = EAST
			else
			dir = NORTH
			end
		end
	end
	local dir = dir
	if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
	doChangeSpeed(getCreatureSummons(params.cid)[1], getCreatureBaseSpeed(getCreatureSummons(params.cid)[1]))
	doPushCreature(getCreatureSummons(params.cid)[1], dir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	else
	doPushCreature(getCreatureSummons(params.cid)[1], dir, 1, 0)
	doChangeSpeed(getCreatureSummons(params.cid)[1], -getCreatureSpeed(getCreatureSummons(params.cid)[1]))
	end
	end
	end
end
end

local function voltarnormal(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureSummons(params.cid)[1]) then
	setPlayerStorageValue(cid, etudao, -1)
		if getCreatureSpeed(getCreatureSummons(params.cid)[1]) == 0 then
				local function speeed(params)
				if isCreature(params.sum) then
				if getCreatureSpeed(params.sum) == 0 then
				doChangeSpeed(params.sum, getCreatureBaseSpeed(params.sum))
				end
				end
				end
		addEvent(speeed, 0, {sum = getCreatureSummons(params.cid)[1]})
			end
		setPlayerStorageValue(getCreatureSummons(params.cid)[1], 12, 0)
	end
	end
end

local pois = getThingPos(item2.uid)
local speed = getCreatureBaseSpeed(getCreatureSummons(cid)[1])
local temk = 1000 -(2.3 * speed)
local SummonPos = getThingPos(getCreatureSummons(cid)[1])
local travelx = math.abs((topos.x) - (SummonPos.x))
local travely = math.abs((topos.y) - (SummonPos.y))
local travel = ((travelx) + (travely))
addEvent(move, 0, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = pois, item2 = item2.uid})
for i = 1, travel-1 do
addEvent(move, temk*i, {cid = cid, ccid = getCreatureSummons(cid)[1], topos = pois, item2 = item2.uid})
end
addEvent(voltarnormal, temk*travel, {cid = cid})
exhaustion.set(cid, etudao, travel)
return true
end
