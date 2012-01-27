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
	doCreatureSay(cid, "FUTURE SIGHT!", TALKTYPE_MONSTER)
			doSendMagicEffect(getThingPos(cid), 132)
			
	local function chard(params)
		if isCreature(params.cid) then
		if getPlayerStorageValue(params.cid, 35) >= 1 then
		setPlayerStorageValue(params.cid, 35, -1)
		end
		end
		end
    setPlayerStorageValue(cid, 35, 1)
		addEvent(chard, 6000, {cid = cid})
    return true
end