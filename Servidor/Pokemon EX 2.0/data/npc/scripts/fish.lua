local focus = 0

local talk_start = 0

local target = 0

local following = false

local attacking = false

local talkState = {}
local states = {'1', '2', '3', '4', '5', '6'}
local store = {1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066,  1067, 1068, 1069, 1071, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1130, 1131, 1132, 1133, 1134, 1135, 1136, 1137, 1138, 1139, 1140, 1141, 1142, 1143, 1144, 1145, 1146, 1147, 1148, 1149, 1150, 1151}
local unlock = {}

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
if(msgcontains(msg, 'yes') and talkState[talkUser] == 1 and focus == cid) then
selfSay('OK, for your first training, i need you to bring me 15 remains of magikarp.')
setPlayerStorageValue(cid, 2012, 1)
focus = 0
elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1 and focus == cid) then
selfSay('If you dont like fishing wipe out!')
focus = 0
elseif(msgcontains(msg, 'no') and talkState[talkUser] == 3 and focus == cid) then
selfSay('Bring me 100 water gems if you want to be a nice fisher!')
focus = 0
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3 and focus == cid) then
                        if getPlayerItemCount(cid, 6528) >= 80 then
                        doPlayerRemoveItem(cid, 6528, 80)
                        doPlayerAddSkillTry(cid, 6, 20)
                        focus = 0
                        selfSay('Great job! Now you are able to catch horseas with your fishing rod. For the next level, you gonna need 2 water pendants, 75 water gems and 12 remains of magikarp.')
                        return true
                        end
selfSay('You dont have my gems!')
focus = 0
elseif(msgcontains(msg, 'no') and talkState[talkUser] == 2 and focus == cid) then
selfSay('Come back only when you have a magikarp!')
focus = 0
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2 and focus == cid) then
if getPlayerItemCount(cid, 2687) >= 15 then
doPlayerRemoveItem(cid, 2687, 15)
doPlayerAddSkillTry(cid, 6, 20) 
focus = 0
selfSay('Nice! You advanced a little more your skills, now you can fish poliwags! Your next job is to bring me 80 water gems.')
return true
end
selfSay('You dont have enough remains of magikarp!')
focus = 0
elseif (msgcontains(msg, 'bye') and focus == cid) then
selfSay('Are you leaving to fish? Good idea!')
focus = 0
elseif (msgcontains(msg, 'hi') and (focus == 0) and (focus ~= cid) and (getDistanceToCreature(cid) <= 5)) then
if getPlayerSkillLevel(cid, 6) == 10 and getPlayerStorageValue(cid, 2012) <= 0 then
focus = cid
talk_start = os.clock()
talkState[talkUser] = 1
selfSay('Heheh, what brings you to the fishing spot? Do you want to be a professional fisher?')
elseif getPlayerStorageValue(cid, 2012) == 1 then
if getPlayerSkillLevel(cid, 6) == 11 then
focus = cid
talk_start = os.clock()
talkState[talkUser] = 3
selfSay('Hello! Did you bring 80 water gems to me?')
elseif getPlayerSkillLevel(cid, 6) == 12 then
selfSay('~Under Construction~')
else
focus = cid
talk_start = os.clock()
talkState[talkUser] = 2
selfSay('So, do you have 15 remains of magikarp?')
end
end
end
end
 
 function onThink()
if focus == 0 then
else
argx, argy, argz = selfGetPosition()
dir = getDirectionTo({x=argx,y=argy,z=argz}, getThingPos(focus))
    if dir == 7 then
    dir = 0
    elseif dir == 6 then
    dir = 3
    elseif dir == 5 then
    dir = 1
    elseif dir == 4 then
    dir = 3
    end
selfTurn(dir)
end

if (os.clock() - talk_start) > 30 then

focus = 0

end

if focus ~= 0 then
a, b, c = selfGetPosition()
if c ~= getThingPos(focus).z then
focus = 0
end
end

if focus ~= 0 then
if getDistanceToCreature(focus) > 3 then
focus = 0
end
end

return true
end