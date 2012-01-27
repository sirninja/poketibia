-- potions by lucashgas


function onUse(cid, item, frompos, item2, topos)
if (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doPlayerSendCancel(cid,"Sorry, you can not be in battle mode.")
return TRUE
end
if not isPlayerSummon(cid, item2.uid) then
return doPlayerSendCancel(cid,"Please use on your Pokemon.")
end

local sid = getCreatureSummons(cid)[1]
if getCreatureHealth(sid) >= getCreatureMaxHealth(sid) then
return doPlayerSendTextMessage(cid, 27, "Your Pokemon already are with full health.")
end

doRemoveItem(item.uid,1)
local i = 500
local v = (getCreatureMaxHealth(sid)/100) * 3
doSendMagicEffect(getCreaturePosition(sid), 14)
doPlayerSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", take this potion!", 1)
local max = 4000
while i <= max and getCreatureHealth(sid) < getCreatureMaxHealth(sid)do
doSendMagicEffect(getCreaturePosition(getCreatureSummons(cid)[1]),14)
addEvent(doCreatureAddHealth,i,item2.uid,v)
i = i + 500
end

return true
end