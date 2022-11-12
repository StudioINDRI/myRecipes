AddEventHandler('esx:onPlayerDeath', function(data)
	Emorto = true
end)

-- Density values from 0.0 to 1.0.
DensityMultiplier = 0.3
Citizen.CreateThread(function()
	local player = PlayerPedId()
	while true do
		Citizen.Wait(0)
		SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetPedDensityMultiplierThisFrame(DensityMultiplier)
	    SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
	end
end)


--rimozione pulsanti Q e R + UCCISIONE CORPO A CORPO CON ARMA IN MANO
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisableControlAction(0, 44, true)
        DisableControlAction(0, 140, true)
        if IsControlPressed(1, 82) then
        SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
        end
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
	    DisableControlAction(1, 140, true)
       	DisableControlAction(1, 141, true)
        DisableControlAction(1, 142, true)
        end
    end
end)

--Animazioni braccia move_ped_crouched
----------------------------------------

local handsuped = false
RegisterCommand('handsup',function()
    local ped = GetPlayerPed(-1)
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
		if not handsuped then
            local dict = 'missfra1mcs_2_crew_react'
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(100)
            end
            TaskPlayAnim(GetPlayerPed(-1), dict, 'handsup_standing_base', 8.0, 8.0, -1, 50, 0, false, false, false)
            handsuped = true
		else
            ClearPedTasks(ped)
            handsuped = false
		end
	end
end)
RegisterKeyMapping('handsup','HandsUP','KEYBOARD','X')

local crouched = false
RegisterCommand('_Crouch',function()
    local ped = GetPlayerPed(-1)
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
        DisableControlAction(0, 36, true)
        if not crouched then
            local dict = 'move_ped_crouched'
            RequestAnimSet(dict)
            while not HasAnimSetLoaded(dict) do 
                Citizen.Wait(100)
            end 
            SetPedMovementClipset(ped, dict, 0.25)
            crouched = true 
        else
            ResetPedMovementClipset(ped, 0)
            crouched = false
        end 
	end
end)
RegisterKeyMapping('_Crouch','Accovacciati','KEYBOARD','LCONTROL')

Citizen.CreateThread(function()
	while true do
        local CicloPunta = 500
		local ped = PlayerPedId()
		if pointed then
			CicloPunta = 5
			if not IsPedOnFoot(PlayerPedId()) then
				ResetPedMovementClipset(ped, 0)
				RequestTaskMoveNetworkStateTransition(ped, 'Stop')
				if not IsPedInjured(ped) then
					ClearPedSecondaryTask(ped)
				end
				SetPedConfigFlag(ped, 36, 0)
				ClearPedSecondaryTask(ped)
				pointed = false
			elseif pointed then
				local ped = PlayerPedId()
				local camPitch = GetGameplayCamRelativePitch()
				if camPitch < -70.0 then
					camPitch = -70.0
				elseif camPitch > 42.0 then
					camPitch = 42.0
				end
				camPitch = (camPitch + 70.0) / 112.0
				local camHeading = GetGameplayCamRelativeHeading()
				local cosCamHeading = Cos(camHeading)
				local sinCamHeading = Sin(camHeading)
				if camHeading < -180.0 then
					camHeading = -180.0
				elseif camHeading > 180.0 then
					camHeading = 180.0
				end
				camHeading = (camHeading + 180.0) / 360.0
				local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
				local rayHandle, blocked = GetShapeTestResult(StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7))
				SetTaskMoveNetworkSignalFloat(ped, 'Pitch', camPitch)
				SetTaskMoveNetworkSignalFloat(ped, 'Heading', (camHeading * -1.0) + 1.0)
				SetTaskMoveNetworkSignalBool(ped, 'isBlocked', blocked)
				SetTaskMoveNetworkSignalBool(ped, 'isFirstPerson', N_0xee778f8c7e1142e2(N_0x19cafa3c87f7c2ff()) == 4)
			end
		end
		Citizen.Wait(CicloPunta)
	end
end)

RegisterCommand('_PointFinger', function()
    local ped = PlayerPedId()
    if DoesEntityExist(ped) and not IsEntityDead(ped) then
        if not pointed then
            ESX.Streaming.RequestAnimDict('anim@mp_point', function()
                SetPedConfigFlag(ped, 36, 1)
                TaskMoveNetworkByName(ped, 'task_mp_pointing', 0.5, 0, 'anim@mp_point', 24)
                RemoveAnimDict('anim@mp_point')
            end)
            pointed = true
        else
            RequestTaskMoveNetworkStateTransition(ped, 'Stop')
            if not IsPedInjured(ped) then
                ClearPedSecondaryTask(ped)
            end
            SetPedConfigFlag(ped, 36, 0)
            ClearPedSecondaryTask(ped)
            pointed = false
        end
    end
end)
RegisterKeyMapping('_PointFinger', 'Punta il Dito', 'KEYBOARD', 'B')

-- POLIZIA DI MERDA

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local playerLocalisation = GetEntityCoords(playerPed)
        ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
    end
end)

-- NON BUTTARE DIO PORCO

--[[local pedindex = {}

function SetWeaponDrops() -- This function will set the closest entity to you as the variable entity.
    local handle, ped = FindFirstPed()
    local finished = false -- FindNextPed will turn the first variable to false when it fails to find another ped in the index
    repeat 
        if not IsEntityDead(ped) then
            pedindex[ped] = {}
        end
        finished, ped = FindNextPed(handle) -- first param returns true while entities are found
    until not finished
    EndFindPed(handle)

    for peds,_ in pairs(pedindex) do
        if peds ~= nil then -- set all peds to not drop weapons on death.
            SetPedDropsWeaponsWhenDead(peds, false) 
        end
    end
end]]

--[[Citizen.CreateThread(function()
    
      Citizen.Wait(1)
      -- List of pickup hashes (https://pastebin.com/8EuSv2r1)
      RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
      RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
      RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun
    end
  end)]]

-- NPC SONO TUOI AMICI

-- https://forum.fivem.net/t/how-to-disable-aggressive-npcs-in-sandy-shores/62822/2

--[[local relationshipTypes = {
	'GANG_1',
	'GANG_2',
	'GANG_9',
	'GANG_10',
	'AMBIENT_GANG_LOST',
	'AMBIENT_GANG_MEXICAN',
	'AMBIENT_GANG_FAMILY',
	'AMBIENT_GANG_BALLAS',
	'AMBIENT_GANG_MARABUNTE',
	'AMBIENT_GANG_CULT',
	'AMBIENT_GANG_SALVA',
	'AMBIENT_GANG_WEICHENG',
	'AMBIENT_GANG_HILLBILLY',
	'DEALER',
	'COP',
	'PRIVATE_SECURITY',
	'SECURITY_GUARD',
	'ARMY',
	'MEDIC',
	'FIREMAN',
	'HATES_PLAYER',
	'NO_RELATIONSHIP',
	'SPECIAL',
	'MISSION2',
	'MISSION3',
	'MISSION4',
	'MISSION5',
	'MISSION6',
	'MISSION7',
	'MISSION8'
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(7000)

		for _, group in ipairs(relationshipTypes) do
			SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), GetHashKey(group)) -- could be removed
			SetRelationshipBetweenGroups(1, GetHashKey(group), GetHashKey('PLAYER'))
		end
	end
end)]]