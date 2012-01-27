function onSay(cid, words, param, channel) -- Script by Xafterin
local s = pokemons[param]
	if s then
		local regist = getPlayerStorageValue(cid, s[1])
		local img = s[2]
		return regist == -1 and doPlayerSendTextMessage(cid, TALKTYPE_ORANGE_1, "Eeehh? What pokemon is it?????") or regist == 1 and doShowTextDialog(cid, s[2], io.open('data/actions/scripts/descriptions/'.. s[3] ..'.txt'):read("*all"))
	elseif not s then
		doPlayerSendTextMessage(cid, TALKTYPE_ORANGE_1, "Eeehh? What pokemon is it?????") 
	end
return 0
end