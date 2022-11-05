local pompModellen = {
	[`prop_gas_pump_1b`] = true,
	[`prop_gas_pump_1c`] = true,
    [`prop_gas_pump_old2`] = true,
	[`prop_gas_pump_1d`] = true,
	[`prop_gas_pump_1a`] = true,
	[`prop_vintage_pump`] = true,
	[`prop_gas_pump_old3`] = true
}

function FindNearestFuelPump()
	local coords = GetEntityCoords(PlayerPedId())
    local pompObject = 0
	local pompAfstand = 1000
	local objects = GetGamePool("CObject")
	local staat, resultaat = xpcall(function()
		local tel = 0
		for i=1, #objects do
			if tel % 30 == 0 then
				Wait(0)
			end
			tel = tel + 1
			if pompModellen[GetEntityModel(objects[i])] then
				SetEntityCollision(objects[i], false, false)
				local afstandcontroleren = #(coords - GetEntityCoords(objects[i]))
			
				if afstandcontroleren < pompAfstand then
					pompAfstand = afstandcontroleren
					pompObject = objects[i]
				end
			end
		end
	end, debug.traceback)
	if not staat then
		print(("Error" .. resultaat))
	end
	return pompObject, pompAfstand
end

Citizen.CreateThread(function()
	while true do
		Wait(3000)
		local pompObject, pompAfstand = FindNearestFuelPump()
		if pompAfstand < 3.0 then
			isNearPump = pompObject
		else
			isNearPump = false
			Wait(math.ceil(pompAfstand * 3))
		end
	end
end)
