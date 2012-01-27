local expcond = createConditionObject(CONDITION_INFIGHT)
setConditionParam(expcond, CONDITION_PARAM_TICKS, 4500)

function onStatsChange(cid, attacker, enps, combatee, value)
if getPlayerStorageValue(cid, 33) >= 1 then
if isCreature(attacker) then
return false
end
return true
end
if getPlayerStorageValue(cid, 34) >= 1 then
if combatee ~= COMBAT_PHYSICALDAMAGE then
if isCreature(attacker) then
doSendMagicEffect(getThingPos(cid), 135)
doSendMagicEffect(getThingPos(attacker), 3)
doSendAnimatedText(getThingPos(cid), "REFLECT", 215)
doCreatureAddHealth(attacker, -value)
setPlayerStorageValue(cid, 34, 0)
doSendAnimatedText(getThingPos(attacker), -value, 191)
return false
end
end
end
if getPlayerStorageValue(cid, 35) >= 1 then
if combatee ~= COMBAT_PHYSICALDAMAGE then
if isCreature(attacker) then
doSendAnimatedText(getThingPos(cid), "MISS", 215)
setPlayerStorageValue(cid, 35, 0)
return false
end
end
end
if not isCreature(attacker) then
return true
end
if isPlayer(attacker) then
return true
end
if enps == STATSCHANGE_HEALTHGAIN then
return true
end
if enps == STATSCHANGE_HEALTHLOSS then
if getCreatureHealth(cid) <= value then
if isPlayer(cid) then
	if #getCreatureSummons(cid) == 0 then
	return true
	end
