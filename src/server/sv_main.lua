players = {}

print([[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

  Skript created by ZerX!
]])

RegisterNetEvent("knxr-zombiesystem:server:registernewplayer")
AddEventHandler("knxr-zombiesystem:server:registernewplayer", function(player)
    table.insert(players, player)
    updatePlayers()
end)

function updatePlayers()
    for _, player in pairs(players) do
        print(player)
        TriggerClientEvent("knxr-zombiesystem:client:syncall", player, players)
    end
end

local function bench(name, myfunc)
    start_timer = os.clock()
    -- myfunc()
    print("[", name, "] Took ", string.format("%.2f", os.clock() - start_timer), " ms")
end

list = {}

for i = 1, 200 do
    table.insert(list, i)
end

bench("ForLOOP", function()
    for i = 1, #list do
        SetTimeout(math.random(100, 400), function()
            print(i)
        end)
    end
end)

