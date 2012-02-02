function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
        kickPos = fromPosition,
        kickEffect = CONST_ME_POFF,
        kickMsg = "You have to talk with the professor before leave the lab.",
        enterEffect = CONST_ME_MAGIC_BLUE,
}

    if getPlayerStorageValue(cid, 54842) ~=1  then
        doTeleportThing(cid, tileConfig.kickPos)
        doSendMagicEffect(tileConfig.kickPos, tileConfig.kickEffect)
        doPlayerSendTextMessage(cid,22,"Head up stairs and talk to professor.")
        doPlayerSendCancel(cid, tileConfig.kickMsg)
else
end
        return true

end