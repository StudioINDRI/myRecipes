ESX = nil

TriggerEvent(Config.Shared, function(obj)
	ESX = obj
end)

ESX.RegisterServerCallback('qp_garage:loadVehicles', function(source, cb)
	local ownedCars = {}
	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `owner` = @owner AND `stored` = 1', {['@owner'] = x.identifier}, function(vehicles)

		for _,v in pairs(vehicles) do
			--if v.job == nil then
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedCars, {vehicle = vehicle, stored = v.stored, plate = v.plate})
			--end
		end
		cb(ownedCars)
	end)
end)

ESX.RegisterServerCallback('qp_garage:loadVehicle', function(source, cb, plate)
	
	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `plate` = @plate', {['@plate'] = plate}, function(vehicle)

		
		cb(vehicle)
	end)
end)

MySQL.ready(function()

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE `stored` = @stored', {
		['@stored'] = false
	}, function(rowsChanged)
		if rowsChanged > 0 then
			print(('qp_garage: %s vehicle(s) have been stored!'):format(rowsChanged))
		end
	end)
end)


ESX.RegisterServerCallback('qp_garage:isOwned', function(source, cb, plate)

	local s = source
	local x = ESX.GetPlayerFromId(s)

	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT `vehicle` FROM owned_vehicles WHERE `plate` = @plate AND `owner` = @owner', {['@plate'] = plate, ['@owner'] = x.identifier}, function(vehicle)
		if next(vehicle) then
			cb(true)
		else
			cb(false)
		end
	end)
end)

RegisterNetEvent('qp_garage:changeState')
AddEventHandler('qp_garage:changeState', function(plate, state)
	MySQL.Sync.execute("UPDATE owned_vehicles SET `stored` = @state WHERE `plate` = @plate", {['@state'] = state, ['@plate'] = plate})
end)

RegisterNetEvent('qp_garage:saveProps')
AddEventHandler('qp_garage:saveProps', function(plate, props)
	local xProps = json.encode(props)
	MySQL.Sync.execute("UPDATE owned_vehicles SET `vehicle` = @props WHERE `plate` = @plate", {['@plate'] = plate, ['@props'] = xProps})
end)

AddEventHandler('onResourceStart')
print("^7")
print("^7  Script Creato da Eragon")
print("^7")      
    

    if Config.Version == null then
    print("^8                           Please add Config.Version = 1.4 to your config. Thx")
    print("^7") 
    elseif Config.Version  == 1.4 then
        print("^2                           Version 1.4, u are up to date <3") 
        print("^7")
    elseif Config.Version <= 1.4 then
    print("^8                           U are on the old version, please update")
    print("^7") 
    elseif Config.Version >= 1.4 then
    print("^8                           U skipped some versions somehow, please look in ur Config file or create a ticket")
    print("^7") 
    elseif Config.Version == null then
    print("^8                           Please add Config.Version = 1.4 to your config. Thx")
    print("^7") 
end