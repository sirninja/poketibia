local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
local node1 = keywordHandler:addKeyword({'prem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell premium account by Diamonds.'})
function creatureSayCallback(cid, type, msg)
p = 1 -- valor da P.A em Diamonds
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
---------- MSGs ----------
if msgcontains(msg, 'account') or msgcontains(msg, 'diamond') or msgcontains(msg, 'account diamond') or msgcontains(msg, 'diamond account') or msgcontains(msg, 'premium') then
selfSay('Diamond account users are able to use ride, teleport, surf and fly. They can also wear all clothes, use the TV camera, rent housesand costumize poké balls. Finally, diamond account users have access to the saffari zone and are free of taxes in the casino! If you would like to upgrade your account will have to pay me '..p..' diamonds on each day. Would you like how many days?', cid)
talkState[talkUser] = 1

---== compra por GPs ==---
elseif talkState[talkUser] == 1 then
if getNumber(msg) < 350 then
n = getNumber(msg)
if n ~= 0 then
if getPlayerItemCount(cid, 2145) >= p*n then
selfSay('Days of Premium: {'..n..'} for {'..n*(p)..'} Diamonds?', cid)
talkState[talkUser] = 3
else
selfSay('You do not have enough diamonds to buy {'..n..'} days of premium.', cid)
talkState[talkUser] = 0
end
else
selfSay('Choose a number above zero.', cid)
talkState[talkUser] = 0
end
else
selfSay('You can not buy more than 350 days of premium account.', cid)
talkState[talkUser] = 0
end
elseif talkState[talkUser] == 3 then ---== GPs ==---
if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') or msgcontains(msg, 'SIM') or msgcontains(msg, 'YES') then
if getPlayerPremiumDays(cid)+n <= 350 then
if (doPlayerRemoveItem(cid, 2145, p*n) ~= TRUE) then
npcHandler:say('You do not have enough diamonds!', cid)
talkState[talkUser] = 0
else
addVipDays(cid, n)
doPlayerAddPremiumDays(cid, n)
selfSay('Purchase made successfully, days of premium account:{ '..n..' }.', cid)
talkState[talkUser] = 0
end
else
npcHandler:say('You can not have more than 350 days of Premium!', cid)
talkState[talkUser] = 0
end
end
elseif msgcontains(msg, 'no') or msgcontains(msg, 'nao') or msgcontains(msg, 'não') or msgcontains(msg, 'NO') or msgcontains(msg, 'NAO') or msgcontains(msg, 'NÃO')then
selfSay('Okay.', cid)
talkState[talkUser] = 0
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
-- function maded by Gesior--
function getNumber(txt) --return number if its number and is > 0, else return 0
x = string.gsub(txt,"%a","")
x = tonumber(x)
if x ~= nill and x > 0 then
return x
else
return 0
end
end