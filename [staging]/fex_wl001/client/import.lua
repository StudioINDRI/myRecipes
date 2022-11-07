--------------------------------
------- Created by Hamza -------
-------------------------------- 

ESX = nil
local insideMarker = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Core Thread Function:
Citizen.CreateThread(function()
	while true do
		--Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		local negro = 500
		for k,v in pairs(Config.PuntoVendita) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				if (distance < 10.0) and insideMarker == false then
					negro = 5
				end
				if (distance < 7.0) and insideMarker == false then
					negro = 5
					DrawMarker(Config.ShopMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.975, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.ShopMarkerScale.x, Config.ShopMarkerScale.y, Config.ShopMarkerScale.z, Config.ShopMarkerColor.r,Config.ShopMarkerColor.g,Config.ShopMarkerColor.b,Config.ShopMarkerColor.a, false, true, 2, true, false, false, false) 				
				end
				if (distance < 1.0) and insideMarker == false then
					negro = 5
					DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.ShopDraw3DText)
					if IsControlJustPressed(0, Config.KeyToOpenShop) then
						PuntoVenditaMenu()
						insideMarker = true
						Citizen.Wait(500)
					end  
				end
			end
		end
		Citizen.Wait(negro)
	end
end)

-- Function for Pawn Shop Main Menu:
PuntoVenditaMenu = function()
	local player = PlayerPedId()
	FreezeEntityPosition(player,true)
	
	local elements = {
		--{ label = "Compra", action = "PuntoVendita_Buy_Menu" },
		{ label = "Vendi", action = "PuntoVendita_Sell_Menu" },
	}
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_PuntoVendita_main_menu",
		{
			title    = "Import & Export",
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
		local action = data.current.action

		if action == "PuntoVendita_Buy_Menu" then
			PuntoVenditaBuyMenu()
		elseif action == "PuntoVendita_Sell_Menu" then
			PuntoVenditaellMenu()
		end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
		FreezeEntityPosition(player,false)
	end, function(data, menu)
	end)
end

-- Function for Pawn Shop Buy Menu:
function PuntoVenditaBuyMenu()
	local player = PlayerPedId()
	FreezeEntityPosition(player,true)
	local elements = {}
			
	for k,v in pairs(Config.ItemsPuntoVendita) do
		if v.BuyPuntoVendita == true then
			table.insert(elements,{label = v.label .. " | "..('<span style="color:green;">%s</span>'):format("$"..v.BuyPrice..""), itemName = v.itemName, BuyPuntoVendita = v.BuyPuntoVendita, BuyPrice = v.BuyPrice})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_PuntoVendita_buy_menu",
		{
			title    = "Cosa vuoi comprare?",
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
			if data.current.itemName == data.current.itemName then
				OpenBuyDialogMenu(data.current.itemName,data.current.BuyPrice)
			end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
		FreezeEntityPosition(player,false)
	end, function(data, menu)
	end)
end

-- Function for Pawn Shop Buy Dialog
function OpenBuyDialogMenu(itemName, BuyPrice)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'esx_PuntoVendita_amount_to_buy_dialog', {
		title = "Importo da acquistare?"
	}, function(data, menu)
		menu.close()
		amountToBuy = tonumber(data.value)
		totalBuyPrice = (BuyPrice * amountToBuy)
		TriggerServerEvent("esx_PuntoVendita:BuyItem",amountToBuy,totalBuyPrice,itemName)
	end,
	function(data, menu)
		menu.close()	
	end)
end

-- Function for Pawn Shop Sell Menu:
function PuntoVenditaellMenu()
	local player = PlayerPedId()
	FreezeEntityPosition(player,true)
	local elements = {}
			
	for k,v in pairs(Config.ItemsPuntoVendita) do
		if v.SellPuntoVendita == true then
			table.insert(elements,{label = v.label .. " | "..('<span style="color:green;">%s</span>'):format("$"..v.SellPrice..""), itemName = v.itemName, SellPuntoVendita = v.SellPuntoVendita, SellPrice = v.SellPrice})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_PuntoVendita_sell_menu",
		{
			title    = "Cosa vuoi vendere?",
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
			if data.current.itemName == data.current.itemName then
				OpenSellDialogMenu(data.current.itemName,data.current.SellPrice)
			end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
		FreezeEntityPosition(player,false)
	end, function(data, menu)
	end)
end

-- Function for Pawn Shop Sell Dialog

function OpenSellDialogMenu(itemName, SellPrice)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'esx_PuntoVendita_amount_to_sell_dialog', {
		title = "Importo da vendere?"
	}, function(data, menu)
		menu.close()
		amountToSell = tonumber(data.value)
		totalSellPrice = (SellPrice * amountToSell)
		prezzoimport = ((SellPrice*0.35) * amountToSell)
		prezzoimport2 = totalSellPrice*0.35
		TriggerServerEvent("esx_PuntoVendita:SellItem",amountToSell,totalSellPrice,itemName, prezzoimport, prezzoimport2)
	end,
	function(data, menu)
		menu.close()	
	end)
end


-- Blip on Map for Pawn Shops:
Citizen.CreateThread(function()
	if Config.EnablePuntoVenditaBlip == true then	
		for k,v in pairs(Config.PuntoVendita) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.BlipSprite)
				SetBlipDisplay(blip, Config.BlipDisplay)
				SetBlipScale  (blip, Config.BlipScale)
				SetBlipColour (blip, Config.BlipColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.BlipName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end	
end)

-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end
