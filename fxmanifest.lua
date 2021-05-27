-------------------------------------------------------------------------------
-- ShotSpotter- A Simple FiveM Script, Made By Rocket Development w/ NAT2K15 --
-------------------------------------------------------------------------------
fx_version "bodacious"
game "gta5"

-- Define the resource metadata
name "Shot Spotter"
description "This is the exact same thing as RedRums except you can actually edit the code and it's free. Made w/ @NAT2K15"
author "Rocket Development & NAT2K15"
version "v1.0.0"

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    'config.lua',
    'dependency/discord.lua',
    'server.lua'
}