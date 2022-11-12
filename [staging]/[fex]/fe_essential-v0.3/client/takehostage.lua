local takeHostage = {
	allowedWeapons = {
		`WEAPON_PISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_PISTOL_MK2`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_VINTAGEPISTOL`,
	},
	InProgress = false,
	type = "",
	targetSrc = -1,
	agressor = {
		animDict = "anim@gangops@hostage@",
		anim = "perp_idle",
		flag = 49,
	},
	hostage = {
		animDict = "anim@gangops@hostage@",
		anim = "victim_idle",
		attachX = -0.24,
		attachY = 0.11,
		attachZ = 0.0,
		flag = 49,
	}
}

function Testo2D(x,y, width, height, scale, text, r, g, b, a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then
        SetTextOutline()
    end
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width / 2, y - height / 2 + 0.005)
end

local function drawNativeNotification(text, type)
	TriggerEvent('esx:showNotification', text, type)
end

local function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    for _,playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(targetCoords-playerCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end
	if closestDistance ~= -1 and closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

local function ensureAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(0)
        end        
    end
    return animDict
end

RegisterCommand("th",function()
	if takeHostage.type ~= nil and takeHostage.type ~= 'agressor' and takeHostage.type ~= 'hostage' then
		callTakeHostage()
	else
		drawNativeNotification("Azione Impossibile!", 'error')
	end
end)

function callTakeHostage()
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
	local canTakeHostage = false
	for i=1, #takeHostage.allowedWeapons do
		if HasPedGotWeapon(PlayerPedId(), takeHostage.allowedWeapons[i], false) then
			if GetAmmoInPedWeapon(PlayerPedId(), takeHostage.allowedWeapons[i]) > 0 then
				canTakeHostage = true 
				foundWeapon = takeHostage.allowedWeapons[i]
				break
			end 					
		end
	end
	if not canTakeHostage then 
		drawNativeNotification("Non hai un'arma con i colpi", 'error')
	end
	if not takeHostage.InProgress and canTakeHostage then			
		local closestPlayer = GetClosestPlayer(3)
		if closestPlayer then
			local targetSrc = GetPlayerServerId(closestPlayer)
			if targetSrc ~= -1 then
				SetCurrentPedWeapon(PlayerPedId(), foundWeapon, true)
				takeHostage.InProgress = true
				takeHostage.targetSrc = targetSrc
				TriggerServerEvent("TakeHostage:sync",targetSrc)
				ensureAnimDict(takeHostage.agressor.animDict)
				takeHostage.type = "agressor"
				InitTakeHostage()
			else
				drawNativeNotification("Nessuno nelle vicinanze", 'error')
			end
		else
			drawNativeNotification("Nessuno nelle vicinanze", 'error')
		end
	end
end 

RegisterNetEvent("TakeHostage:syncTarget")
AddEventHandler("TakeHostage:syncTarget", function(target)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	takeHostage.InProgress = true
	ensureAnimDict(takeHostage.hostage.animDict)
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, takeHostage.hostage.attachX, takeHostage.hostage.attachY, takeHostage.hostage.attachZ, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
	takeHostage.type = "hostage" 
	InitTakeHostage()
end)

RegisterNetEvent("TakeHostage:releaseHostage")
AddEventHandler("TakeHostage:releaseHostage", function()
	takeHostage.InProgress = false 
	takeHostage.type = ""
	DetachEntity(PlayerPedId(), true, false)
	ensureAnimDict("reaction@shove")
	TaskPlayAnim(PlayerPedId(), "reaction@shove", "shoved_back", 8.0, -8.0, -1, 0, 0, false, false, false)
	Wait(250)
	ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent("TakeHostage:killHostage")
AddEventHandler("TakeHostage:killHostage", function()
	takeHostage.InProgress = false 
	takeHostage.type = ""
	SetEntityHealth(PlayerPedId(),0)
	DetachEntity(PlayerPedId(), true, false)
	ensureAnimDict("anim@gangops@hostage@")
	TaskPlayAnim(PlayerPedId(), "anim@gangops@hostage@", "victim_fail", 8.0, -8.0, -1, 168, 0, false, false, false)
end)

RegisterNetEvent("TakeHostage:cl_stop")
AddEventHandler("TakeHostage:cl_stop", function()
	takeHostage.InProgress = false
	takeHostage.type = "" 
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

function InitTakeHostage()
	Citizen.CreateThread(function()
		while true do
			if takeHostage.type == "agressor" then
				DisableControlAction(0,24,true)
				DisableControlAction(0,25,true)
				DisableControlAction(0,47,true)
				DisableControlAction(0,58,true)
				DisableControlAction(0,21,true)
				DisablePlayerFiring(PlayerPedId(),true)
				Testo2D(0.87, 1.44, 1.0, 1.0, 0.4, 'Premi ~g~[G]~w~ per rilasciare, ~g~[H]~w~ per uccidere', 255, 255, 255, 255, true)
				if not IsEntityPlayingAnim(PlayerPedId(), takeHostage.agressor.animDict, takeHostage.agressor.anim, 3) then
					TaskPlayAnim(PlayerPedId(), takeHostage.agressor.animDict, takeHostage.agressor.anim, 8.0, -8.0, 100000, takeHostage.agressor.flag, 0, false, false, false)
				end
				if IsEntityDead(PlayerPedId()) then	
					takeHostage.type = ""
					takeHostage.InProgress = false
					ensureAnimDict("reaction@shove")
					TaskPlayAnim(PlayerPedId(), "reaction@shove", "shove_var_a", 8.0, -8.0, -1, 168, 0, false, false, false)
					TriggerServerEvent("TakeHostage:releaseHostage", takeHostage.targetSrc)
				end 
				if IsDisabledControlJustPressed(0,47) then --release	
					takeHostage.type = ""
					takeHostage.InProgress = false 
					ensureAnimDict("reaction@shove")
					TaskPlayAnim(PlayerPedId(), "reaction@shove", "shove_var_a", 8.0, -8.0, -1, 168, 0, false, false, false)
					TriggerServerEvent("TakeHostage:releaseHostage", takeHostage.targetSrc)
					Citizen.Wait(250)
					ClearPedTasks(GetPlayerPed(-1))
				elseif IsDisabledControlJustPressed(0,74) then --kill 			
					takeHostage.type = ""
					takeHostage.InProgress = false 		
					ensureAnimDict("anim@gangops@hostage@")
					TaskPlayAnim(PlayerPedId(), "anim@gangops@hostage@", "perp_fail", 8.0, -8.0, -1, 168, 0, false, false, false)
					TriggerServerEvent("TakeHostage:killHostage", takeHostage.targetSrc)
					TriggerServerEvent("TakeHostage:stop",takeHostage.targetSrc)
					Wait(100)
					SetPedShootsAtCoord(PlayerPedId(), 0.0, 0.0, 0.0, 0)
					Citizen.Wait(250)
					ClearPedTasks(GetPlayerPed(-1))
				end
			elseif takeHostage.type == "hostage" then
				DisableControlAction(0,21,true)
				DisableControlAction(0,24,true)
				DisableControlAction(0,25,true)
				DisableControlAction(0,47,true)
				DisableControlAction(0,58,true)
				DisableControlAction(0,263,true)
				DisableControlAction(0,264,true)
				DisableControlAction(0,257,true)
				DisableControlAction(0,140,true)
				DisableControlAction(0,141,true)
				DisableControlAction(0,142,true)
				DisableControlAction(0,143,true)
				DisableControlAction(0,75,true)
				DisableControlAction(27,75,true)
				DisableControlAction(0,22,true)
				DisableControlAction(0,32,true)
				DisableControlAction(0,268,true)
				DisableControlAction(0,33,true)
				DisableControlAction(0,269,true)
				DisableControlAction(0,34,true)
				DisableControlAction(0,270,true)
				DisableControlAction(0,35,true)
				DisableControlAction(0,271,true)
				if not IsEntityPlayingAnim(PlayerPedId(), takeHostage.hostage.animDict, takeHostage.hostage.anim, 3) then
					TaskPlayAnim(PlayerPedId(), takeHostage.hostage.animDict, takeHostage.hostage.anim, 8.0, -8.0, 100000, takeHostage.hostage.flag, 0, false, false, false)
				end
			else
				return
			end
			Wait(5)
		end
	end)
end