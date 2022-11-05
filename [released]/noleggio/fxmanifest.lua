fx_version 'adamant'
game 'gta5'

description 'Noleggio'
version '1.0.0'
author 'github/StudioINDRI'

client_scripts {
	'client.lua',
	 '@es_extended/locale.lua',
	'config.lua',
    'client/*.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
    'server.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/assets/js/script.js',
	'html/assets/css/style.css',
	'html/assets/img/*.png',
	'html/assets/font/*.ttf',
}
