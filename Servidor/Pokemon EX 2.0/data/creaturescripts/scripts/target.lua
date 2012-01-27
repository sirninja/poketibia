function onTarget(cid, target)
if isPlayer(target) then
doRemoveCreature(cid)
end
return true
end