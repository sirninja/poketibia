local golem = {lookType = 288}
local sandshrew = {lookType = 284}
local sandslash = {lookType = 285}
local electrode = {lookType = 286}
local voltorb = {lookType = 287}
local phanpy = {lookType = 480}
local donphan = {lookType = 482}
local miltank = {lookType = 481}


local rollarea = createCombatArea{
{1, 1, 1},
{1, 2, 1},
{1, 1, 1},
}

function onCastSpell(cid, var)
if getCreatureCondition(cid, CONDITION_OUTFIT) == true then
return true
end
doCreatureSay(cid, "ROLLOUT!", TALKTYPE_MONSTER)

if getCreatureOutfit(cid).lookType == 116 then
doSetCreatureOutfit(cid, golem, -1)
damage = 140
elseif getCreatureOutfit(cid).lookType == 125 then
doSetCreatureOutfit(cid, electrode, -1)
damage = 70
elseif getCreatureOutfit(cid).lookType == 123 then
doSetCreatureOutfit(cid, voltorb, -1)
damage = 30
elseif getCreatureOutfit(cid).lookType == 115 then
doSetCreatureOutfit(cid, sandslash, -1)
damage = 85
elseif getCreatureOutfit(cid).lookType == 43 then
doSetCreatureOutfit(cid, sandshrew, -1)
damage = 40
elseif getCreatureOutfit(cid).lookType == 403 then
doSetCreatureOutfit(cid, phanpy, -1)
damage = 40
elseif getCreatureOutfit(cid).lookType == 405 then
doSetCreatureOutfit(cid, donphan, -1)
damage = 130
elseif getCreatureOutfit(cid).lookType == 408 then
doSetCreatureOutfit(cid, miltank, -1)
damage = 110
end
local dmg = damage
local function damage(params)
if isCreature(params.cid) then
doAreaCombatHealth(params.cid, GROUNDDAMAGE, getThingPos(params.cid), rollarea, -(params.dmg), -((params.dmg)+5), 255)
end
end

local function voltar(params)
if isCreature(params.cid) then
doRemoveCondition(params.cid, CONDITION_OUTFIT)
end
end
local vezes = 8
local delay = 1000 -- não mexe
for i = 1, vezes do
addEvent(damage, delay*i, {cid = cid, dmg = dmg})
end
addEvent(voltar, 1051*vezes, {cid = cid})
end 