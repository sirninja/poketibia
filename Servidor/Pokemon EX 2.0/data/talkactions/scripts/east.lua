function onSay(cid, words, param)
if words == "te" then
if #getCreatureSummons(cid) == 0 then
return doPlayerSendCancel(cid, "You don't have any pokemon!")
end
if getPlayerStorageValue(cid, 1) == 1 then
return doPlayerSendCancel(cid, "Please wait a few seconds to order your pokemon again!")
end

local summons = getCreatureSummons(cid)[1]
addEvent(doCreatureSetLookDirection, 200, summons, 1)
local mon = getCreatureName(summons)
doCreatureSay(cid, ""..mon..", turn east!", TALKTYPE_SAY)
setPlayerStorageValue(cid, 1, 1)
addEvent(setPlayerStorageValue, 4000, cid, 1, 0)
else
end
return 1
end