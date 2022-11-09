Config.Jobs.slaughterer = {

	BlipInfos = {
		Sprite = 256,
		Color = 5
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = 'benson',
			Trailer = 'none',
			HasCaution = true
		}
	},

	Zones = {

		CloakRoom = {
			Pos = {x = -104.4780, y = 6193.7290, z = 31.0250},
			Size  = {x = 0.8, y = 0.5, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker= 20,
			Blip = true,
			Name = TranslateCap('s_slaughter_locker'),
			Type = 'cloakroom',
			Hint = TranslateCap('cloak_change')
		},

		AliveChicken = {
			Pos = {x = 2471.9558, y = 4687.0386, z = 33.2022},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 27,
			Blip = true,
			Name = TranslateCap('s_hen'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('s_alive_chicken'),
					db_name = 'alive_chicken',
					time = 3,
					max = 24,
					add = 1,
					remove = 0,
					requires = 'nothing',
					requires_name = 'Nothing',
					drop = 80
				}
			},
			Hint = TranslateCap('s_catch_hen'),
			Anim  = "CODE_HUMAN_MEDIC_KNEEL"
		},

		SlaughterHouse = {
			Pos = {x = -86.22, y = 6236.72, z = 30.09},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 27,
			Blip = false,
			Name = TranslateCap('s_slaughtered'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('s_slaughtered_chicken'),
					db_name = 'slaughtered_chicken',
					time = 5,
					max = 24,
					add = 1,
					remove = 1,
					requires = 'alive_chicken',
					requires_name = TranslateCap('s_alive_chicken'),
					drop = 80
				}
			},
			Hint = TranslateCap('s_chop_animal'),
			Anim  = "WORLD_HUMAN_CLIPBOARD"
		},

		Packaging = {
			Pos = {x = -101.27, y = 6208.06, z = 30.12},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 27,
			Blip = false,
			Name = TranslateCap('s_package'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('s_packagechicken'),
					db_name = 'packaged_chicken',
					time = 4,
					max = 100,
					add = 1,
					remove = 2,
					requires = 'slaughtered_chicken',
					requires_name = TranslateCap('s_slaughtered_chicken'),
					drop = 100
				}
			},
			Hint = TranslateCap('s_unpackaged_button'),
			Anim  = "WORLD_HUMAN_CLIPBOARD"
		},

		VehicleSpawner = {
			Pos = {x = -69.2969, y = 6255.9307, z = 31.2902},   
			Size = {x = 2.0, y = 2.0, z = 2.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 39,
			Blip = false,
			Name = TranslateCap('spawn_veh'),
			Type = 'vehspawner',
			Spawner = 1,
			Hint = TranslateCap('spawn_veh_button'),
			Caution = 2000
		},

		VehicleSpawnPoint = {
			Pos = {x = -76.7428, y = 6271.5425, z =  31.3767},
			Size = {x = 2.0, y = 2.0, z = 2.0},
			Marker = -1,
			Blip = false,
			Name = TranslateCap('service_vh'),
			Type = 'vehspawnpt',
			Spawner = 1,
			Heading = 37.8392
		},

		VehicleDeletePoint = {
			Pos = {x = -53.4435, y = 6277.2725, z = 31.3927},
			Size = {x = 2.0, y = 2.0, z = 2.0},
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

		Delivery = {
			Pos = {x =970.50, y = -1622.74, z =  29.08},
			Color = {r = 50, g = 200, b = 50},
			Size = {x = 2.0, y = 2.0, z = 2.0},
			Marker = 29,
			Blip = true,
			Name = TranslateCap('delivery_point'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = TranslateCap('delivery'),
					time = 0.5,
					remove = 1,
					max = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 23,
					requires = 'packaged_chicken',
					requires_name = TranslateCap('s_packagechicken'),
					drop = 100
				}
			},
			Hint = TranslateCap('s_deliver')
		}
	}
}
