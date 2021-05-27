-------------------------------------------------------------------------------
-- ShotSpotter- A Simple FiveM Script, Made By Rocket Development w/ NAT2K15 --
-------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT THE CONFIG.LUA --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------

local active_leos = {}
local on = false;
local status = 'off'

RegisterCommand("shotspot", function(source) 
    if(notconfig.enableaceperms == true) then
        if IsPlayerAceAllowed(source, notconfig.aceperms) then
            if(status == "off" and not active_leos[source]) then
                active_leos[source] = source;
                TriggerClientEvent('chatMessage', source, "[^3Dispatch^0] You have enabled LEO blips!")
                status = 'on'
            elseif(status == "on" and active_leos[source]) then
                active_leos[source] = nil;
                TriggerClientEvent('chatMessage', source, "[^3Dispatch^0] You have disabled LEO blips!")
                status = 'off'
                end
        else 
            TriggerClientEvent('chatMessage', source, "^1[ShotSpotter] Access Denied")
        end
    else
        local check = false;
        for src, role in ipairs(notconfig.perms) do
            local perms_check = IsRolePresent(source, role)
            if(perms_check == true) then
                check = true;
            end
          end
        Citizen.Wait(1)
        if(check == true) then
            if(status == "off" and not active_leos[source]) then
                active_leos[source] = source;
                TriggerClientEvent('chatMessage', source, "[^3Dispatch^0] You have enabled LEO blips!")
                status = 'on'
            elseif(status == "on" and active_leos[source]) then
                active_leos[source] = nil;
                TriggerClientEvent('chatMessage', source, "[^3Dispatch^0] You have disabled LEO blips!")
                status = 'off'
                end
        else 
            TriggerClientEvent('chatMessage', source, "^1[ShotSpotter] Access Denied")
        end
    end
end)

RegisterNetEvent("REDRUMDDIDNOTMAKETHIS_S")
AddEventHandler("REDRUMDDIDNOTMAKETHIS_S", function(serverid, street1, street2, x, y, z)
   if not active_leos[serverid] then
    if(on == true) then return end;
        on = true;
        Citizen.Wait(notconfig.shotspotter_timer)
        for _, player in ipairs(GetPlayers()) do
            player = tonumber(player)
            if active_leos[player] then
                if(notconfig.usechat == false) then
                    TriggerClientEvent('BETTERTHANREDRUMS-NOTIFY', player, "~r~[DISPATCH]~w~ Gunshots detacted near " .. street1 .. " " .. street2)
                else 
                    TriggerClientEvent("chatMessage", player, "^2[DISPATCH]", {255,255,255}, " ^7We have received a 911 call about an active shooter on " ..street1.. " " ..street2)
                end
                TriggerClientEvent("REDRUMDDIDNOTMAKETHIS_C", player, x, y, z)      
            end
        end
        turnoff()
   end
end)


function turnoff() 
    Citizen.Wait(notconfig.wait_time_before_next_blip)
    on = false;
  end

  AddEventHandler("playerDropped", function()
    if active_leos[source] then
        active_leos[source] = nil
    end
end)
