function onSay(cid, words, param, channel) 
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Coloque espaço entre ! eo codigo do emoticon [EX: ! :D].")
return true
end
if param == ":D" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 183)
end

elseif param == ":)" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 170)
end

elseif param == ":|" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 182)
end

elseif param == ":(" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 169)
end

elseif param == ":@" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 168)
end

elseif param == ":S" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 167)
end

elseif param == "!" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 173)
end

elseif param == "yes" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 175)
end

elseif param == "no" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 176)
end

elseif param == "..." then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 166)
end

elseif param == "go" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 167)
end

elseif param == "lol" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 179)
end

elseif param == "-.-" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 186)
end

stopEvent(say_events[getPlayerGUID(cid)])
say_events[getPlayerGUID(cid)] = nil

end
return TRUE
end