function onSay(cid, words, param)
         if param == "" then
            return  doPlayerPopupFYI(cid,"Está com problemas?\nAprenda os comandos!\n---------------\nAdicionar vip:\n/vip add days player\n/vip add 30 Real\n---------------\nDeletar vip:\n/vip del player\n/vip del Real\n---------------\nVer a vip:\n/vip see player\n/vip see Real\n---------------\n")
         end
         if param:lower():find('add') == 1 and 3 then
            local _,_,id,name = param:lower():find('add (%d+) (.+)')
            name = name or ""
            id = tonumber(id or 1) or 1
            if tonumber(id) == nil or getPlayerByName(name) == false then
               return doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Adicionar vip:\n/vip add days player\n/vip add 30 Real\n [Player: "..name.."]")
            end  
            if isPlayer(getPlayerByName(name)) == TRUE then
            vip.addVipByAccount(getPlayerAccount(getPlayerByName(name)) ,vip.getDays(id))

            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Foram adicionados "..tonumber(id).." dias de vip a "..name..".")
            doPlayerSendTextMessage(getPlayerByName(name),MESSAGE_INFO_DESCR,"Você recebeu "..tonumber(id).." dias de vip.")
         else
           doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,name.." não esta online ou não existe.")
         end
         elseif param:lower():find('del') == 1 and 3 then
            local _,_,name = param:lower():find('del (.+)')
            if getPlayerByName(name) == false then
               return doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Deletar vip:\n/vip del player\n/vip del Real\n")
            end

            vip.setVipByAccount(getPlayerAccount(getPlayerByName(name)),-os.time())
            doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"A vip de "..name.." foi apagada.")                                                                                                                                               
         elseif param:lower():find('see') == 1 and 3 then
            local _,_,name = param:lower():find('see (.+)')
            name = name or ""
            if getPlayerByName(name) == false then
               return doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Ver a vip:\n/vip see player\n/vip see Real\n")
            end
            local ret_ = vip.getVip(getPlayerByName(name))
            if ret_ == 0 then
              return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,name.." Não tem vip, e nunca teve.")
            else
              return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "A vip de "..name.." Acaba/terminou em "..os.date("%d %B %Y %X ",ret_))
            end
         end
         return TRUE
end