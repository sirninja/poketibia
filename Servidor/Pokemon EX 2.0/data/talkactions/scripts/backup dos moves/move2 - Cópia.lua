-- WATER GUN
local wg1n = createCombatArea{
{0, 0, 0}, 
{0, 2, 0}, 
{0, 1, 0}, 
}

local waba = createCombatArea{
	{0, 1, 1, 1, 0},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0}
}

local wg2n = createCombatArea{
{0, 2, 0},
{0, 0, 0},
{0, 1, 0}, 
{0, 1, 0}, 
{0, 1, 0}, 
}
local wg3n = createCombatArea{
{0, 2, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0}, 
{0, 0, 0}, 
{0, 1, 0}, 
}

local wg1s = createCombatArea{
{0, 1, 0}, 
{0, 2, 0}, 
{0, 0, 0}, 
}
local wg2s = createCombatArea{
{0, 1, 0},
{0, 1, 0},
{0, 1, 0}, 
{0, 0, 0}, 
{0, 2, 0}, 
}
local wg3s = createCombatArea{
{0, 1, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0}, 
{0, 0, 0}, 
{0, 2, 0}, 
}

local wg1e = createCombatArea{
{0, 0, 0}, 
{1, 2, 0}, 
{0, 0, 0}, 
}
local wg2e = createCombatArea{ 
{1, 1, 1, 0, 2}, 
}
local wg3e = createCombatArea{ 
{1, 0, 0, 0, 0, 2}, 
}

local wg1w = createCombatArea{
{0, 0, 0}, 
{0, 2, 1}, 
{0, 0, 0}, 
}
local wg2w = createCombatArea{ 
{2, 0, 1, 1, 1}, 
}
local wg3w = createCombatArea{ 
{2, 0, 0, 0, 0, 1}, 
}
-- WATER GUN END

-- SAND ATTACK
local sa1n = createCombatArea{
{0, 0, 0}, 
{0, 2, 0}, 
{0, 1, 0}, 
}
local sa2n = createCombatArea{
{0, 2, 0}, 
{0, 0, 0}, 
{0, 1, 0}, 
}
local sa3n = createCombatArea{
{0, 2, 0}, 
{0, 0, 0}, 
{0, 0, 0},
{0, 1, 0}, 
}
local sa4n = createCombatArea{
{0, 2, 0}, 
{0, 0, 0}, 
{0, 0, 0},
{0, 0, 0}, 
{0, 1, 0}, 
}

local sa1s = createCombatArea{
{0, 1, 0}, 
{0, 2, 0}, 
{0, 0, 0}, 
}
local sa2s = createCombatArea{
{0, 1, 0}, 
{0, 0, 0}, 
{0, 2, 0}, 
}
local sa3s = createCombatArea{
{0, 1, 0}, 
{0, 0, 0}, 
{0, 0, 0},
{0, 2, 0}, 
}
local sa4s = createCombatArea{
{0, 1, 0}, 
{0, 0, 0}, 
{0, 0, 0},
{0, 0, 0}, 
{0, 2, 0}, 
}

local sa1w = createCombatArea{ 
{2, 1, 0, 0, 0, 0}, 
}
local sa2w = createCombatArea{ 
{2, 0, 1, 0, 0, 0}, 
}
local sa3w = createCombatArea{ 
{2, 0, 0, 1, 0, 0}, 
}
local sa4w = createCombatArea{ 
{2, 0, 0, 0, 1, 0}, 
}

