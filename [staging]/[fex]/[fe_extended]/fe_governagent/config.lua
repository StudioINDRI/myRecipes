Config              = {}
Config.DrawDistance = 10.0
Config.MarkerColor  = { r = 120, g = 120, b = 240 }
Config.Locale       = 'en'

Config.Zones = {
	
	OfficeEnter = {
		Pos   = vector3(-119.8618, -612.4113, 36.2808),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Type  = 2
	},
	
	OfficeExit = {
		Pos   = vector3(-139.5651, -617.4312, 168.8204),
		Size  = { x = 0.5, y = 0.5, z = 0.5 },
		Type  = 2
	},
	
	OfficeInside = {
		Pos   = vector3(-139.1349, -620.7740, 167.8204),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Type  = -1
	},
	
	OfficeOutside = {
		Pos   = vector3(-113.8245, -596.6726, 35.2842),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Type  = -1
	},
	
	OfficeActions = {
		Pos   = vector3(-124.786, -641.486,  167.920),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Type  = -1
	}
}