return false
end
if isPlayer(getCreatureMaster(attacker)) then
doTargetCombatHealth(getCreatureMaster(attacker), cid, combatee, -(getCreatureHealth(cid)), -(getCreatureHealth(cid)), 3)
return false
end
return true
end
if isPlayer(getCreatureMaster(cid)) then
doAddCondition(getCreatureMaster(cid), expcond)
end
if not isPlayer(cid) then
if combatee == ELECTRICDAMAGE then
if isInArray(electric2, getCreatureName(cid)) then
x = 2
elseif isInArray(electric1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(electric0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == WATERDAMAGE then
if isInArray(water2, getCreatureName(cid)) then
x = 2
elseif isInArray(water1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(water0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == GRASSDAMAGE then
if isInArray(grass2, getCreatureName(cid)) then
x = 2
elseif isInArray(grass1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(grass0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == FLYDAMAGE then
if isInArray(flying2, getCreatureName(cid)) then
x = 2
elseif isInArray(flying1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(flying0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == FIREDAMAGE then
if isInArray(fire2, getCreatureName(cid)) then
x = 2
elseif isInArray(fire1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(fire0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == ROCKDAMAGE then
if isInArray(rock2, getCreatureName(cid)) then
x = 2
elseif isInArray(rock1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(rock0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == GROUNDDAMAGE then
if isInArray(ground2, getCreatureName(cid)) then
x = 2
elseif isInArray(ground1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(ground0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == GHOSTDAMAGE then
if isInArray(ghost2, getCreatureName(cid)) then
x = 2
elseif isInArray(ghost1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(ghost0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == BUGDAMAGE then
if isInArray(bug2, getCreatureName(cid)) then
x = 2
elseif isInArray(bug1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(bug0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == NORMALDAMAGE then
if isInArray(normal2, getCreatureName(cid)) then
x = 2
elseif isInArray(normal1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(normal0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == FIGHTDAMAGE then
if isInArray(fighting2, getCreatureName(cid)) then
x = 2
elseif isInArray(fighting1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(fighting0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == POISONDAMAGE then
if isInArray(poison2, getCreatureName(cid)) then
x = 2
elseif isInArray(poison1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(poison0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == PSYCHICDAMAGE then
if isInArray(psychic2, getCreatureName(cid)) then
x = 2
elseif isInArray(psychic1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(psychic0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == ICEDAMAGE then
if isInArray(ice2, getCreatureName(cid)) then
x = 2
elseif isInArray(ice1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(ice0, getCreatureName(cid)) then
x = 0
else
x = 1
end
elseif combatee == DRAGONDAMAGE then
if isInArray(dragon2, getCreatureName(cid)) then
x = 2
elseif isInArray(dragon1, getCreatureName(cid)) then
x = 0.5
elseif isInArray(dragon0, getCreatureName(cid)) then
x = 0
else
x = 1
end
else
x = 1
end
else
x = 1
end
local xx = x
if combatee == PSYCHICDAMAGE then
cor = COLOR_PSYCHIC
elseif combatee == GRASSDAMAGE then
cor = COLOR_GRASS
elseif combatee == FIREDAMAGE then
cor = COLOR_FIRE2
elseif combatee == WATERDAMAGE then
cor = COLOR_WATER
elseif combatee == ICEDAMAGE then
cor = COLOR_ICE
elseif combatee == NORMALDAMAGE then
cor = COLOR_NORMAL
elseif combatee == FLYDAMAGE then
cor = COLOR_FLYING
elseif combatee == GHOSTDAMAGE then
cor = COLOR_GHOST
elseif combatee == GROUNDDAMAGE then
cor = COLOR_GROUND
elseif combatee == ELECTRICDAMAGE then
cor = COLOR_ELECTRIC
elseif combatee == ROCKDAMAGE then
cor = COLOR_ROCK
elseif combatee == BUGDAMAGE then
cor = COLOR_BUG
elseif combatee == FIGHTDAMAGE then
cor = COLOR_FIGHTING
elseif combatee == DRAGONDAMAGE then
cor = COLOR_DRAGON
elseif combatee == POISONDAMAGE then
cor = COLOR_POISON
elseif getCreatureName(cid) == "Kakuna" or getCreatureName(cid) == "Metapod" then
cor = COLOR_BUG
elseif getCreatureName(cid) == "Golem" or getCreatureName(cid) == "Graveler" or getCreatureName(cid) == "Geodude" then
cor = COLOR_ROCK
else
cor = NONE
end
local cores = cor
if not isSummon(attacker) then
if not isPlayer(cid) and not isPlayer(getCreatureMaster(cid)) then
return false
end
if isSummon(cid) and getCreatureHealth(cid) <= (getCreatureMaxHealth(cid)*0.15) and not exhaustion.get(getCreatureMaster(cid), 88726) then
exhaustion.set(getCreatureMaster(cid), 88726, 6)
doSendMagicEffect(getThingPos(cid), 178)
end
if isPlayer(cid) then
if #getCreatureSummons(cid) >= 1 then
return false
end
doCreatureAddHealth(cid, -value)
doSendAnimatedText(getThingPos(cid), value, 180)
doSendMagicEffect(getThingPos(cid), 3)
return false
end
if getPlayerStorageValue(cid, 4) >= 1 then
local damage = value
doSendMagicEffect(getThingPos(cid), 2)
doCreatureAddHealth(cid, -((math.floor(damage/2))*xx))
doSendAnimatedText(getThingPos(cid), (math.floor((damage)/2)*xx), cores)
else
local damage = value
if cor == NONE then
return true
end
doCreatureAddHealth(cid, -((math.floor(damage/1))*xx))
doSendAnimatedText(getThingPos(cid), (math.floor((damage)/1)*xx), cores)
doSendMagicEffect(getThingPos(cid), 3)
return false
end
return false
end
if isSummon(attacker) then
if isSummon(cid) then
return false
end
combatx = combatee
valor = value
if getPlayerStorageValue(cid, 4) >= 1 then
doTargetCombatHealth(getCreatureMaster(attacker), cid, combatx, -((valor / 2)*x), -(((valor / 2)+10)*x), 255)
else
doTargetCombatHealth(getCreatureMaster(attacker), cid, combatx, -((valor)*x), -((valor+10)*x), 255)
end
end
end
end