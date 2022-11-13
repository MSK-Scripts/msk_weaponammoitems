ESX = exports["es_extended"]:getSharedObject()

local playerPed = PlayerPedId()

CreateThread(function()
	while true do
		Wait(100)

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
end)

CreateThread(function()
	while true do
		Wait(0)
		
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
end)