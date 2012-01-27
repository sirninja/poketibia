local poke = {'Poliwag', 'Poliwhirl', 'Seaking', 'Dewgong',  'Blastoise', 'Shiny Blastoise', 'Tentacruel', 'Shiny Tentacruel', 'Lapras', 'Gyarados', 'Shiny Gyarados', 'Omastar', 'Kabutops', 'Vaporeon', 'Shiny Vaporeon', 'Staryu', 'Starmie', 'Goldeen', 'Seadra','Shiny Seadra', 'Golduck', 'Squirtle', 'Wartortle', 'Tentacool', 'Shiny Tentacool', 'Snorlax', 'Poliwrath', 'Wooper', 'Quagsire', 'Kingdra', 'Totodile', 'Croconaw', 'Feraligatr', 'Octillery'}

local flie = {'4608','4609','4610','4611','4612','4613','4614','4615','4616','4617','4618','4619','4620','4621','4622','4623','4624','4625','4820', '4821', '4822', '4823', '4824', '4825'}

local surf = {
["Poliwag"] = {lookType=278, speed = 320},
["Poliwhirl"] = {lookType=137, speed = 480},
["Seaking"] = {lookType=269, speed = 520},
["Dewgong"] = {lookType=183, speed = 700},
["Blastoise"] = {lookType=184, speed = 850},
["Shiny Blastoise"] = {lookType=523, speed = 1050},
["Tentacruel"] = {lookType=185, speed = 750},
["Shiny Tentacruel"] = {lookType=490, speed = 1050},
["Lapras"] = {lookType=186, speed = 960},
["Gyarados"] = {lookType=187, speed = 1050},
["Omastar"] = {lookType=188, speed = 680},
["Kabutops"] = {lookType=189, speed = 840},
["Poliwrath"] = {lookType=190, speed = 680},
["Vaporeon"] = {lookType=191, speed = 800},
["Shiny Vaporeon"] = {lookType=598, speed = 1050},
["Staryu"] = {lookType=266, speed = 385},
["Starmie"] = {lookType=267, speed = 685},
["Goldeen"] = {lookType=268, speed = 355},
["Seadra"] = {lookType=270, speed = 655},
["Shiny Seadra"] = {lookType=522, speed = 1050},
["Golduck"] = {lookType=271, speed = 760},
["Squirtle"] = {lookType=273, speed = 365},
["Mantine"] = {lookType=449, speed = 800},
["Wartortle"] = {lookType=275, speed = 605},
["Tentacool"] = {lookType=277, speed = 340},
["Shiny Tentacool"] = {lookType=503, speed = 600},
["Snorlax"] = {lookType=300, speed = 500},
["Shiny Gyarados"] = {lookType=529, speed = 1500},
["Totodile"] = {lookType=450, speed = 500},
["Croconaw"] = {lookType=451, speed = 750},
["Feraligatr"] = {lookType=458, speed = 900},
["Wooper"] = {lookType=453, speed = 400},
["Marill"] = {lookType=452, speed = 500},
["Azumarill"] = {lookType=455, speed = 700},
["Octillery"] = {lookType=454, speed = 500},
["Quagsire"] = {lookType=456, speed = 700},
["Kingdra"] = {lookType=457, speed = 1000},
}

function onStepIn(cid, item, position, fromPosition)
if isPlayer(cid) and not isVip(cid) then -- tire o primeiro not, atras do isPlayer para ativar o premium
doTeleportThing(cid, fromPosition, false)
doPlayerSendCancel(cid, "Only vip members are allowed to surf.")
return true
end
if getCreatureOutfit(cid).lookType == 316 then
doSendMagicEffect(fromPosition, 136)
end
if not isPlayer(cid) then
doTeleportThing(cid, fromPosition, false)
return true
end

if getPlayerStorageValue(cid, 63215) ~= 1 and getPlayerStorageValue(cid, 17000) <= 0 then
	if #getCreatureSummons(cid) == 0 then
	doPlayerSendCancel(cid, "You need a pokemon to surf.")
	doTeleportThing(cid, fromPosition, false)
	else
	if (not isInArray(poke, getCreatureName(getCreatureSummons(cid)[1]))) then
	doPlayerSendCancel(cid, "This pokemon cannot surf.")
	doTeleportThing(cid, fromPosition, false)
	return true
	end
	end
end
if #getCreatureSummons(cid) >= 1 and isInArray(poke, getCreatureName(getCreatureSummons(cid)[1])) and getPlayerStorageValue(cid, 63215) ~= 1 and getPlayerStorageValue(cid, 17000) <= 0 then
doSetCreatureOutfit(cid, surf[getCreatureName(getCreatureSummons(cid)[1])], -1)
doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", lets surf!", 1)
doChangeSpeed(cid, -(getCreatureSpeed(cid)))
doChangeSpeed(cid, surf[getCreatureName(getCreatureSummons(cid)[1])].speed)
setPlayerStorageValue(cid, 61209, getCreatureMaxHealth(getCreatureSummons(cid)[1]))
setPlayerStorageValue(cid, 61210, getCreatureHealth(getCreatureSummons(cid)[1]))
doRemoveCreature(getCreatureSummons(cid)[1])
addEvent(setPlayerStorageValue, 100, cid, 63215, 1)
end
if getPlayerStorageValue(cid, 63215) == 1 then
if getCreatureLookDir(cid) == 0 then
doSendMagicEffect(fromPosition, 33)
elseif getCreatureLookDir(cid) == 1 then
doSendMagicEffect(fromPosition, 49)
elseif getCreatureLookDir(cid) == 2 then
doSendMagicEffect(fromPosition, 30)
elseif getCreatureLookDir(cid) == 3 then
doSendMagicEffect(fromPosition, 51)
end
end
if getPlayerStorageValue(cid, 17000) >= 1 then
if not isInArray(flie, getTileInfo(fromPosition).itemid) then
return true
end
if getCreatureLookDir(cid) == 0 then
doSendMagicEffect(fromPosition, 33)
elseif getCreatureLookDir(cid) == 1 then
doSendMagicEffect(fromPosition, 49)
elseif getCreatureLookDir(cid) == 2 then
doSendMagicEffect(fromPosition, 30)
elseif getCreatureLookDir(cid) == 3 then
doSendMagicEffect(fromPosition, 51)
end
end
return true
end

function onStepOut(cid, item, position, fromPosition)
if not isInArray({4820, 4821, 4822, 4823, 4824, 4825}, getTileThingByPos(getThingPos(cid)).itemid) then
setPlayerGroupId(cid, 8)
end
return true
end