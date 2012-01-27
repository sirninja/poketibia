--######################################### ABOUT  #################
--      Advanced Auction House                                                    ####
--          code by josejunior23                                                 ####
--  the function add_depot_item(guid, item, count) as made by magus from otserv.com.br        ####
--  any other code in this file as made by me.                                         ####
--               ... and thanks to the TFS, they make it more easy :)                          ####    
--######################################### CONFIG  ################################################################
local max_days, bad_items, able_items, max_offer, max_items, main_file, item_show, access_need  =--                                                                           # J   #
    2,  --                                              1º -      <MAX DAYS> - when player add an offer, his offer will stay for X days, in this case 2.                         # O  #
    {"gold coin", "crystal coin", "platinum coin", "worm"},  --     2º -     <IGNORED ITEMS> - put here all items that you dont want players put for sale.                                       #  S  # 
    {able_runes = false, able_potions = true}, --           3º -     <ABLE/DISABLE RUNES/POTIONS> - choose if you want to player sell runes/pots                          #  E  #
    40000000, --                                           4º -     <MAX OFFER> - max offer that players may ask for his item's, in this case 40 000 000 golds (40kk).              #  J  # 
    5, --                                               5º -     <MAX ITEMS PER PLAYER> - max items that each player can put for sale, in this case 5.                   #  R #    
    'houseItems.txt', --                                      6º -     <###MAIN FILE###> -  this is the name of the MAIN FILE, where the script save the offers..                   #  2 #
    2160, --                                               7º -     <DUUUH, NOTHING ESPECIAL> -  this show a crystal coin (itemid: 2160) when player say ex: !auction-list [param  #  3 #
    3 --                                                        8º -     <ACCESS> -  this  is the access You need to use command !auction-clean                                       ####    
--##########################################################################################################################
 
-- ########## LIB FUNCTIONS  ###########
function load_table(file)
    local t = { }
    for m in io.lines(file) do
        local d, i, c, a, s = m:match '(%S+)%s+(%S+)%s+(%S+)%s+(%S+)%s+(%S+)'
        table.insert(t, {date = d, item = i, cost = c, ammount = a, seller = s })    
    end
    return t
end
function save_table(file, text)
    local f = io.open(file,"w")
    f:write(text)
    f:close()
end
function add_new_line(file, arr)
    local tab = load_table(file)
    table.insert(tab, {date = arr.d, item = arr.i, cost = arr.c, ammount = arr.a, seller = arr.s })
    save_table(file, covert_table(tab))
end
function del_line_by_id(file, id)
    local tab = load_table(file)
    table.remove (tab, id)
    save_table(file, covert_table(tab))
end
function covert_table(tab)
    local t = ""
    for i in pairs(tab) do
        t = t .. "" .. tab[i].date .. " " .. tab[i].item .. " " .. tab[i].cost .. " " .. tab[i].ammount .. " " .. tab[i].seller .. "\n"
    end    
    return t
end
function get_ramdom_thing(tab)
    return tab[math.random(1, #tab)]
end
function list_items(tab, str)
    local i = 0
    if(str == nil) then str = "" end
    for id in pairs(tab) do
        i = i + 1
        if(tab[id].x) then i = tab[id].x end    
        str = str .. "\n " .. i .. "#  " .. tab[id].ammount .. "x " .. getItemNameById(tab[id].item) .. "  " .. tab[id].cost .. "  " .. getPlayerNameByGUID(tab[id].seller)
    end
    local txt = { "`!auction-buy id´\n->  to buy an item.", "`!auction-sell item, ammount, price´\n->  to sell an item.", "`!auction-info id´\n->  to see more information about id offer.",  "`!auction-list´\n->  to see a complete list with offers.", "`!auction-find name´\n-> to find offers by name.", "`!auction-withdraw´\n->  to get your money from our house.", "`!auction-del id´\n->  to delete an offer made by You."}
    return str .. "\n\nTip: " .. get_ramdom_thing(txt)
end
function get_info(file, id) -- id == line
    local tab, list = load_table(file), nil
    for i = 1, #tab do
        if(i == id)then list = {date = tab[i].date, item = tab[i].item, cost = tab[i].cost, ammount = tab[i].ammount, seller = tab[i].seller} break end
    end
    return list
end
function add_depot_item(guid, item, count)-- by Magus
    local item,count = type(item)=="table" and item or {item},type(count)=="table" and count or {(count or 1)}
    for k,v in ipairs(item) do
        local ls = db.getResult("SELECT `sid` FROM `player_depotitems` WHERE `player_id` = "..guid.." ORDER BY `sid` DESC LIMIT 1")
        return db.executeQuery("INSERT INTO `player_depotitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES ("..guid..", "..(ls:getDataInt("sid")+1)..", 101, "..v..", "..count[k]..", '"..(count[k] > 1 and string.format("%x",count[k]) or '').."')") or false
    end
end
function add_day (days)
    local d, m, y = tonumber(os.date("%d")) + days, tonumber(os.date("%m")), tonumber(os.date("%y"))
    while d > 30 do  d = 01  m = m + 1 end while m > 12 do  d = 01 m = 01 y = y + 1 end
    return  m .. "/" .. d .. "/" .. y
end    
function clean_offers(file, m)
    local l, t = 0, os.date("%m/%d/%y")
    if m then t = m end
    for e in io.lines(file) do
        l = l + 1
        local d, i, c, a, s = e:match '(%S+)%s+(%S+)%s+(%S+)%s+(%S+)%s+(%S+)'
        if(d == t) then
            del_line_by_id(file, l)
            l = l - 1
            local p = getPlayerByName(getPlayerNameByGUID(s))
            if(isCreature(p)) then
                doPlayerAddItem(p, i, a)
                doPlayerSendTextMessage(p,  MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: we could not sell Your ' .. a .. 'x of `' .. getItemNameById(i) .. '´ in our house, take it back.')    
            else
                local s, i, a = tonumber(s),tonumber(i),tonumber(a)
                add_depot_item(s, i, a)
            end            
        end
    end
end
function get_player_offers(g, file)-- g = player guid
    local o, x = {}, 0
    for l in io.lines(file) do
        x = x + 1
        local d, i, c, a, s = l:match '(%S+)%s+(%S+)%s+(%S+)%s+(%S+)%s+(%S+)'    
        if(tonumber(s) == g) then
            table.insert(o, {date = d, item = i, cost = c, ammount = a, seller = s , x = x})
        end
    end
    return o
end
function find_offers_by_name(name, file) -- this funciton find offers with item name
    local o, x = {}, 0
    for l in io.lines(file) do
        x = x + 1
        local d, i, c, a, s = l:match '(%S+)%s+(%S+)%s+(%S+)%s+(%S+)%s+(%S+)'    
        if(getItemNameById(tonumber(i)) == name) then
            table.insert(o, {date = d, item = i, cost = c, ammount = a, seller = s , x = x})
        end
    end
    return o
end
-- ########## LIB FUNCTIONS  ############
 
-- ########## onSay FUNCTION  ###########
function onSay(cid, words, param, channel)
    if(words == "!auction-sell") then
        local t = string.explode(param, ",")
        if not t[2] or not t[3] or not param or (isNumber(t[1])) or not(isNumber(t[2])) or not (isNumber(t[3])) or (tonumber(t[2]) <= 0) or (tonumber(t[2]) > 100) or (tonumber(t[3]) <= 0) or (tonumber(t[2]) > 1) and not (isItemStackable(getItemIdByName(t[1]))) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: type the name of an item with ammount and offer: `!auction-sell carrion worm fang, 100, 3650´.\n Tip: `!auction-sell´ is the command, `carrion worm fang´ is the item, `100´ is the ammount, `3650´ is the price you want for it.')
            return true
        end
        if(isItemContainer(getItemIdByName(t[1]))) or not (isItemMovable(getItemIdByName(t[1]))) or (isInArray(bad_items, t[1])) or (isItemFluidContainer(getItemIdByName(t[1]))) and (able_items.able_potions == false) or (isItemRune(getItemIdByName(t[1]))) and (able_items.able_runes == false) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: we do not accept those kind of items.')
            return true
        end
        if(max_items ~= 0) and (#get_player_offers(getPlayerGUID(cid), main_file) >= max_items) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: You already have too many items in our house. You have a total of `' .. #get_player_offers(getPlayerGUID(cid), main_file) .. '´ items in our house and still can put more `' .. max_items - #get_player_offers(getPlayerGUID(cid), main_file) .. '´ items.')
            return true
        end
        if(tonumber(t[3]) > max_offer) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: sorry, this price is too much. the limit is: `' .. max_offer .. '´ golds.')
            return true
        end    
        if(doPlayerRemoveItem(cid, getItemIdByName(t[1]), t[2])) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: we have added your ' .. t[2] .. 'x  `' .. t[1] .. '´ as offer to our house.\n say `!auction-info ' .. #load_table(main_file) + 1 .. '´ to see more information about your offer.\nYou have a total of `' .. #get_player_offers(getPlayerGUID(cid), main_file)+1 .. '´ items in our house and still can put more `' .. (max_items == 0 and "NO LIMIT" or max_items - #get_player_offers(getPlayerGUID(cid), main_file) -  1) .. '´ items.')
            add_new_line(main_file, {d = add_day (max_days), i = getItemIdByName(t[1]), c = tonumber(t[3]), a = tonumber(t[2]), s = getPlayerGUID(cid)})
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: could not find item `' .. t[1] .. '´ in your backpacks/slots.')
        end
    elseif(words == "!auction-buy") then
        if not (isNumber(param)) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: ID. Offer should be a number.')
            return true
        end
        local f = get_info(main_file, tonumber(param))
        if not f then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: could not find results for ID. `' .. tonumber(param) .. '´.')
            return true
        end
        if(doPlayerRemoveMoney(cid, f.cost) == true) then
            del_line_by_id(main_file,  tonumber(param))
            doPlayerAddItem(cid, f.item, f.ammount, false)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: You brought ' .. f.ammount .. 'x of `' .. getItemNameById(f.item) .. '´ for `' .. f.cost .. '´ golds from our house.')        
            local pid = getPlayerByName(getPlayerNameByGUID(f.seller))
            if not (isCreature(pid)) then
                db.executeQuery("UPDATE `players` SET `balance` = `balance` + '" .. f.cost .. "' WHERE `name` = '" .. getPlayerNameByGUID(f.seller) .. "';")
                return true
            end
            doPlayerAddMoney(pid, f.cost)
            doPlayerSendTextMessage(pid,  MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: we sold Your ' .. f.ammount .. 'x of `' .. getItemNameById(f.item) .. '´ in our house, heres Yours `' .. f.cost .. '´ golds.')            
        end
    elseif(words == "!auction-list") then
        if(param == '') then
            local tab = load_table(main_file)
            if(#tab > 20) then
                doShowTextDialog(cid, item_show, list_items(tab, "    #-> ADVANCED AUCTION HOUSE <-#\n\n Total of `" .. #tab .. "´ items in our stock.\n\n ID.           Item           Gold            Seller"))
            else
                doPlayerPopupFYI(cid, list_items(tab, "    #-> ADVANCED AUCTION HOUSE <-#\n\n Total of `" .. #tab .. "´ items in our stock.\n\n ID.           Item           Gold            Seller"))
            end
        else
            if(isNumber(param)) or not (isPlayer(getPlayerByName(param))) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: could not find a player online with name: `' .. param .. '´. \n Tip: remember, You can only look for offers from a player that is online. but You still can see their offers from `!auction-list´.')            
                return true
            end
            local offers = get_player_offers(getPlayerGUID(getPlayerByName(param)), main_file)
            doShowTextDialog(cid, item_show, list_items(offers, "    #-> ADVANCED AUCTION HOUSE <-#\n\n " .. string.upper(param) .. ", \n as a total of `" .. #offers .. "´ items in our stock.\n\n ID.      Item           Gold            Seller"))                
        end
    elseif(words == "!auction-info") then    
        if not (isNumber(param)) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: ID. Offer should be a number.')
            return true
        end
        local f = get_info(main_file, tonumber(param))
        if not f then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: could not find results for ID. `' .. tonumber(param) .. '´.')
            return true
        end
        local txt = "  #-> ADVANCED AUCTION HOUSE <-#\n                Showing Offer ID. " .. tonumber(param) ..
        "#\n\n - Expire Date: " .. f.date ..  "\n - Item: x" .. f.ammount .. " " .. getItemNameById(f.item) ..
        "\n - Cost: " .. f.cost .. " golds\n - Seller: " .. getPlayerNameByGUID(f.seller) .. "" 
        doShowTextDialog(cid, f.item, txt)    
    elseif(words == "!auction-del") then    
        if not (isNumber(param)) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: ID. Offer should be a number.')
            return true
        end        
        local f = get_info(main_file, tonumber(param))
        if not f then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: could not find results for ID. `' .. tonumber(param) .. '´.')
            return true
        end
        if(tonumber(f.seller) == getPlayerGUID(cid)) then
            del_line_by_id(main_file,  tonumber(param))
            doPlayerAddItem(cid, f.item, f.ammount, false)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: we removed your offer from our house, take back x' .. f.ammount .. ' of `' .. getItemNameById(f.item) .. '´.')        
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: You may not remove offer ID. `' .. tonumber(param) .. '´. reason: it does not belongs to You.')
        end        
    elseif(words == "!auction-find") then    
        if(isNumber(param)) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: could not find results for item `' .. tonumber(param) .. '´, make sure the name is right.')
            return true
        end
        local tab = find_offers_by_name(param, main_file)
        if(#tab == 0) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: could not find results for item `' .. param .. '´.')
            return true
        end        
        doShowTextDialog(cid,  getItemIdByName(param), list_items(tab, "    #-> ADVANCED AUCTION HOUSE <-#\n\n Total of `" .. #tab .. "´ `" .. param .. "´ in our stock.\n\n ID.           Item           Gold            Seller"))
    elseif(words == "!auction-cmd") or(words == "!auction") then        
        local stuff = {{"`!auction-buy id´", "to buy an item by offer id\n\n"},  {"`!auction-sell itemname, ammount, price´", "to sell an item\n\n"}, {"`!auction-info id´", "to see more information about offer id\n\n"}, {"`!auction-list´", "to see a complete list with offers\n\n"}, {"`!auction-del id´", "to delete an offer made by you\n\n"}, {"`!auction-find name´", "to find offers by name\n\n"},  {"`!auction-withdraw´", "to get your money from our house\n\n"}, {"`!auction-balance´", "to see your current balance in our house\n\n"}}
        local txt = "             > ADVANCED AUCTION HOUSE <\n\n"
        for i = 1, #stuff do txt = txt ..  " " .. i .. ". - " .. stuff[i][1] .. "\n      > " .. stuff[i][2] end
        -- ^ dont ask why, I just made in this way =)
        doPlayerPopupFYI(cid, txt .. "\n                   >Code by josejunior23<")
        --                                                                                                    ^ Do not remove s2
    elseif(words == "!auction-withdraw") then    
        local total_money = getPlayerBalance(cid)
        if(total_money <= 0) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: Your balance is `0´. ')
            return true
        end    
        doPlayerAddMoney(cid, total_money)
        doPlayerSetBalance(cid, 0)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: You withdraw `' .. total_money .. '´ golds from our house. Your balance is now `0´.')
    elseif(words == "!auction-balance") then    
        local total_money = getPlayerBalance(cid)
        if(total_money <= 0) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: Your balance is `0´. ')
            return true
        end    
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: Your balance is `' .. total_money .. '´golds, You can withdraw that money at anytime, type `!aution-withdraw´ to get all Your money from our house.')
    elseif(words == "!auction-clean") then        
        if not (getPlayerAccess(cid) >= access_need) then
            doPlayerSendCancel(cid, '<this is not a valid command>')
            return false    
        end    
        if not (param) then
            clean_offers(main_file)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: all offers with date: ' .. os.date("%m/%d/%y") .. ' as been reseted.\n Remember, the scripts ignore offers with less/more days.')
            return true
        end    
        if(isNumber(param)) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: this is not a valid date, date format should be like in this example: ' .. os.date("%m/%d/%y") .. ' (month/day/year) . ')
            return true
        end
        clean_offers(main_file, param)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[AUCTION-HOUSE]: all offers with date: ' .. param .. ' as been reseted.\n Remember, the scripts ignore offers with less/more days.')    
    end
    return true
end
-- ########## onSay FUNCTION  ###########
 
-- ########## onTimer FUNCTION  ##########
function onTimer(cid, interval, lastExecution)
    clean_offers(main_file)
    return true
end
-- ########## onTimer FUNCTION  ##########