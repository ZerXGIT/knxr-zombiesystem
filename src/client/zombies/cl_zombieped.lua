--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

  Skript created by ZerX!
]]

zombiePed = {}
zombiePed.__index = zombiePed

function zombiePed:update(target, pos)
    local ped = self.ped
    local distance = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(target), true)

    -- Despawn
    if (distance > 120.0) and not (self:isOnScreen()) and (IsEntityDead(ped)) then
        local model = GetEntityModel(ped)
        SetEntityAsNoLongerNeeded(ped)
        SetModelAsNoLongerNeeded(model)
        DeleteEntity(ped)
        table.remove(entities, pos)
    end

    if IsEntityDead(ped) then
        return
    end

    self:getTarget()
    self:setWalkStyle()
    if (IsEntityOnFire(ped)) and not IsEntityDead(ped) then
        SetEntityHealth(ped, 0)
    end

    StopCurrentPlayingAmbientSpeech(ped)
    if (self.target == nil) then
        return
    end

    if (distance > self.attackRange) then
        self:onGoToTarget()
    else
        self:onAttackTarget()
    end
end

function zombiePed:isOnScreen()
    local isOnScreen, _, _ = GetScreenCoordFromWorldCoord(table.unpack(GetEntityCoords(self.ped)))
    if (isOnScreen) then
        return 1
    else
        return 0
    end
end

function zombiePed:getTarget()
    local closest = self:getNearestPlayer(self.sensingRange)

    if (hasClearLineOfSight(self.ped, closest, self.visionDistance)) or self:canHearPed(closest) then
        self.target = closest
    else
        if (self.target ~= nil) and (closest ~= self.target) then
            return
        end
        self.target = nil
    end
end

function zombiePed:getNearestPlayer(range)
    smallest = {}

    for j, player in pairs(players) do
        local distance = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(self.ped), true)
        if (smallest.num == nil) or (distance < smallest.num) then
            smallest.num = distance
            smallest.i = j
        end
    end

    if (smallest.num <= range) then
        return players[smallest.i]
    end

    return nil
end

function zombiePed:canHearPed(target)
    local distance = GetDistanceBetweenCoords(GetEntityCoords(self.ped), GetEntityCoords(target))
    return self:isBehindZombie(distance) or self:isRunningNoticed(target, distance)
end

function zombiePed:isBehindZombie(distance)
    return distance < self.behindZombieNoticeDistance
end

function zombiePed:isRunningNoticed(target, distance)
    return IsPedSprinting(target) and distance < self.runningNoticeDistance
end

function zombiePed:setWalkStyle()
    requestAnimSet(self.movementStyle)
    SetPedMovementClipset(self.ped, self.movementStyle, 1.0)
end
