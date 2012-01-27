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
 
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid  
 
-- Conversa Jogador/NPC  
if(msgcontains(msg, 'Offer') or msgcontains(msg, 'offer')) then
selfSay('Eu Compro {Fire Stone}, {Water Stone}, {Venom Stone}, {Thunder Stone}, {Rock Stone}, {Punch Stone}, {Leaf Stone}, {Coccon Stone}, {Crystal Stone}, {Darkness Stone}, {Earth Stone}, {Enigma Stone}, {Heart Stone}, e {Ice Stone}.', cid) 
elseif(msgcontains(msg, 'Fire Stone') or msgcontains(msg, 'fire stone')) then
selfSay('Então Voc\ê quer vender uma Fire Stone por 4500 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 1 
elseif(msgcontains(msg, 'Water Stone') or msgcontains(msg, 'water stone')) then
selfSay('Então Voc\ê quer vender uma Water Stone por 4500 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 2 
elseif(msgcontains(msg, 'Venom Stone') or msgcontains(msg, 'venom stone')) then
selfSay('Então Voc\ê quer vender uma Venom Stone por 2000 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 3 
elseif(msgcontains(msg, 'Thunder Stone') or msgcontains(msg, 'thunder stone')) then
selfSay('Então Voc\ê quer vender uma Thunder Stone por 5000 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 4 
elseif(msgcontains(msg, 'Rock Stone') or msgcontains(msg, 'rock stone')) then
selfSay('Então Voc\ê quer vender uma Rock Stone por 4500 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 5 
elseif(msgcontains(msg, 'Punch Stone') or msgcontains(msg, 'punch stone')) then 
selfSay('Então Voc\ê quer vender uma Punch Stone por 5000 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 6 
elseif(msgcontains(msg, 'Leaf Stone') or msgcontains(msg, 'leaf stone')) then
selfSay('Então Voc\ê quer vender uma Leaf Stone por 3000 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 7 
elseif(msgcontains(msg, 'Coccon Stone') or msgcontains(msg, 'coccon stone')) then
selfSay('Então Voc\ê quer vender uma Coccon Stone por 1200 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 8 
elseif(msgcontains(msg, 'Crystal Stone') or msgcontains(msg, 'crystal stone')) then
selfSay('Então Voc\ê quer vender uma Crystal Stone por 15000 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 9 
elseif(msgcontains(msg, 'Darkness Stone') or msgcontains(msg, 'darkness stone')) then
selfSay('Então Voc\ê quer vender uma Darkness Stone por 7000 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 10 
elseif(msgcontains(msg, 'Earth Stone') or msgcontains(msg, 'earth stone')) then
selfSay('Então Voc\ê quer vender uma Earth Stone por 4000 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 11 
elseif(msgcontains(msg, 'Enigma Stone') or msgcontains(msg, 'enigma stone')) then
selfSay('Então Voc\ê quer vender uma Enigma Stone por 7000 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 12 
elseif(msgcontains(msg, 'Heart Stone') or msgcontains(msg, 'heart stone')) then
selfSay('Então Voc\ê quer vender uma Heart Stone por 3000 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 13 
elseif(msgcontains(msg, 'Ice Stone') or msgcontains(msg, 'ice stone')) then
selfSay('Então Voc\ê quer vender uma Ice Stone por 4500 dollars, voc\ê tem certeza?', cid) 
talkState[talkUser] = 14 
 
-- Confirmação da Compra  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then  
if(doPlayerRemoveItem(cid, 2283, 1) == true) then  
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 2160, 45) 
talkState[talkUser] = 0 
else  
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then 
if(doPlayerRemoveItem(cid, 2277, 1) == true) then 
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 2160, 45) 
talkState[talkUser] = 0 
else  
selfSay('Desculpe, voc\ê n\ão tem esse item', cid)
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then 
if(doPlayerRemoveItem(cid, 2278, 1) == true) then 
selfSay('Obrigado!', cid) 
doPlayerAddItem(cid, 2160, 20) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then 
if(doPlayerRemoveItem(cid, 2279, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 50) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then 
if(doPlayerRemoveItem(cid, 2280, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 45) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then 
if(doPlayerRemoveItem(cid, 2281, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 50) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0   
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then 
if(doPlayerRemoveItem(cid, 2276, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 30) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then 
if(doPlayerRemoveItem(cid, 2284, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 12) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 9) then 
if(doPlayerRemoveItem(cid, 2285, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 150) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then 
if(doPlayerRemoveItem(cid, 2286, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 70) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 11) then  
if(doPlayerRemoveItem(cid, 2287, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 40) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 12) then 
if(doPlayerRemoveItem(cid, 2288, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 70) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 13) then 
if(doPlayerRemoveItem(cid, 2289, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 30) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 14) then 
if(doPlayerRemoveItem(cid, 2290, 1) == true) then 
selfSay('Obrigado!', cid)
doPlayerAddItem(cid, 2160, 45) 
talkState[talkUser] = 0 
else 
selfSay('Desculpe, voc\ê n\ão tem esse item', cid) 
talkState[talkUser] = 0 
end  
end 
return TRUE 
end 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())