RegisterNetEvent('Perri-VipWeapons:PlayerLoaded', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local HavePerms = xPlayer.getMeta('VipWeapons')

    if HavePerms then return end

    xPlayer.setMeta('VipWeapons', {vip = false, weapons = {}, loadouts = {}})
end)

RegisterNetEvent('Perri-VipWeapons:UpdateLoadout', function(loadoutName, loadoutWithComponents)
    local xPlayer = ESX.GetPlayerFromId(source)
    local HavePerms = xPlayer.getMeta('VipWeapons').vip

    if not HavePerms then return end

    local currentVipData = xPlayer.getMeta('VipWeapons')

    if not currentVipData.loadouts then
        currentVipData.loadouts = {}
    end

    local exists = false
    for _, existingLoadout in ipairs(currentVipData.loadouts) do
        if existingLoadout.name == loadoutName then
            exists = true
            break
        end
    end

    if not exists then
        table.insert(currentVipData.loadouts, {
            name = loadoutName,
            weapons = loadoutWithComponents
        })

        xPlayer.setMeta('VipWeapons', currentVipData)

    end
end)

RegisterNetEvent('Perri-VipWeapons:DeleteLoadout', function(loadoutName)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local HavePerms = xPlayer.getMeta('VipWeapons').vip
    if not HavePerms then 
        return 
    end

    local currentVipData = xPlayer.getMeta('VipWeapons')

    if not currentVipData.loadouts then
        return 
    end

    local loadoutIndex = nil
    for index, loadout in ipairs(currentVipData.loadouts) do
        if loadout.name == loadoutName then
            loadoutIndex = index
            break
        end
    end

    if loadoutIndex then
        table.remove(currentVipData.loadouts, loadoutIndex)
        
        xPlayer.setMeta('VipWeapons', currentVipData)

    end
end)

lib.addCommand('givevipweapon', {
    help = 'Gives a weapon to a player',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id',
        },
        {
            name = 'weapon',
            type = 'string',
            help = 'Name of the weapon to give',
        }
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = args.target
    local weapon = args.weapon
    
    if not IsPlayerAceAllowed(source, "Perri-VipWeapons") then
        xPlayer.showNotification(Config.Messages['not_ace_perms'])
        return
    end

    if not target then
        xPlayer.showNotification(Config.Messages['player_not_connected'])
        return
    end

    if not weapon then
        xPlayer.showNotification(Config.Messages['no_weapon_provided'])
        return
    end

    if not Config.VipWeapons[weapon] then
        xPlayer.showNotification(Config.Messages['this_weapons_not_exist'])
        return
    end
    
    local xTarget = ESX.GetPlayerFromId(target)
    local currentVipData = xTarget.getMeta('VipWeapons')

    for _, existingWeapon in ipairs(currentVipData.weapons) do
        if existingWeapon == weapon then
            xPlayer.showNotification(Config.Messages['player_already_has_weapon'])
            return
        end
    end

    currentVipData.vip = true
    table.insert(currentVipData.weapons, weapon)

    local TargetName = xTarget.getName()
    
    local message = '🎟️ **Added by: ** ' .. getDiscordId(source) .. '\n' ..
                    '🔢 **Player ID:** ' .. source .. '\n' ..
                    '🧍‍♂️ **IC Name:** ' .. TargetName .. '\n' ..
                    '💿 **Receiver Discord:** ' .. getDiscordId(target) .. '\n\n' ..
                    '🎁 **Weapon Given:** `' .. weapon .. '`\n\n' ..
                    '🛡️ Delivered with care by: `Perri VipWeapons` ❤️'

    sendToDiscord(65280, 'Perri VIP Weapons', message, '© Perri VIP Weapons - 2025')
    xTarget.setMeta('VipWeapons', currentVipData)
    xTarget.showNotification(Config.Messages['weapon_assigned'] .. args.weapon)
    xPlayer.showNotification(Config.Messages['weapon_given'] .. args.weapon .. Config.Messages['weapon_given_to'] .. args.target .. Config.Messages['operation_successful'])
end)

lib.addCommand('removevipweapon', {
    help = 'Remove a VIP weapon from a player and also remove the associated loadout',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id',
        },
        {
            name = 'weapon',
            type = 'string',
            help = 'Name of the weapon to remove',
        }
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = args.target
    local weapon = args.weapon

    if not IsPlayerAceAllowed(source, "Perri-VipWeapons") then
        xPlayer.showNotification(Config.Messages['not_ace_perms'])
        return
    end

    if not target then
        xPlayer.showNotification(Config.Messages['player_not_connected'])
        return
    end

    if not weapon then
        xPlayer.showNotification(Config.Messages['no_weapon_provided'])
        return
    end

    if not Config.VipWeapons[weapon] then
        xPlayer.showNotification(Config.Messages['this_weapons_not_exist'])
        return
    end

    local xTarget = ESX.GetPlayerFromId(target)
    local currentVipData = xTarget.getMeta('VipWeapons')

    local found = false
    for i, existingWeapon in ipairs(currentVipData.weapons) do
        if existingWeapon == weapon then
            table.remove(currentVipData.weapons, i)
            found = true
            break
        end
    end

    if not found then
        xPlayer.showNotification(Config.Messages['player_doesnt_have_weapon'])
        return
    end

    for _, loadout in ipairs(currentVipData.loadouts or {}) do
        if loadout.weapons and loadout.weapons[weapon] then
            loadout.weapons[weapon] = nil
        end
    end

    if #currentVipData.weapons == 0 then
        currentVipData.vip = false
    end

    xTarget.setMeta('VipWeapons', currentVipData)

    local hasWeaponInInventory = false
    for _, weaponInInventory in ipairs(xTarget.loadout) do
        if weaponInInventory.name == weapon then
            hasWeaponInInventory = true
            break
        end
    end

    if hasWeaponInInventory then
        xTarget.removeWeapon(weapon)
    end

    local TargetName = xTarget.getName()
    
    local message = '🎟️ **Removed by: ** ' .. getDiscordId(source) .. '\n' ..
                    '🔢 **Player ID:** ' .. source .. '\n' ..
                    '🧍‍♂️ **IC Name:** ' .. TargetName .. '\n' ..
                    '💿 **Receiver Discord:** ' .. getDiscordId(target) .. '\n\n' ..
                    '🎁 **Weapon removed:** `' .. weapon .. '`\n\n' ..
                    '🛡️ Delivered with care by: `Perri VipWeapons` ❤️'

    sendToDiscord(16711680, 'Perri VIP Weapons', message, '© Perri VIP Weapons - 2025')

    xTarget.showNotification(Config.Messages['weapon_removed'] .. weapon)
    xPlayer.showNotification(Config.Messages['weapon_removed_from'] .. weapon .. Config.Messages['weapon_given_to'] .. target .. Config.Messages['operation_successful'])
end)

lib.addCommand('clearvipweapons', {
    help = 'clear all weapons and loadouts to a player',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id',
        }
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local target = args.target
 
    local xTarget = ESX.GetPlayerFromId(target)
    xTarget.setMeta('VipWeapons', {vip = false, weapons = {}, loadouts = {}})
end)



