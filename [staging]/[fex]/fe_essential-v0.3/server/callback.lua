local ESX = exports['es_extended']:getSharedObject()

--[[
ESX.RegisterServerCallback('checkSoldi', function(source,cb,soldi)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if xPlayer.getMoney() >= soldi then
            xPlayer.removeMoney(soldi)
            xPlayer.showNotification('Hai pagato '..soldi..'$ con i contanti')
            cb(true)
        else
            if xPlayer.getAccount('bank').money >= soldi then
                xPlayer.removeAccountMoney('bank', soldi)
                xPlayer.showNotification('Hai pagato '..soldi..'$ con la banca')
                cb(true)
            else
                xPlayer.showNotification('Non hai abbastanza soldi', 'error')
                cb(false)
            end
        end
    else 
        cb(false)
    end
end)
]]

ESX.RegisterServerCallback('checkSoldi', function(source,cb,soldi)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if xPlayer.getMoney() >= soldi then
            xPlayer.removeMoney(soldi)
            xPlayer.showNotification('Hai pagato '..soldi..'$ con i contanti')
            cb(true)
        elseif xPlayer.getAccount('bank').money >= soldi then
            xPlayer.removeAccountMoney('bank', soldi)
            xPlayer.showNotification('Hai pagato '..soldi..'$ con la banca')
            cb(true)
        else
            xPlayer.showNotification('Non hai abbastanza soldi', 'error')
            cb(false)
        end
    else 
        cb(false)
    end
end)

ESX.RegisterServerCallback('checkItem', function(source,cb,item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local inveCount = xPlayer.getInventoryItem(item).count
    if inveCount then
        cb(inveCount)
    else
        cb(0)
    end
end)

ESX.RegisterServerCallback('callback:veicolo', function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = xPlayer.identifier,
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)


--[[
    local xPlayer = ESX.GetPlayerFromId(source)
    if type(xPlayer) == "table" then
        MySQL.Async.fetchScalar('SELECT owner FROM owned_vehicles WHERE owner = ? AND plate = ?', {
            xPlayer.identifier,
            plate
        },function(r)
            if type(r) == "table" or r ~= nil then
                cb(true)
            else
                cb(false)
            end
        end)
    else
        cb({})
    end
]]

ESX.RegisterServerCallback('checkPermessi', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        local playerGroup = xPlayer.getGroup()
        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb('user')
        end
    else
        cb('user')
    end
end)

ESX.RegisterServerCallback('checkJobsON', function(source, cb, jobs)
    local playerOnline = ESX.GetPlayers()
    local jobCount = 0
    for i=1, #playerOnline, 1 do
        local xPlayers = ESX.GetPlayerFromId(playerOnline[i])
        if xPlayers.job.name == jobs then
            if source ~= 0 then
                jobCount = jobCount + 1
            end
        end
    end
    cb(jobCount)
end)

ESX.RegisterServerCallback('checkTarget', function(src,cb,target)
    local xTarget = ESX.GetPlayerFromId(target)
    if xTarget then
        cb(xTarget.identifier)
    end
end)