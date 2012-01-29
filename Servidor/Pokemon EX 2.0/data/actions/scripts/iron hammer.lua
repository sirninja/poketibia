local chance = nil
local rareOption = nil

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if isInArray({0, 65535}, toPosition.x) then
        return false
    elseif getTileItemById(toPosition, 2555).uid < 1 then
        return doPlayerSendCancel(cid, 'You must put the ingredients on an anvil.')
    end
 
    local tmp, match = {}
 
    for ret, v in pairs(forges) do
        for i = 1, #v.recipe do
            local g, rareStone = getTileItemById(toPosition, v.recipe[i][1]), getTileItemById(toPosition, blacksmith.rareConfig.stone)
            if g.uid > 0 and math.max(1, g.type) == v.recipe[i][2] then
				if(rareStone.uid > 0) then
					if(blacksmith.rareConfig.chance >= math.random(0, 1000)) then
						rareOption = true
					end
					doRemoveItem(rareStone.uid, 1)
				else
					rareOption = false
				end
                table.insert(tmp, g.uid)
                if i == #v.recipe then
                    match = ret
					chance = v.chance
                end
            else
                tmp = {}
                break
            end
        end
        if match then
            break
        end
    end
	
	if match then
		for i = 1, #tmp do
			doRemoveItem(tmp[i], forges[match].recipe[i][2])
		end
		if(chance >= math.random(1, 1000)) then
			doCreateItem(match, 1, toPosition)
			local i, range = getThingFromPos(toPosition), math.random(unpack(blacksmith.variance))
			if(isWeapon(i)) then
				setItemAttack(i, getItemAttack(i)+(rareOption == true and blacksmith.rareConfig.bonus or range))
				setItemDefense(i, getItemDefense(i)+(rareOption == true and blacksmith.rareConfig.bonus or range))
			elseif(isShield(i)) then
				setItemDefense(i, getItemDefense(i)+(rareOption == true and blacksmith.rareConfig.bonus or range))
			elseif(isArmor(i)) then
				setItemArmor(i, getItemArmor(i)+(rareOption == true and blacksmith.rareConfig.bonus or range))
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "You have created ".. getItemInfo(match).article .." ".. (rareOption == true and "epic" or "") .." ".. getItemNameById(match)..".")
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
			doSendAnimatedText(toPosition, (rareOption == true and "Epic!" or "Success!"), (rareOption == true and COLOR_YELLOW or COLOR_GREEN))
			doItemSetAttribute(i.uid, "description", "".. getItemInfo(match).description .." ".. (blacksmith.credits == true and "\nIt has forged by ".. getCreatureName(cid) .."." or ""))
			doItemSetAttribute(i.uid, "name", "".. (rareOption == true and "epic" or "") .." ".. getItemInfo(match).name .."")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Something went wrong.")
			doSendMagicEffect(toPosition, CONST_ME_POFF)
			doSendAnimatedText(toPosition, "Failure!", TEXTCOLOR_RED)
		end
		return true
	end
	return doPlayerSendCancel(cid, "This forge recipe doesn't exist.")
end