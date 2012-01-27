local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {20}
local pokeballs = {'2222', '2224'}
local ultraballs = {'2220', '2227'}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, 'heal') or msgcontains(msg, 'yes') or msgcontains(msg, 'help') then
	if exhaustion.get(cid, 9211) then
	selfSay('Please wait a few moment before asking me to heal your pokemons again!')
	return true
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
			local items = getItemsInContainerById(bp.uid, 2222) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
			local items = getItemsInContainerById(bp.uid, 2220) 
			for _, uid in pairs(items) do
			local maxh = tonumber(getItemAttribute(uid, "poke"):match("/(.+)]"))
			doItemSetAttribute(uid, "poke", getItemAttribute(uid, "poke"):sub(1, findLetter(getItemAttribute(uid, "poke"), "[")) .. maxh .. getItemAttribute(uid, "poke"):sub(findLetter(getItemAttribute(uid, "poke"), "/")))
			end
	selfSay('There you go! You and your pokemons are healthy again.')
end
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())