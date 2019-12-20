
local stash = {
    vec3(151.74440002441,-1001.3176269531,-98.999977111816)
}

function DrawStash(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
    end
end


local distance_until_text_disappears = 10

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for _, coordinate in pairs(stash) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), coordinate) < distance_until_text_disappears then
                DrawStash(coordinate.x, coordinate.y, coordinate.z, "[E] Open stash")
            end
        end
    end
end)

function nearStash()
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)

    for _, stashInv in pairs(stash) do
        local distance = GetDistanceBetweenCoords(stashInv.x, stashInv.y, stashInv.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

        if distance <= 1 then
            return true
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(1, 38) and nearStash() then
            ESX.ShowInventory()
        end
    end
end)
