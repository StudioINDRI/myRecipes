
local Cam = -1
Invisibile = false
InScenario = false
modalitacinema = false


RegisterNetEvent('sidev:spawnloading-invisibilitamenu')
AddEventHandler('sidev:spawnloading-invisibilitamenu', function()
    SetEntityVisible(PlayerPedId(), false, false)
    Invisibile = true
    modalitacinema = true
end)

RegisterNetEvent("sidev:attivascrittainiziale")
AddEventHandler("sidev:attivascrittainiziale", function()
	SendNUIMessage({
        action = "open",
    })
end)


RegisterNetEvent("sidev:disattivascrittainiziale")
AddEventHandler("sidev:disattivascrittainiziale", function()
    SendNUIMessage({
        action = "close",
    })
end)
--------------------------------------------------------------------- DEVELOPER MODE



--[[RegisterCommand("as", function()
    --SpawnaVeicoloLamar()
        
    TriggerEvent("si-spawnloading:Start")
   -- PanoramicaVineWood()
end)


RegisterCommand("ds", function()
        
    SendNUIMessage({
        action = "close",
    })
    modalitacinema = false
    Invisibile = false
    InScenario = false
    SetEntityVisible(PlayerPedId(), true, false)
end)]]



--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local tempo = GetCutsceneTime()
        if IsControlJustPressed(0, 38) then
          TriggerEvent('si-spawnloading:Start')
          InScenario = true
        end
    end
end)]]--

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if InScenario == true then
            tempo = 0
            newtempo = tempo + 1
            tempo = newtempo
            print(newtempo)
        end
    end
end)]]--
            

--[[  Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local tempo = GetCutsceneTime()
        if InScenario == true then
            print(tempo)
           -- PanoramicaVineWood()
           -- SpawnaVeicoloLamar()
        end
    end
end) ]]-------------------------------------------------------------------- DEVELOPER MODE

local sub_b0b5 = {
    [0] = "MP_Plane_Passenger_1",
    [1] = "MP_Plane_Passenger_2",
    [2] = "MP_Plane_Passenger_3",
    [3] = "MP_Plane_Passenger_4",
    [4] = "MP_Plane_Passenger_5",
    [5] = "MP_Plane_Passenger_6",
    [6] = "MP_Plane_Passenger_7"
}

