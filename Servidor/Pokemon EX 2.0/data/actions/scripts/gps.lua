           function onUse(cid, item, frompos, item2, topos)

    cPos = getCreaturePosition(cid) 
    doPlayerSendTextMessage (cid, MESSAGE_STATUS_CONSOLE_BLUE "Sua posição atual é [X:" .. cPos.x.. "| Y:" .. cPos.y.. "| Z:" .. cPos.z .. "].") 


        end