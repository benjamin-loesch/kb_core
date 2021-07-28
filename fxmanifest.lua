-- Resource Meta
fx_version 'cerulean'
games { 'gta5' }

author 'Benjamin Loesch'
description 'Property inclusion for Los Santos'
version '0.0.1'

shared_scripts {
  'locale.lua',
  'locales/en.lua',

  'config.lua',
}
server_scripts {
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
}

client_scripts {
  'main.lua'
}

dependencies {
  'mysql-async',
  'async',
  'spawnmanager',
}