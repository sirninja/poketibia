-- area editavel
Oracle = {
Cities = { -- {id, 'nome', x, y, z, 'premium/free'}
{1,'Saffron', 1054, 1049, 7, 'free'},
{2,'Cerulean',1060,904,7,'free'},
{4,'Fuchsia',1122,1449,7,'free'},
{5,'Celadon',863,1036,6,'free'},
{6,'Viridian',560,1040,7,'free'},
{8,'Pewter', 572, 669, 6, 'free'},
{9,'Vermilion',1073,1238,7,'free'},
{10,'Cinnabar',634,1345,7,'free'},
},
Vocations = { -- {[id] = 'nome'}
[1] = 'Pokemon Trainer'
},
frases = {
noLevel = 'Hey garoto, estou um pouco ocupado, voce poderia pegar um dos pokemons naquela caixa pra mim?!',
hi = 'So, Your mom sent you here to talk to me about Pokemons?',
askVoc = 'Pokemons are Monster who live in our world for a long time, they are so gracious if treated right. Ppl who train pokemons are called Pokemon Trainers, do you want to become a ',
confirmVoc = 'This is a path of no return chlid, Are you sure?',
askCity = 'Where do you want to start you journey, in.',
final = 'Good luck Little Trainer!',
bye = 'Talk to me when you are ready.'
},
talkStorage = 7897,
choos = {},
citiesLiberadas = {}
}
-- fim da area editavel
local function getVocations()
local ret = ""
for id,it in pairs(Oracle.Vocations) do
if((id ~= #Oracle.Vocations - 1) and (id ~= #Oracle.Vocations)) then
ret = ret.. it ..", "
end
if(id == #Oracle.Vocations) then
ret = ret.. it .."?"
elseif(id == #Oracle.Vocations - 1) then
ret = ret.. it .." or "
end
end
return ret
end



local focuses = {}
local function isFocused(cid)
for i, v in pairs(focuses) do
if(v == cid) then
return true
end
end
return false
end

local function addFocus(cid)
if(not isFocused(cid)) then
table.insert(focuses, cid)
end
end
local function removeFocus(cid)
for i, v in pairs(focuses) do
if(v == cid) then
table.remove(focuses, i)
break
end
end
end
local function lookAtFocus()
for i, v in pairs(focuses) do
if(isPlayer(v) == TRUE) then
doNpcSetCreatureFocus(v)
return
end
end
doNpcSetCreatureFocus(0)
end

function onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
if(isFocused(cid)) then
selfSay(Oracle.frases.bye, cid)
removeFocus(cid)
end
end

function onCreatureSay(cid, type, msg)
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((msg == "hi") and not (isFocused(cid))) then
addFocus(cid)
if(getPlayerLevel(cid) > 3) then
selfSay(Oracle.frases.hi, cid)
else
selfSay(Oracle.frases.noLevel, cid)
end
setPlayerStorageValue(cid, Oracle.talkStorage, 1)
end
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((talkstate == 1) and (msg == "yes") and (isFocused(cid))) then
selfSay(" ".. Oracle.frases.askVoc .." ".. getVocations(), cid)
setPlayerStorageValue(cid, Oracle.talkStorage, 2)
end
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((talkstate == 2) and (isFocused(cid))) then
if(msg == "yes")  then
selfSay(Oracle.frases.confirmVoc, cid)
Oracle.choos.voc = 1
setPlayerStorageValue(cid, Oracle.talkStorage, 3)
end
end

talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((talkstate == 3) and (isFocused(cid)) and (msg == "yes")) then
for _,it in pairs(Oracle.Cities) do
if((isPremium(cid)) and (it[6] == "premium")) then
table.insert(Oracle.citiesLiberadas, it)
elseif(it[6] == "free") then
table.insert(Oracle.citiesLiberadas, it)
end
end
ret = ""
for id,it in pairs(Oracle.citiesLiberadas) do
if((id ~= #Oracle.citiesLiberadas - 1) and (id ~= #Oracle.citiesLiberadas)) then
ret = ret.. it[2] ..", "
elseif(id == #Oracle.citiesLiberadas) then
ret = ret.. it[2] .."?"
elseif(id == #Oracle.citiesLiberadas - 1) then
ret = ret.. it[2] .." or "
end
end
selfSay(" ".. Oracle.frases.askCity .. ret .." ", cid)
setPlayerStorageValue(cid, Oracle.talkStorage, 4)
end
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((talkstate == 4) and (isFocused(cid)))then
for id,it in pairs(Oracle.citiesLiberadas) do
if(msg == it[2]) then
Oracle.choos.city = it
break
end
end
selfSay("You will be a ".. Oracle.Vocations[Oracle.choos.voc] ..", and you will begin it on ".. Oracle.choos.city[2] ..". Okey?", cid)
setPlayerStorageValue(cid, Oracle.talkStorage, 5)
end
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((talkstate == 5) and (isFocused(cid)) and (msg == "yes")) then
selfSay(Oracle.frases.final, cid)
local goto = {x = Oracle.choos.city[3], y = Oracle.choos.city[4], z = Oracle.choos.city[5]}
doTeleportThing(cid, goto)
doPlayerSetTown(cid, Oracle.choos.city[1])
doPlayerSetVocation(cid, Oracle.choos.voc)
setPlayerStorageValue(cid, Oracle.talkStorage, -1)
choos.city = 0
choos.voc = 0
removeFocus(cid)
end
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((isFocused(cid)) and (msg == "bye") or not(isFocused(cid)) and (talkstate ~= -1) and (msg == bye)) then
selfSay(Oracle.frases.bye, cid)
setPlayerStorageValue(cid, Oracle.talkStorage, -1)
Oracle.choos.city = 0
Oracle.choos.voc = 0
removeFocus(cid)
end
end

function onPlayerCloseChannel(cid)
if(isFocused(cid)) then
selfSay(frases.bye, cid)
setPlayerStorageValue(cid, Oracle.talkStorage, -1)
removeFocus(cid)
end
end

function onThink()
for i, focus in pairs(focuses) do
if(isCreature(focus) == FALSE) then
removeFocus(focus)
else
local distance = getDistanceTo(focus) or -1
if((distance > 4) or (distance == -1)) then
selfSay(Oracle.frases.bye, cid)
removeFocus(focus)
end
end
end
lookAtFocus()
end