Config = {}
Config.Allign = 'bottom-left'

Config.Impiego = {
    ['coords'] = {['x'] = 914.04, ['y'] = -1273.47, ['z'] = 27.1},
    ['spawnpoint'] = {['x'] = 915.83593, ['y'] = -1263.64, ['z'] = 25.56336, ['h'] = 33.157623},
    ['vehicle'] = 'mule'
}

-- IMPORT -- 

Config.PawnZones = {
	PawnShops = {
		Pos = {
			{x = 1224.5986328125, y = -3260.4326171875, z = 5.5034799575806}
		}
	}
}

Config.EnablePawnShopBlip = true
Config.BlipSprite = 478
Config.BlipDisplay = 4
Config.BlipScale = 0.90
Config.BlipColour = 5
Config.BlipName = "Import Export Automatico"

Config.KeyToOpenShop = 38													
Config.ShopMarker = 27 														
Config.ShopMarkerColor = { r = 255, g = 255, b = 0, a = 100 } 					
Config.ShopMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  						
Config.ShopDraw3DText = "Premi ~g~[E]~s~ per ~y~Import Export~s~"				

-- Pawn Shop Item List:
Config.ItemsInPawnShop = {
	--{ itemName = 'james_fishingrod', label = 'Canna da pesca', BuyInPawnShop = true, BuyPrice = 100, SellInPawnShop = true, SellPrice = 65 },
	--{ itemName = 'james_fishingbait', label = 'Esche', BuyInPawnShop = true, BuyPrice = 3, SellInPawnShop = true, SellPrice = 1 },
	--{ itemName = 'james_fish', label = 'Pesce', BuyInPawnShop = false, BuyPrice = 500, SellInPawnShop = true, SellPrice = 36 },
	{ itemName = 'packaged_chicken', label = 'Pollo confezionato', BuyInPawnShop = false, BuyPrice = 500, SellInPawnShop = true, SellPrice = 80 },
	{ itemName = 'cutted_wood', label = 'Confezione di tavole', BuyInPawnShop = false, BuyPrice = 500, SellInPawnShop = true, SellPrice = 80 },
	
	--{ itemName = 'iron', label = 'Ferro', BuyInPawnShop = false, BuyPrice = 3500, SellInPawnShop = true, SellPrice = 80 },
	--{ itemName = 'gold', label = 'Oro', BuyInPawnShop = false, BuyPrice = 3500, SellInPawnShop = true, SellPrice = 100 },
	--{ itemName = 'copper', label = 'Rame', BuyInPawnShop = false, BuyPrice = 3500, SellInPawnShop = true, SellPrice = 40 },
	{ itemName = 'washedstones', label = 'Pietra Lavata', BuyInPawnShop = false, BuyPrice = 3500, SellInPawnShop = true, SellPrice = 80},

	{ itemName = 'meat', label = 'Carne', BuyInPawnShop = true, BuyPrice = 5, SellInPawnShop = true, SellPrice = 80},
	{ itemName = 'leather', label = 'Pelle', BuyInPawnShop = false, BuyPrice = 3500, SellInPawnShop = true, SellPrice = 80},

	--{ itemName = 'papavero', label = 'Papavero', BuyInPawnShop = false, BuyPrice = 35000, SellInPawnShop = true, SellPrice = 20 },

	{ itemName = 'scatolalatte', label = 'Latte', BuyInPawnShop = true, BuyPrice = 2, SellInPawnShop = true, SellPrice = 80},
	
}


Config.Lavori = {
    ['Minatore'] = {
        ['RaccoltaLavori'] = {
            ['coords'] = {
                {['x'] = -593.5397, ['y'] = 2084.1799, ['z'] = 131.3883},
                {['x'] = -592.1488, ['y'] = 2079.0759, ['z'] = 131.3930},
                {['x'] = -591.2046, ['y'] = 2075.2956, ['z'] = 131.3467},
                {['x'] = -590.1557, ['y'] = 2071.843, ['z'] = 131.26698},
                {['x'] = -588.7528, ['y'] = 2066.8688, ['z'] = 131.0827},
            },
            ['unique'] ='RaccoltaLavori Minatore',
            ['durata'] = 1700,
            ['label'] = 'Raccogliendo',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'stones',
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
                {['x'] = 1915.3554, ['y'] = 582.75567, ['z'] = 176.36744},
            },
            ['unique'] ='ProcessoLavori Minatore',
            ['durata'] = 1700,
            ['label'] = 'Processando',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'washedstones',
            ['count'] = 2,
            ['notify'] = 'Hai processato',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'ProcessoLavori'
            }
        }
    },
    ['Lattaio'] = {
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
            ['item'] = 'latte',
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
            ['item'] = 'scatolalatte',
            ['count'] = 2,
            ['notify'] = 'Hai processato',
            ['Blips'] = {
                ['sprite'] = 12,
                ['color'] = 46,
                ['name'] = 'ProcessoLavori'
            }
        }
    },
    ['Taglialegna'] = {
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
            ['item'] = 'wood',
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
            ['item'] = 'cutted_wood',
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