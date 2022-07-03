--[[
 public static bool HasClearLineOfSight(this Entity entity, Entity target, float visionDistance) => Function.Call<bool>((Hash) 173335856089985402L, new InputArgument[2]
    {
      InputArgument.op_Implicit(entity.Handle),
      InputArgument.op_Implicit(target.Handle)
    }) && (double) entity.Position.VDist(target.Position) < (double) visionDistance;
  }
]]

function hasClearLineOfSight(entity, target, viewDistance)
    return HasEntityClearLosToEntityInFront(entity, target) and GetDistanceBetweenCoords(GetEntityCoords(entity), GetEntityCoords(target)) < viewDistance
end