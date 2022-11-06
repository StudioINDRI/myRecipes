local ESX = exports['es_extended']:getSharedObject()
local Currentlavoro = nil
local blips = {}

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    TriggerEvent('gridsystem:registerMarker', {
        name = 'nowl_'..Config.Impiego.coords.x,
        pos = vector3(Config.Impiego.coords.x,Config.Impiego.coords.y,Config.Impiego.coords.z),
        scale = vector3(0.5, 0.5, 0.5),
        msg = 'Premi ~INPUT_CONTEXT~ per aprire il menu',
        control = 'E',
        type = 20,
        color = {r = 255, g = 255, b = 255},
        --rotazione = true,
        --show3D = true,
        --float3d = true,
        --float4d = true,
        action = function()
            ApriMenuImpiego()
        end,
    })
    TriggerEvent('gridsystem:registerMarker', {
        name = 'nowl_'..Config.Impiego.spawnpoint.x,
        pos = vector3(Config.Impiego.spawnpoint.x,Config.Impiego.spawnpoint.y,Config.Impiego.spawnpoint.z),
        scale = vector3(3.5, 3.5, 3.5),
        msg = 'Premi ~INPUT_CONTEXT~ per depositare il veicolo',
        control = 'E',
        type = 23,
        color = {r = 255, g = 255, b = 255},
        --rotazione = true,
        --show3D = true,
        --float3d = true,
        --float4d = true,
        action = function()
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                Currentlavoro = nil
                ESX.ShowNotification('Hai rimosso il lavoro')
                DeleteBlips()
                ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
            end
        end,
    })
end)

function ApriMenuImpiego()
    local elements = {}
    for k,v in pairs(Config.Lavori) do
        table.insert(elements,{label = ''..k, value = k})
    end
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'menu_selezione_lavoro',
    { 
    title = 'Scegli il tuo lavoro', 
    align = Config.Allign, 
    elements = elements 
    }, function(data, menu)
        if data.current.value ~= nil then
            Currentlavoro = data.current.value
            ESX.ShowNotification('Hai un nuovo lavoro: '..Currentlavoro)
            ESX.Game.SpawnVehicle(Config.Impiego.vehicle,vector3(Config.Impiego.spawnpoint.x,Config.Impiego.spawnpoint.y,Config.Impiego.spawnpoint.z),Config.Impiego.spawnpoint.h, function(veh)
                local txt = tostring(math.random(1111111, 9999999))
                SetVehicleNumberPlateText(veh, txt)
                TriggerEvent('as_custom:vehcall', txt)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                AttivaBlips()
                StartaLavori()
                menu.close()
            end)
        end
    end, function(data, menu) 
        menu.close() 
    end)
end

