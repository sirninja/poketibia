function onSay(cid, words, param)
if #getCreatureSummons(cid) == 0 then
return doPlayerSendCancel(cid, "You don't have any pokemon!")
end
if exhaustion.get(cid, 2) then
return doPlayerSendCancel(cid, "Wait a few seconds before using this command again.")
end


local summons = getCreatureSummons(cid)[1]
local mon = getCreatureName(summons)
local spd = getCreatureSpeed(summons)
local bspd = getCreatureBaseSpeed(summons)
if spd >= 1 then
doChangeSpeed(summons, -spd)
doCreatureSay(cid, ""..mon..", hold position!", TALKTYPE_SAY)
else
doChangeSpeed(summons, bspd)
doCreatureSay(cid, ""..mon..", stop holding!", TALKTYPE_SAY)
exhaustion.set(cid, 2, 2)
end
return 0
end