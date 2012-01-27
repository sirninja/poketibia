function onThink(interval, lastExecution)
        point1 = {x=577,y=1127,z=7}
        point2 = {x=577,y=1121,z=7}
        monster = "Charizard s"
        frase = "charizard apareceu"

        value = 0
        while (value==0) do
                if (doSummonCreature(monster, {x=math.random(point1.x,point2.x),y=math.random(point1.y,point2.y),math.random(point1.z,point2.z)})) then
                        broadcastMessage(frase)
                        value = 1
                end
        end
return TRUE
end