function StartaLavori()
    Citizen.CreateThread(function()
        while true do
            local Wait = 250
            local coords = GetEntityCoords(PlayerPedId())   
            for k,v in pairs(Config.Lavori) do
                if k ~= nil then
                    if Currentlavoro ~= nil and k == Currentlavoro then
                        for i = 1, #(v.RaccoltaLavori.coords), 1 do
                            local posizioneRac = #(vector3(v.RaccoltaLavori.coords[i].x,v.RaccoltaLavori.coords[i].y,v.RaccoltaLavori.coords[i].z)-coords)
                            if posizioneRac < 5.0 then
                                Wait = 5
                                TestoFloat('Premi [~g~E~s~]',vector3(v.RaccoltaLavori.coords[i].x,v.RaccoltaLavori.coords[i].y,v.RaccoltaLavori.coords[i].z))
                                if posizioneRac < 3.0 then
                                    if IsControlJustReleased(0, 51) then
                                        exports['mythic_progbar']:Progress({
                                            name = v.RaccoltaLavori.unique,
                                            duration = v.RaccoltaLavori.durata,
                                            label = v.RaccoltaLavori.label,
                                            useWhileDead = false,
                                            canCancel = true,
                                            controlDisables = {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = true,
                                            },
                                            animation = {
                                                animDict = v.RaccoltaLavori.animdict,
                                                anim = v.RaccoltaLavori.anim,
                                                flags = 49,
                                            },
                                            prop = {
                                                model = v.RaccoltaLavori.propmodel,
                                                bone = 18905,
                                                coords = { x = 0.10, y = 0.02, z = 0.08 },
                                                rotation = { x = -80.0, y = 0.0, z = 0.0 },
                                            },
                                                propTwo = {
                                                    model = v.RaccoltaLavori.props2,
                                                    bone = 58866,
                                                    coords = { x = 0.12, y = 0.0, z = 0.001 },
                                                    rotation = { x = -150.0, y = 0.0, z = 0.0 },
                                                },  
                                        }, function(cancelled)
                                            if not cancelled then
                                                TriggerServerEvent('as_nowl:raccogli', v.RaccoltaLavori.item, v.RaccoltaLavori.count, v.RaccoltaLavori.notify)
                                            end
                                        end)
                                    end
                                end
                            end
                        end
                        for i = 1,#(v.ProcessoLavori.coords),1 do
                            local posizionePro = #(vector3(v.ProcessoLavori.coords[i].x,v.ProcessoLavori.coords[i].y,v.ProcessoLavori.coords[i].z)-coords)
                            if posizionePro < 5.0 then
                                Wait = 5
                                TestoFloat('Premi [~g~E~s~]',vector3(v.ProcessoLavori.coords[i].x,v.ProcessoLavori.coords[i].y,v.ProcessoLavori.coords[i].z)) 
                                if posizionePro < 3.0 then
                                    if IsControlJustReleased(0, 51) then
                                        exports['mythic_progbar']:Progress({
                                            name = v.ProcessoLavori.unique,
                                            duration = v.ProcessoLavori.durata,
                                            label = v.ProcessoLavori.label,
                                            useWhileDead = false,
                                            canCancel = true,
                                            controlDisables = {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = true,
                                            },
                                            animation = {
                                                animDict = v.ProcessoLavori.animdict,
                                                anim = v.ProcessoLavori.anim,
                                                flags = 49,
                                            },
                                            prop = {
                                                model = v.ProcessoLavori.propmodel,
                                                bone = 18905,
                                                coords = { x = 0.10, y = 0.02, z = 0.08 },
                                                rotation = { x = -80.0, y = 0.0, z = 0.0 },
                                            },
                                                propTwo = {
                                                    model = v.ProcessoLavori.props2,
                                                    bone = 58866,
                                                    coords = { x = 0.12, y = 0.0, z = 0.001 },
                                                    rotation = { x = -150.0, y = 0.0, z = 0.0 },
                                                },
                                        }, function(cancelled)
                                            if not cancelled then
                                                TriggerServerEvent('as_nowl:processa', v.ProcessoLavori.item, v.ProcessoLavori.count, v.RaccoltaLavori.item, v.ProcessoLavori.notify)
                                            end
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end 
            Citizen.Wait(Wait)        
        end
    end)
end

function AttivaBlips()
    local ConfigCoords = Config.Lavori[Currentlavoro]
    local BlipRaccolta = ConfigCoords.RaccoltaLavori.coords
    local BlipProcesso = ConfigCoords.ProcessoLavori.coords
    for i = 1,#BlipRaccolta,1 do
        local blip = AddBlipForCoord(vector3(BlipRaccolta[i].x,BlipRaccolta[i].y,BlipRaccolta[i].z))
		SetBlipSprite(blip, ConfigCoords.RaccoltaLavori.Blips.sprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 1.5)
		SetBlipColour(blip, ConfigCoords.RaccoltaLavori.Blips.color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(ConfigCoords.RaccoltaLavori.Blips.name)
		EndTextCommandSetBlipName(blip)
        table.insert(blips,{blip = blip})
        SetNewWaypoint(BlipRaccolta[i].x,BlipRaccolta[i].y)
    end
    for i = 1,#BlipProcesso,1 do
        local blip = AddBlipForCoord(vector3(BlipProcesso[i].x,BlipProcesso[i].y,BlipProcesso[i].z))
		SetBlipSprite(blip, ConfigCoords.ProcessoLavori.Blips.sprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 1.5)
		SetBlipColour(blip, ConfigCoords.ProcessoLavori.Blips.color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(ConfigCoords.ProcessoLavori.Blips.name)
		EndTextCommandSetBlipName(blip)
        table.insert(blips,{blip = blip})
    end
    ESX.ShowNotification('Blip aggiuti in mappa')
end

function DeleteBlips()
    for k,v in pairs(blips) do
        RemoveBlip(v.blip)
        SetWaypointOff()
    end
end

TestoFloat = function(msg,coords)
    AddTextEntry('esxFloatingHelpNotification', msg)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('esxFloatingHelpNotification')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

-- Ped Mucche
local pedMucche = {
    {2435.75, 4761.63, 33.3, "Mucca1", 0.0, 0xFCFA9E1E, "a_c_cow"},
    {2441.67, 4770.47, 33.3, "Mucca2", 62.0, 0xFCFA9E1E, "a_c_cow"},
    {2452.37, 4760.19, 33.3, "Mucca3", 122.0, 0xFCFA9E1E, "a_c_cow"},
    {2454.36, 4747.44, 33.3, "Mucca4", 221.0, 0xFCFA9E1E, "a_c_cow"},
    {2441.45, 4745.38, 33.3, "Mucca5", 30.0, 0xFCFA9E1E, "a_c_cow"},
}

Citizen.CreateThread(function()
    for _, v in pairs(pedMucche) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
        end
        RequestAnimDict("mini@strip_club@idles@bouncer@base")
        while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
            Wait(1)
        end
        ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
        SetEntityHeading(ped, v[5])
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end
end)