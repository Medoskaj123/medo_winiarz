fx_version 'cerulean'
game 'gta5'
author 'medoskyy'

description 'winiarz pod cityofart'
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
    'COA-base'
}
