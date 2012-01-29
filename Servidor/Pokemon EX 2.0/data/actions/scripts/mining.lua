------------------------------------------------------
-- Script by: Lwkass from OTServBrasil
-- Mod: SilverBullet
-- Version: 2.0
-- Tested in: TFS 0.4

---------------------------
-- Configurations --
---------------------------

local STORAGE_SKILL_LEVEL = 10002
local STORAGE_SKILL_TRY = 10003  

    local config = {
     levels = {
         {level = {0,9}, quant = {1,2}, percent = 5},
         {level = {10,19}, quant = {2,4}, percent = 10},
         {level = {20,29}, quant = {3,6}, percent = 15},
         {level = {30,39}, quant = {4,8}, percent = 20},
         {level = {40,49}, quant = {5,10}, percent = 25},
         {level = {50,59}, quant = {6,12}, percent = 30},
         {level = {60,69}, quant = {7,14}, percent = 30},
         {level = {70,79}, quant = {8,16}, percent = 35},
         {level = {80,89}, quant = {9,18}, percent = 35},
         {level = {90,99}, quant = {10,20}, percent = 40},
         {level = {100}, quant = {11,22}, percent = 50}
     },
     rocks = {1356, 1285, 3607, 3616}, -- Id das rochas que podem ser quebradas
     stones = {},  -- Modelo = {rock_id, rock_id}
     default_stone = 2157, -- pedra padrão
     rock_delay = 480, -- Tempo de volta da rocha (Em segundos)
     bonus_chance = 3, -- Chance (em porcentagem) de se conseguir um bonus de exp
     bonus_exp = 1 -- Bonus extra
    }
    
    
------------------------------------
-- END Configurations ---
------------------------------------

function getMiningLevel(cid)
    return getPlayerStorageValue(cid, STORAGE_SKILL_LEVEL)
end

function setPlayerMiningLevel(cid, n)
    setPlayerStorageValue(cid, STORAGE_SKILL_LEVEL, n)
end

function addMiningLevel(cid, n)
    setPlayerMiningLevel(cid, getMiningLevel(cid) + (isNumber(n) and n or 1))
    setMiningTry(cid, 0)
end

function getMiningInfo(cid)
    for i = 1, #config.levels do
        min = config.levels[i].level[1]; max = config.levels[i].level[2]
        if (getMiningLevel(cid) >= min and getMiningLevel(cid) <= max) then
            return {quantity = {min = config.levels[i].quant[1], max = config.levels[i].quant[2]}, chance = config.levels[i].percent}
        end
    end
end

function getStoneByRock(rockid)
    for i = 1, #config.stones do
        if (config.stones[2] == rockid) then
            return config.stones[1]
        end
    end
    return config.default_stone
end

function getMiningTries(cid)
    return getPlayerStorageValue(cid, STORAGE_SKILL_TRY)
end

function setMiningTry(cid, n)
    setPlayerStorageValue(cid, STORAGE_SKILL_TRY, n)
end

function addMiningTry(cid, bonus)
    setMiningTry(cid, getMiningTries(cid) + 1 + (bonus and config.bonus_exp or 0))
    
    if (getMiningTries(cid) >= getMiningExpTo(getMiningLevel(cid))) then -- Up
        
        addMiningLevel(cid)
        setMiningTry(cid, 0)
    end
end

function getMiningExpTo(level)
    return ((level*1.5)+((level+1)*7))
end

function getMiningMaxLevel()
    return config.levels[#config.levels].level[#config.levels[#config.levels].level]
end

---------------------------


function onUse(cid, item, fromPosition, itemEx, toPosition)
    rock = { id = itemEx.itemid, uid = itemEx.uid, position = toPosition }
    player = { position = getCreaturePosition(cid) }
    
    if (getMiningLevel(cid) < 0) then 
        setPlayerMiningLevel(cid, 0)
    end
    
    if (isInArray(config.rocks, rock.id)) then
        addMiningTry(cid)
    
        if (math.random(1,100) <= getMiningInfo(cid).chance) then
            local collected = math.random(getMiningInfo(cid).quantity.min, getMiningInfo(cid).quantity.max)
            doPlayerAddItem(cid, getStoneByRock(rock.id), collected)
            doPlayerSendTextMessage(cid, 22, "You got " .. collected .. " gold" .. (collected > 1 and "s" or "") .. " nuggets.")
            
            if (math.random(1,100) <= config.bonus_chance) then -- Bonus calc
                addMiningTry(cid, true)
                doSendAnimatedText(player.position, "Bonus!", COLOR_ORANGE)
            end
            
            event_rockCut(rock)
        else
            if (math.random(1,100) <= (10-getMiningInfo(cid).chance/10)) then
                doPlayerSendTextMessage(cid, 22, "You got nothing.") 
                event_rockCut(rock)
            else
                doSendMagicEffect(rock.position, 3)
                doSendAnimatedText(rock.position, "Poff!", COLOR_GREEN)
            end
        end
    else
        doPlayerSendCancel(cid, "This can't be break.")
    end
end

function event_rockCut(rock)
    addEvent(event_rockGrow, config.rock_delay * 1000, rock.position, rock.id)
    
    doTransformItem(rock.uid, 3610)
    doSendMagicEffect(rock.position, 3)
    doSendAnimatedText(rock.position, "Tack!", COLOR_GREEN)
    doItemSetAttribute(rock.uid, "name", "A trunk of " .. getItemNameById(rock.id))
end

function event_rockGrow(rockPos, old_id)
    local rock = getThingFromPos(rockPos).uid
    doTransformItem(rock, old_id)
    doItemSetAttribute(rock, "name", getItemNameById(old_id))
    doSendMagicEffect(rockPos, 3)
end

--Lumberjack 2.0 by: Lwkass