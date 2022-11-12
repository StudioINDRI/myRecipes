meleeAnim = {dict="anim@melee@switchblade@holster",anim="unholster"}
meleeAnim2 = {dict="anim@melee@switchblade@holster",anim="holster"}
pistolAnim = {dict="reaction@intimidation@1h",anim="intro"}
pistolAnim2 = {dict="reaction@intimidation@1h",anim="outro"}
copPistolAnim = {dict="reaction@intimidation@cop@unarmed",anim="intro"}
copPistolAnim2 = {dict="rcmjosh4",anim="josh_leadout_cop2"}
copPistolAnimOut = {dict="reaction@intimidation@cop@unarmed",anim="outro"}
rifleAnim = {dict="anim@heists@money_grab@duffel",anim="enter"}

melee = {
	"WEAPON_KNIFE", 
	"WEAPON_NIGHTSTICK", 
	"WEAPON_HAMMER", 
	"WEAPON_CROWBAR",
	"WEAPON_DAGGER", 
	"WEAPON_KNUCKLE", 
	"WEAPON_BOTTLE", 
	"WEAPON_FLARE", 
	"WEAPON_FLASHLIGHT",
	"WEAPON_MOLOTOV"
}

pistols = {
	"WEAPON_PISTOL", 
	"WEAPON_GLOCK",
	"WEAPON_COMBATPISTOL", 
	"WEAPON_APPISTOL", 
	"WEAPON_PISTOL50",
	"WEAPON_STUNGUN", 
	"WEAPON_SNSPISTOL", 
	"WEAPON_HEAVYPISTOL", 
	"WEAPON_FLAREGUN", 
	"WEAPON_VINTAGEPISTOL", 
  	"WEAPON_REVOLVER", 
  	"WEAPON_DOUBLEACTION",
  	"WEAPON_MICROSMG",
  	"WEAPON_MINISMG",
  	"WEAPON_MACHINEPISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_REVOLVER_MK2"
}

rifles = {
	"WEAPON_BAT", 
  	"WEAPON_GOLFCLUB", 
  	"WEAPON_FIREEXTINGUISHER",  
	--"WEAPON_NIGHTSTICK", 
  	"WEAPON_PETROLCAN",
  	"WEAPON_MACHETE", 
  	"WEAPON_DBSHOTGUN", 
  	"WEAPON_COMPACTRIFLE",
  	"WEAPON_HEAVYSHOTGUN", 
  	"WEAPON_GUSENBERG", 
  	"WEAPON_COMBATPDW",
  	"WEAPON_MUSKET",
  	"WEAPON_BULLPUPSHOTGUN",  
  	"WEAPON_PUMPSHOTGUN", 
  	"WEAPON_SAWNOFFSHOTGUN", 
  	"WEAPON_SMG", 
  	"WEAPON_ASSAULTSMG", 
  	"WEAPON_ASSAULTRIFLE", 
  	"WEAPON_CARBINERIFLE",
  	"WEAPON_MILITARYRIFLE",	
	"WEAPON_SMG_MK2",
	"WEAPON_CARBINERIFLE_MK2", 
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_SPECIALCARBINE",
}

CopBelts = {
	
}

-- Inizio Script
local ESX = exports['es_extended']:getSharedObject()
local stopAnimTime = -1
local delayWeaponEquip = -1
local delayWeaponHide = -1
local currentAnim = false
local holstered = false
local currentWeapon = GetHashKey("WEAPON_UNARMED")
local animPolizia = false
local PlayerData = ESX.GetPlayerData()

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  	PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(plData)
	Citizen.Wait(2000)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		animPolizia = true
	end
end)

function playAnim(anim, speed, speedMulitplier, duration, flag, showWeapon, hideWeapon, last)
	currentAnim = anim
	checkCurrentAnimazione()
	Citizen.CreateThread(function()
		RequestAnimDict(anim.dict)
		while not HasAnimDictLoaded(anim.dict) do Wait(0) end
		TaskPlayAnim(PlayerPedId(), anim.dict, anim.anim, speed, speedMulitplier, -1, flag, 0.2, 0, 0, 0)
		if hideWeapon and last then
			delayWeaponHide = hideWeapon
			GiveWeaponToPed(PlayerPedId(), last, 0, false, true)
		elseif showWeapon then
			SetPedCurrentWeaponVisible(PlayerPedId(), false, false, 0, 0)
			delayWeaponEquip = showWeapon
		end
		stopAnimTime = duration + GetGameTimer()
	end)
end

function removeFromHolster()
	Citizen.CreateThread(function()
		currentWeapon = GetSelectedPedWeapon(PlayerPedId())
		playAnim(copPistolAnim, 8.0, 2.0, 200, 50, 2.0)
		Wait(200)
		playAnim(copPistolAnim2, 8.0, 2.0, 200, 48, 10.0)
	end)
end

function checkMelee()
	for k, weapon in pairs(melee) do
		if GetHashKey(weapon) == GetSelectedPedWeapon(PlayerPedId()) then
			playAnim(meleeAnim, 8.0, 8.0, 1000, 50, 0.2)
			currentWeapon = GetSelectedPedWeapon(PlayerPedId())
			return true
		end
	end
	return false
