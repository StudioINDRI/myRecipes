AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        local DiscordWebHook = ''
        local embeds = {
            {
                ['title'] = 'SERVER STAGING!',
                ['type'] = 'rich',
                ['color'] = 2061822,
                ['author'] = {
                    ['name'] = 'SILKROAD RPG',
                    ['icon_url'] = '',
                },
                ['image'] = {
                    ['url'] = '',
                },
            }
        }
        PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embeds}), {['Content-Type'] = 'application/json' })
        Citizen.Wait(125)
        TriggerEvent('as_log:manda', '@everyone', DiscordWebHook)
    end
end)