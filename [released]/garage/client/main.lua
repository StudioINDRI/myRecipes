local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Shared, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)





local enableField = false

function AddCar(plate, model)
    SendNUIMessage({
        action = 'add',
        plate = plate,
        model = model
    }) 
end

function toggleField(enable)
    SetNuiFocus(enable, enable)
    enableField = enable

    if enable then
        SendNUIMessage({
            action = 'open'
        }) 
    else
        SendNUIMessage({
            action = 'close'
        }) 
    end
end

AddEventHandler('onResourceStart', function(name)
    if GetCurrentResourceName() ~= name then
        return
    end

    toggleField(false)
end)

RegisterNUICallback('escape', function(data, cb)
    toggleField(false)
    SetNuiFocus(false, false)

    cb('ok')
end)

RegisterNUICallback('enable-parkout', function(data, cb)
	ESX.TriggerServerCallback('qp_garage:loadVehicles', function(ownedCars)
	if #ownedCars == 0 then
		TriggerEvent(Config.Notifytrigger, "Garage", "Du hast keine Fahrzeuge")
	else
		for _,v in pairs(ownedCars) do
			local vehicleName = GetDisplayNameFromVehicleModel(v.vehicle.model) 
			local plate = v.plate
			AddCar(plate, vehicleName)
		
		end
	end
end)

cb('ok')
end) 

RegisterNUICallback('enable-parking', function(data, cb)
    local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(GetPlayerPed(-1)), 45.0)

    for key, value in pairs(vehicles) do
        ESX.TriggerServerCallback('qp_garage:isOwned', function(owned)
		
			print(GetVehicleNumberPlateText(value))
			if owned then
				print("Ja ist owned")
            AddCar(GetVehicleNumberPlateText(value), GetDisplayNameFromVehicleModel(GetEntityModel(value)))
			end
    
		end, GetVehicleNumberPlateText(value))
    end
    
    cb('ok')
end) 

local usedGarage

RegisterNUICallback('park-out', function(data, cb, state)
    
    ESX.TriggerServerCallback('qp_garage:loadVehicle', function(vehicle)
        local x,y,z = table.unpack(Config.Garagen[usedGarage][2])
        local prodlrp = json.decode(vehicle[1].vehicle)

        ESX.Game.SpawnVehicle(prodlrp.model, {
            x = x,
            y = y,
            z = z + 1
        }, Config.Garagen[usedGarage][3], function(callback_vehicle)
            ESX.Game.SetVehicleProperties(callback_vehicle, prodlrp)
            SetVehRadioStation(callback_vehicle, "OFF")
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
            TriggerEvent(Config.Notifytrigger, "Garage", "Fahrzeug ausgeparkt", data.plate)
        end)

    end, data.plate)

    TriggerServerEvent('qp_garage:changeState', data.plate, 0)
    
    cb('ok')
end)
RegisterNUICallback('park-in', function(data, cb, state)
    
    local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(GetPlayerPed(-1)), 35.0)

    for key, value in pairs(vehicles) do
        if GetVehicleNumberPlateText(value) == data.plate then
            TriggerServerEvent('qp_garage:saveProdlrp', data.plate, ESX.Game.GetVehicleProperties(value))
            TriggerServerEvent('qp_garage:changeState', data.plate, 1)
            TriggerEvent(Config.Notifytrigger, "Garage", "Fahrzeug eingeparkt", data.plate)
            ESX.Game.DeleteVehicle(value)
        end
    end

    cb('ok')
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for key, value in pairs(Config.Garagen) do
            DrawMarker(Config.Marker, value[1], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerFarbe[1], Config.MarkerFarbe[2], Config.MarkerFarbe[3], Config.MarkerFarbe[4], false, true, 2, true, false, false, false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)

        for key, value in pairs(Config.Garagen) do
            local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), value[1])

            if dist <= 2.0 then
                ESX.ShowHelpNotification(Config.Helpnotify)

                if IsControlJustReleased(0, 38) then
                    toggleField(true)
                    usedGarage = key
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    for _, coords in pairs(Config.Garagen) do
        local blip = AddBlipForCoord(coords[1])

        SetBlipSprite(blip, Config.Blip[1])
        SetBlipScale(blip, Config.Blip[2])
        SetBlipColour(blip, Config.Blip[3])
        SetBlipDisplay(blip, 2)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip[4])
        EndTextCommandSetBlipName(blip)
    end
end)
