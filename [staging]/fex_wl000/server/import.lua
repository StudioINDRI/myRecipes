
local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Server Event for Buying:
RegisterServerEvent("esx_PuntoVendita:BuyItem")
AddEventHandler("esx_PuntoVendita:BuyItem", function(amountToBuy,totalBuyPrice,itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemLabel = ESX.GetItemLabel(itemName)
	local societyAccount = nil
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_import', function(account)
			societyAccount = account
		end)
	if xPlayer.getMoney() >= totalBuyPrice then
		xPlayer.removeMoney(totalBuyPrice)
		xPlayer.addInventoryItem(itemName, amountToBuy)
		societyAccount.addMoney(totalBuyPrice)
		TriggerClientEvent("esx:showNotification",source,"Hai pagato ~g~$"..totalBuyPrice.."~s~ per "..amountToBuy.."x ~y~"..itemLabel.."~s~")
	else
		TriggerClientEvent("esx:showNotification",source,"Non hai abbastanza soldi")
	end
end)

-- Server Event for Selling:
RegisterServerEvent("esx_PuntoVendita:SellItem")
AddEventHandler("esx_PuntoVendita:SellItem", function(amountToSell,totalSellPrice,itemName, prezzoimport, prezzoimport2)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemLabel = ESX.GetItemLabel(itemName)
	local societyAccount = nil
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_import', function(account)
			societyAccount = account
		end)
	if xPlayer.getInventoryItem(itemName).count >= amountToSell then
		xPlayer.addMoney(totalSellPrice)
		xPlayer.removeInventoryItem(itemName, amountToSell)
		societyAccount.removeMoney(totalSellPrice)
		societyAccount.addMoney(totalSellPrice*2.0)
		TriggerClientEvent("esx:showNotification",source,"Hai venduto "..amountToSell.."x ~y~"..itemLabel.."~s~ per ~g~$"..totalSellPrice.."~s~")
	else
		TriggerClientEvent("esx:showNotification",source,"Non hai abbastanza oggetti da vendere")
	end
end)

