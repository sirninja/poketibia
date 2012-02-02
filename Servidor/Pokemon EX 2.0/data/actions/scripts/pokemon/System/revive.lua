local balls = {
		[2222]  = { b = 2222 },
		[2224]  = { b = 2222 },
		
		[11438] = { b = 11438 },
		[11440] = { b = 11438 },
		
		[11442] = { b = 11442 },
		[11444] = { b = 11442 },
		
		[2220]  = { b = 2220 },
		[2227]  = { b = 2220 },
		
		[11446] = { b = 11446 },
		[11447] = { b = 11446 },
		[11448] = { b = 11446 },
		
		[11449] = { b = 11449 },
		[11450] = { b = 11449 },
		[11451] = { b = 11449 },
		
		[11452] = { b = 11452 },
		[11453] = { b = 11452 },
		[11454] = { b = 11452 },
		
		[11455] = { b = 11455 },
		[11456] = { b = 11455 },
		[11457] = { b = 11455 },
		
		[11458] = { b = 11458 },
		[11459] = { b = 11458 },
		[11460] = { b = 11458 },
}

function onUse(cid, item, frompos, item2, topos)

		local ball = balls[item2.itemid]
		if ( ball ~= nill ) then
				local maxh = tonumber(getItemAttribute(item2.uid, "poke"):match("/(.+)]"))
      	doItemSetAttribute(item2.uid, "poke", getItemAttribute(item2.uid, "poke"):sub(1, findLetter(getItemAttribute(item2.uid, "poke"), "[")) .. maxh .. getItemAttribute(item2.uid, "poke"):sub(findLetter(getItemAttribute(item2.uid, "poke"), "/")))
      	doTransformItem(item2.uid, ball.b)
 
				apelido = getItemAttribute(item2.uid, "apelido")
				if apelido == nil then
						apelido = getItemAttribute(item2.uid, "poke"):match("This is (.-)'s pokeball.")
				end
				
				doPlayerSendCancel(cid, ""..apelido.."'s have been revived")
				doRemoveItem(item.uid,1)
				return true
				
		end
	
		return doPlayerSendCancel(cid, "Use this item in a ball with Pokemon inside")

end

