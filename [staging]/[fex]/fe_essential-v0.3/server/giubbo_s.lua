ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('giubbottoap', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:HeavyArmor', source)
	xPlayer.removeInventoryItem('giubbottoap', 1)
end)
