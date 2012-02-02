function onUse (cid,item,frompos,item2,topos)
pos = {x=465, y=772, z=7}

        UID_DO_BAU = 1010
        STORAGE_VALUE = 1010
        ID_DO_PREMIO = 2160
        ID_DO_PREMIO2 = 2146

        if getPlayerLevel(cid) >= 35 then
        if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
          doTeleportThing(cid,pos)
        doPlayerSendTextMessage(cid,22,"Parabens! Você Completou a Pewter Quest!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,40)
        doPlayerAddItem(cid,ID_DO_PREMIO2,15)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
          else
        doPlayerSendTextMessage(cid,22,"Você ja pegou os itens.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente Players com Level 35+ conseguem abrir este bau.')
        end
return 1
end