local focus = 0

local talk_start = 0

local target = 0

local following = false

local attacking = false

local talkState = {}

function onThingMove(creature, thing, oldpos, oldstackpos)

end

function onCreatureAppear(creature)

end

function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye sir!')
focus = 0
talk_start = 0
end
end


function onCreatureTurn(creature)

end

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function sellPokemon(cid, name, price)
local pokename = name
local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
local itemsball = getItemsInContainerById(bp.uid, 2222)
local itemsultra = getItemsInContainerById(bp.uid, 2220) 
local itemsgreat = getItemsInContainerById(bp.uid, 2651)
local itemssuper = getItemsInContainerById(bp.uid, 2653)
local itemssaffari = getItemsInContainerById(bp.uid, 2655)
for _, pok in pairs(itemsball) do
if string.lower(getItemAttribute(pok, "poke"):sub(9, findLetter(getItemAttribute(pok, "poke"), "'")-1)) == pokename then
doRemoveItem(pok, 1)
doPlayerAddMoney(cid, price)
selfSay('Wow! Thanks for this wonderful pokemon! Take your money.')
return true
end
end
for _, pok in pairs(itemsultra) do
if string.lower(getItemAttribute(pok, "poke"):sub(9, findLetter(getItemAttribute(pok, "poke"), "'")-1)) == pokename then
doRemoveItem(pok, 1)
doPlayerAddMoney(cid, price)
selfSay('Wow! Thanks for this wonderful pokemon! Take your money.')
return true
end
end
for _, pok in pairs(itemsgreat) do
if string.lower(getItemAttribute(pok, "poke"):sub(9, findLetter(getItemAttribute(pok, "poke"), "'")-1)) == pokename then
doRemoveItem(pok, 1)
doPlayerAddMoney(cid, price)
selfSay('Wow! Thanks for this wonderful pokemon! Take your money.')
return true
end
end
for _, pok in pairs(itemssuper) do
if string.lower(getItemAttribute(pok, "poke"):sub(9, findLetter(getItemAttribute(pok, "poke"), "'")-1)) == pokename then
doRemoveItem(pok, 1)
doPlayerAddMoney(cid, price)
selfSay('Wow! Thanks for this wonderful pokemon! Take your money.')
return true
end
end
for _, pok in pairs(itemssaffari) do
if string.lower(getItemAttribute(pok, "poke"):sub(9, findLetter(getItemAttribute(pok, "poke"), "'")-1)) == pokename then
doRemoveItem(pok, 1)
doPlayerAddMoney(cid, price)
selfSay('Wow! Thanks for this wonderful pokemon! Take your money.')
return true
end
end
selfSay('Hey, you dont have this pokemon! Make sure if its not fainted and it is inside your backpack!')
end

