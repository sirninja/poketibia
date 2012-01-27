function onUse(cid, item, frompos, item2, topos)

if isPlayer(item2.uid) then
return doPlayerSendCancel(cid, "You can only use potions on pokemons!")
end

if (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doPlayerSendCancel(cid, "Sorry, you can't heal your pokemon during fights!")
return TRUE
end

if not isCreature(item2.uid) then
return doPlayerSendCancel(cid, "You can only use potions on pokemons!")
end

if not isPlayer(getCreatureMaster(item2.uid)) then
return doPlayerSendCancel(cid, "You cant use potions on wild pokemons.")
end

if getCreatureHealth(item2.uid) == getCreatureMaxHealth(item2.uid) then
return doPlayerSendCancel(cid, "This pokemon is already at full health.")
end

if getPlayerStorageValue(item2.uid, 173) >= 1 then
return doPlayerSendCancel(cid, "This pokemon is already under effects of potions.")
end
doCreatureSay(cid, ""..getCreatureName(item2.uid)..", take this potion!", TALKTYPE_SAY)
doSendAnimatedText(getThingPos(item2.uid), "SMALL POTION", 175)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(item2.uid, 173, 1)
local function heal(params)
	if isCreature(params.item2) then
	if getPlayerStorageValue(item2.uid, 173) >= 2 then
	return true
	end
	if (getCreatureCondition(params.cid, CONDITION_INFIGHT) == true) then
	doSendAnimatedText(getThingPos(params.item2), "LOST HEAL", 145)
	setPlayerStorageValue(item2.uid, 173, 2)
	return true
	end
	if getCreatureHealth(params.item2) == getCreatureMaxHealth(params.item2) then
	return true
	end
	if item.itemid == 2273 then
	doSendMagicEffect(getThingPos(params.item2), 12)
	doCreatureAddHealth(item2.uid, 100)
	end
	end
end
	

local function noskull(params)
	if isCreature(params.item2) then
	setPlayerStorageValue(item2.uid, 173, 0)
	end
end

local item2 = item2.uid
addEvent(heal, 1200, {cid = cid, item2 = item2})
addEvent(heal, 2400, {cid = cid, item2 = item2})
addEvent(heal, 3600, {cid = cid, item2 = item2})
addEvent(heal, 4800, {cid = cid, item2 = item2})
addEvent(heal, 6000, {cid = cid, item2 = item2})
addEvent(heal, 7200, {cid = cid, item2 = item2})
addEvent(heal, 8400, {cid = cid, item2 = item2})
addEvent(heal, 9600, {cid = cid, item2 = item2})
addEvent(heal, 10800, {cid = cid, item2 = item2})
addEvent(heal, 12000, {cid = cid, item2 = item2})
addEvent(noskull, 12500, {cid = cid, item2 = item2})
return true
end