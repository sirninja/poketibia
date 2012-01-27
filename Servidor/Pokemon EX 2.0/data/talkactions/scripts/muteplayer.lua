---- Comando para calar um jogador(dar muted) pelo tempo necessário ----
------------------------------------ by grandeyang -------------------------------------

local GMGroup = 3 -- grupo mínimo do GM
local MutedTime = 1 -- em minutos

local condition = createConditionObject(CONDITION_MUTED)
setConditionParam(condition, CONDITION_PARAM_TICKS, MutedTime * 60 * 1000)

function onSay(cid,words,param)

local testeGroup = getPlayerGroupId(cid)
if testeGroup >= GMGroup then
if param ~= "" then

local playerMuted = getPlayerByName(param)
if isPlayer(playerMuted) == TRUE then

local GMName = getPlayerName(cid)
local playerName = getPlayerName(playerMuted)
if playerName == GMName then
doPlayerSendTextMessage(cid,MESSAGE_STATUS_DEFAULT ,"Por que ao invés aplicar um muted em si mesmo você mesmo não cale a boca?")
return 0
end

local playerGroup = getPlayerGroupId(playerMuted)
if playerGroup >= testeGroup then
doPlayerSendTextMessage(cid,MESSAGE_STATUS_DEFAULT ,"Você não pode calar um jogador que tenha um cargo maior ou igual ao seu.")
return 0
end

doAddCondition(playerMuted, condition)
doPlayerSendTextMessage(cid,MESSAGE_STATUS_DEFAULT ,"Você aplicou um muted de "..MutedTime.." minuto(s) no jogador "..playerName..".")
doPlayerSendTextMessage(playerMuted,MESSAGE_STATUS_DEFAULT,"Você foi mutado por "..MutedTime.." minuto(s) pelo "..GMName..".")
return 0
else
doPlayerSendTextMessage(cid,MESSAGE_STATUS_DEFAULT ,"O nome "..param.." está escrito errado ou este está offline.")
return 0
end

end
end
end