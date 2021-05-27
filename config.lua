-------------------------------------------------------------------------------
-- ShotSpotter- A Simple FiveM Script, Made By Rocket Development w/ NAT2K15 --
-------------------------------------------------------------------------------
notconfig = {}


-- FOR DISICORD TURN THIS TO FALSE -- @NAT2K15 CAN'T SPELL
notconfig.enableaceperms = true;
notconfig.aceperms = "notredrum.shotspotter";

-- IF DISCORD IS ENABLED EDIT BELOW -- 
notconfig.bottoken = "BOT_TOKEN_FROM_https://discord.com/developers/applications";
notconfig.server_id = ""
notconfig.perms = {
    000000000000000, -- role ids that can activate the shot spotter
    000000000000000 -- role ids that can activate the shot spotter
}

-- SHOT SPOTER BELOW -- 
notconfig.wait_time_before_next_blip = 60000 -- this is in ms so example 30000 = 30 seconds
notconfig.shotspotter_timer = 1 -- this is in ms so example 30000 = 30 seconds
notconfig.usechat = false;
notconfig.blacklistedweapons = {
    "WEAPON_UNARMED",
	"WEAPON_STUNGUN",
	"WEAPON_KNIFE",
	"WEAPON_KNUCKLE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_HATCHET",
	"WEAPON_MACHETE",
	"WEAPON_FLASHLIGHT",
	"WEAPON_SWITCHBLADE",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_SNOWBALL",
	"WEAPON_FLARE",
	"WEAPON_BALL"
}

