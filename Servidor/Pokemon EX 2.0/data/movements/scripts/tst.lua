function onThink(cid, interval)
if interval == 3 then
	pokemons = (6.20 - (getPlayerFreeCap(cid)))
	if getPlayerMana(cid) == pokemons then
	return true
	end
	doCreatureAddMana(cid, -(getCreatureMana(cid)))
	doCreatureAddMana(cid, pokemons)
end
end