function onUse(cid, item, frompos, item2, topos, pos)
        
        if item.itemid == 2552 and item2.itemid == 103 then
                doSendMagicEffect(getThingPos(item2.uid), 2)
                doTransformItem(item2.uid, 806, 1)
                doPlayerSendTextMessage(cid, 27, ".:: Você Preparou a Terra, Agora Plante a Semente ::.")
                return true
        elseif item.itemid == 7389 and item2.itemid == 806 then
                doSendMagicEffect(getThingPos(item2.uid), 45)
                doTransformItem(item2.uid, 804, 1)
                doPlayerRemoveItem(cid, 7389, 1)
                doPlayerSendTextMessage(cid, 27, ".:: Você Plantou a Semente, Agora Jogue Um Pouco de Água ::.")
                return true     
        elseif item.itemid == 7734 and item2.itemid == 804 then
                doSendMagicEffect(getThingPos(item2.uid), 53)
                doCreateItem(2785, 1, getThingPos(item2.uid))
                doPlayerSendTextMessage(cid, 27, ".:: A Planta Cresceu, Colha Os Frutos e Depois à Corte Para Plantar Novamente ::.")
                return true
        elseif item.itemid == 2552 and item2.itemid == 2786 then
                doSendMagicEffect(getThingPos(item2.uid), 34)
                doTransformItem(item2.uid, 103, 1)
                doPlayerSendTextMessage(cid, 27, ".:: Você Cortou a Árvore Sem Frutos, Parabéns ::.")
                return true
        elseif item.itemid == 2552 and item2.itemid == 806 then
                doSendMagicEffect(getThingPos(item2.uid), 2)
                doTransformItem(item2.uid, 103, 1)              
                return true
        elseif item.itemid == 2552 and item2.itemid == 804 then
                doSendMagicEffect(getThingPos(item2.uid), 2)
                doTransformItem(item2.uid, 103, 1)
                return true
        end
end