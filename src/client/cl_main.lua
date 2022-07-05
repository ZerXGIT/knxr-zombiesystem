local entitys = {}
players = {}

-- Zombie Attack & Despawn Thread
Citizen.CreateThread(function()
    while true do
        for i, entity in pairs(entitys) do
            for _, player in pairs(players) do
                entity:update(player, i)
            end
        end
        Citizen.Wait(500)
    end
end)

RegisterCommand("spawnzmbi", function()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    local insta = walker.new(x, y, z)
    table.insert(entitys, insta)

    local insta2 = runner.new(x, y, z)
    table.insert(entitys, insta2)

end)

RegisterCommand("delall", function()
    for i, v in ipairs(entitys) do
        print(i)
        DeleteEntity(v.ped)
    end

    entitys = {}
end)

RegisterCommand("ins", function()
    table.insert(players, PlayerPedId())
end)