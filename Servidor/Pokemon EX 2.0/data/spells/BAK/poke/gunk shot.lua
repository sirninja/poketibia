local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, POISONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 116)

damage = {
{0, 0, 0, 0, 0},
{0, 1, 1, 1, 0},
{0, 1, 3, 1, 0},
{0, 1, 1, 1, 0},
{0, 0, 0, 0, 0}
}
local area = createCombatArea(damage)
setCombatArea(combat, area)


function onCastSpell(cid, var)
	doCreatureSay(cid, "GUNK SHOT!", TALKTYPE_MONSTER)
	local alvinho = getCreatureTarget(cid)
	local function rocksup(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureTarget(params.cid)) then
	if getCreatureTarget(params.cid) ~= params.alvinho then
	return true
	end
	jus = getThingPos(params.cid)
	jusa = getThingPos(getCreatureTarget(params.cid))
	if jusa.x > jus.x then
	xx = 0
	elseif jusa.x < jus.x then
	xx = -1
	else
	xx = 0
	end
	local newpos = {x = getThingPos(params.cid).x+(xx), y = jusa.y - 3, z = getThingPos(params.cid).z}
	doSendDistanceShoot(getThingPos(params.cid), newpos, 6)
	end
	end
	end

	local function rocksdown(params)
	if isCreature(params.cid) then
	if isCreature(getCreatureTarget(params.cid)) then
	if getCreatureTarget(params.cid) ~= params.alvinho then
	return true
	end
	jus = getThingPos(params.cid)
	jusa = getThingPos(getCreatureTarget(params.cid))
	if jusa.x > jus.x then
	xx = 0
	elseif jusa.x < jus.x then
	xx = -1
	else
	xx = 0
	end
	local newpos = {x = getThingPos(params.cid).x+(xx), y = jusa.y - 3, z = getThingPos(params.cid).z}
	doSendDistanceShoot(newpos, getThingPos(getCreatureTarget(params.cid)), 6)
	doCombat(params.cid, params.cb, params.var)
	end
	end
	end
	addEvent(rocksup, 0, {cid = cid, alvinho = alvinho})
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
	addEvent(rocksdown, 300, {cid = cid, alvinho = alvinho, cb = combat, var = var})

return true
end
