local dynpun1 = createCombatArea{
{1, 0, 0}, 
{0, 2, 0}, 
{0, 0, 0}, 
}

local dynpun2 = createCombatArea{
{0, 0, 0}, 
{0, 2, 0}, 
{0, 0, 1}, 
}


local dynpun3 = createCombatArea{
{0, 0, 0}, 
{1, 2, 0}, 
{0, 0, 0}, 
}


local dynpun4 = createCombatArea{
{0, 0, 1}, 
{0, 2, 0}, 
{0, 0, 0}, 
}


local dynpun5 = createCombatArea{
{0, 0, 0}, 
{0, 2, 0}, 
{0, 1, 0}, 
}


local c = {
["Poliwrath"] = {x = {
			m1 = combat1,
			spell = "Dynamic Punch",
			minLv = 40,
			ex = 2326158,
			cd = 1
		     }
		 },
}

function onCastSpell(cid)
	
	if #getCreatureSummons(cid) == 0 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need a pokemon to use moves.")
	return true
	end
	if getPlayerLevel(cid) < c[getCreatureName(getCreatureSummons(cid)[1])].x.minLv then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don\'t have enough level to use this move.")
	return true
	end
	if not isMonster(getCreatureTarget(cid)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don\'t have any targets.")
	return true
	end

	pokemon = c[getCreatureName(getCreatureSummons(cid)[1])]

	if pokemon.x.spell == "Dynamic Punch" then
	
		if exhaustion.get(cid, pokemon.x.ex) then
		seconds = math.floor(((exhaustion.get(cid, pokemon.x.ex)) + 1))
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have to wait "..seconds.." seconds to use this move again.")
		return true
		end
		alvo = getCreatureName(getCreatureTarget(cid))
		doAreaCombatHealth(getCreatureSummons(cid)[1], COMBAT_PHYSICALDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -(600+(getPlayerLevel(cid)*6)), -(850+(getPlayerLevel(cid)*8)), 112)
		doAreaCombatHealth(getCreatureSummons(cid)[1], COMBAT_PHYSICALDAMAGE, getThingPos(getCreatureTarget(cid)), dynpun1, 0, 0, 17)
		addEvent(doAreaCombatHealth, 105, getCreatureSummons(cid)[1], COMBAT_PHYSICALDAMAGE, getThingPos(getCreatureTarget(cid)), dynpun1, 0, 0, 17)
		addEvent(doAreaCombatHealth, 250, getCreatureSummons(cid)[1], COMBAT_PHYSICALDAMAGE, getThingPos(getCreatureTarget(cid)), dynpun2, 0, 0, 17)
		addEvent(doAreaCombatHealth, 400, getCreatureSummons(cid)[1], COMBAT_PHYSICALDAMAGE, getThingPos(getCreatureTarget(cid)), dynpun3, 0, 0, 17)
		addEvent(doAreaCombatHealth, 555, getCreatureSummons(cid)[1], COMBAT_PHYSICALDAMAGE, getThingPos(getCreatureTarget(cid)), dynpun4, 0, 0, 17)
		addEvent(doAreaCombatHealth, 700, getCreatureSummons(cid)[1], COMBAT_PHYSICALDAMAGE, getThingPos(getCreatureTarget(cid)), dynpun5, 0, 0, 17)
		doCreatureSay(getCreatureSummons(cid)[1], string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell), TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		return true
	end
return true
end
	