function onSay(cid, words, param)
if param == 'water' then
doAreaCombatHealth(cid, WATERDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'fire' then
doAreaCombatHealth(cid, FIREDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'psy' then
doAreaCombatHealth(cid, PSYCHICDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'grass' then
doAreaCombatHealth(cid, GRASSDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'ice' then
doAreaCombatHealth(cid, ICEDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'normal' then
doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'ghost' then
doAreaCombatHealth(cid, GHOSTDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'ground' then
doAreaCombatHealth(cid, GROUNDDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'electric' then
doAreaCombatHealth(cid, ELECTRICDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'flying' then
doAreaCombatHealth(cid, FLYDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'rock' then
doAreaCombatHealth(cid, ROCKDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'dragon' then
doAreaCombatHealth(cid, DRAGONDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'poison' then
doAreaCombatHealth(cid, POISONDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'fight' then
doAreaCombatHealth(cid, FIGHTINGDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
elseif param == 'bug' then
doAreaCombatHealth(cid, BUGDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -100, -101, 255)
else
doPushCreature(getCreatureSummons(cid)[1], 1, 4, 1000)
doPushCreature(getCreatureSummons(cid)[1], 3, 4, 1000)


end

return 1
end