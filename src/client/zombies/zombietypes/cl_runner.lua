
function spawnRunner(x, y, z)
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
    SetPedCombatRange(self.zombiePed,0)
    SetPedCombatMovement(self.zombiePed, 0)

    -- Disable Pain audio
    --DisablePedPainAudio(self.zombiePed, 1)

    SetEntityHealth(self.zombiePed, 200)

    -- Blood fx
    ApplyPedDamagePack(self.zombiePed, "BigHitByVehicle", 1, 0)
    ApplyPedDamagePack(self.zombiePed, "Explosion_Med", 1, 0)

    SetPedAlertness(self.zombiePed, 1)
    SetPedFleeAttributes(self.zombiePed, 0, 0)
    SetPedConfigFlag(self.zombiePed,281, 1)
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
end