local sa1e = createCombatArea{ 
{0, 0, 0, 0, 1, 2}, 
}
local sa2e = createCombatArea{ 
{0, 0, 0, 1, 0, 2}, 
}
local sa3e = createCombatArea{ 
{0, 0, 1, 0, 0, 2}, 
}
local sa4e = createCombatArea{ 
{0, 1, 0, 0, 0, 2}, 
}
-- SAND ATTACK END
local pokeis = {'Pidgey', 'Pidgeotto', 'Pidgeot', 'Rattata', 'Raticate', 'Zubat', 'Golbat',
 'Bellsprout', 'Weepinbell', 'Victreebel', 'Poliwag', 'Poliwhirl', 'Poliwrath', 'Abra', 'Oddish',
'Gloom', 'Vileplume', 'Horsea', 'Seadra', 'Grimer', 'Muk', 'Weedle', 'Kakuna', 'Beedrill'}
local c = {
["Pidgey"] = {x = {
			spell = "Peck",
			minLv = 1,
			ex = 1600002,
			base1 = 35,
			base2 = 45,
			dista = 1,
			bonus = 3,
			type = "flying",
			cd = 9
		     }
		 },
["Pidgeotto"] = {x = {
			spell = "Peck",
			minLv = 1,
			ex = 1700002,
			base1 = 100,
			base2 = 140,
			dista = 1,
			bonus = 3,
			type = "flying",
			cd = 9
		     }
		 },
["Pidgeot"] = {x = {
			spell = "Peck",
			minLv = 1,
			ex = 1800002,
			base1 = 260,
			base2 = 300,
			dista = 1,
			bonus = 5,
			type = "flying",
			cd = 9
		     }
		 },
["Rattata"] = {x = {
			spell = "Scratch",
			minLv = 1,
			ex = 1900002,
			base1 = 40,
			base2 = 50,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 9
		     }
		 },
["Raticate"] = {x = {
			spell = "Scratch",
			minLv = 1,
			ex = 2000002,
			base1 = 140,
			base2 = 150,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 9
		     }
		 },
["Zubat"] = {x = {
			spell = "Absorb",
			minLv = 7,
			ex = 4100002,
			base1 = 20,
			base2 = 25,
			dista = 1,
			bonus = 3,
			type = "grass",
			cd = 14
		     }
		 },
["Golbat"] = {x = {
			spell = "Absorb",
			minLv = 30,
			ex = 4200002,
			base1 = 150,
			base2 = 180,
			dista = 1,
			bonus = 5,
			type = "grass",
			cd = 14
		     }
		 },
["Bellsprout"] = {x = {
			spell = "Razor Leaf",
			minLv = 7,
			ex = 6900002,
			base1 = 10,
			base2 = 20,
			dista = 4,
			bonus = 2,
			type = "grass",
			cd = 12
		     }
		 },
["Weepinbell"] = {x = {
			spell = "Razor Leaf",
			minLv = 20,
			ex = 7000002,
			base1 = 90,
			base2 = 100,
			dista = 4,
			bonus = 3,
			type = "grass",
			cd = 12
		     }
		 },
["Victreebel"] = {x = {
			spell = "Razor Leaf",
			minLv = 20,
			ex = 7100002,
			base1 = 190,
			base2 = 220,
			dista = 4,
			bonus = 3,
			type = "grass",
			cd = 12
		     }
		 },
["Poliwag"] = {x = {
			spell = "Bubbles",
			minLv = 6,
			ex = 6000002,
			base1 = 20,
			base2 = 30,
			dista = 4,
			bonus = 2,
			type = "water",
			cd = 10
		     }
		 },
["Poliwhirl"] = {x = {
			spell = "Bubbles",
			minLv = 20,
			ex = 6100002,
			base1 = 80,
			base2 = 90,
			dista = 4,
			bonus = 3,
			type = "water",
			cd = 10
		     }
		 },
["Poliwrath"] = {x = {
			spell = "Waterball",
			minLv = 20,
			ex = 6200002,
			base1 = 550,
			base2 = 580,
			dista = 4,
			bonus = 5,
			type = "water",
			cd = 16
		     }
		 },
["Abra"] = {x = {
			spell = "Restore",
			minLv = 13,
			ex = 6300002,
			base1 = 70,
			base2 = 140,
			dista = 100,
			bonus = 5,
			target = "no",
			type = "normal",
			cd = 26
		     }
		 },
["Oddish"] = {x = {
			spell = "Acid",
			minLv = 7,
			ex = 4300002,
			base1 = 54,
			base2 = 64,
			dista = 4,
			bonus = 3,
			type = "poison",
			cd = 14
		     }
		 },
["Gloom"] = {x = {
			spell = "Acid",
			minLv = 7,
			ex = 4400002,
			base1 = 114,
			base2 = 134,
			dista = 4,
			bonus = 4,
			type = "poison",
			cd = 14
		     }
		 },
["Vileplume"] = {x = {
			spell = "Acid",
			minLv = 7,
			ex = 4500002,
			base1 = 414,
			base2 = 534,
			dista = 4,
			bonus = 6,
			type = "poison",
			cd = 14
		     }
		 },
["Horsea"] = {x = {
			spell = "Water Pulse",
			minLv = 10,
			ex = 1160002,
			base1 = 50,
			base2 = 55,
			dista = 4,
			bonus = 4,
			type = "water",
			cd = 13
		     }
		 },
["Seadra"] = {x = {
			spell = "Water Pulse",
			minLv = 6,
			ex = 1170002,
			base1 = 410,
			base2 = 415,
			dista = 4,
			bonus = 6,
			type = "water",
			cd = 13
		     }
		 },
["Grimer"] = {x = {
			spell = "Acid",
			minLv = 6,
			ex = 8800002,
			base1 = 60,
			base2 = 70,
			dista = 5,
			bonus = 5,
			type = "poison",
			cd = 14
		     }
		 },
["Muk"] = {x = {
			spell = "Acid",
			minLv = 6,
			ex = 8900002,
			base1 = 210,
			base2 = 220,
			dista = 5,
			bonus = 6,
			type = "poison",
			cd = 14
		     }
		 },
["Weedle"] = {x = {
			spell = "String Shot",
			minLv = 1,
			ex = 1300002,
			base1 = 45,
			base2 = 50,
			dista = 3,
			bonus = 3,
			type = "bug",
			cd = 9
		     }
		 },
["Kakuna"] = {x = {
			spell = "String Shot",
			minLv = 1,
			ex = 1400002,
			base1 = 85,
			base2 = 90,
			dista = 3,
			bonus = 4,
			type = "bug",
			cd = 9
		     }
		 },
["Beedrill"] = {x = {
			spell = "String Shot",
			minLv = 1,
			ex = 1500002,
			base1 = 165,
			base2 = 170,
			dista = 3,
			bonus = 5,
			type = "bug",
			cd = 10
		     }
		 },
}

