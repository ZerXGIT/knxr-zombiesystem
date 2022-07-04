function hasClearLineOfSight(entity, target, viewDistance)
    return HasEntityClearLosToEntityInFront(entity, target) and GetDistanceBetweenCoords(GetEntityCoords(entity), GetEntityCoords(target)) < viewDistance
end