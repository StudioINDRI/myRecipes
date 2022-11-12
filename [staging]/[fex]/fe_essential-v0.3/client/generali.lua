local ESX = exports['es_extended']:getSharedObject()

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

-- Disabilitare la R
Citizen.CreateThread(function()
    while true do
        local SonoLucaR = 500
        if IsPedArmed(PlayerPedId(), 6) then
			SonoLucaR = 5
            DisableControlAction(0, 140, true) 
            DisableControlAction(2, 140, true)
            DisableControlAction(2, 141, true)
            DisableControlAction(2, 142, true)
		end
		DisablePlayerVehicleRewards(PlayerId())
		SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
		Citizen.Wait(SonoLucaR)
    end
end)

local stopShuffle = true
RegisterNetEvent('shuffle:muovi')
AddEventHandler('shuffle:muovi', function()
    stopShuffle = false
    Citizen.Wait(5000)
    stopShuffle = true
end)

Citizen.CreateThread(function()
    while true do
        local CicloShuffle = 700
		if IsPedInAnyVehicle(PlayerPedId(), false) and stopShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), 0) == PlayerPedId() then
                CicloShuffle = 3
				if GetIsTaskActive(PlayerPedId(), 165) then
					SetPedIntoVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), 0)
				end
			end
		end
		Citizen.Wait(CicloShuffle)
    end
end)

--TriggerEvent('shuffle:muovi')

RegisterCommand('pp', function(source)
    TriggerEvent('shuffle:muovi')
end)

-- 

Citizen.CreateThread(function()
	AddTextEntry('FE_THDR_GTAO', '~g~SILKROAD RPG~g~')
	AddTextEntry('PM_PANE_LEAVE', '~m~[~r~Esci Dal Server~w~~m~]')
	AddTextEntry('PM_PANE_QUIT', '~m~[~r~Chiudi FiveM~w~~m~]')
	AddTextEntry('PM_SCR_MAP', '~r~Cartina')
	AddTextEntry('PM_SCR_GAM', '~w~Chiudi gli Occhi')
	AddTextEntry('PM_SCR_INF', '~r~Logs')
	AddTextEntry('PM_SCR_SET', '~r~Impostazioni')
	AddTextEntry('PM_SCR_STA', '~w~Statistiche')
	AddTextEntry('PM_SCR_GAL', '~y~∑ Galleria')
	AddTextEntry('PM_SCR_RPL', '~y~Editor ∑') 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.05) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL50"), 0.7)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.01) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.01) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNUCKLE"), 0.01)
	for i = 1, 12, 1 do
		EnableDispatchService(i, false)
	end
	SetPlayerCanUseCover(PlayerId(), false)
end)
--
