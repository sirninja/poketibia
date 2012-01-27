local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false
local talkState = {}

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end

function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye sir!')
focus = 0
talk_start = 0
end
end

function onCreatureTurn(creature)
end

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msg)
local msg = string.lower(msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if getPlayerStorageValue(cid, ginasios["Misty"].storage) >= 1 then
return true
end

if (msgcontains(msg, 'hi') and (focus == 0) and (focus ~= cid) and (getDistanceToCreature(cid) <= 4)) then
focus = cid
talkState[talkUser] = 1
selfSay("Welcome to the gym of Pewter City. My name is Misty and I am the leader of this gym. Would you like to battle me?")
elseif (msgcontains(msg, "no") or msgcontains(msg, "bye")) and focus == cid and talkState[talkUser] ~= 3 then
selfSay("Bye then, tell strong friends to come here and try to beat me!")
focus = 0
elseif (msgcontains(msg, "yes") or msgcontains(msg, "battle")) and focus == cid and talkState[talkUser] == 1 then
if not hasPokemon(cid) then
selfSay("You don't have any pokemon to battle me!")
focus = 0
return true
end
talkState[talkUser] = 3
doGymBattle("Misty", "Misty Starmie", cid, 1)
setPlayerStorageValue(cid, ginasios["Misty"].storage, 1)
setPlayerStorageValue(cid, 992, 0)

local function focusCheck(cid)
if not isCreature(cid) then
focus = 0
return true
end
if getPlayerStorageValue(cid, 992) == -1 then
focus = 0
return true
end
addEvent(focusCheck, 500, cid)
end

addEvent(focusCheck, 1000, cid)
end
end

function onThink()
if focus ~= 0 then
a, b, c = selfGetPosition()
if c ~= getThingPos(focus).z then
focus = 0
end
end

if focus ~= 0 then
if getDistanceToCreature(focus) > 6 then
focus = 0
end
end

return true
end