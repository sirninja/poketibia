function onUse(cid, item, frompos, item2, topos)
doSendMagicEffect(getCreaturePosition(getCreatureSummons(cid)[1]), 184)
if getCreatureName(item2.uid) == "Ditto" and isMonster(item2.uid) == TRUE and getCreatureName(getCreatureSummons(cid)[1]) == "Ditto" then
doCreatureSay(cid, "Ditto, reverse transformation!", 1)
xd = doSummonCreature(getCreatureName(item2.uid), topos)
doCreatureAddHealth(xd, -getCreatureHealth(xd)+getCreatureHealth(getCreatureSummons(cid)[1]))
doTeleportThing(xd, getCreaturePosition(getCreatureSummons(cid)[1]), false)
doRemoveCreature(item2.uid)
doConvinceCreature(cid, xd)
return TRUE
end

if isMonster(item2.uid) == TRUE and getCreatureName(getCreatureSummons(cid)[1]) == "Ditto" then
doCreatureSay(cid, "Ditto, transform in ".. getCreatureName(item2.uid) .."!", 1)
doSetCreatureOutfit(getCreatureSummons(cid)[1], getCreatureOutfit(item2.uid), 18000)
return TRUE
else
doPlayerSendCancel(cid,"Only ditto's can use transform.")
return TRUE
end
end