local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
local quest = 76669
local reward = 70000
	
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		npcHandler:say("Great! I'll reward you greatly {ok}?.", cid)
		talkState[talkUser] = 2
	elseif msgcontains(msg, "ok") and talkState[talkUser] == 2 then
		npcHandler:say("Okay, Hurry up!", cid)
		setPlayerStorageValue(cid, quest, 2)
		talkState[talkUser] = 0
	elseif msgcontains(msg, "mission") then
		local str = getPlayerStorageValue(cid, quest)
		if(str < 2) then
			npcHandler:say("Great, an adventurer. I need you to slay 100 bulbasaurs for me. And then, we might be able to take out those leaf lords. Well, can you slay 100 bulbasaurs for me?", cid) 
			talkState[talkUser] = 1
			return true
		elseif(str == 2) then
			npcHandler:say("Please come back for a reward.", cid)
		elseif(str == 3) then
			npcHandler:say("100 bulbasaurs, already? You're a true bulbasaur hunter! As I promised, here's your reward.", cid)
			doPlayerAddItem(cid, 2160, 20)
			doPlayerAddExp(cid, 10000)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have been rewarded!")
			setPlayerStorageValue(cid, quest, 4)
		elseif(str == 4) then
			npcHandler:say("You have done enough for me, I will soon plan our attack!", cid)
		end
		talkState[talkUser] = 0
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())