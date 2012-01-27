local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, i])
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 1, 2)

local area = createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	local msg = getCreatureMaster(cid)
	if isPlayer(msg) == true then
	local mon = getCreatureName(cid)
	doCreatureSay(msg, ""..mon..", Psy Wave!", TALKTYPE_SAY)
	end
        local d = getCreatureLookDirection(cid)
        for i = dir[d][1], dir[d][2] do doCombat(cid, combat[i], numberToVariant(cid)) end
        return true
end
