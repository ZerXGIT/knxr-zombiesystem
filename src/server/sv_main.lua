--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

   Script by ZerX (github.com/ZerXGIT)
]]

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