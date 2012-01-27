function onStepIn(cid, item, position, fromPosition)
        if isVip(cid) == FALSE then
                doTeleportThing(cid, fromPosition, false)
                doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Somente players vip podem passar.")
        end
        return TRUE
end