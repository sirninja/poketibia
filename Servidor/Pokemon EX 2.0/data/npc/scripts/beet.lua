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

price_21 = 1000 -- 1k ou 1000gold
price_jogo6 = 5000

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

if(msgcontains(msg, 'apostar')) then
selfSay('Eu faço 2 jogos: {21},{Jogo do 6} escolha um deles!', cid)
talkState[talkUser] = 5
elseif (msgcontains(msg, 'Jogo do 6') and talkState[talkUser] == 5)    then
selfSay('O Jogo do 6 funciona assim: Eu vou rodar um dado, e se cair no número 6 você ganha o sêxtuplo (6 vezes) do valor apostado.', cid)
selfSay('Caso não caia no 6, você perde apenas o dinheiro da aposta.', cid)
selfSay('Está pronto para {começar}?.', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'começar') and talkState[talkUser] == 3) then
selfSay('Você possui o {dinheiro} da aposta ('..price_jogo6..')golds ?', cid)
if doPlayerRemoveMoney(cid, price_jogo6) == TRUE then
talkState[talkUser] = 2
else
selfSay('Desculpe, mais você não tem dinheiro para apostar comigo.',cid)
end
elseif(msgcontains(msg, 'dinheiro') and talkState[talkUser] == 2) then
sorteio6 = math.random(1,6)
if sorteio6 == 6 then
talkState[talkUser] = 3
selfSay('Parábens, o número sorteado foi 6 e você acaba de ganhar '..(price_jogo6*6) ..'golds, mais o dinheiro que você pagou da aposta.',cid)
doPlayerAddMoney(cid,price_jogo6*6) 
else
talkState[talkUser] = 2
selfSay('Que azar, o número sorteado foi '..sorteio6..', mais sorte na proxima.',cid)
end
elseif(msgcontains(msg, '21') and talkState[talkUser] == 5) then
selfSay('O 21 funciona assim: Você ira ganhar 1 número e o número tem quer ser 21, ou chegar o mais próximo possível sem ultrapassar esse valor.', cid)
selfSay('E a mesma coisa será feita comigo, ganharei 1 número.', cid)
selfSay('Você pode ir comprando mais números dizendo [comprar] e se quiser parar é só dizer [parar].', cid)
selfSay('Se você ganhar de mim, você leva o triplo do dinheiro apostado.', cid)
selfSay('Está pronto para {começar}?.', cid)
talkState[talkUser] = 0
elseif(msgcontains(msg, 'começar') and talkState[talkUser] == 0) then
selfSay('Você possui o {dinheiro} da aposta ('..price_21..')golds ?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'dinheiro') and talkState[talkUser] == 1) then
if doPlayerRemoveMoney(cid, price_21) == TRUE then
talkState[talkUser] = 0
local mpn = math.random(1,21) 
setPlayerStorageValue(cid, 55411,mpn)  
local pn = getPlayerStorageValue(cid, 55411)        
selfSay('Seu número é '..pn..', quer comprar mais ou parar?',cid)
else
selfSay('Desculpe, mais você não tem dinheiro para apostar comigo.',cid)
end
elseif(msgcontains(msg, 'comprar') and talkState[talkUser] == 0) then
local cp = math.random(1,10)
setPlayerStorageValue(cid, 55411, (getPlayerStorageValue(cid, 55411))+cp)
selfSay('Seu número é '..getPlayerStorageValue(cid, 55411)..', quer comprar mais ou parar?',cid)
talkState[talkUser] = 0  
elseif(msgcontains(msg, 'parar') and talkState[talkUser] == 0) then
local npcn = math.random(15,21)
setPlayerStorageValue(cid, 2224, npcn)
if getPlayerStorageValue(cid, 55411) < getPlayerStorageValue(cid, 2224)then
selfSay('Meu número é '..getPlayerStorageValue(cid, 2224)..'.',cid)       
selfSay('Seu número final é '..getPlayerStorageValue(cid, 55411)..'.',cid)  
selfSay('Ganhei, mais sorte na proxima vez.',cid)   
talkState[talkUser] = 1
elseif getPlayerStorageValue(cid, 55411) == getPlayerStorageValue(cid, 2224) then
selfSay('Meu número é '..getPlayerStorageValue(cid, 2224)..'.',cid)       
selfSay('Seu número final é '..getPlayerStorageValue(cid, 55411)..'.',cid)  
selfSay('Empato, portanto ninguem ganha nada.',cid) 
talkState[talkUser] = 1
elseif  getPlayerStorageValue(cid, 55411) > getPlayerStorageValue(cid, 2224)  then
selfSay('Meu número é '..getPlayerStorageValue(cid, 2224)..'.',cid)       
selfSay('Seu número final é '..getPlayerStorageValue(cid, 55411)..'.',cid)  
local somag = (price_21*3)
selfSay('Você ganhou '..somag..'golds, mais os seus '..price_21..'golds de volta. Parábens !!!',cid)   
doPlayerAddMoney(cid, somag)
doPlayerAddMoney(cid, price_21)
talkState[talkUser] = 1
else
selfSay('Desculpe, mais você não possui dinheiro está aposta',cid)
end                       
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()