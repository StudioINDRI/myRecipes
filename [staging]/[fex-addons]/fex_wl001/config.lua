Config = {}
Config.Allign = 'bottom-left'

--Incarichi
Config.Incarico = {
    ['coords'] = {['x'] = 764.4362, ['y'] = -730.3197, ['z'] = 0.4461},
    ['spawnpoint'] = {['x'] = 733.2727, ['y'] = -724.1179, ['z'] = 26.6139, ['h'] = 85.9688},
    ['vehicle'] = 'scrap'
}

--Magazzino
Config.PuntoVendita = {
	PuntoVendita = {
		Pos = {
			{x = 763.4091, y = -716.4404, z = 0.4461}
		}
	}
}

Config.EnablePuntoVenditaBlip = true
Config.BlipSprite = 474
Config.BlipDisplay = 4
Config.BlipScale = 0.90
Config.BlipColour = 5
Config.BlipName = "Magazzino Forniture"   --Aggiungere nome attività

Config.KeyToOpenShop = 38													
Config.ShopMarker = 27 														
Config.ShopMarkerColor = { r = 255, g = 255, b = 0, a = 100 } 					
Config.ShopMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  						
Config.ShopDraw3DText = "Premi ~g~[E]~s~ per ~y~Import Export~s~"	

--Punto Vendita lista items:
Config.ItemsPuntoVendita = {
	--{ itemName = 'james_fishingrod', label = 'Canna da pesca', BuyPuntoVendita = true, BuyPrice = 100, SellPuntoVendita = true, SellPrice = 65 },
	--{ itemName = 'james_fishingbait', label = 'Esche', BuyPuntoVendita = true, BuyPrice = 3, SellPuntoVendita = true, SellPrice = 1 },
	--{ itemName = 'james_fish', label = 'Pesce', BuyPuntoVendita = false, BuyPrice = 500, SellPuntoVendita = true, SellPrice = 36 },
	{ itemName = 'woodforniturepart', label = 'Parte Fornitura Legno', BuyPuntoVendita = false, BuyPrice = 500, SellPuntoVendita = true, SellPrice = 80 },
	{ itemName = 'metalcomp', label = 'Componente in Metallo Forniture', BuyPuntoVendita = false, BuyPrice = 500, SellPuntoVendita = true, SellPrice = 80 },
	{ itemName = 'forniturefinal', label = 'Fornitura da Casa', BuyPuntoVendita = false, BuyPrice = 3500, SellPuntoVendita = true, SellPrice = 800 },
	--{ itemName = 'gold', label = 'Oro', BuyPuntoVendita = false, BuyPrice = 3500, SellPuntoVendita = true, SellPrice = 100 },
	--{ itemName = 'copper', label = 'Rame', BuyPuntoVendita = false, BuyPrice = 3500, SellPuntoVendita = true, SellPrice = 40 },
	--{ itemName = 'washedstones', label = 'Pietra Lavata', BuyPuntoVendita = false, BuyPrice = 3500, SellPuntoVendita = true, SellPrice = 80},

	--{ itemName = 'meat', label = 'Carne', BuyPuntoVendita = true, BuyPrice = 5, SellPuntoVendita = true, SellPrice = 80},
	--{ itemName = 'leather', label = 'Pelle', BuyPuntoVendita = false, BuyPrice = 3500, SellPuntoVendita = true, SellPrice = 80},

	--{ itemName = 'papavero', label = 'Papavero', BuyPuntoVendita = false, BuyPrice = 35000, SellPuntoVendita = true, SellPrice = 20 },

	--{ itemName = 'scatolalatte', label = 'Latte', BuyPuntoVendita = true, BuyPrice = 2, SellPuntoVendita = true, SellPrice = 80},
	
}


