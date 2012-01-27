function onUse(cid, item, fromPos, itemEx, toPos)

d1 =
{
[0] = {pokemon = 'Magikarp_s'},
}

d2 =
{
[0] = {pokemon = 'Magikarp_s'},
[1] = {pokemon = 'horsea fish'},
[2] = {pokemon = 'Poliwag_s'},
[3] = {pokemon = 'Goldeen Fish'},
[4] = {pokemon = 'krabby fish'},
}

d3 =
{
[0] = {pokemon = 'Magikarp_s'},
[1] = {pokemon = 'horsea fish'},
[2] = {pokemon = 'Poliwag_s'},
[3] = {pokemon = 'Goldeen Fish'},
[4] = {pokemon = 'krabby fish'},
[5] = {pokemon = 'Tentacool_s'},

}

d4 =
{
[0] = {pokemon = 'Magikarp_s'},
[1] = {pokemon = 'horsea fish'},
[2] = {pokemon = 'Poliwag_s'},
[3] = {pokemon = 'Goldeen Fish'},
[4] = {pokemon = 'krabby fish'},
[5] = {pokemon = 'Tentacool_s'},
[6] = {pokemon = 'Seaking_s'},

}

d5 =
{
[0] = {pokemon = 'Magikarp_s'},
[1] = {pokemon = 'horsea fish'},
[2] = {pokemon = 'Poliwag_s'},
[3] = {pokemon = 'Goldeen Fish'},
[4] = {pokemon = 'krabby fish'},
[5] = {pokemon = 'Tentacool_s'},
[6] = {pokemon = 'Seaking_s'},
[7] = {pokemon = 'Kingler_s'},
[8] = {pokemon = 'Seadra_s'},
[9] = {pokemon = 'Starmie_s'},
[10] = {pokemon = 'Poliwhirl_s'},


}

d6 =
{
[0] = {pokemon = 'Magikarp_s'},
[1] = {pokemon = 'horsea fish'},
[2] = {pokemon = 'Poliwag_s'},
[3] = {pokemon = 'Goldeen Fish'},
[4] = {pokemon = 'krabby fish'},
[5] = {pokemon = 'Tentacool_s'},
[6] = {pokemon = 'Seaking_s'},
[7] = {pokemon = 'Kingler_s'},
[8] = {pokemon = 'Seadra_s'},
[9] = {pokemon = 'Starmie_s'},
[10] = {pokemon = 'Poliwhirl_s'},
[11] = {pokemon = 'Gyarados_s'},
[12] = {pokemon = 'Tentacruel_s'},


}


local config = {
waters = {4614, 4615, 4616, 4617, 4618, 4619, 4608, 4609, 4610, 4611, 4612, 4613, 7236, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825},
}
local water = {'4820', '4821', '4822', '4823', '4824', '4825'}

local skill = getPlayerSkillLevel(cid, 6)
local playerpos = getClosestFreeTile(cid, getThingPos(cid))
if getTilePzInfo(getCreaturePosition(cid))then
 doPlayerSendCancel(cid, "Dont use rod in Protection Zone.")
return TRUE
end
if isInArray(water, getTileInfo(getThingPos(cid)).itemid) then
doPlayerSendCancel(cid, "You can\'t fish while surfing neither flying above water.")
return true
end


if(isInArray(config.waters, itemEx.itemid)) then
doSendMagicEffect(toPos, CONST_ME_LOSEENERGY)
if getPlayerSkillLevel(cid, 6) <= 255 then
doPlayerAddSkillTry(cid, 6, getConfigValue("rateSkill"))
end
if skill >= 120 then
local random = math.random(1, 100)
if random <= 35 then
local s = doSummonCreature(d6[math.random(0,12)].pokemon, playerpos)
if #getCreatureSummons(cid) >= 1 then
doMonsterSetTarget(s, getCreatureSummons(cid)[1])
else
doMonsterSetTarget(s, cid)
end
if #getCreatureSummons(cid) >= 1 then
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173)
else
doSendMagicEffect(getThingPos(cid), 173)
end
return true
end
else
if skill >= 80 and skill < 120 then
local random = math.random(1, 100)
if random <= 35 then
local s = doSummonCreature(d5[math.random(0,10)].pokemon, playerpos)
if #getCreatureSummons(cid) >= 1 then
doMonsterSetTarget(s, getCreatureSummons(cid)[1])
else
doMonsterSetTarget(s, cid)
end
if #getCreatureSummons(cid) >= 1 then
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173)
else
doSendMagicEffect(getThingPos(cid), 173)
end
return true
end
else
if skill >= 60 and skill < 80 then
local random = math.random(1, 100)
if random <= 35 then
local s = doSummonCreature(d4[math.random(0,6)].pokemon, playerpos)
if #getCreatureSummons(cid) >= 1 then
doMonsterSetTarget(s, getCreatureSummons(cid)[1])
else
doMonsterSetTarget(s, cid)
end
if #getCreatureSummons(cid) >= 1 then
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173)
else
doSendMagicEffect(getThingPos(cid), 173)
end
return true
end
else
if skill >= 40 and skill < 60 then
local random = math.random(1, 100)
if random <= 35 then
local s = doSummonCreature(d3[math.random(0,5)].pokemon, playerpos)
if #getCreatureSummons(cid) >= 1 then
doMonsterSetTarget(s, getCreatureSummons(cid)[1])
else
doMonsterSetTarget(s, cid)
end
if #getCreatureSummons(cid) >= 1 then
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173)
else
doSendMagicEffect(getThingPos(cid), 173)
end
return true
end
else
if skill >= 10 and skill < 40 then
local random = math.random(1, 100)
if random <= 35 then
local s = doSummonCreature(d2[math.random(0,4)].pokemon, playerpos)
if #getCreatureSummons(cid) >= 1 then
doMonsterSetTarget(s, getCreatureSummons(cid)[1])
else
doMonsterSetTarget(s, cid)
end
if #getCreatureSummons(cid) >= 1 then
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173)
else
doSendMagicEffect(getThingPos(cid), 173)
end
return true
end
else
if skill >= 0 and skill < 10 then
local random = math.random(1, 100)
if random <= 35 then
local s = doSummonCreature(d1[0].pokemon, playerpos)
if #getCreatureSummons(cid) >= 1 then
doMonsterSetTarget(s, getCreatureSummons(cid)[1])
else
doMonsterSetTarget(s, cid)
end
if #getCreatureSummons(cid) >= 1 then
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173)
else
doSendMagicEffect(getThingPos(cid), 173)
end
return true
end
return true
end
return true
end
return true
end
end
end
end
end


return true
end
