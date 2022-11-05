fx_version 'adamant'
description "Npc dealers"
game 'gta5'
author 'Francesco Bianco - github.com/StudioINDRI'

server_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'server/server.lua',
    'config.lua',
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'client/client.lua',
}

dependency 'es_extended'