 local config = {
        transferDisabledVocations = {0} -- disable non vocation characters
}
function printBlankCheck(cid)
	local item = getPlayerItemById(cid, true, 1952)
	doItemSetAttribute(item.uid, "name", "Blank Money Check")
	doItemSetAttribute(item.uid, "description", "This is a blank check, be sure write info as follows:\n Amount\n Name of Sender\n Name of Reciever")
end	
 
local talkState = {}
local count = {}
local transfer = {}
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                              npcHandler:onThink() end
 
local function getPlayerVocationByName(name)
        local result = db.getResult("SELECT `vocation` FROM `players` WHERE `name` = " .. db.escapeString(name))
        if(result:getID() == -1) then
                return false
        end
 
        local value = result:getDataString("vocation")
        result:free()
        return value
end
 
local function isValidMoney(money)
        return (isNumber(money) and money > 0 and money < 4294967296)
end
 
local function getCount(string)
        local b, e = string:find("%d+")
        local money = b and e and tonumber(string:sub(b, e)) or -1
        if(isValidMoney(money)) then
                return money
        end
        return -1
end
 
function greetCallback(cid)
        talkState[cid], count[cid], transfer[cid] = 0, nil, nil
        return true
end
 
function creatureSayCallback(cid, type, msg)
 
        if(not npcHandler:isFocused(cid)) then
                return false
        end
 
