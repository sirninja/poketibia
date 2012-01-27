local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(cid, var)
doChangeSpeed(cid, 45)
addEvent(doChangeSpeed, 7000, cid, -45)
	doCreatureSay(cid, "FURY!", TALKTYPE_MONSTER)
	local msg = getCreatureMaster(cid)
	if isPlayer(msg) == true then
	local mon = getCreatureName(cid)
	doCreatureSay(msg, ""..mon..", use Fury!", TALKTYPE_SAY)
	end
	return doCombat(cid, combat, var)
end