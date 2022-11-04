-- Resource Metadata
fx_version 'cerulean' --versione attuale del CfxV2

game 'gta5' --specifica il gioco base (gta5 o rdr3)
--può anche essere scritto in questa forma: 
--games { 'rdr3', 'gta5' } 

author 'StudioINDRI' --info su autore (su interfaccia web)
description 'gamemode di prova' --descrizione (su interfaccia web)
version '0.0.1' --rifrimento versione (pert tracciare eventuali modifiche)

resouce_type 'gametype' { name = 'gamemode di prova' }  --questo serve a specificare che si tratta di una game-type 
                                                        --(nel caso di semplice risorsa, omettere questa voce)

--client_script 'client/main.lua' --specifica il file script da caricare (lato client)
--server_script 'server/main.lua' --specifica il file script lato server (lato server)

--Sintassi per script multipli:
client_script {
	'client/main.lua'
	--'config.lua',
	--'client/blips.lua'
}
--[[server_script {
	'server/main.lua',
	'server/2.lua'
}
]]

-- File extra possono essere utilizzati in questo modo
--cartella_file 'file_uno' { due = 42 }
--cartella_file 'file_tre' { quattro = 69 }

-- grazie alla sintassi di Lua, funziona anche così:
--cartella_file('cinque')({sesto = "sei"})

-- metadata keys possono essere aggiunti a piacere
--pizza_con 'patate'
