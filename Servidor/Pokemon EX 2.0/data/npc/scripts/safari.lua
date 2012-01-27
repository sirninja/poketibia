local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end



-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({'safari'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer entra no safari por 300 dollars?'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 30000, destination = {x=1048, y=1490, z=7} })
	travelNode:addChildKeyword({'nao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'ok.'})

keywordHandler:addKeyword({'safari'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu posso te levar para explorar safari zone por um pequeno custo.'})



-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())