function onCreatureSay(cid, type, msg)
local msg = string.lower(msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if (msgcontains(msg, 'bye') and focus == cid) then
selfSay('See you around then!')
focus = 0
elseif (msgcontains(msg, "let's fight") and focus == cid) then
elseif (msgcontains(msg, "i need your help") and focus == cid) then
elseif (msgcontains(msg, "i choose you") and focus == cid) then
elseif (msgcontains(msg, "thanks for helping") and focus == cid) then
elseif (msgcontains(msg, "it's battle time") and focus == cid) then
elseif (msgcontains(msg, "excellent work") and focus == cid) then
elseif (msgcontains(msg, "go,") and focus == cid) then
elseif (msgcontains(msg, "you were great") and focus == cid) then
elseif (msgcontains(msg, "well done") and focus == cid) then
elseif (msgcontains(msg, "come back") and focus == cid) then
elseif (msgcontains(msg, "let's do it") and focus == cid) then
elseif (msgcontains(msg, 'hi') and (focus == 0) and (focus ~= cid) and (getDistanceToCreature(cid) <= 4)) then
selfSay('Welcome to my store! I buy pokemons of all species, just tell me the name of the pokemon you want to sell.')
focus = cid
talkState[talkUser] = 1
talk_start = os.clock()
elseif ((msgcontains(msg, 'rattata') or msgcontains(msg, 'magikarp') or msgcontains(msg, 'caterpie') or msgcontains(msg, 'weedle')) and talkState[talkUser] == 1 and focus == cid) then
selfSay('I dont buy such a common pokemon!')
elseif (msgcontains(msg, 'no') and talkState[talkUser] ~= 1 and focus == cid) then
selfSay('Well, then what pokemon would you like to sell?')
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'bulbasaur') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a bulbasaur? I can buy it for 3000 dollars.')
talkState[talkUser] = "bulbasaur"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "bulbasaur" and focus == cid) then
sellPokemon(cid, "bulbasaur", 300000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'ivysaur') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a ivysaur? I can buy it for 5500 dollars.')
talkState[talkUser] = "ivysaur"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "ivysaur" and focus == cid) then
sellPokemon(cid, "ivysaur", 550000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'venusaur') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me an venusaur? I can buy it for 13500 dollars.')
talkState[talkUser] = "venusaur"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "venusaur" and focus == cid) then
sellPokemon(cid, "venusaur", 1350000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'charmander') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a charmander? I can buy it for 3000 dollars.')
talkState[talkUser] = "charmander"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "charmander" and focus == cid) then
sellPokemon(cid, "charmander", 300000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'charmeleon') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a charmeleon? I can buy it for 5500 dollars.')
talkState[talkUser] = "charmeleon"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "charmeleon" and focus == cid) then
sellPokemon(cid, "charmeleon", 550000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'charizard') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a charizard? I can buy it for 13500 dollars.')
talkState[talkUser] = "charizard"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "charizard" and focus == cid) then
sellPokemon(cid, "charizard", 1350000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'squirtle') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a squirtle? I can buy it for 3000 dollars.')
talkState[talkUser] = "squirtle"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "squirtle" and focus == cid) then
sellPokemon(cid, "squirtle", 300000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'wartortle') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a wartortle? I can buy it for 5500 dollars.')
talkState[talkUser] = "wartortle"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "wartortle" and focus == cid) then
sellPokemon(cid, "wartortle", 550000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'blastoise') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a blastoise? I can buy it for 13500 dollars.')
talkState[talkUser] = "blastoise"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "blastoise" and focus == cid) then
sellPokemon(cid, "blastoise", 1350000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'kakuna') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a kakuna? I can buy it for 250 dollars.')
talkState[talkUser] = "kakuna"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "kakuna" and focus == cid) then
sellPokemon(cid, "kakuna", 25000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'beedrill') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a beedrill? I can buy it for 2500 dollars.')
talkState[talkUser] = "beedrill"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "beedrill" and focus == cid) then
sellPokemon(cid, "beedrill", 250000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'metapod') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a metapod? I can buy it for 250 dollars.')
talkState[talkUser] = "metapod"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "metapod" and focus == cid) then
sellPokemon(cid, "metapod", 25000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'butterfree') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a butterfree? I can buy it for 2500 dollars.')
talkState[talkUser] = "butterfree"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "butterfree" and focus == cid) then
sellPokemon(cid, "butterfree", 250000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'pidgey') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a pidgey? I can buy it for 250 dollars.')
talkState[talkUser] = "pidgey"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "pidgey" and focus == cid) then
sellPokemon(cid, "pidgey", 5000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'pidgeotto') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a pidgeotto? I can buy it for 1500 dollars.')
talkState[talkUser] = "pidgeotto"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "pidgeotto" and focus == cid) then
sellPokemon(cid, "pidgeotto", 150000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'pidgeot') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a pidgeot? I can buy it for 8000 dollars.')
talkState[talkUser] = "pidgeot"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "pidgeot" and focus == cid) then
sellPokemon(cid, "pidgeot", 800000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'raticate') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a raticate? I can buy it for 1200 dollars.')
talkState[talkUser] = "raticate"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "raticate" and focus == cid) then
sellPokemon(cid, "raticate", 120000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'spearow') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a spearow? I can buy it for 150 dollars.')
talkState[talkUser] = "spearow"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "spearow" and focus == cid) then
sellPokemon(cid, "spearow", 15000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'fearow') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a fearow? I can buy it for 6000 dollars.')
talkState[talkUser] = "fearow"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "fearow" and focus == cid) then
sellPokemon(cid, "fearow", 600000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'ekans') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a ekans? I can buy it for 450 dollars.')
talkState[talkUser] = "ekans"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "ekans" and focus == cid) then
sellPokemon(cid, "ekans", 45000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'arbok') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a arbok? I can buy it for 2500 dollars.')
talkState[talkUser] = "arbok"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "arbok" and focus == cid) then
sellPokemon(cid, "arbok", 250000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'pikachu') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a pikachu? I can buy it for 4000 dollars.')
talkState[talkUser] = "pikachu"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "pikachu" and focus == cid) then
sellPokemon(cid, "pikachu", 400000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'raichu') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a raichu? I can buy it for 8000 dollars.')
talkState[talkUser] = "raichu"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "raichu" and focus == cid) then
sellPokemon(cid, "raichu", 800000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'sandshrew') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me an sandshrew? I can buy it for 850 dollars.')
talkState[talkUser] = "sandshrew"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "sandshrew" and focus == cid) then
sellPokemon(cid, "sandshrew", 85000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'sandslash') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a sandslash? I can buy it for 7000 dollars.')
talkState[talkUser] = "sandslash"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "sandslash" and focus == cid) then
sellPokemon(cid, "sandslash", 700000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'nidorina') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a nidorina? I can buy it for 2000 dollars.')
talkState[talkUser] = "nidorina"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "nidorina" and focus == cid) then
sellPokemon(cid, "nidorina", 200000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'nidoqueen') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a nidoqueen? I can buy it for 8000 dollars.')
talkState[talkUser] = "nidoqueen"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "nidoqueen" and focus == cid) then
sellPokemon(cid, "nidoqueen", 800000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'nidorino') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a nidorino? I can buy it for 2000 dollars.')
talkState[talkUser] = "nidorino"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "nidorino" and focus == cid) then
sellPokemon(cid, "nidorino", 200000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'nidoking') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a nidoking? I can buy it for 8000 dollars.')
talkState[talkUser] = "nidoking"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "nidoking" and focus == cid) then
sellPokemon(cid, "nidoking", 800000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'clefairy') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me an clefairy? I can buy it for 3000 dollars.')
talkState[talkUser] = "clefairy"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "clefairy" and focus == cid) then
sellPokemon(cid, "clefairy", 300000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'clefable') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a clefable? I can buy it for 6000 dollars.')
talkState[talkUser] = "clefable"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "clefable" and focus == cid) then
sellPokemon(cid, "clefable", 600000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'vulpix') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a vulpix? I can buy it for 1200 dollars.')
talkState[talkUser] = "vulpix"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "vulpix" and focus == cid) then
sellPokemon(cid, "vulpix", 120000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'ninetales') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a ninetales? I can buy it for 8500 dollars.')
talkState[talkUser] = "ninetales"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "ninetales" and focus == cid) then
sellPokemon(cid, "ninetales", 850000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'jigglypuff') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me an jigglypuff? I can buy it for 1500 dollars.')
talkState[talkUser] = "jigglypuff"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "jigglypuff" and focus == cid) then
sellPokemon(cid, "jigglypuff", 150000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'wigglytuff') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a wigglytuff? I can buy it for 5000 dollars.')
talkState[talkUser] = "wigglytuff"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "wigglytuff" and focus == cid) then
sellPokemon(cid, "wigglytuff", 500000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'zubat') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a zubat? I can buy it for 120 dollars.')
talkState[talkUser] = "zubat"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "zubat" and focus == cid) then
sellPokemon(cid, "zubat", 12000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'golbat') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a golbat? I can buy it for 2000 dollars.')
talkState[talkUser] = "golbat"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "golbat" and focus == cid) then
sellPokemon(cid, "golbat", 200000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'oddish') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a oddish? I can buy it for 80 dollars.')
talkState[talkUser] = "oddish"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "oddish" and focus == cid) then
sellPokemon(cid, "oddish", 8000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'gloom') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a gloom? I can buy it for 2000 dollars.')
talkState[talkUser] = "gloom"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "gloom" and focus == cid) then
sellPokemon(cid, "gloom", 200000)
talkState[talkUser] = 1 
----------------------------------------------------------------
elseif (msgcontains(msg, 'vileplume') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a vileplume? I can buy it for 6500 dollars.')
talkState[talkUser] = "vileplume"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "vileplume" and focus == cid) then
sellPokemon(cid, "vileplume", 650000)
talkState[talkUser] = 1 
----------------------------------------------------------------
elseif (msgcontains(msg, 'paras') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a paras? I can buy it for 50 dollars.')
talkState[talkUser] = "paras"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "paras" and focus == cid) then
sellPokemon(cid, "paras", 5000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'parasect') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a parasect? I can buy it for 2500 dollars.')
talkState[talkUser] = "parasect"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "parasect" and focus == cid) then
sellPokemon(cid, "parasect", 250000)
talkState[talkUser] = 1
----------------------------------------------------------------
elseif (msgcontains(msg, 'venonat') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a venonat? I can buy it for 1000 dollars.')
talkState[talkUser] = "venonat"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "venonat" and focus == cid) then
sellPokemon(cid, "venonat", 100000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'venomoth') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a venomoth? I can buy it for 4000 dollars.')
talkState[talkUser] = "venomoth"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "venomoth" and focus == cid) then
sellPokemon(cid, "venomoth", 400000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'diglett') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a diglett? I can buy it for 400 dollars.')
talkState[talkUser] = "diglett"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "diglett" and focus == cid) then
sellPokemon(cid, "diglett", 40000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'dugtrio') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a dugtrio? I can buy it for 4000 dollars.')
talkState[talkUser] = "dugtrio"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "dugtrio" and focus == cid) then
sellPokemon(cid, "dugtrio", 400000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'meowth') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a meowth? I can buy it for 800 dollars.')
talkState[talkUser] = "meowth"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "meowth" and focus == cid) then
sellPokemon(cid, "meowth", 80000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'persian') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a persian? I can buy it for 4000 dollars.')
talkState[talkUser] = "persian"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "persian" and focus == cid) then
sellPokemon(cid, "persian", 400000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'psyduck') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a psyduck? I can buy it for 1000 dollars.')
talkState[talkUser] = "psyduck"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "psyduck" and focus == cid) then
sellPokemon(cid, "psyduck", 100000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'golduck') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a golduck? I can buy it for 8000 dollars.')
talkState[talkUser] = "golduck"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "golduck" and focus == cid) then
sellPokemon(cid, "golduck", 800000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'mankey') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a mankey? I can buy it for 600 dollars.')
talkState[talkUser] = "mankey"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "mankey" and focus == cid) then
sellPokemon(cid, "mankey", 60000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'primeape') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a primeape? I can buy it for 5000 dollars.')
talkState[talkUser] = "primeape"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "primeape" and focus == cid) then
sellPokemon(cid, "primeape", 500000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'growlithe') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a growlithe? I can buy it for 3500 dollars.')
talkState[talkUser] = "growlithe"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "growlithe" and focus == cid) then
sellPokemon(cid, "growlithe", 350000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'arcanine') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a arcanine? I can buy it for 10000 dollars.')
talkState[talkUser] = "arcanine"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "arcanine" and focus == cid) then
sellPokemon(cid, "arcanine", 1000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'poliwag') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a poliwag? I can buy it for 110 dollars.')
talkState[talkUser] = "poliwag"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "poliwag" and focus == cid) then
sellPokemon(cid, "poliwag", 11000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'poliwhirl') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a poliwhirl? I can buy it for 2500 dollars.')
talkState[talkUser] = "poliwhirl"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "poliwhirl" and focus == cid) then
sellPokemon(cid, "poliwhirl", 250000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'poliwrath') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a poliwrath? I can buy it for 8000 dollars.')
talkState[talkUser] = "poliwrath"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "poliwrath" and focus == cid) then
sellPokemon(cid, "poliwrath", 800000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'abra') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a abra? I can buy it for 800 dollars.')
talkState[talkUser] = "abra"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "abra" and focus == cid) then
sellPokemon(cid, "abra", 80000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'kadabra') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a kadabra? I can buy it for 6000 dollars.')
talkState[talkUser] = "kadabra"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "kadabra" and focus == cid) then
sellPokemon(cid, "kadabra", 600000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'alakazam') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a alakazam? I can buy it for 15000 dollars.')
talkState[talkUser] = "alakazam"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "alakazam" and focus == cid) then
sellPokemon(cid, "alakazam", 1500000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'machop') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a machop? I can buy it for 850 dollars.')
talkState[talkUser] = "machop"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "machop" and focus == cid) then
sellPokemon(cid, "machop", 85000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'machoke') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a machoke? I can buy it for 5000 dollars.')
talkState[talkUser] = "machoke"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "machoke" and focus == cid) then
sellPokemon(cid, "machoke", 500000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'machamp') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a machamp? I can buy it for 10000 dollars.')
talkState[talkUser] = "machamp"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "machamp" and focus == cid) then
sellPokemon(cid, "machamp", 1000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'bellsprout') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a bellsprout? I can buy it for 100 dollars.')
talkState[talkUser] = "bellsprout"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "bellsprout" and focus == cid) then
sellPokemon(cid, "bellsprout", 10000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'weepinbell') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a weepinbell? I can buy it for 2000 dollars.')
talkState[talkUser] = "weepinbell"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "weepinbell" and focus == cid) then
sellPokemon(cid, "weepinbell", 200000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'victreebel') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a victreebel? I can buy it for 6500 dollars.')
talkState[talkUser] = "victreebel"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "victreebel" and focus == cid) then
sellPokemon(cid, "victreebel", 650000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'tentacool') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a tentacool? I can buy it for 350 dollars.')
talkState[talkUser] = "tentacool"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "tentacool" and focus == cid) then
sellPokemon(cid, "tentacool", 35000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'tentacruel') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a tentacruel? I can buy it for 6000 dollars.')
talkState[talkUser] = "tentacruel"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "tentacruel" and focus == cid) then
sellPokemon(cid, "tentacruel", 600000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'geodude') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a geodude? I can buy it for 500 dollars.')
talkState[talkUser] = "geodude"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "geodude" and focus == cid) then
sellPokemon(cid, "geodude", 50000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'graveler') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a graveler? I can buy it for 2500 dollars.')
talkState[talkUser] = "graveler"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "graveler" and focus == cid) then
sellPokemon(cid, "graveler", 250000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'golem') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a golem? I can buy it for 8000 dollars.')
talkState[talkUser] = "golem"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "golem" and focus == cid) then
sellPokemon(cid, "golem", 800000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'ponyta') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a ponyta? I can buy it for 850 dollars.')
talkState[talkUser] = "ponyta"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "ponyta" and focus == cid) then
sellPokemon(cid, "ponyta", 85000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'rapidash') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a rapidash? I can buy it for 4500 dollars.')
talkState[talkUser] = "rapidash"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "rapidash" and focus == cid) then
sellPokemon(cid, "rapidash", 450000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'slowpoke') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a slowpoke? I can buy it for 850 dollars.')
talkState[talkUser] = "slowpoke"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "slowpoke" and focus == cid) then
sellPokemon(cid, "slowpoke", 85000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'slowbro') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a slowbro? I can buy it for 6500 dollars.')
talkState[talkUser] = "slowbro"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "slowbro" and focus == cid) then
sellPokemon(cid, "slowbro", 650000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'magnemite') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a magnemite? I can buy it for 600 dollars.')
talkState[talkUser] = "magnemite"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "magnemite" and focus == cid) then
sellPokemon(cid, "magnemite", 60000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'magneton') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a magneton? I can buy it for 3200 dollars.')
talkState[talkUser] = "magneton"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "magneton" and focus == cid) then
sellPokemon(cid, "magneton", 320000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'farfetchd') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a farfetch´d? I can buy it for 10000 dollars.')
talkState[talkUser] = "farfetchd"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "farfetchd" and focus == cid) then
sellPokemon(cid, "farfetchd", 1000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'doduo') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a doduo? I can buy it for 650 dollars.')
talkState[talkUser] = "doduo"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "doduo" and focus == cid) then
sellPokemon(cid, "doduo", 65000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'dodrio') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a dodrio? I can buy it for 3200 dollars.')
talkState[talkUser] = "dodrio"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "dodrio" and focus == cid) then
sellPokemon(cid, "dodrio", 320000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'seel') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a seel? I can buy it for 2000 dollars.')
talkState[talkUser] = "seel"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "seel" and focus == cid) then
sellPokemon(cid, "seel", 200000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'dewgong') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a dewgong? I can buy it for 8000 dollars.')
talkState[talkUser] = "dewgong"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "dewgong" and focus == cid) then
sellPokemon(cid, "dewgong", 800000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'grimer') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a grimer? I can buy it for 600 dollars.')
talkState[talkUser] = "grimer"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "grimer" and focus == cid) then
sellPokemon(cid, "grimer", 60000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'muk') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a muk? I can buy it for 2200 dollars.')
talkState[talkUser] = "muk"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "muk" and focus == cid) then
sellPokemon(cid, "muk", 220000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'shellder') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a shellder? I can buy it for 600 dollars.')
talkState[talkUser] = "shellder"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "shellder" and focus == cid) then
sellPokemon(cid, "shellder", 60000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'cloyster') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a cloyster? I can buy it for 5500 dollars.')
talkState[talkUser] = "cloyster"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "cloyster" and focus == cid) then
sellPokemon(cid, "cloyster", 550000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'gastly') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a gastly? I can buy it for 3500 dollars.')
talkState[talkUser] = "gastly"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "gastly" and focus == cid) then
sellPokemon(cid, "gastly", 350000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'haunter') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a haunter? I can buy it for 7000 dollars.')
talkState[talkUser] = "haunter"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "haunter" and focus == cid) then
sellPokemon(cid, "haunter", 700000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'gengar') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a gengar? I can buy it for 15000 dollars.')
talkState[talkUser] = "gengar"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "gengar" and focus == cid) then
sellPokemon(cid, "gengar", 1500000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'onix') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a onix? I can buy it for 4000 dollars.')
talkState[talkUser] = "onix"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "onix" and focus == cid) then
sellPokemon(cid, "onix", 400000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'drowzee') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a drowzee? I can buy it for 1100 dollars.')
talkState[talkUser] = "drowzee"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "drowzee" and focus == cid) then
sellPokemon(cid, "drowzee", 110000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'hypno') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a hypno? I can buy it for 8000 dollars.')
talkState[talkUser] = "hypno"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "hypno" and focus == cid) then
sellPokemon(cid, "hypno", 800000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'krabby') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a krabby? I can buy it for 135 dollars.')
talkState[talkUser] = "krabby"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "krabby" and focus == cid) then
sellPokemon(cid, "krabby", 13500)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'kingler') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a kingler? I can buy it for 4000 dollars.')
talkState[talkUser] = "kingler"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "kingler" and focus == cid) then
sellPokemon(cid, "kingler", 400000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'voltorb') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a voltorb? I can buy it for 450 dollars.')
talkState[talkUser] = "voltorb"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "voltorb" and focus == cid) then
sellPokemon(cid, "voltorb", 45000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'electrode') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a electrode? I can buy it for 3000 dollars.')
talkState[talkUser] = "electrode"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "electrode" and focus == cid) then
sellPokemon(cid, "electrode", 300000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'exeggcute') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a exeggcute? I can buy it for 320 dollars.')
talkState[talkUser] = "exeggcute"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "exeggcute" and focus == cid) then
sellPokemon(cid, "exeggcute", 32000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'exeggcutor') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a exeggcutor? I can buy it for 7000 dollars.')
talkState[talkUser] = "exeggcutor"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "exeggcutor" and focus == cid) then
sellPokemon(cid, "exeggcutor", 700000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'cubone') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a cubone? I can buy it for 1000 dollars.')
talkState[talkUser] = "cubone"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "cubone" and focus == cid) then
sellPokemon(cid, "cubone", 100000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'marowak') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a marowak? I can buy it for 5000 dollars.')
talkState[talkUser] = "marowak"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "marowak" and focus == cid) then
sellPokemon(cid, "marowak", 500000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'hitmonlee') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a hitmonlee? I can buy it for 8000 dollars.')
talkState[talkUser] = "hitmonlee"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "hitmonlee" and focus == cid) then
sellPokemon(cid, "hitmonlee", 800000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'hitmonchan') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a hitmonchan? I can buy it for 8000 dollars.')
talkState[talkUser] = "hitmonchan"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "hitmonchan" and focus == cid) then
sellPokemon(cid, "hitmonchan", 800000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'lickitung') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a lickitung? I can buy it for 15000 dollars.')
talkState[talkUser] = "lickitung"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "lickitung" and focus == cid) then
sellPokemon(cid, "lickitung", 1500000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'koffing') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a koffing? I can buy it for 500 dollars.')
talkState[talkUser] = "koffing"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "koffing" and focus == cid) then
sellPokemon(cid, "koffing", 50000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'weezing') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a weezing? I can buy it for 2200 dollars.')
talkState[talkUser] = "weezing"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "weezing" and focus == cid) then
sellPokemon(cid, "weezing", 220000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'rhyhorn') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a rhyhorn? I can buy it for 1100 dollars.')
talkState[talkUser] = "rhyhorn"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "rhyhorn" and focus == cid) then
sellPokemon(cid, "rhyhorn", 110000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'rhydon') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a rhydon? I can buy it for 6000 dollars.')
talkState[talkUser] = "rhydon"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "rhydon" and focus == cid) then
sellPokemon(cid, "rhydon", 600000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'chansey') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a chansey? I can buy it for 40000 dollars.')
talkState[talkUser] = "chansey"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "chansey" and focus == cid) then
sellPokemon(cid, "chansey", 4000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'tangela') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a tangela? I can buy it for 4000 dollars.')
talkState[talkUser] = "tangela"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "tangela" and focus == cid) then
sellPokemon(cid, "tangela", 400000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'kangaskhan') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a kangaskhan? I can buy it for 40000 dollars.')
talkState[talkUser] = "kangaskhan"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "kangaskhan" and focus == cid) then
sellPokemon(cid, "kangaskhan", 4000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'horsea') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a horsea? I can buy it for 200 dollars.')
talkState[talkUser] = "horsea"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "horsea" and focus == cid) then
sellPokemon(cid, "horsea", 20000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'seadra') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a seadra? I can buy it for 4000 dollars.')
talkState[talkUser] = "seadra"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "seadra" and focus == cid) then
sellPokemon(cid, "seadra", 400000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'goldeen') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a goldeen? I can buy it for 100 dollars.')
talkState[talkUser] = "goldeen"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "goldeen" and focus == cid) then
sellPokemon(cid, "goldeen", 10000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'seaking') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a seaking? I can buy it for 3000 dollars.')
talkState[talkUser] = "seaking"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "seaking" and focus == cid) then
sellPokemon(cid, "seaking", 300000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'staryu') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a staryu? I can buy it for 600 dollars.')
talkState[talkUser] = "staryu"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "staryu" and focus == cid) then
sellPokemon(cid, "staryu", 60000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'starmie') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a starmie? I can buy it for 4000 dollars.')
talkState[talkUser] = "starmie"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "starmie" and focus == cid) then
sellPokemon(cid, "starmie", 400000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'mrmime') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a Mr.Mime? I can buy it for 15000 dollars.')
talkState[talkUser] = "mrmime"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "mrmime" and focus == cid) then
sellPokemon(cid, "mrmime", 1500000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'scyther') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a scyther? I can buy it for 110000 dollars.')
talkState[talkUser] = "scyther"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "scyther" and focus == cid) then
sellPokemon(cid, "scyther", 11000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'jynx') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a jynx? I can buy it for 40000 dollars.')
talkState[talkUser] = "jynx"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "jynx" and focus == cid) then
sellPokemon(cid, "jynx", 4000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'electabuzz') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a electabuzz? I can buy it for 110000 dollars.')
talkState[talkUser] = "electabuzz"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "electabuzz" and focus == cid) then
sellPokemon(cid, "electabuzz", 11000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'magmar') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a magmar? I can buy it for 110000 dollars.')
talkState[talkUser] = "magmar"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "magmar" and focus == cid) then
sellPokemon(cid, "magmar", 11000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'pinsir') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a pinsir? I can buy it for 4000 dollars.')
talkState[talkUser] = "pinsir"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "pinsir" and focus == cid) then
sellPokemon(cid, "pinsir", 400000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'tauros') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a tauros? I can buy it for 2500 dollars.')
talkState[talkUser] = "tauros"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "tauros" and focus == cid) then
sellPokemon(cid, "tauros", 250000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'gyarados') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a gyarados? I can buy it for 40000 dollars.')
talkState[talkUser] = "gyarados"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "gyarados" and focus == cid) then
sellPokemon(cid, "gyarados", 4000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'lapras') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a lapras? I can buy it for 110000 dollars.')
talkState[talkUser] = "lapras"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "lapras" and focus == cid) then
sellPokemon(cid, "lapras", 11000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'ditto') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a ditto? I can buy it for 70000 dollars.')
talkState[talkUser] = "ditto"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "ditto" and focus == cid) then
sellPokemon(cid, "ditto", 7000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'eevee') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a eevee? I can buy it for 45000 dollars.')
talkState[talkUser] = "eevee"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "eevee" and focus == cid) then
sellPokemon(cid, "eevee", 4500000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'vaporeon') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a vaporeon? I can buy it for 50000 dollars.')
talkState[talkUser] = "vaporeon"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "vaporeon" and focus == cid) then
sellPokemon(cid, "vaporeon", 5000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'jolteon') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a jolteon? I can buy it for 50000 dollars.')
talkState[talkUser] = "jolteon"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "jolteon" and focus == cid) then
sellPokemon(cid, "jolteon", 5000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'flareon') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a flareon? I can buy it for 50000 dollars.')
talkState[talkUser] = "flareon"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "flareon" and focus == cid) then
sellPokemon(cid, "flareon", 5000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'porygon') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a porygon? I can buy it for 60000 dollars.')
talkState[talkUser] = "porygon"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "porygon" and focus == cid) then
sellPokemon(cid, "porygon", 6000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'omanyte') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a omanyte? I can buy it for 18000 dollars.')
talkState[talkUser] = "omanyte"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "omanyte" and focus == cid) then
sellPokemon(cid, "omanyte", 1800000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'omastar') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a omastar? I can buy it for 50000 dollars.')
talkState[talkUser] = "omastar"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "omastar" and focus == cid) then
sellPokemon(cid, "omastar", 5000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'kabuto') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a kabuto? I can buy it for 18000 dollars.')
talkState[talkUser] = "kabuto"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "kabuto" and focus == cid) then
sellPokemon(cid, "kabuto", 1800000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'kabutops') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a kabutops? I can buy it for 50000 dollars.')
talkState[talkUser] = "kabutops"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "kabutops" and focus == cid) then
sellPokemon(cid, "kabutops", 5000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'aerodactyl') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a aerodactyl? I can buy it for 500000 dollars.')
talkState[talkUser] = "aerodactyl"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "aerodactyl" and focus == cid) then
sellPokemon(cid, "aerodactyl", 50000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'snorlax') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a snorlax? I can buy it for 150000 dollars.')
talkState[talkUser] = "snorlax"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "snorlax" and focus == cid) then
sellPokemon(cid, "snorlax", 15000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'dratini') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a dratini? I can buy it for 15000 dollars.')
talkState[talkUser] = "dratini"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "dratini" and focus == cid) then
sellPokemon(cid, "dratini", 1500000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'dragonair') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a dragonair? I can buy it for 50000 dollars.')
talkState[talkUser] = "dragonair"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "dragonair" and focus == cid) then
sellPokemon(cid, "dragonair", 5000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
elseif (msgcontains(msg, 'dragonite') and talkState[talkUser] == 1 and focus == cid) then
selfSay('Are you sure you want to sell me a dragonite? I can buy it for 120000 dollars.')
talkState[talkUser] = "dragonite"
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == "dragonite" and focus == cid) then
sellPokemon(cid, "dragonite", 12000000)
talkState[talkUser] = 1  
----------------------------------------------------------------
end
end
 
function onThink()
if focus == 0 then
selfTurn(1)
else
argx, argy, argz = selfGetPosition()
dir = getDirectionTo({x=argx,y=argy,z=argz}, getThingPos(focus))
    if dir == 7 then
    dir = 0
    elseif dir == 6 then
    dir = 3
    elseif dir == 5 then
    dir = 1
    elseif dir == 4 then
    dir = 3
    end
selfTurn(dir)
end

if (os.clock() - talk_start) > 59 then
if focus ~= 0 then
selfSay('We have been talking for too much time!')
focus = 0
end
end

if focus ~= 0 then
a, b, c = selfGetPosition()
if c ~= getThingPos(focus).z then
focus = 0
end
end

if focus ~= 0 then
if getDistanceToCreature(focus) > 4 then
selfSay('Come back to sell me pokemons!')
focus = 0
end
end

return true
end