---------------------------- help ------------------------
        if msgcontains(msg, 'advanced') then
                if isInArray(config.transferDisabledVocations, getPlayerVocation(cid)) then
                        selfSay("Once you are on the Tibian mainland, you can access new functions of your bank account, such as transferring money to other players safely or taking part in house auctions.", cid)
                else
                        selfSay("Renting a house has never been this easy. Simply make a bid for an auction. We will check immediately if you have enough money.", cid)
                end
                talkState[cid] = 0
        elseif msgcontains(msg, 'help') or msgcontains(msg, 'functions') then
                selfSay("You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
                talkState[cid] = 0
        elseif msgcontains(msg, 'bank') then
                npcHandler:say("We can change money for you. You can also access your bank account.", cid)
                talkState[cid] = 0
        elseif msgcontains(msg, 'job') then
                npcHandler:say("I work in this bank. I can change money for you and help you with your bank account.", cid)
                talkState[cid] = 0
---------------------------- balance ---------------------
        elseif msgcontains(msg, 'balance') then
                selfSay("Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
                talkState[cid] = 0
---------------------------- deposit ---------------------
        elseif msgcontains(msg, 'deposit all') and getPlayerMoney(cid) > 0 then
                count[cid] = getPlayerMoney(cid)
                if not isValidMoney(count[cid]) then
                        selfSay("Sorry, but you can't deposit that much.", cid)
                        talkState[cid] = 0
                        return false
                end
 
                if count[cid] < 1 then
                        selfSay("You don't have any money to deposit in you inventory..", cid)
                        talkState[cid] = 0
                else
                        selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
                        talkState[cid] = 2
                end
        elseif msgcontains(msg, 'deposit') then
                selfSay("Please tell me how much gold it is you would like to deposit.", cid)
                talkState[cid] = 1
        elseif talkState[cid] == 1 then
                count[cid] = getCount(msg)
                if isValidMoney(count[cid]) then
                        selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
                        talkState[cid] = 2
                else
                        selfSay(""..count[cid].." gold isn't valid amount of gold to deposit.", cid)
                        talkState[cid] = 0
                end
        elseif talkState[cid] == 2 then
                if msgcontains(msg, 'yes') then
                        if not doPlayerDepositMoney(cid, count[cid]) then
                                selfSay("You don't have enough gold.", cid)
                        else
                                selfSay("Alright, we have added the amount of " .. count[cid] .. " gold to your balance. You can withdraw your money anytime you want to. Your account balance is " .. getPlayerBalance(cid) .. ".", cid)
                        end
                elseif msgcontains(msg, 'no') then
                        selfSay("As you wish. Is there something else I can do for you?", cid)
                end
                talkState[cid] = 0
---------------------------- withdraw --------------------
        elseif msgcontains(msg, 'withdraw') then
                selfSay("Please tell me how much gold you would like to withdraw.", cid)
                talkState[cid] = 6
        elseif talkState[cid] == 6 then
                count[cid] = getCount(msg)
                if isValidMoney(count[cid]) then
                        selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
                        talkState[cid] = 7
                else
                        selfSay("Is isnt valid amount of gold to withdraw.", cid)
                        talkState[cid] = 0
                end
        elseif talkState[cid] == 7 then
                if msgcontains(msg, 'yes') then
                        if not doPlayerWithdrawMoney(cid, count[cid]) then
                                selfSay("There is not enough gold on your account. Your account balance is " .. getPlayerBalance(cid) .. ". Please tell me the amount of gold coins you would like to withdraw.", cid)
                                talkState[cid] = 0
                        else
                                selfSay("Here you are, " .. count[cid] .. " gold. Please let me know if there is something else I can do for you.", cid)
                                talkState[cid] = 0
                        end
                elseif msgcontains(msg, 'no') then
                        selfSay("As you wish. Is there something else I can do for you?", cid)
                        talkState[cid] = 0
                end
---------------------------- transfer --------------------
        elseif msgcontains(msg, 'transfer') then
                selfSay("Please tell me the amount of gold you would like to transfer.", cid)
                talkState[cid] = 11
        elseif talkState[cid] == 11 then
                count[cid] = getCount(msg)
                if getPlayerBalance(cid) < count[cid] then
                        selfSay("You dont have enough money on your bank account.", cid)
                        talkState[cid] = 0
                        return true
                end
 
                if isValidMoney(count[cid]) then
                        selfSay("Who would you like transfer " .. count[cid] .. " gold to?", cid)
                        talkState[cid] = 12
                else
                        selfSay("Is isnt valid amount of gold to transfer.", cid)
                        talkState[cid] = 0
                end
        elseif talkState[cid] == 12 then
                transfer[cid] = msg
 
                if getCreatureName(cid) == transfer[cid] then
                        selfSay("Ekhm, You want transfer money to yourself? Its impossible!", cid)
                        talkState[cid] = 0
                        return true
                end
 
                if isInArray(config.transferDisabledVocations, getPlayerVocation(cid)) then
                        selfSay("Your vocation cannot transfer money.", cid)
                        talkState[cid] = 0
                end
 
                if playerExists(transfer[cid]) then
                        selfSay("So you would like to transfer " .. count[cid] .. " gold to \"" .. transfer[cid] .. "\" ?", cid)
                        talkState[cid] = 13
                else
                        selfSay("Player with name \"" .. transfer[cid] .. "\" doesn't exist.", cid)
                        talkState[cid] = 0
                end
        elseif talkState[cid] == 13 then
                if msgcontains(msg, 'yes') then
                        local targetVocation = getPlayerVocationByName(transfer[cid])
                        if not targetVocation or isInArray(config.transferDisabledVocations, targetVocation) or not doPlayerTransferMoneyTo(cid, transfer[cid], count[cid]) then
                                selfSay("This player does not exist on this world or have no vocation.", cid)
                        else
                                selfSay("You have transferred " .. count[cid] .. " gold to \"" .. transfer[cid] .."\".", cid)
                                transfer[cid] = nil
                        end
                elseif msgcontains(msg, 'no') then
                        selfSay("As you wish. Is there something else I can do for you?", cid)
                end
                talkState[cid] = 0
---------------------------- money exchange --------------
        elseif msgcontains(msg, 'change gold') then
                npcHandler:say("How many platinum coins would you like to get?", cid)
                talkState[cid] = 14
        elseif talkState[cid] == 14 then
                if getCount(msg) == -1 or getCount(msg) == 0 then
                        npcHandler:say("Hmm, can I help you with something else?", cid)
                        talkState[cid] = 0
                else
                        count[cid] = getCount(msg)
                        npcHandler:say("So you would like me to change " .. count[cid] * 100 .. " of your gold coins into " .. count[cid] .. " platinum coins?", cid)
                        talkState[cid] = 15
                end
        elseif talkState[cid] == 15 then
                if msgcontains(msg, 'yes') then
                        if doPlayerRemoveItem(cid, 2148, count[cid] * 100) then
                                doPlayerAddItem(cid, 2152, count[cid])
                                npcHandler:say("Here you are.", cid)
                        else
                                npcHandler:say("Sorry, you do not have enough gold coins.", cid)
                        end
                else
                        npcHandler:say("Well, can I help you with something else?", cid)
                end
                talkState[cid] = 0
        elseif msgcontains(msg, 'change platinum') then
                npcHandler:say("Would you like to change your platinum coins into gold or crystal?", cid)
                talkState[cid] = 16
        elseif talkState[cid] == 16 then
                if msgcontains(msg, 'gold') then
                        npcHandler:say("How many platinum coins would you like to change into gold?", cid)
                        talkState[cid] = 17
                elseif msgcontains(msg, 'crystal') then
                        npcHandler:say("How many crystal coins would you like to get?", cid)
                        talkState[cid] = 19
                else
                        npcHandler:say("Well, can I help you with something else?", cid)
                        talkState[cid] = 0
                end
        elseif talkState[cid] == 17 then
                if getCount(msg) == -1 or getCount(msg) == 0 then
                        npcHandler:say("Hmm, can I help you with something else?", cid)
                        talkState[cid] = 0
                else
                        count[cid] = getCount(msg)
                        npcHandler:say("So you would like me to change " .. count[cid] .. " of your platinum coins into " .. count[cid] * 100 .. " gold coins for you?", cid)
                        talkState[cid] = 18
                end
        elseif talkState[cid] == 18 then
                if msgcontains(msg, 'yes') then
                        if doPlayerRemoveItem(cid, 2152, count[cid]) then
                                npcHandler:say("Here you are.", cid)
                                doPlayerAddItem(cid, 2148, count[cid] * 100)
                        else
                                npcHandler:say("Sorry, you do not have enough platinum coins.", cid)
                        end
                else
                        npcHandler:say("Well, can I help you with something else?", cid)
                end
                talkState[cid] = 0
        elseif talkState[cid] == 19 then
                if getCount(msg) == -1 or getCount(msg) == 0 then
                        npcHandler:say("Hmm, can I help you with something else?", cid)
                        talkState[cid] = 0
                else
                        count[cid] = getCount(msg)
                        npcHandler:say("So you would like me to change " .. count[cid] * 100 .. " of your platinum coins into " .. count[cid] .. " crystal coins for you?", cid)
                        talkState[cid] = 20
                end
        elseif talkState[cid] == 20 then
                if msgcontains(msg, 'yes') then
                        if doPlayerRemoveItem(cid, 2152, count[cid] * 100) then
                                npcHandler:say("Here you are.", cid)
                                doPlayerAddItem(cid, 2160, count[cid])
                        else
                                npcHandler:say("Sorry, you do not have enough platinum coins.", cid)
                        end
                else
                        npcHandler:say("Well, can I help you with something else?", cid)
                end
                talkState[cid] = 0
        elseif msgcontains(msg, 'change crystal') then
                npcHandler:say("How many crystal coins would you like to change into platinum?", cid)
                talkState[cid] = 21
        elseif talkState[cid] == 21 then
                if getCount(msg) == -1 or getCount(msg) == 0 then
                        npcHandler:say("Hmm, can I help you with something else?", cid)
                        talkState[cid] = 0
                else
                        count[cid] = getCount(msg)
                        npcHandler:say("So you would like me to change " .. count[cid] .. " of your crystal coins into " .. count[cid] * 100 .. " platinum coins for you?", cid)
                        talkState[cid] = 22
                end
        elseif talkState[cid] == 22 then
                if msgcontains(msg, 'yes') then
                        if doPlayerRemoveItem(cid, 2160, count[cid]) then
                                npcHandler:say("Here you are.", cid)
                                doPlayerAddItem(cid, 2152, count[cid] * 100)
                        else
                                npcHandler:say("Sorry, you do not have enough crystal coins.", cid)
                        end
                else
                        npcHandler:say("Well, can I help you with something else?", cid)
                end
                talkState[cid] = 0
-----------------------------------Check Exchange & Check Dispence---------------------------
		elseif msgcontains(msg, 'change check') then
			npcHandler:say("Do you wish to change and deposit your money check?", cid)
			talkState[cid] = 23
		elseif talkState[cid] == 23 then
			if msgcontains(msg, 'yes') then
				local checkInfo = string.explode(tostring(getItemText(getPlayerItemById(cid, true, 1968).uid)), "\n")
				if getPlayerItemCount(cid, 1968) < 2 then
					if tostring(checkInfo[2]) == getCreatureName(cid) or tostring(checkInfo[3]) == getCreatureName(cid) then
						doPlayerSetBalance(cid, getPlayerBalance(cid) + tonumber(checkInfo[1]))
						doRemoveItem(getPlayerItemById(cid, true, 1968).uid, 1)
						npcHandler:say("I have deposited "..checkInfo[1].." gold "..(tonumber(checkInfo[1]) > 1 and "coins" or "coin").." to your back account, Have a nice day!", cid)
					else
						npcHandler:say("Sorry this check does not belong to you, I will be sending this check to its rightful owner!", cid)
						doPlayerSendMailByName(tostring(checkInfo[2]), getPlayerItemById(cid, true, 1968).uid)
						doRemoveItem(getPlayerItemById(cid, true, 1968).uid, 1)
					end
				else
					npcHandler:say("You can only change one check at a time, please go and leave the rest in the depot.", cid)
				end
			else
				npcHandler:say("With what else can I help you with "..(getPlayerSex(cid) == 0 and "Ms." or "Mr.")..""..getCreatureName(cid).."?", cid)
			end
			talkState[cid] = 0
		elseif msgcontains(msg, 'check') then
			npcHandler:say("Would you like to have a blank money check?", cid)
			talkState[cid] = 24
		elseif talkState[cid] == 24 then
			if msgcontains(msg, 'yes') then 
				doPlayerAddItem(cid, 1952,1)
				addEvent(printBlankCheck, 100, cid)
				npcHandler:say("Here you go!", cid)
			else
				npcHandler:say("With what else can I help you with "..(getPlayerSex(cid) == 0 and "Ms." or "Mr.")..""..getCreatureName(cid).."?", cid)
			end	
			talkState[cid] = 0
        elseif msgcontains(msg, 'change') then
            npcHandler:say("There are three different coin types in Tibia: 100 gold coins equal 1 platinum coin, 100 platinum coins equal 1 crystal coin. So if you'd like to change 100 gold into 1 platinum, simply say '{change gold}' and then '1 platinum'.", cid)
            talkState[cid] = 0		
        end
        return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())