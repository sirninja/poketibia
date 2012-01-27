local poke = {'Abra', 'Kadabra', 'Alakazam', 'Drowzee', 'Hypno', 'Mr.mime', 'Porygon'}
local etele = 9499
local cdtele = 1800
function onSay(cid, words, param)

if #getCreatureSummons(cid) == 0 then
doPlayerSendCancel(cid, "You need a right pokemon to use teleport.")
return true
end
if not isInArray(poke, getCreatureName(getCreatureSummons(cid)[1])) then
doPlayerSendCancel(cid, "Sorry, this pokemon can\'t teleport.")
return true
end
if exhaustion.get(cid, etele) then
	tempo = (exhaustion.get(cid, etele)) / 15
	min = math.floor(tempo)
	doPlayerSendCancel(cid, "Your pokemon is tired, you have to wait more "..min.." minutes to cast teleport again.")
	return true
	end

local config = {
pz = false, -- players precisam estar em protection zone para usar? (true or false)
battle = true, -- players deve estar sem battle (true or false)
custo = false, -- se os teleport irão custa (true or false)
need_level = true, -- se os teleport irão precisar de level (true or false)
premium = true -- se precisa ser premium account (true or false)
}


local lugar = {
["pallet"] = {
pos = {x=575, y=1143, z=7},level = 20,price = 0,n="Pallet"},
["viridian"] = {
pos = {x=560, y=1040, z=7},level = 20, price = 0,n="Viridian"},
["pewter"] = {
pos = {x=571, y=668, z=6},level = 20,price = 0,n="Pewter"},
["cerulean"] = {
pos = {x=1060, y=903, z=7},level = 20,price = 0,n="Cerulean"},
["saffron"] ={
pos = {x=1054, y=1050, z=7},level = 20,price = 0,n="Saffron"},
["celadon"] = {
pos = {x=862, y=1035, z=6},level = 20,price = 0,n="Celadon"},
["lavender"] = {
pos = {x=1204, y=1046, z=7},level = 20, price = 0,n="Lavender"},
["vermilion"] = {
pos = {x=1070, y=1234, z=7},level = 20,price = 0,n="Vermilion"},
["fuchsia"] = {
pos = {x=1122, y=1449, z=7},level = 20,price = 0,n="Fuchsia"},
["cinnabar"] ={
pos = {x=634, y=1345, z=7},level = 20,price = 0,n="Cinnabar"}
}
if (param == '') then
local str = ""
str = str .. "Places to go :\n\nHouse\nFalador\nSendas\nFurbridge\nMesten\nSpenzel"
doShowTextDialog(cid, 7416, str)
return TRUE
end

if string.lower(param) == "house" then
if getHouseByPlayerGUID(getPlayerGUID(cid)) then
nome = getCreatureName(getCreatureSummons(cid)[1])
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 29)
setPlayerStorageValue(cid, 61209, getCreatureMaxHealth(getCreatureSummons(cid)[1]))
setPlayerStorageValue(cid, 61210, getCreatureHealth(getCreatureSummons(cid)[1]))
doRemoveCreature(getCreatureSummons(cid)[1])
doSendMagicEffect(getThingPos(cid), 29)
doTeleportThing(cid, getHouseEntry(getHouseByPlayerGUID(getPlayerGUID(cid))))
pos2 = {x=getThingPos(cid).x, y=getThingPos(cid).y+1, z=getThingPos(cid).z}
doSendMagicEffect(getThingPos(cid), 29)
doCreatureSay(cid, ""..nome..", teleport to our home!", 1)
local item = getPlayerSlotItem(cid, 8)
doSummonMonster(cid, getItemAttribute(item.uid, "poke"):match("This is (.-)'s pokeball."))
local pk = getCreatureSummons(cid)[1]
registerCreatureEvent(cid, "PlayerPokeDeath")
registerCreatureEvent(pk, "DiePoke")
registerCreatureEvent(pk, "Exp")
setCreatureMaxHealth(pk, (getPlayerStorageValue(cid, 61209)))
doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61209)))
doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61210))-(getPlayerStorageValue(cid, 61209)))
doCreatureSay(getCreatureSummons(cid)[1], "TELEPORT!", TALKTYPE_MONSTER)
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), CONST_ME_TELEPORT)
exhaustion.set(cid, etele, cdtele)
    doRemoveCondition(cid, CONDITION_OUTFIT)
    setPlayerStorageValue(cid, 10, 0)
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You don't own a house.")
end
return true
end

local a = lugar[string.lower(param)]
if not(a) then
doPlayerSendTextMessage(cid, 22, "This place doesn\'t exist.")
return TRUE
elseif config.premium == true and not isPremium(cid) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Only premium members can use this skill.")
return TRUE
elseif config.battle == true and getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your pokemon can\'t teleport during battles.")
return TRUE
end
nome = getCreatureName(getCreatureSummons(cid)[1])
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 29)
setPlayerStorageValue(cid, 61209, getCreatureMaxHealth(getCreatureSummons(cid)[1]))
setPlayerStorageValue(cid, 61210, getCreatureHealth(getCreatureSummons(cid)[1]))
doRemoveCreature(getCreatureSummons(cid)[1])
doSendMagicEffect(getThingPos(cid), 29)
doTeleportThing(cid, a.pos)
pos2 = {x=getThingPos(cid).x, y=getThingPos(cid).y+1, z=getThingPos(cid).z}
doSendMagicEffect(a.pos, 29)
doCreatureSay(cid, ""..nome..", teleport to "..lugar[string.lower(param)].n.."!", 1)
local item = getPlayerSlotItem(cid, 8)
doSummonMonster(cid, getItemAttribute(item.uid, "poke"):match("This is (.-)'s pokeball."))
doTeleportThing(getCreatureSummons(cid)[1], pos2, false)
local pk = getCreatureSummons(cid)[1]
registerCreatureEvent(cid, "PlayerPokeDeath")
registerCreatureEvent(pk, "DiePoke")
registerCreatureEvent(pk, "Exp")
setCreatureMaxHealth(pk, (getPlayerStorageValue(cid, 61209)))
doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61209)))
doCreatureAddHealth(pk, (getPlayerStorageValue(cid, 61210))-(getPlayerStorageValue(cid, 61209)))
doCreatureSay(getCreatureSummons(cid)[1], "TELEPORT!", TALKTYPE_MONSTER)
doSendMagicEffect(pos2, CONST_ME_TELEPORT)
exhaustion.set(cid, etele, cdtele)
    doRemoveCondition(cid, CONDITION_OUTFIT)
    setPlayerStorageValue(cid, 10, 0)
return TRUE
end