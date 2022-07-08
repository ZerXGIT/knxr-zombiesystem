--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

  Skript created by ZerX!
]]

-- Debugmode has huge performance impact
local debugMode = false
local resourceName = GetCurrentResourceName()

CreateThread(function()
    local x = 0.783;
    while true do
        Citizen.Wait(0)
        if debugMode then
            DrawRect(1.0, 0.5, 0.5, 1.0, 0, 0, 0, 120)
            -- Header
            drawText("Debug Menu - " .. resourceName, 0.77, 0.02, 0.40)

            -- Stats
            drawText("Stats:", 0.77, 0.06, 0.35)
            drawText("Current Zombies: " .. #entities, 0.775, 0.085, 0.25)

            -- entities
            drawText("Entitys:", 0.77, 0.10, 0.35)
            drawText("Ped Id list: ", 0.775, 0.125, 0.25)
            for i, v in ipairs(entities) do
                drawText(v.ped, x, 0.128 + (i * 0.018), 0.25)
            end
        end
    end
end)

function drawText(text, x, y, scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    --SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

RegisterCommand("debug", function()
    if debugMode then
        debugMode = false
    else
        debugMode = true
    end
end)
--[[
Citizen.CreateThread(function()
    -- debug
    while debugMode do
        Citizen.Wait(0)
        for i, v in ipairs(players) do
            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.0, 0.50)
            SetTextColour(255, 50, 50, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            AddTextComponentString(i .. " : " .. v)
            DrawText(0.26, 0.03 + (i * 0.02))
        end
        for i, v in ipairs(entities) do
            DrawMarker(1, GetEntityCoords(v.ped), 0, -1, 0, 0, 0, 0, 10.0000, 10.0000, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.0, 0.50)
            SetTextColour(255, 50, 50, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")

            -- Check if the coord is visible on the screen, regardless if any things are in the way
            local retval, _, _ = GetScreenCoordFromWorldCoord(zCoords.x, zCoords.y, zCoords.z)

            if retval then
                AddTextComponentString("true" .. " : " .. v.ped)
            else
                AddTextComponentString("false" .. " : " .. v.ped)
            end
            DrawText(0.03, 0.03 + (i * 0.02))
        end
    end
end)
]]