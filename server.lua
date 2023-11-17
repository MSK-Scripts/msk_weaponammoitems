ESX = exports["es_extended"]:getSharedObject()

for item, v in pairs(Config.AmmoPacks) do
    ESX.RegisterUsableItem(item, function(playerId)
        local src = playerId
        local xPlayer = ESX.GetPlayerFromId(src)

        xPlayer.triggerEvent('msk_weaponammoitem:checkAmmo', item, v)
    end)
end

RegisterNetEvent('msk_weaponammoitem:addWeaponAmmo')
AddEventHandler('msk_weaponammoitem:addWeaponAmmo', function(weaponName, item, data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local hasItem = xPlayer.getInventoryItem(item)
    if not hasItem or hasItem.count == 0 then return end

    xPlayer.removeInventoryItem(item, 1)
    xPlayer.addInventoryItem(data.item, data.amount)

    local hasAmmo = xPlayer.getInventoryItem(data.item)
    if not hasAmmo or hasAmmo.count == 0 then return end

    xPlayer.updateWeaponAmmo(weaponName, hasAmmo.count + data.amount)
    SetPedAmmo(GetPlayerPed(xPlayer.source), joaat(weaponName), hasAmmo.count + data.amount)
end)

RegisterNetEvent('msk_weaponammoitem:updateWeaponAmmo')
AddEventHandler('msk_weaponammoitem:updateWeaponAmmo', function(item, weaponName, isShooting)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local hasItem = xPlayer.getInventoryItem(item)

	if xPlayer then
		if hasItem and hasItem.count > 0 then
			if isShooting then
				xPlayer.removeInventoryItem(item, 1)
			end
			
			xPlayer.updateWeaponAmmo(weaponName, hasItem.count)
            SetPedAmmo(GetPlayerPed(xPlayer.source), joaat(weaponName), hasItem.count)
		else
			xPlayer.updateWeaponAmmo(weaponName, 0)
            SetPedAmmo(GetPlayerPed(xPlayer.source), joaat(weaponName), 0)
		end
	end
end)

---- GitHub Updater ----
GithubUpdater = function()
    GetCurrentVersion = function()
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
                print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here:^9 https://github.com/MSK-Scripts/msk_weaponammoitems/releases/tag/v'.. NewestVersion .. '^0')
            end
            print("###############################")
        end)
    else
        print("###############################")
        print(resourceName .. '^2 ✓ Resource loaded^0')
        print("###############################")
    end
end
GithubUpdater()