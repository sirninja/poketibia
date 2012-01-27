local config = {
vip = "yes",
storage = 13540
}

function onSay(cid, words, param, channel)
        if words == "/buyvip" then
                local days = 30
                local storageplayer = getPlayerStorageValue(cid, 13540)
                if doPlayerRemoveItem(cid, 2145, 10) then
                        addVipDays(cid, days)
                        doPlayerAddPremiumDays(cid, days)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You had adicioned "..days.." day(s) of vip, now you have "..getVipDays(cid).." days(s) of vip.")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You dont have enough diamonds.")
                end
                
        elseif words == "/vipdays" then
                local duration = getVipDate(cid)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have "..getVipDays(cid).." day(s) of vip."..(duration and ("  "..duration..".") or ""))
        end
        return TRUE
end