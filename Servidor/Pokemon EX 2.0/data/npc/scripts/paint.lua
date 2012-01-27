local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function pintar(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end
local pokeball = {2222, 2651, 2653, 2220, 2655}
    for i = 1, #pokeball do
	if isInArray(pokeball, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
		if(doPlayerRemoveMoney(cid, parameters.price)) then
		   local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
		   local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
		   doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
		   doTransformItem(feet.uid, parameters.bola)
		   selfSay('Bola Pintada!')
		   else
		   selfSay('Você não tem dinheiro suficiente!')
		   end
		   else
		   selfSay('Coloque a pokebola correta no slot!')
		end
	return TRUE
	end
npcHandler:resetNpc()
return true
end
local frase = 'Deseja pintar sua pokebola para'
local node1 = keywordHandler:addKeyword({'pintar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu faço as sequintes pinturas:\n-> pokeball: 50$\n->great ball: 80$\n->super ball: 120$\n->ultra ball: 150$\n->saffari ball: 150$'})
local node11 = node1:addChildKeyword({'pokeball'},StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = frase..' pokeball?'})
	node11:addChildKeyword({'yes'}, pintar, {price = 5000,bola = 2222})
	node11:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node12 = node1:addChildKeyword({'great ball'},StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = frase..' great ball?'})
	node12:addChildKeyword({'yes'}, pintar, {price = 8000,bola = 2651})
	node12:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node13 = node1:addChildKeyword({'super ball'},StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = frase..' super ball?'})
	node13:addChildKeyword({'yes'}, pintar, {price = 12000,bola = 2653})
	node13:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node14 = node1:addChildKeyword({'ultra ball'},StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = frase..' ultra ball?'})
	node14:addChildKeyword({'yes'}, pintar, {price = 15000,bola = 2220})
	node14:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node15 = node1:addChildKeyword({'saffari ball'},StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = frase..' saffari ball?'})
	node15:addChildKeyword({'yes'}, pintar, {price = 15000,bola = 2655})
	node15:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})


npcHandler:addModule(FocusModule:new())