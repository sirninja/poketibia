function onCast(cid, target)
if isPlayer(getCreatureMaster(cid)) then
return false
end
return true
end