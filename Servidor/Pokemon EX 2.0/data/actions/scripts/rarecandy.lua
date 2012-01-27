---Elixir of Experience---

function onUse(cid, item, fromPosition, itemEx, toPosition)

explevel = getExperienceForLevel(getPlayerLevel(cid))
explevel2 = getExperienceForLevel(getPlayerLevel(cid)+1)
exp = (explevel2 - explevel)/100
random = math.random(100,100)
expfinal = random*exp
soul = getPlayerSoul(cid)


if getPlayerLevel(cid) >= 35 then
doPlayerSendTextMessage(cid,19,"Voce recebeu "..random.."% de experiencia, ("..expfinal.." points).")
doPlayerAddExp(cid,expfinal)
doPlayerAddSoul(cid, -(250))
doSendAnimatedText(getPlayerPosition(cid), expfinal, TEXTCOLOR_WHITE)
doSendMagicEffect(getPlayerPosition(cid),12)
doRemoveItem(item.uid,1)
else
doPlayerSendTextMessage(cid,22,"Somente level 35+ podem comer deste doce!")
end

return true
end