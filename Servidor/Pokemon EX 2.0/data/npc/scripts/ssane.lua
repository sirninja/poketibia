   -- Different Travel NPC by Notorious (OTBR)

 local focuses, controlId = {}, 3586
 local cities = {
 {name = "cinnabar", pos = {x=615, y=1292, z=6}, price = 5000, requirePremium = false},
 {name = "ilha pkm gigantes", pos = {x=845, y=1457, z=7}, price = 10000, requirePremium = false},
 }

function onCreatureDisappear(cid)
    if isFocused(cid, focuses) then
     removeFocus(cid, focuses)
        if isPlayer(cid) then
         closeShopWindow(cid)
        end
    end
end

local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
 local info = cities[item-controlId]
    if getPlayerMoney(cid) >= info.price then
     doTeleportThing(cid, info.pos, false)
     doPlayerRemoveMoney(cid, info.price)
     selfSay("Here we are!", cid)
     closeShopWindow(cid)
     removeFocus(cid, focuses)
     lookAtFocus(focuses)
    end
end

function onCreatureSay(cid, type, msg)
 local travelWindow = {}
    if msgcontains(msg, "hi", "oi") and not isFocused(cid, focuses) and getDistanceToCreature(cid) < 4 then
     selfSay("Hiho " .. getCreatureName(cid) .. ", Eu te levo pra cinnabar ou ilha dos  pokemons gigantes. Diga 'destinos'.", cid)
     addFocus(cid, focuses)
     selfFocus(cid)
    elseif msgcontains(msg, "cinnabar", "destinos") and isFocused(cid, focuses) then
     selfSay("Confira.", cid)
        for index, info in pairs(cities) do
            if not info.requirePremium or isPremium(cid) and info.requirePremium then
             table.insert(travelWindow, {id=controlId+index, subType=0, buy=info.price, sell=0, name=info.name})
            end
        end
        openShopWindow(cid, travelWindow, onBuy, onSell)
    elseif msgcontains(msg, "bye", "goodbye") and isFocused(cid, focuses) then
     selfSay("Goodbye!", cid)
     closeShopWindow(cid)
     removeFocus(cid, focuses)
     lookAtFocus(focuses)
    end
end

function onThink()
    for _, focus in pairs(focuses) do
        if not isCreature(focus) then
         removeFocus(focus, focuses)
        else
         local distance = getDistanceTo(focus) or 5
            if distance > 4 then
                selfSay("Hmpf!", focus)
                closeShopWindow(focus)
                removeFocus(focus, focuses)
            end
        end
    end
    lookAtFocus(focuses)
end