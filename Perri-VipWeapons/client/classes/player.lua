Player = {}
Player.__index = Player

function Player:new()
    local self = setmetatable({}, Player)
    return self
end

function Player:adminPermission()
    local isAllowed = lib.callback.await('Perri-VipWeapons:GetAcePermission', false)
    return isAllowed
end

function Player:viewPermissions()
    return ESX.PlayerData.metadata.VipWeapons
end

function Player:isVip()
    local permission = self.viewPermissions()
    return permission and permission.vip == true
end

function Player:getWeapons()
    return ESX.PlayerData.metadata.VipWeapons.weapons
end

function Player:getLoadouts()
    return ESX.PlayerData.metadata.VipWeapons.loadouts
end

function Player:giveWeapon(id, weapon)
    if not self:adminPermission() then 
        return 
    end

    ExecuteCommand('givevipweapon ' .. id .. ' ' .. weapon)
end

function Player:removeWeapon(id, weapon)
    if not self:adminPermission() then 
        return 
    end

    ExecuteCommand('removevipweapon ' .. id .. ' ' .. weapon)
end

function Player:getPlayerWeapons(playerId)
    if not self:adminPermission() then return end
    local weapons = lib.callback.await('Perri-VipWeapons:GetPlayerWeapons', false, playerId)
   
    if not weapons or type(weapons) ~= "table" then
        return {}
    end

    return weapons 
end

function Player:onPlayerLoaded()
    while not ESX.PlayerLoaded do
        Wait(500)
    end
    
    Wait(500)
    
    TriggerServerEvent('Perri-VipWeapons:PlayerLoaded')
end