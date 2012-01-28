function onSay(cid, words, param, channel)
        if isPlayerVip(cid) == TRUE then
                doPlayerSendCancel(cid, "You are a VIP player.")
        else
                doPlayerSendCancel(cid, "You are not a VIP player.")
        end     
end