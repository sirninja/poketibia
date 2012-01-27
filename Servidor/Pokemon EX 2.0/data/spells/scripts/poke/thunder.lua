--Spell by Jovial
local water = {490, 491, 492, 493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}

local combat = createCombatObject()

local combat2 = createCombatObject()

local combat3 = createCombatObject()

local combat4 = createCombatObject()

local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, ELECTRICDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, 48)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -4.6, -200, -4.2, -200)

local meteore = createCombatObject()
setCombatParam(meteore, COMBAT_PARAM_TYPE, ELECTRICDAMAGE)
setCombatParam(meteore, COMBAT_PARAM_EFFECT, 48)
setCombatFormula(meteore, COMBAT_FORMULA_LEVELMAGIC, -4.6, -200, -4.2, -200)

local meteor_water = createCombatObject()
setCombatParam(meteor_water, COMBAT_PARAM_TYPE, ELECTRICDAMAGE)
setCombatParam(meteor_water, COMBAT_PARAM_EFFECT, 48)
setCombatFormula(meteor_water, COMBAT_FORMULA_LEVELMAGIC, -4.6, -200, -4.2, -200)

combat_arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0},
{0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 1, 3, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0}
}

combat_arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 3, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

combat_arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 1, 3, 0, 1, 1, 0, 0},
{0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

combat_arr4 = {
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local combat_area1 = createCombatArea(combat_arr1)
setCombatArea(combat, combat_area1)

local combat_area2 = createCombatArea(combat_arr2)
setCombatArea(combat2, combat_area2)

local combat_area3 = createCombatArea(combat_arr3)
setCombatArea(combat3, combat_area3)

local combat_area4 = createCombatArea(combat_arr4)
setCombatArea(combat4, combat_area4)

local function meteorCast(p)
        doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

local function stunEffect(cid)
        doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end

function onTargetTile(cid, pos)
        if (math.random(0, 1) == 1) then
                local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
                if (isInArray(water, ground.itemid) == TRUE) then
                        local newpos = {x = pos.x + 2, y = pos.y - 6, z = pos.z}
                        doSendDistanceShoot(newpos, pos, 41)
                        addEvent(meteorCast, 200, {cid = cid, pos = pos, combat = meteor_water})
                else
                        local newpos = {x = pos.x + 2, y = pos.y - 6, z = pos.z}
                        doSendDistanceShoot(newpos, pos, 41)
                        addEvent(meteorCast, 450, {cid = cid,pos = pos, combat = meteor})
			addEvent(meteorCast, 190, {cid = cid,pos = pos, combat = meteore})
                end
        end
end

function onTargetTile2(cid, pos)
        if (math.random(0, 1) == 1) then
                local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
                if (isInArray(water, ground.itemid) == TRUE) then
                        local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
                        doSendDistanceShoot(newpos, pos, 41)
                        addEvent(meteorCast, 200, {cid = cid, pos = pos, combat = meteor_water})
                else
                        local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
                        doSendDistanceShoot(newpos, pos, 41)
                        addEvent(meteorCast, 450, {cid = cid,pos = pos, combat = meteor})
			addEvent(meteorCast, 690, {cid = cid,pos = pos, combat = meteore})
                end
        end
end

function onTargetTile3(cid, pos)
        if (math.random(0, 1) == 1) then
                local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
                if (isInArray(water, ground.itemid) == TRUE) then
                        local newpos = {x = pos.x + 7, y = pos.y - 6, z = pos.z}
                        doSendDistanceShoot(newpos, pos, 41)
                        addEvent(meteorCast, 200, {cid = cid, pos = pos, combat = meteor_water})
                else
                        local newpos = {x = pos.x + 7, y = pos.y - 6, z = pos.z}
                        doSendDistanceShoot(newpos, pos, 41)
                        addEvent(meteorCast, 450, {cid = cid,pos = pos, combat = meteor})
			addEvent(meteorCast, 690, {cid = cid,pos = pos, combat = meteore})
                end
        end
end

function onTargetTile4(cid, pos)
        if (math.random(0, 1) == 1) then
                local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
                if (isInArray(water, ground.itemid) == TRUE) then
                        local newpos = {x = pos.x - 2, y = pos.y - 6, z = pos.z}
                        doSendDistanceShoot(newpos, pos, 41)
                        addEvent(meteorCast, 200, {cid = cid, pos = pos, combat = meteor_water})
                else
                        local newpos = {x = pos.x - 2, y = pos.y - 6, z = pos.z}
                        doSendDistanceShoot(newpos, pos, 41)
                        addEvent(meteorCast, 200, {cid = cid,pos = pos, combat = meteor})
			addEvent(meteorCast, 690, {cid = cid,pos = pos, combat = meteore})
                end
        end
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(combat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")
setCombatCallback(combat3, CALLBACK_PARAM_TARGETTILE, "onTargetTile3")
setCombatCallback(combat4, CALLBACK_PARAM_TARGETTILE, "onTargetTile4")

function onCastSpell(cid, var)
	doCreatureSay(cid, "THUNDER!", TALKTYPE_MONSTER)
	local msg = getCreatureMaster(cid)
	if isPlayer(msg) == true then
	local mon = getCreatureName(cid)
	doCreatureSay(msg, ""..mon..", use Thunder!", TALKTYPE_SAY)
	end
	addEvent(doCombat, 300, cid, combat, var)
	addEvent(doCombat, 600, cid, combat2, var)
	addEvent(doCombat, 900, cid, combat3, var)
	addEvent(doCombat, 1200, cid, combat4, var)
	return doCombat(cid, combat, var)
end