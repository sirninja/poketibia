function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 then
return true
end
if getPlayerStorageValue(cid, 10) == 0 then
setPlayerStorageValue(cid, 10, 1)
doRemoveCondition(cid, CONDITION_OUTFIT)
outfitm = {lookType = 263, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
let = {lookType = 264, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
namem = "Elite Trainer"
namef = "Elite Trainer"
elseif getPlayerStorageValue(cid, 10) == 1 then
setPlayerStorageValue(cid, 10, 2)
doRemoveCondition(cid, CONDITION_OUTFIT)
outfitm = {lookType = 163, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
let = {lookType = 162, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
namem = "Gentleman"
namef = "Lady"
elseif getPlayerStorageValue(cid, 10) == 2 then
setPlayerStorageValue(cid, 10, 0)
doRemoveCondition(cid, CONDITION_OUTFIT)
outfitm = {lookType = 165, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
let = {lookType = 166, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
namem = "Athletic"
namef = "Athletic"
end
if getPlayerSex(cid) == 1 then
doSetCreatureOutfit(cid, outfitm, -1)
doPlayerSendTextMessage(cid, 27, "You are trying on the "..namem.." outfit.")
elseif getPlayerSex(cid) == 0 then
doSetCreatureOutfit(cid, let, -1)
doPlayerSendTextMessage(cid, 27, "You are trying on the "..namef.." outfit.")
end
return true
end