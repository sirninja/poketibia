function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)
if isPlayer(cid) == true then
doCreatureSetDropLoot(cid, false) 
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
return TRUE
end
return TRUE
end