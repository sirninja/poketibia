local storage = 9535 ---The Storage That you Check the Steps, The same Storage That The Npc, The Movement and Te Talkation Would Have.
local steps = 600 ---the number of steps that the player have to be in safari zone.
---------------------------------------------End Config-----------------------------------------------------------------------------
function onSay(cid, words, param)
inzone = getPlayerStorageValue(cid,storage)
left = steps - inzone
if inzone == -1 then
doPlayerSendTextMessage(cid,22,"You Are not In The Safari Zone.")
elseif inzone > -1 then
doPlayerSendTextMessage(cid,22,"You Have " .. left .. " Steps Left in the Safari Zone.")
end
end