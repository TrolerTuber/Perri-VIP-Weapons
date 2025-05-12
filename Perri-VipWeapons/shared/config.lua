Config = {}

Config.OpenKey = 'F4'
Config.Title = 'Lunar RP | Armas VIP'

Config.RGB = { -- Color Menu
    r = 0,
    g = 150,
    b = 255
}

Config.Position = 'centerright'
Config.Size = 'size-75' -- 25, 50, 75, 100, 125 etc
Config.BannerIMG = 'lunar' -- default, example etc, you can add custom banner in the menuv script
Config.Messages = {
    -- NOTIFICATIONS
    ['player_not_connected'] = "The player is not connected or the ID is invalid",
    ['no_weapon_provided'] = "You haven't provided a weapon or it's invalid",
    ['player_already_has_weapon'] = "The player already has this weapon",
    ['weapon_assigned'] = "You've received the VIP weapon: ",
    ['weapon_given'] = "You gave the weapon: ",
    ['weapon_given_to'] = " to ",
    ['operation_successful'] = " Successfully",
    ['vip_weapon_menu_removed_all_weapons'] = 'Weapon removed',
    ['loadout_deleted_notification'] = 'Loadout deleted: ',
    ['this_weapons_not_exist'] = 'This weapon does not exist or is misspelled',
    ['bullets_reload'] = "Bullets reloaded",

    -- MENU
    ['vip_weapon_menu'] = "VIP Weapons",
    ['view_loadouts'] = "View Loadouts",
    ['delete_loadouts'] = "Delete Loadouts",
    ['vip_weapon_menu_removeall'] = "Remove All Weapons",
    ['save_loadouts'] = "Save Current Loadout",
    ['reload_bullets'] = "Reload Bullets",
    ['change_your'] = "Change your ",
    ['changing_accesories'] = "Changing accessories",
    
    -- Menu Titles
    ['menu_vip_weapons_title'] = 'VIP Weapons',
    ['menu_save_loadouts_title'] = 'Save Loadouts',
    ['menu_view_loadouts_title'] = 'View Loadouts',
    ['menu_rem_loadouts_title'] = 'Delete Loadouts',
    ['menu_remove_all_weapons_title'] = 'Remove All Weapons',
    ['reload_weapon_100'] = "Reload weapon (100 bullets)",
    
    -- Button Descriptions in Menus
    ['menu_weapons_description'] = 'Access the VIP weapon menu and customize your weapons.',
    ['menu_save_loadouts_description'] = 'Save your current weapons and components into a loadout.',
    ['menu_view_loadouts_description'] = 'View your saved loadouts and load one.',
    ['menu_rem_loadouts_description'] = 'Delete a previously saved loadout.',
    ['menu_remove_all_weapons_description'] = 'Remove all the weapons you have in your inventory.',

    -- Weapon Descriptions
    ['weapon_description'] = "Access the customization menu for each available VIP weapon.",
    ['weapon_customization_description'] = "Spawn, despawn and modify weapon features, and change components.",
    ['ammo_refill_description'] = "Refill your current weapon's ammunition.",
    ['spawn_weapon_description'] = "Spawn the selected weapon into your inventory.",
    ['despawn_weapon_description'] = "Remove the weapon from your inventory.",
    ['attach_component_description'] = "Add or remove components from your selected weapons.",

    -- Main Menu
    ['menu_vip_weapons_label'] = "VIP Weapons",
    ['menu_vip_weapons_value'] = "vipWeaponMenu", 
    ['menu_save_loadouts_label'] = "Save Loadouts",
    ['menu_save_loadouts_value'] = "saveLoadouts",
    ['menu_view_loadouts_label'] = "View Loadouts",
    ['menu_view_loadouts_value'] = "viewLoadouts",
    ['menu_rem_loadouts_label'] = "Delete Loadouts",
    ['menu_rem_loadouts_value'] = "remLoadouts",
    ['menu_remove_all_weapons_label'] = "Remove All Weapons",
    ['menu_remove_all_weapons_value'] = "removeAllWeapons",
    ['menu_remove_all_loadouts'] = "Delete Loadouts",
    ['menu_vip_customizing'] = "Customizing: ",

    -- Button Descriptions
    ['menu_vip_weapons_button_description'] = 'Access all available VIP weapons and customize them as desired.',
    ['menu_save_loadouts_button_description'] = 'Save your current weapon loadout for future use.',
    ['menu_view_loadouts_button_description'] = 'View all saved loadouts and load one if desired.',
    ['menu_rem_loadouts_button_description'] = 'Delete a saved loadout you no longer wish to use.',
    ['menu_remove_all_weapons_button_description'] = 'Remove all weapons currently in your inventory.',
    ['click_to_delete_this_loadout'] = 'Click to delete this loadout.',

    -- Confirmation and Operation Messages
    ['loadout_saved'] = "Loadout successfully saved: %s",
    ['loadout_save_error'] = "Error saving the loadout, please try again.",
    ['loadout_delete_error'] = "Error deleting the loadout, please try again.",
    ['weapon_spawned'] = "You spawned the weapon: %s",
    ['weapon_despawned'] = "You removed the weapon: %s",
    ['ammo_refilled'] = "Weapon ammo reloaded: %s",
    ['no_attachments_found'] = "No components found for this weapon",
    ['attachments_loaded'] = "Weapon components loaded successfully",
    ['loadout_successfully_spawned'] = "Loadout successfully loaded",
    ['loadout_no_weapons'] = "This loadout has no weapons available",
    ['no_loadouts'] = "You have no saved loadouts",
    ['loadout_deleted'] = "Loadout successfully deleted",
    ['loadout_not_found'] = "Loadout not found, check if it is properly configured",

    -- Weapon inside Menu spawn / despawn 
    ['menu_spawn_message'] = 'Spawn ',
    ['menu_spawn_message_description'] = 'Spawn your ',

    ['menu_despawn_message'] = 'Despawn ',
    ['menu_despawn_message_description'] = 'Despawn your ',


    -- Remove weapon command
    ['player_doesnt_have_weapon'] = 'The player does not have this VIP weapon.',
    ['weapon_removed'] = 'The VIP weapon has been removed from you: ',
    ['weapon_removed_from'] = 'You removed the VIP weapon: ',
    
    ['not_ace_perms'] = 'You do not have ace permission in server.cfg: '
}


