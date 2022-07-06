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

-- Zombie Attack & Despawn Thread
Citizen.CreateThread(function()
    table.insert(players, PlayerPedId())
    while true do
        for i, entity in pairs(entities) do
            for _, player in pairs(players) do
                entity:update(player, i)
            end
        end
        Citizen.Wait(500)
        print(PlayerPedId())
    end
end)

RegisterCommand("spawnzmbi", function()
    spawnZombie(table.unpack(GetEntityCoords(PlayerPedId())))
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