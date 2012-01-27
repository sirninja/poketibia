function doPushCreature(uid,direction,distance,time)

   if isCreature(uid) == TRUE then

   local rand = (2*math.random(0,1))-1

   local rand2 = math.random(-1,0)

	  if direction == 0 then

	  signal = {0,rand,-rand,rand,-rand,0,-1,-1,-1,0,0,0}

	  elseif direction == 1 then

	  signal = {1,1,1,0,0,0,0,rand,-rand,rand,-rand,0}

	  elseif direction == 2 then

	  signal = {0,rand,-rand,rand,-rand,0,1,1,1,0,0,0}

	  elseif direction == 3 then

	  signal = {-1,-1,-1,0,0,0,0,rand,-rand,rand,-rand,0}

	  elseif direction == 4 then

	  signal = {-1,rand2,(-rand2)-1,0,1,rand2+1,rand2,0}

	  elseif direction == 5 then

	  signal = {1,-rand2,-((-rand2)-1),0,1,rand2+1,rand2,0}

	  elseif direction == 6 then

	  signal = {-1,rand2,(-rand2)-1,0,-1,(-rand2)-1,rand2,0}

	  else

	  signal = {1,-rand2,-((-rand2)-1),0,-1,(-rand2)-1,rand2,0}

	  end

   local pos = getThingPos(uid)

   nsig = #signal

   nvar = 0

   

   repeat

   nvar = nvar+1

   newpos = {x=pos.x+(signal[nvar]),y=pos.y+(signal[(nsig/2)+nvar]),z=pos.z}

   newtile = {x=newpos.x,y=newpos.y,z=newpos.z,stackpos=0}

   until getTileThingByPos(newtile).uid ~= 0 and hasProperty(getTileThingByPos(newtile).uid,3) == FALSE and queryTileAddThing(uid,newpos) == 1 or nvar == (nsig/2) 

   

	  if distance == nil or distance == 1 then

	  doTeleportThing(uid,newpos,TRUE)   

	  else

	  distance = distance-1

	  doTeleportThing(uid,newpos,TRUE)

		 if time ~= nil then

		 addEvent(doPushCreature,time,uid,direction,distance,time)

		 else

		 addEvent(doPushCreature,500,uid,direction,distance,500)

		 end	   

	  end

   end  

end