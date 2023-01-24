ESX = exports["es_extended"]:getSharedObject()

local isPlayerLoaded = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer, isNew, skin)
	isPlayerLoaded = true
end)

CreateThread(function()
	while true do
		local sleep = 100 -- Please don't touch otherwise you will break the Script

		if isPlayerLoaded then
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

		if isPlayerLoaded then
			local playerPed = PlayerPedId()
			
			if IsPedArmed(playerPed, 4) and IsPedShooting(playerPed) then
				local hash = GetSelectedPedWeapon(playerPed)

				for k, item in pairs(Config.Ammunition) do
					for i=1, #item do 
						if hash == GetHashKey(item[i]) then
							--print('DEBUG isShooting', hash, GetHashKey(item[i]), item[i])
							TriggerServerEvent('msk_weaponammoitem:updateWeaponAmmo', k, item[i], true)
						end
					end
				end
			end
		end

		Wait(sleep)
	end
end)