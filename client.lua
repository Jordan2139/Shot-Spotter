-------------------------------------------------------------------------------
-- ShotSpotter- A Simple FiveM Script, Made By Rocket Development w/ NAT2K15 --
-------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT THE CONFIG.LUA --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------

local blipActive = false

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(10)
        local ped = GetPlayerPed(-1)
        local shottingped = IsPedShooting(ped)
        local blacklistweapon = false;
        local x,y,z = table.unpack(GetEntityCoords(ped))
        x = tonumber(x)
        y = tonumber(y)
        z = tonumber(z)
        for i, v in ipairs(notconfig.blacklistedweapons) do
            if GetSelectedPedWeapon(ped) == GetHashKey(v) then
                blacklistweapon = true;
            end
        end
        if shottingped and not blacklistweapon then
            local silence = IsPedCurrentWeaponSilenced(ped)
            if not silence then
                local serverid = GetPlayerServerId(PlayerId())
                local hash1, hash2 = GetStreetNameAtCoord(x, y, z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
                local street1 = GetStreetNameFromHashKey(hash1)
                local street2 = GetStreetNameFromHashKey(hash2)
                TriggerServerEvent("REDRUMDDIDNOTMAKETHIS_S", serverid, street1, street2, x, y, z)
            end
        end
    end
end)


RegisterNetEvent("REDRUMDDIDNOTMAKETHIS_C")
AddEventHandler("REDRUMDDIDNOTMAKETHIS_C", function(x, y, z)
    local blip = AddBlipForRadius(x, y, z, 100.0);
    if blipActive == true then return end
    SetBlipColour(blip, 40)
    SetBlipAlpha(blip, 80)
    SetBlipSprite(blip, 9)
    blipActive = true
    if(blipActive == true) then 
        Citizen.Wait(60000)
        RemoveBlip(blip)
        blipActive = false;
        activeshooting = false;
    end
end)

RegisterNetEvent("BETTERTHANREDRUMS-NOTIFY")
AddEventHandler('BETTERTHANREDRUMS-NOTIFY', function(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, true)
end)
  