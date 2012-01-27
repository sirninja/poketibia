function onUse (cid,item,frompos,item2,topos)
pos = {x=1041, y=876, z=5}

        UID_DO_BAU = 1011
        STORAGE_VALUE = 1011
        ID_DO_PREMIO = 2147
        ID_DO_PREMIO2 = 2642
		ID_DO_PREMIO3 = 2645
        ID_DO_PREMIO4 = 2146

        if getPlayerLevel(cid) >= 15 then
        if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
          doTeleportThing(cid,pos)
        doPlayerSendTextMessage(cid,22,"Parabens! Você Completou a Pokeballs Quest!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,20)
        doPlayerAddItem(cid,ID_DO_PREMIO2,10)
        doPlayerAddItem(cid,ID_DO_PREMIO3,5)
        doPlayerAddItem(cid,ID_DO_PREMIO4,3)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
          else
        doPlayerSendTextMessage(cid,22,"Você ja pegou os itens.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente Players com Level 15+ conseguem abrir este bau.')
        end
return 1
end