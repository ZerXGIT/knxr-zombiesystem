--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

   Script by ZerX (github.com/ZerXGIT)
]]



--[[
ToDo:
    vlt. boss zombie
    spawnZombie(minDistance, maxDistance)
]]
function spawnZombie(x, y, z)
    local zombiePed;

    if math.random(1, 2) == 1 then
        zombiePed = walker.new(x, y, z).ped
    else
        zombiePed = runner.new(x, y, z).ped
    end

    AddRelationshipGroup("zombie_normal")

    SetRelationshipBetweenGroups(0, GetHashKey("zombie_normal"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(2, GetHashKey("PLAYER"), GetHashKey("zombie_normal"))

    -- Disable Ped Animation
    SetPedCanPlayGestureAnims(zombiePed, false)
    SetPedCanPlayAmbientAnims(zombiePed, false)


    -- Movement
    SetPedPathCanUseLadders(zombiePed, 0)
    SetPedPathCanUseClimbovers(zombiePed, 0)
    SetPedCanRagdollFromPlayerImpact(zombiePed, 0)

    -- Disable Attack things
    SetCanAttackFriendly(zombiePed, true, true)
    SetPedCanEvasiveDive(zombiePed, 0)
    SetPedCombatAttributes(zombiePed, 46, 1)
    SetPedCombatAbility(zombiePed, 0)
    SetPedCombatRange(zombiePed, 0)
    SetPedCombatMovement(zombiePed, 0)

    -- Disable Pain audio
    StopPedSpeaking(zombiePed, true)
    SetAmbientVoiceName(zombiePed, "kerry")
    DisablePedPainAudio(zombiePed, true)

    -- Blood fxwww
    ApplyPedDamagePack(zombiePed, "BigHitByVehicle", 1, 0)
    ApplyPedDamagePack(zombiePed, "Explosion_Med", 1, 0)

    SetPedAlertness(zombiePed, 1)
    SetPedFleeAttributes(zombiePed, 0, 0)
    SetPedConfigFlag(zombiePed, 281, 1)
    TaskWanderStandard(zombiePed, 1.0, 10)
    SetPedKeepTask(zombiePed, 1)
    SetPedRelationshipGroupHash(zombiePed, GetHashKey("zombie_normal"))
    SetEntityAsMissionEntity(zombiePed, 1, 1)

    if not NetworkGetEntityIsNetworked(zombiePed) then
        NetworkRegisterEntityAsNetworked(zombiePed)
    end
end