Config.Lavori = {
    ['Ricerca Materiale: Legname'] = {
        ['RaccoltaLavori'] = {
            ['coords'] = {  --Coordinate punti raccolta
                {['x'] = 1206.7441, ['y'] = -1334.4103, ['z'] = 35.2269},
                {['x'] = 1208.4127, ['y'] = -1334.5913, ['z'] = 35.2269},
                {['x'] = 1210.4083, ['y'] = -1337.2200, ['z'] = 35.2269},
                {['x'] = 1208.4922, ['y'] = -1338.3671, ['z'] = 35.2269},
                {['x'] = 1206.5702, ['y'] = -1338.1785, ['z'] = 35.2269},
            },
            ['unique'] ='RaccoltaLavori Minatore',
            ['durata'] = 1700,
            ['label'] = 'Raccogliendo',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'cutted_wood',
            ['count'] = 5,
            ['notify'] = 'Hai raccolto',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'RaccoltaLavori'
            }
        },
        ['ProcessoLavori'] = {
            ['coords'] = {  --Coordinate punti processo
                {['x'] = -160.2769, ['y'] = -996.3654, ['z'] = 114.1361},
            },
            ['unique'] ='ProcessoLavori Minatore',
            ['durata'] = 5000,
            ['label'] = 'Processando',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'woodforniturepart',
            ['count'] = 3,
            ['notify'] = 'Hai processato',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'ProcessoLavori'
            }
        }
    },
    ['Ricerca materiale: Componenti di Metallo'] = {
        ['RaccoltaLavori'] = {
            ['coords'] = {
                {['x'] = -534.5558, ['y'] = -1707.3787, ['z'] = 19.5655},
                {['x'] = -515.5816, ['y'] = -1697.8101, ['z'] = 19.3932},
                {['x'] = -483.2959, ['y'] = -1667.0436, ['z'] = 19.1925},
                {['x'] = -483.7244, ['y'] = -1676.2385, ['z'] = 19.4718},
                {['x'] = -502.0379, ['y'] = -1702.1658, ['z'] = 19.3173},
                --  -515.2525, -1726.0128, 19.1864, 115.3203 | -475.0097, -1736.9753, 18.6803, 93.6499 | -463.4437, -1728.8782, 18.6740, 307.2600 |
            },
            ['unique'] ='RaccoltaLavori Minatore',
            ['durata'] = 1450,
            ['label'] = 'Raccogliendo',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'metalscrapcomp',
            ['count'] = 1,
            ['notify'] = 'Hai raccolto',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'RaccoltaLavori'
            }
        },
        ['ProcessoLavori'] = {
            ['coords'] = {
                {['x'] = 1070.0715, ['y'] = -2005.6167, ['z'] = 32.0832},
                --{['x'] = ['y'] = ['z'] = } 1069.0370, -2005.8275, 32.0828, 319.5138 | 1070.8380, -2006.1119, 32.0837, 313.9956 | 
            },
            ['unique'] ='ProcessoLavori Minatore',
            ['durata'] = 6500,
            ['label'] = 'Processando',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'metalcomp',
            ['count'] = 2,
            ['notify'] = 'Hai processato',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'ProcessoLavori'
            }
        }
    },
    ['Realizzazione Forniture in Legno'] = {
        ['RaccoltaLavori'] = {
            ['coords'] = {
                {['x'] = 733.4575, ['y'] = -726.0303, ['z'] = 26.5566}
            },
            ['unique'] ='RaccoltaLavori Taglialegna',
            ['durata'] = 3000,
            ['label'] = 'Raccogliendo',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'forniturepart',
            ['count'] = 1,
            ['notify'] = 'Hai raccolto',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'RaccoltaLavori'
            }
        },
        ['ProcessoLavori'] = {
            ['coords'] = {
                {['x'] = 759.0367, ['y'] = -725.3082, ['z'] = 0.4461},
            },
            ['unique'] ='ProcessoLavori Taglialegna',
            ['durata'] = 10000,
            ['label'] = 'Processando',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'forniturefinal',
            ['count'] = 1,
            ['notify'] = 'Hai processato',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'ProcessoLavori'
            }
        }
    },
}