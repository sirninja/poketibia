function onSay(cid, words, param, channel)
doPlayerSendCancel(cid, "Added "..param.." Vip Days.")
return doPlayerAddVipDays(cid, param)
end