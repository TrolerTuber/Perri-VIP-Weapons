fx_version 'cerulean'
game 'gta5'
lua54 'yes'
fx_version '0.0.2'

author 'PerriTuber'
description 'http://scripts.perrituber.xyz/'

client_scripts { '@menuv/menuv.lua', 'client/main.lua', 'client/exports.lua', 'client/menus/menu.lua', 'client/classes/player.lua'}

server_scripts {'server/main.lua', 'server/logs.lua', 'server/callbacks.lua' }

escrow_ignore { 'client/exports.lua', 'shared/*.lua', 'server/logs.lua' }

shared_scripts {
  '@es_extended/imports.lua',
  '@ox_lib/init.lua',
  'shared/*.lua'
}

ui_page 'ui/index.html'

files {
  'ui/index.html',
  'ui/app.js',
  'ui/style.css'
}
