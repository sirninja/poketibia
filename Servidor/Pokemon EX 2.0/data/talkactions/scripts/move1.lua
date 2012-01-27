-- HEALERA----
local hl = createCombatArea{
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 2, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
---------------------------------------



-- WATER GUN
local wg1n = createCombatArea{
{0, 0, 0}, 
{0, 2, 0}, 
{0, 1, 0}, 
}
local wg2n = createCombatArea{
{0, 2, 0},
{0, 0, 0},
{0, 1, 0}, 
{0, 1, 0}, 
{0, 1, 0}, 
}
local wg3n = createCombatArea{
{0, 2, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0}, 
{0, 0, 0}, 
{0, 1, 0}, 
}

local wg1s = createCombatArea{
{0, 1, 0}, 
{0, 2, 0}, 
{0, 0, 0}, 
}
local wg2s = createCombatArea{
{0, 1, 0},
{0, 1, 0},
{0, 1, 0}, 
{0, 0, 0}, 
{0, 2, 0}, 
}
local wg3s = createCombatArea{
{0, 1, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0}, 
{0, 0, 0}, 
{0, 2, 0}, 
}

local tsn = createCombatArea{
{0, 0, 0, 2, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 0},  
}

local tss = createCombatArea{
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 2, 0, 0, 0},  
}

local tse = createCombatArea{
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 2},
{0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0},  
}

local tsw = createCombatArea{
{0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 1, 1, 0},
{0, 0, 2, 1, 1, 1, 0},
{0, 0, 0, 0, 1, 1, 0},
{0, 0, 0, 0, 0, 1, 0},  
}

local wg1e = createCombatArea{
{0, 0, 0}, 
{1, 2, 0}, 
{0, 0, 0}, 
}
local wg2e = createCombatArea{ 
{1, 1, 1, 0, 2}, 
}
local wg3e = createCombatArea{ 
{1, 0, 0, 0, 0, 2}, 
}

local wg1w = createCombatArea{
{0, 0, 0}, 
{0, 2, 1}, 
{0, 0, 0}, 
}
local wg2w = createCombatArea{ 
{2, 0, 1, 1, 1}, 
}
local wg3w = createCombatArea{ 
{2, 0, 0, 0, 0, 1}, 
}
-- WATER GUN END ------------------------------
local dynpun1 = createCombatArea{
{1, 0, 0}, 
{0, 2, 0}, 
{0, 0, 0}, 
}

local dynpun2 = createCombatArea{
{0, 0, 0}, 
{0, 2, 0}, 
{0, 0, 1}, 
}


local dynpun3 = createCombatArea{
{0, 0, 0}, 
{1, 2, 0}, 
{0, 0, 0}, 
}


local dynpun4 = createCombatArea{
{0, 0, 1}, 
{0, 2, 0}, 
{0, 0, 0}, 
}


local dynpun5 = createCombatArea{
{0, 0, 0}, 
{0, 2, 0}, 
{0, 1, 0}, 
}

local confusion = createCombatArea{
	{0, 1, 1, 1, 0},
	{1, 1, 1, 1, 1},
	{1, 1, 2, 1, 1},
	{1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0}
}

local psychic = createCombatArea{
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 2, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0}
}

local waterspout = createCombatArea{
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1}
}
-- SAND ATTACK
local sa1n = createCombatArea{
{0, 0, 0}, 
{0, 2, 0}, 
{0, 1, 0}, 
}
local sa2n = createCombatArea{
{0, 2, 0}, 
{0, 0, 0}, 
{0, 1, 0}, 
}
local sa3n = createCombatArea{
{0, 2, 0}, 
{0, 0, 0}, 
{0, 0, 0},
{0, 1, 0}, 
}
local sa4n = createCombatArea{
{0, 2, 0}, 
{0, 0, 0}, 
{0, 0, 0},
{0, 0, 0}, 
{0, 1, 0}, 
}

local sa1s = createCombatArea{
{0, 1, 0}, 
{0, 2, 0}, 
{0, 0, 0}, 
}
local sa2s = createCombatArea{
{0, 1, 0}, 
{0, 0, 0}, 
{0, 2, 0}, 
}
local sa3s = createCombatArea{
{0, 1, 0}, 
{0, 0, 0}, 
{0, 0, 0},
{0, 2, 0}, 
}
local sa4s = createCombatArea{
{0, 1, 0}, 
{0, 0, 0}, 
{0, 0, 0},
{0, 0, 0}, 
{0, 2, 0}, 
}

local sa1w = createCombatArea{ 
{2, 1, 0, 0, 0, 0}, 
}
local sa2w = createCombatArea{ 
{2, 0, 1, 0, 0, 0}, 
}
local sa3w = createCombatArea{ 
{2, 0, 0, 1, 0, 0}, 
}
local sa4w = createCombatArea{ 
{2, 0, 0, 0, 1, 0}, 
}

local sa1e = createCombatArea{ 
{0, 0, 0, 0, 1, 2}, 
}
local sa2e = createCombatArea{ 
{0, 0, 0, 1, 0, 2}, 
}
local sa3e = createCombatArea{ 
{0, 0, 1, 0, 0, 2}, 
}
local sa4e = createCombatArea{ 
{0, 1, 0, 0, 0, 2}, 
}
-- SAND ATTACK END



