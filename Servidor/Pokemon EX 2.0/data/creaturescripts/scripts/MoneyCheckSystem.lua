function printBlankCheck(cid)
	local item = getPlayerItemById(cid, true, 1952)
	doItemSetAttribute(item.uid, "name", "Blank Money Check")
	doItemSetAttribute(item.uid, "description", "This is a blank check, be sure write info as follows:\n Amount\n Name of Sender\n Name of Reciever")
end	
function printCheck(cid, checkInfo)
	local item = getPlayerItemById(cid, true, 1968)
	doItemSetAttribute(item.uid, "name", "Money Check")
	doItemSetAttribute(item.uid, "description", "This is a check to: "..checkInfo[3]..", From: "..checkInfo[2]..", of the amount of: "..checkInfo[1].." gold "..(tonumber(checkInfo[1]) > 1 and "coins" or "coin")..".")
end	
function onTextEdit(cid, item, newText)
local E_DOC, DOC, checkInfo = 1952, 1968, string.explode(newText, '\n') 
	if checkInfo[1] ~= nil and checkInfo[2] ~= nil and checkInfo[3] ~= nil then
		if getCreatureName(cid) == checkInfo[2] and isNumeric(checkInfo[1]) and getPlayerBalance(cid) >= tonumber(checkInfo[1]) then
			doPlayerSetBalance(cid, getPlayerBalance(cid) - tonumber(checkInfo[1]))
			addEvent(printCheck, 100, cid, checkInfo)
		else
			doPlayerSendCancel(cid, (not(isNumeric(checkInfo[1])) and "Make sure it's a number." or (getPlayerBalance(cid) < tonumber(checkInfo[1]) and "You lack the funds in your bank account." or "Specify "..(getCreatureName(cid) ~= checkInfo[2] and "your name." or ""))))
			doRemoveItem(item.uid, 1)
			doPlayerAddItem(cid, E_DOC, 1)
			addEvent(printBlankCheck, 100, cid)
		end	
	else	
		doPlayerSendCancel(cid, (checkInfo[1] == nil and checkInfo[2] == nil and checkInfo[3] == nil and "Specify Amount, Sender and Reciever." or (checkInfo[2] == nil and checkInfo[3] == nil and "Specify Sender and Reciever." or (checkInfo[2] == nil and "Specify Sender." or (checkInfo[3] == nil and "Specify Reciever." or "")))))
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, E_DOC, 1)
		addEvent(printBlankCheck, 100, cid)
	end
return true
end