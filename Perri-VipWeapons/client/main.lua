RegisterCommand('weaponpanel', function()
    local player = Player:new()
    if not player:adminPermission() then return end

    SendNUIMessage({
        action = 'show',
        data = Config.VipWeapons
    })

    SetNuiFocus(true, true)   
end, false)

CreateThread(function()
    local player = Player:new()
    player:onPlayerLoaded()
end)

RegisterNUICallback('giveWeapon', function(data, cb)
    local player = Player:new()
    player:giveWeapon(data.playerId, data.weapon)

    cb('ok')
end)

RegisterNUICallback('removeWeapon', function(data, cb)
    local player = Player:new()
    player:removeWeapon(data.playerId, data.weapon)

    cb('ok')
end)

RegisterNUICallback('searchPlayer', function(data, cb)
    local player = Player:new() 
    local weapons = player:getPlayerWeapons(data.playerId)  
    
    cb({weapons = weapons}) 
end)

RegisterNUICallback('exit', function()
    SetNuiFocus(false, false)
end)

