--[[
  _  __
 | |/ /  ___   _ _    ___  __ __  __ _   _ _
 | ' <  / -_) | ' \  / -_) \ \ / / _` | | '_|
 |_|\_\ \___| |_||_| \___| /_\_\ \__,_| |_|
           github.com/kenexar

  Skript created by ZerX!
]]

fx_version 'cerulean'
games { 'gta5' }

author 'ZerX <github.com/kenexar>'
description 'Advanced Zombie Skript'
version '1.0.0'

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