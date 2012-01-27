function onStepOut(cid, item, position, fromPosition)
if #getCreatureSummons(cid) >= 1 then
doTeleportThing(getCreatureSummons(cid)[1], getThingPos(cid))
end
end