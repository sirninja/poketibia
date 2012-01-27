local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)


local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)


local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ANI_HOLY)


local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)


local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combat5, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)


local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
setCombatParam(combat6, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNOWBALL)

local combat7 = createCombatObject()
setCombatParam(combat7, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat7, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)

local combat8 = createCombatObject()
setCombatParam(combat8, COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)
setCombatParam(combat8, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)

local combat9 = createCombatObject()
setCombatParam(combat9, COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
setCombatParam(combat9, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)

local combat10 = createCombatObject()
setCombatParam(combat10, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat10, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

local combat11 = createCombatObject()
setCombatParam(combat11, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat11, COMBAT_PARAM_EFFECT, CONST_ANI_HOLY)

local combat12 = createCombatObject()
setCombatParam(combat12, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
setCombatParam(combat12, COMBAT_PARAM_EFFECT, CONST_ANI_EARTH)

local combat13 = createCombatObject()
setCombatParam(combat13, COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
setCombatParam(combat13, COMBAT_PARAM_EFFECT, CONST_ANI_FIRE)

local combat14 = createCombatObject()
setCombatParam(combat14, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat14, COMBAT_PARAM_EFFECT, CONST_ANI_THROWINGSTAR)


local combat15 = createCombatObject()
setCombatParam(combat15, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat15, COMBAT_PARAM_EFFECT, CONST_ANI_LARGEROCK)

local combat16 = createCombatObject()
setCombatParam(combat16, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat16, COMBAT_PARAM_EFFECT, CONST_ANI_FIRE)

local combat17 = createCombatObject()
setCombatParam(combat17, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatParam(combat17, COMBAT_PARAM_EFFECT, CONST_ANI_ENERGY)

local combat18 = createCombatObject()
setCombatParam(combat18, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat18, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)

local combat19 = createCombatObject()
setCombatParam(combat19, COMBAT_PARAM_EFFECT, CONST_ME_GIFT_WRAPS)
setCombatParam(combat19, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WHIRLWINDSWORD)

local combat20 = createCombatObject()
setCombatParam(combat20, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat20, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local combat21 = createCombatObject()
setCombatParam(combat21, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat21, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNOWBALL)

local combat22 = createCombatObject()
setCombatParam(combat22, COMBAT_PARAM_EFFECT, CONST_ME_BATS)
setCombatParam(combat22, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

local combat23 = createCombatObject()
setCombatParam(combat23, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat23, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local combat24 = createCombatObject()
setCombatParam(combat24, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat24, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local area24 = createCombatArea({
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1}
})

setCombatArea(combat24, area24)


local combat25 = createCombatObject()
setCombatParam(combat25, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combat25, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)

local area25 = createCombatArea({
        {1, 0, 0, 1, 1},
        {1, 0, 1, 0, 1},
        {0, 1, 3, 1, 0},
        {1, 0, 1, 0, 1},
        {0, 1, 0, 1, 1}
})

setCombatArea(combat25, area25)

local combat26 = createCombatObject()
setCombatParam(combat26, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatParam(combat26, COMBAT_PARAM_EFFECT, CONST_ANI_ENERGY)

local area26 = createCombatArea({
        {0, 0, 0, 0, 0},
        {0, 0, 1, 0, 0},
        {0, 1, 3, 1, 0},
        {0, 0, 1, 0, 0},
        {0, 0, 0, 0, 0}
})

setCombatArea(combat26, area26)

local combat27 = createCombatObject()
setCombatParam(combat27, COMBAT_PARAM_EFFECT, CONST_ME_SMOKE)
setCombatParam(combat27, COMBAT_PARAM_EFFECT, CONST_ANI_POISON)

local combat28 = createCombatObject()
setCombatParam(combat28, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat28, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local area28 = createCombatArea({
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1}
})

setCombatArea(combat28, area28)

local combat29 = createCombatObject()
setCombatParam(combat29, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat29, COMBAT_PARAM_EFFECT, CONST_ANI_HOLY)

local area29 = createCombatArea({
        {1, 0, 0, 0, 1},
        {0, 1, 0, 1, 0},
        {0, 0, 3, 0, 0},
        {0, 1, 0, 1, 0},
        {1, 0, 0, 0, 1}
})

local combat30 = createCombatObject()
setCombatParam(combat30, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat30, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local area30 = createCombatArea({
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1}
})

setCombatArea(combat30, area30)

local combat31 = createCombatObject()
setCombatParam(combat31, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat31, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)

local area31 = createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat31, area31)


pokemon_spells = {
["Agumon"] = {combat1, COMBAT_FIREDAMAGE, -40, -70},
["Guilmon"] = {combat2, COMBAT_FIREDAMAGE, -50, -80},
["Veemon"] = {combat3, COMBAT_PHYSICALDAMAGE, -30, -60},
["Agumon Savers"] = {combat4, COMBAT_FIREDAMAGE, -40, -75},
["Renamon"] = {combat5, COMBAT_HOLYDAMAGE, -50, -80},
["Terriermon"] = {combat6, COMBAT_EARTHDAMAGE, -40, -70},
["Gabumon"] = {combat7, COMBAT_ICEDAMAGE, -40, -70},
["Palmon"] = {combat8, COMBAT_EARTHDAMAGE, -30, -60},
["Wormmon"] = {combat9, COMBAT_EARTHDAMAGE, -20, -50},
["Lopmon"] = {combat10, COMBAT_DEATHDAMAGE, -55, -85},
["Gaomon"] = {combat11, COMBAT_PHYSICALDAMAGE, -60, -90},
["Raramon"] = {combat12, COMBAT_EARTHDAMAGE, -60, -80},
["Biyomon"] = {combat13, COMBAT_FIREDAMAGE, -60, -100},
["Falcomon"] = {combat14, COMBAT_DEATHDAMAGE, -60, -80},
["Armadilomon"] = {combat15, COMBAT_EARTHDAMAGE, -60, -80},
["Black Agumon"] = {combat16, COMBAT_DEATHDAMAGE, -100, -120},
["Tentomon"] = {combat17, COMBAT_ENERGYDAMAGE, -50, -80},
["Gomamon"] = {combat18, COMBAT_ICEDAMAGE, -50, -80},
["Hawkmon"] = {combat19, COMBAT_PHYSICALDAMAGE, -50, -80},
["Impmon"] = {combat20, COMBAT_ICEDAMAGE, -50, -80},
["Patamon"] = {combat21, COMBAT_HOLYDAMAGE, -30, -40},
["Picodevimon"] = {combat22, COMBAT_DEATHDAMAGE, -40, -50},
["Dorumon"] = {combat23, COMBAT_FIREDAMAGE, -60, -90},
["Greymon"] = {combat24, COMBAT_FIREDAMAGE, -140, -170},
["Kyubimon"] = {combat25, COMBAT_HOLYDAMAGE, -130, -160},
["Kabuterimon"] = {combat26, COMBAT_ENERGYDAMAGE, -130, -160},
["Stingmon"] = {combat27, COMBAT_ENERGYDAMAGE, -180, -200},
["Growlmon"] = {combat28, COMBAT_FIREDAMAGE, -130, -150},
["Exveemon"] = {combat29, COMBAT_PHYSICALDAMAGE, -130, -150},
["Geogreymon"] = {combat30, COMBAT_FIREDAMAGE, -130, -150},
["Garurumon"] = {combat30, COMBAT_ICEDAMAGE, -130, -150}    
}





function onCastSpell(cid, var)
        playerLevel = getPlayerLevel(cid)
        return doPokemonCombat(cid, var)
end

------------------------------------------------
------------------------------------------------
------------------------------------------------


function createPokemonDamage1(cid, target)
        local name = getCreatureName(cid) --- monster
        local pid = getCreatureMaster(cid) --- player

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage2(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage3(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage4(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage5(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage6(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage7(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage8(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage9(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage10(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage11(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage12(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage13(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage14(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage15(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage16(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage17(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end


function createPokemonDamage18(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end


function createPokemonDamage19(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end


function createPokemonDamage20(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end


function createPokemonDamage21(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage22(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage23(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end


function createPokemonDamage24(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage25(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage26(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage27(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage28(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage29(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage30(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end

function createPokemonDamage31(cid, target)
        local name = getCreatureName(cid)
        local pid = getCreatureMaster(cid)

        if pid == cid or target == pid then
        return true
        end
        
        return doTargetCombatHealth(cid, target, pokemon_spells[name][2], pokemon_spells[name][3], pokemon_spells[name][4], 0)
end




setCombatCallback(combat1, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage1")
setCombatCallback(combat2, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage2")
setCombatCallback(combat3, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage3")
setCombatCallback(combat4, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage4")
setCombatCallback(combat5, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage5")
setCombatCallback(combat6, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage6")
setCombatCallback(combat7, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage7")
setCombatCallback(combat8, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage8")
setCombatCallback(combat9, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage9")
setCombatCallback(combat10, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage10")
setCombatCallback(combat11, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage11")
setCombatCallback(combat12, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage12")
setCombatCallback(combat13, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage13")
setCombatCallback(combat14, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage14")
setCombatCallback(combat15, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage15")
setCombatCallback(combat16, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage16")
setCombatCallback(combat17, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage17")
setCombatCallback(combat18, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage18")
setCombatCallback(combat19, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage19")
setCombatCallback(combat20, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage20")
setCombatCallback(combat21, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage21")
setCombatCallback(combat22, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage22")
setCombatCallback(combat23, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage23")
setCombatCallback(combat24, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage24")
setCombatCallback(combat25, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage25")
setCombatCallback(combat26, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage26")
setCombatCallback(combat27, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage27")
setCombatCallback(combat28, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage28")
setCombatCallback(combat29, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage29")
setCombatCallback(combat30, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage30")
setCombatCallback(combat31, CALLBACK_PARAM_TARGETCREATURE, "createPokemonDamage31")