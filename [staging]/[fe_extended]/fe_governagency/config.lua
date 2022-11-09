Config = {}

Config.DrawDistance = 15.0
Config.ZoneSize = {x = 2.0, y = 2.0, z = 2.0}
Config.MarkerColor = {r = 100, g = 200, b = 104}
Config.MarkerType = 0
Config.Debug = ESX.GetConfig().EnableDebug

Config.Locale = GetConvar('esx:locale', 'en')

Config.Zones = {
  vector3(-78.1755, -802.5016, 243.4008)
}

Config.Blip = {
  Enabled = true, 
  Sprite = 407, 
  Display = 4, 
  Scale = 0.8, 
  Colour = 27, 
  ShortRange = true
}
