fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_weaponammoitem'
description 'Weapon Ammunition as Items'
version '1.0'

lua54 'yes'

escrow_ignore {
	'config.lua',
	'client.lua',
	'server.lua'
}

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