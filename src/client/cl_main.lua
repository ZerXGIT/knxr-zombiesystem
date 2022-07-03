entitys = {}
players = {}

-- Zombie Attack & Despawn Thread
Citizen.CreateThread(function()
    table.insert(players, PlayerPedId())
    while true do
        for i, entity in pairs(entitys) do
            for j, player in pairs(players) do
                entity:update(player, i)
            end
        end
        Citizen.Wait(1000)
    end
end)

RegisterCommand("spawnzmbi", function()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    walker.new(x, y, z)

end)

RegisterCommand("spawnr", function()
    local runner = spawnRunner(GetEntityCoords(PlayerPedId()))
    table.insert(entitys, runner)

end)

RegisterCommand("100", function()
    TriggerServerEvent("Server:SoundToAll", "growl4", 1.0);
end)

RegisterCommand("pall", function()
    for _, v in ipairs(entitys) do
        RequestAnimDict("rcmbarry") -- attack animation
        TaskPlayAnim(v, "rcmbarry", "bar_1_teleport_aln", 1.0, 1.0, 1000, 16, 1.0, 0, 0, 0)
    end
end)

RegisterCommand("delall", function()
    for i, v in ipairs(entitys) do
        print(i)
        DeleteEntity(v.ped)
    end

    entitys = {}
end)