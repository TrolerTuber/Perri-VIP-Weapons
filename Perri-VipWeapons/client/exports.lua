--- @function isVip
--- @return boolean: Return if player has permissions
exports('isVip', function()
    local player = Player:new() 
    return player:isVip()       
end)

--- @function getWeapons
--- @return table: Return player weapons
exports('getWeapons', function()
    local player = Player:new()  
    return player:getWeapons()   
end)

--- @function getLoadouts
--- @return table: Return player loadouts
exports('getLoadouts', function()
    local player = Player:new()  
    return player:getLoadouts()  
end)
