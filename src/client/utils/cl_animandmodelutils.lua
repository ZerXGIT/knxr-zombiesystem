--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

   Script by ZerX (github.com/ZerXGIT)
]]


function requestAnimSet(animSet)
    RequestAnimSet(animSet)
    while not HasAnimSetLoaded(animSet) do
        Wait(1)
    end
end

function requestModelAndCollision(model)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) or not HasCollisionForModelLoaded(GetHashKey(model)) do
        Wait(1)
    end
end

function requestAnimDict(animDict)
    local attempts = 0
    RequestAnimDict(animDict)
    while not HasAnimSetLoaded(animDict) do
        Wait(1)
        attempts = attempts + 1
        if (attempts > 10) then
            return
        end
    end
end

