--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

  Skript created by ZerX!
]]

--Banner
print([[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

  Skript created by ZerX!
]])

entities = {}
players = {}

-- ToDo: Performance and Sync

-- Sync

TriggerServerEvent("knxr-zombiesystem:server:registernewplayer", PlayerPedId())

-- Register Sync event
RegisterNetEvent("knxr-zombiesystem:client:syncall", function(playersArr)
    players = playersArr
end)

-- Zombie Spawn Thread
local function getSpawnCoords(playerPed, min, max)
    local x, y, z = table.unpack(GetEntityCoords(playerPed))

    x = x + math.random(-max, min)
    y = y + math.random(-max, min)
    _, z = GetGroundZFor_3dCoord(x, y, z, 1)

    return vector3(x, y, z)
end

CreateThread(function()
    local canSpawn = true
    local spawnConfig = getZombieSpawnConfig()
    while false do
        repeat
            Citizen.Wait(0)
            if #entities < spawnConfig["maxZombies"] then
                canSpawn = true
            else
                canSpawn = false
            end
        until canSpawn
        local x, y, z = getSpawnCoords(PlayerPedId(), spawnConfig["minSpawnDistance"], spawnConfig["maxSpawnDistance"])

        spawnZombie(x, y, z)
        Citizen.Wait(500)
    end
end)

-- Zombie Attack & Despawn Thread
CreateThread(function()
    while true do
        --         for i = 1, #entities do
        for i, entity in pairs(entities) do
            for _, player in pairs(players) do
                entity:update(player, i)
            end
        end
        Citizen.Wait(1000)
    end
end)

RegisterCommand("spawnzmbi", function()
    for i = 1, 20 do
        spawnZombie(table.unpack(GetEntityCoords(PlayerPedId())))
    end
end)

RegisterCommand("delall", function()
    for i, v in ipairs(entities) do
        DeleteEntity(v.ped)
    end

    print("DELETED: ", #entities)
    entities = {}
end)

RegisterCommand("ins", function()
    table.insert(players, PlayerPedId())
end)