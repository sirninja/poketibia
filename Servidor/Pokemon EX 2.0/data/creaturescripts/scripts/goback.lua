local pokes = {
["Bulbasaur"] = {level = 20, cons = 43, vida = 1200},
["Ivysaur"] = {level = 40, cons = 86, vida = 2600},
["Venusaur"] = {level = 85, cons = 189, vida = 5200},
["Charmander"] = {level = 20, cons = 30, vida = 970},
["Charmeleon"] = {level = 40, cons = 70, vida = 2900},
["Charizard"] = {level = 85, cons = 140, vida = 5200},
["Squirtle"] = {level = 20, cons = 47, vida = 1350},
["Wartortle"] = {level = 40, cons = 93, vida = 2800},
["Blastoise"] = {level = 85, cons = 194, vida = 5900},
["Caterpie"] = {level = 1, cons = 13, vida = 300},
["Metapod"] = {level = 10, cons = 30, vida = 1100},
["Butterfree"] = {level = 30, cons = 56, vida = 2000},
["Weedle"] = {level = 1, cons = 16, vida = 325},
["Kakuna"] = {level = 10, cons = 32, vida = 900},
["Beedrill"] = {level = 30, cons = 64, vida = 1900},
["Pidgey"] = {level = 1, cons = 22, vida = 380},
["Pidgeotto"] = {level = 20, cons = 47, vida = 1400},
["Pidgeot"] = {level = 65, cons = 101, vida = 3800},
["Rattata"] = {level = 1, cons = 19, vida = 350},
["ShinyRattata"] = {level = 10, cons = 28, vida = 900},
["Raticate"] = {level = 20, cons = 68, vida = 900},
["Spearow"] = {level = 5, cons = 22, vida = 450},
["Fearow"] = {level = 50, cons = 95, vida = 3300},
["Ekans"] = {level = 12, cons = 27, vida = 600},
["Arbok"] = {level = 30, cons = 87, vida = 2900},
["Pikachu"] = {level = 20, cons = 32, vida = 900},
["Raichu"] = {level = 50, cons = 99, vida = 3200},
["Sandshrew"] = {level = 18, cons = 30, vida = 700},
["Sandslash"] = {level = 55, cons = 96, vida = 3400},
["Nidoran Female"] = {level = 10, cons = 27, vida = 600},
["Nidorina"] = {level = 25, cons = 58, vida = 2000},
["Nidoqueen"] = {level = 65, cons = 146, vida = 4200},
["Nidoran Male"] = {level = 10, cons = 34, vida = 650},
["Nidorino"] = {level = 25, cons = 74, vida = 2500},
["Nidoking"] = {level = 65, cons = 169, vida = 4800},
["Clefairy"] = {level = 10, cons = 30, vida = 600},
["Clefable"] = {level = 35, cons = 90, vida = 2400},
["Vulpix"] = {level = 20, cons = 32, vida = 680},
["Ninetales"] = {level = 65, cons = 121, vida = 3400},
["Jigglypuff"] = {level = 10, cons = 30, vida = 550},
["Wigglytuff"] = {level = 42, cons = 95, vida = 2900},
["Zubat"] = {level = 5, cons = 28, vida = 450},
["Golbat"] = {level = 30, cons = 70, vida = 1900},
["Oddish"] = {level = 5, cons = 21, vida = 340},
["Gloom"] = {level = 18, cons = 51, vida = 1400},
["Vileplume"] = {level = 50, cons = 96, vida = 3300},
["Paras"] = {level = 1, cons = 40, vida = 850},
["Parasect"] = {level = 50, cons = 110, vida = 3800},
["Venonat"] = {level = 18, cons = 50, vida = 1350},
["Venomoth"] = {level = 50, cons = 125, vida = 3850},
["Diglett"] = {level = 5, cons = 45, vida = 900},
["Dugtrio"] = {level = 35, cons = 110, vida = 3500},
["Meowth"] = {level = 12, cons = 52, vida = 950},
["Persian"] = {level = 25, cons = 85, vida = 2250},
["Psyduck"] = {level = 12, cons = 50, vida = 950},
["Golduck"] = {level = 55, cons = 150, vida = 4000},
["Mankey"] = {level = 10, cons = 60, vida = 1050},
["Primeape"] = {level = 45, cons = 155, vida = 4500},
["Growlithe"] = {level = 20, cons = 60, vida = 1000},
["Arcanine"] = {level = 80, cons = 170, vida = 6800},
["Poliwag"] = {level = 5, cons = 20, vida = 400},
["Poliwhirl"] = {level = 20, cons = 44, vida = 1200},
["Poliwrath"] = {level = 65, cons = 138, vida = 4400},
["Abra"] = {level = 15, cons = 20, vida = 620},
["Kadabra"] = {level = 50, cons = 57, vida = 2500},
["Alakazam"] = {level = 80, cons = 94, vida = 4000},
["Machop"] = {level = 18, cons = 60, vida = 1100},
["Machoke"] = {level = 40, cons = 110, vida = 3500},
["Machamp"] = {level = 65, cons = 185, vida = 7500},
["Bellsprout"] = {level = 5, cons = 24, vida = 420},
["Weepinbell"] = {level = 18, cons = 49, vida = 1100},
["Victreebel"] = {level = 50, cons = 117, vida = 4000},
["Tentacool"] = {level = 12, cons = 52, vida = 1050},
["Tentacruel"] = {level = 70, cons = 165, vida = 7050},
["Geodude"] = {level = 15, cons = 30, vida = 700},
["Graveler"] = {level = 40, cons = 82, vida = 3000},
["Golem"] = {level = 70, cons = 111, vida = 6500},
["Ponyta"] = {level = 20, cons = 60, vida = 1400},
["Rapidash"] = {level = 60, cons = 160, vida = 5500},
["Slowpoke"] = {level = 12, cons = 55, vida = 1200},
["Slowbro"] = {level = 45, cons = 110, vida = 4600},
["Magnemite"] = {level = 15, cons = 27, vida = 450},
["Magneton"] = {level = 40, cons = 67, vida = 1750},
["Farfetchd"] = {level = 40, cons = 95, vida = 3000},
["Doduo"] = {level = 12, cons = 31, vida = 600},
["Dodrio"] = {level = 45, cons = 78, vida = 2650},
["Seel"] = {level = 20, cons = 50, vida = 1000},
["Dewgong"] = {level = 65, cons = 135, vida = 5200},
["Grimer"] = {level = 12, cons = 30, vida = 600},
["Muk"] = {level = 30, cons = 85, vida = 2400},
["Shellder"] = {level = 5, cons = 45, vida = 800},
["Cloyster"] = {level = 65, cons = 155, vida = 5000},
["Gastly"] = {level = 18, cons = 50, vida = 1000},
["Haunter"] = {level = 45, cons = 105, vida = 3000},
["Gengar"] = {level = 80, cons = 175, vida = 7000},
["Onix"] = {level = 50, cons = 150, vida = 5300},
["Drowzee"] = {level = 22, cons = 58, vida = 1150},
["Hypno"] = {level = 50, cons = 100, vida = 4600},
["Krabby"] = {level = 5, cons = 45, vida = 850},
["Kingler"] = {level = 35, cons = 100, vida = 3250},
["Voltorb"] = {level = 14, cons = 30, vida = 620},
["Electrode"] = {level = 38, cons = 76, vida = 2000},
["Exeggcute"] = {level = 8, cons = 42, vida = 800},
["Exeggutor"] = {level = 48, cons = 98, vida = 4000},
["Cubone"] = {level = 18, cons = 58, vida = 1200},
["Marowak"] = {level = 45, cons = 105, vida = 3900},
["Hitmonlee"] = {level = 60, cons = 205, vida = 9250},
["Hitmonchan"] = {level = 60, cons = 200, vida = 10500},
["Lickitung"] = {level = 45, cons = 100, vida = 4800},
["Koffing"] = {level = 15, cons = 60, vida = 900},
["Weezing"] = {level = 30, cons = 100, vida = 2800},
["Rhyhorn"] = {level = 35, cons = 80, vida = 3800},
["Rhydon"] = {level = 65, cons = 175, vida = 7000},
["Chansey"] = {level = 60, cons = 130, vida = 7500},
["Tangela"] = {level = 40, cons = 85, vida = 3500},
["Kangaskhan"] = {level = 60, cons = 160, vida = 7000},
["Horsea"] = {level = 5, cons = 19, vida = 300},
["Seadra"] = {level = 45, cons = 68, vida = 2500},
["Goldeen"] = {level = 10, cons = 50, vida = 950},
["Seaking"] = {level = 25, cons = 80, vida = 2000},
["Staryu"] = {level = 15, cons = 55, vida = 1050},
["Starmie"] = {level = 45, cons = 95, vida = 3800},
["Mr.mime"] = {level = 60, cons = 110, vida = 5500},
["Scyther"] = {level = 70, cons = 145, vida = 6500},
["Jynx"] = {level = 65, cons = 125, vida = 6000},
["Electabuzz"] = {level = 70, cons = 150, vida = 6800},
["Magmar"] = {level = 70, cons = 160, vida = 7200},
["Pinsir"] = {level = 42, cons = 95, vida = 4000},
["Tauros"] = {level = 40, cons = 100, vida = 4200},
["Magikarp"] = {level = 1, cons = 5, vida = 120},
["ShinyMagikarp"] = {level = 10, cons = 30, vida = 240},
["Gyarados"] = {level = 75, cons = 195, vida = 7800},
["Lapras"] = {level = 70, cons = 140, vida = 7000},
["Ditto"] = {level = 40, cons = 100, vida = 4000},
["Eevee"] = {level = 20, cons = 55, vida = 1500},
["Vaporeon"] = {level = 55, cons = 110, vida = 4500},
["Jolteon"] = {level = 55, cons = 110, vida = 4500},
["Flareon"] = {level = 55, cons = 110, vida = 4500},
["Porygon"] = {level = 45, cons = 10, vida = 100},
["Omanyte"] = {level = 20, cons = 55, vida = 1300},
["Omastar"] = {level = 70, cons = 140, vida = 6000},
["Kabuto"] = {level = 20, cons = 55, vida = 1300},
["Kabutops"] = {level = 70, cons = 150, vida = 6500},
["Aerodactyl"] = {level = 100, cons = 190, vida = 8000},
["Snorlax"] = {level = 85, cons = 200, vida = 9500},
["Articuno"] = {level = 120, cons = 200, vida = 11000},
["Zapdos"] = {level = 120, cons = 200, vida = 11000},
["Moltres"] = {level = 120, cons = 200, vida = 11000},
["Dratini"] = {level = 10, cons = 55, vida = 1200},
["Dragonair"] = {level = 70, cons = 165, vida = 5600},
["Dragonite"] = {level = 100, cons = 250, vida = 10800},
["Mewtwo"] = {level = 100, cons = 175, vida = 8500},
["Mew"] = {level = 100, cons = 125, vida = 7200},
["Shiny Charizard"] = {level = 100, cons = 280, vida = 7200},
["Shiny Paras"] = {level = 15, cons = 120, vida = 1400},
["Shiny Oddish"] = {level = 15, cons = 65, vida = 990},
["Shiny Zubat"] = {level = 15, cons = 85, vida = 1200},
["Shiny Tentacool"] = {level = 20, cons = 140, vida = 1000},
["Shiny Tentacruel"] = {level = 100, cons = 140, vida = 1000},
["Shiny Raticate"] = {level = 35, cons = 140, vida = 1000},
["Shiny Krabby"] = {level = 20, cons = 140, vida = 1000},
["Shiny Kingler"] = {level = 50, cons = 140, vida = 1000},
["Shiny Horsea"] = {level = 15, cons = 140, vida = 1000},
["Shiny Seadra"] = {level = 60, cons = 140, vida = 1000},
["Shiny Gyarados"] = {level = 120, cons = 200, vida = 18000},
["Shiny Parasect"] = {level = 60, cons = 140, vida = 1000},
["Shiny Scyther"] = {level = 100, cons = 140, vida = 1000},
["Shiny Electabuzz"] = {level = 100, cons = 140, vida = 1000},
["Shiny Jynx"] = {level = 80, cons = 140, vida = 1000},
["Shiny Electrode"] = {level = 50, cons = 140, vida = 1000},
["Shiny Voltorb"] = {level = 25, cons = 140, vida = 1000},
["Shiny Raichu"] = {level = 70, cons = 140, vida = 1000},
["Shiny Venonat"] = {level = 25, cons = 140, vida = 1000},
["Shiny Venomoth"] = {level = 60, cons = 140, vida = 1000},
["Shiny Beedril"] = {level = 35, cons = 140, vida = 1000},
["Shiny Butterfree"] = {level = 40, cons = 140, vida = 1000},
["Shiny Venusaur"] = {level = 100, cons = 140, vida = 1000},
["Shiny Blastoise"] = {level = 100, cons = 140, vida = 1000},
["Shiny Farfetchd"] = {level = 50, cons = 140, vida = 1000},
["Shiny Grimer"] = {level = 20, cons = 140, vida = 1000},
["Shiny Muk"] = {level = 50, cons = 140, vida = 1000},
["Shiny Growlithe"] = {level = 30, cons = 140, vida = 1000},
["Shiny Arcanine"] = {level = 100, cons = 140, vida = 1000},
["Shiny Dratini"] = {level = 35, cons = 140, vida = 1000},
["Shiny Abra"] = {level = 50, cons = 140, vida = 1000},
["Elite Hitmonlee"] = {level = 100, cons = 250, vida = 16500},
["Elite Hitmonchan"] = {level = 100, cons = 240, vida = 17500},
["Aipom"] = {level = 40, cons = 140, vida = 1300},
["Ampharos"] = {level = 80, cons = 140, vida = 7000},
["Ariados"] = {level = 80, cons = 40, vida = 4000},
["Azumarill"] = {level = 80, cons = 140, vida = 2600},
["Bayleef"] = {level = 60, cons = 140, vida = 3000},
["Bellossom"] = {level = 80, cons = 140, vida = 3900},
["Blissey"] = {level = 80, cons = 140, vida = 6000},
["Celebi"] = {level = 80, cons = 140, vida = 80000},
["Chikorita"] = {level = 80, cons = 140, vida = 1500},
["Chinchou"] = {level = 80, cons = 140, vida = 600},
["Cleffa"] = {level = 40, cons = 140, vida = 500},
["Corsola"] = {level = 80, cons = 140, vida = 4000},
["Crobat"] = {level = 80, cons = 140, vida = 3900},
["Croconaw"] = {level = 80, cons = 140, vida = 3500},
["Cyndaquil"] = {level = 50, cons = 140, vida = 1500},
["Delibird"] = {level = 60, cons = 140, vida = 1300},
["Donphan"] = {level = 80, cons = 140, vida = 7000},
["Dunsparce"] = {level = 20, cons = 140, vida = 3000},
["Elekid"] = {level = 80, cons = 140, vida = 1400},
["Entei"] = {level = 100, cons = 140, vida = 85000},
["Espeon"] = {level = 100, cons = 140, vida = 9000},
["Feraligatr"] = {level = 80, cons = 140, vida = 8400},
["Flaafy"] = {level = 60, cons = 140, vida = 3500},
["Forretress"] = {level = 100, cons = 140, vida = 4000},
["Furret"] = {level = 40, cons = 140, vida = 600},
["Girafarig"] = {level = 100, cons = 140, vida = 1000},
["Granbull"] = {level = 100, cons = 140, vida = 2500},
["Gligar"] = {level = 100, cons = 140, vida = 4000},
["Heracross"] = {level = 80, cons = 140, vida = 4200},
["Hitmontop"] = {level = 80, cons = 140, vida = 1000},
["Ho-oh"] = {level = 80, cons = 140, vida = 140000},
["Hoothoot"] = {level = 80, cons = 140, vida = 500},
["Hoppip"] = {level = 80, cons = 140, vida = 350},
["Houndoom"] = {level = 80, cons = 140, vida = 8500},
["Houndour"] = {level = 80, cons = 140, vida = 800},
["Igglybuff"] = {level = 80, cons = 140, vida = 1500},
["Jumpluff"] = {level = 80, cons = 140, vida = 1200},
["Kingdra"] = {level = 100, cons = 140, vida = 6000},
["Lanturn"] = {level = 80, cons = 140, vida = 3000},
["Larvitar"] = {level = 80, cons = 140, vida = 1200},
["Ledian"] = {level = 80, cons = 140, vida = 2500},
["Ledyba"] = {level = 80, cons = 140, vida = 1000},
["Lugia"] = {level = 80, cons = 140, vida = 120000},
["Magby"] = {level = 80, cons = 140, vida = 700},
["Magcargo"] = {level = 80, cons = 140, vida = 7000},
["Mantine"] = {level = 80, cons = 140, vida = 1500},
["Mareep"] = {level = 100, cons = 140, vida = 800},
["Marill"] = {level = 80, cons = 140, vida = 1000},
["Meganium"] = {level = 80, cons = 140, vida = 7000},
["Miltank"] = {level = 80, cons = 140, vida = 4000},
["Misdreavous"] = {level = 80, cons = 140, vida = 1200},
["Murkrow"] = {level = 80, cons = 140, vida = 1500},
["Natu"] = {level = 100, cons = 140, vida = 4200},
["Noctowl"] = {level = 80, cons = 140, vida = 3500},
["Octillery"] = {level = 80, cons = 140, vida = 4000},
["Phanpy"] = {level = 80, cons = 140, vida = 3700},
["Pichu"] = {level = 80, cons = 140, vida = 1400},
["Piloswine"] = {level = 80, cons = 140, vida = 6000},
["Pineco"] = {level = 100, cons = 140, vida = 700},
["Politoed"] = {level = 80, cons = 140, vida = 6500},
["Porygon2"] = {level = 80, cons = 140, vida = 5000},
["Pupitar"] = {level = 80, cons = 140, vida = 2500},
["Quagsire"] = {level = 80, cons = 140, vida = 3500},
["Quilava"] = {level = 100, cons = 140, vida = 4000},
["Qwilfish"] = {level = 100, cons = 140, vida = 700},
["Raikou"] = {level = 80, cons = 140, vida = 95000},
["Remoraid"] = {level = 80, cons = 140, vida = 900},
["Scizor"] = {level = 80, cons = 140, vida = 7000},
["Sentret"] = {level = 80, cons = 140, vida = 400},
["Shuckle"] = {level = 80, cons = 140, vida = 2000},
["Skarmory"] = {level = 80, cons = 140, vida = 6200},
["Skiploom"] = {level = 80, cons = 140, vida = 1600},
["Slowking"] = {level = 80, cons = 140, vida = 8000},
["Slugma"] = {level = 80, cons = 140, vida = 900},
["Smeargle"] = {level = 80, cons = 140, vida = 3300},
["Smoochum"] = {level = 80, cons = 140, vida = 700},
["Sneasel"] = {level = 80, cons = 140, vida = 4500},
["Snubbull"] = {level = 80, cons = 140, vida = 1500},
["Spinarak"] = {level = 80, cons = 140, vida = 500},
["Stantler"] = {level = 80, cons = 140, vida = 3400},
["Steelix"] = {level = 80, cons = 140, vida = 8000},
["Sudowoodo"] = {level = 80, cons = 140, vida = 3900},
["Suicune"] = {level = 80, cons = 140, vida = 95000},
["Sunflora"] = {level = 100, cons = 140, vida = 3000},
["Sunkern"] = {level = 80, cons = 140, vida = 500},
["Swinub"] = {level = 80, cons = 140, vida = 1400},
["Teddiursa"] = {level = 80, cons = 140, vida = 1400},
["Togepi"] = {level = 80, cons = 140, vida = 400},
["Togetic"] = {level = 80, cons = 140, vida = 4000},
["Totodile"] = {level = 80, cons = 140, vida = 1400},
["Typhlosion"] = {level = 80, cons = 140, vida = 4500},
["Tyranitar"] = {level = 80, cons = 140, vida = 9500},
["Tyrogue"] = {level = 80, cons = 140, vida = 2400},
["Umbreon"] = {level = 80, cons = 140, vida = 8400},
["Unown a"] = {level = 80, cons = 140, vida = 900},
["Ursaring"] = {level = 80, cons = 140, vida = 10000},
["Wobbuffet"] = {level = 80, cons = 140, vida = 2500},
["Wopper"] = {level = 80, cons = 140, vida = 1000},
["Xatu"] = {level = 80, cons = 140, vida = 4500},
["Yanma"] = {level = 80, cons = 140, vida = 2000},
}

