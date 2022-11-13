# msk_weaponammoitems
Weapon Ammunition as Items


## Description
* We all know the issue with ESX and Weapon Ammunition. With this Script you get Ammo as Items.
  * So if you have 10 9mm items in your inventory you can shoot 10 times.
* You can set as many items as you want in config.lua

## Known Issues
* If you get this error: `SCRIPT ERROR: @msk_weaponammoitems/server.lua:7: attempt to call a nil value (field 'hasItem')` then try to change that line to `local hasItem = xPlayer.getInventoryItem(item)`

If you want to have Weapon Components and Tints then use this: https://forum.cfx.re/t/esx-msk-weaponammo-clips-components-tints/4793783

## Requirements
* ESX 1.2 and above