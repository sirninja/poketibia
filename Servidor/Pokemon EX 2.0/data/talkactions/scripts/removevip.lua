function onSay(cid, words, param, channel)
        doPlayerSendCancel(cid, "Vip removed.")
        return doPlayerRemoveVip(cid)
end