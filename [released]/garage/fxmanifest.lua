game "gta5"
fx_version "cerulean"
author 'Francesco Bianco - github.com/StudioINDRI'

server_scripts {
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  'server/main.lua'
}

author "qp-service"
version "1.4"
description "qp_garage"

client_scripts {
  'client/main.lua'
}

escrow_ignore {
  'config.lua'
}

shared_scripts {
  'config.lua'
}

ui_page 'html/ui.html'
files {
  'html/ui.html',
  'html/ui.css', 
  'html/ui.js',
  'html/close.png',
  'html/garage.png',
  'html/logo.png'
}

lua54 "yes"