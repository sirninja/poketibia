local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function buyVip(cid, message, keywords, parameters, node)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        
        if doPlayerRemoveItem(cid, 2145, 10) then
                addVipDays(cid, parameters.days)           
                doPlayerAddPremiumDays(cid, days)
                npcHandler:say('Thanks, you buy '..parameters.days..' vip days. You have '..getVipDays(cid)..' vip days.', cid)
        else
                npcHandler:say('Sorry, you don\'t have enough diamonds.', cid)
        end
        
        npcHandler:resetNpc()
        return true
end

local node1 = keywordHandler:addKeyword({'vip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want buy 30 vip days for 10 diamonds?'})
        node1:addChildKeyword({'yes'}, buyVip, {price = 1000000, days = 30})
        node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})

npcHandler:addModule(FocusModule:new())