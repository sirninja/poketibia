function onUse (cid,item,frompos,item2,topos)
pos = {x=301, y=504, z=6}
pos2 = getPlayerPosition(cid)

        UID_DO_BAU = 1012
        STORAGE_VALUE = 1012
        ID_DO_PREMIO = 2157
        ID_DO_PREMIO2 = 7891
        ID_DO_PREMIO3 = 2644

        if getPlayerLevel(cid) >= 100 then
        if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
          doTeleportThing(cid,pos)
        doPlayerSendTextMessage(cid,22,"Parabens Você Completou a Charizard Valley Quest.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,50)
        doPlayerAddItem(cid,ID_DO_PREMIO2,1)
        doPlayerAddItem(cid,ID_DO_PREMIO3,1)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos2, CONST_ME_TELEPORT)
          else
        doPlayerSendTextMessage(cid,22,"Você ja pegou os itens.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente levels 100+ conseguem desifrar a estatua.')
        end
return 1
end