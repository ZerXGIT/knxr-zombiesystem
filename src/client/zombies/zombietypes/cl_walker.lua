--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

   Script by ZerX (github.com/ZerXGIT)
]]


walker = {}
walker.__index = walker
setmetatable(walker, zombiePed)

function walker.new(x, y, z)
    local zombieConfig = getZombieConfigForType("walker")
    instance = setmetatable({
        ped = nil,
        target = nil,
        goingToTarget = false,
        attackingTarget = false,
        movementStyle = zombieConfig["movementStyle"],
        zombieDamage = zombieConfig["zombieDamage"],
        sensingRange = zombieConfig["sensingRange"],
        behindZombieNoticeDistance = zombieConfig["behindZombieNoticeDistance"],
        runningNoticeDistance = zombieConfig["runningNoticeDistance"],
        attackRange = zombieConfig["attackRange"],
        visionDistance = zombieConfig["visionDistance"],
        wanderRadius = zombieConfig["wanderRadius"],
        speed = zombieConfig["speed"],
    }, walker)

    local model = getRandomZombieModel(zombieConfig["models"])

    requestModelAndCollision(model)
    instance.ped = CreatePed(4, GetHashKey(model), x, y, z, "255", true, false)

    table.insert(entities, instance)
    return instance
end

function walker:onGoToTarget()
    TaskGoToEntity(self.ped, self.target, -1, 0.0, self.speed, 1073741824, 0)
end

function walker:onAttackTarget()
    local target = self.target
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

