function onSay(cid, words, param)
if param == 'water' then
doAreaCombatHealth(cid, WATERDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'fire' then
doAreaCombatHealth(cid, FIREDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'psy' then
doAreaCombatHealth(cid, PSYCHICDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'grass' then
doAreaCombatHealth(cid, GRASSDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'ice' then
doAreaCombatHealth(cid, ICEDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)

elseif param == 'normal' then
doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'ghost' then
doAreaCombatHealth(cid, GHOSTDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'ground' then
doAreaCombatHealth(cid, GROUNDDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'electric' then
doAreaCombatHealth(cid, ELECTRICDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'flying' then
doAreaCombatHealth(cid, FLYDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'rock' then
doAreaCombatHealth(cid, ROCKDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'dragon' then
doAreaCombatHealth(cid, DRAGONDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'poison' then
doAreaCombatHealth(cid, POISONDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'fight' then
doAreaCombatHealth(cid, FIGHTINGDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'bug' then
doAreaCombatHealth(cid, BUGDAMAGE, getThingPos(getCreatureSummons(cid)[1]), 0, -100, -101, 255)
elseif param == 'sand' then
setPlayerStorageValue(cid, 60996, getPlayerStorageValue(cid, 60996).."oi")
doSendAnimatedText(getThingPos(cid), getPlayerStorageValue(cid, 60996), 35)
else
local description = "Contains a "..param.."."
local poke1 = "This is "..param.."'s pokeball. HP = [1/1]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Weedle")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)

end

return 1
end