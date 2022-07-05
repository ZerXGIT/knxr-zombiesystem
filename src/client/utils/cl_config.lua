local configJson = LoadResourceFile(GetCurrentResourceName(), "config/cl_config.json")
local tmpConfig = json.decode(configJson)

function getZombieConfig(zombieType)
    return tmpConfig["zombiesSettings"][zombieType]
end
