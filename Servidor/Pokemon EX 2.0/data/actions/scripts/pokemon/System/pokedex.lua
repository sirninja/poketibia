function addPoke(cid, storage)
setPlayerStorageValue(cid, storage, 1) 
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
if not isCreature(itemEx.uid) then
		return doPlayerSendCancel(cid, "Invalid action.")
end
local showpokedex = ""
local closepokedex = ""
local img = ""
local p = pokemons[getCreatureName(itemEx.uid)]
if p then
		img = p[2]
		showpokedex = doShowTextDialog(cid, img, io.open('data/actions/scripts/descriptions/'.. p[3] ..'.txt'):read("*all"))
		closepokedex = io.open('data/actions/scripts/descriptions/'.. p[3] ..'.txt'):close()
	if isMonster(itemEx.uid) then
        return getPlayerStorageValue(cid, p[1]) ~= 1 and doPlayerSendTextMessage(cid, 22, "Now you registered ".. getCreatureName(itemEx.uid) .." into pokedex!") and doPlayerSendTextMessage(cid, 22, "You gain ".. p[1]-7300 .." experience!") and doPlayerAddExperience(cid, p[1]-7300) and showpokedex and closepokedex and addPoke(cid, p[1]) or getPlayerStorageValue(cid, p[1]) == 1 and showpokedex and closepokedex
	end
end
if getCreatureName(itemEx.uid) == getCreatureName(cid) then
    local list = "Pokedex registration: \n"
	local pokemonss = 0
    for i = 7274,7424 do
        if getPlayerStorageValue(cid, i) == 1 then
            list = list.."\n[".. pokestorages[i][1] .."] - ".. pokestorages[i][2] ..""
			pokemonss = pokemonss + 1
        elseif getPlayerStorageValue(cid, i) == -1 then
            list = list.."\n[".. pokestorages[i][1] .."] - Uknown pokemon"
        end
    end
	doPlayerSendTextMessage(cid, TALKTYPE_ORANGE_1, "You have ".. pokemonss .." unlocked pokemons.")
    doShowTextDialog(cid, item.itemid, "".. list .."\n\nEnd of registration.")
end
return true
end