ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('msk_weaponammoitem:updateWeaponAmmo')
AddEventHandler('msk_weaponammoitem:updateWeaponAmmo', function(item, weaponName, isShooting)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local hasItem = xPlayer.getInventoryItem(item)

	if hasItem then
		if isShooting then
			xPlayer.removeInventoryItem(item, 1)
		end
		
		xPlayer.updateWeaponAmmo(weaponName, hasItem.count)
		xPlayer.triggerEvent('esx:setWeaponAmmo', weaponName, hasItem.count)
	else
		xPlayer.updateWeaponAmmo(weaponName, 0)
		xPlayer.triggerEvent('esx:setWeaponAmmo', weaponName, 0)
	end
end)

---- GitHub Updater ----
function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

local CurrentVersion = GetCurrentVersion()
local resourceName = "^4["..GetCurrentResourceName().."]^0"

if Config.VersionChecker then
	PerformHttpRequest('https://raw.githubusercontent.com/MSK-Scripts/msk_weaponammoitems/main/VERSION', function(Error, NewestVersion, Header)
		print("###############################")
    	if CurrentVersion == NewestVersion then
	    	print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
    	elseif CurrentVersion ~= NewestVersion then
        	print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
	    	print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here: ^9https://github.com/MSK-Scripts/msk_weaponammoitems/releases/tag/v'.. NewestVersion .. '^0')
    	end
		print("###############################")
	end)
else
	print("###############################")
	print(resourceName .. '^2 ✓ Resource loaded^0')
	print("###############################")
end