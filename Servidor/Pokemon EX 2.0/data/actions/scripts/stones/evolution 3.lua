local fotos = {
["Gloom"] = {fotopoke = 2420},
["Bellossom"] = {fotopoke = 10566},
}

local poken = {
["Gloom"] = {level = 18, cons = 51, vida = 1400},
["Bellossom"] = {level = 80, cons = 140, vida = 1000},
}

local pokes = {
["Gloom"] = {level = 18, evolution = "Bellossom", maxh = 1400, count = 1, stoneid = 5300, stoneid2 = 0},
}

local types = {
["Leaf"] = {itemid = 2293, "Gloom", "Bellossom"},
["Sun Stone"] = {itemid = 5300, "Bellossom", "Gloom"},
}

local pokemon = {'5300'}
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
if getCreatureName(item2.uid) == "Gloom" then
if item.itemid == 5300 then
if getPlayerLevel(cid) < 80 then
return doPlayerSendCancel(cid, "Sorry, you don't have the required level to evolve this pokemon (55).")
end
local pokeball = getPlayerSlotItem(cid, 8)
doItemSetAttribute(pokeball.uid, "poke", "This is Bellossom's pokeball. HP = [100/100]")
doItemSetAttribute(pokeball.uid, "description", "Contains a Bellossom.")
doPlayerSendTextMessage(cid, 27, "Congratulations! Your "..getCreatureName(item2.uid).." evolved into a Bellossom!")
doSendMagicEffect(topos, 18)
doTransformItem(getPlayerSlotItem(cid, 7).uid, 10566)
doSendMagicEffect(getThingPos(cid), 173)
local oldpos = getThingPos(item2.uid)
doRemoveCreature(item2.uid)
doSummonMonster(cid, "Bellossom")
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
