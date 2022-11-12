ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject",function(a)
                ESX = a
        end)
        Citizen.Wait(0)
    end
end)

RegisterCommand("gps", function(source, args)
    local argString = table.concat(args, " ")
    if argString == "" or argString == " " then 
        ESX.ShowNotification("~r~Devi inserire un civico.")
    end
    if main[argString] then
        local coord = main[argString]
        ESX.ShowNotification("GPS impostato al civico " .. argString)
        SetNewWaypoint(coord[1], coord[2])
    else 
        ESX.ShowNotification("~r~Civico non trovato.")
    end
end)
