local combatn1 = createCombatObject()
setCombatParam(combatn1, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combatn1, COMBAT_PARAM_EFFECT, 116)
local combatn2 = createCombatObject()
setCombatParam(combatn2, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combatn2, COMBAT_PARAM_EFFECT, 116)
local combatn3 = createCombatObject()
setCombatParam(combatn3, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combatn3, COMBAT_PARAM_EFFECT, 116)
local combatn4 = createCombatObject()
setCombatParam(combatn4, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combatn4, COMBAT_PARAM_EFFECT, 116)

local effect1 = createCombatObject()
setCombatParam(effect1, COMBAT_PARAM_TYPE, nul)
setCombatParam(effect1, COMBAT_PARAM_EFFECT, 114)
local effect2 = createCombatObject()
setCombatParam(effect2, COMBAT_PARAM_TYPE, nul)
setCombatParam(effect2, COMBAT_PARAM_EFFECT, 114)
local effect3 = createCombatObject()
setCombatParam(effect3, COMBAT_PARAM_TYPE, nul)
setCombatParam(effect3, COMBAT_PARAM_EFFECT, 114)
local effect4 = createCombatObject()
setCombatParam(effect4, COMBAT_PARAM_TYPE, nul)
setCombatParam(effect4, COMBAT_PARAM_EFFECT, 114)

arr1s = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr2s = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr3s = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr4s = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}


local area1s = createCombatArea(arr1s, arr1s)
local area2s = createCombatArea(arr2s, arr2s)
local area3s = createCombatArea(arr3s, arr3s)
local area4s = createCombatArea(arr4s, arr4s)
setCombatArea(combatn1, area1s)
setCombatArea(combatn2, area2s)
setCombatArea(combatn3, area3s)
setCombatArea(combatn4, area4s)
setCombatArea(effect1, area1s)
setCombatArea(effect2, area2s)
setCombatArea(effect3, area3s)
setCombatArea(effect4, area4s)

function onCastSpell(cid, var)
	doCreatureSay(cid, "SLIME WAVE!", TALKTYPE_MONSTER)
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
local parameters = { cid = cid, var = var}
local function gust(params)
if isMonster(params.cid) then
if isCreature(getCreatureTarget(params.cid)) then
doCombat(params.cid, params.cb, params.var)
doCombat(params.cid, params.bc, params.var)
end
end
end

addEvent(gust, 0, {cid = cid, cb = combatn1, var = var, bc = effect1})
addEvent(gust, 150, {cid = cid, cb = combatn2, var = var, bc = effect2})
addEvent(gust, 300, {cid = cid, cb = combatn3, var = var, bc = effect3})
addEvent(gust, 450, {cid = cid, cb = combatn4, var = var, bc = effect4})
return TRUE
end