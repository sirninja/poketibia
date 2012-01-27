function onSay(cid, words, param)

config = {
level1= 50, -- level necessario do player 1 pra usar o fight system.
level2= 50, -- level necessario do player 2 pra usar o fight system.
pid=getPlayerGUID(cid), -- não mecha
premium = "no", -- se precisa ser premium account ("yes" or "no")
redskull="yes", -- players com red skull podem usar o fight system? ("yes" or "no").
prot="no", -- players precisam estar em protection zone pra usar o fight system? ("yes" or "no").
bat="yes", --players precisam estar sem fight pra huntar? ("yes" or "no").
Posplayer1 = {x=264, y=440, z=6}, -- para onde o jogador que deu fight sera levado
Posplayer2 = {x=286, y=440, z=6}, -- para onde o jogador que aceitou fight sera levado
RemoveItem = "no", -- se ira remover o item ("yes" or "no")
item = 2160, -- id do item
storage = 9696
}


if words == '!fight' or param == "/fight" then


local player = getPlayerByName(param)
local pid = getPlayerByNameWildcard(param)
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
doPlayerPopupFYI(cid, "Este Jogador Não está Online Ou Não existe.")
return TRUE
end

if(config.redskull == "no") and (getCreatureSkullType(cid) == 4) then
doPlayerPopupFYI(cid,"apenas player sem red skull podem Usar fight System.")

elseif (getPlayerLevel(cid) < config.level1) then
doPlayerPopupFYI(cid,"você precisa ter level " .. config.level1 .. " para batalhar.")

elseif (getPlayerLevel(player) < config.level2 ) then
doPlayerPopupFYI(cid,"o jogador não tem level " .. config.level2 .. " para poder batalhar.")

elseif(config.prot == "yes") and (getTilePzInfo(getCreaturePosition(cid)) == FALSE) then
doPlayerPopupFYI(cid,"você precisa estar em protection zone pra usar o fight system.")

elseif(config.bat == "yes") and (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doPlayerPopupFYI(cid,"você não pode batalhar se ja estiver sendo atacado !")

elseif(config.prot == "yes") and (getTilePzInfo(getCreaturePosition(player)) == FALSE) then
doPlayerPopupFYI(cid,"o outro player precisa estar em protection zone pra usar o fight system.")

elseif(config.bat == "yes") and (getCreatureCondition(player, CONDITION_INFIGHT) == TRUE) then
doPlayerPopupFYI(cid,"o outro jogador não pode batalhar se ja estiver sendo atacado !")

elseif(config.premium == "yes") and (not isPremium(cid)) then
doPlayerPopupFYI(cid, "apenas players com premium account podem batalhar.")

elseif(config.RemoveItem == "yes") and (doPlayerRemoveItem(cid, config.item, 1) == FALSE) then
doPlayerPopupFYI(cid, "Desculpe,voce não tem 1 " .. getItemNameById(config.item) .. " para batalhar.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)

elseif isPlayer(player) then
doPlayerPopupFYI(cid,"Voce acaba de Desafiar o jogador " .. getPlayerName(player) .." espere ele aceitar.")
doPlayerPopupFYI(player,getCreatureName(cid) .. 'Acaba de te desafiar para um batalha ! deseja aceitar? diga !aceitar se não diga !recusar.')
setPlayerStorageValue(player, config.storage, 1)
doTeleportThing(cid,config.Posplayer1)
doCreatureSetSkullType(cid, 2)
end
return TRUE
end 

if words == '!aceitar' or param == "!accept" then
if getPlayerStorageValue(cid,config.storage) >= 1 then
doPlayerPopupFYI(cid, "O jogador aceitou , começara a batalha!.")
setPlayerStorageValue(cid, config.storage, -1)
doCreatureSetSkullType(cid, 2)

doTeleportThing(cid,config.Posplayer2)
doTeleportThing(cid,config.Posplayer1)
else
doPlayerPopupFYI(cid, "Desculpe,voce não foi desafiado para nenhuma batalha .")
end
return TRUE
end

if words == '!recusar' or param == "!recuse" then
if getPlayerStorageValue(cid,config.storage) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você recusou a batalha.")
setPlayerStorageValue(cid, config.storage, -1)
end
return TRUE
end

return TRUE
end