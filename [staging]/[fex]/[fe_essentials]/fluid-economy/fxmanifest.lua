fx_version 'bodacious'
game 'gta5'

author 'Francesco Bianco - github.com/studioindri'
version '0.1.0'


client_scripts {
  -- NATIVE UI DEPENDENCY
  -- COMMENTA SE NON USI NATIVE UI
  --'@NativeUILua_Reloaded/src/NativeUIReloaded.lua',

  -- SOURCE
  'config.lua',   
  'utils.lua',
  'client/main.lua',
  'client/framework/framework_functions.lua'
}

server_scripts {
  -- MYSQL DEPENDENCY
  --'@mysql-async/lib/MySQL.lua',
  '@oxmysql/lib/MySQL.lua',

  -- SOURCE
  'config.lua',
  'credentials.lua',  
  'server/framework/framework_functions.lua',
  'server/functions.lua',
  'server/main.lua',
}

dependencies {
  -- COMMENTA SE NON USI ESX
  'es_extended',

  -- DECOMMENTA SE NON USI NATIVEUI
  --'NativeUILua_Reloaded',

  --segli mysql in uso:
  'oxmysql',
  --'mysql-async'

  --commenta se non usi ox_libs
  'ox_libs',
}