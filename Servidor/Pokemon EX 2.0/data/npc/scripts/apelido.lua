local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {20}
local balls = {
		[2222]  = { b = 2222 },
		[2224]  = { b = 2222 },
		
		[11438] = { b = 11438 },
		[11440] = { b = 11438 },
		
		[11442] = { b = 11442 },
		[11444] = { b = 11442 },
		
		[2220]  = { b = 2220 },
		[2227]  = { b = 2220 },
		
		[11446] = { b = 11446 },
		[11447] = { b = 11446 },
		[11448] = { b = 11446 },
		
		[11449] = { b = 11449 },
		[11450] = { b = 11449 },
		[11451] = { b = 11449 },
		
		[11452] = { b = 11452 },
		[11453] = { b = 11452 },
		[11454] = { b = 11452 },
		
		[11455] = { b = 11455 },
		[11456] = { b = 11455 },
		[11457] = { b = 11455 },
		
		[11458] = { b = 11458 },
		[11459] = { b = 11458 },
		[11460] = { b = 11458 },
}
local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false
local nomes = {

	[1] = { nome = "", varItem =  "" },
	[2] = { nome = "", varItem =  "" },
	[3] = { nome = "", varItem =  "" },
	[4] = { nome = "", varItem =  "" },
	[5] = { nome = "", varItem =  "" },
	[6] = { nome = "", varItem =  "" },

}
local numPoke = 2

function onThingMove(creature, thing, oldpos, oldstackpos, item, itemEx)

end

function doLimpaVetor()

	for i = 1,6 do
						
		nomes[i].nome = ""
		nomes[i].varItem = ""

	end

end

function getListaPoke(cid)

		item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
		pb = balls[item.itemid]
        if pb ~= nil then
        		varNome = getItemAttribute(item.uid, "poke"):match("This is (.-)'s pokeball.")
		        nomes[1] = { nome = varNome, varItem =  item.uid }
        end
        numPoke = 2
        local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
        doCheckNextBag(cid,bp)

end


function onCreatureAppear(creature)

end


function onCreatureDisappear(cid, pos)
	if focus == cid then
			selfSay('Good bye then.',cid)
			focus = 0
			talk_start = 0
			talkState[talkUser] = 0
	end
end
function onCreatureTurn(creature)

end

function msgcontains(txt, str)
		return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end


function onCreatureSay(cid, type, msg)
    numeros=' 1 2 3 4 5 6 '
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if getDistanceToCreature(cid) > 4 then
		return false
	end
	doLimpaVetor()
	  if talkState[talkUser] ~= 3 then
			msg = string.lower(msg)
		end
		
		if (msgcontains(msg, 'hi'))  then
					
				if #getCreatureSummons(cid) >= 1 then
					selfSay('Please back your Pokemon to the pokeball...', cid)
					focus = 0
					talkState[talkUser] = 1
					return false
				end	
				
				if getPlayerStorageValue(cid, 17001) == 1 then
						return selfSay('You Are riding .', cid)
				end
				if getPlayerStorageValue(cid, 7778) >= 1 then
						return selfSay('You are using ability.', cid)
				end
				if #getCreatureSummons(cid) >= 1 then
						selfSay('Please back your Pokemon to the pokeball...', cid)
						focus = 0
						talk_start = 0
				end
				getListaPoke(cid)
				fala = 'Which of these pokemons you wanna give a nickname :'
							
				for i = 1,6 do
					
						fala = fala..'\n'..i..' = '..nomes[i].nome 
				
				end
				
				fala = fala..'\n Just Tell me the number of Pokemon'
				fala = fala..'\n Dont mess the pokes on your body during the process'
				selfSay(fala, cid)
				talkState[talkUser] = 1
		elseif(msgcontains(numeros,msg) and talkState[talkUser] == 1) then
				
				getListaPoke(cid)
				poke = nomes[tonumber(msg)]
				setPlayerStorageValue(cid,18000,tonumber(msg))
				selfSay('You really wanna giva a nickname to '..poke.nome..'?', cid)
				talkState[talkUser] = 2
		elseif ( msgcontains(msg, 'yes') and talkState[talkUser] == 2 ) then
				selfSay('Which nickname have you choice for him ?', cid)
				talkState[talkUser] = 3
		elseif talkState[talkUser] == 3 then
				selfSay('You really wanna call it at '..msg..'?', cid)
				setPlayerStorageValue(cid,18001,msg)
				talkState[talkUser] = 4
		elseif ( msgcontains(msg, 'yes') and talkState[talkUser] == 4 ) then
				getListaPoke(cid)
				numPoke = getPlayerStorageValue(cid, 18000)
				nomePoke = getPlayerStorageValue(cid, 18001)
				if numPoke ~= nil then
				   poke = nomes[numPoke]
				   doItemSetAttribute(poke.varItem, "apelido", nomePoke)
				   doItemSetAttribute(poke.varItem, "description", "Contains "..poke.nome.." Nick: ("..nomePoke..")")
				   selfSay('Congratulations, now your pokemon have a nickname', cid)
				   talkState[talkUser] = 0
				end
		elseif(msgcontains(msg, 'no')) then
				talkState[talkUser] = 0
				selfSay('Ok Bye Then.', cid)
		elseif(msgcontains(msg, 'bye')) then
				selfSay('Ok Bye Then.', cid)
				talkState[talkUser] = 0
		end
		
end

function onCreatureChangeOutfit(creature)

end

function doCheckNextBag(cid,container)

local itemsInBag = {}
local bagEmptySlotCheck = 0
local bagSize = getContainerSize(container.uid)
        
	for i = 0, getContainerSize(container.uid)-1 do
		itemsInBag[i] = getContainerItem(container.uid, i)
		if itemsInBag[i].itemid > 0 then
				local ball = balls[itemsInBag[i].itemid]
				if ( ball ~= nill ) then
						varNome = getItemAttribute(itemsInBag[i].uid, "poke"):match("This is (.-)'s pokeball.")
		        nomes[numPoke] = { nome = varNome, varItem =  itemsInBag[i].uid }
		        numPoke = numPoke + 1	
				end

    end
   			
    if isItemContainer(cid,itemsInBag[i].itemid) then
				doCheckNextBag(itemsInBag[i])
		end

 	end
        
	bagEmptySlotCheck = 0

end