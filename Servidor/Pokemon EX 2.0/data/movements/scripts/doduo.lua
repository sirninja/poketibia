function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if not isMonster(cid) then
return true
end
if isSummon(cid) then
return true
end
doTeleportThing(cid, fromPosition)
end