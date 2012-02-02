function onUse(cid, item, frompos, item2, topos)
local rat = {x=850,y=1077,z=5}
local cat = {x=852,y=1077,z=5}
local wee = {x=854,y=1077,z=5}
local pox = getPlayerPosition(cid)

if getPlayerStorageValue(cid, 54842) ~= 1 then
local health = 350
local maxhealth = 350
local description = "Contains a Caterpie."
local poke1 = "This is Caterpie's pokeball. HP = ["..health.."/"..maxhealth.."]"
item = doCreateItemEx(2219)
doItemSetAttribute(item, "poke", poke1)
doItemSetAttribute(item, "nome", "Caterpie")
doItemSetAttribute(item, "description", description)
doPlayerAddItemEx(cid, item, true)
doTransformItem(item, 2222)
doPlayerSendTextMessage(cid, 27, "You got your first pokemon ! Now talk to the professor to leave the lab.")
doPlayerSendTextMessage(cid,22,"You have chosen Caterpie")
doPlayerAddExp(cid, 2000)
doPlayerAddItem(cid, 2147,10)
doSendMagicEffect(pox, 21)
doPlayerAddSoul(cid, 1)
setPlayerStorageValue(cid, 54842, 1)
else
doPlayerSendTextMessage(cid, 27, "Sorry, you can only choose one pokemon and once.")
end
return TRUE
end