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
local players = {}

-- Zombie Attack & Despawn Thread
Citizen.CreateThread(function()
    while true do
        for i, entity in pairs(entities) do
            for _, player in pairs(players) do
                entity:update(player, i)
            end
        end
        Citizen.Wait(500)
    end
end)

RegisterCommand("spawnzmbi", function()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    walker.new(x, y, z)

    runner.new(x, y, z)

end)

RegisterCommand("delall", function()
    for i, v in ipairs(entities) do
        print(i)
        DeleteEntity(v.ped)
    end

    entities = {}
end)

RegisterCommand("ins", function()
    table.insert(players, PlayerPedId())
end)