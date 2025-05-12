local currentLoadout = {}
local table_loadout = {}

local menu = MenuV:CreateMenu(false, Config.Title, Config.Position, Config.RGB.r, Config.RGB.g, Config.RGB.b, Config.Size, Config.BannerIMG, 'menuv')

local menu_weapons = menu:AddButton({
    icon = '🔫',
    label = Config.Messages['vip_weapon_menu'],
    value = WeaponMenu,
    description = Config.Messages['menu_weapons_description']
})

local menu_saveLoadouts = menu:AddButton({
    icon = '💾',
    label = Config.Messages['save_loadouts'],
    value = menu2,
    description = Config.Messages['menu_save_loadouts_description']
})

local menu_viewLoadouts = menu:AddButton({
    icon = '⚙️',
    label = Config.Messages['view_loadouts'],
    value = menu2,
    description = Config.Messages['menu_view_loadouts_description']
})

local menu_remLoadouts = menu:AddButton({
    icon = '🗑️',
    label = Config.Messages['delete_loadouts'],
    value = menu2,
    description = Config.Messages['menu_rem_loadouts_description']
})

local removeall = menu:AddButton({
    icon = '❌',
    label = Config.Messages['vip_weapon_menu_removeall'],
    value = 'removeall',
    description = Config.Messages['menu_remove_all_weapons_description']
})

removeall:On('select', function(item, value)
    local ped = ESX.PlayerData.ped
    local weaponHash = GetSelectedPedWeapon(ped)  

    if IsWeaponValid(weaponHash) then
        RemoveWeaponFromPed(ped, weaponHash)
        ShowNotification(Config.Messages['vip_weapon_menu_removed_all_weapons']) 
    else
        ShowNotification(Config.Messages['weapon_despawned']:format("Ningún arma"))
    end
end)

menu_saveLoadouts:On('select', function()
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)

    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end

    if (GetOnscreenKeyboardResult()) then
        local loadoutName = GetOnscreenKeyboardResult() 

        if loadoutName and loadoutName ~= "" then
            local player = Player.new()
            local currentLoadout = player.getWeapons()

            if currentLoadout and #currentLoadout > 0 then
                local loadoutWithComponents = {}

                for _, weaponName in pairs(currentLoadout) do
                    local weaponHash = GetHashKey(weaponName)
                    if HasPedGotWeapon(PlayerPedId(), weaponHash, false) then
                        local components = {}

                        local weaponConfig = Config.VipWeapons[weaponName]
                        if weaponConfig and weaponConfig.attachments then
                            for _, attachmentList in pairs(weaponConfig.attachments) do
                                for _, attachment in ipairs(attachmentList) do
                                    local componentHash = GetHashKey(attachment.value)
                                    if HasPedGotWeaponComponent(PlayerPedId(), weaponHash, componentHash) then
                                        table.insert(components, attachment.value)
                                    end
                                end
                            end
                        end

                        loadoutWithComponents[weaponName] = components
                    end
                end

                table_loadout[loadoutName] = loadoutWithComponents

                TriggerServerEvent('Perri-VipWeapons:UpdateLoadout', loadoutName, loadoutWithComponents)

                ShowNotification(Config.Messages['loadout_saved']:format(loadoutName))
            else
                ShowNotification(Config.Messages['loadout_save_error'])
            end
        else
            ShowNotification(Config.Messages['loadout_save_error'])
        end
    end
end)

menu_viewLoadouts:On('select', function()
    local player = Player.new()
    local loadouts = player.getLoadouts()

    if loadouts and #loadouts > 0 then
        local loadoutMenu = MenuV:CreateMenu(false, Config.Messages['menu_view_loadouts_title'], Config.Position, Config.RGB.r, Config.RGB.g, Config.RGB.b, Config.Size, Config.BannerIMG, 'menuv')

        for _, loadout in ipairs(loadouts) do
            local loadoutButton = loadoutMenu:AddButton({
                icon = '📋',
                label = loadout.name,  
                value = loadout.name,  
                description = Config.Messages['loadout_spawn_description']
            })


            loadoutButton:On('select', function(item, value)
                local loadoutDetails = loadouts[_]

                if loadoutDetails then
                    for weaponName, components in pairs(loadoutDetails.weapons) do
                        local weaponConfig = Config.VipWeapons[weaponName]
                        if weaponConfig then
                            local weaponHash = GetHashKey(weaponName)
                            GiveWeaponToPed(PlayerPedId(), weaponHash, weaponConfig.spawnammo, true, true)

                            if components then
                                for _, component in ipairs(components) do
                                    local componentHash = GetHashKey(component)
                                    GiveWeaponComponentToPed(PlayerPedId(), weaponHash, componentHash)
                                end
                            end

                            ShowNotification(Config.Messages['loadout_successfully_spawned'])
                        else
                            ShowNotification(Config.Messages['loadout_no_weapons'])
                        end
                    end
                end
            end)
        end

        MenuV:OpenMenu(loadoutMenu)
    else
        ShowNotification(Config.Messages['no_loadouts'])
    end
end)

