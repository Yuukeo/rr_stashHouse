ESX  							= nil
local CurrentAction 			= nil
local CurrentActionMsg 			= ''
local HasAlreadyEnteredMarker 	= false
local LastZone 					= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Keep the same name as in the config.lua
AddEventHandler('tp:hasEnteredMarker', function(zone)

	--[[if zone == 'LitterEnter' then
    	CurrentAction = zone
        CurrentActionMsg  = "Push ~INPUT_LOOK_BEHIND~ to enter the litter warehouse."
    end

    if zone == 'LitterExit' then
    	CurrentAction = zone
		CurrentActionMsg  = "Push ~INPUT_LOOK_BEHIND~ to enter the litter warehouse."
    end]]

	if zone == 'SpawnEnter' then
    	CurrentAction = zone
    end
	
	if zone == 'SpawnExit' then
    	CurrentAction = zone
    end
	
	if zone == 'StashEnter' then
    	CurrentAction = zone
    end
	
	if zone == 'StashExit' then
    	CurrentAction = zone
    end


end)

AddEventHandler('tp:hasExitedMarker', function(zone)
	CurrentAction = nil
end)



-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for zone, data in pairs(Config.zones) do
			if GetDistanceBetweenCoords(coords, data.x, data.y, data.z, true) < (data.w / 2) then
				isInMarker  = true
				currentZone = zone
				break
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('tp:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('tp:hasExitedMarker', LastZone)
		end

	end
end)

-- TP if in marker
Citizen.CreateThread(function()
    while true do

        Wait(0)

        if CurrentAction ~= nil then

            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            local playerPed = GetPlayerPed(-1)

            local coords = {
	    		x = Config.point[CurrentAction].x,
	    		y = Config.point[CurrentAction].y,
	    		z = Config.point[CurrentAction].z
	    	}
            
            -- Test if E key is pushed (released actually, to avoid possible spam)
            if IsControlJustReleased(0, Config.actionKey) then            	
            	ESX.Game.Teleport(playerPed, coords)
            	CurrentAction = nil
            else
            	-- Test if zone is in automatic teleport list
	            for i=1, #Config.auto, 1 do
	            	if Config.auto[i] == CurrentAction then
		            	ESX.Game.Teleport(playerPed, coords)
		            	CurrentAction = nil
	            	end
	            end
            end

            
            
        end

    end
end)
