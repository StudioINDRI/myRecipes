Config              = {}
Config.DrawDistance = 10.0
Config.Locale = GetConvar('esx:locale', 'en')
Config.Jobs         = {}

Config.MaxCaution = 10000
Config.RequestIPL = true

Config.PublicZones = {

	StartUSA = {
		Pos   = vector3(327.8443, 4831.4800, -59.4020),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 0, g = 0, b = 255},
		Marker= 33,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_enter'),
		Teleport = vector3(3090.4424, -4712.0034, 15.2626),
	},

	StartSKR = {
		Pos   = vector3(330.7179, 4830.4409, -59.4020),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 255, g = 255, b = 0},
		Marker= 33,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_leave'),
		Teleport = vector3(-1044.0220, -2748.3159, 21.3634),
	},

	StartRBL = {
		Pos   = vector3(330.6013, 4827.1519, -59.4020),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 255, g = 0, b = 0},
		Marker= 33,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_leave'),
		Teleport = vector3(-1167.4840, 4925.9507, 223.0497),
	},
	
	EnterBuilding = {
		Pos   = vector3(-79.3978, -796.6697, 44.2273),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 50, g = 200, b = 50},
		Marker= 21,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_enter'),
		Teleport = vector3(-78.8019, -829.4063, 243.3859),
	},

	ExitBuilding = {
		Pos   = vector3(-78.8019, -829.4063, 243.3859),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 50, g = 200, b = 50},
		Marker= 20,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_leave'),
		Teleport = vector3(-79.3978, -796.6697, 44.2273),
	},

	EnterGarage = {
		Pos   = vector3(-84.8432, -825.0295, 36.0281),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 50, g = 200, b = 50},
		Marker= 30,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_enter'),
		Teleport = vector3(-71.1264, -810.4916, 285.0000),
	},

	ExitGarage = {
		Pos   = vector3(-68.0144, -812.6530, 284.9999),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 50, g = 200, b = 50},
		Marker= 20,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_leave'),
		Teleport = vector3(-84.3924, -821.3420, 36.0280),
	},

	EnterTerminals = {
		Pos   = vector3(-1046.0105, -2751.8625, 21.3634),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 50, g = 200, b = 50},
		Marker= 30,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_enter'),
		Teleport = vector3(460.4964, 4815.5557, -59.0008),
	},
	EnterMission = {
		Pos   = vector3(87.9746, -1293.9827, 29.2048),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 50, g = 200, b = 50},
		Marker= 30,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_enter'),
		Teleport = vector3(1138.1625, -3199.1606, -39.6657),--	
	},
	ExitMission = {
		Pos   = vector3(1138.0879, -3199.0962, -39.6657),--	
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 50, g = 200, b = 50},
		Marker= 30,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_enter'),
		Teleport = vector3(89.4056, -1298.2882, 29.2067),
	},
	CraneElevatorUP = {
		Pos   = vector3(-181.4630, -1020.2419, 29.9803),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 50, g = 200, b = 50},
		Marker= 22,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_enter'),
		Teleport = vector3(-179.6662, -1013.8589, 114.1361),
	},
	CraneElevatorDOWN = {
		Pos   = vector3(-182.6055, -1012.8040, 114.1361),
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 50, g = 200, b = 50},
		Marker= 30,
		Blip  = false,
		Name  = TranslateCap('reporter_name'),
		Type  = "teleport",
		Hint  = TranslateCap('public_enter'),
		Teleport = vector3(-185.2033, -1018.7389, 30.0595),
	}


}
--[[  ]] 