local opened = false
ESX = exports["es_extended"]:getSharedObject()


ESX = nil
local hasAlreadyEnteredMarker, lastZone
local currentAction, currentActionMsg, currentActionData = nil, nil, {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
end)

Citizen.CreateThread(function()
    for _, info in pairs(Config.Blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 2)
        SetBlipScale(info.blip, info.width)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)


Citizen.CreateThread(function()
	if Config.GridSystem then
		for i,v in pairs(Config.Blips) do 
			local markerName = i .. "_blipbici"
			TriggerEvent('gridsystem:registerMarker', {
				name = markerName,
				pos = vector3(v.x,v.y,v.z),
            	size = vector3(1.5, 1.5, 1.5),
            	scale = vector3(0.5, 0.5, 0.5),
				shouldRotate = true,
				msg = Config.OpenMenu,
				type = 38,
				color = { r = 255, g = 0, b = 0 }, -- Color Marker
           		trasparent = 255,
				rotate = 00.0,
           		rotate2 = 0.0,
				action = function()
					SetDisplay(true)
				end,
			})
		end
	else
		while true do 
			Citizen.Wait(5)
			for a, mark in pairs(Config.Blips) do 
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), mark.x, mark.y, mark.z, true) <= 4.0 and not opened then
					DrawMarker(38, mark.x, mark.y, mark.z + 0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 65, false, true, 2, true, false, false, false)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), mark.x, mark.y, mark.z, true) <= 1.5  then
						ESX.ShowHelpNotification(Config.OpenMenu)
						if IsControlJustReleased(0, 38) then
							SetDisplay(true)
						end
					end
				end
			end 
		end
	end

end)

RegisterNetEvent("bike:payed", bike)
AddEventHandler("bike:payed", function(bike)
    SpawnBike(bike);
end)

RegisterNetEvent("bike:close", bike)
AddEventHandler("bike:close", function(bike)
    close()
end)

function SpawnBike(bike)
	close()
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		SetEntityAsMissionEntity(veh, true, true)
		DeleteVehicle(veh)
	end
	ESX.Game.SpawnVehicle(bike, GetEntityCoords(GetPlayerPed(-1)), GetEntityHeading(GetPlayerPed(-1)), function(vehicle)
		SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
	end) 
	DoScreenFadeIn(2500)
	ESX.ShowNotification(Config.Success, "success", Noleggio)
end

--==================================== [GUI] ============================================

--functions
function SetDisplay(bool)
	SetNuiFocus(bool, bool)
	SetNuiFocusKeepInput(false)
	DisableIdleCamera(bool)
	SetCursorLocation(0.5, 0.5)

	SendNUIMessage({
        type = "bike_ui",
        status = bool,
		bikes = Config.Bikes,
		currency = Config.Currency,
		resName = GetCurrentResourceName()
    });
end

function close()
	SetDisplay(false)
    opened = false
end

--callback
RegisterNUICallback("close", function(data)
    close()
end)

RegisterNUICallback("buy", function(data)
    TriggerServerEvent("bike:pay", data.price, data.model)
end)


--commands
RegisterCommand('closebikeui', function ()
	close()
end)