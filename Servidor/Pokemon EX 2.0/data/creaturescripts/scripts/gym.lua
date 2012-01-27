function onDeath(cid, corpse)
doSendMagicEffect(getThingPos(cid), 10)

    local npc = ""..getPlayerStorageValue(cid, 201)..""
    local turn = getPlayerStorageValue(cid, 202)
    local nturn = ((turn) + 1)
    local nxt = ginasios[npc][turn].nextp

doCreatureSay(getCreatureByName(npc), ginasios[npc][turn].msgba, 1)

if nxt == "finish" then
local killer = getItemAttribute(corpse.uid, "corpseowner")
addEvent(doCreatureSay, 1200, getCreatureByName(npc), ginasios[npc].msgwin, 1)
setPlayerStorageValue(getCreatureMaster(killer), ginasios[npc].storage, 2)
doPlayerAddItem(cid,2160,30)
--local item = getPlayerItemById(killer, true, 2307)
--doTransformItem(item.uid, 2294)
doRemoveCreature(cid)
return false
end

    local function summonNext(poke, pos, gym, msg, cid)
    local x = doSummonCreature(poke, pos)
    addEvent(gymChecker, 1000, x, cid, 0)
    doSendMagicEffect(getThingPos(x), 10)
    doCreatureSay(getCreatureByName(gym), msg, 1)
    end

local killer = getItemAttribute(corpse.uid, "corpseowner")
addEvent(doGymBattle, 1200, npc, ginasios[npc][turn].nextp, killer, nturn)
doRemoveCreature(cid)
return false
end

local fightconditionnn = createConditionObject(CONDITION_INFIGHT)
setConditionParam(fightconditionnn, CONDITION_PARAM_TICKS, 18 * 1000)

function onAttack(cid, target)

if getPlayerStorageValue(getCreatureMaster(target), ginasios[getPlayerStorageValue(cid, 201)].storage) ~= 1 then
doMonsterChangeTarget(cid)
doChangeSpeed(cid, -getCreatureSpeed(cid))
return true
end

if isPlayer(target) then
    if #getCreatureSummons(target) == 0 then
    doMonsterChangeTarget(cid)
    doChangeSpeed(cid, -getCreatureSpeed(cid))
    return true
    end
    if #getCreatureSummons(target) >= 1 then
    doMonsterSetTarget(cid, getCreatureSummons(target)[1])
    end
end

if getCreatureSpeed(cid) == 0 then
doChangeSpeed(cid, -getCreatureSpeed(cid))
doChangeSpeed(cid, 200)
end
doAddCondition(getCreatureMaster(target), fightconditionnn)
return true
end


function onCast(cid, target)
if isPlayer(target) then
return false
end
local targete = getCreatureTarget(cid)
if isPlayer(getCreatureMaster(targete)) and getPlayerStorageValue(getCreatureMaster(targete), ginasios[getPlayerStorageValue(cid, 201)].storage) ~= 1 then
return false
end
return true
end

function onDirection(cid, old, current)
if isCreature(getCreatureTarget(cid)) and not isPlayer(getCreatureTarget(cid)) and getPlayerStorageValue(getCreatureMaster(getCreatureTarget(cid)), ginasios[getPlayerStorageValue(cid, 201)].storage) == 1 then
return true
end
return false
end