fx_version 'cerulean'
game 'gta5'
lua54 'yes'
fx_version '0.0.3'

author 'PerriTuber'
description 'http://scripts.perrituber.xyz/'


client_scripts { '@menuv/menuv.lua', 'shared/*.lua', 'client/main.lua', 'client/exports.lua',  'client/menus/menu.lua', 'client/classes/player.lua'}

server_scripts {'server/main.lua', 'server/logs.lua', 'server/callbacks.lua' }

shared_scripts {
  '@es_extended/imports.lua',
  '@ox_lib/init.lua'
}

ui_page 'ui/index.html'

files {
  'ui/index.html',
  'ui/app.js',
  'ui/style.css'
}
