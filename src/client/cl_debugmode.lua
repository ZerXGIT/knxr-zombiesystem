--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

  Skript created by ZerX!
]]

local debugMode = true

Citizen.CreateThread(function()
    -- debug
    while debugMode do
        Citizen.Wait(0)
        for i, v in ipairs(entities) do
            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.0, 0.50)
            SetTextColour(255, 50, 50, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            zCoords = GetEntityCoords(v.ped)

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
    end
end)

Citizen.CreateThread(function()
    -- debug
    while debugMode do
        Citizen.Wait(0)
        for _, entity in pairs(entities) do
            DrawMarker(1, GetEntityCoords(entity.ped), 0, 0, 0, 0, 0, 0, 10.0000, 10.0000, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
        end
    end
end)
