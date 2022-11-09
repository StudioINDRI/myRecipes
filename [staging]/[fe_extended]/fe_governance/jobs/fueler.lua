Config.Jobs.fueler = {

	BlipInfos = {
		Sprite = 436,
		Color = 5
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = 'phantom',
			Trailer = 'tanker',
			HasCaution = true
		}

	},

	Zones = {

		CloakRoom = {
			Pos = {x = -132.14, y = -634.10, z = 168.82},
			Size = {x = 0.5, y = 0.5, z = 0.8},
			Color = {r = 50, g = 200, b = 50},
			Marker = 20,
			Blip = true,
			Name = TranslateCap('f_oil_refiner'),
			Type = 'cloakroom',
			Hint = TranslateCap('cloak_change'),
			GPS = {x = 554.59, y = -2314.43, z = 4.86}
		},

		OilFarm = {
			Pos = {x = 496.98, y = 2950.71, z = 41.42},
			Size = {x = 10.0, y = 10.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 1,
			Blip = true,
			Name = TranslateCap('f_drill_oil'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('f_fuel'),
					db_name = 'petrol',
					time = 5,
					max = 24,
					add = 1,
					remove = 0,
					requires = 'nothing',
					requires_name = 'Nothing',
					drop = 100
				}
			},
			Hint = TranslateCap('f_drillbutton'),
			GPS = {x = 2736.94, y = 1417.99, z = 23.48}
		},

		OilRefinement = {
			Pos = {x = 2771.26, y = 1484.16, z = 23.52},
			Size = {x = 10.0, y = 10.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 1,
			Blip = true,
			Name = TranslateCap('f_fuel_refine'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('f_fuel_refine'),
					db_name = 'petrol_raffin',
					time = 5,
					max = 24,
					add = 1,
					remove = 2,
					requires = 'petrol',
					requires_name = TranslateCap('f_fuel'),
					drop = 100
				}
			},
			Hint = TranslateCap('f_refine_fuel_button'),
			GPS = {x = 265.75, y = -3013.39, z = 4.73}
		},

		OilMix = {
			Pos = {x = 277.98, y = -2900.41, z = 4.78},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 1,
			Blip = true,
			Name = TranslateCap('f_fuel_mixture'),
			Type = 'work',
			Item = {
				{
					name = TranslateCap('f_gas'),
					db_name = 'essence',
					time = 5,
					max = 24,
					add = 2,
					remove = 1,
					requires = 'petrol_raffin',
					requires_name = TranslateCap('f_fuel_refine'),
					drop = 100
				}
			},
			Hint = TranslateCap('f_fuel_mixture_button'),
			GPS = {x = 491.40, y = -2163.37, z = 4.91}
		},

		VehicleSpawner = {
			Pos = {x = -141.66, y = -620.96, z = 167.82},
			Size = {x = 2.0, y = 2.0, z = 2.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 1,
			Blip = false,
			Name = TranslateCap('spawn_veh'),
			Type = 'vehspawner',
			Spawner = 1,
			Hint = TranslateCap('spawn_truck_button'),
			Caution = 2000,
			GPS = {x = 602.25, y = 2926.62, z = 39.68}
		},

		VehicleSpawnPoint = {
			Pos = {x = -224.68, y = -623.11, z = 32.47},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = -1,
			Blip = false,
			Name = TranslateCap('service_vh'),
			Type = 'vehspawnpt',
			Spawner = 1,
			GPS = 0,
			Heading = 0
		},

		VehicleDeletePoint = {
			Pos = {x = -222.30, y = -631.72, z = 32.32},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 50, g = 200, b = 50},
			Marker = 1,
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
			Pos = {x = 484.51, y = -2156.65, z = 5.51},
			Color = {r = 50, g = 200, b = 50},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Marker = 1,
			Blip = true,
			Name = TranslateCap('f_deliver_gas'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = TranslateCap('delivery'),
					time = 0.5,
					remove = 1,
					max = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 61,
					requires = 'essence',
					requires_name = TranslateCap('f_gas'),
					drop = 100
				}
			},

			Hint = TranslateCap('f_deliver_gas_button'),
			GPS = {x = 609.58, y = 2856.74, z = 39.49}
		}

	}
}
