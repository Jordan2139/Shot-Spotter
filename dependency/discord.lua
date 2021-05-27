-- I AM NOT THE CREATOR OF THIS. I AM JUST USING IT YOU CAN FIND THE PUBLIC SCRIPT HERE https://github.com/sadboilogan/discord_perms/blob/master/discord_perms/ -- 

if(notconfig.enableaceperms ==  false) then
    local FormattedToken = "Bot "..notconfig.bottoken

    function DiscordRequest(method, endpoint, jsondata)
        local data = nil
        PerformHttpRequest("https://discordapp.com/api/"..endpoint, function(errorCode, resultData, resultHeaders)
            data = {data=resultData, code=errorCode, headers=resultHeaders}
        end, method, #jsondata > 0 and json.encode(jsondata) or "", {["Content-Type"] = "application/json", ["Authorization"] = FormattedToken})
    
        while data == nil do
            Citizen.Wait(0)
        end
        
        return data
    end
    
    function IsRolePresent(user, role)
        local discordId = nil
        for _, id in ipairs(GetPlayerIdentifiers(user)) do
            if string.match(id, "discord:") then
                discordId = string.gsub(id, "discord:", "")
                break
            end
        end
    
        local theRole = nil
        if type(role) == "number" then
            theRole = tostring(role)
        else
            -- theRole = Config.users_roles[role]
        end
        if discordId then
            local endpoint = ("guilds/%s/members/%s"):format(notconfig.server_id, discordId)
            local member = DiscordRequest("GET", endpoint, {})
            Citizen.Wait(50)
            if member.code == 200 then
                local data = json.decode(member.data)
                local roles = data.roles
                local found = true
                for i=1, #roles do
                    if roles[i] == theRole then
                        return true
                    end
                end
                return false
            else
                return false
            end
        else
            return false
        end
    end
    
    Citizen.CreateThread(function()
        local guild = DiscordRequest("GET", "guilds/"..notconfig.server_id, {})
        if guild.code == 200 then
            local data = json.decode(guild.data)
            print("Permission system guild set to: "..data.name.." ("..data.id..")")
        else
            print("An error occured, please check your config and ensure everything is correct (Discord bot token). Error: "..(guild.data or guild.code)) 
        end
    end)
end

