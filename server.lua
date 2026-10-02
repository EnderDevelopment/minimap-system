local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('MiniMapSystem:GetMiniMapSettings', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.fetchAll('SELECT * FROM mini_map_settings WHERE player_id = @player_id', {
        ['@player_id'] = playerId
    }, function(result)
        if result[1] then
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)

RegisterNetEvent('MiniMapSystem:SaveMiniMapSettings')
AddEventHandler('MiniMapSystem:SaveMiniMapSettings', function(settings)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.execute('INSERT INTO mini_map_settings (player_id, size, position_x, position_y, visible) VALUES (@player_id, @size, @position_x, @position_y, @visible) ON DUPLICATE KEY UPDATE size = @size, position_x = @position_x, position_y = @position_y, visible = @visible', {
        ['@player_id'] = playerId,
        ['@size'] = settings.size,
        ['@position_x'] = settings.position.x,
        ['@position_y'] = settings.position.y,
        ['@visible'] = settings.visible
    }, function(rowsChanged)
        if rowsChanged > 0 then
            print('Mini-map settings saved for player ' .. playerId)
        end
    end)
end)