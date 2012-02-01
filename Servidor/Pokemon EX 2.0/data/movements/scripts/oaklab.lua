function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
        kickPos = fromPosition,
        kickEffect = CONST_ME_POFF,
        kickMsg = "I think its a better idea talk to the profesor first",
        enterEffect = CONST_ME_MAGIC_BLUE,
}

    if getPlayerStorageValue(cid, 54842) ~= 0 then
        doTeleportThing(cid, tileConfig.kickPos)
        doSendMagicEffect(tileConfig.kickPos, tileConfig.kickEffect)
        doPlayerSendCancel(cid, tileConfig.kickMsg)
        return
    end
        return true
end