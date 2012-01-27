local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local stan = 0
local stan_two = 0
local player_pattern = '^[a-zA-Z0-9 -]+$'
local number_pattern = '%d'
local target_cid = 0
local number_pattern_two = '%d+'
local b, e = 0
local count = 0
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return FALSE
end

if getPlayerStorageValue(cid,8996) == -1 then
setPlayerStorageValue(cid,8996,0)
end

if msgcontains(msg, 'deposit') then
if string.find(msg, number_pattern) then
b, e = string.find(msg, number_pattern_two)
count = tonumber(string.sub(msg, b, e))
if getPlayerMoney(cid) >= count then
doPlayerRemoveMoney(cid,count)
stan = getPlayerStorageValue(cid,8996) + count
setPlayerStorageValue(cid,8996,stan)
npcHandler:say('Alright, we have added the amount of '..count..' gold to your balance. You can withdraw your money anytime.', cid)
local talk_state = 0
else
npcHandler:say('You don\'t have so much gold.', cid)
local talk_state = 0
end
else
npcHandler:say('Please tell me how much gold you would like to deposit.', cid)
local talk_state = 1
end
elseif msgcontains(msg, 'withdraw') then
if string.find(msg, number_pattern) then
b, e = string.find(msg, number_pattern_two)
count = tonumber(string.sub(msg, b, e))
if getPlayerStorageValue(cid,8996) - count >= 0 then
stan = getPlayerStorageValue(cid,8996) - count
setPlayerStorageValue(cid,8996,stan)
doPlayerAddMoney(cid,count)
npcHandler:say('Here you are, '..count..' gold. Please let me know if there is something else I can do for you.', cid)
local talk_state = 0
else
npcHandler:say('There is not enough gold on your account.', cid)
local talk_state = 0
end
else
npcHandler:say('Please tell me how much gold you would like to withdraw.', cid)
local talk_state = 2
end
elseif msgcontains(msg, 'balance') then
if getPlayerStorageValue(cid,8996) == -1 then
setPlayerStorageValue(cid,8996,0)
end
npcHandler:say('Your account balance is ' .. getPlayerStorageValue(cid,8996) .. ' gold.', cid)
local talk_state = 0
elseif talk_state == 1 then
count = tonumber(string.sub(msg, b, e))
if string.find(msg, number_pattern) then
if doPlayerRemoveMoney(cid, msg) then
stan = getPlayerStorageValue(cid,8996) + msg
setPlayerStorageValue(cid,8996,stan)
doPlayerRemoveMoney(cid,msg)
npcHandler:say('Alright, we have added the amount of '..count..' gold to your balance. You can withdraw your money anytime.', cid)
local talk_state = 0
else
npcHandler:say('You don\'t have so much gold.', cid)
local talk_state = 0
end
else
npcHandler:say('Please tell me how much gold you would like to deposit.', cid)
local talk_state = 1
end
elseif talk_state == 2 then
count = tonumber(string.sub(msg, b, e))
stan = getPlayerStorageValue(cid,8996)
if string.find(msg, number_pattern) then
if getPlayerStorageValue(cid,8996) - msg >= 0 then
stan = getPlayerStorageValue(cid,8996) - msg
setPlayerStorageValue(cid,8996,stan)
doPlayerAddMoney(cid,msg)
npcHandler:say('Here you are, '..count..' gold. Please let me know if there is something else I can do for you.', cid)
local talk_state = 0
else
npcHandler:say('There is not enough gold on your account.', cid)
local talk_state = 0
end
else
npcHandler:say('Please tell me how much gold you would like to deposit.', cid)
local talk_state = 2
end
return true
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
--npcHandler:setMessage(MESSAGE_FAREWELL, 'Bye, bye. You gold safe at here, |PLAYERNAME|. <snickers>!')
npcHandler:addModule(FocusModule:new())