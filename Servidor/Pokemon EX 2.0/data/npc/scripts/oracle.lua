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
[1] = 'pokemon trainer'
},
frases = {
noLevel = 'Hey Boy, im a little busy, can you pick a pokeball in this box for me please?!',
hi = 'Then, your mom tell you to come here ?',
askVoc = 'Pokemons are monsters that live in our world a very long time,there are diferents theories abount them,but espectually, the pokemons can be very docile and amorous when they receive love and respect. So, do you want became a 'pokemon trainer'? ',
confirmVoc = 'Are you sure?',
askCity = 'Choose a city bellow that you will be citizen.',
final = 'Good Luck little boy!',
bye = 'Talk with me when you be ready.'
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
if(((msg == "hi") or (msg == "oi")) and not (isFocused(cid))) then
addFocus(cid)
if(getPlayerLevel(cid) > 3) then
selfSay(Oracle.frases.hi, cid)
else
selfSay(Oracle.frases.noLevel, cid)
end
setPlayerStorageValue(cid, Oracle.talkStorage, 1)
end
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((talkstate == 1) and ((msg == "yes") or (msg == "sim")) and (isFocused(cid))) then
selfSay(" ".. Oracle.frases.askVoc .." ".. getVocations(), cid)
setPlayerStorageValue(cid, Oracle.talkStorage, 2)
end
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((talkstate == 2) and (isFocused(cid))) then
for it = 1, #Oracle.Vocations do
if(msg == Oracle.Vocations[it]) then
selfSay(Oracle.frases.confirmVoc, cid)
Oracle.choos.voc = it
setPlayerStorageValue(cid, Oracle.talkStorage, 3)

break
end
end
end
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((talkstate == 3) and (isFocused(cid)) and ((msg == "yes") or (msg == "sim"))) then
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
ret = ret.. it[2] .." ou "
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
selfSay("Voce sera um ".. Oracle.Vocations[Oracle.choos.voc] ..", da cidade de ".. Oracle.choos.city[2] ..". Okey?", cid)
setPlayerStorageValue(cid, Oracle.talkStorage, 5)
end
talkstate = getPlayerStorageValue(cid, Oracle.talkStorage)
if((talkstate == 5) and (isFocused(cid)) and ((msg == "yes") or (msg == "sim"))) then
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
if((isFocused(cid)) and ((msg == "bye") or (msg == "Tchau")) or not(isFocused(cid)) and (talkstate ~= -1) and (msg == bye)) then
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