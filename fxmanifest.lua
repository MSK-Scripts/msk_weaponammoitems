fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_weaponammoitem'
description 'Weapon Ammunition with Items'
version '1.1'

lua54 'yes'

shared_scripts {
	'config.lua',
}

client_scripts {
	'client.lua',
}

server_scripts {
	'server.lua',
}

dependencies {
	'es_extended'
}