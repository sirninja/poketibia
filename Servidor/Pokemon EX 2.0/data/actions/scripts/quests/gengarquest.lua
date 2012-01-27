function onUse (cid,item,frompos,item2,topos)
pos = {x=1247, y=941, z=13}
pos2 = getPlayerPosition(cid)

        UID_DO_BAU = 1006
        STORAGE_VALUE = 1006
        ID_DO_PREMIO = 2157
        ID_DO_PREMIO2 = 7891

        if getPlayerLevel(cid) >= 90 then
        if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
          doTeleportThing(cid,pos)
        doPlayerSendTextMessage(cid,22,"Parabens Você Completou a Gengar Quest.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,10)
        doPlayerAddItem(cid,ID_DO_PREMIO2,1)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos2, CONST_ME_TELEPORT)
          else
        doPlayerSendTextMessage(cid,22,"Você ja pegou os itens.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente levels 90+ conseguem abrir este bau.')
        end
return 1
end