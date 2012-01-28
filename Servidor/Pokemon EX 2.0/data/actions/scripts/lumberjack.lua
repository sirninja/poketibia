------------------------------------------------------
-- Lumberjack by: Lwkass from OTServBrasil
-- Version: 2.0
-- Tested in: TFS 0.4 Crying Damson

---------------------------
-- Configurations --
---------------------------

local STORAGE_SKILL_LEVEL = 10000
local STORAGE_SKILL_TRY = 10001  

    local config = {
     levels = {
         {level = {0,9}, quant = {1,1}, percent = 2},
         {level = {10,19}, quant = {1,2}, percent = 5},
         {level = {20,29}, quant = {2,3}, percent = 7},
         {level = {30,39}, quant = {3,4}, percent = 10},
         {level = {40,49}, quant = {5,6}, percent = 12},
         {level = {50,59}, quant = {6,7}, percent = 15},
         {level = {60,69}, quant = {8,9}, percent = 17},
         {level = {70,79}, quant = {9,10}, percent = 19},
         {level = {80,89}, quant = {10,11}, percent = 22},
         {level = {90,99}, quant = {11,12}, percent = 23},
         {level = {100}, quant = {12,15}, percent = 25}
     },
     trees = {2707, 2704,2708}, -- Id das arvores que podem ser cortadas
     woods = {},  -- Modelo = {wood_id, tree_id}
     default_wood = 5901, -- Madeira padrão
     tree_delay = 10, -- Tempo de crescimento da arvore cortada (Em segundos)
     bonus_chance = 5, -- Chance (em porcentagem) de se conseguir um bonus de exp
     bonus_exp = 2 -- Bonus extra
    }
    
    
------------------------------------
-- END Configurations ---
------------------------------------

function getLumberjackLevel(cid)
  return getPlayerStorageValue(cid, STORAGE_SKILL_LEVEL)
end

function setPlayerLumberjackLevel(cid, n)
    setPlayerStorageValue(cid, STORAGE_SKILL_LEVEL, n)
end

function addLumberjackLevel(cid, n)
   setPlayerLumberjackLevel(cid, getLumberjackLevel(cid) + (isNumber(n) and n or 1))
   setLumberjackTry(cid, 0)
end

function getLumberjackInfo(cid)
    for i = 1, #config.levels do
        min = config.levels[i].level[1]; max = config.levels[i].level[2]
        if (getLumberjackLevel(cid) >= min and getLumberjackLevel(cid) <= max) then
            return {quantity = {min = config.levels[i].quant[1], max = config.levels[i].quant[2]}, chance = config.levels[i].percent}
        end
    end
end

function getWoodByTree(treeid)
    for i = 1, #config.woods do
        if (config.woods[2] == treeid) then
            return config.woods[1]
        end
    end
    return config.default_wood
end

function getLumberjackTries(cid)
    return getPlayerStorageValue(cid, STORAGE_SKILL_TRY)
end

function setLumberjackTry(cid, n)
    setPlayerStorageValue(cid, STORAGE_SKILL_TRY, n)
end

function addLumberjackTry(cid, bonus)
    setLumberjackTry(cid, getLumberjackTries(cid) + 1 + (bonus and config.bonus_exp or 0))
    
    if (getLumberjackTries(cid) >= getLumberjackExpTo(getLumberjackLevel(cid))) then -- Up
        doPlayerSendTextMessage(cid, 22, "You got better on lumberjacking!")
        
        if ((getLumberjackLevel(cid)+1) == getLumberjackMaxLevel()) then
            doPlayerSendTextMessage(cid, 22, "You are now a Lumberjack Master!")
        end
        
        addLumberjackLevel(cid)
        doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
        setLumberjackTry(cid, 0)
    end
end

function getLumberjackExpTo(level)
    return ((level*1.5)+((level+1)*7))
end

function getLumberjackMaxLevel()
    return config.levels[#config.levels].level[#config.levels[#config.levels].level]
end

---------------------------


function onUse(cid, item, fromPosition, itemEx, toPosition)
    tree = { id = itemEx.itemid, uid = itemEx.uid, position = toPosition }
    player = { position = getCreaturePosition(cid) }
    
    if (getLumberjackLevel(cid) < 0) then 
        setPlayerLumberjackLevel(cid, 0)
    end
    
    if (isInArray(config.trees, tree.id)) then
        addLumberjackTry(cid)
    
        if (math.random(1,100) <= getLumberjackInfo(cid).chance) then
            local collected = math.random(getLumberjackInfo(cid).quantity.min, getLumberjackInfo(cid).quantity.max)
            doPlayerAddItem(cid, getWoodByTree(tree.id), collected)
            doPlayerSendTextMessage(cid, 22, "You got " .. collected .. " piece" .. (collected > 1 and "s" or "") .. " of wood.")
            
            if (math.random(1,100) <= config.bonus_chance) then -- Bonus calc
                addLumberjackTry(cid, true)
                doSendAnimatedText(player.position, "Bonus!", COLOR_ORANGE)
            end
            
            event_treeCut(tree)
        else
            if (math.random(1,100) <= (10-getLumberjackInfo(cid).chance/10)) then
                doPlayerSendTextMessage(cid, 22, "You got nothing.") 
                event_treeCut(tree)
            else
                doSendMagicEffect(tree.position, 3)
                doSendAnimatedText(tree.position, "Pock!", COLOR_GREEN)
            end
        end
    else
        doPlayerSendCancel(cid, "This can't be cut.")
    end
end

function event_treeCut(tree)
    addEvent(event_treeGrow, config.tree_delay * 1000, tree.position, tree.id)
    
    doTransformItem(tree.uid, 8792)
    doSendMagicEffect(tree.position, 34)
    doSendAnimatedText(tree.position, "Pock!", COLOR_GREEN)
    doItemSetAttribute(tree.uid, "name", "A trunk of " .. getItemNameById(tree.id))
end

function event_treeGrow(treePos, old_id)
    local tree = getThingFromPos(treePos).uid
    doTransformItem(tree, old_id)
    doItemSetAttribute(tree, "name", getItemNameById(old_id))
    doSendMagicEffect(treePos, 45)
end

--Lumberjack 2.0 by: Lwkass