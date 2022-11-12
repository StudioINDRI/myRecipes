local ESX = exports['es_extended']:getSharedObject()

RegisterCommand('me', function(source, args)
    TriggerClientEvent('3dme:shareDisplay', -1, table.concat(args, " "), source)
end)