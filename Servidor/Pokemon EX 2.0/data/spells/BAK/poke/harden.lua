local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 8500)
setConditionFormula(condition, 1, -70, 1, -70)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
if getPlayerStorageValue(cid, 4) >= 1 then
return true
end
	doCreatureSay(cid, "HARDEN!", TALKTYPE_MONSTER)
			local function efect(params)
			if isCreature(params.cid) then
			if getPlayerStorageValue(params.cid, 4) >= 1 then
			doSendMagicEffect(getThingPos(params.cid), 144)
			end
			end
			end
			
	local function chard(params)
		if isCreature(params.cid) then
		if getPlayerStorageValue(params.cid, 4) >= 1 then
		setPlayerStorageValue(params.cid, 4, -1)
		end
		end
		end
    setPlayerStorageValue(cid, 4, 1)
		addEvent(efect, 100, {cid = cid, hardname = hardname})
		addEvent(efect, 1600, {cid = cid, hardname = hardname})
		addEvent(efect, 3100, {cid = cid, hardname = hardname})
		addEvent(efect, 4600, {cid = cid, hardname = hardname})
		addEvent(efect, 6100, {cid = cid, hardname = hardname})
		addEvent(efect, 7600, {cid = cid, hardname = hardname})
		addEvent(efect, 9100, {cid = cid, hardname = hardname})
		addEvent(efect, 10600, {cid = cid, hardname = hardname})
		addEvent(chard, 11000, {cid = cid})
    return true
end