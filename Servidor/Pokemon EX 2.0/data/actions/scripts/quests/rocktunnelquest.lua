function onUse (cid,item,frompos,item2,topos)
pos = {x=1125, y=1017, z=4}

        UID_DO_BAU = 1007
        STORAGE_VALUE = 1007
        ID_DO_PREMIO = 2160
        ID_DO_PREMIO2 = 7886

        if getPlayerLevel(cid) >= 55 then
        if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
          doTeleportThing(cid,pos)
        doPlayerSendTextMessage(cid,22,"Parabens! Você Completou a Rock Tunnel Quest!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,50)
        doPlayerAddItem(cid,ID_DO_PREMIO2,1)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
          else
        doPlayerSendTextMessage(cid,22,"Você ja pegou os itens.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente Players com Level 55+ conseguem abrir este bau.')
        end
return 1
end