menu_remLoadouts:On('select', function()
    local removeMenu = MenuV:CreateMenu(false, Config.Messages['menu_remove_all_loadouts'], Config.Position, Config.RGB.r, Config.RGB.g, Config.RGB.b, Config.Size, Config.BannerIMG, 'menuv')
    local player = Player.new()
    
    local loadouts = player.getLoadouts()

    for _, loadout in ipairs(loadouts) do
        local loadoutName = loadout.name  

        removeMenu:AddButton({
            icon = '🗑️',
            label = loadoutName,
            value = loadoutName,
            description = Config.Messages['click_to_delete_this_loadout'],
            select = function()
                TriggerServerEvent('Perri-VipWeapons:DeleteLoadout', loadoutName)
                
                ShowNotification(Config.Messages['loadout_deleted_notification'] .. loadoutName)

                MenuV:CloseMenu()
            end
        })
    end

    MenuV:OpenMenu(removeMenu)
end)


local WeaponMenu = MenuV:CreateMenu(false, Config.Messages['menu_vip_weapons_label'], Config.Position,Config.RGB.r, Config.RGB.g, Config.RGB.b, Config.Size, Config.BannerIMG, 'menuv')

menu_weapons:On('select', function()
    MenuV:OpenMenu(WeaponMenu)
end)

WeaponMenu:On('open', function(m)
    m:ClearItems()
    local player = Player.new()
    local weapons = player.getWeapons()

    for k, v in pairs(weapons) do
        if Config.VipWeapons[v] then
            local weaponConfig = Config.VipWeapons[v]

            m:AddButton({
                icon = '🔫',
                label = weaponConfig.label,
                value = weaponConfig.weaponName,
                description = (weaponConfig.label),
                select = function()
                    local weaponMenu = MenuV:CreateMenu(false, Config.Messages['menu_vip_customizing'] .. weaponConfig.label, Config.Position, Config.RGB.r, Config.RGB.g, Config.RGB.b, Config.Size, Config.BannerIMG, 'menuv')

                    local spawn = weaponMenu:AddButton({
                        icon = '📋',
                        label = Config.Messages['menu_spawn_message'] .. weaponConfig.label,
                        value = 'spawner',
                        description = Config.Messages['menu_spawn_message_description'] .. weaponConfig.label
                    })

                    spawn:On('select', function(item, value)
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(v), weaponConfig.spawnammo, true, true)
                        ShowNotification("Spawned " .. weaponConfig.label)
                    end)

                    local despawn = weaponMenu:AddButton({
                        icon = '📋',
                        label = Config.Messages['menu_despawn_message'] .. weaponConfig.label,
                        value = 'despawner',
                        description = Config.Messages['menu_despawn_message'] .. weaponConfig.label
                    })

                    despawn:On('select', function(item, value)
                        RemoveWeaponFromPed(PlayerPedId(), GetHashKey(v))
                        ShowNotification(Config.Messages['menu_spawn_message_description'] .. weaponConfig.label)
                    end)

                    local refill = weaponMenu:AddButton({
                        icon = '📌',
                        label = Config.Messages['reload_bullets'],
                        value = 'refillammo',
                        description = Config.Messages['reload_weapon_100']
                    })

                    refill:On('select', function(item, value)
                        AddAmmoToPed(PlayerPedId(), GetHashKey(v), 100)
                        ShowNotification(Config.Messages['bullets_reload'])
                    end)

                    for attachments_key, attachments_value in pairs(weaponConfig.attachments) do
                        if attachments_value then
                            local attachment = weaponMenu:AddButton({
                                icon = '🔫',
                                label = attachments_key,
                                value = 'spawner',
                                description = Config.Messages['change_your'] .. attachments_key
                            })
                            attachment:On('select', function(item, value)
                                local componentsmenu = MenuV:CreateMenu(false, Config.Messages['changing_accesories'],
                                    Config.Position,
                                   Config.RGB.r, Config.RGB.g, Config.RGB.b, Config.Size, Config.BannerIMG, 'menuv')
                                for _, attach_item in ipairs(attachments_value) do
                                    local component = componentsmenu:AddButton({
                                        icon = '🔫',
                                        label = attach_item.label,
                                        value = 'component',
                                        description = attach_item.label
                                    })
                                    component:On('select', function(item, value)
                                        if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey(v), GetHashKey(attach_item.value)) then
                                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(v),
                                                GetHashKey(attach_item.value))
                                        else
                                            GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(v),
                                                GetHashKey(attach_item.value))
                                        end
                                    end)
                                end
                                MenuV:OpenMenu(componentsmenu)
                            end)
                        end
                    end
                    MenuV:OpenMenu(weaponMenu)
                end
            })
        end

    end
end)

RegisterCommand('OpenVipWeaponMenu', function()
    local player = Player.new()
    if not player:isVip() then
        return
    end

    MenuV:OpenMenu(menu)
end, false)

RegisterKeyMapping('OpenVipWeaponMenu', 'open perri weapon menu', 'keyboard', Config.OpenKey)
