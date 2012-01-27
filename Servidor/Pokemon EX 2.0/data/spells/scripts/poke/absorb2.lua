function onCastSpell(cid, var)
	doCreatureSay(cid, "ABSORB!", TALKTYPE_MONSTER)
		if isInArray(grass2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(grass1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
if element == COMBAT_EARTHDAMAGE then
	doCreatureAddHealth(cid, 280)
	doCreatureAddHealth(getCreatureTarget(cid), -280)
	doSendMagicEffect(getThingPos(cid), 14)
	doSendMagicEffect(getThingPos(getCreatureTarget(cid)), 14)
	doSendAnimatedText(getThingPos(cid), "+280", 35)
elseif element == COMBAT_FIREDAMAGE then
	doCreatureAddHealth(cid, 70)
	doCreatureAddHealth(getCreatureTarget(cid), -70)
	doSendMagicEffect(getThingPos(cid), 14)
	doSendMagicEffect(getThingPos(getCreatureTarget(cid)), 14)
	doSendAnimatedText(getThingPos(cid), "+70", 35)
else
	doCreatureAddHealth(cid, 140)
	doCreatureAddHealth(getCreatureTarget(cid), -140)
	doSendMagicEffect(getThingPos(cid), 14)
	doSendMagicEffect(getThingPos(getCreatureTarget(cid)), 14)
	doSendAnimatedText(getThingPos(cid), "+140", 35)
end
end
