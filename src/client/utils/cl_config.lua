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

function getZombieConfig(zombieType)
    return tmpConfig["zombiesSettings"][zombieType]
end
