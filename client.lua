ESX = exports["es_extended"]:getSharedObject()

local playerPed = PlayerPedId()
local hash = GetSelectedPedWeapon(playerPed)

CreateThread(function()
	while true do
		Wait(100)

		if IsPedArmed(playerPed, 4) then
			for k, v in pairs(Config.Ammunition) do 
				if hash == GetHashKey(v[1]) then
					TriggerServerEvent('msk_weaponammoitem:updateWeaponAmmo', k, v[1])
				end
			end
		end
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		
		if IsPedArmed(playerPed, 4) and IsPedShooting(playerPed) then
			for k, v in pairs(Config.Ammunition) do
				if hash == GetHashKey(v[1]) then
					TriggerServerEvent('msk_weaponammoitem:updateWeaponAmmo', k, v[1], true)
				end
			end
		end
	end
end)