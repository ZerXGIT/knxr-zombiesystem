runner = {}
runner.__index = runner
setmetatable(runner, zombiePed)

function runner.new(x, y, z)
    local zombieConfig = getZombieConfig("runner")
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
        speed = zombieConfig["speed"]
    }, runner)

    requestModelAndCollision("a_f_m_beach_01")
    instance.ped = CreatePed(4, GetHashKey("a_f_m_beach_01"), x, y, z, "255", true, false)

    return instance
end

function runner:onGoToTarget()
    TaskGoToEntity(self.ped, self.target, -1, 0.0, 5.0, 1073741824, 0)
    Citizen.Wait(500)
end

function runner:onAttackTarget()
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

    Citizen.Wait(250)
end

--[[function spawnRunner(x, y, z)
    local self = {}
    self.zombiePed = CreatePed(4, GetHashKey("u_m_y_zombie_01"), x, y, z, "255", true, false)

    AddRelationshipGroup("zombie_default")

    SetRelationshipBetweenGroups(0, GetHashKey("zombie_default"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(2, GetHashKey("PLAYER"), GetHashKey("zombie_default"))

    RequestModel(GetHashKey("u_m_y_zombie_01"))
    while not HasModelLoaded(GetHashKey("u_m_y_zombie_01")) or not HasCollisionForModelLoaded(GetHashKey("u_m_y_zombie_01")) do
        Wait(1)
    end


    -- Disable Ped Animation
    SetPedCanPlayGestureAnims(self.zombiePed, 0)
    SetPedCanPlayAmbientAnims(self.zombiePed, 0)


    -- Movement
    SetPedPathCanUseLadders(self.zombiePed, 0)
    SetPedPathCanUseClimbovers(self.zombiePed, 0)
    SetPedCanRagdollFromPlayerImpact(self.zombiePed, 0)

    -- Disable Attack things
    SetCanAttackFriendly(self.zombiePed, true, true)
    SetPedCanEvasiveDive(self.zombiePed, 0)
    SetPedCombatAttributes(self.zombiePed, 46, 1)
    SetPedCombatAbility(self.zombiePed, 0)
    SetPedCombatRange(self.zombiePed, 0)
    SetPedCombatMovement(self.zombiePed, 0)

    -- Disable Pain audio
    --DisablePedPainAudio(self.zombiePed, 1)

    SetEntityHealth(self.zombiePed, 200)

    -- Blood fx
    ApplyPedDamagePack(self.zombiePed, "BigHitByVehicle", 1, 0)
    ApplyPedDamagePack(self.zombiePed, "Explosion_Med", 1, 0)

    SetPedAlertness(self.zombiePed, 1)
    SetPedFleeAttributes(self.zombiePed, 0, 0)
    SetPedConfigFlag(self.zombiePed, 281, 1)
    TaskWanderStandard(self.zombiePed, 1.0, 10)
    SetPedKeepTask(self.zombiePed, 1)
    SetPedRelationshipGroupHash(self.zombiePed, GetHashKey("zombie_default"))
    SetEntityAsMissionEntity(self.zombiePed, 1, 1)

    RequestAnimSet("move_m@injured")
    while not HasAnimSetLoaded("move_m@injured") do
        Wait(1)
    end

    SetPedMovementClipset(self.zombiePed, "move_m@injured", 1.0)

    if not NetworkGetEntityIsNetworked(self.zombiePed) then
        NetworkRegisterEntityAsNetworked(self.zombiePed)
    end

    FreezeEntityPosition(self.zombiePed, true)

    function self.onGoToTarget(target)
        --  TaskGoToEntity(self.zombiePed, target, -1, 0.0, 5.0, 1073741824, 0)
    end

    return self
end]]