--[[ Attività Commerciali (fex_wl000) | Missione Umanitaria S.A.N. ]]

Config = {}
Config.Allign = 'bottom-left'

--Selezione Incarico
Config.Incarico = {
    ['coords'] = {['x'] = 1118.6609, ['y'] = -3193.3210, ['z'] = -40.3915},
    ['spawnpoint'] = {['x'] = 86.9727, ['y'] = -1299.1919, ['z'] = 29.2364, ['h'] = 129.1007},
    ['vehicle'] = 'ratloader'
}

--Magazzino
Config.PuntoVendita = {
	PuntoVendita = {
		Pos = {
			{x = 87.2809, y = -1287.9702, z = 29.3022}
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
    ['Assistenza ai Senzatetto'] = {
        ['RaccoltaLavori'] = {
            ['coords'] = {
                {['x'] = -592.2407, ['y'] = -892.6346, ['z'] = 25.9303}
            },
            ['unique'] ='RaccoltaLavori CiboSenzatetto',
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
                {['x'] =  125.4729, ['y'] = -1227.1486, ['z'] = 29.4001},
                {['x'] = 125.7235, ['y'] = -1217.7567, ['z'] = 29.4373},
                {['x'] = 154.7409, ['y'] = -1210.5776, ['z'] = 29.4322},
                {['x'] = 173.0066, ['y'] = -1206.7983, ['z'] = 29.4822}, 
                {['x'] = 176.7210, ['y'] = -1201.3700, ['z'] = 29.3583},
                {['x'] = 169.4194, ['y'] = -1223.2620, ['z'] = 29.5703},
                {['x'] = 169.7167, ['y'] = -1225.9723, ['z'] = 29.5980},
            },
            ['unique'] ='ProcessoLavori CiboSenzatetto',
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
                {['x'] = -699.6843, ['y'] = -146.8619, ['z'] = 37.8456}
                --{['x'] = 2441.4152, ['y'] = 4769.9394, ['z'] = 34.309768},
                --{['x'] = 2452.0332, ['y'] = 4760.6459, ['z'] = 34.305206},
                --{['x'] = 2453.8466, ['y'] = 4746.8813, ['z'] = 34.303798},
                --{['x'] = 2441.9177, ['y'] = 4745.6694, ['z'] = 34.303821},
            },
            ['unique'] ='RaccoltaLavori LavaggioVestiti',
            ['durata'] = 1450,
            ['label'] = 'Raccogliendo',
            ['animdict'] = "mp_take_money_mg",
            ['anim'] = "stand_cash_in_bag_loop",
            ['propmodel'] = nil,
            ['props2'] = nil,
            ['item'] = 'vestidifettose',
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
                {['x'] = 712.3083, ['y'] = -974.1031, ['z'] = 30.3953},
            },
            ['unique'] ='ProcessoLavori LavaggioVestiti',
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
                {['x'] = 89.2302, ['y'] = -1298.1097, ['z'] = 29.2069},
            },
            ['unique'] ='RaccoltaLavori RattoppoAbiti',
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
                {['x'] = 716.3156, ['y'] = -962.3842, ['z'] = 30.3968},
            },
            ['unique'] ='ProcessoLavori RattoppoAbiti',
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
    --[[['Rattoppo Abiti'] = {
        ['RaccoltaLavori'] = {
            ['coords'] = {
                {['x'] = 89.2302, ['y'] = -1298.1097, ['z'] = 29.2069},
            },
            ['unique'] ='RaccoltaLavori RattoppoAbiti',
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
                {['x'] = 716.3156, ['y'] = -962.3842, ['z'] = 30.3968},
            },
            ['unique'] ='ProcessoLavori RattoppoAbiti',
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
    },]]
}