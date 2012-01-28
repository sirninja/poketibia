function onSay(cid, words, param, channel)
        doPlayerSendCancel(cid, "VIP Days: "..param..".")
        return setPlayerVipDays(cid, param)
end