Config.VipWeapons = {
    ["WEAPON_PISTOL"] = {
        label = "Pistol",
        weaponName = "WEAPON_PISTOL",
        spawnammo = 100,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_PISTOL_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_PISTOL_CLIP_02" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_AT_PI_SUPP_02" }
            },
            ["Flashlights"] = {
                { label = "Flashlight", value = "COMPONENT_AT_PI_FLSH" }
            },
            ["Tints"] = {
                { label = "Yusuf Amir Luxury Finish", value = "COMPONENT_PISTOL_VARMOD_LUXE" }
            }
        }
    },
    ["WEAPON_COMBATPISTOL"] = {
        label = "Combat Pistol",
        weaponName = "WEAPON_COMBATPISTOL",
        spawnammo = 100,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_COMBATPISTOL_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_COMBATPISTOL_CLIP_02" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_AT_PI_SUPP" }
            },
            ["Flashlights"] = {
                { label = "Flashlight", value = "COMPONENT_AT_PI_FLSH" }
            },
            ["Tints"] = {
                { label = "Yusuf Amir Luxury Finish", value = "COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER" }
            }
        }
    },
    ["WEAPON_APPISTOL"] = {
        label = "AP Pistol",
        weaponName = "WEAPON_APPISTOL",
        spawnammo = 100,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_APPISTOL_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_APPISTOL_CLIP_02" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_AT_PI_SUPP" }
            },
            ["Flashlights"] = {
                { label = "Flashlight", value = "COMPONENT_AT_PI_FLSH" }
            },
            ["Tints"] = {
                { label = "Gilded Gun Metal Finish", value = "COMPONENT_APPISTOL_VARMOD_LUXE" }
            }
        }
    },
    ["WEAPON_PISTOL50"] = {
        label = "Pistol .50",
        weaponName = "WEAPON_PISTOL50",
        spawnammo = 100,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_PISTOL50_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_PISTOL50_CLIP_02" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_AT_AR_SUPP_02" }
            },
            ["Flashlights"] = {
                { label = "Flashlight", value = "COMPONENT_AT_PI_FLSH" }
            },
            ["Tints"] = {
                { label = "Platinum Pearl Deluxe Finish", value = "COMPONENT_PISTOL50_VARMOD_LUXE" }
            }
        }
    },
    ["WEAPON_REVOLVER"] = {
        label = "Heavy Revolver",
        weaponName = "WEAPON_REVOLVER",
        spawnammo = 100,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_REVOLVER_CLIP_01" }
            },
            ["Tints"] = {
                { label = "VIP Variant", value = "COMPONENT_REVOLVER_VARMOD_BOSS" },
                { label = "Bodyguard Variant", value = "COMPONENT_REVOLVER_VARMOD_GOON" }
            }
        }
    },
    ["WEAPON_SNSPISTOL"] = {
        label = "SNS Pistol",
        weaponName = "WEAPON_SNSPISTOL",
        spawnammo = 100,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_SNSPISTOL_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_SNSPISTOL_CLIP_02" }
            },
            ["Tints"] = {
                { label = "Etched Wood Grip Finish", value = "COMPONENT_SNSPISTOL_VARMOD_LOWRIDER" }
            }
        }
    },
    ["WEAPON_HEAVYPISTOL"] = {
        label = "Heavy Pistol",
        weaponName = "WEAPON_HEAVYPISTOL",
        spawnammo = 100,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_HEAVYPISTOL_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_HEAVYPISTOL_CLIP_02" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_AT_PI_SUPP" }
            },
            ["Flashlights"] = {
                { label = "Flashlight", value = "COMPONENT_AT_PI_FLSH" }
            },
            ["Tints"] = {
                { label = "Etched Wood Grip Finish", value = "COMPONENT_HEAVYPISTOL_VARMOD_LUXE" }
            }
        }
    },
    ["WEAPON_VINTAGEPISTOL"] = {
        label = "Vintage Pistol",
        weaponName = "WEAPON_VINTAGEPISTOL",
        spawnammo = 100,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_VINTAGEPISTOL_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_VINTAGEPISTOL_CLIP_02" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_AT_PI_SUPP" }
            }
        }
    },
    ["WEAPON_CERAMICPISTOL"] = {
        label = "Ceramic Pistol",
        weaponName = "WEAPON_CERAMICPISTOL",
        spawnammo = 100,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_CERAMICPISTOL_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_CERAMICPISTOL_CLIP_02" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_CERAMICPISTOL_SUPP" }
            }
        }
    },

    -- Submachine Guns
    ["WEAPON_MICROSMG"] = {
        label = "Micro SMG",
        weaponName = "WEAPON_MICROSMG",
        spawnammo = 150,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_MICROSMG_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_MICROSMG_CLIP_02" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_AT_AR_SUPP_02" }
            },
            ["Flashlights"] = {
                { label = "Flashlight", value = "COMPONENT_AT_PI_FLSH" }
            },
            ["Scopes"] = {
                { label = "Scope", value = "COMPONENT_AT_SCOPE_MACRO" }
            },
            ["Tints"] = {
                { label = "Yusuf Amir Luxury Finish", value = "COMPONENT_MICROSMG_VARMOD_LUXE" }
            }
        }
    },
    ["WEAPON_SMG"] = {
        label = "SMG",
        weaponName = "WEAPON_SMG",
        spawnammo = 150,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_SMG_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_SMG_CLIP_02" },
                { label = "Drum Magazine", value = "COMPONENT_SMG_CLIP_03" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_AT_PI_SUPP" }
            },
            ["Flashlights"] = {
                { label = "Flashlight", value = "COMPONENT_AT_AR_FLSH" }
            },
            ["Scopes"] = {
                { label = "Scope", value = "COMPONENT_AT_SCOPE_MACRO_02" }
            },
            ["Tints"] = {
                { label = "Yusuf Amir Luxury Finish", value = "COMPONENT_SMG_VARMOD_LUXE" }
            }
        }
    },
    ["WEAPON_ASSAULTSMG"] = {
        label = "Assault SMG",
        weaponName = "WEAPON_ASSAULTSMG",
        spawnammo = 150,
        attachments = {
            ["Magazines"] = {
                { label = "Default Clip", value = "COMPONENT_ASSAULTSMG_CLIP_01" },
                { label = "Extended Clip", value = "COMPONENT_ASSAULTSMG_CLIP_02" }
            },
            ["Suppressors"] = {
                { label = "Suppressor", value = "COMPONENT_AT_AR_SUPP_02" }
            },
            ["Flashlights"] = {
                { label = "Flashlight", value = "COMPONENT_AT_AR_FLSH" }
            },
            ["Scopes"] = {
                { label = "Scope", value = "COMPONENT_AT_SCOPE_MACRO" }
            },
            ["Tints"] = {
                { label = "Yusuf Amir Luxury Finish", value = "COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER" }
            }
        }
    },
    ["WEAPON_GLOCK19GEN4"] = {
       label = "Glock 19 Gen4",
       weaponName = "WEAPON_GLOCK19GEN4",
       spawnammo = 150,
       attachments = {
            ["Cargadores"] = {
                { label = "Cargador Estándar (17 balas)", value = "COMPONENT_GLOCK19GEN4_CLIP_01" },
                { label = "Cargador Extendido (21 balas)", value = "COMPONENT_GLOCK19GEN4_CLIP_02" }
            },
            ["Silenciadores"] = {
                { label = "Linterna táctica", value = "COMPONENT_GLOCK19GEN4_FLSH_01" }
            }
        }
    },


    ["WEAPON_M6IC"] = {
        label = "M6IC Rifle",
        weaponName = "WEAPON_M6IC",
        spawnammo = 200,
        attachments = {
            ["Cargadores"] = {
                { label = "Clip 01", value = "COMPONENT_M6IC_CLIP_01" },
                { label = "Clip 02", value = "COMPONENT_M6IC_CLIP_02" },
                { label = "Clip 03", value = "COMPONENT_M6IC_CLIP_03" },
                { label = "Clip 04", value = "COMPONENT_M6IC_CLIP_04" },
                { label = "Clip 05", value = "COMPONENT_M6IC_CLIP_05" },
                { label = "Clip 06", value = "COMPONENT_M6IC_CLIP_06" }
            },
            ["Silenciadores"] = {
                { label = "Suppressor 01", value = "COMPONENT_M6IC_SUPP_01" },
                { label = "Suppressor 02", value = "COMPONENT_M6IC_SUPP_02" },
                { label = "Suppressor 03", value = "COMPONENT_M6IC_SUPP_03" }
            },
            ["Linternas"] = {
                { label = "Flashlight 01", value = "COMPONENT_M6IC_FLSH_01" },
                { label = "Flashlight 02", value = "COMPONENT_M6IC_FLSH_02" }
            },
            ["Culatas"] = {
                { label = "Stock 01", value = "COMPONENT_M6IC_STOCK_01" },
                { label = "Stock 02", value = "COMPONENT_M6IC_STOCK_02" },
                { label = "Stock 03", value = "COMPONENT_M6IC_STOCK_03" },
                { label = "Stock 04", value = "COMPONENT_M6IC_STOCK_04" },
                { label = "Stock 05", value = "COMPONENT_M6IC_STOCK_05" },
                { label = "Stock 06", value = "COMPONENT_M6IC_STOCK_06" },
                { label = "Stock 07", value = "COMPONENT_M6IC_STOCK_07" }
            },
            ["Marco"] = {
                { label = "Frame 01", value = "COMPONENT_M6IC_FRAME_01" },
                { label = "Frame 02", value = "COMPONENT_M6IC_FRAME_02" }
            }
        }
    },

    -- you can add more https://wiki.rage.mp/wiki/Weapons_Components
}