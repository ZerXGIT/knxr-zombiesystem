walker = {}
walker.__index = walker
setmetatable(walker, zombiePed)

function walker.new(x, y, z)
    instance = setmetatable({
        ped = nil,
        target = nil,
        movementStyle = "move_m@injured",
        zombieDamage = 15,
        sensingRange = 120.0,
        behindZombieNoticeDistance = 5.0,
        runningNoticeDistance = 25.0,
        attackRange = 1.2,
        visionDistance = 35.0,
        wanderRadius = 100.0,
        goingToTarget = false,
        attackingTarget = false,
    }, walker)

    requestModelAndCollision("u_m_y_zombie_01")
    instance.ped = CreatePed(4, GetHashKey("u_m_y_zombie_01"), x, y, z, "255", true, false)

    print("Created at: ", GetEntityCoords(instance.ped))

    table.insert(entitys, instance)
    return instance
end

function walker:onAttackTarget(target)
    if (IsPlayerDead(target)) then
        if not (IsEntityPlayingAnim(self.ped, "amb@world_human_bum_wash@male@high@idle_a", "idle_b")) then
            requestAnimDict("amb@world_human_bum_wash@male@high@idle_a")
            TaskPlayAnim(self.ped, "amb@world_human_bum_wash@male@high@idle_a", "idle_b", 8.0, -1, 1)
        end
    else
        if not (IsEntityPlayingAnim(self.ped, "rcmbarry", "bar_1_teleport_aln")) then
            requestAnimDict("rcmbarry")
            TaskPlayAnim(self._ped, "rcmbarry", "bar_1_teleport_aln", 8.0, 1000, 16)
            if not (GetPlayerInvincible(target)) then
                ApplyDamageToPed(target, self.zombieDamage)
            end
        end
    end

end

