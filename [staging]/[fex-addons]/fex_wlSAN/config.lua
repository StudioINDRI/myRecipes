--[[ Attività Commerciali (fex_wlSAN) ]]

Config = {}
Config.Allign = 'bottom-left'

--Selezione Incarico
Config.Incarico = {
    ['coords'] = {['x'] = 1088.3604, ['y'] = -3101.4392, ['z'] = -39.0000},
    ['spawnpoint'] = {['x'] = 86.9727, ['y'] = -1299.1919, ['z'] = 29.2364, ['h'] = 129.1007},
    ['vehicle'] = 'ratloader'
}

--Magazzino
Config.PuntoVendita = {
	PuntoVendita = {
		Pos = {
			{x =1104.2338, y = -3102.3250, z = -39.0000}
		}
	}
}

--Attività
Config.EnablePuntoVenditaBlip = true
Config.BlipSprite = 474
Config.BlipDisplay = 4
Config.BlipScale = 0.90
Config.BlipColour = 5
Config.BlipName = "Missione Umanitaria S.A.N."

Config.KeyToOpenShop = 38													
Config.ShopMarker = 27 														
Config.ShopMarkerColor = { r = 255, g = 255, b = 0, a = 100 } 					
Config.ShopMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  						
Config.ShopDraw3DText = "Premi ~g~[E]~s~ per ~y~Import Export~s~"	

--Vendita lista items:
Config.ItemsPuntoVendita = {
	
	{ itemName = 'partiricambioabiti', label = 'Parti Abito', BuyPuntoVendita = true, BuyPrice = 80, SellPuntoVendita = true, SellPrice = 80 },
	{ itemName = 'vestelogore', label = 'Vestiti Sporchi', BuyPuntoVendita = true, BuyPrice = 90, SellPuntoVendita = true, SellPrice = 90 },
	{ itemName = 'vesteriparata', label = 'Abito Rattoppato', BuyPuntoVendita = false, BuyPrice = 100, SellPuntoVendita = true, SellPrice = 100 },
    --{ itemName = 'name', label = 'Label', BuyPuntoVendita = true, BuyPrice = 500, SellPuntoVendita = true, SellPrice = 80 },
    --{ itemName = 'name', label = 'Label', BuyPuntoVendita = true, BuyPrice = 500, SellPuntoVendita = true, SellPrice = 80 }
}

--Incarichi attività
Config.Lavori = {
    ['Assistenza Senzatetto'] = {
        ['RaccoltaLavori'] = {
            ['coords'] = {
                {['x'] = -592.2407, ['y'] = -892.6346, ['z'] = 25.9303}
            },
            ['unique'] ='RaccoltaLavori Minatore',
            ['durata'] = 1700,
            ['label'] = 'Raccogliendo',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'ciboscaduto',
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
                {['x'] =  125.4729, ['y'] = -1227.1486, ['z'] = 29.4001},--
                {['x'] = 125.7235, ['y'] = -1217.7567, ['z'] = 29.4373},--
                {['x'] = 154.7409, ['y'] = -1210.5776, ['z'] = 29.4322},--
                {['x'] = 173.0066, ['y'] = -1206.7983, ['z'] = 29.4822},-- 
                {['x'] = 176.7210, ['y'] = -1201.3700, ['z'] = 29.3583},--
            },
            ['unique'] ='ProcessoLavori Minatore',
            ['durata'] = 1700,
            ['label'] = 'Processando',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'vestelogore',
            ['count'] = 2,
            ['notify'] = 'Hai processato',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'ProcessoLavori'
            }
        }
    },
    ['Riciclo Vestiti'] = {
        ['RaccoltaLavori'] = {
            ['coords'] = {
                {['x'] = 2435.0541, ['y'] = 4761.6547, ['z'] = 34.321247},
                {['x'] = 2441.4152, ['y'] = 4769.9394, ['z'] = 34.309768},
                {['x'] = 2452.0332, ['y'] = 4760.6459, ['z'] = 34.305206},
                {['x'] = 2453.8466, ['y'] = 4746.8813, ['z'] = 34.303798},
                {['x'] = 2441.9177, ['y'] = 4745.6694, ['z'] = 34.303821},
            },
            ['unique'] ='RaccoltaLavori Minatore',
            ['durata'] = 1450,
            ['label'] = 'Raccogliendo',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'vestiinvendute',
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
                {['x'] = 2455.896, ['y'] = 4058.2595, ['z'] = 38.064666},
            },
            ['unique'] ='ProcessoLavori Minatore',
            ['durata'] = 1450,
            ['label'] = 'Processando',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'partiricambioabiti',
            ['count'] = 2,
            ['notify'] = 'Hai processato',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'ProcessoLavori'
            }
        }
    },
    ['Rattoppo Abiti'] = {
        ['RaccoltaLavori'] = {
            ['coords'] = {
                {['x'] = -549.7044, ['y'] = 5375.4995, ['z'] = 70.497573},
                {['x'] = -553.8211, ['y'] = 5372.6333, ['z'] = 70.305732},
                {['x'] = -554.6139, ['y'] = 5369.6699, ['z'] = 70.321884},
                {['x'] = -530.361, ['y'] = 5372.3393, ['z'] = 70.447044},
                {['x'] = -533.9656, ['y'] = 5373.7031, ['z'] = 70.489105},
            },
            ['unique'] ='RaccoltaLavori Taglialegna',
            ['durata'] = 1500,
            ['label'] = 'Raccogliendo',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'vestelavata',
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
                {['x'] = -514.5082, ['y'] = 5263.2465, ['z'] = 80.653144},
            },
            ['unique'] ='ProcessoLavori Taglialegna',
            ['durata'] = 1500,
            ['label'] = 'Processando',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'vesteriparata',
            ['count'] = 2,
            ['notify'] = 'Hai processato',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'ProcessoLavori'
            }
        }
    },
}