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
doCreatureAddHealth(attacker, -value, 3, 191) -- 3 = efeito do reflect
setPlayerStorageValue(cid, 34, 0)
return false
end
end
end
if getPlayerStorageValue(cid, 35) >= 1 then -- MAGIAS DE MISS, STRING SHOT, MUD SHOT ETC
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
doCreatureAddHealth(cid, -getCreatureHealth(cid), 3, 180) -- 3 é o efeito que aparece no player quando ele é atacado e vai morrer
return false
end
return false
end
if isPlayer(getCreatureMaster(attacker)) then
doTargetCombatHealth(getCreatureMaster(attacker), cid, combatee, -(getCreatureHealth(cid)), -(getCreatureHealth(cid)), effects[combatee])
if isInArray({GROUNDDAMAGE, ELECTRICDAMAGE, ROCKDAMAGE, FLYDAMAGE, BUGDAMAGE, FIGHTINGDAMAGE, DRAGONDAMAGE, POISONDAMAGE}, combatee) then
doSendAnimatedText(getThingPos(cid), value, cores)
end
return false
end
return true
end
if isPlayer(cid) then
if #getCreatureSummons(cid) >= 1 then
return false
end
doCreatureAddHealth(cid, -value, 3, 180) -- 3 é o efeito que aparece no player quando é atacado
return false
end

if isPlayer(getCreatureMaster(cid)) then
doAddCondition(getCreatureMaster(cid), expcond)
end


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

local xx = x

if not isSummon(attacker) then
if not isPlayer(cid) and not isPlayer(getCreatureMaster(cid)) then
return false
end
if isSummon(cid) and getCreatureHealth(cid) <= (getCreatureMaxHealth(cid)*0.15) and not exhaustion.get(getCreatureMaster(cid), 88726) then
exhaustion.set(getCreatureMaster(cid), 88726, 6)
doSendMagicEffect(getThingPos(cid), 178)
end
if getPlayerStorageValue(cid, 4) >= 1 then
local damage = value
doCreatureAddHealth(cid, -((math.ceil(damage/2))*xx), 2, cores) -- 2 é o efeito que aparece no pokemon quando tem harden e é atacado
else
local damage = value
if cor == NONE then
return true
end
doCreatureAddHealth(cid, -((math.ceil(damage/1))*xx), effects[combatee], cores)
return false
end
return false
end
if isSummon(attacker) then
if isSummon(cid) then
if isInParty(getCreatureMaster(cid)) and isInParty(getCreatureMaster(attacker)) and getPlayerParty(getCreatureMaster(cid)) == getPlayerParty(getCreatureMaster(attacker)) then
else
return false
end
end
local combatx = combatee
local valor = value
if getPlayerStorageValue(cid, 4) >= 1 then
doTargetCombatHealth(getCreatureMaster(attacker), cid, combatx, -((valor / 2)*x), -(((valor / 2)+10)*x), 255)
else
doTargetCombatHealth(getCreatureMaster(attacker), cid, combatx, -((valor)*x), -((valor+10)*x), 255)
end
if isInArray({GROUNDDAMAGE, ELECTRICDAMAGE, ROCKDAMAGE, FLYDAMAGE, BUGDAMAGE, FIGHTINGDAMAGE, DRAGONDAMAGE, POISONDAMAGE}, combatee) then
doSendAnimatedText(getThingPos(cid), value*xx, cores)
end
end
end
end