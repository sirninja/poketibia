local kp = {x=984, y=992, z=7} -- west-north ground pos - lowest floor
local floors = 2 -- how many floors can move.. ( min. 2)
winda = {
podloga = 3152, --ground id
sciana_poziomo = 6840, -- wall id
upButton = 1474, -- up button id
downButton = 1475, -- down button id
sciana_pionowo = 6839, -- second wall id
sciana_pillar = 6841, -- wall pillar id
dach = 3139, -- roof id
czubek = 6986, -- pillar on roof id
mocowanie = 4989, -- don't touch
linaCzubkowa = 4982, -- rope on pillar
zaslona_wejsciowa = 1547, -- fence
wentylator = true -- true/false
}
--end of ###config###
---main script
function onUse(cid, item)
local kratkapos = {x = kp.x, y = kp.y, z = kp.z}
local pz = getCreaturePosition(cid)
if item.itemid == 1945 then
	podloga(kratkapos)
	sciana(kratkapos)
	dach(kratkapos)
	otworz(kratkapos)
elseif item.itemid == 1946 then
	zamknij(kratkapos, winda, 0)
	removeSciana(kratkapos)
	removePodloga(kratkapos)
	removeDach(kratkapos)
elseif item.itemid == winda.upButton then-- By Dubler
	kratkapos.z = pz.z	
	if ((kratkapos.z - 1 > kp.z - floors) == false) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You can not travel over this floor.')
	elseif getTopCreature({x = kratkapos.x, y = kratkapos.y + 2, z = kratkapos.z}).uid ~= 0 or getTopCreature({x = kratkapos.x + 1, y = kratkapos.y + 2, z = kratkapos.z}).uid ~= 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Somebody is staying at the entrance.')
	else
		zamknij(kratkapos)
		addEvent(reszta1, 4000, kratkapos, cid)
		addEvent(otworz, 5000, kratkapos, cid)
	end
elseif item.itemid == winda.downButton then
	kratkapos.z = pz.z
	if kratkapos.z + 1 > kp.z then
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You can not travel below this floor.')
	else
		zamknij(kratkapos)
		addEvent(reszta2, 4000, kratkapos, cid)
		addEvent(otworz, 5000, kratkapos, cid)
	end
end
return true
end
-- end of main script

function doCreateTile(id,pos)
doAreaCombatHealth(0,0,pos,0,0,0,255)
return doCreateItem(id,1,pos)
end

function doRemoveTile(pos)
doRemoveItem(doCreateItem(460, 1, pos))
end

function podloga(kratkapos)
doCreateTile(winda.podloga,kratkapos)
doCreateTile(winda.podloga,{x = kratkapos.x, y = kratkapos.y + 1, z = kratkapos.z})
doCreateTile(winda.podloga,{x = kratkapos.x, y = kratkapos.y + 2, z = kratkapos.z})
doCreateTile(winda.podloga,{x = kratkapos.x + 1, y = kratkapos.y, z = kratkapos.z})
doCreateTile(winda.podloga,{x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z})-- By Dubler
doCreateTile(winda.podloga,{x = kratkapos.x + 1, y = kratkapos.y + 2, z = kratkapos.z})
doCreateTile(winda.podloga,{x = kratkapos.x + 2, y = kratkapos.y, z = kratkapos.z})
doCreateTile(winda.podloga,{x = kratkapos.x + 2, y = kratkapos.y + 1, z = kratkapos.z})
doCreateTile(winda.podloga,{x = kratkapos.x + 2, y = kratkapos.y + 2, z = kratkapos.z})
end

