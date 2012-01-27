local storage = 9535 ---The Storage That you Check the Steps, The same Storage That The Npc, The Movement and Te Talkation Would Have.
local out = {x=1051, y=1049, z=7} --- Change it to the Exit of Your safari Zone
--------------------------------------------------------------------------------------------------------------------------
function onSay(cid, words, param)
inzone = getPlayerStorageValue(cid,storage)
if inzone == -1 then
doPlayerSendTextMessage(cid,22,"You Are not In The Safari Zone.")
elseif inzone > -1 then
doTeleportThing(cid,out)
doPlayerSendTextMessage(cid,22,"You Have Left the Safari Zone, Come Back Soon.")
setPlayerStorageValue(cid,storage,-1)
doSendMagicEffect(out,10)
end
end