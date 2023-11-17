ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('msk_weaponammoitem:checkAmmo')
AddEventHandler('msk_weaponammoitem:checkAmmo', function(item, data)
	local playerPed = PlayerPedId()
	local hash = GetSelectedPedWeapon(playerPed)

	if IsPedArmed(playerPed, 4) then
		if hash then
			if not Config.AmmoPacks[item] then return print(('[ITEM] [Add Ammo] Item ^3%s^0 is not configured in config.lua'):format(item)) end
			local weapon = ESX.GetWeaponFromHash(hash)

			TriggerServerEvent('msk_weaponammoitem:addWeaponAmmo', weapon.name, item, data)
		end
	end
end)

CreateThread(function()
	while true do
		local sleep = 100 -- Please don't touch otherwise you will break the Script

		if ESX.IsPlayerLoaded() then
			local playerPed = PlayerPedId()

			if IsPedArmed(playerPed, 4) then
				local hash = GetSelectedPedWeapon(playerPed)

				for k, item in pairs(Config.Ammunition) do
					for i=1, #item do 
						if hash == GetHashKey(item[i]) then
							TriggerServerEvent('msk_weaponammoitem:updateWeaponAmmo', k, item[i])
						end
					end
				end
			end
		end

		Wait(sleep)
	end
end)

CreateThread(function()
	while true do
		local sleep = 0 -- Please don't touch otherwise you will break the Script

		if ESX.IsPlayerLoaded() then
			local playerPed = PlayerPedId()
			
			if IsPedArmed(playerPed, 4) and IsPedShooting(playerPed) then
				local hash = GetSelectedPedWeapon(playerPed)

				for k, item in pairs(Config.Ammunition) do
					for i=1, #item do 
						if hash == GetHashKey(item[i]) then
							TriggerServerEvent('msk_weaponammoitem:updateWeaponAmmo', k, item[i], true)
						end
					end
				end
			end
		end

		Wait(sleep)
	end
end)