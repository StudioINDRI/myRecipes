local IsBusy = false

local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('parmex_manette:ammanetta')
AddEventHandler('parmex_manette:ammanetta', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if distance ~= -1 and distance <= 3.0 then
		local target, distance = ESX.Game.GetClosestPlayer()
		playerheading = GetEntityHeading(PlayerPedId())
		playerlocation = GetEntityForwardVector(PlayerPedId())
		playerCoords = GetEntityCoords(PlayerPedId())
		local target_id = GetPlayerServerId(target)
		TriggerServerEvent('esx_policejob:requesthard', target_id, playerheading, playerCoords, playerlocation)
    else
        ESX.ShowNotification('Nessun giocatore nelle vicinanze')
	end
end)

RegisterNetEvent('parmex_manette:smanetta')
AddEventHandler('parmex_manette:smanetta', function()
	local player, distance = ESX.Game.GetClosestPlayer()
    if distance ~= -1 and distance <= 3.0 then
		local target, distance = ESX.Game.GetClosestPlayer()
		playerheading = GetEntityHeading(PlayerPedId())
		playerlocation = GetEntityForwardVector(PlayerPedId())
		playerCoords = GetEntityCoords(PlayerPedId())
		local target_id = GetPlayerServerId(target)
		TriggerServerEvent('esx_policejob:requestrelease', target_id, playerheading, playerCoords, playerlocation)
		Citizen.Wait(1200)
    else
        ESX.ShowNotification('Nessun giocatore nelle vicinanze')
	end
end)
