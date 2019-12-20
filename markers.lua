
local coordinates = {
    vec3(76.270942687988,-1948.1596679688,21.174137115479),
    vec3(151.39395141602,-1008.0374145508,-99.000007629395)
}


function Draw3DText(x, y, z, text)
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
        for _, coordinate in pairs(coordinates) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), coordinate) < distance_until_text_disappears then
                Draw3DText(coordinate.x, coordinate.y, coordinate.z, "[E] Enter")
            end
        end
    end
end)

