local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, 'gentleman') and talkState[talkUser] == 1) then
	    selfSay('So you want to buy the gentleman clothes right? This will cost you 278 dollars, are you taking it?')
	    talkState[talkUser] = 3
    elseif(msgcontains(msg, 'athletic') and talkState[talkUser] == 1) then
	    selfSay('You must be very energetic! This clothing costs 165 dollars, do you want to buy it?')
	    talkState[talkUser] = 4
    elseif(msgcontains(msg, 'elite') and talkState[talkUser] == 1) then
	    selfSay('Wow, you must be a respected trainer! This will cost 322 dollars, are you buying it?')
	    talkState[talkUser] = 5
    elseif(msgcontains(msg, 'lady') and talkState[talkUser] == 2) then
	    selfSay('Great! This clothes are very worthy and they cost 211 dollars, do you accept?')
	    talkState[talkUser] = 6
    elseif(msgcontains(msg, 'elite') and talkState[talkUser] == 2) then
	    selfSay('This will make you look like the best trainer! It costs 280 dollars, do you to take it?')
	    talkState[talkUser] = 7
    elseif(msgcontains(msg, 'athletic') and talkState[talkUser] == 2) then
	    selfSay('You must be very healthy! This clothing costs 120 dollars, do you want it?')
	    talkState[talkUser] = 8
    elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
            if getPlayerStorageValue(cid, 101) <= 0 then
			    if(doPlayerRemoveMoney(cid, 27800)) then
				selfSay('Wow, it fits perfect on you! Thanks for the preferency.')
                setPlayerStorageValue(cid, 101, 1)
                doPlayerSendOutfitWindow(cid)
                talkState[talkUser] = 1
                else
				selfSay('Oh dear, you can\'t afford for this clothes.')
				talkState[talkUser] = 1
                end
            elseif getPlayerStorageValue(cid, 101) == 1 then
                 selfSay('You have already bought this clothes sweetie!')
                 talkState[talkUser] = 1
			end
    elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
            if getPlayerStorageValue(cid, 104) <= 0 then
			    if(doPlayerRemoveMoney(cid, 16500)) then
				selfSay('Very nice choice! Thanks for it!')
                setPlayerStorageValue(cid, 104, 1)
                doPlayerSendOutfitWindow(cid)
                talkState[talkUser] = 1
                else
				selfSay('Oh dear, you can\'t afford for this clothes.')
				talkState[talkUser] = 1
                end
            elseif getPlayerStorageValue(cid, 104) == 1 then
                 selfSay('You have already bought this clothes sweetie!')
                 talkState[talkUser] = 1
			end
    elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then
            if getPlayerStorageValue(cid, 100) <= 0 then
			    if(doPlayerRemoveMoney(cid, 32200)) then
				selfSay('Now you look like a real trainer, go for it!')
                setPlayerStorageValue(cid, 100, 1)
                doPlayerSendOutfitWindow(cid)
                talkState[talkUser] = 1
                else
				selfSay('Oh dear, you can\'t afford for this clothes.')
				talkState[talkUser] = 1
                end
            elseif getPlayerStorageValue(cid, 100) == 1 then
                 selfSay('You have already bought this clothes sweetie!')
                 talkState[talkUser] = 1
			end
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then
            if getPlayerStorageValue(cid, 101) <= 0 then
			    if(doPlayerRemoveMoney(cid, 21100)) then
				selfSay('Thanks! Now you can try on the lady outfit.')
                setPlayerStorageValue(cid, 101, 1)
                doPlayerSendOutfitWindow(cid)
                talkState[talkUser] = 2
                else
				selfSay('Sorry mrs, you can\'t afford for this clothes.')
				talkState[talkUser] = 2
                end
            elseif getPlayerStorageValue(cid, 101) == 1 then
                 selfSay('You have already bought this clothes!')
                 talkState[talkUser] = 2
			end
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then
            if getPlayerStorageValue(cid, 100) <= 0 then
			    if(doPlayerRemoveMoney(cid, 28000)) then
				selfSay('You look very nice! You are a very advanced trainer!')
                setPlayerStorageValue(cid, 100, 1)
                doPlayerSendOutfitWindow(cid)
                talkState[talkUser] = 2
                else
				selfSay('Sorry mrs, you can\'t afford for this clothes.')
				talkState[talkUser] = 2
                end
            elseif getPlayerStorageValue(cid, 100) == 1 then
                 selfSay('You have already bought this clothes!')
                 talkState[talkUser] = 2
			end
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then
            if getPlayerStorageValue(cid, 104) <= 0 then
			    if(doPlayerRemoveMoney(cid, 12000)) then
				selfSay('Men love athletic girls, hehe. Just kidding, you are beautiful!')
                setPlayerStorageValue(cid, 104, 1)
                doPlayerSendOutfitWindow(cid)
                talkState[talkUser] = 2
                else
				selfSay('Sorry mrs, you can\'t afford for this clothes.')
				talkState[talkUser] = 2
                end
            elseif getPlayerStorageValue(cid, 104) == 1 then
                 selfSay('You have already bought this clothes!')
                 talkState[talkUser] = 2
			end
    elseif(msgcontains(msg, 'no') and talkState[talkUser] == 3) then
				selfSay('Yea, you are right. This was not the best for you.')
				talkState[talkUser] = 1
    elseif(msgcontains(msg, 'no') and talkState[talkUser] == 4) then
				selfSay('Yea, you are right. This was not the best for you.')
				talkState[talkUser] = 1
    elseif(msgcontains(msg, 'no') and talkState[talkUser] == 5) then
				selfSay('Yea, you are right. This was not the best for you.')
				talkState[talkUser] = 1
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 6) then
				selfSay('Yea, you are right. This was not the best for you.')
				talkState[talkUser] = 2
    elseif(msgcontains(msg, 'no') and talkState[talkUser] == 7) then
				selfSay('Yea, you are right. This was not the best for you.')
				talkState[talkUser] = 2
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 8) then
				selfSay('Yea, you are right. This was not the best for you.')
				talkState[talkUser] = 2
    	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'offer') or msgcontains(msg, 'list') or msgcontains(msg, 'clothes') and talkState[talkUser] == 20) then
        if getPlayerSex(cid) == 1 then
		selfSay('I can sell you some {gentleman} clothes, or else you could try the {elite} pokemon trainer clothes, or maybe an {athletic} clothes, what do you think?')
		talkState[talkUser] = 1
        elseif getPlayerSex(cid) == 0 then
		selfSay('Hmm, what about some {lady} clothes? If you don\'t like it i can sell you an {elite} pokemon trainer clothes, or maybe the newest clothes available, the {athletic} clothes.')
		talkState[talkUser] = 2
		end
                end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())