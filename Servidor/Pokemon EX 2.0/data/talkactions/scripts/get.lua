function onSay(cid, words, param, channel)
        doPlayerSendCancel(cid, ""..getPlayerVipDays(cid).." days VIP left.")
end