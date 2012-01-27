function onEquip (cid, item, slot)
local cap = getPlayerFreeCap(cid)
local mana = getPlayerMana(cid)
local add = 6-(cap)
doCreatureAddMana(cid, -(mana))
doCreatureAddMana(cid, add)
return true
end