function sub_b747(ped, a_1)
    if a_1 == 0 then
        SetPedComponentVariation(ped, 0, 21, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 9, 0, 0)
        SetPedComponentVariation(ped, 3, 1, 0, 0)
        SetPedComponentVariation(ped, 4, 9, 0, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 4, 8, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 15, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 10, 0, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 1 then
        SetPedComponentVariation(ped, 0, 13, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 5, 4, 0)
        SetPedComponentVariation(ped, 3, 1, 0, 0)
        SetPedComponentVariation(ped, 4, 10, 0, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 10, 0, 0)
        SetPedComponentVariation(ped, 7, 11, 2, 0)
        SetPedComponentVariation(ped, 8, 13, 6, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 10, 0, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 2 then
        SetPedComponentVariation(ped, 0, 15, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 1, 4, 0)
        SetPedComponentVariation(ped, 3, 1, 0, 0)
        SetPedComponentVariation(ped, 4, 0, 1, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 1, 7, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 2, 9, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 6, 0, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 3 then
        SetPedComponentVariation(ped, 0, 14, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 5, 3, 0)
        SetPedComponentVariation(ped, 3, 3, 0, 0)
        SetPedComponentVariation(ped, 4, 1, 6, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 11, 5, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 2, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 3, 12, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 4 then
        SetPedComponentVariation(ped, 0, 18, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 15, 3, 0)
        SetPedComponentVariation(ped, 3, 15, 0, 0)
        SetPedComponentVariation(ped, 4, 2, 5, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 4, 6, 0)
        SetPedComponentVariation(ped, 7, 4, 0, 0)
        SetPedComponentVariation(ped, 8, 3, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 4, 0, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 5 then
        SetPedComponentVariation(ped, 0, 27, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 7, 3, 0)
        SetPedComponentVariation(ped, 3, 11, 0, 0)
        SetPedComponentVariation(ped, 4, 4, 8, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 13, 14, 0)
        SetPedComponentVariation(ped, 7, 5, 3, 0)
        SetPedComponentVariation(ped, 8, 3, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 2, 7, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 6 then
        SetPedComponentVariation(ped, 0, 16, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 15, 1, 0)
        SetPedComponentVariation(ped, 3, 3, 0, 0)
        SetPedComponentVariation(ped, 4, 5, 6, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 2, 8, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 2, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 3, 7, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    end
end


RegisterNetEvent('si-spawnloading:Start')
AddEventHandler('si-spawnloading:Start', function()
    TriggerEvent("sidev:attivascrittainiziale")
    modalitacinema = true
    Invisibile = true
    local plyrId = PlayerPedId() 
    -----------------------------------------------
	if IsMale(plyrId) then
		RequestCutsceneWithPlaybackList("MP_INTRO_CONCAT", 31, 8)
	else	
		RequestCutsceneWithPlaybackList("MP_INTRO_CONCAT", 103, 8)
	end
    while not HasCutsceneLoaded() do Wait(10) end 
	if IsMale(plyrId) then
		RegisterEntityForCutscene(0, 'MP_Male_Character', 3, GetEntityModel(PlayerPedId()), 0)
		RegisterEntityForCutscene(PlayerPedId(), 'MP_Male_Character', 0, 0, 0)
		SetCutsceneEntityStreamingFlags('MP_Male_Character', 0, 1) 
		local female = RegisterEntityForCutscene(0,"MP_Female_Character",3,0,64) 
		NetworkSetEntityInvisibleToNetwork(female, true)
	else
		RegisterEntityForCutscene(0, 'MP_Female_Character', 3, GetEntityModel(PlayerPedId()), 0)
		RegisterEntityForCutscene(PlayerPedId(), 'MP_Female_Character', 0, 0, 0)
		SetCutsceneEntityStreamingFlags('MP_Female_Character', 0, 1) 
		local male = RegisterEntityForCutscene(0,"MP_Male_Character",3,0,64) 
		NetworkSetEntityInvisibleToNetwork(male, true)
	end
	local ped = {}
	for v_3=0, 6, 1 do
		if v_3 == 1 or v_3 == 2 or v_3 == 4 or v_3 == 6 then
			ped[v_3] = CreatePed(26, `mp_f_freemode_01`, -1117.77783203125, -1557.6248779296875, 3.3819, 0.0, 0, 0)
		else
			ped[v_3] = CreatePed(26, `mp_m_freemode_01`, -1117.77783203125, -1557.6248779296875, 3.3819, 0.0, 0, 0)
		end
        if not IsEntityDead(ped[v_3]) then
			sub_b747(ped[v_3], v_3)
            FinalizeHeadBlend(ped[v_3])
            RegisterEntityForCutscene(ped[v_3], sub_b0b5[v_3], 0, 0, 64)
        end
    end
	
	NewLoadSceneStartSphere(-1212.79, -1673.52, 7, 1000, 0)
    -----------------------------------------------
    SetWeatherTypeNow("EXTRASUNNY")
    StartCutscene(4)
    Wait(70600)
   --Wait(1000)
   
	for v_3=0, 6, 1 do
		DeleteEntity(ped[v_3])
	end
    DoScreenFadeOut(300)
    Wait(400)
    StopCutsceneImmediately()
    SetEntityCoords(PlayerPedId(), -1033.52, -2729.88, 20.1)
    SpawnaVeicoloLamar()
end)

--[[TriggerEvent("sidev:attivascrittainiziale")
    SetEntityCoords(PlayerPedId(),-1060.1, -2721.69, 13.75)
    SetEntityHeading(PlayerPedId(), 238.12)
    Wait(500)
    local plyrId = PlayerPedId() -- ID DU JOUEURS
    local playerClone = ClonePed_2(plyrId, 0.0, false, true, 1) ----
    -----------------------------------------------
    RequestCutscene("mp_intro_concat", 8) ---- REQUEST la custscene
    while not HasCutsceneLoaded() do Wait(10) end --- attente que la cutscene se load
    DoScreenFadeIn(250) --- ecran blanc de 250 milliseconde
    SetCutsceneEntityStreamingFlags('MP_Male_Character', 0, 1) 
    local female = RegisterEntityForCutscene(0,"MP_Female_Character",3,0,64) ------------ REMPLACER PAR VOTRE JOUEUR
    RegisterEntityForCutscene(PlayerPedId(), 'MP_Male_Character', 0, GetEntityModel(PlayerPedId()), 64)
    GetEntityIndexOfCutsceneEntity('MP_Female_Character', GetHashKey(GetEntityModel('MP_Female_Character')))
    NetworkSetEntityInvisibleToNetwork(female, true)
    -----------------------------------------------
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_1", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_3", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_4", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_5", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_6", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_7", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_1', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_2', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_3', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_4', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_5', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_6', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_7', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    ---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_1', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_3', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_4', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_5', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_6', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_7', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    NewLoadSceneStartSphere(-1212.79, -1673.52, 7, 1000, 0) ----- eviter les bugs de texture
    -----------------------------------------------
    SetWeatherTypeNow("EXTRASUNNY") ---- TEMPS SOLEIL
    StartCutscene(9) --- START la custscene
    Wait(70600)
   -- Wait(1000)
    DoScreenFadeOut(300)
    Wait(400)
    StopCutsceneImmediately()
    Invisibile = true
    SetEntityCoords(PlayerPedId(), -1033.52, -2729.88, 20.1)
    SpawnaVeicoloLamar()]]--

function SpawnaVeicoloLamar()
    SetEntityVisible(PlayerPedId(), false, false)
    local veicolo = "emperor"
    local HashVeh = GetHashKey(veicolo)
    RequestModel(HashVeh)
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(HashVeh) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                ShowNotification("~r~Troppo tempo a caricare l'auto.")
                break
            end
        end
        local veh = CreateVehicle(HashVeh, -1033.55, -2730.68, 19.56, 241.03, false, true)
        Wait(500)
        SetVehicleNumberPlateText(veh, "SILKROAD RPG")
        SetVehicleModColor_1(veh,3,0,0)
        SetVehicleModColor_2(veh,3,0,0)
        RequestModel(0x65B93076)
        while not HasModelLoaded(0x65B93076) do
            Wait(0)
        end
        local Lamar = CreatePedInsideVehicle(veh, 0, 0x65B93076, -1, false, false)
        --TaskWarpPedIntoVehicle(ClonaPlayer, veh, 0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, 0)
        TaskWarpPedIntoVehicle(Lamar, veh, -1)
        SetVehicleEngineOn(veh, true, true)
        Wait(500)
        NetworkSetEntityInvisibleToNetwork(Lamar, true)
        TaskVehicleDriveToCoordLongrange(Lamar, veh, 277.95, -106.26, 69.4, 200.0, 5, nil)
        Wait(200)
        DoScreenFadeIn(500)
        Wait(42000)
        DoScreenFadeOut(300)
        Wait(300)
        PanoramicaCitta()
        DeleteVehicle(veh)
        DeleteEntity(Lamar)
      --  DeleteEntity(ClonaPlayer)
    end)
end

function PanoramicaCitta()
    SetEntityVisible(PlayerPedId(), false, false)
    RequestCutscene("ah_3a_explosion", 8) 
    while not HasCutsceneLoaded() do Wait(100) end
    StartCutscene(9)
    DoScreenFadeIn(100)
    NewLoadSceneStartSphere(121.48, -637.03, 7, 1000, 0)
    Wait(11000)
    DoScreenFadeOut(300)
    Wait(300)
    IntermezzoVeicoloLamar()
end

function IntermezzoVeicoloLamar()
    SetEntityVisible(PlayerPedId(), false, false)
   -- local ClonaPlayer = ClonePed_2(PlayerPedId(), 0.0, false, true, 1)
    local veicolo = "emperor"
    local HashVeh = GetHashKey(veicolo)
    RequestModel(HashVeh)
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(HashVeh) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                ShowNotification("~r~Troppo tempo a caricare l'auto.")
                break
            end
        end
        local veh = CreateVehicle(HashVeh, 27.46, -302.02, 46.83, 338.72, false, true)
        SetVehicleNumberPlateText(veh, "SILKROAD RPG")
        SetVehicleModColor_1(veh,3,0,0)
        SetVehicleModColor_2(veh,3,0,0)
        RequestModel(0x65B93076)
        while not HasModelLoaded(0x65B93076) do
            Wait(0)
        end
        local Lamar = CreatePedInsideVehicle(veh, 0, 0x65B93076, -1, false, false)
       -- TaskWarpPedIntoVehicle(ClonaPlayer, veh, 0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, 0)
        TaskWarpPedIntoVehicle(Lamar, veh, -1)
        SetVehicleEngineOn(veh, true, true)
        NetworkSetEntityInvisibleToNetwork(Lamar, true)
        TaskVehicleDriveToCoordLongrange(Lamar, veh, -1065.72, 265.94, 63.37, 200.0, 5, nil)
        Wait(500)
        DoScreenFadeIn(500)
        Wait(42000)
        DoScreenFadeOut(500)
        Wait(500)
        PanoramicaVineWood()
        DeleteVehicle(veh)
        DeleteEntity(Lamar)
      --  DeleteEntity(ClonaPlayer)
    end)
end

function PanoramicaVineWood()
    NewLoadSceneStartSphere(696.32, 935.61, 7, 1000, 0)
    DoScreenFadeIn(100)
    local camX = 696.32
    local camY = 935.61
    local camZ = 347.42
    local camHeading = 347.92
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if(not DoesCamExist(cam)) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, true)
        SetCamCoord(cam, camX, camY, camZ)
        SetCamRot(cam, 0.0, 0.0, camHeading)
    end
    Wait(4000)
    DoScreenFadeOut(100)
    Wait(100)    
    UltimoTraggitto()
    RenderScriptCams(false, true, 250, 1, 0)
    DestroyCam(cam, false)
end

function IsMale(ped)
	if IsPedModel(ped, 'mp_m_freemode_01') then
		return true
	else
		return false
	end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Invisibile == true then
            SetEntityLocallyVisible(GetPlayerPed(-1))
            DisableAllControlActions(0)
            if IsPedInAnyVehicle(PlayerPedId(), true) then
                SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()), -1)
                SetRadioStationMusicOnly("OFF", 1)
                DisplayRadar(true)
                local veh = GetVehiclePedIsIn(PlayerPedId())
                for _, i in ipairs(GetActivePlayers()) do
                    if i ~= PlayerId() then
                        local closestPlayerPed = GetPlayerPed(i)
                        local veicolo2 = GetVehiclePedIsIn(closestPlayerPed, false)
                        SetEntityNoCollisionEntity(veh, veicolo2, true)
                        SetEntityNoCollisionEntity(veicolo2, veh, true)
                    end
                end
            end
        end
        if ProntoAlloSpawn == true then
            EnableAllControlActions()
            TriggerEvent('mt:missiontext', "Press ~g~[F]~w~ to get out of the vehicle", 1)
            if IsControlJustPressed(0, 23) then
                Invisibile = false
                modalitacinema = false
                TriggerEvent("sidev:disattivascrittainiziale")
                ProntoAlloSpawn = false

                break
            end
        end
    end
end)

RegisterNetEvent("mt:missiontext")
AddEventHandler("mt:missiontext", function(text, time)
        ClearPrints()
        SetTextEntry_2("STRING")
        AddTextComponentString(text)
        DrawSubtitleTimed(time, 1)
end)
            

--[[function SpawnaInHotel()
    TriggerEvent("sidev:disattivascrittainiziale")
    Invisibile = false
    modalitacinema = false
    SetEntityCoords(PlayerPedId(),-1060.1, -2721.69, 13.75) 
    SetEntityHeading(PlayerPedId(), 238.12)
    DoScreenFadeIn(100) 
    Wait(100)
end]]--



function UltimoTraggitto()
    --local ClonaPlayer = ClonePed_2(PlayerPedId(), 0.0, false, true, 1)
    local veicolo = "emperor"
    local HashVeh = GetHashKey(veicolo)
    RequestModel(HashVeh)
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(HashVeh) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                ShowNotification("~r~Troppo tempo a caricare l'auto.")
                break
            end
        end
        local veh = CreateVehicle(HashVeh, 139.44, -1371.96, 28.88, 56.52, false, true)
        SetVehicleNumberPlateText(veh, "SILKROAD RPG")
        SetVehicleModColor_1(veh,3,0,0)
        SetVehicleModColor_2(veh,3,0,0)
        RequestModel(0x65B93076)
        while not HasModelLoaded(0x65B93076) do
            Wait(0)
        end
        local Lamar = CreatePedInsideVehicle(veh, 0, 0x65B93076, -1, false, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, 0)
        TaskWarpPedIntoVehicle(Lamar, veh, -1)
        SetVehicleEngineOn(veh, true, true)
        NetworkSetEntityInvisibleToNetwork(Lamar, true)
        DoScreenFadeIn(100)
        TaskVehicleDriveToCoordLongrange(Lamar, veh, 112.56,-1347.68, 28.84, 200.0, 5, 6.5)
        Wait(4500)
        ProntoAlloSpawn = true
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                if ProntoAlloSpawn == false then
                    Wait(1000)
                    TaskVehicleDriveToCoordLongrange(Lamar, veh, -1065.72, 265.94, 63.37, 200.0, 5, nil)
                    SetEntityVisible(PlayerPedId(), true, false)
                    Citizen.Wait(60000)
                    DeleteVehicle(veh)
                    DeleteEntity(Lamar)
                else
                    Citizen.Wait(0)
                end
            end
        end)
    end)
end