function onLogout(cid)
if getPlayerStorageValue(cid, 888) >= 1 then
doPlayerSendCancel(cid, "You cant logout during control mind.")
return false
end
if #getCreatureSummons(cid) == 1 then
if getPlayerStorageValue(cid, 61204) >= 1 and getPlayerStorageValue(cid, 63215) <= 0 and getPlayerStorageValue(cid, 62314) <= 0 then
local summom = getCreatureSummons(cid)
local maxh = (pokes[getCreatureName(summom[1])].vida)
local pct2 = ((getCreatureHealth(summom[1])) / (getCreatureMaxHealth(summom[1])))
local vids = ((getCreatureHealth(summom[1])) - 2)
doCreatureAddHealth(summom[1], -vids)
setCreatureMaxHealth(summom[1], maxh)
doCreatureAddHealth(summom[1], ((maxh) * (pct2)))
local health = getCreatureHealth(summom[1])
local maxhealth = getCreatureMaxHealth(summom[1])
setPlayerStorageValue(cid, 61205, health)
setPlayerStorageValue(cid, 61206, maxhealth)
setPlayerStorageValue(cid, 61204, 0)
setPlayerStorageValue(cid, 61207, 1)
setPlayerStorageValue(cid, 1, 0)
if getPlayerGroupId(cid) == 8 then
setPlayerGroupId(cid, 1)
end
end
end
return TRUE
end

