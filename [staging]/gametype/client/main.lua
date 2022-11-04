--creiamo una variabile (locale) per immagazzinare i dati delle coordinate di spawn desiderate
local spawnPos = vector3(-546.7599, -1293.6597, 26.8970)

--impostiamo un gestore di eventi per l'evento 'onClientGameTypeStart' (inizio partita)
AddEventHandler('onClientGameTypeStart', function() --evento: inizio partita
--richama lo spawn in caso di morte
		exports.spawnmanager:setAutoSpawnCallback(function()
--effettua lo spawn del giocatore        
				exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            
            --model = 'a_m_y_dhill_01'
            --model = 'u_m_y_zombie_01'
            --model = 'u_m_y_croupthief_01'
            model = 'u_m_m_streetart_01' 
            --model = 's_m_y_airworker'
            --model = 's_m_y_construct_01'
            --model = 'u_m_y_corpse_01'
        })
    end)

    exports.spawnmanager:setAutoSpawn(true) --abilita l'auto-spawn (all'esecuzione del codice)
    exports.spawnmanager:forceRespawn() --forza lo spawn (all'esecuzione del codice)
end)

RegisterCommand('car', function(source, args)

    local vehicleName = args[1] or 'adder'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = {'' .. vehicleName .. ''}
        })

        return
    end

    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Wait(500)
    end

    local playerPed = PlayerPedId() 
    local pos = GetEntityCoords(playerPed)

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetEntityAsNoLongerneeded(vehicle)
    SetModelAsNoLongerneeded(vehicleName)


    TriggerEvent('chat:addMessage', {
        args = { 'wow! goditi la tua ' .. (args[1] or 'adder') .. 'fiammante! ' }
    })
end, false)