function onSay(cid)	
	if #getCreatureSummons(cid) == 0 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need a pokemon to use moves.")
	return 0
	end
		pokemon = c[getCreatureName(getCreatureSummons(cid)[1])]
		if not isInArray(pokeis, getCreatureName(getCreatureSummons(cid)[1])) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Your pokemon doesn\'t recognize this move.")
	return 0
	end
	if getPlayerLevel(cid) < c[getCreatureName(getCreatureSummons(cid)[1])].x.minLv then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don\'t have enough level to use this move.")
	return 0
	end
	if exhaustion.get(cid, pokemon.x.ex) then
		seconds = math.floor(((exhaustion.get(cid, pokemon.x.ex)) + 1))
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have to wait "..seconds.." seconds to use this move again.")
		return 0
		end
if pokemon.x.target ~= "no" then
	if not isMonster(getCreatureTarget(cid)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don\'t have any targets.")
	return 0
	end

	pokemon = c[getCreatureName(getCreatureSummons(cid)[1])]
	if getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid))) > pokemon.x.dista then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Get closer to the target to use this move.")
	return 0
	end

	if pokemon.x.type == "flying" then
		if isInArray(flying2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(flying1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "ground" then
		if isInArray(ground2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(ground1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		elseif isInArray(ground0, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_ENERGYDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "electric" then
		if isInArray(electric2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(electric1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		elseif isInArray(electric0, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_ENERGYDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "ghost" then
		if isInArray(ghost2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(ghost1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		elseif isInArray(ghost0, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_ENERGYDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "normal" then
		if isInArray(normal1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		elseif isInArray(normal0, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_ENERGYDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "fighting" then
		if isInArray(fighting2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(fighting1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		elseif isInArray(fighting0, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_ENERGYDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "poison" then
		if isInArray(poison2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(poison1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "rock" then
		if isInArray(rock2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(rock1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "bug" then
		if isInArray(bug2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(bug1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "fire" then
		if isInArray(fire2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(fire1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "water" then
		if isInArray(water2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(water1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "grass" then
		if isInArray(grass2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(grass1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "psychic" then
		if isInArray(psychic2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(psychic1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "ice" then
		if isInArray(ice2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(ice1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	elseif pokemon.x.type == "dragon" then
		if isInArray(dragon2, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_EARTHDAMAGE
		elseif isInArray(dragon1, getCreatureName(getCreatureTarget(cid))) then
		element = COMBAT_FIREDAMAGE
		else
		element = COMBAT_PHYSICALDAMAGE
		end
	else
	element = COMBAT_PHYSICALDAMAGE
	end
else
end

	local num1 = (pokemon.x.base1)
	local num2 = (pokemon.x.base2)
	local num3 = (pokemon.x.bonus)
	if pokemon.x.spell == "Water Gun" then
	
		alvo = getCreatureName(getCreatureTarget(cid))
		if getCreatureLookDir(getCreatureSummons(cid)[1]) == 0 then
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg1n, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 74)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg2n, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 75)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg3n, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 76)
		elseif getCreatureLookDir(getCreatureSummons(cid)[1]) == 2 then
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg1s, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 77)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg2s, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 75)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg3s, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 78)
		elseif getCreatureLookDir(getCreatureSummons(cid)[1]) == 1 then
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg1e, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 69)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg2e, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 70)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg3e, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 71)
		elseif getCreatureLookDir(getCreatureSummons(cid)[1]) == 3 then
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg1w, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 72)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg2w, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 70)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureSummons(cid)[1]), wg3w, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 73)
		end
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		return 0
	elseif pokemon.x.spell == "Peck" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 3)
		return 0
	elseif pokemon.x.spell == "Scratch" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 142)
		return 0
	elseif pokemon.x.spell == "Absorb" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 14)
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 14)
		if element == COMBAT_EARTHDAMAGE then
		els = 2
		elseif element == COMBAT_FIREDAMAGE then
		els = 0.5
		else
		els = 1
		end
		doCreatureAddHealth(getCreatureSummons(cid)[1], ((num2)+((getPlayerLevel(cid))*(num3))*els))
		doSendAnimatedText(getThingPos(getCreatureSummons(cid)[1]), "+"..((num2)+((getPlayerLevel(cid))*(num3))).."", 35)
		return 0
	elseif pokemon.x.spell == "Razor Leaf" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
			local function throw(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doSendDistanceShoot(getThingPos(getCreatureSummons(params.cid)[1]), getThingPos(getCreatureTarget(params.cid)), 8)
			else
			end
			end
			local function damage(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doAreaCombatHealth(params.cid, element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 79)
			else
			end
			end
		addEvent(damage, 100, {cid = cid})
		addEvent(damage, 600, {cid = cid})
		addEvent(throw, 0, {cid = cid})
		addEvent(throw, 550, {cid = cid})
		return 0
	elseif pokemon.x.spell == "Bubbles" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
			local function throw(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doSendDistanceShoot(getThingPos(getCreatureSummons(params.cid)[1]), getThingPos(getCreatureTarget(params.cid)), 2)
			else
			end
			end
			local function damage(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doAreaCombatHealth(params.cid, element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 25)
			else
			end
			end
		addEvent(throw, 0, {cid = cid})
		addEvent(damage, 0, {cid = cid})
		return 0
	elseif pokemon.x.spell == "Waterball" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
			local function throw(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doSendDistanceShoot(getThingPos(getCreatureSummons(params.cid)[1]), getThingPos(getCreatureTarget(params.cid)), 2)
			else
			end
			end
			local function damage(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doAreaCombatHealth(params.cid, element, getThingPos(getCreatureTarget(cid)), waba, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 68)
			else
			end
			end
		addEvent(damage, 100, {cid = cid})
		addEvent(throw, 0, {cid = cid})
		return 0
	elseif pokemon.x.spell == "Restore" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 14)
		doCreatureAddHealth(getCreatureSummons(cid)[1], ((num2)+((getPlayerLevel(cid))*(num3))))
		doSendAnimatedText(getThingPos(getCreatureSummons(cid)[1]), "+"..((num2)+((getPlayerLevel(cid))*(num3))).."", 35)
		return 0
elseif pokemon.x.spell == "Acid" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 14)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 20)
		return 0
	elseif pokemon.x.spell == "Water Pulse" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
			local function throw(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doSendDistanceShoot(getThingPos(getCreatureSummons(params.cid)[1]), getThingPos(getCreatureTarget(params.cid)), 33)
			else
			end
			end
			local function damage(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doAreaCombatHealth(cid, element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 68)
			else
			end
			end
		addEvent(throw, 0, {cid = cid})
		addEvent(damage, 0, {cid = cid})
		return 0
	elseif pokemon.x.spell == "String Shot" then
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureName(getCreatureSummons(cid)[1])].x.spell).."!", TALKTYPE_MONSTER)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", use "..c[getCreatureName(getCreatureSummons(cid)[1])].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		local alvo = getCreatureTarget(cid)
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 23)
		doAreaCombatHealth(cid, element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 137)
		local function string(params)
		if isCreature(params.alvo) then
		doSendMagicEffect(getThingPos(params.alvo), 137)
		end
		end
		addEvent(string, 250, {alvo = alvo})
		addEvent(string, 500, {alvo = alvo})
		addEvent(string, 750, {alvo = alvo})
		addEvent(string, 1000, {alvo = alvo})
		addEvent(string, 1250, {alvo = alvo})
		addEvent(string, 1500, {alvo = alvo})
		addEvent(string, 1750, {alvo = alvo})
		addEvent(string, 2000, {alvo = alvo})
		addEvent(string, 2250, {alvo = alvo})
		addEvent(string, 2500, {alvo = alvo})
		addEvent(string, 2750, {alvo = alvo})
		addEvent(string, 3000, {alvo = alvo})
		return 0
	end
return 0
end
	