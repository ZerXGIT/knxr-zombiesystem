--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

  Skript created by ZerX!
]]

function hasClearLineOfSight(entity, target, viewDistance)
    return HasEntityClearLosToEntityInFront(entity, target) and GetDistanceBetweenCoords(GetEntityCoords(entity), GetEntityCoords(target)) < viewDistance
end

function getRandomZombieModel(array)
    return array[math.random(1, #array)]
end