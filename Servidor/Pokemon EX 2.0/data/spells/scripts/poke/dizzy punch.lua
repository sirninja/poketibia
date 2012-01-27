function onCastSpell(cid, var)
	doCreatureSay(cid, "DIZZY PUNCH!", TALKTYPE_MONSTER)
		addEvent(doAreaCombatHealth, 0, getCreatureSummons(cid)[1], FIGHTINGDAMAGE, getThingPos(getCreatureTarget(cid)), 0, -0, -0, 3)
			local function throw(params)
			doSendDistanceShoot(getThingPos(params.cid), getThingPos(getCreatureTarget(params.cid)), 26)
			end
		addEvent(throw, 0, {cid = cid})
		local alvo = getCreatureTarget(cid)
		doCreatureSetNoMove(alvo, true)
		doChangeSpeed(alvo, -(getCreatureSpeed(alvo)))
			local function confuse(params)
			if isCreature(params.alvo) then
			local posa = getThingPos(params.alvo)
			random = math.random(1,1000)
				if random >= 501 then
				rx = math.random(-1,1)
					if rx ~= 0 then
					ry = 0
					else
					ry = math.random(-1,1)
					end
				else
				ry = math.random(-1,1)
					if ry ~= 0 then
					rx = 0
					else
					rx = math.random(-1,1)
					end
				end
			local posr = {x=posa.x+(rx),y=posa.y+(ry),z=posa.z}
			if isWalkable(posr, params.alvo, 0, 0) then
			doChangeSpeed(params.alvo, 175)
			doTeleportThing(params.alvo, posr, true)
			doChangeSpeed(params.alvo, -175)
			local posd = getThingPos(params.alvo)
			addEvent(doSendMagicEffect, 300, posd, 31)
			else
						random = math.random(1,1000)
				if random >= 501 then
				rx = math.random(-1,1)
					if rx ~= 0 then
					ry = 0
					else
					ry = math.random(-1,1)
					end
				else
				ry = math.random(-1,1)
					if ry ~= 0 then
					rx = 0
					else
					rx = math.random(-1,1)
					end
				end
			end
			local posr = {x=posa.x+(rx),y=posa.y+(ry),z=posa.z}
			if isWalkable(posr, params.alvo, 0, 0) then
			doChangeSpeed(params.alvo, 175)
			doTeleportThing(params.alvo, posr, true)
			doChangeSpeed(params.alvo, -175)
			local posd = getThingPos(params.alvo)
			doSendMagicEffect(posd, 31)
			end
			else
			end
			end
			local function speed(params)
			if isCreature(params.alvo) then
			doCreatureSetNoMove(params.alvo, false)
			if not isPlayer(params.alvo) then
			doChangeSpeed(params.alvo, -(getCreatureSpeed(params.alvo)))
			doChangeSpeed(params.alvo, speedselvagem[getCreatureName(params.alvo)].speed)
			else
			doChangeSpeed(params.alvo, -(getCreatureSpeed(params.alvo)))
			doChangeSpeed(params.alvo, 250)
			end
			else
			end
			end
		addEvent(confuse, 1000, {alvo = alvo})
		addEvent(confuse, 2000, {alvo = alvo})
		addEvent(confuse, 3000, {alvo = alvo})
		addEvent(confuse, 4000, {alvo = alvo})
		addEvent(confuse, 5000, {alvo = alvo})
		addEvent(confuse, 6000, {alvo = alvo})
		addEvent(speed, 6200, {alvo = alvo})
return true
end
