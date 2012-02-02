function onUse (cid,item,frompos,item2,topos)
pos = {x=869, y=887, z=10}

        UID_DO_BAU = 1009
        STORAGE_VALUE = 1009
        ID_DO_PREMIO = 2278

        if getPlayerLevel(cid) >= 25 then
        if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
          doTeleportThing(cid,pos)
        doPlayerSendTextMessage(cid,22,"Parabens! Você Completou a Venom Quest!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
          else
        doPlayerSendTextMessage(cid,22,"Você ja pegou a Venom Stone.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente Players com Level 25+ conseguem abrir este bau.')
        end
return 1
end