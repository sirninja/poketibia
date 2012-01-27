local fotos = {
["Poliwag"] = {fotopoke = 2436},
["Poliwhirl"] = {fotopoke = 2437},
["Poliwrath"] = {fotopoke = 2438},
["Politoed"] = {fotopoke = 10620},
}

local poken = {
["Poliwag"] = {level = 5, cons = 20, vida = 400},
["Poliwhirl"] = {level = 20, cons = 44, vida = 1200},
["Poliwrath"] = {level = 65, cons = 138, vida = 4400},
["Politoed"] = {level = 80, cons = 140, vida = 1000},
}

local pokes = {
["Poliwag"] = {level = 65, evolution = "Poliwhirl", maxh = 1400, count = 1, stoneid = 2292, stoneid2 = 0},
["Poliwhirl"] = {level = 65, evolution = "Poliwrath", maxh = 1400, count = 1, stoneid = 2292, stoneid2 = 2315},
}

local types = {
["Water"] = {itemid = 2292, "Tododile", "Croconaw", "Chinchou", "Marill", "Remoraid", "Wooper", "Seadra", "Squirtle", "Wartortle", "Horsea", "Goldeen", "Magikarp", "Shiny Magikarp", "Psyduck", "Poliwag", "Poliwhirl", "Tentacool", "Krabby", "Staryu", "Omanyte", "Eevee"},
["King's Rock"] = {itemid = 5296, "Poliwhirl", "Politoed"},
}

local pokemon = {'5296'}
function onUse(cid, item, frompos, item2, topos)
if not isMonster(item2.uid) then
return true
end
if not isPlayer(getCreatureMaster(item2.uid)) or getCreatureMaster(item2.uid) ~= cid then
doPlayerSendCancel(cid, "You can only use stones on pokemons you own.")
return true
end
for i,x in pairs(types) do
if getPlayerSlotItem(cid, 7).itemid ~= fotos[getCreatureName(item2.uid)].fotopoke then
return doPlayerSendCancel(cid, "Please, keep your pokemon's ball at the right place during evolution!")
end
if item.itemid == x.itemid then
if isPlayerSummon(cid, item2.uid) then
if table.find(x, getCreatureName(item2.uid)) then
if getCreatureName(item2.uid) == "Poliwhirl" then
if item.itemid == 5296 then
if getPlayerLevel(cid) < 55 then
return doPlayerSendCancel(cid, "Sorry, you don't have the required level to evolve this pokemon (55).")
end
local pokeball = getPlayerSlotItem(cid, 8)
doItemSetAttribute(pokeball.uid, "poke", "This is Politoed's pokeball. HP = [100/100]")
doItemSetAttribute(pokeball.uid, "description", "Contains a Politoed.")
doPlayerSendTextMessage(cid, 27, "Congratulations! Your "..getCreatureName(item2.uid).." evolved into a Politoed!")
doSendMagicEffect(topos, 18)
doTransformItem(getPlayerSlotItem(cid, 7).uid, 10620)
doSendMagicEffect(getThingPos(cid), 173)
local oldpos = getThingPos(item2.uid)
doRemoveCreature(item2.uid)
doSummonMonster(cid, "Politoed")
local pk = getCreatureSummons(cid)[1]
registerCreatureEvent(pk, "DiePoke")
registerCreatureEvent(pk, "Exp")
doTeleportThing(pk, oldpos, false)
doCreatureSetLookDir(pk, 2)
setCreatureMaxHealth(pk, getCreatureMaxHealth(pk) + (poken[getCreatureName(pk)].cons * getPlayerLevel(cid)))
doCreatureAddHealth(pk, getCreatureMaxHealth(pk))
setPlayerStorageValue(cid, 2, 0)
doPlayerRemoveItem(cid, item.itemid, 1)
end