function removePodloga(kratkapos)
doRemoveTile(kratkapos)
doRemoveTile({x = kratkapos.x, y = kratkapos.y + 1, z = kratkapos.z})
doRemoveTile({x = kratkapos.x, y = kratkapos.y + 2, z = kratkapos.z})
doRemoveTile({x = kratkapos.x + 1, y = kratkapos.y, z = kratkapos.z})
doRemoveTile({x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z})
doRemoveTile({x = kratkapos.x + 1, y = kratkapos.y + 2, z = kratkapos.z})
doRemoveTile({x = kratkapos.x + 2, y = kratkapos.y, z = kratkapos.z})
doRemoveTile({x = kratkapos.x + 2, y = kratkapos.y + 1, z = kratkapos.z})
doRemoveTile({x = kratkapos.x + 2, y = kratkapos.y + 2, z = kratkapos.z})
end

function sciana(kratkapos)
doCreateItem(winda.sciana_poziomo,1,{x = kratkapos.x, y = kratkapos.y - 1, z = kratkapos.z})
doCreateItem(winda.sciana_poziomo,1,{x = kratkapos.x + 1, y = kratkapos.y - 1, z = kratkapos.z})
doCreateItem(winda.sciana_poziomo,1,{x = kratkapos.x + 2, y = kratkapos.y - 1, z = kratkapos.z})
doCreateItem(winda.upButton,1,{x = kratkapos.x, y = kratkapos.y - 1, z = kratkapos.z})
doItemSetAttribute(getThingFromPos({x = kratkapos.x, y = kratkapos.y - 1, z = kratkapos.z, stackpos = 2}).uid,"aid",17016)
doCreateItem(winda.downButton,1,{x = kratkapos.x + 1, y = kratkapos.y - 1, z = kratkapos.z})
doItemSetAttribute(getThingFromPos({x = kratkapos.x + 1, y = kratkapos.y - 1, z = kratkapos.z, stackpos = 2}).uid,"aid",17016)
doCreateItem(winda.sciana_pionowo,1,{x = kratkapos.x - 1, y = kratkapos.y, z = kratkapos.z})
doCreateItem(winda.sciana_pionowo,1,{x = kratkapos.x - 1, y = kratkapos.y + 1, z = kratkapos.z})
doCreateItem(winda.sciana_pionowo,1,{x = kratkapos.x - 1, y = kratkapos.y + 2, z = kratkapos.z})
doCreateItem(winda.sciana_pionowo,1,{x = kratkapos.x + 2, y = kratkapos.y, z = kratkapos.z})
doCreateItem(winda.sciana_pionowo,1,{x = kratkapos.x + 2, y = kratkapos.y + 1, z = kratkapos.z})
doCreateItem(winda.sciana_pionowo,1,{x = kratkapos.x + 2, y = kratkapos.y + 2, z = kratkapos.z})
doCreateItem(winda.sciana_pillar,1,{x = kratkapos.x - 1, y = kratkapos.y - 1, z = kratkapos.z})
doCreateItem(winda.zaslona_wejsciowa,1,{x = kratkapos.x, y = kratkapos.y + 2, z = kratkapos.z})
doCreateItem(winda.zaslona_wejsciowa,1,{x = kratkapos.x + 1, y = kratkapos.y + 2, z = kratkapos.z})
doCreateItem(winda.zaslona_wejsciowa,1,{x = kratkapos.x + 2, y = kratkapos.y + 2, z = kratkapos.z})
end
function removeSciana(kratkapos)
doRemoveItem(getThingFromPos({x = kratkapos.x, y = kratkapos.y - 1, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 1, y = kratkapos.y - 1, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 2, y = kratkapos.y - 1, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x, y = kratkapos.y - 1, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 1, y = kratkapos.y - 1, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x - 1, y = kratkapos.y, z = kratkapos.z, stackpos = 1}).uid)-- By Dubler
doRemoveItem(getThingFromPos({x = kratkapos.x - 1, y = kratkapos.y + 1, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x - 1, y = kratkapos.y + 2, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 2, y = kratkapos.y, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 2, y = kratkapos.y + 1, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 2, y = kratkapos.y + 2, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x - 1, y = kratkapos.y - 1, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x, y = kratkapos.y + 2, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 1, y = kratkapos.y + 2, z = kratkapos.z, stackpos = 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 2, y = kratkapos.y + 2, z = kratkapos.z, stackpos = 1}).uid)
end
function dach(kratkapos)
doCreateTile(winda.dach,{x = kratkapos.x, y = kratkapos.y, z = kratkapos.z - 1})
doCreateTile(winda.dach,{x = kratkapos.x, y = kratkapos.y + 1, z = kratkapos.z - 1})
doCreateTile(winda.dach,{x = kratkapos.x, y = kratkapos.y + 2, z = kratkapos.z - 1})
doCreateTile(winda.dach,{x = kratkapos.x + 1, y = kratkapos.y, z = kratkapos.z - 1})
doCreateTile(winda.dach,{x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z - 1})
doCreateTile(winda.dach,{x = kratkapos.x + 1, y = kratkapos.y + 2, z = kratkapos.z - 1})
doCreateTile(winda.dach,{x = kratkapos.x + 2, y = kratkapos.y, z = kratkapos.z - 1})
doCreateTile(winda.dach,{x = kratkapos.x + 2, y = kratkapos.y + 1, z = kratkapos.z - 1})
doCreateTile(winda.czubek,{x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z - 1, stackpos = 3})
doCreateTile(winda.mocowanie,{x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z - 1, stackpos = 2})
doCreateTile(winda.linaCzubkowa,{x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z - 1, stackpos = 1})
if (winda.wentylator == false) then
doCreateTile(winda.dach,{x = kratkapos.x + 2, y = kratkapos.y + 2, z = kratkapos.z - 1})
elseif (winda.wentylator == true) then
doCreateTile(4972,{x = kratkapos.x + 2, y = kratkapos.y + 2, z = kratkapos.z - 1})
end
end
function removeDach(kratkapos)
doRemoveTile({x = kratkapos.x, y = kratkapos.y, z = kratkapos.z - 1})
doRemoveTile({x = kratkapos.x, y = kratkapos.y + 1, z = kratkapos.z - 1})
doRemoveTile({x = kratkapos.x, y = kratkapos.y + 2, z = kratkapos.z - 1})
doRemoveTile({x = kratkapos.x + 1, y = kratkapos.y, z = kratkapos.z - 1})
doRemoveTile({x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z - 1})
doRemoveTile({x = kratkapos.x + 1, y = kratkapos.y + 2, z = kratkapos.z - 1})
doRemoveTile({x = kratkapos.x + 2, y = kratkapos.y, z = kratkapos.z - 1})
doRemoveTile({x = kratkapos.x + 2, y = kratkapos.y + 1, z = kratkapos.z - 1})
doRemoveItem(getThingFromPos({x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z - 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z - 1}).uid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 1, y = kratkapos.y + 1, z = kratkapos.z - 1}).uid)
doRemoveTile({x = kratkapos.x + 2, y = kratkapos.y + 2, z = kratkapos.z - 1})
end -- koniec removedach()
function ktorepietro(cid, kp, floors)
local ktorepietr = kp.z - getCreaturePosition(cid).z + floors - 1-- By Dubler
msg = "error"
if ktorepietr == 1 then
local msg = "1st"
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg .. " floor")
elseif ktorepietr == 2 then
local msg = "2nd"
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg .. " floor")
else
msg = ktorepietr-- By Dubler
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg .. " floor")
end
end
function otworz(kratkapos, cid)
addEvent(event4, 1000, kratkapos, cid)
addEvent(event5, 1500, kratkapos, cid)
addEvent(event6, 2000, kratkapos, cid)
end
function event4(kratkapos, cid)
doRemoveItem(getThingFromPos({x = kratkapos.x, y = kratkapos.y + 2, z = getCreaturePosition(cid).z, stackpos = 1}).uid)
end
function event5(kratkapos, cid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 1, y = kratkapos.y + 2, z = getCreaturePosition(cid).z, stackpos = 1}).uid)
end
function event6(kratkapos, cid)
doRemoveItem(getThingFromPos({x = kratkapos.x + 2, y = kratkapos.y + 2, z = getCreaturePosition(cid).z, stackpos = 2}).uid)
end
function zamknij(kratkapos)
addEvent(event1, 1000, kratkapos)
addEvent(event2, 1500, kratkapos)
addEvent(event3, 2000, kratkapos)
return true
end
function event1(kratkapos)
doCreateItem(winda.zaslona_wejsciowa, 1, {x=kratkapos.x, y=kratkapos.y+2, z=kratkapos.z, stackpos=2})
end
function event2(kratkapos)
doCreateItem(winda.zaslona_wejsciowa, 1, {x=kratkapos.x + 1, y=kratkapos.y+2, z=kratkapos.z, stackpos=2})
end-- By Dubler
function event3(kratkapos)
doCreateItem(winda.zaslona_wejsciowa, 1, {x=kratkapos.x + 2, y=kratkapos.y+2, z=kratkapos.z, stackpos=2})
end
function reszta1(kratkapos, cid)
		local pz = getCreaturePosition(cid)
		removeDach(kratkapos)
		removeSciana(kratkapos)
		kratkapos.z = kratkapos.z - 1  
		podloga(kratkapos)
		sciana(kratkapos)
		dach(kratkapos)
		doTeleportThing(getThingfromPos({x = kratkapos.x, y = kratkapos.y, z = pz.z, stackpos = 255}).uid,{x = kratkapos.x, y = kratkapos.y, z = pz.z - 1})
		doTeleportThing(getThingfromPos({x = kratkapos.x + 1, y = kratkapos.y, z = pz.z, stackpos = 255}).uid,{x = kratkapos.x + 1, y = kratkapos.y, z = pz.z - 1})
		doTeleportThing(getThingfromPos({x = kratkapos.x, y = kratkapos.y + 1, z = pz.z, stackpos = 255}).uid,{x = kratkapos.x, y = kratkapos.y + 1, z = pz.z - 1})
		doTeleportThing(getThingfromPos({x = kratkapos.x + 1, y = kratkapos.y + 1, z = pz.z, stackpos = 255}).uid,{x = kratkapos.x + 1, y = kratkapos.y + 1, z = pz.z - 1})
		kratkapos.z = kratkapos.z + 1
		removePodloga(kratkapos)-- By Dubler
		ktorepietro(cid, kp, floors)
