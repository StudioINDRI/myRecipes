Config.Jobs.miner = {

	BlipInfos = {
		Sprite = 68,
		Color = 5
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = 'rubble',
			Trailer = 'none',
			HasCaution = false
		}

	},

	Zones = {

		CloakRoom = {
			Pos = {x = 1079.03, y = -1974.21, z = 31.47},
			Size  = {x = 0.8, y = 0.5, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker= 20,
			Blip = true,
			Name = TranslateCap('m_miner_locker'),
			Type = 'cloakroom',
			Hint = TranslateCap('cloak_change'),
			GPS = {x = 884.86, y = -2176.51, z = 29.51}
		},

		Mine = {
			Pos = {x = 2948.01, y = 2746.85, z = 42.56},
			Size = {x = 5.0, y = 5.0, z = 1.5},
			Color = {r = 50, g = 200, b = 50},
			Marker = 27,
			Blip = true,
			Name = TranslateCap('m_rock'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('m_rock'),
					db_name = 'stone',
					time = 3,
					max = 24,
					add = 1,
					remove = 0,
					requires = 'nothing',
					requires_name = 'Nothing',
					drop = 80
				}
			},
			Hint = TranslateCap('m_pickrocks'),
			GPS = {x = 2948.01, y = 2746.85, z = 42.36},
			Anim = "world_human_gardener_plant"
		},

		StoneWash = {
			Pos = {x = 2655.1201, y = 2801.8391, z = 33.1382},
			Size = {x = 6.0, y = 6.0, z = 1.5},
			Color = {r = 50, g = 200, b = 50},
			Marker = 27,
			Blip = true,
			Name = TranslateCap('m_washrock'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('m_washrock'),
					db_name = 'washed_stone',
					time = 5,
					max = 24,
					add = 1,
					remove = 1,
					requires = 'stone',
					requires_name = TranslateCap('m_rock'),
					drop = 50
				}
			},
			Hint = TranslateCap('m_rock_button'),
			GPS = {x = 2655.1201, y = 2801.8391, z = 34.1382},
			Anim = "WORLD_HUMAN_HAMMERING"
		},

		Foundry = {
			Pos = {x = 1107.83, y = -2013.52, z = 34.45},
			Size = {x = 4.4, y = 4.4, z = 1.5},
			Color = {r = 50, g = 200, b = 50},
			Marker = 27,
			Blip = true,
			Name = TranslateCap('m_rock_smelting'),
			Type = 'work',
			Item = {  
				{
					name = TranslateCap('m_copper'),
					db_name = 'copper',
					time = 4,
					max = 156,
					add = 8,
					remove = 1,
					requires = 'washed_stone',
					requires_name = TranslateCap('m_washrock'),
					drop = 75
				},
				{
					name = TranslateCap('m_iron'),
					db_name = 'iron',
					max = 142,
					add = 6,
					drop = 75
				},
				{
					name = TranslateCap('m_gold'),
					db_name = 'gold',
					max = 121,
					add = 3,
					drop = 75
				},
				{
					name = TranslateCap('m_diamond'),
					db_name = 'diamond',
					max = 50,
					add = 1,
					drop = 5
				}
			},
			Hint = TranslateCap('m_melt_button'),
			GPS = {x = 1107.83, y = -2013.52, z = 34.45},
			Anim = "WORLD_HUMAN_CLIPBOARD"
		},

		VehicleSpawner = {
			Pos = {x = 1072.9301, y = -1963.2864, z = 31.0144},
			Size = {x = 2.0, y = 2.0, z = 1.5},
			Color = {r = 50, g = 200, b = 50},
			Marker = 39,
			Blip = false,
			Name = TranslateCap('spawn_veh'),
			Type = 'vehspawner',
			Spawner = 1,
			Hint = TranslateCap('spawn_veh_button'),
			Caution = 2000,
			GPS = {x = 1072.9301, y = -1963.2864, z = 31.0144}
		},

		VehicleSpawnPoint = {
			Pos = {x = 1068.6268, y = -1954.1128, z = 31.0142},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Marker = -1,
			Blip = false,
			Name = TranslateCap('service_vh'),
			Type = 'vehspawnpt',
			Spawner = 1,
			Heading = 145.9332,
			GPS = 0
		},

		VehicleDeletePoint = {
			Pos = {x = 1074.3177, y = -1945.6591, z = 32.0142},
			Size = {x = 5.0, y = 5.0, z = 5.0},
			Color = {r = 255, g = 0, b = 0},
			Marker = 39,
			Blip = false,
			Name = TranslateCap('return_vh'),
			Type = 'vehdelete',
			Hint = TranslateCap('return_vh_button'),
			Spawner = 1,
			Caution = 2000,
			GPS = 0,
			Teleport = 0
		},

		CopperDelivery = {
			Pos = {x = -134.37, y = -1099.55, z = 20.77},
			Color = {r = 50, g = 200, b = 50},
			Size = {x = 4.0, y = 4.0, z = 3.0},
			Marker = 1,
			Blip = true,
			Name = TranslateCap('m_sell_copper'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = TranslateCap('delivery'),
					time = 0.5,
					remove = 1,
					max = 56, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 5,
					requires = 'copper',
					requires_name = TranslateCap('m_copper'),
					drop = 100
				}
			},
			Hint = TranslateCap('m_deliver_copper'),
			GPS = {x = -148.78, y = -1040.38, z = 26.27}
		},

		IronDelivery = {
			Pos = {x = 822.43, y = -2142.51, z = 28.01},
			Color = {r = 50, g = 200, b = 50},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 1,
			Blip = true,
			Name = TranslateCap('m_sell_iron'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = TranslateCap('delivery'),
					time = 0.5,
					remove = 1,
					max = 42, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 9,
					requires = 'iron',
					requires_name = TranslateCap('m_iron'),
					drop = 100
				}
			},
			Hint = TranslateCap('m_deliver_iron'),
			GPS = {x = 261.48, y = 207.35, z = 109.28}
		},

		GoldDelivery = {
			Pos = {x = -5.11, y = -670.69, z = 31.41},
			Color = {r = 50, g = 200, b = 50},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 1,
			Blip = true,
			Name = TranslateCap('m_sell_gold'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = TranslateCap('delivery'),
					time = 0.5,
					remove = 1,
					max = 21, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 25,
					requires = 'gold',
					requires_name = TranslateCap('m_gold'),
					drop = 100
				}
			},
			Hint = TranslateCap('m_deliver_gold'),
			GPS = {x = -621.04, y = -228.53, z = 37.05}
		},

		DiamondDelivery = {
			Pos = {x = -621.04, y = -228.53, z = 37.05},
			Color = {r = 50, g = 200, b = 50},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 1,
			Blip = true,
			Name = TranslateCap('m_sell_diamond'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = TranslateCap('delivery'),
					time = 0.5,
					remove = 1,
					max = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 250,
					requires = 'diamond',
					requires_name = TranslateCap('m_diamond'),
					drop = 100
				}
			},
			Hint = TranslateCap('m_deliver_diamond'),
			GPS = {x = 2962.40, y = 2746.20, z = 42.39}
		}

	}
}
