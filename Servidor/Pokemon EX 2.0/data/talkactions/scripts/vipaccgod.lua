function onSay(cid, words, param, channel)
        local t = param:explode(",")
        local name, days = t[1], tonumber(t[2])
        if words == "/installvip" then
                if installVip() then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Vip System instalado com sucesso!")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não foi possível instalar o Vip System!")
                end
        elseif words == "/addvip" then
                if name then
                        if days then
                                local acc = getAccountIdByName(name)
                                if acc ~= 0 then
                                addVipDays(cid, days)
                                doPlayerAddPremiumDays(cid, days)
                                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You add "..days.." day(s) of vip to "..name..", now he has "..getVipDaysByAccount(acc).." day(s) of vip.")
                                else
                                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This player doesnt exist.")
                                end
                        else
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cant add this number of vip.")
                        end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cant add days of vip in this player.")
                end
        elseif words == "/removevip" then
                if name then
                        if days then
                                local acc = getAccountIdByName(name)
                                if acc ~= 0 then
                                        doRemoveVipDays(cid, days)
                                        doPlayerRemovePremiumDays(cid, days)
                                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You removed "..days.." day(s) of vip of "..name..", now he has "..getVipDaysByAccount(acc).." day(s) of vip.")
                                else
                                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Este player não existe.")
                                end
                        else
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cant remove this number of vip.")
                        end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cant add days of vip in this player.")
                end
        elseif words == "/checkvip" then
                if name then
                        local acc = getAccountIdByName(name)
                        if acc ~= 0 then
                                local duration = getVipDateByAccount(acc)
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The "..name.." has "..getVipDaysByAccount(acc).." days of vip"..(duration and (" Its gonna ends in "..duration..".") or ""))
                        else
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This player doesnt exist.")
                        end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cant check days of vip in this player.")
                end
        end
        return TRUE
end