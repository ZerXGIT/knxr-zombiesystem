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
    RequestAnimDict(animDict)
    while not HasAnimSetLoaded(animDict) do
        Wait(1)
    end
end

