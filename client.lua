local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(0)
        if Config.MiniMap.Visible then
            DrawMiniMap()
        end
    end
end)

function DrawMiniMap()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)

    -- Draw the mini-map background
    DrawRect(Config.MiniMap.Position.x, Config.MiniMap.Position.y, Config.MiniMap.Size, Config.MiniMap.Size, 0, 0, 0, 150)

    -- Draw the player marker
    DrawMarker(1, playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, playerHeading, 0.5, 0.5, 0.5, 255, 0, 0, 255, false, true, 2, nil, nil, false)

    -- Draw the player's vehicle if in one
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleCoords = GetEntityCoords(vehicle)
        local vehicleHeading = GetEntityHeading(vehicle)
        DrawMarker(1, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, vehicleHeading, 1.0, 1.0, 1.0, 0, 255, 0, 255, false, true, 2, nil, nil, false)
    end
end