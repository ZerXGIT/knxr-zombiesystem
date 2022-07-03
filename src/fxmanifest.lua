fx_version 'bodacious'
games { 'gta5' }

client_scripts {
    "client/utils/cl_config.lua",
    "client/utils/cl_zombieutils.lua",
    "client/utils/cl_animandmodelutils.lua",
    "client/zombies/cl_zombieped.lua",
    "client/zombies/zombietypes/cl_walker.lua",
    "client/zombies/zombietypes/cl_runner.lua",
    "client/cl_debugmode.lua",
    "client/cl_main.lua"
}

server_scripts {
    "sv_main.lua"
}

file 'config/cl_config.json'