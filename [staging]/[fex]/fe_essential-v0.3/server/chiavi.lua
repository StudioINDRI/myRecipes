ESX.RegisterServerCallback('nexus_custom:callbackChiavi', function(source, cb, plate, idTarget)
    local src = source
    if idTarget then
        src = idTarget
    end
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then
        MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
            ['@owner'] = xPlayer.identifier,
            ['@plate'] = plate
        }, function(result)
            cb(result[1] ~= nil)
        end)
    else 
        cb(false)
    end
end)