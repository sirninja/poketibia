local focus = 0

local talk_start = 0

local target = 0

local following = false

local attacking = false

local talkState = {}
local states = {'1', '2', '3', '4', '5', '6'}
local store = {1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066,  1067, 1068, 1069, 1071, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1130, 1131, 1132, 1133, 1134, 1135, 1136, 1137, 1138, 1139, 1140, 1141, 1142, 1143, 1144, 1145, 1146, 1147, 1148, 1149, 1150, 1151}
local unlock = {}
local pokeballs = {'2222', '2224'}
local ultraballs = {'2220', '2227'} 
local greatballs = {'2651', '2657'}
local superballs = {'2653', '2658'}
local saffariballs = {'2655', '2659'}
local fastballs = {'2218', '2225'}
local lureballs = {'2154', '2156'}
local heavyballs = {'2228', '2230'}
local moonballs = {'2231', '2233'}


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
if((msgcontains(msg, 'hi') or msgcontains(msg, 'heal') or msgcontains(msg, 'help')) and (getDistanceToCreature(cid) <= 3)) then
 	if exhaustion.get(cid, 9211) then
	selfSay('Please wait a few moment before asking me to heal your pokemons again!')
	return true
    end
if #getCreatureSummons(cid) >= 1 then 
selfSay('Please back your Pokemon to the pokeball...') 
focus = 0 
talk_start = 0 
return TRUE 
end 
	exhaustion.set(cid, 9211, 5)
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid)-getCreatureHealth(cid))
	doSendMagicEffect(getThingPos(cid), 132)
	if isInArray(pokeballs, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
	local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
	doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
	doTransformItem(feet.uid, 2222)
	end
	if isInArray(ultraballs, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
	local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
	doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
	doTransformItem(feet.uid, 2220)
	end
	if isInArray(greatballs, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
	local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
	doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
	doTransformItem(feet.uid, 2651)
	end
	if isInArray(superballs, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
	local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
	doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
	doTransformItem(feet.uid, 2653)
	end
	if isInArray(saffariballs, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
	local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
	doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
	doTransformItem(feet.uid, 2655)
        end
        if isInArray(fastballs, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
	local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
	doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
	doTransformItem(feet.uid, 2218)
        end
	if isInArray(lureballs, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
	local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
	doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
	doTransformItem(feet.uid, 2154)
	end
        if isInArray(heavyballs, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
	local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
	doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
	doTransformItem(feet.uid, 2228)
	end
        if isInArray(moonballs, getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
	local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local maxh = tonumber(getItemAttribute(feet.uid, "poke"):match("/(.+)]"))
	doItemSetAttribute(feet.uid, "poke", getItemAttribute(feet.uid, "poke"):sub(1, findLetter(getItemAttribute(feet.uid, "poke"), "[")) .. maxh .. getItemAttribute(feet.uid, "poke"):sub(findLetter(getItemAttribute(feet.uid, "poke"), "/")))
	doTransformItem(feet.uid, 2231)
	end
		local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
			if #getCreatureSummons(cid) >= 1 then
			local jui = getCreatureSummons(cid)[1]
			doCreatureAddHealth(jui, getCreatureMaxHealth(jui)-getCreatureHealth(jui))
			doSendMagicEffect(getThingPos(jui), 12)
			end
			local items = getItemsInContainerById(bp.uid, 2224)
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			doTransformItem(uid, 2222)
			end
			local items = getItemsInContainerById(bp.uid, 2227) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			doTransformItem(uid, 2220)
                        end
			local items = getItemsInContainerById(bp.uid, 2230)
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			doTransformItem(uid, 2228)
                        end
                        local items = getItemsInContainerById(bp.uid, 2225) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			doTransformItem(uid, 2218)
                        end
                        local items = getItemsInContainerById(bp.uid, 2233) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			doTransformItem(uid, 2231)
                        end
                        local items = getItemsInContainerById(bp.uid, 2156) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			doTransformItem(uid, 2154)
                        end
			local items = getItemsInContainerById(bp.uid, 2657) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			doTransformItem(uid, 2651)
			end
			local items = getItemsInContainerById(bp.uid, 2658) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			doTransformItem(uid, 2653)
			end
			local items = getItemsInContainerById(bp.uid, 2659) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			doTransformItem(uid, 2655)
			end
			local items = getItemsInContainerById(bp.uid, 2222) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
                        local items = getItemsInContainerById(bp.uid, 2218) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
			local items = getItemsInContainerById(bp.uid, 2220) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
			local items = getItemsInContainerById(bp.uid, 2651) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
			local items = getItemsInContainerById(bp.uid, 2228) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
			local items = getItemsInContainerById(bp.uid, 2231) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
			local items = getItemsInContainerById(bp.uid, 2653) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
			local items = getItemsInContainerById(bp.uid, 2655) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
                        local items = getItemsInContainerById(bp.uid, 2154) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
	selfSay('There you go! You and your pokemons are healthy again.')
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
if getDistanceToCreature(focus) > 3 then
focus = 0
end
end

return true
end