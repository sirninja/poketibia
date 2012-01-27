function onUse(cid, item, frompos, item2, topos)
r1 = math.random(1,57)
if getPlayerLevel(cid) >= 90 and getPlayerFreeCap(cid) ~= 0 then
if doPlayerRemoveItem(cid,7891,1) == TRUE then
if r1 == 1 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Venusaur.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Venusaur."
local poke1 = "This is Venusaur's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Venusaur")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 2 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Charizard.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Charizard."
local poke1 = "This is Charizard's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Charizard")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 3 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Blastoise.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Blastoise."
local poke1 = "This is Blastoise's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Blastoise")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 4 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Pidgeot.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Pidgeot."
local poke1 = "This is Pidgeot's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Pidgeot")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 5 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Nidoking.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Nidoking."
local poke1 = "This is Nidoking's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Nidoking")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 6 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Nidoqueen.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Nidoqueen."
local poke1 = "This is Nidoqueen's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Nidoqueen")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 7 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Ninetales.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Ninetales."
local poke1 = "This is Ninetales's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Ninetales")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 8 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Arcanine.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Arcanine."
local poke1 = "This is Arcanine's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Arcanine")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 9 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Alakazam.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Alakazam."
local poke1 = "This is Alakazam's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Alakazam")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 10 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Machamp.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Machamp."
local poke1 = "This is Machamp's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Machamp")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 11 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Tentacruel.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Tentacruel."
local poke1 = "This is Tentacruel's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Tentacruel")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 12 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Golem.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Golem."
local poke1 = "This is Golem's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Golem")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 13 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Dewgong.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Dewgong."
local poke1 = "This is Dewgong's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Dewgong")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 14 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Gengar.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Gengar."
local poke1 = "This is Gengar's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Gengar")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 15 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Rhydon.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Rhydon."
local poke1 = "This is Rhydon's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Rhydon")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 16 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Scyther.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Scyther."
local poke1 = "This is Scyther's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Scyther")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 17 then
doPlayerSendTextMessage(cid,22,"Você ganhou uma Jynx.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Jynx."
local poke1 = "This is Jynx's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Jynx")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 18 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Electabuzz.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Electabuzz."
local poke1 = "This is Electabuzz's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Electabuzz")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 19 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Magmar.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Magmar."
local poke1 = "This is Magmar's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Magmar")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 20 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Gyarados.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Gyarados."
local poke1 = "This is Gyarados's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Gyarados")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 21 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Lapras.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Lapras."
local poke1 = "This is Lapras's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Lapras")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 22 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Omastar.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Omastar."
local poke1 = "This is Omastar's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Omastar")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 23 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Kabutops.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Kabutops."
local poke1 = "This is Kabutops's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Kabutops")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 24 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Aerodactyl.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Aerodactyl."
local poke1 = "This is Aerodactyl's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Aerodactyl")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 25 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Snorlax.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Snorlax."
local poke1 = "This is Snorlax's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Snorlax")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 26 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Dragonair.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Dragonair."
local poke1 = "This is Dragonair's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Dragonair")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 27 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Dragonite.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Dragonite."
local poke1 = "This is Dragonite's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Dragonite")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 28 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Poliwrath.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Poliwrath."
local poke1 = "This is Poliwrath's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Poliwrath")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 29 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Venusaur.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Venusaur."
local poke1 = "This is Venusaur's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Venusaur")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 30 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Charizard.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Charizard."
local poke1 = "This is Charizard's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Charizard")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 31 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Blastoise.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Blastoise."
local poke1 = "This is Blastoise's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Blastoise")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 32 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Pidgeot.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Pidgeot."
local poke1 = "This is Pidgeot's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Pidgeot")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 33 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Nidoking.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Nidoking."
local poke1 = "This is Nidoking's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Nidoking")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 34 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Nidoqueen.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Nidoqueen."
local poke1 = "This is Nidoqueen's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Nidoqueen")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 35 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Ninetales.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Ninetales."
local poke1 = "This is Ninetales's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Ninetales")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 36 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Arcanine.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Arcanine."
local poke1 = "This is Arcanine's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Arcanine")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 37 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Alakazam.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Alakazam."
local poke1 = "This is Alakazam's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Alakazam")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 38 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Machamp.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Machamp."
local poke1 = "This is Machamp's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Machamp")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 39 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Tentacruel.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Tentacruel."
local poke1 = "This is Tentacruel's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Tentacruel")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 40 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Golem.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Golem."
local poke1 = "This is Golem's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Golem")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 41 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Dewgong.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Dewgong."
local poke1 = "This is Dewgong's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Dewgong")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 42 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Gengar.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Gengar."
local poke1 = "This is Gengar's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Gengar")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 43 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Rhydon.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Rhydon."
local poke1 = "This is Rhydon's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Rhydon")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 44 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Scyther.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Scyther."
local poke1 = "This is Scyther's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Scyther")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 45 then
doPlayerSendTextMessage(cid,22,"Você ganhou uma Jynx.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Jynx."
local poke1 = "This is Jynx's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Jynx")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 46 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Electabuzz.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Electabuzz."
local poke1 = "This is Electabuzz's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Electabuzz")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 47 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Magmar.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Magmar."
local poke1 = "This is Magmar's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Magmar")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 48 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Gyarados.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Gyarados."
local poke1 = "This is Gyarados's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Gyarados")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 49 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Lapras.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Lapras."
local poke1 = "This is Lapras's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Lapras")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 50 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Omastar.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Omastar."
local poke1 = "This is Omastar's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Omastar")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 51 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Kabutops.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Kabutops."
local poke1 = "This is Kabutops's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Kabutops")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 52 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Aerodactyl.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Aerodactyl."
local poke1 = "This is Aerodactyl's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Aerodactyl")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 53 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Snorlax.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Snorlax."
local poke1 = "This is Snorlax's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Snorlax")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 54 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Dragonair.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Dragonair."
local poke1 = "This is Dragonair's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Dragonair")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 55 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Dragonite.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Dragonite."
local poke1 = "This is Dragonite's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Dragonite")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 56 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Poliwrath.")
local health = 6000 -- Health do poke
local maxhealth = 6000 -- Maximo de health do poke
local description = "Contains a Poliwrath."
local poke1 = "This is Poliwrath's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Poliwrath")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 28)

elseif r1 == 57 then
doPlayerSendTextMessage(cid,22,"Você ganhou um Charizard.")
local health = 7200 -- Health do poke
local maxhealth = 7200 -- Maximo de health do poke
local description = "Contains a Charizard."
local poke1 = "This is Elder Charizard's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Elder Charizard")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doSendMagicEffect(getCreaturePosition(cid), 29)
          else
        doPlayerSendTextMessage(cid,22,"The chest is empty.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente players level 90+ e que estejam carregando 5 ou menos pokemons podem abrir este presente.')
        end
return 1
end