ESX             = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("bike:pay", price, bike)
AddEventHandler("bike:pay", function(price, bike)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= price then 
        xPlayer.removeMoney(price)
        TriggerClientEvent("bike:payed", source, bike)
    else
        xPlayer.showNotification(Config.NoMoney)
        TriggerClientEvent("bike:close", source)
    end
end)