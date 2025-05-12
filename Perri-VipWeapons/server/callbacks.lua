lib.callback.register('Perri-VipWeapons:GetAcePermission', function()
    if not IsPlayerAceAllowed(source, "Perri-VipWeapons") then
        return false
    end

    return true
end)

lib.callback.register('Perri-VipWeapons:GetPlayerWeapons', function(source, playerId)
    local xTarget = ESX.GetPlayerFromId(playerId)

    if not xTarget then
        return false
    end

    local currentVipData = xTarget.getMeta('VipWeapons')

    if not currentVipData.vip then 
        return false
    end


    return currentVipData.weapons
end)