end

function checkPistol()
	for k, weapon in pairs(pistols) do
		if GetHashKey(weapon) == GetSelectedPedWeapon(PlayerPedId()) then
			if animPolizia then
				removeFromHolster()
				Wait(50)
			else
				playAnim(pistolAnim, 8.0, 8.0, 1800, 50, 0.325, 1200)
				currentWeapon = GetSelectedPedWeapon(PlayerPedId())
			end
			return true
		end
	end
	return false
end

function checkRifle()
	for k, weapon in pairs(rifles) do
		if GetHashKey(weapon) == GetSelectedPedWeapon(PlayerPedId()) then
			playAnim(rifleAnim, 8.0, 8.0, 600, 48, 0.5)
			currentWeapon = GetSelectedPedWeapon(PlayerPedId())
			return true
		end
	end
	return false
end

function RunWeaponDraw()
	if not checkMelee() then
		if not checkPistol() then
			checkRifle()
		end
	end
end

function RunWeaponHolster()
	local last = currentWeapon
	currentWeapon = GetSelectedPedWeapon(PlayerPedId())
	for k, weapon in pairs(melee) do
		if GetHashKey(weapon) == last then
			playAnim(meleeAnim, 8.0, 8.0, 1000, 50, 0.2)
			return
		end
	end
	for k, weapon in pairs(pistols) do
		if GetHashKey(weapon) == last then
			if animPolizia then
				playAnim(copPistolAnim, 8.0, 8.0, 400, 50, 0.2, false, 200, GetHashKey(weapon))
			else
				playAnim(pistolAnim2, 8.0, 8.0, 1800, 50, 0.2, false, 1700, GetHashKey(weapon))
			end
			return
		end
	end
	for k, weapon in pairs(rifles) do
		if GetHashKey(weapon) == last then
			playAnim(rifleAnim, 8.0, 8.0, 600, 48, 0.5)
			return
		end
	end
end

function RunCopHolster()
	Citizen.CreateThread(function()
		if not IsEntityPlayingAnim(PlayerPedId(), "move_m@intimidation@cop@unarmed", "idle", 3) then
			RequestAnimDict("move_m@intimidation@cop@unarmed")
			while not HasAnimDictLoaded("move_m@intimidation@cop@unarmed") do Wait(0) end
			TaskPlayAnim(PlayerPedId(), "move_m@intimidation@cop@unarmed", "idle", 8.0, 2.5, -1, 49, 0.0, 0, 0, 0)
			holstered = true
		end
		if IsControlJustPressed(0, 25) then
			GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), 0, false, true)
			holstered = false
		end
	end)
end

function checkTimers()
	if delayWeaponEquip ~= -1 and delayWeaponEquip <= GetGameTimer() then
		SetPedCurrentWeaponVisible(PlayerPedId(), true, false, 0, 0)
		delayWeaponEquip = -1
	end
	if delayWeaponHide ~= -1 and delayWeaponHide <= GetGameTimer() then
		GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), 0, false, true)
		delayWeaponHide = -1
	end
	if stopAnimTime ~= -1 and stopAnimTime <= GetGameTimer() then
		ClearPedTasks(PlayerPedId())
		--ClearPedSecondaryTask(PlayerPedId())
		stopAnimTime = -1
		currentAnim = false
		checkCurrentAnimazione()
	end
end

function checkCurrentAnimazione()
	Citizen.CreateThread(function()
		while true do
			local CicloArma2 = 250
			if currentAnim ~= false then
				CicloArma2 = 5
				DisableControlAction(0, 37, true)
				DisableControlAction(0, 24, true)
				DisableControlAction(0, 25, true)
				DisablePlayerFiring(PlayerPedId(), true)
			else
				return
			end
			Citizen.Wait(CicloArma2)
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		local CicloArma = 500
		if GetPedParachuteState(PlayerPedId()) == -1 then
			local CicloArma = 80
			if currentWeapon ~= GetSelectedPedWeapon(PlayerPedId()) and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_UNARMED") and not IsPedInAnyVehicle(PlayerPedId(), true) and not currentAnim then
				RunWeaponHolster()
			elseif currentWeapon ~= GetSelectedPedWeapon(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), true) and not currentAnim then
				RunWeaponDraw()
			end
			if animPolizia and IsControlPressed(0, 74) and not IsControlJustReleased(0, 74) and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_UNARMED") and not IsPedInAnyVehicle(PlayerPedId(), true) and HasPedGotWeapon(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL")) then
				RunCopHolster()
			end
			if animPolizia and IsControlJustReleased(0, 74) and holstered then
				Wait(50)
				holstered = false
				ClearPedTasks(PlayerPedId())
			end
			if delayWeaponEquip ~= -1 or delayWeaponHide ~= -1 or stopAnimTime ~= -1 then
				checkTimers()
			end
		end
		Citizen.Wait(CicloArma)
	end
end)