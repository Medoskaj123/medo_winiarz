fx_version 'cerulean'
game 'gta5'
author 'many#3330'

description 'zlomiarz pod targecik ;p'
lua54 'yes'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

server_scripts {'server/*.lua'}

shared_scripts {'@es_extended/imports.lua','config.lua', '@ox_lib/init.lua'}

dependencies {
    'PolyZone',
    'es_extended',
    'qtarget',
    'many-base'
}

escrow_ignore {
    'config.lua',
    'server.lua'
}