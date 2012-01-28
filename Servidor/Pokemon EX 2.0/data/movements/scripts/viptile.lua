function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
        kickPos = fromPosition, kickEffect = CONST_ME_POFF,
        kickMsg = "You need to be a vip player to access this area.",
        enterMsg = "Welcome to vip area!",
        enterEffect = CONST_ME_MAGIC_RED,
}

if isPlayer(cid) == true then   
if vip.hasVip(cid) == FALSE then 
        doTeleportThing(cid, tileConfig.kickPos)
        doSendMagicEffect(tileConfig.kickPos, tileConfig.kickEffect)
        doPlayerSendCancel(cid, tileConfig.kickMsg)
        return
    end
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, tileConfig.enterMsg)
        doSendMagicEffect(position, tileConfig.enterEffect)
        return true
end
end