local c = {
[28] = {x = {
			pok = ditto,
			spell = "Transform",
			minLv = 40,
			ex = 1320004,
			base1 = 125,
			base2 = 130,
			dista = 5,
			bonus = 3,
            		target = "no",
			type = "normal",
			cd = 20
		     }
		 },
[25] = {x = {
			pok = bulbasaur,
			spell = "Quick Attack",
			minLv = 20,
			ex = 1000001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 7
		     }
		 },
[24] = {x = {
			pok = ivysaur,
			spell = "Quick Attack",
			minLv = 40,
			ex = 2000001,
			base1 = 40,
			base2 = 50,
			dista = 1,
			bonus = 4,
			type = "normal",
			cd = 6
		     }
		 },
[22] = {x = {
			pok = venusaur,
			spell = "Quick Attack",
			minLv = 85,
			ex = 3000001,
			base1 = 85,
			base2 = 100,
			dista = 1,
			bonus = 8.5,
			type = "normal",
			cd = 6
		     }
		 },

[29] = {x = {
			pok = charmander,
			spell = "Scratch",
			minLv = 20,
			ex = 4000001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 10
		     }
		 },
[23] = {x = {
			pok = charmeleon,
			spell = "Scratch",
			minLv = 20,
			ex = 5000001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 10
		     }
		 },
[67] = {x = {
			pok = charizard,
			spell = "Scratch",
			minLv = 85,
			ex = 6000001,
			base1 = 85,
			base2 = 100,
			dista = 1,
			bonus = 8.5,
			type = "normal",
			cd = 10
		     }
		 },

[2] = {x = {
			nome = Squirtle,
			spell = "Headbutt",
			minLv = 20,
			ex = 700001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 9
		     }
		 },
[6] = {x = {
			nome = wartortle,
			spell = "Headbutt",
			minLv = 40,
			ex = 800001,
			base1 = 40,
			base2 = 50,
			dista = 1,
			bonus = 4,
			type = "normal",
			cd = 8
		     }
		 },
[55] = {x = {
			nome = Blastoise,
			spell = "Headbutt",
			minLv = 85,
			ex = 900001,
			base1 = 85,
			base2 = 100,
			dista = 1,
			bonus = 8.5,
			type = "normal",
			cd = 8
		     }
		 },
[32] = {x = {
			pok = caterpie,
			spell = "Headbutt",
			minLv = 1,
			ex = 1000001,
			base1 = 1,
			base2 = 11,
			dista = 1,
			bonus = 1,
			type = "normal",
			cd = 9
		     }
		 },
[31] = {x = {
			pok = metapod,
			spell = "String Shot",
			minLv = 15,
			ex = 1100001,
			base1 = 15,
			base2 = 25,
			dista = 3,
			bonus = 1.5,
			type = "bug",
			cd = 4
		     }
		 },
[40] = {x = {
			pok = Butterfree,
			spell = "String Shot",
			minLv = 30,
			ex = 1100001,
			base1 = 30,
			base2 = 40,
			dista = 4,
			bonus = 3,
			type = "bug",
			cd = 4
		     }
		 },
[21] = {x = {
			pok = weedle,
			spell = "Horn Attack",
			minLv = 1,
			ex = 1300001,
			base1 = 1,
			base2 = 11,
			dista = 1,
			bonus = 1,
			type = "normal",
			cd = 9
		     }
		 },
[60] = {x = {
			nome = Kakuna,
			spell = "String Shot",
			minLv = 15,
			ex = 1400001,
			base1 = 15,
			base2 = 25,
			dista = 1,
			bonus = 1.5,
			type = "bug",
			cd = 9
		     }
		 },
[45] = {x = {
			pok = beedrill,
			spell = "String Shot",
			minLv = 25,
			ex = 1500001,
			base1 = 25,
			base2 = 35,
			dista = 3,
			bonus = 2.5,
			type = "bug",
			cd = 11
		     }
		 },
[30] = {x = {
			pok = pidgey,
			spell = "Quick Attack",
			minLv = 5,
			ex = 1600001,
			base1 = 5,
			base2 = 15,
			dista = 1,
			bonus = 1,
			type = "normal",
			cd = 7
		     }
		 },
[5] = {x = {
			pok = pidgeotto,
			spell = "Quick Attack",
			minLv = 20,
			ex = 1700001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 7
		     }
		 },
[80] = {x = {
			pok = pidgeot,
			spell = "Quick Attack",
			minLv = 65,
			ex = 1800001,
			base1 = 70,
			base2 = 80,
			dista = 1,
			bonus = 6.5,
			type = "normal",
			cd = 7
		     }
		 },
[36] = {x = {
			pok = rattata,
			spell = "Quick Attack",
			minLv = 1,
			ex = 1900001,
			base1 = 20,
			base2 = 21,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 7
		     }
		 },
[69] = {x = {
			pok = raticate,
			spell = "Quick Attack",
			minLv = 25,
			ex = 2000001,
			base1 = 25,
			base2 = 35,
			dista = 1,
			bonus = 2.5,
			type = "normal",
			cd = 7
		     }
		 },
[27] = {x = {
			pok = spearow,
			spell = "Quick Attack",
			minLv = 10,
			ex = 2100001,
			base1 = 10,
			base2 = 20,
			dista = 1,
			bonus = 1,
			type = "normal",
			cd = 7
		     }
		 },
[17] = {x = {
			pok = fearow,
			spell = "Quick Attack",
			minLv = 50,
			ex = 2200001,
			base1 = 50,
			base2 = 60,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 7
		     }
		 },
[7] = {x = {
			pok = ekans,
			spell = "Bite",
			minLv = 15,
			ex = 2300001,
			base1 = 15,
			base2 = 25,
			dista = 1,
			bonus = 1.5,
			type = "normal",
			cd = 11
		     }
		 },
[39] = {x = {
			pok = arbok,
			spell = "Bite",
			minLv = 30,
			ex = 2400001,
			base1 = 30,
			base2 = 40,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 10
		     }
		 },
[59] = {x = {
			pok = pikachu,
			spell = "Quick Attack",
			minLv = 20,
			ex = 2500001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 7
		     }
		 },
[50] = {x = {
			pok = raichu,
			spell = "Mega Punch",
			minLv = 50,
			ex = 2600001,
			base1 = 50,
			base2 = 60,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 7
		     }
		 },
[43] = {x = {
			pok = sandshrew,
			spell = "Scratch",
			minLv = 20,
			ex = 2700001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "earth",
			cd = 12
		     }
		 },
[115] = {x = {
			pok = sandslash,
			spell = "Scratch",
			minLv = 55,
			ex = 2800001,
			base1 = 60,
			base2 = 70,
			dista = 1,
			bonus = 3.5,
			type = "earth",
			cd = 8
		     }
		 },
[70] = {x = {
			pok = 'nidoran female',
			spell = "Quick Attack",
			minLv = 10,
 			ex = 2900001,
			base1 = 30,
			base2 = 41,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 7
			}
		},
 [71] = {x = {
			pok = nidorina,
			spell = "Quick Attack",
			minLv = 25,
 			ex = 3000001,
			base1 = 100,
			base2 = 111,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 7
			}
		},
 [79] = {x = {
			pok = nidoqueen,
			spell = "Quick Attack",
			minLv = 65,
 			ex = 3100001,
			base1 = 191,
			base2 = 210,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 7
			}
		},
[66] = {x = {
			pok = 'nidoran male',
			spell = "Quick Attack",
			minLv = 10,
 			ex = 3200001,
			base1 = 30,
			base2 = 41,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 7
			}
		},
 [78] = {x = {
			pok = nidorino,
			spell = "Quick Attack",
			minLv = 25,
 			ex = 3300001,
			base1 = 100,
			base2 = 111,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 7
			}
		},
 [35] = {x = {
			pok = nidoking,
			spell = "Quick Attack",
			minLv = 65,
 			ex = 3400001,
			base1 = 191,
			base2 = 210,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 7
			}
		},
[73] = {x = {
			pok = clefairy,
			spell = "Doubleslap",
			minLv = 1,
			ex = 3500001,
			base1 = 48,
			base2 = 53,
			dista = 1,
			bonus = 2.2,
			type = "normal",
			cd = 7
		     }
		 },
[68] = {x = {
			pok = clefable,
			spell = "Doubleslap",
			minLv = 1,
			ex = 3600001,
			base1 = 148,
			base2 = 153,
			dista = 1,
			bonus = 4,
			type = "normal",
			cd = 7
		 }
     },
[62] = {x = {
			pok = vulpix,
			spell = "Quick Attack",
			minLv = 15,
			ex = 3700001,
			base1 = 90,
			base2 = 100,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 7
		     }
		 },
[114] = {x = {
			pok = ninetales,
			spell = "Quick Attack",
			minLv = 65,
			ex = 3800001,
			base1 = 190,
			base2 = 240,
			dista = 1,
			bonus = 4.5,
			type = "normal",
			cd = 7
		     }
		 },
[63] = {x = {
			pok = Jigglypuff,
			spell = "Doubleslap",
			minLv = 20,
			ex = 3900001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 7
		     }
		 },
[64] = {x = {
			pok = Wigglytuff,
			spell = "Doubleslap",
			minLv = 45,
			ex = 4000001,
			base1 = 45,
			base2 = 55,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 8
		     }
		 },
[44] = {x = {
			pok = zubat,
			spell = "Super Sonic",
			minLv = 1,
			ex = 4100001,
			base1 = 20,
			base2 = 21,
			dista = 1,
			bonus = 1.7,
			type = "normal",
			cd = 11
		     }
		 },
[122] = {x = {
			pok = golbat,
			spell = "Super Sonic",
			minLv = 1,
			ex = 4200001,
			base1 = 0,
			base2 = 0,
			dista = 5,
			bonus = 5,
			type = "normal",
			cd = 16
		     }
		 },
[56] = {x = {
			pok = oddish,
			spell = "Absorb",
			minLv = 1,
			ex = 4300001,
			base1 = 25,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "grass",
			cd = 10
		     }
		 },
[74] = {x = {
			pok = gloom,
			spell = "Absorb",
			minLv = 1,
			ex = 4400001,
			base1 = 35,
			base2 = 45,
			dista = 1,
			bonus = 3.5,
			type = "grass",
			cd = 10
		     }
		 },
[86] = {x = {
			pok = vileplume,
			spell = "Absorb",
			minLv = 1,
			ex = 4500001,
			base1 = 55,
			base2 = 65,
			dista = 1,
			bonus = 5,
			type = "grass",
			cd = 10
		     }
		 },
[81] = {x = {
			pok = Paras,
			spell = "Scratch",
			minLv = 5,
			ex = 4600001,
			base1 = 5,
			base2 = 15,
			dista = 1,
			bonus = 1,
			type = "normal",
			cd = 9
		     }
		 },
[95] = {x = {
			pok = Parasect,
			spell = "Absorb",
			minLv = 50,
			ex = 4700001,
			base1 = 50,
			base2 = 60,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 9
		     }
		 },
[52] = {x = {
			pok = Venonat,
			spell = "Absorb",
			minLv = 20,
			ex = 4800001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 9
		     }
		 },
[49] = {x = {
			pok = Venomoth,
			spell = "Absorb",
			minLv = 50,
			ex = 4900001,
			base1 = 50,
			base2 = 60,
			dista = 1,
			bonus = 5,
			type = "grass",
			cd = 9
		     }
		 },
[82] = {x = {
			pok = Diglett,
			spell = "Sand Attack",
			minLv = 10,
			ex = 5000001,
			base1 = 10,
			base2 = 20,
			dista = 1,
			bonus = 1,
			type = "earth",
			cd = 9
		     }
		 },
[83] = {x = {
			pok = Dugtrio,
			spell = "Sand Attack",
			minLv = 35,
			ex = 5100001,
			base1 = 40,
			base2 = 50,
			dista = 1,
			bonus = 3.5,
			type = "earth",
			cd = 9
		     }
		 },
[105] = {x = {
			pok = Meowth,
			spell = "Slash",
			minLv = 15,
			ex = 5200001,
			base1 = 15,
			base2 = 25,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 7
		     }
		 },
[3] = {x = {
			pok = Persian,
			spell = "Slash",
			minLv = 30,
			ex = 5300001,
			base1 = 50,
			base2 = 70,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 7
		     }
		 },
[100] = {x = {
			pok = Psyduck,
			spell = "Water Gun",
			minLv = 24,
			ex = 5400001,
			base1 = 25,
			base2 = 35,
			dista = 1,
			bonus = 2.4,
			type = "water",
			cd = 9
		     }
		 },
[99] = {x = {
			pok = Golduck,
			spell = "Doubleslap",
			minLv = 55,
			ex = 5500001,
			base1 = 60,
			base2 = 70,
			dista = 1,
			bonus = 5.5,
			type = "normal",
			cd = 9
		     }
		 },
[106] = {x = {
			pok = Mankey,
			spell = "Scratch",
			minLv = 15,
			ex = 5600001,
			base1 = 15,
			base2 = 25,
			dista = 1,
			bonus = 1.5,
			type = "normal",
			cd = 9
		     }
		 },
[103] = {x = {
			pok = Primeape,
			spell = "Scratch",
			minLv = 50,
			ex = 5700001,
			base1 = 50,
			base2 = 60,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 9
		     }
		 },
[109] = {x = {
			pok = Growlithe,
			spell = "Bite",
			minLv = 25,
			ex = 5800001,
			base1 = 25,
			base2 = 35,
			dista = 1,
			bonus = 2.5,
			type = "normal",
			cd = 9
		     }
		 },
[88] = {x = {
			pok = arcanine,
			spell = "Bite",
			minLv = 1,
			ex = 5900001,
			base1 = 100,
			base2 = 151,
			dista = 1,
			bonus = 6,
			type = "normal",
			cd = 11
		     }
		 },
[111] = {x = {
			pok = poliwag,
			spell = "Doubleslap",
			minLv = 5,
			ex = 6000001,
			base1 = 5,
			base2 = 15,
			dista = 1,
			bonus = 1,
			type = "normal",
			cd = 7
		     }
		 },
[212] = {x = {
			pok = poliwhirl,
			spell = "Mud Shot",
			minLv = 25,
			ex = 6100001,
			base1 = 25,
			base2 = 35,
			dista = 1,
			bonus = 2.5,
			type = "earth",
			cd = 7
		     }
		 },
[104] = {x = {
			pok = poliwrath,
			spell = "Mud Shot",
			minLv = 65,
			ex = 6200001,
			base1 = 65,
			base2 = 75,
			dista = 1,
			bonus = 6.5,
			type = "earth",
			cd = 12
		     }
		 },
[262] = {x = {
			pok = abra,
			spell = "Confusion",
			minLv = 20,
			ex = 6300001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "psychic",
			target = "no",
			cd = 12
		     }
		 },
[219] = {x = {
			pok = kadaabra,
			spell = "Psychic",
			minLv = 47,
			ex = 6400001,
			base1 = 50,
			base2 = 60,
			dista = 5,
			bonus = 4.7,
			type = "psychic",
			target = "no",
			cd = 23
		     }
		 },
[218] = {x = {
			pok = alakazan,
			spell = "Psychic",
			minLv = 80,
			ex = 6500001,
			base1 = 80,
			base2 = 90,
			dista = 5,
			bonus = 8,
			type = "psychic",
			target = "no",
			cd = 23
		     }
		 },
[118] = {x = {
			pok = machop,
			spell = "Doubleslap",
			minLv = 5,
			ex = 6600001,
			base1 = 5,
			base2 = 15,
			dista = 1,
			bonus = 1,
			type = "normal",
			cd = 7
		     }
		 },
[113] = {x = {
			pok = machoke,
			spell = "Doubleslap",
			minLv = 25,
			ex = 6700001,
			base1 = 25,
			base2 = 105,
			dista = 1,
			bonus = 3,
			type = "fighting",
			cd = 7
		     }
		 },
[121] = {x = {
			pok = machamp,
			spell = "Doubleslap",
			minLv = 65,
			ex = 6800001,
			base1 = 165,
			base2 = 175,
			dista = 1,
			bonus = 6.5,
			type = "fighting",
			cd = 7
		     }
		 },
[250] = {x = {
			pok = bellsprout,
			spell = "Razor Leaf",
			minLv = 10,
			ex = 6900001,
			base1 = 10,
			base2 = 21,
			dista = 1,
			bonus = 1,
			type = "grass",
			cd = 11
		     }
		 },
[37] = {x = {
			pok = weepinbell,
			spell = "Razor Leaf",
			minLv = 25,
			ex = 7000001,
			base1 = 30,
			base2 = 40, -- 150
			dista = 1, -- 3
			bonus = 2.5, -- 3
			type = "grass",
			cd = 11 -- 11
		     }
		 },
[240] = {x = {
			pok = victreebel,
			spell = "Razor Leaf",
			minLv = 50,
			ex = 7100001,
			base1 = 50,
			base2 = 60,
			dista = 4,
			bonus = 6,
			type = "grass",
			cd = 11
		     }
		 },
[96] = {x = {
			pok = tentacool,
			spell = "Acid",
			minLv = 25,
			ex = 7200001,
			base1 = 30,
			base2 = 40, -- 150
			dista = 1, -- 3
			bonus = 2.5, -- 3
			type = "poison",
			cd = 12 -- 11
		     }
		 },
[108] = {x = {
			pok = tentacruell,
			spell = "Acid",
			minLv = 50,
			ex = 7300001,
			base1 = 50,
			base2 = 60,
			dista = 1,
			bonus = 5.8,
			type = "poison",
			cd = 11
		     }
		 },
[196] = {x = {
			pok = geodude,
			spell = "Rock Throw",
			minLv = 15,
			ex = 7400001,
			base1 = 15,
			base2 = 25,
			dista = 5,
			bonus = 1.5,
			type = "rock",
			cd = 14
		     }
		 },
[247] = {x = {
			pok = graveler,
			spell = "Rock Throw",
			minLv = 40,
			ex = 7500001,
			base1 = 40,
			base2 = 50,
			dista = 5,
			bonus = 4,
			type = "rock",
			cd = 14
		     }
		 },
[116] = {x = {
			pok = golem,
			spell = "Rock Throw",
			minLv = 70,
			ex = 7600001,
			base1 = 70,
			base2 = 80,
			dista = 5,
			bonus = 7,
			type = "rock",
			cd = 14
		     }
		 },
[288] = {x = {
			pok = golemroll,
			spell = "Rock Throw",
			minLv = 70,
			ex = 7600001,
			base1 = 70,
			base2 = 80,
			dista = 5,
			bonus = 7,
			type = "rock",
			cd = 14
		     }
		 },
[16] = {x = {
			pok = Ponyta,
			spell = "Quick Attack",
			minLv = 20,
			ex = 7700001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 7
		     }
		 },
[220] = {x = {
			pok = Rapidash,
			spell = "Quick Attack",
			minLv = 50,
			ex = 7800001,
			base1 = 50,
			base2 = 120,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 7
		     }
		 },
[75] = {x = {
			pok = Slowpoke,
			spell = "Aqua Tail",
			minLv = 20,
			ex = 7900001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "water",
			cd = 10
		     }
		},
[41] = {x = {
			pok = Slowbro,
			spell = "Aqua Tail",
			minLv = 20,
			ex = 8000001,
			base1 = 50,
			base2 = 120,
			dista = 1,
			bonus = 5,
			type = "water",
			cd = 10
		     }
		},
[217] = {x = {
			pok = magnemite,
			spell = "Super Sonic",
			minLv = 15,
			ex = 8100001,
			base1 = 15,
			base2 = 25,
			dista = 5,
			bonus = 1.5,
			type = "normal",
			cd = 15
		     }
		 },
[223] = {x = {
			pok = magneton,
			spell = "Super Sonic",
			minLv = 40,
			ex = 8200001,
			base1 = 40,
			base2 = 50,
			dista = 5,
			bonus = 4,
			type = "normal",
			cd = 15
		     }
		 },
[57] = {x = {
			pok = Farfetchd,
			spell = "Sand Attack",
			minLv = 10,
			ex = 8300001,
			base1 = 70,
			base2 = 90,
			dista = 1,
			bonus = 7,
			type = "normal",
			cd = 10
		     }
		 },
[26] = {x = {
			pok = doduo,
			spell = "Sand Attack",
			minLv = 15,
			ex = 8400001,
			base1 = 15,
			base2 = 25,
			dista = 1,
			bonus = 1.5,
			type = "earth",
			cd = 8
		     }
		 },
[120] = {x = {
			pok = dodrio,
			spell = "Sand Attack",
			minLv = 45,
			ex = 8500001,
			base1 = 50,
			base2 = 60,
			dista = 1,
			bonus = 4.5,
			type = "earth",
			cd = 6
		     }
		 },
[101] = {x = {
			pok = seel,
			spell = "Aqua Tail",
			minLv = 1,
			ex = 8600001,
			base1 = 91,
			base2 = 98,
			dista = 1,
			bonus = 3,
			type = "water",
			cd = 10
		     }
		 },
[110] = {x = {
			pok = dewgong,
			spell = "Aqua Tail",
			minLv = 1,
			ex = 8700001,
			base1 = 191,
			base2 = 218,
			dista = 1,
			bonus = 5,
			type = "water",
			cd = 10
		     }
		 },
[214] = {x = {
			pok = grimer,
			spell = "Mud Shot",
			minLv = 15,
			ex = 8800001,
			base1 = 15,
			base2 = 25,
			dista = 5,
			bonus = 1.5,
			type = "earth",
			cd = 10
		     }
		 },
[47] = {x = {
			pok = Muk,
			spell = "Mud Shot",
			minLv = 35,
			ex = 8900001,
			base1 = 35,
			base2 = 45,
			dista = 5,
			bonus = 3.5,
			type = "earth",
			cd = 10
		     }
		 },
[54] = {x = {
			pok = Shellder,
			spell = "Lick",
			minLv = 15,
			ex = 9000001,
			base1 = 15,
			base2 = 25,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 10
		     }
		 },
[72] = {x = {
			pok = Cloyster,
			spell = "Lick",
			minLv = 35,
			ex = 9100001,
			base1 = 35,
			base2 = 45,
			dista = 1,
			bonus = 3.5,
			type = "normal",
			cd = 10
		     }
		 },
[48] = {x = {
			pok = gastly,
			spell = "Lick",
			minLv = 20,
			ex = 9200001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 8
		     }
		 },
[65] = {x = {
			pok = haunter,
			spell = "Lick",
			minLv = 47,
			ex = 9300001,
			base1 = 50,
			base2 = 60,
			dista = 1,
			bonus = 4.7,
			type = "normal",
			cd = 8
		     }
		 },
[244] = {x = {
			pok = gengar,
			spell = "Lick",
			minLv = 80,
			ex = 9400001,
			base1 = 80,
			base2 = 90,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 8
		     }
		 },
 [248] = {x = {
			pok = onix,
			spell = "Sand Attack",
			minLv = 40,
			ex = 9500001,
			base1 = 40,
			base2 = 50,
			dista = 5,
			bonus = 4,
			type = "earth",
			cd = 11
		     }
		 },
[94] = {x = {
			nome = drowzee,
			spell = "Headbutt",
			minLv = 20,
			ex = 960001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 7
		     }
		 },
[119] = {x = {
			nome = hypno,
			spell = "Headbutt",
			minLv = 20,
			ex = 970001,
			base1 = 85,
			base2 = 100,
			dista = 1,
			bonus = 6.5,
			type = "normal",
			cd = 7
		     }
		 },
[112] = {x = {
			pok = krabby,
			spell = "Bubbles",
			minLv = 20,
			ex = 980001,
			base1 = 60,
			base2 = 75,
			dista = 4,
			bonus = 3,
			type = "water",
			cd = 8
		     }
		 },
[245] = {x = {
			pok = kingler,
			spell = "Bubbles",
			minLv = 20,
			ex = 990001,
			base1 = 120,
			base2 = 135,
			dista = 4,
			bonus = 5.6,
			type = "water",
			cd = 8
		     }
		 },
[123] = {x = {
			pok = voltorb,
			spell = "Thunder Shock",
			minLv = 10,
			ex = 1000001,
			base1 = 10,
			base2 = 20,
			dista = 5,
			bonus = 1,
			type = "electric",
			cd = 16
		     }
		 },
[287] = {x = {
			pok = voltorbroll,
			spell = "Thunder Shock",
			minLv = 10,
			ex = 1000001,
			base1 = 10,
			base2 = 20,
			dista = 5,
			bonus = 1,
			type = "electric",
			cd = 16
		     }
		 },
[125] = {x = {
			pok = electrode,
			spell = "Thunder Shock",
			minLv = 35,
			ex = 1010001,
			base1 = 40,
			base2 = 50,
			dista = 5,
			bonus = 3.5,
			type = "electric",
			cd = 16
		     }
		 },
[286] = {x = {
			pok = electroderoll,
			spell = "Thunder Shock",
			minLv = 35,
			ex = 1010001,
			base1 = 40,
			base2 = 50,
			dista = 5,
			bonus = 3.5,
			type = "electric",
			cd = 16
		     }
		 },
[213] = {x = {
			pok = Exeggcute,
			spell = "Confusion",
			minLv = 20,
			ex = 1020001,
			base1 = 20,
			base2 = 30,
			dista = 5,
			bonus = 3,
			type = "psychic",
			target = "no",
			cd = 12
		     }
		 },
[46] = {x = {
			pok = Exeggutor,
			spell = "Psychic",
			minLv = 80,
			ex = 1030001,
			base1 = 80,
			base2 = 90,
			dista = 5,
			bonus = 8,
			type = "psychic",
			target = "no",
			cd = 23
		     }
		 },
[198] = {x = {
			pok = cubone,
			spell = "Headbutt",
			minLv = 55,
			ex = 1040001,
			base1 = 55,
			base2 = 65,
			dista = 1,
			bonus = 2.5,
			type = "normal",
			cd = 7
		     }
		 },
[197] = {x = {
			pok = Marowak,
			spell = "Headbutt",
			minLv = 55,
			ex = 1050001,
			base1 = 55,
			base2 = 65,
			dista = 1,
			bonus = 6,
			type = "normal",
			cd = 7
		     }
		 },
[20] = {x = {
			pok = Hitmonlee,
			spell = "Triple Kick",
			minLv = 60,
			ex = 1060001,
			base1 = 60,
			base2 = 70,
			dista = 1,
			bonus = 6,
			type = "fighting",
			cd = 7
		     }
		 },
[38] = {x = {
			pok = Hitmonchan,
			spell = "Triple Punch",
			minLv = 60,
			ex = 1070001,
			base1 = 60,
			base2 = 70,
			dista = 1,
			bonus = 6,
			type = "fighting",
			cd = 7
		     }
		 },
[11] = {x = {
			pok = Lickitung,
			spell = "Lick",
			minLv = 55,
			ex = 1080001,
			base1 = 55,
			base2 = 65,
			dista = 1,
			bonus = 5.5,
			type = "normal",
			cd = 7
		     }
		 },
[228] = {x = {
			pok = Koffing,
			spell = "Mud Shot",
			minLv = 15,
			ex = 1090001,
			base1 = 15,
			base2 = 25,
			dista = 1,
			bonus = 1.5,
			type = "earth",
			cd = 7
		     }
		 },
[231] = {x = {
			pok = Weezing,
			spell = "Mud Shot",
			minLv = 35,
			ex = 1100001,
			base1 = 35,
			base2 = 45,
			dista = 1,
			bonus = 3.5,
			type = "earth",
			cd = 7
		     }
		 },
[77] = {x = {
			pok = Rhyhorn,
			spell = "Iron Tail",
			minLv = 30,
			ex = 1110001,
			base1 = 30,
			base2 = 40,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 9
		     }
		 },
[200] = {x = {
			pok = Rhydon,
			spell = "Iron Tail",
			minLv = 75,
			ex = 1120001,
			base1 = 75,
			base2 = 80,
			dista = 1,
			bonus = 7,
			type = "normal",
			cd = 9
		     }
		 },
[4] = {x = {
			pok = Chansey,
			spell = "Doubleslap",
			minLv = 60,
			ex = 1130001,
			base1 = 60,
			base2 = 70,
			dista = 1,
			bonus = 6,
			type = "normal",
			cd = 7
		     }
		 },
[18] = {x = {
			pok = Tangela,
			spell = "Absorb",
			minLv = 50,
			ex = 1140001,
			base1 = 50,
			base2 = 60,
			dista = 1,
			bonus = 5,
			type = "grass",
			cd = 7
		     }
		 },
[198] = {x = {
			pok = Kangaskhan,
			spell = "Bite",
			minLv = 80,
			ex = 1150001,
			base1 = 80,
			base2 = 95,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 7
		     }
		 },
[33] = {x = {
			pok = horsea,
			spell = "Mud Shot",
			minLv = 10,
			ex = 1160001,
			base1 = 10,
			base2 = 21,
			dista = 4,
			bonus = 1,
			type = "earth",
			cd = 10
		     }
		 },
[276] = {x = {
			pok = seadra,
			spell = "Mud Shot",
			minLv = 45,
			ex = 1170001,
			base1 = 50,
			base2 = 60,
			dista = 5,
			bonus = 4.5,
			type = "earth",
			cd = 14
		     }
		 },
[274] = {x = {
			pok = Goldeen,
			spell = "Poison Sting",
			minLv = 10,
			ex = 1180001,
			base1 = 10,
			base2 = 15,
			dista = 1,
			bonus = 1.5,
			type = "poison",
			cd = 7
		     }
		 },
[272] = {x = {
			pok = Seaking,
			spell = "Poison Sting",
			minLv = 35,
			ex = 1190001,
			base1 = 35,
			base2 = 45,
			dista = 1,
			bonus = 3.5,
			type = "poison",
			cd = 7
		     }
		 },
[42] = {x = {
			pok = Staryu,
			spell = "Swift",
			minLv = 15,
			ex = 1200001,
			base1 = 15,
			base2 = 25,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 8
		     }
		 },
[249] = {x = {
			pok = Starmie,
			spell = "Swift",
			minLv = 35,
			ex = 1210001,
			base1 = 35,
			base2 = 45,
			dista = 1,
			bonus = 7,
			type = "normal",
			cd = 8
		     }
		 },
[246] = {x = {
			pok = MrMime,
			spell = "Lovely Kiss",
			minLv = 1,
			ex = 1220001,
			base1 = 180,
			base2 = 190,
			dista = 1,
			bonus = 6,
			type = "normal",
			cd = 10
		     }
		 },
[15] = {x = {
			pok = Scyther,
			spell = "Quick Attack",
			minLv = 80,
			ex = 1230001,
			base1 = 80,
			base2 = 90,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 7
		     }
		 },
[282] = {x = {
			pok = Jynx,
			spell = "Slash",
			minLv = 75,
			ex = 1240001,
			base1 = 80,
			base2 = 90,
			dista = 1,
			bonus = 7.5,
			type = "normal",
			cd = 7
		     }
		 },
[281] = {x = {
			pok = Electabuzz,
			spell = "Quick Attack",
			minLv = 80,
			ex = 1250001,
			base1 = 80,
			base2 = 90,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 7
		     }
		 },
[76] = {x = {
			pok = Magmar,
			spell = "Scratch",
			minLv = 80,
			ex = 1260001,
			base1 = 80,
			base2 = 90,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 7
		     }
		 },
[53] = {x = {
			pok = Pinsir,
			spell = "Scratch",
			minLv = 45,
			ex = 1270001,
			base1 = 45,
			base2 = 60,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 7
		     }
		 },
[93] = {x = {
			pok = Tauros,
			spell = "Headbutt",
			minLv = 45,
			ex = 1280001,
			base1 = 45,
			base2 = 60,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 7
		     }
		 },
[19] = {x = {
			pok = magikarp,
			spell = "Splash",
			minLv = 5,
			ex = 1290001,
			base1 = 280,
			base2 = 300,
			dista = 1,
			bonus = 4,
			type = "normal",
			target = "no",
			cd = 6
		     }
		 },
[117] = {x = {
			pok = Gyarados,
			spell = "Roar",
			minLv = 95,
			ex = 1300001,
			base1 = 65,
			base2 = 91,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 7
		     }
		 },
[193] = {x = {
			pok = Lapras,
			spell = "Horn Attack",
			minLv = 80,
			ex = 1310001,
			base1 = 80,
			base2 = 90,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 11
		     }
		 },

[102] = {x = {
			pok = eevee,
			spell = "Sand Attack",
			minLv = 20,
			ex = 1330002,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "earth",
			cd = 7
		     }
		 },
[215] = {x = {
			pok = Vaporeon,
			spell = "Quick Attack",
			minLv = 55,
			ex = 1340001,
			base1 = 55,
			base2 = 65,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 7
		     }
		 },
[195] = {x = {
			pok = Jolteon,
			spell = "Quick Attack",
			minLv = 55,
			ex = 1350001,
			base1 = 55,
			base2 = 65,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 7
		     }
		 },
[14] = {x = {
			pok = Flareon,
			spell = "Quick Attack",
			minLv = 55,
			ex = 1360001,
			base1 = 55,
			base2 = 65,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 7
		     }
		 },
[97] = {x = {
			pok = Porygon,
			spell = "Super Sonic",
			minLv = 40,
			ex = 1370001,
			base1 = 40,
			base2 = 50,
			dista = 5,
			bonus = 4,
			type = "normal",
			cd = 12
		     }
		 },
[92] = {x = {
			pok = Omanyte,
			spell = "Bite",
			minLv = 20,
			ex = 1380001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 7
		     }
		 },
[192] = {x = {
			pok = Omastar,
			spell = "Bite",
			minLv = 80,
			ex = 1390001,
			base1 = 80,
			base2 = 90,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 7
		     }
		 },
[98] = {x = {
			pok = Kabuto,
			spell = "Scratch",
			minLv = 20,
			ex = 1400001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 2,
			type = "normal",
			cd = 7
		     }
		 },
[13] = {x = {
			pok = Kabutops,
			spell = "Scratch",
			minLv = 80,
			ex = 1410001,
			base1 = 80,
			base2 = 90,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 7
		     }
		 },
[10] = {x = {
			pok = Aerodactyl,
			spell = "Scratch",
			minLv = 110,
			ex = 1420001,
			base1 = 110,
			base2 = 120,
			dista = 1,
			bonus = 11,
			type = "normal",
			cd = 7
		     }
		 },
[51] = {x = {
			pok = Snorlax,
			spell = "Scratch",
			minLv = 85,
			ex = 1430001,
			base1 = 90,
			base2 = 100,
			dista = 1,
			bonus = 8,
			type = "normal",
			cd = 7
		     }
		 },
[283] = {x = {
			pok = Articuno,
			spell = "Scratch",
			minLv = 110,
			ex = 1440001,
			base1 = 110,
			base2 = 120,
			dista = 1,
			bonus = 11,
			type = "normal",
			cd = 7
		     }
		 },
[199] = {x = {
			pok = Zapdos,
			spell = "Scratch",
			minLv = 110,
			ex = 1450001,
			base1 = 110,
			base2 = 120,
			dista = 1,
			bonus = 11,
			type = "normal",
			cd = 7
		     }
		 },
[265] = {x = {
			pok = Moltres,
			spell = "Scratch",
			minLv = 110,
			ex = 1460001,
			base1 = 110,
			base2 = 120,
			dista = 1,
			bonus = 11,
			type = "normal",
			cd = 7
		     }
		 },
[58] = {x = {
			pok = Dratini,
			spell = "Aqua Tail",
			minLv = 20,
			ex = 1470001,
			base1 = 20,
			base2 = 30,
			dista = 4,
			bonus = 2,
			type = "water",
			cd = 7
		     }
		 },
[61] = {x = {
			pok = Dragonair,
			spell = "Headbutt",
			minLv = 60,
			ex = 1480001,
			base1 = 60,
			base2 = 70,
			dista = 1,
			bonus = 6,
			type = "normal",
			cd = 7
		     }
		 },
[210] = {x = {
			pok = Dragonite,
			spell = "Headbutt",
			minLv = 100,
			ex = 1490001,
			base1 = 100,
			base2 = 110,
			dista = 1,
			bonus = 10,
			type = "normal",
			cd = 7
		     }
		 },
[34] = {x = {
			pok = Mewtwo,
			spell = "Slash",
			minLv = 75,
			ex = 1500001,
			base1 = 105,
			base2 = 155,
			dista = 7,
			bonus = 8.5,
			type = "normal",
			cd = 7
		     }
		 },
[9] = {x = {
			pok = Mew,
			spell = "Agility",
			minLv = 75,
			ex = 1510001,
			base1 = 200,
			base2 = 210,
			dista = 3,
			bonus = 9,
			type = "normal",
			cd = 15
		     }
		 },
[318] = {x = {
			pok = Chikorita,
			spell = "Quick Attack",
			minLv = 20,
			ex = 1520001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 10
		     }
		 },
[319] = {x = {
			pok = Bayleef,
			spell = "Quick Attack",
			minLv = 40,
			ex = 1530001,
			base1 = 40,
			base2 = 50,
			dista = 1,
			bonus = 4,
			type = "normal",
			cd = 10
		     }
		 },
[320] = {x = {
			pok = Meganium,
			spell = "Quick Attack",
			minLv = 85,
			ex = 1540001,
			base1 = 85,
			base2 = 100,
			dista = 1,
			bonus = 8.5,
			type = "normal",
			cd = 10
		     }
		 },
[324] = {x = {
			pok = Cyndaquil,
			spell = "Scratch",
			minLv = 20,
			ex = 1550001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 10
		     }
		 },
[325] = {x = {
			pok = Quilava,
			spell = "Scratch",
			minLv = 40,
			ex = 1560001,
			base1 = 40,
			base2 = 50,
			dista = 1,
			bonus = 4,
			type = "normal",
			cd = 10
		     }
		 },
[326] = {x = {
			pok = Typhlosion,
			spell = "Scratch",
			minLv = 85,
			ex = 1570001,
			base1 = 85,
			base2 = 100,
			dista = 1,
			bonus = 8.5,
			type = "normal",
			cd = 10
		     }
		 },
[327] = {x = {
			pok = Totodile,
			spell = "Scratch",
			minLv = 20,
			ex = 1580001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 3,
			type = "normal",
			cd = 10
		     }
		 },
[328] = {x = {
			pok = Croconaw,
			spell = "Scratch",
			minLv = 40,
			ex = 1590001,
			base1 = 40,
			base2 = 50,
			dista = 1,
			bonus = 4,
			type = "normal",
			cd = 10
		     }
		 },
[329] = {x = {
			pok = Feraligatr,
			spell = "Scratch",
			minLv = 85,
			ex = 1600001,
			base1 = 85,
			base2 = 100,
			dista = 1,
			bonus = 8.5,
			type = "normal",
			cd = 10
		     }
		 },
[412] = {x = {
			pok = Sentret,
			spell = "Scratch",
			minLv = 10,
			ex = 1610001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[415] = {x = {
			pok = Furret,
			spell = "Scratch",
			minLv = 10,
			ex = 1620001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[332] = {x = {
			pok = Hoothoot,
			spell = "Quick Attack",
			minLv = 10,
			ex = 1630001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[333] = {x = {
			pok = Noctowl,
			spell = "Quick Attack",
			minLv = 10,
			ex = 1640001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[334] = {x = {
			pok = Ledyba,
			spell = "Headbutt",
			minLv = 10,
			ex = 1650001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[335] = {x = {
			pok = Ledian,
			spell = "Headbutt",
			minLv = 10,
			ex = 1660001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[336] = {x = {
			pok = Spinarak,
			spell = "Headbutt",
			minLv = 10,
			ex = 1670001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[337] = {x = {
			pok = Ariados,
			spell = "Headbutt",
			minLv = 10,
			ex = 1680001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[338] = {x = {
			pok = Crobat,
			spell = "Super Sonic",
			minLv = 10,
			ex = 1690001,
			base1 = 20,
			base2 = 30,
			dista = 5,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[339] = {x = {
			pok = Chinchou,
			spell = "Super Sonic",
			minLv = 10,
			ex = 1700001,
			base1 = 20,
			base2 = 30,
			dista = 5,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[340] = {x = {
			pok = Lanturn,
			spell = "Super Sonic",
			minLv = 10,
			ex = 1710001,
			base1 = 20,
			base2 = 30,
			dista = 5,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[341] = {x = {
			pok = Pichu,
			spell = "Quick Attack",
			minLv = 10,
			ex = 1720001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[342] = {x = {
			pok = Igglybuff,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1730001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[343] = {x = {
			pok = Cleffa,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1740001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[344] = {x = {
			pok = Togepi,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1750001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[345] = {x = {
			pok = Togetic,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1760001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[346] = {x = {
			pok = Natu,
			spell = "Peck",
			minLv = 10,
			ex = 1770001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[347] = {x = {
			pok = Xatu,
			spell = "Peck",
			minLv = 10,
			ex = 1780001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[348] = {x = {
			pok = Aipom,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1790001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[349] = {x = {
			pok = Mareep,
			spell = "Headbutt",
			minLv = 10,
			ex = 1800001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[350] = {x = {
			pok = Flaaffy,
			spell = "Headbutt",
			minLv = 10,
			ex = 1810001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[351] = {x = {
			pok = Marill,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1820001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[352] = {x = {
			pok = Azumarill,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1830001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[353] = {x = {
			pok = Sunkern,
			spell = "Razor Leaf",
			minLv = 10,
			ex = 1840001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[354] = {x = {
			pok = Sunflora,
			spell = "Razor Leaf",
			minLv = 10,
			ex = 1850001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[355] = {x = {
			pok = Bellossom,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1860001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[356] = {x = {
			pok = Hoppip,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1870001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[357] = {x = {
			pok = Skiploom,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1880001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[358] = {x = {
			pok = Jumpluff,
			spell = "Doubleslap",
			minLv = 10,
			ex = 1890001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[359] = {x = {
			pok = Politoed,
			spell = "Headbutt",
			minLv = 10,
			ex = 1900001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[360] = {x = {
			pok = Sudowoodo,
			spell = "Scratch",
			minLv = 10,
			ex = 1910001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[361] = {x = {
			pok = Ampharos,
			spell = "Headbutt",
			minLv = 10,
			ex = 1920001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[362] = {x = {
			pok = Girafarig,
			spell = "Headbutt",
			minLv = 10,
			ex = 1930001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[363] = {x = {
			pok = Murkrow,
			spell = "Peck",
			minLv = 10,
			ex = 1940001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[364] = {x = {
			pok = Dunsparce,
			spell = "Headbutt",
			minLv = 10,
			ex = 1950001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[365] = {x = {
			pok = Qwilfish,
			spell = "Headbutt",
			minLv = 10,
			ex = 1960001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[366] = {x = {
			pok = Misdreavus,
			spell = "Lick",
			minLv = 10,
			ex = 1970001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[367] = {x = {
			pok = Pineco,
			spell = "Headbutt",
			minLv = 10,
			ex = 1980001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[368] = {x = {
			pok = Forretress,
			spell = "Headbutt",
			minLv = 10,
			ex = 1990001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[369] = {x = {
			pok = Steelix,
			spell = "Sand Attack",
			minLv = 10,
			ex = 2000001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[370] = {x = {
			pok = Scizor,
			spell = "Quick Attack",
			minLv = 10,
			ex = 2010001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[371] = {x = {
			pok = Teddiursa,
			spell = "Scratch",
			minLv = 10,
			ex = 2020001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[372] = {x = {
			pok = Ursaring,
			spell = "Scratch",
			minLv = 10,
			ex = 2030001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[373] = {x = {
			pok = Heracross,
			spell = "Headbutt",
			minLv = 10,
			ex = 2040001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[374] = {x = {
			pok = Slowking,
			spell = "Headbutt",
			minLv = 10,
			ex = 2050001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[375] = {x = {
			pok = Sneasel,
			spell = "Scratch",
			minLv = 10,
			ex = 2060001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[377] = {x = {
			pok = Espeon,
			spell = "Quick Attack",
			minLv = 10,
			ex = 2070001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[378] = {x = {
			pok = Umbreon,
			spell = "Quick Attack",
			minLv = 10,
			ex = 2080001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[379] = {x = {
			pok = Yanma,
			spell = "Poison Sting",
			minLv = 10,
			ex = 2090001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[380] = {x = {
			pok = Wooper,
			spell = "Headbutt",
			minLv = 10,
			ex = 2100001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[381] = {x = {
			pok = Quagsire,
			spell = "Headbutt",
			minLv = 10,
			ex = 2110001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[382] = {x = {
			pok = Wobbuffet,
			spell = "Headbutt",
			minLv = 10,
			ex = 2120001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[383] = {x = {
			pok = Gligar,
			spell = "Scratch",
			minLv = 10,
			ex = 2130001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[384] = {x = {
			pok = Tyrogue,
			spell = "Headbutt",
			minLv = 10,
			ex = 2140001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[385] = {x = {
			pok = Porygon2,
			spell = "Super Sonic",
			minLv = 10,
			ex = 2150001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[386] = {x = {
			pok = Magby,
			spell = "Scratch",
			minLv = 10,
			ex = 2160001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[387] = {x = {
			pok = Elekid,
			spell = "Headbutt",
			minLv = 10,
			ex = 2170001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[388] = {x = {
			pok = Corsola,
			spell = "Headbutt",
			minLv = 10,
			ex = 2180001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[389] = {x = {
			pok = Swinub,
			spell = "Headbutt",
			minLv = 10,
			ex = 2190001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[390] = {x = {
			pok = Piloswine,
			spell = "Headbutt",
			minLv = 10,
			ex = 2200001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[391] = {x = {
			pok = Remoraid,
			spell = "Bubbles",
			minLv = 10,
			ex = 2210001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[392] = {x = {
			pok = Mantine,
			spell = "Bubbles",
			minLv = 10,
			ex = 2220001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[393] = {x = {
			pok = Octillery,
			spell = "Bubbles",
			minLv = 10,
			ex = 2230001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[394] = {x = {
			pok = Houndour,
			spell = "Headbutt",
			minLv = 10,
			ex = 2240001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[395] = {x = {
			pok = Houndoom,
			spell = "Headbutt",
			minLv = 10,
			ex = 2250001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[396] = {x = {
			pok = Slugma,
			spell = "Ember",
			minLv = 10,
			ex = 2260001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[397] = {x = {
			pok = Magcargo,
			spell = "Ember",
			minLv = 10,
			ex = 2270001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[398] = {x = {
			pok = Skarmory,
			spell = "Scratch",
			minLv = 10,
			ex = 2280001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[399] = {x = {
			pok = Delibird,
			spell = "Headbutt",
			minLv = 10,
			ex = 2290001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[400] = {x = {
			pok = Larvitar,
			spell = "Headbutt",
			minLv = 10,
			ex = 2300001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[401] = {x = {
			pok = Pupitar,
			spell = "Headbutt",
			minLv = 10,
			ex = 2310001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[402] = {x = {
			pok = Smoochum,
			spell = "Doubleslap",
			minLv = 10,
			ex = 2320001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[403] = {x = {
			pok = Phanpy,
			spell = "Headbutt",
			minLv = 10,
			ex = 2330001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[404] = {x = {
			pok = Smeargle,
			spell = "Headbutt",
			minLv = 10,
			ex = 2340001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[405] = {x = {
			pok = Donphan,
			spell = "Headbutt",
			minLv = 10,
			ex = 2350001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[406] = {x = {
			pok = Kingdra,
			spell = "Bubbles",
			minLv = 2360001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[407] = {x = {
			pok = Blissey,
			spell = "Doubleslap",
			minLv = 10,
			ex = 2370001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[408] = {x = {
			pok = Miltank,
			spell = "Headbutt",
			minLv = 10,
			ex = 2380001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[409] = {x = {
			pok = Stantler,
			spell = "Headbutt",
			minLv = 10,
			ex = 2390001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[410] = {x = {
			pok = Snubbull,
			spell = "Headbutt",
			minLv = 10,
			ex = 2400001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[411] = {x = {
			pok = Shuckle,
			spell = "Headbutt",
			minLv = 10,
			ex = 2410001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[413] = {x = {
			pok = Granbull,
			spell = "Headbutt",
			minLv = 10,
			ex = 2420001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[414] = {x = {
			pok = Hitmontop,
			spell = "Headbutt",
			minLv = 10,
			ex = 2430001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[416] = {x = {
			pok = Tyranitar,
			spell = "Headbutt",
			minLv = 10,
			ex = 2440001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[417] = {x = {
			pok = Hooh,
			spell = "Quick Attack",
			minLv = 10,
			ex = 2450001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[418] = {x = {
			pok = Entei,
			spell = "Quick Attack",
			minLv = 10,
			ex = 2460001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[419] = {x = {
			pok = Raikou,
			spell = "Quick Attack",
			minLv = 10,
			ex = 2470001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[420] = {x = {
			pok = Suicune,
			spell = "Quick Attack",
			minLv = 10,
			ex = 2480001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[421] = {x = {
			pok = Lugia,
			spell = "Headbutt",
			minLv = 10,
			ex = 2490001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[422] = {x = {
			pok = Celebi,
			spell = "Quick Attack",
			minLv = 10,
			ex = 2500001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[423] = {x = {
			pok = UnownA,
			spell = "Headbutt",
			minLv = 10,
			ex = 2510001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[424] = {x = {
			pok = UnownB,
			spell = "Headbutt",
			minLv = 10,
			ex = 2520001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[425] = {x = {
			pok = UnownC,
			spell = "Headbutt",
			minLv = 10,
			ex = 2530001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[426] = {x = {
			pok = UnownD,
			spell = "Headbutt",
			minLv = 10,
			ex = 2540001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[427] = {x = {
			pok = UnownE,
			spell = "Headbutt",
			minLv = 10,
			ex = 2550001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[428] = {x = {
			pok = UnownF,
			spell = "Headbutt",
			minLv = 10,
			ex = 2560001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[429] = {x = {
			pok = UnownG,
			spell = "Headbutt",
			minLv = 10,
			ex = 2570001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[430] = {x = {
			pok = UnownH,
			spell = "Headbutt",
			minLv = 10,
			ex = 2580001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[431] = {x = {
			pok = UnownI,
			spell = "Headbutt",
			minLv = 10,
			ex = 2590001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[432] = {x = {
			pok = UnownJ,
			spell = "Headbutt",
			minLv = 10,
			ex = 2600001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[433] = {x = {
			pok = UnownK,
			spell = "Headbutt",
			minLv = 10,
			ex = 2610001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[434] = {x = {
			pok = UnownL,
			spell = "Headbutt",
			minLv = 10,
			ex = 2620001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[435] = {x = {
			pok = UnownM,
			spell = "Headbutt",
			minLv = 10,
			ex = 2630001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[436] = {x = {
			pok = UnownN,
			spell = "Headbutt",
			minLv = 10,
			ex = 2640001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[437] = {x = {
			pok = UnownO,
			spell = "Headbutt",
			minLv = 10,
			ex = 2650001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[438] = {x = {
			pok = UnownP,
			spell = "Headbutt",
			minLv = 10,
			ex = 2660001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[439] = {x = {
			pok = UnownQ,
			spell = "Headbutt",
			minLv = 10,
			ex = 2670001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[440] = {x = {
			pok = UnownR,
			spell = "Headbutt",
			minLv = 10,
			ex = 2680001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[441] = {x = {
			pok = UnownS,
			spell = "Headbutt",
			minLv = 10,
			ex = 2690001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[442] = {x = {
			pok = UnownT,
			spell = "Headbutt",
			minLv = 10,
			ex = 2700001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[443] = {x = {
			pok = UnownU,
			spell = "Headbutt",
			minLv = 10,
			ex = 2710001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[444] = {x = {
			pok = UnownV,
			spell = "Headbutt",
			minLv = 10,
			ex = 2720001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[445] = {x = {
			pok = UnownW,
			spell = "Headbutt",
			minLv = 10,
			ex = 2730001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[446] = {x = {
			pok = UnownX,
			spell = "Headbutt",
			minLv = 10,
			ex = 2740001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[447] = {x = {
			pok = UnownY,
			spell = "Headbutt",
			minLv = 10,
			ex = 2750001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
[448] = {x = {
			pok = UnownZ,
			spell = "Headbutt",
			minLv = 10,
			ex = 2760001,
			base1 = 20,
			base2 = 30,
			dista = 1,
			bonus = 5,
			type = "normal",
			cd = 10
		     }
		 },
}

function onSay(cid)
	
	if #getCreatureSummons(cid) == 0 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need a pokemon to  moves.")
	return 0
	end
	pokemon = c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType]
	if getPlayerLevel(cid) < c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.minLv then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don\'t have enough level to  this move.")
	return 0
	end
		if exhaustion.get(cid, pokemon.x.ex) then
		seconds = math.floor(((exhaustion.get(cid, pokemon.x.ex)) + 1))
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have to wait "..seconds.." seconds to  this move again.")
		return 0
		end
	if getPlayerStorageValue(getCreatureSummons(cid)[1], 3) >= 1 then
	doSendAnimatedText(getThingPos(getCreatureSummons(cid)[1]), "MISS", 215)
	setPlayerStorageValue(getCreatureSummons(cid)[1], 3, -1)
	doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
	exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
	return true
	end
	if getPlayerStorageValue(getCreatureSummons(cid)[1], 5) >= 1 then
		if math.random(1,100) <= 33 then
		doSendAnimatedText(getThingPos(getCreatureSummons(cid)[1]), "SELF HIT", 180)
		local levels = getPlayerLevel(cid)
		doTargetCombatHealth(cid, getCreatureSummons(cid)[1], COMBAT_PHYSICALDAMAGE, -(math.random((levels*3),(levels*5))), -((math.random((levels*3),(levels*5))+10)), 3)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doCreatureSay(getCreatureSummons(cid)[1], ""..string.upper(c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell).."!", TALKTYPE_MONSTER)
		return true
		end
	end
if pokemon.x.target ~= "no" then

		if not isMonster(getCreatureTarget(cid)) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don\'t have any targets.")
		return 0
		end
		if getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid))) > pokemon.x.dista then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Get closer to the target to  this move.")
		return 0
		end
		if not isSightClear(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), false) then
		return 0
		end
end
	if pokemon.x.type == "flying" then
		elementa = FLYDAMAGE
	elseif pokemon.x.type == "ground" then
		elementa = GROUNDDAMAGE
	elseif pokemon.x.type == "electric" then
		elementa = ELECTRICDAMAGE
	elseif pokemon.x.type == "ghost" then
		elementa = GHOSTDAMAGE
	elseif pokemon.x.type == "normal" then
		elementa = NORMALDAMAGE
	elseif pokemon.x.type == "fighting" then
		elementa = FIGHTINGDAMAGE
	elseif pokemon.x.type == "poison" then
		elementa = POISONDAMAGE
	elseif pokemon.x.type == "rock" then
		elementa = ROCKDAMAGE
	elseif pokemon.x.type == "bug" then
		elementa = BUGDAMAGE
	elseif pokemon.x.type == "fire" then
		elementa = FIREDAMAGE
	elseif pokemon.x.type == "water" then
		elementa = WATERDAMAGE
	elseif pokemon.x.type == "grass" then
		elementa = GRASSDAMAGE
	elseif pokemon.x.type == "psychic" then
		elementa = PSYCHICDAMAGE
	elseif pokemon.x.type == "ice" then
		elementa = ICEDAMAGE
	elseif pokemon.x.type == "dragon" then
		elementa = DRAGONDAMAGE
	end
	
	local element = elementa
	local num1 = (pokemon.x.base1)
	local num2 = (pokemon.x.base2)
	local num3 = (pokemon.x.bonus)
	if getPlayerStorageValue(getCreatureSummons(cid)[1], 254) >= 1 then
	num3 = num3 * 1.8
	setPlayerStorageValue(getCreatureSummons(cid)[1], 254, 0)
	end
	setPlayerStorageValue(getCreatureSummons(cid)[1], 1000, ((num1)+(getPlayerLevel(cid)*(num3))))
	if pokemon.x.spell == "Dynamic Punch" then
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 112)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), dynpun1, 0, 0, 17)
		addEvent(doAreaCombatHealth, 105, getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), dynpun1, 0, 0, 17)
		addEvent(doAreaCombatHealth, 250, getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), dynpun2, 0, 0, 17)
		addEvent(doAreaCombatHealth, 400, getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), dynpun3, 0, 0, 17)
		addEvent(doAreaCombatHealth, 555, getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), dynpun4, 0, 0, 17)
		addEvent(doAreaCombatHealth, 700, getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), dynpun5, 0, 0, 17)
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		return 0
	elseif pokemon.x.spell == "Quick Attack" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 3)
		return 0
   -------------------------------------------------------------ADICIONADOS------------------------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------------------------------
	elseif pokemon.x.spell == "Transform" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..", "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSetCreatureOutfit(getCreatureSummons(cid)[1], getCreatureOutfit(getCreatureTarget(cid)), 13000)
		return 0
	----------------------HEALERA
	elseif pokemon.x.spell == "Healera" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doCreatureAddHealth(getCreatureSummons(cid)[1], ((num2)+((getPlayerLevel(cid))*(num3))))
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), hl, ((num1)+(getPlayerLevel(cid)*(num3))), ((num2)+(getPlayerLevel(cid)*(num3))), CONST_ME_MAGIC_BLUE)
        	doSendAnimatedText(getThingPos(getCreatureSummons(cid)[1]), "+"..((num2)+((getPlayerLevel(cid))*(num3))).."", 35)
		return 0


	 --------------------COMPLEXAS
	elseif pokemon.x.spell == "Agility" then
		local pos = getThingPos(getCreatureTarget(cid))
		local pos2 = getThingPos(getCreatureTarget(cid))
		local pos3 = getThingPos(getCreatureSummons(cid)[1])
		pos.x = pos.x + math.random(-1,1)
		pos.y = pos.y + math.random(-1,1)
		if hasSqm(pos)  then
		if getTileThingByPos(pos) and getTileThingByPos(pos).itemid >= 1 and not isInArray({919, 460, 4820, 4821, 4822, 4823, 4824, 4825}, getTileThingByPos(pos).itemid) and isWalkable(pos) then
		pos = getClosestFreeTile(getCreatureTarget(cid), pos)
        	doSendMagicEffect(pos3, 211)
		doTeleportThing(getCreatureSummons(cid)[1], pos, false)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 159)
		else
		local newpos = getClosestFreeTile(getCreatureTarget(cid), pos)
		doSendMagicEffect(pos3, 211)
		doTeleportThing(getCreatureSummons(cid)[1], newpos, false)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 159)
   		end
		else
		doSendMagicEffect(pos3, 211)
		doTeleportThing(getCreatureSummons(cid)[1], pos3, false)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 159)
		end
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		return 0
		
		elseif pokemon.x.spell == "String Shot" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		setPlayerStorageValue(getCreatureTarget(cid), 3, 1)
		local alvo = getCreatureTarget(cid)
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 23)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 137)
		local function string(params)
		if isCreature(params.alvo) then
		if getPlayerStorageValue(params.alvo, 3) >= 1 then
		doSendMagicEffect(getThingPos(params.alvo), 137)
		end
		end
		end
		local function normalstr(params)
		if isCreature(params.alvo) then
		if getPlayerStorageValue(params.alvo, 3) >= 1 then
		setPlayerStorageValue(params.alvo, 3, -1)
		end
		end
		end
		addEvent(string, 250, {alvo = alvo})
		addEvent(string, 500, {alvo = alvo})
		addEvent(string, 750, {alvo = alvo})
		addEvent(string, 1000, {alvo = alvo})
		addEvent(string, 1250, {alvo = alvo})
		addEvent(string, 1500, {alvo = alvo})
		addEvent(string, 1750, {alvo = alvo})
		addEvent(string, 2000, {alvo = alvo})
		addEvent(string, 2250, {alvo = alvo})
		addEvent(string, 2500, {alvo = alvo})
		addEvent(string, 2750, {alvo = alvo})
		addEvent(string, 3000, {alvo = alvo})
		addEvent(normalstr, 3050, {alvo = alvo})
		return 0
	else if pokemon.x.spell == "Water Gun" then
		if getCreatureLookDir(getCreatureSummons(cid)[1]) == 0 then
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg1n, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 74)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg2n, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 75)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg3n, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 76)
		elseif getCreatureLookDir(getCreatureSummons(cid)[1]) == 2 then
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg1s, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 77)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg2s, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 75)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg3s, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 78)
		elseif getCreatureLookDir(getCreatureSummons(cid)[1]) == 1 then
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg1e, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 69)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg2e, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 70)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg3e, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 71)
		elseif getCreatureLookDir(getCreatureSummons(cid)[1]) == 3 then
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg1w, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 72)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg2w, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 70)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), wg3w, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 73)
		end
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		return 0
	elseif pokemon.x.spell == "Slam" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 3)
		return 0
	elseif pokemon.x.spell == "Rapid Hit" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 3)
		local hitalvo = getCreatureTarget(cid)
		local function hit(params)
		if isCreature(getCreatureSummons(params.cid)[1]) then
		if isCreature(getCreatureTarget(params.cid)) then
		if getCreatureTarget(params.cid) == params.hitalvo then
		doAreaCombatHealth(getCreatureSummons(params.cid)[1], NORMALDAMAGE, getThingPos(getCreatureTarget(params.cid)), 0, -0, -0, 3)
		end
		end
		end
		end
		addEvent(hit, 80, {cid = cid, hitalvo = hitalvo})
		addEvent(hit, 280, {cid = cid, hitalvo = hitalvo})
		addEvent(hit, 480, {cid = cid, hitalvo = hitalvo})
		addEvent(hit, 680, {cid = cid, hitalvo = hitalvo})
		return 0
 --------------------NORMAL
	elseif pokemon.x.spell == "Aqua Tail" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 68)
		return 0
	elseif pokemon.x.spell == "Lovely Kiss" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 147)
		return 0
	elseif pokemon.x.spell == "Lick" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 145)
		return 0
	elseif pokemon.x.spell == "Roar" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 2)
		return 0
	elseif pokemon.x.spell == "Iron Tail" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 160)
		return 0
    elseif pokemon.x.spell == "Triple Kick" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 3)
		return 0
    elseif pokemon.x.spell == "Triple Punch" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 113)
		return 0
 ------------------DISTANCE
 	elseif pokemon.x.spell == "Shadow Ball" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 18)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 140)
		return 0
	elseif pokemon.x.spell == "Swift" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 47)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 148)
		return 0
   -------------------------------------------------------------ADICIONADOS------------------------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------------------------------
	elseif pokemon.x.spell == "Thunder Shock" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 40)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 48)
		return 0
	elseif pokemon.x.spell == "Razor Leaf" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
			local function throw(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doSendDistanceShoot(getThingPos(getCreatureSummons(params.cid)[1]), getThingPos(getCreatureTarget(params.cid)), 8)
			else
			end
			end
			local function damage(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doAreaCombatHealth(getCreatureSummons(params.cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 79)
			else
			end
			end
		addEvent(damage, 100, {cid = cid})
		addEvent(damage, 600, {cid = cid})
		addEvent(throw, 0, {cid = cid})
		addEvent(throw, 550, {cid = cid})
		return 0
	elseif pokemon.x.spell == "Sand Attack" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		posit = getThingPos(getCreatureSummons(cid)[1])
		local function sandattack(params)
		if #getCreatureSummons(params.cid) >= 1 then
		doAreaCombatHealth(getCreatureSummons(params.cid)[1], element, params.ar, sand1, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), params.ef)
		else
		end
		end
		local posicao = getThingPos(getCreatureSummons(cid)[1])
		if getCreatureLookDir(getCreatureSummons(cid)[1]) == 0 then
		addEvent(sandattack, 0, {cid = cid, ar = {x=posicao.x, y=posicao.y-1, z=posicao.z}, ef = 120})
		addEvent(sandattack, 400, {cid = cid, ar = {x=posicao.x, y=posicao.y-2, z=posicao.z}, ef = 120})
		addEvent(sandattack, 800, {cid = cid, ar = {x=posicao.x, y=posicao.y-3, z=posicao.z}, ef = 120})
		elseif getCreatureLookDir(getCreatureSummons(cid)[1]) == 2 then
		addEvent(sandattack, 0, {cid = cid, ar = {x=posicao.x, y=posicao.y+1, z=posicao.z}, ef = 122})
		addEvent(sandattack, 400, {cid = cid, ar = {x=posicao.x, y=posicao.y+2, z=posicao.z}, ef = 122})
		addEvent(sandattack, 800, {cid = cid, ar = {x=posicao.x, y=posicao.y+3, z=posicao.z}, ef = 122})
		elseif getCreatureLookDir(getCreatureSummons(cid)[1]) == 1 then
		addEvent(sandattack, 0, {cid = cid, ar = {x=posicao.x+1, y=posicao.y, z=posicao.z}, ef = 121})
		addEvent(sandattack, 400, {cid = cid, ar = {x=posicao.x+2, y=posicao.y, z=posicao.z}, ef = 121})
		addEvent(sandattack, 800, {cid = cid, ar = {x=posicao.x+3, y=posicao.y, z=posicao.z}, ef = 121})
		elseif getCreatureLookDir(getCreatureSummons(cid)[1]) == 3 then
		addEvent(sandattack, 0, {cid = cid, ar = {x=posicao.x-1, y=posicao.y, z=posicao.z}, ef = 119})
		addEvent(sandattack, 400, {cid = cid, ar = {x=posicao.x-2, y=posicao.y, z=posicao.z}, ef = 119})
		addEvent(sandattack, 800, {cid = cid, ar = {x=posicao.x-3, y=posicao.y, z=posicao.z}, ef = 119})
		end
		
	elseif pokemon.x.spell == "Bite" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 146)
		return 0
	elseif pokemon.x.spell == "Slash" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 160)
		return 0
	elseif pokemon.x.spell == "Splash" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 53)
		return 0
	elseif pokemon.x.spell == "Doubleslap" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		local function slap(params)
		if isMonster(getCreatureTarget(params.cid)) then
		doAreaCombatHealth(getCreatureSummons(params.cid)[1], element, getThingPos(getCreatureTarget(params.cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 3)
		else
		end
		end
		addEvent(slap, 0, {cid = cid})
		addEvent(slap, 600, {cid = cid})
		return 0
	elseif pokemon.x.spell == "Mega Punch" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 112)
		return 0
	elseif pokemon.x.spell == "Scratch" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 142)
		return 0
	elseif pokemon.x.spell == "Scratch" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 142)
		return 0
	elseif pokemon.x.spell == "Confusion" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), confusion, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 133)
		return 0
	elseif pokemon.x.spell == "Psychic" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureSummons(cid)[1]), psychic, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 136)
		return 0
	elseif pokemon.x.spell == "Absorb" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		local life = getCreatureHealth(getCreatureTarget(cid))
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 14)
		local newlife = life - getCreatureHealth(getCreatureTarget(cid))
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 14)
		doCreatureAddHealth(getCreatureSummons(cid)[1], newlife)
		doSendAnimatedText(getThingPos(getCreatureSummons(cid)[1]), "+"..newlife.."", 35)
		return 0
	elseif pokemon.x.spell == "Mud Shot" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		setPlayerStorageValue(getCreatureTarget(cid), 3, 1)
		local mudalvo = getCreatureTarget(cid)
	local function ver(params)
	if isCreature(params.mudalvo) then
	if getPlayerStorageValue(params.mudalvo, 3) >= 1 then
	setPlayerStorageValue(params.mudalvo, 3, -1)
	end
	end
	end
		addEvent(ver, 4500, {mudalvo = mudalvo})
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 1)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 34)
		return 0
	elseif pokemon.x.spell == "Bubbles" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
			local function throw(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doSendDistanceShoot(getThingPos(getCreatureSummons(params.cid)[1]), getThingPos(getCreatureTarget(params.cid)), 2)
			else
			end
			end
			local function damage(params)
			if isMonster(getCreatureTarget(params.cid)) then
			doAreaCombatHealth(getCreatureSummons(params.cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 25)
			else
			end
			end
		addEvent(throw, 0, {cid = cid})
		addEvent(damage, 0, {cid = cid})
		return 0
	elseif pokemon.x.spell == "Water Spout" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), {x=getThingPos(getCreatureSummons(cid)[1]).x, y=getThingPos(getCreatureSummons(cid)[1]).y-5, z=getThingPos(getCreatureSummons(cid)[1]).z}, 2)
		local function spout(params)
		if isCreature(getCreatureSummons(params.cid)[1]) then
		for x = -2,2 do
			for y = -2,2 do
		local newpos = getThingPos(getCreatureSummons(params.cid)[1])
		newpos.x = newpos.x+x
		newpos.y = newpos.y+y
		doSendDistanceShoot({x=getThingPos(getCreatureSummons(params.cid)[1]).x, y=getThingPos(getCreatureSummons(params.cid)[1]).y-5, z=getThingPos(getCreatureSummons(params.cid)[1]).z}, newpos, 2)
		end
		end
		end
		end
		
		local function spdmg(params)
		if isCreature(getCreatureSummons(params.cid)[1]) then
		doAreaCombatHealth(getCreatureSummons(params.cid)[1], element, getThingPos(getCreatureSummons(params.cid)[1]), waterspout, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 68)
		end
		end

		addEvent(spout, 300, {cid = cid})
		addEvent(spdmg, 450, {cid = cid})
		return 0
	elseif pokemon.x.spell == "Horn Attack" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 15)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 3)
		return 0
	elseif pokemon.x.spell == "Rock Throw" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 11)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 3)
		return 0
	elseif pokemon.x.spell == "Headbutt" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		doAreaCombatHealth(getCreatureSummons(cid)[1], element, getThingPos(getCreatureTarget(cid)), 0, -((num1)+(getPlayerLevel(cid)*(num3))), -((num2)+(getPlayerLevel(cid)*(num3))), 3)
		return 0
	elseif pokemon.x.spell == "Super Sonic" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		local t = getCreatureTarget(cid)
		setPlayerStorageValue(t, 5, 1)
		local function confd(params)
		if isCreature(params.t) then
		local spdc = getCreatureSpeed(params.t)
		if getCreatureLookDir(params.t) == 0 then
		confs = math.random(1,3)
		elseif getCreatureLookDir(params.t) == 1 then
			confurandom = math.random(1,99)
			if confurandom <= 33 then
			confs = 0
			elseif confurandom >= 67 then
			confs = 2
			else
			confs = 3
			end
		elseif getCreatureLookDir(params.t) == 2 then
			confurandom = math.random(1,99)
			if confurandom <= 33 then
			confs = 3
			elseif confurandom >= 67 then
			confs = 0
			else
			confs = 1
			end
		elseif getCreatureLookDir(params.t) == 3 then
		confs = math.random(0,2)
		end
		doPushCreature(params.t, confs, 1, 0)
		doSendMagicEffect(getThingPos(params.t), 31)
		end
		end
		local function nonc(params)
		if isCreature(params.t) then
		doChangeSpeed(params.t, -getCreatureSpeed(params.t))
		doChangeSpeed(params.t, getCreatureBaseSpeed(params.t))
		setPlayerStorageValue(params.t, 5, -1)
		end
		end
		doSendDistanceShoot(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), 32)

		doChangeSpeed(t, -( getCreatureSpeed(t)/3))
		doSendMagicEffect(getThingPos(t), 31)
		for i = 1, math.random(6,7) do
		addEvent(confd, 1000*i, {cid = cid, t = t})
		end
		addEvent(nonc, 7100, {cid - cid, t = t})
		return 0
	elseif pokemon.x.spell == "Fury Attack" then
		doCreatureSay(cid, ""..getCreatureName(getCreatureSummons(cid)[1])..",  "..c[getCreatureOutfit(getCreatureSummons(cid)[1]).lookType].x.spell.."!", TALKTYPE_SAY)
		exhaustion.set(cid, pokemon.x.ex, pokemon.x.cd)
		local namezito = getCreatureName(getCreatureSummons(cid)[1])
		local namezin = getCreatureName(getCreatureTarget(cid))
		local function pee(params)
		if isCreature(getCreatureSummons(params.cid)[1]) then
		if isCreature(getCreatureTarget(params.cid)) then
		if getCreatureName(getCreatureSummons(params.cid)[1]) == namezito then
		if getCreatureName(getCreatureTarget(params.cid)) == namezin then
		doSendDistanceShoot(getThingPos(getCreatureSummons(params.cid)[1]), getThingPos(getCreatureTarget(params.cid)), 15)
		doAreaCombatHealth(getCreatureSummons(params.cid)[1], element, getThingPos(getCreatureTarget(params.cid)), 0, -((num1)+(getPlayerLevel(params.cid)*(num3))), -((num2)+(getPlayerLevel(params.cid)*(num3))), 3)
		end
		end
		end
		end
		end
		end
		local delay = 200
		randnee = math.random(1,100)
		if randnee >= 1 and randnee <= 37 then
		a = 2
		elseif randnee >= 38 and randnee <= 74 then
		a = 3
		elseif randnee >= 75 and randnee <= 88 then
		a = 4
		else
		a = 5
		end
		local times = a
		for i = 1,a do
		addEvent(pee, delay, {cid = cid})
		delay = delay + 600
		end
		local function msg(params)
		if #getCreatureSummons(params.cid) >= 1 then
		doSendAnimatedText(getThingPos(getCreatureSummons(params.cid)[1]), ""..times.." HITS", 35)
		end
		end
		addEvent(msg, 580*a, {cid = cid})
		return 0
	end
return 0
end