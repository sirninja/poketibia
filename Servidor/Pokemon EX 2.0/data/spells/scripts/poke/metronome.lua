local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 43)


arr1s = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1s)
setCombatArea(combat1, area1)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end


function onCastSpell(cid, var)
        doCreatureSay(cid, "METRONOME!", TALKTYPE_MONSTER)
        if getPlayerStorageValue(cid, 3) >= 1 then
        doSendAnimatedText(getThingPos(cid), "MISS", 215)
        setPlayerStorageValue(cid, 3, -1)
        return true
        end
        if getPlayerStorageValue(cid, 5) >= 1 then
                if math.random(1,100) <= 33 then
                doSendAnimatedText(getThingPos(cid), "SELF HIT", 180)
                        if isPlayer(getCreatureTarget(cid)) then
                        huah = getPlayerLevel(getCreatureTarget(cid))
                        else
                        huah = getPlayerLevel(getCreatureMaster(getCreatureTarget(cid)))
                        end
                local levels = huah
                doTargetCombatHealth(getCreatureTarget(cid), cid, COMBAT_PHYSICALDAMAGE, -(math.random((levels*3),(levels*5))), -((math.random((levels*3),(levels*5))+10)), 3)
                return true
                end
        end
                doAreaCombatHealth(cid, FIREDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -120, -140, 15)
                local hitalvo = getCreatureTarget(cid)
                local function hit(params)
                if isCreature(params.cid) then
                if isCreature(getCreatureTarget(params.cid)) then
                if getCreatureTarget(params.cid) == params.hitalvo then
                doAreaCombatHealth(params.cid, ENERGYDAMAGE, getThingPos(getCreatureTarget(params.cid)), 0, -120, -140, 47)
                end
                end
                end
                end
                local function hitdois(params)
                if isCreature(params.cid) then
                if isCreature(getCreatureTarget(params.cid)) then
                if getCreatureTarget(params.cid) == params.hitalvo then
                doAreaCombatHealth(params.cid, GRASSDAMAGE, getThingPos(getCreatureTarget(params.cid)), 0, -180, -220, 54)
                end
                end
                end
                end
                addEvent(hit, 480, {cid = cid, hitalvo = hitalvo})
                addEvent(hitdois, 1050, {cid = cid, hitalvo = hitalvo})
return TRUE
end