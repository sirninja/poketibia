function onDeEquip(cid, item, slot)
if getCreatureSummons(cid) >= 1 then
return doPlayerSendCancel(cid, "You cannot move this object.")
end
end