local i = getCreatureName(getCreatureSummons(cid)[1])
if not string.find(getPlayerStorageValue(cid, 54842), ""..i..",") then
doPlayerAddSoul(cid, 1)
setPlayerStorageValue(cid, 54842, getPlayerStorageValue(cid, 54842)..""..i..", ")
end
return true
end

local count = pokes[getCreatureName(item2.uid)].count
local stnid = pokes[getCreatureName(item2.uid)].stoneid
local stnid2 = pokes[getCreatureName(item2.uid)].stoneid2
local evo = pokes[getCreatureName(item2.uid)].evolution
local levell = pokes[getCreatureName(item2.uid)].level
if stnid2 > 1 and getPlayerItemCount(cid, stnid2) < count then
return doPlayerSendCancel(cid, "You need at least one "..getItemNameById(stnid).." and one "..getItemNameById(stnid2).." to evolve this pokemon!")
end
if stnid2 > 1 and getPlayerItemCount(cid, stnid) < count then
return doPlayerSendCancel(cid, "You need at least one "..getItemNameById(stnid).." and one "..getItemNameById(stnid2).." to evolve this pokemon!")
end
if getPlayerItemCount(cid, stnid) < count then
return doPlayerSendCancel(cid, "You need at least "..count.." "..getItemNameById(stnid).."s to evolve this pokemon!")
end
if getPlayerLevel(cid) < pokes[getCreatureName(item2.uid)].level then
return doPlayerSendCancel(cid, "Sorry, you don't have the required level to evolve this pokemon ("..levell..").")
end
local owner = getCreatureMaster(item2.uid)
local pokeball = getPlayerSlotItem(cid, 8)
local description = "Contains a "..evo.."."

local nas = {
["%%pokename"] = pokes[getCreatureName(item2.uid)].evolution
}
for i,x in pairs(nas) do
if description:find(i) then
description = description:gsub(i, x)
end
end
local slo = pokes[getCreatureName(item2.uid)].maxh
local sle = pokes[getCreatureName(item2.uid)].evolution

doItemSetAttribute(pokeball.uid, "poke", "This is "..evo.."'s pokeball. HP = ["..pokes[getCreatureName(item2.uid)].maxh.."/"..pokes[getCreatureName(item2.uid)].maxh.."]")
doItemSetAttribute(pokeball.uid, "description", description)
doPlayerSendTextMessage(cid, 27, "Congratulations! Your "..getCreatureName(item2.uid).." evolved into a "..evo.."!")
doSendMagicEffect(topos, 18)
doTransformItem(getPlayerSlotItem(cid, 7).uid, fotos[sle].fotopoke)
doSendMagicEffect(getThingPos(cid), 173)
local oldpos = getThingPos(item2.uid)
doRemoveCreature(item2.uid)
doSummonMonster(cid, sle)
local pk = getCreatureSummons(cid)[1]
registerCreatureEvent(pk, "DiePoke")
registerCreatureEvent(pk, "Exp")
doTeleportThing(pk, oldpos, false)
doCreatureSetLookDir(pk, 2)
setCreatureMaxHealth(pk, slo)
doCreatureAddHealth(pk, slo)
setCreatureMaxHealth(pk, getCreatureMaxHealth(pk) + (poken[getCreatureName(pk)].cons * getPlayerLevel(cid)))
doCreatureAddHealth(pk, getCreatureMaxHealth(pk))
doPlayerRemoveItem(cid, stnid, count)
doPlayerRemoveItem(cid, stnid2, count)
setPlayerStorageValue(cid, 2, 0)
local i = getCreatureName(getCreatureSummons(cid)[1])
if not string.find(getPlayerStorageValue(cid, 54842), ""..i..",") then
doPlayerAddSoul(cid, 1)
setPlayerStorageValue(cid, 54842, getPlayerStorageValue(cid, 54842)..""..i..", ")
end
break
else
return doPlayerSendCancel(cid, "Sorry, this is not the required stone to evolve this pokemon!")
end
end
end
end
return TRUE
end
