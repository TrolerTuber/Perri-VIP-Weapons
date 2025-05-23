lib.callback.register('Perri-VipWeapons:GetAcePermission', function()
    return IsPlayerAceAllowed(source, "Perri-VipWeapons")
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