local webhook = ''

-- Don't touch, only change the webhook
function sendToDiscord(color, name, message, footer)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local embed = {
        {
            ["color"] = color,
            ["title"] = "**" .. name .. "**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }
    
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function getDiscordId(source)
    local identifiers = GetPlayerIdentifiers(source)
    local discordId = nil
    
    for i=1, #identifiers do
        if string.match(identifiers[i], "discord") then
            discordId = identifiers[i]
        end
    end
    
    return discordId and "<@" .. discordId:gsub("discord:", "") .. "> " or "No Discord ID Found"
end
