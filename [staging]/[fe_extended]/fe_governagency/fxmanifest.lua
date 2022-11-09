fx_version 'cerulean'
game 'gta5'

description 'FES Job Listing for esx'
lua54 'yes'
version '1.0'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
}

server_script 'server/main.lua'

client_script 'client/main.lua'

dependency 'es_extended'
