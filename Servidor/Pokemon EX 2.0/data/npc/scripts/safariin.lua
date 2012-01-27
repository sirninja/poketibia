local zone = {x=1048, y=1490, z=7} --- Change it to the Entry of Your safari Zone.
local storage = 20000 ---The Storage That you Check the Steps, The same Storage That The Npc, The Movement and Te Talkation Would Have.
local steps = 600 ---the number of steps that the player have to be in safari zone.
local cost = 20 ---Prize for Each Step.
---------------------------------------End Config--------------------------------------
local pay = cost * steps ---Do Not Edit This
local focus = 0 -- Do Not Edit This
local talk_start = 0 -- Do Not Edit This
local target = 0 -- Do Not Edit This
local following = false -- Do Not Edit This
local attacking = false --Do Not Edit This

function getPlayerMoney(cid)
gold = getPlayerItemCount(cid,2148)
plat = getPlayerItemCount(cid,2152)*100
crys = getPlayerItemCount(cid,2160)*10000
money = gold + plat + crys
return money
end

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end

function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye then.')
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
msg = string.lower(msg)

if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 4 then
selfSay('Hello ' .. getPlayerName(cid) .. '! I can take you to the safari zone.')
focus = cid
talk_start = os.clock()

elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
selfSay('Sorry, ' .. getPlayerName(cid) .. '! I talk to you in a minute.')

elseif focus == cid then
talk_start = os.clock()

if msgcontains(msg, 'safari') then
selfSay('Do you want buy ' .. steps ..' Steps in the safari zone for ' .. pay ..' gold coins?')
talk_state = 1


elseif talk_state == 1 then
if msgcontains(msg, 'yes') then
if getPlayerMoney(cid) >= pay then
setPlayerStorageValue(cid,storage,0)
doTeleportThing(cid, zone)
doSendMagicEffect(zone,10)
doPlayerRemoveMoney(cid,pay)

else
selfSay('Sorry, you don\'t have enough money.')
end
end
talk_state = 0


elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
selfSay('Good bye, ' .. getPlayerName(cid) .. '!')
focus = 0
talk_start = 0
end
end
end


function onCreatureChangeOutfit(creature)
end

function onThink()
doNpcSetCreatureFocus(focus)
if (os.clock() - talk_start) > 30 then
if focus > 0 then
selfSay('Next Please...')
end
focus = 0
end
if focus ~= 0 then
if getDistanceToCreature(focus) > 5 then
selfSay('Good bye then.')
focus = 0
end
end
end