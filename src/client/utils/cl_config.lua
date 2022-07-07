--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

  Skript created by ZerX!
]]

local configJson = LoadResourceFile(GetCurrentResourceName(), "config/cl_config.json")
local tmpConfig = json.decode(configJson)

function getZombieConfigForType(zombieType)
    return tmpConfig["zombiesSettings"][zombieType]
end

function getZombieSpawnConfig()
    return tmpConfig["spawnSettings"]
end

print(getZombieConfigForType("runner"))
