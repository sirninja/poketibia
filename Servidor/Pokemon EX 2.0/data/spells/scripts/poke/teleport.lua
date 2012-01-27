function onCastSpell(cid, var)
local jogadorpos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local monsterpos = getCreaturePosition(target)
if target == isMonster or isCreature then
doTeleportThing(cid,monsterpos)
doTeleportThing(target,jogadorpos)
doSendMagicEffect(jogadorpos, 21)
doSendMagicEffect(monsterpos, 21)
doCreatureSay(cid,"Teleport", TALKTYPE_SAY) 
else
doPlayerSendTextMessage(cid,20,'You can only use it on creatures')
end
end