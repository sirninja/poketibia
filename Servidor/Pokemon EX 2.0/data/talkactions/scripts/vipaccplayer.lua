function onSay(cid, words, param, channel)
        if words == "/buyvip" then
                local price = 1000000
                local days = 30
                if doPlayerRemoveMoney(cid, price) then
                        addVipDays(cid, days)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você adicionou "..days.." dia(s) de vip, agora você possui "..getVipDays(cid).." dia(s) de vip.")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa de "..price.." para adicionar "..days.." dia(s) de vip.")
                end
                
        elseif words == "/vipdays" then
                local duration = getVipDate(cid)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você possui "..getVipDays(cid).." dia(s) de vip."..(duration and (" Ela irá durar até "..duration..".") or ""))
        end
        return TRUE
end