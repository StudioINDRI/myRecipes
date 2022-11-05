Config = {}

--#### Blips ####--
Config.Blips = {
    {title="Noleggio", colour = 37, id = 226, x = -1034.12, y = -2730.79, z = 19.08 + 1, width = 1.0}, --Airport Stop
    {title="Noleggio", colour = 37, id = 226, x = -1102.54, y = -1699.23, z = 3.40 + 1, width = 1.0}, --Beach Bike Rent 
    --{title="Noleggio", colour = 37, id = 226, x = 1232.0, y = 2725.5, z = 37.03 +1, width = 1.0}, --Sandy Shore Rent
    --{title="Noleggio", colour = 37, id = 226, x = 144.46, y = 6576.75, z = 30.90 + 1, width = 1.0}, --North Peleto Rent
    {title="Noleggio", colour = 0, id = 226, x = -212.7118, y = -1005.9144, z = 28.2991 + 1, width = 1.0}, --Pillbox Stop
    {title="Noleggio", colour = 0, id = 226, x = -486.7039, y = -671.1064, z = 31.8041 + 1, width = 1.0}, --Little Seoul Stop
    {title="Noleggio", colour = 0, id = 226, x = -851.1959, y = -132.5279, z = 36.6304 + 1, width = 1.0}, --Portola Drive Stop
    {title="Noleggio", colour = 0, id = 226, x = -251.8529, y = -323.9374, z = 28.9741 + 1, width = 1.0}, --Burton Stop
    {title="Noleggio", colour = 0, id = 226, x = 257.0563, y = -1213.0839, z = 28.3775 + 1, width = 1.0}, --Strawberry Stop
    {title="Noleggio", colour = 0, id = 226, x = -574.2576, y = -1247.2767, z = 12.8089 + 1, width = 1.0}, --Puerto de Sol Stop
    {title="Noleggio", colour = 0, id = 226, x = -1414.1075, y = -492.5853, z = 32.1820 + 1, width = 1.0}, --Del Perro Stop
    {title="Noleggio", colour = 0, id = 226, x = 95.5770, y = -1718.1775, z = 27.9191 + 1, width = 1.0}, --Davis Stop
    {title="Noleggio", colour = 0, id = 226, x = 2630.0554, y = 2935.1699, z = 39.4216 + 1, width = 1.0}, --Train Station 1


}
  

--#### Bikes ####--
Config.Bikes = {
    {name = "BMX", model = "bmx", price = 100, imageName = "bmx.png"},
    {name = "Monopattino Elettrico", model = "serv_electricscooter", price = 150, imageName = "monopattino.png"},
    --{name = "Brioso200", model = "brioso", price = 200, imageName = "brioso.png"},
    {name = "Tribike", model = "tribike", price = 150, imageName = "tribike.png"},
    {name = "Tribike 2", model = "tribike2", price = 150, imageName = "tribike2.png"},
    {name = "Tribike 3", model = "tribike3", price = 150, imageName = "tribike3.png"},
}

Config.Currency = "$"
Config.GridSystem = true -- GRIDSYSTEM 0.00ms without 0.03

--#### MESSAGES ####--
Config.OpenMenu = "Premi ~INPUT_CONTEXT~ per il noleggio"
Config.NoMoney = "Non hai abbastanza soldi"
Config.Success = "Hai noleggiato correttamente"