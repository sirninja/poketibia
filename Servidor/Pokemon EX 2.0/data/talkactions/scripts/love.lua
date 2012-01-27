local waittime = 300 -- (300 seconds)
local storage = 5560
local addHealth = 50 -- (Vida que vai heala do Pokemon)
 
function onSay(cid, words, param)       
 
local summons = getCreatureSummons(cid)         
if(table.maxn(summons) > 0) then -- no summons  
else
doPlayerSendCancel(cid, "You don't have any summons.")
return true
end
 
if exhaustion.get(cid, storage) == FALSE then
if words == '!love' then
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(getPlayerPosition(cid), 180)
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 180)
doCreatureAddHealth(getCreatureSummons(cid)[1], addHealth)
end
else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You must wait another " .. exhaustion.get(cid, storage) .. " seconds.")
        end     
return true
end