Config.Jobs.lumberjack = {

	BlipInfos = {
		Sprite = 237,
		Color = 4
	},

	Vehicles = {

		

		Truck = {
			Spawner = 1,
			Hash = 'scrap',
			Trailer = 'none',
			HasCaution = true
		}

	},

	Zones = {

		CloakRoom = {
			Pos = {x = -64.3784, y = -825.9097, z = 285.5953},
			Size  = {x = 0.8, y = 0.5, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker= 20,
			Blip = true,
			Name = TranslateCap('lj_locker_room'),
			Type = 'cloakroom',
			Hint = TranslateCap('cloak_change')
		},

		Wood = {
			Pos = {x = -534.32, y = 5373.79, z = 69.50},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 1,
			Blip = true,
			Name = TranslateCap('lj_mapblip'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('lj_wood'),
					db_name = 'wood',
					time = 3,
					max = 20,
					add = 1,
					remove = 0,
					requires = 'nothing',
					requires_name = 'Nothing',
					drop = 100
				}
			},
			Hint = TranslateCap('lj_pickup'),
			Anim  = "world_human_gardener_plant"
		},

		CuttedWood = {
			Pos = {x = -552.21, y = 5326.90, z = 72.59},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 1,
			Blip = false,
			Name = TranslateCap('lj_woodcutting'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('lj_cutwood'),
					db_name = 'cutted_wood',
					time = 5,
					max = 20,
					add = 1,
					remove = 1,
					requires = 'wood',
					requires_name = TranslateCap('lj_wood'),
					drop = 100
				}
			},
			Hint = TranslateCap('lj_cutwood_button'),
			Anim  = "WORLD_HUMAN_CLIPBOARD"
		},

		Planks = {
			Pos = {x = -501.38, y = 5280.53, z = 79.61},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 1,
			Blip = false,
			Name = TranslateCap('lj_board'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('lj_planks'),
					db_name = 'packaged_plank',
					time = 4,
					max = 100,
					add = 5,
					remove = 1,
					requires = 'cutted_wood',
					requires_name = TranslateCap('lj_cutwood'),
					drop = 100
				}
			},
			Hint = TranslateCap('lj_pick_boards'),
			Anim  = "WORLD_HUMAN_HAMMERING"
		},

		VehicleSpawner = {
			Pos = {x = -80.0429, y = -816.7631, z = 285.0003},
			Size = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 39,
			Blip = false,
			Name = TranslateCap('spawn_veh'),
			Type = 'vehspawner',
			Spawner = 1,
			Hint = TranslateCap('spawn_veh_button'),
			Caution = 1000
		},

		VehicleSpawnPoint = {
			Pos = {x = -81.7092, y = -810.5720, z = 36.3504},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Marker = -1,
			Blip = false,
			Name = TranslateCap('service_vh'),
			Type = 'vehspawnpt',
			Spawner = 1,
			Heading = 346.7709
		},

		VehicleDeletePoint = {
			Pos = {x = -84.1463, y = -820.3674, z = 35.8437},
			Size = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 255, g = 0, b = 0},
			Marker = 39,
			Blip = false,
			Name = TranslateCap('return_vh'),
			Type = 'vehdelete',
			Hint = TranslateCap('return_vh_button'),
			Spawner = 1,
			Caution = 1000,
			GPS = 0,
			Teleport = 0
		},


		Delivery = {
			Pos = {x = 1201.35, y = -1327.51, z = 34.52},
			Color = {r = 50, g = 200, b = 50},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 29,
			Blip = true,
			Name = TranslateCap('delivery_point'),
			Type = 'delivery',
			Spawner = 2,
			Item = {
				{
					name = TranslateCap('delivery'),
					time = 0.5,
					remove = 1,
					max = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 13,
					requires = 'packaged_plank',
					requires_name = TranslateCap('lj_planks'),
					drop = 100
				}
			},
			Hint = TranslateCap('lj_deliver_button')
		}

	}
}
