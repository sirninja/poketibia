vip = {
   name = "Vip system";
   author = "Mock";
   version = "1.0.0.0";
   query="ALTER TABLE `accounts` ADD `vip_time` INTEGER";
   query2="ALTER TABLE `accounts` ADD `vip_time` INT(15) NOT NULL"
}

function vip.setTable()
   dofile('config.lua')
   if sqlType == "sqlite" then
        db.executeQuery(vip.query)
   else
        db.executeQuery(vip.query2)
   end
end

function vip.getVip(cid)
         assert(tonumber(cid),'Parameter must be a number') 
         if isPlayer(cid) == FALSE then error('Player don\'t find') end; 
         ae =  db.getResult("SELECT `vip_time` FROM `accounts` WHERE `name` = '"..getPlayerAccount(cid).."';")
         if ae:getID() == -1 then
            return 0
         end

local retee = ae:getDataInt("vip_time") or 0
ae:free()
         return retee
end

function vip.getVipByAcc(acc)
         assert(acc,'Account is nil')
         local a = db.getResult("SELECT `vip_time` FROM `accounts` WHERE `name` = '"..acc.."';")
         if a:getID() ~= -1 then
             return a:getDataInt("vip_time") or 0, a:free()
         else
             error('Account don\'t find.')
         end
end

function vip.setVip(cid,time)
         dofile("config.lua")
         assert(tonumber(cid),'Parameter must be a number')
         assert(tonumber(time),'Parameter must be a number')
         if isPlayer(cid) == FALSE then error('Player don\'t find') end; 
         db.executeQuery("UPDATE `"..sqlDatabase.."`.`accounts` SET `vip_time` = '"..(os.time()+time).."' WHERE `accounts`.`name` ='".. getPlayerAccount(cid).."';")
end

function vip.getVipByAccount(acc)
         assert(acc,'Account is nil')
         return db.getResult("SELECT `vip_time` FROM `accounts` WHERE `name` = '"..acc.."';"):getDataInt("vip_time") or 0
end                                      

function vip.hasVip(cid)
         assert(tonumber(cid),'Parameter must be a number')
         if isPlayer(cid) == FALSE then return end;
         local t = vip.getVip(cid) or 0
         if os.time(day) < t then
            return TRUE
         else
            return FALSE
         end
end

function vip.hasVips(cid)
         assert(tonumber(cid),'Parameter must be a number')
         if isPlayer(cid) == FALSE then return end;
         local t = vip.getVip(cid)
         if os.time(day) < t then
            return TRUE
         else
            return FALSE
         end
end

function vip.accountHasVip(acc)
         assert(acc,'Account is nil')
         if os.time() < vip.getVipByAccount(acc) then
            return TRUE
         else
            return FALSE
         end
end
function vip.getDays(days)
   return (3600 * 24 * days)
end

function vip.addVipByAccount(acc,time)
   assert(acc,'Account is nil')
   assert(tonumber(time),'Parameter must be a number')
   local a = vip.getVipByAcc(acc)
   a = os.difftime(a,os.time())
   if a < 0 then a = 0 end;
   a = a+time
   return vip.setVipByAccount(acc,a)
end

function vip.setVipByAccount(acc,time)
         dofile("config.lua")
         assert(acc,'Account is nil')
         assert(tonumber(time),'Parameter must be a number')
         db.executeQuery("UPDATE `accounts` SET `vip_time` = '"..(os.time()+time).."' WHERE `accounts`.`name` ='"..acc.."';")
         return TRUE
end

function vip.returnVipString(cid)
   assert(tonumber(cid),'Parameter must be a number')
   if isPlayer(cid) == TRUE then
      return os.date("%d %B %Y %X ", vip.getVip(cid))
   end
end