local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
-- OTServ event handling functions end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if (not npcHandler:isFocused(cid)) then
        return false
    end

        if msgcontains(msg, 'vial') then
                npcHandler:say('We have a special offer right now for depositing vials. Are you interested in hearing it?', cid)
                talk_state = 1
      elseif msgcontains(msg, 'yes') and talk_state == 1 then
             npcHandler:say('Great! I\'ve signed you up for our bonus for lottery {ticket}. From now on, you will have the chance to win the potion belt addon!', cid)
             talk_state = 0   
      elseif msgcontains(msg, 'ticket') then
             npcHandler:say('Would you like to get a lottery ticket instead of the {deposit} for your vials.', cid)
             talk_state = 1
      elseif msgcontains(msg, 'deposit') and talk_state == 1 then          
            if getPlayerItemCount(cid, 7636) >= 100 or getPlayerItemCount(cid, 7635) >= 100 or getPlayerItemCount(cid, 7634) >= 100 then
                    npcHandler:say('Congratulations! Here, from now on you can wear our lovely potion belt as accessory.', cid)
            if doPlayerRemoveItem(cid, 7636,100) or doPlayerRemoveItem(cid, 7635,100) or doPlayerRemoveItem(cid, 7634,100) then
                    doPlayerAddItem(cid, 5957, 1)
                    talk_state = 0
            else
                npcHandler:say('Sorry you need 100 empty vials to you from the lottery ticket', cid)
                talkState[talkUser] = 0
                end
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 3) then
            npcHandler:say('Ok thanks.', cid)
            talk_state = 0
        end
        return TRUE
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             