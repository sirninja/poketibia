function onUse(cid, item, frompos, item2, topos)
local rat = {x=603,y=1148,z=2}
local cat = {x=601,y=1148,z=2}
local wee = {x=605,y=1148,z=2}
local pox = getPlayerPosition(cid)

if getPlayerStorageValue(cid, 54842) ~= 1 then
local health = 350
local maxhealth = 350
local description = "Contains a Weedle."
local poke1 = "This is Weedle's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Weedle")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doPlayerSendTextMessage(cid, 27, "Voce pegou um pokemon.")
doPlayerAddExp(cid, 2000)
doPlayerAddItem(cid, 2147,10)
doSendMagicEffect(pox, 21)
doPlayerAddSoul(cid, 1)
setPlayerStorageValue(cid, 54842, 1)
else
doPlayerSendTextMessage(cid, 27, "Voce ja pegou o pokemon.")
end
return TRUE
end