local storage = 9535 ---The Storage That you Check the Steps, The same Storage That The Npc, The Movement and Te Talkation Would Have.
local out = {x=1051, y=1490, z=7} --- Change it to the Exit of Your safari Zone
local steps = 600 ---the number of steps that the player have to be in safari zone.
------------------------------------------------End Config-------------------------------------------------
function onStepIn(cid, item, pos)
if isPlayer(cid) == 1 then
stepleft = getPlayerStorageValue(cid,storage)
if stepleft <= steps and stepleft >= 0 then
setPlayerStorageValue(cid,storage,stepleft+1)
elseif stepleft >= steps then
setPlayerStorageValue(cid,storage,-1)
doTeleportThing(cid, out)
doSendMagicEffect(out,10)
doPlayerSendTextMessage(cid,22,"The Time in The Safari Zone is Over, Come Back Soon.")
elseif stepleft == -1 then
doTeleportThing(cid, out)
doSendMagicEffect(out,10)
doPlayerSendTextMessage(cid,22,"You Are Not Allowed To be in The Safari Zone.")
end
end
end