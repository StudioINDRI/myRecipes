local ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('fex_wl001:raccogli')
AddEventHandler('fex_wl001:raccogli',function(item, count, notifica)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addInventoryItem(item, count)
        --if notifica then
           -- xPlayer.showNotification(notifica..' '..ESX.GetItemLabel(item)..'')
        --end
    end
end)

RegisterServerEvent('fex_wl001:processa')
AddEventHandler('fex_wl001:processa',function(item, count, excangeItem, notifica)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local itemCount = tonumber(xPlayer.getInventoryItem(excangeItem).count)
        if itemCount >= 1 then
            xPlayer.removeInventoryItem(excangeItem, 1)
            --xPlayer.removeInventoryItem(excangeItem, count)
            xPlayer.addInventoryItem(item, 1)
           -- if notifica then
               -- xPlayer.showNotification(notifica..' '..ESX.GetItemLabel(excangeItem)..' in '..ESX.GetItemLabel(item)..'')
           -- end
        else
            xPlayer.showNotification('Non hai abbastanza '..ESX.GetItemLabel(excangeItem)..'', 'error')
        end
    end
end)