function onCastSpell(cid, var)
----COPY PLAYER STATUS
local playerpos = getPlayerPosition(cid)
local cloth = getCreatureOutfit(cid)
local health = getCreatureHealth(cid)
local maxhealth = getCreatureMaxHealth(cid)

----CLONE THE PLAYER
local clone = doCreateMonster("Scyther", playerpos)
doConvinceCreature(cid, Scyther)
setCreatureMaxHealth(clone, maxhealth)
doCreatureAddHealth(clone, health)
doSetCreatureOutfit(clone, cloth, -1)
doSendMagicEffect(playerpos, 211)
return TRUE
end