end
function reszta2(kratkapos, cid)
		local pz = getCreaturePosition(cid)
		removeDach(kratkapos)
		removeSciana(kratkapos)
		kratkapos.z = pz.z + 1
		podloga(kratkapos)
		sciana(kratkapos)
		print (kratkapos.x)
		print (kratkapos.y)
		print (pz.z)
		doTeleportThing(getThingfromPos({x = kratkapos.x, y = kratkapos.y, z = pz.z, stackpos = 255}).uid,{x = kratkapos.x, y = kratkapos.y, z = pz.z + 1})
		doTeleportThing(getThingfromPos({x = kratkapos.x + 1, y = kratkapos.y, z = pz.z, stackpos = 255}).uid,{x = kratkapos.x + 1, y = kratkapos.y, z = pz.z + 1})
		doTeleportThing(getThingfromPos({x = kratkapos.x, y = kratkapos.y + 1, z = pz.z, stackpos = 255}).uid,{x = kratkapos.x, y = kratkapos.y + 1, z = pz.z + 1})
		doTeleportThing(getThingfromPos({x = kratkapos.x + 1, y = kratkapos.y + 1, z = pz.z, stackpos = 255}).uid,{x = kratkapos.x + 1, y = kratkapos.y + 1, z = pz.z + 1})
		kratkapos.z = pz.z - 1
		removePodloga(kratkapos)
		kratkapos.z = pz.z + 1
		dach(kratkapos)-- By Dubler
		ktorepietro(cid, kp, floors)
end