function onPrepareDeath(cid, deathList)

local owner = getCreatureMaster(cid)
if getPlayerSlotItem(owner, 8).itemid == 2220 or getPlayerSlotItem(owner, 8).itemid == 2221 then
doSendMagicEffect(getCreaturePosition(cid), 192)
elseif getPlayerSlotItem(owner, 8).itemid == 2651 or getPlayerSlotItem(owner, 8).itemid == 2652 then
doSendMagicEffect(getCreaturePosition(cid), 190)
elseif getPlayerSlotItem(owner, 8).itemid == 2653 or getPlayerSlotItem(owner, 8).itemid == 2654 then
doSendMagicEffect(getCreaturePosition(cid), 191)
elseif getPlayerSlotItem(owner, 8).itemid == 2655 or getPlayerSlotItem(owner, 8).itemid == 2656 then
doSendMagicEffect(getCreaturePosition(cid), 196)
elseif getPlayerSlotItem(owner, 8).itemid == 2222 or getPlayerSlotItem(owner, 8).itemid == 2223 then
doSendMagicEffect(getCreaturePosition(cid), 189)
elseif getPlayerSlotItem(owner, 8).itemid == 2218 or getPlayerSlotItem(owner, 8).itemid == 2216 then
doSendMagicEffect(getCreaturePosition(cid), 247)
elseif getPlayerSlotItem(owner, 8).itemid == 2154 or getPlayerSlotItem(owner, 8).itemid == 2155 then
doSendMagicEffect(getCreaturePosition(cid), 250)
elseif getPlayerSlotItem(owner, 8).itemid == 2228 or getPlayerSlotItem(owner, 8).itemid == 2229 then
doSendMagicEffect(getCreaturePosition(cid), 254)
elseif getPlayerSlotItem(owner, 8).itemid == 2231 or getPlayerSlotItem(owner, 8).itemid == 2232 then
doSendMagicEffect(getCreaturePosition(cid), 257)
end
doPlayerSendTextMessage(owner, 22, "Your pokemon fainted.")
if getPlayerSlotItem(owner, 8).itemid == 2220 or getPlayerSlotItem(owner, 8).itemid == 2221 then
doTransformItem(getPlayerSlotItem(owner, 8).uid, 2227)
elseif getPlayerSlotItem(owner, 8).itemid == 2222 or getPlayerSlotItem(owner, 8).itemid == 2223 then
doTransformItem(getPlayerSlotItem(owner, 8).uid, 2224)
elseif getPlayerSlotItem(owner, 8).itemid == 2651 or getPlayerSlotItem(owner, 8).itemid == 2652 then
doTransformItem(getPlayerSlotItem(owner, 8).uid, 2657)
elseif getPlayerSlotItem(owner, 8).itemid == 2653 or getPlayerSlotItem(owner, 8).itemid == 2654 then
doTransformItem(getPlayerSlotItem(owner, 8).uid, 2658)
elseif getPlayerSlotItem(owner, 8).itemid == 2655 or getPlayerSlotItem(owner, 8).itemid == 2656 then
doTransformItem(getPlayerSlotItem(owner, 8).uid, 2659)
elseif getPlayerSlotItem(owner, 8).itemid == 2218 or getPlayerSlotItem(owner, 8).itemid == 2216 then
doTransformItem(getPlayerSlotItem(owner, 8).uid, 2225)
elseif getPlayerSlotItem(owner, 8).itemid == 2154 or getPlayerSlotItem(owner, 8).itemid == 2155 then
doTransformItem(getPlayerSlotItem(owner, 8).uid, 2156)
elseif getPlayerSlotItem(owner, 8).itemid == 2228 or getPlayerSlotItem(owner, 8).itemid == 2229 then
doTransformItem(getPlayerSlotItem(owner, 8).uid, 2230)
elseif getPlayerSlotItem(owner, 8).itemid == 2231 or getPlayerSlotItem(owner, 8).itemid == 2232 then
doTransformItem(getPlayerSlotItem(owner, 8).uid, 2233)
end
local item = getPlayerSlotItem(owner, 8)
doItemSetAttribute(item.uid, "poke", getItemAttribute(item.uid, "poke"):sub(1, findLetter(getItemAttribute(item.uid, "poke"), ".")) .. " HP = [0/"..getCreatureMaxHealth(cid).."]")
setPlayerStorageValue(owner, 61207, 0)
setPlayerStorageValue(owner, 61204, 0)
if getPlayerGroupId(owner) == 8 then
setPlayerGroupId(owner, 1)
end
doRemoveCreature(cid)
return FALSE
end
