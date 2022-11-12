local ESX = exports['es_extended']:getSharedObject()

BiciclettePosiz = {
    {x = -246.980, y = -339.820, z = 30.000},
    {x = -6.986, y = -1081.704, z = 26.7},
    {x = -1131.485, y = -273.6598, z = 37.681812}, 
    {x = -1262.36, y = -1438.98, z = 4.45},
    {x = -489.94, y = -670.2, z = 32.89},
    {x = -1062.77, y = -886.94, z = 4.58},
    {x = 1853.4157, y = 2585.958, z = 45.672069},
    {x = 1690.1655, y = 3581.3688, z = 35.620864},
    {x = 109.41054534912, y = -1341.7767333984, z = 29.212938308716},
    {x = -410.2448425293, y = 6049.6127929688, z = 31.610244750977}, 
    --{x = -1034.013, y = -2730.749, z = 20.044982},
    {x = 379.13619, y = -1781.127, z = 29.406803},
    {x = 4494.035, y = -4525.659, z = 4.412, c = true},
}

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    for k, v in pairs(BiciclettePosiz) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'bici_'..v.x,
            pos = vector3(v.x, v.y, v.z),
            scale = vector3(0.8, 0.8, 0.8),
            msg = 'Premi ~INPUT_CONTEXT~ per noleggiare una bicicletta',
            --float3d = 0.1,
            --show3D = 0.1,
            control = 'E',
            type = 38,
            color = {r = 255, g = 255, b = 255},
			--rotazione = true,
			--show3D = true,
			--float3d = true,
			--float4d = true,
            action = function()
                if IsPedOnFoot(PlayerPedId()) then
                    if v.c == nil then
                        MenuBici()
                    else
                        SetEntityCoords(PlayerPedId(), vector4(4493.9165, -4515.552, 3.5352127, 23.5))
                        TriggerEvent('esx:spawnVehicle', 'blazer')
                    end
                elseif IsPedOnAnyBike(PlayerPedId()) then
                    DoScreenFadeOut(1000)
                    Citizen.Wait(1000)
                    TriggerEvent('esx:deleteVehicle', 1)
                    DoScreenFadeIn(3000)
                end
            end,
            --[[
            onEnter = function()
                print('This is executed when you enter a marker')
            end,
            ]]
            onExit = function()
                ESX.UI.Menu.CloseAll()
            end
        })
    end
end)

function MenuBici()
    local elements = {
        {label = 'Faggio [250$]', bici = "faggio2", prezzo = 250},
		{label = 'TriBike [50$]', bici = "tribike2", prezzo = 50},
        {label = 'Scorcher [50$]', bici = "scorcher", prezzo = 50},
		{label = 'Cruiser [50$]', bici = "cruiser", prezzo = 50},
        {label = 'Bmx [50$]', bici = "bmx", prezzo = 50}
    }
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'shop_bici',
    { 
    title = 'Affitta Bicicletta', 
    align = 'bottom-right',
    elements = elements 
    }, function(data, menu)
        if data.current.bici ~= nil then
            ESX.TriggerServerCallback('checkSoldi', function(haSoldi)
                if haSoldi then
                    DoScreenFadeOut(1000)
                    Citizen.Wait(1000)
                    TriggerEvent('esx:spawnVehicle', tostring(data.current.bici))
                    DoScreenFadeIn(3000)
                    menu.close()
                end
            end, data.current.prezzo)
        end
    end, function(data, menu) 
        menu.close() 
    end)
end

Citizen.CreateThread(function()
	for k, v in pairs(BiciclettePosiz) do
        if v.c == nil then
            blipsBici = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(blipsBici, 376)
            SetBlipDisplay(blipsBici, 4)
            SetBlipScale(blipsBici, 0.5)
            SetBlipColour(blipsBici, 2)
            SetBlipAsShortRange(blipsBici, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Noleggio Bici")
            EndTextCommandSetBlipName(blipsBici)
        end
	end
end)