pokein, pokeout = 2222,2223
greatin, greatout = 2651,2652
superin, superout = 2653,2654
saffariin, saffariout = 2655,2656
ultrapokein, ultrapokeout = 2220,2221
fastpokein, fastpokeout = 2218,2216
lurepokein, lurepokeout = 2154,2155
heavypokein, heavypokeout = 2228,2229
moonpokein, moonpokeout = 2231,2232
aguinha = {'4820', '4821', '4822', '4823', '4824', '4825'}

function doRemoveTile(pos)-- Script by mock
pos.stackpos = 0
local sqm = getTileThingByPos(pos)
doRemoveItem(sqm.uid,1)
end


function doCreateTile(id,pos) -- By mock
doAreaCombatHealth(0,0,pos,0,0,0,CONST_ME_NONE)
doCreateItem(id,1,pos)
end

function hasSqm(pos)
local f = getTileThingByPos(pos)
if f.itemid ~= 0 and f.itemid ~= 1 then
return true
end
return false
end

function getPosDirs(p, dir) -- By MatheusMkalo
return dir == 1 and {x=p.x-1, y=p.y, z=p.z} or dir == 2 and {x=p.x-1, y=p.y+1, z=p.z} or dir == 3 and {x=p.x, y=p.y+1, z=p.z} or dir == 4 and {x=p.x+1, y=p.y+1, z=p.z} or dir == 5 and {x=p.x+1, y=p.y, z=p.z} or dir == 6 and {x=p.x+1, y=p.y-1, z=p.z} or dir == 7 and {x=p.x, y=p.y-1, z=p.z} or dir == 8 and {x=p.x-1, y=p.y-1, z=p.z}
end

function doItem(pos,a,d)-- Script by mock
doCreateTile(460,pos)
pos.stackpos = 0
local c = getTileThingByPos(pos)
doItemSetAttribute(c.uid, "aid", a)
end

function getDescription(uid)
for i,x in pairs(getItemDescriptions(uid)) do
if i == "special" then
return x
end
end
end

function findLetter(string, letter)
for i = 1, #string do
if string:sub(i, i) == letter then
return i
end
end
end

function isWalkable(pos, creature, proj, pz)-- by Nord
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
if getTileInfo(pos).protection and pz then return false, true end
local n = not proj and 3 or 2
for i = 0, 255 do
pos.stackpos = i
local tile = getTileThingByPos(pos)
if tile.itemid ~= 0 and not isCreature(tile.uid) then
if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
return false
end
end
end
return true
end

function getPosDirs(p, dir)
return dir == 1 and {x=p.x-1, y=p.y, z=p.z} or dir == 2 and {x=p.x-1, y=p.y+1, z=p.z} or dir == 3 and {x=p.x, y=p.y+1, z=p.z} or dir == 4 and {x=p.x+1, y=p.y+1, z=p.z} or dir == 5 and {x=p.x+1, y=p.y, z=p.z} or dir == 6 and {x=p.x+1, y=p.y-1, z=p.z} or dir == 7 and {x=p.x, y=p.y-1, z=p.z} or dir == 8 and {x=p.x-1, y=p.y-1, z=p.z}
end

function canSummon(cid)
local pos = getCreaturePosition(cid)
local state = false
for i = 1, 8 do
if isWalkable(getPosDirs(getCreaturePosition(cid), i)) then
state = true
end
end
return state
end

function isPlayerSummon(cid, uid)
if getCreatureMaster(uid) == cid then
return TRUE
end
return FALSE
end

function getSummonLifes(cid)
for _,x in pairs(getCreatureSummons(cid)) do
return getCreatureHealth(x), getCreatureMaxHealth(x)
end
end

function isSummon(sid)
    for i, pid in ipairs(getPlayersOnline()) do
        for c, cid in pairs(getCreatureSummons(pid)) do
            if (cid == sid) then
                return true
            end
        end 
    end
    return false
end 

function getItemsInContainerById(container, itemid) -- Function By Kydrai
local items = {}
if isContainer(container) and getContainerSize(container) > 0 then
for slot=0, (getContainerSize(container)-1) do
local item = getContainerItem(container, slot)
if isContainer(item.uid) then
local itemsbag = getItemsInContainerById(item.uid, itemid)
for i=0, #itemsbag do
table.insert(items, itemsbag[i])
end
else
if itemid == item.itemid then
table.insert(items, item.uid)
end
end
end
end
return items
end