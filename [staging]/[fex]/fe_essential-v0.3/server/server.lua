ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----
ESX.RegisterUsableItem('manette', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('manette', 1)
	TriggerClientEvent('parmex_manette:ammanetta', source)
end)

----
ESX.RegisterUsableItem('chiave', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('chiave', 1)
	TriggerClientEvent('parmex_manette:smanetta', source)
end)
