local cyndaquil = {lookType = 321}
local quilava = {lookType = 322}
local typhlosion = {lookType = 323}


local rollarea = createCombatArea{
{1, 1, 1},
{1, 2, 1},
{1, 1, 1},
}

function onCastSpell(cid, var)
if getCreatureCondition(cid, CONDITION_OUTFIT) == true then
return true
end
doCreatureSay(cid, "Grrrrrrrrr!", TALKTYPE_MONSTER)

if getCreatureOutfit(cid).lookType == 324 then
doSetCreatureOutfit(cid, cyndaquil, -1)
damage = 400
elseif getCreatureOutfit(cid).lookType == 325 then
doSetCreatureOutfit(cid, quilava, -1)
damage = 795
elseif getCreatureOutfit(cid).lookType == 326 then
doSetCreatureOutfit(cid, typhlosion, -1)
damage = 650
end
local dmg = damage
local function damage(params)
if isCreature(params.cid) then
doAreaCombatHealth(params.cid, FIREDAMAGE, getThingPos(params.cid), rollarea, -(params.dmg), -((params.dmg)+5), 255)
end
end

local function voltar(params)
if isCreature(params.cid) then
doRemoveCondition(params.cid, CONDITION_OUTFIT)
end
end
local vezes = 2
local delay = 1000 -- não mexe
for i = 1, vezes do
addEvent(damage, delay*i, {cid = cid, dmg = dmg})
end
addEvent(voltar, 1051*vezes, {cid = cid})
end 