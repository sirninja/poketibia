  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        local crystalid = 9980
        local storage = 9980
        local pos = {x=320,y=558,z=7,stackpos=1}    
        local getstorage = getPlayerStorageValue(cid, storage)
        local sorrymessage = "Desculpe, voce nao tem todas Stones necessarias para completar a 'missao'..."
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if getPlayerLevel(cid) >= 85 then
        if msgcontains(msg, 'stones') then
                if getstorage == 8 then
                        npcHandler:say("Voce jah completou a quest", cid)
                elseif getstorage < 8 then
                        npcHandler:say("Voce trouxe algumas stones?", cid)
                        talkState[talkUser] = 1
                end
        elseif msgcontains(msg, 'missao') then
                if getstorage < 1 then
                        npcHandler:say("Voce precisa de 2 Coccon stones para comecar.", cid)
                elseif getstorage == 1 then
                        npcHandler:say("Voce esta na segunda missao e precisa de 2 Heart stones para continuar.", cid)
                elseif getstorage == 2 then
                        npcHandler:say("Voce esta na terceira missao e precisa de 2 Thunder stones para continuar.", cid)
                elseif getstorage == 3 then
                        npcHandler:say("Voce esta na quarta missao e precisa de 2 Leaf stones para continuar.", cid)
                elseif getstorage == 4 then
                        npcHandler:say("Voce esta na quinta missao e precisa de 2 Rock stones para continuar.", cid)
                elseif getstorage == 5 then
                        npcHandler:say("Voce esta na sexta missao e precisa me dar 2 Earth stones para continuar.", cid)
                elseif getstorage == 6 then
                        npcHandler:say("Voce esta na setima missao e precisa me dar 2 Water stones para continuar.", cid)
                elseif getstorage == 7 then
                        npcHandler:say("Voce esta na oitava missao e precisa me dar 2 Fire stones para continuar.", cid)
                elseif getstorage == 8 then
                        npcHandler:say("Voce completou todas as missoes.", cid)
                end
        elseif msgcontains(msg, 'yes') then
                if talkState[talkUser] == 1 then
                        if getstorage < 0 then
                                if doPlayerRemoveItem(cid, 2284, 2) == TRUE then
                                        npcHandler:say("Obrigado. Agora irei precisar de 2 Heart stones.", cid)
                                        setPlayerStorageValue(cid, storage, 1)
                                        doPlayerAddExp(cid, 5000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, 2284, 2) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
								
                        elseif getstorage == 1 then
                                if doPlayerRemoveItem(cid, 2289, 2) == TRUE then
                                        npcHandler:say("Obrigado. Agora irei precisar de 2 Thunder stones.", cid)
                                        setPlayerStorageValue(cid, storage, 2)
                                        doPlayerAddExp(cid, 10000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, 2289, 2) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
								
                        elseif getstorage == 2 then
                                if doPlayerRemoveItem(cid, 2279, 2) == TRUE then
                                        npcHandler:say("Obrigado. Agora irei precisar de 2 Leaf stones.", cid)
                                        setPlayerStorageValue(cid, storage, 3)
                                        doPlayerAddExp(cid, 20000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, 2279, 2) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 3 then
                                if doPlayerRemoveItem(cid, 2276, 2) == TRUE then
                                        npcHandler:say("Obrigado. Agora irei precisar de 2 Rock stones.", cid)
                                        setPlayerStorageValue(cid, storage, 4)
                                        doPlayerAddExp(cid, 40000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, 2276,2) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 4 then
                                if doPlayerRemoveItem(cid, 2280, 2) == TRUE then
                                        npcHandler:say("Obrigado. Agora irei precisar de 2 Earth stones.", cid)
                                        setPlayerStorageValue(cid, storage, 5)
                                        doPlayerAddExp(cid, 80000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, 2280, 2) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 5 then
                                if doPlayerRemoveItem(cid, 2287, 2) == TRUE then
                                        npcHandler:say("Obrigado. Agora irei precisar de 2 Waters Stone.", cid)
                                        setPlayerStorageValue(cid, storage, 6)
                                        doPlayerAddExp(cid, 160000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, 2287, 2) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 6 then
                                if doPlayerRemoveItem(cid, 2277, 2) == TRUE then
                                        npcHandler:say("Obrigado. Agora irei precisar de 2 Fire Stone.", cid)
                                        setPlayerStorageValue(cid, storage, 7)
                                        doPlayerAddExp(cid, 320000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, 2277, 2) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 7 then	
							
									if doPlayerRemoveItem(cid, 2283, 2) == TRUE then
											npcHandler:say("Parabens HehEhehehehe, voce completou todas as missoes. Irei te dar uma Box 4 e alguma experiencia como recompensa.", cid)
											setPlayerStorageValue(cid, storage, 8)
											doPlayerAddExp(cid, 640000)
											doPlayerAddItem(cid, 7891, 1) 
											talkState[talkUser] = 0
									elseif doPlayerRemoveItem(cid, 2283, 2) == FALSE then
											npcHandler:say(sorrymessage, cid)
											talkState[talkUser] = 0	
											
                                end
                        end
                end
        elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
                npcHandler:say("OK, Volte quando estiver pronto.", cid)
                talkState[talkUser] = 0
        end
        else
   npcHandler:say("Desculpe, voce nao tem level suficiente para realizars a missao!", cid)
   alkState[talkUser] = 0
        end
return TRUE
end	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 