CreateThread(function()
    while true do
        Wait(Config.Minutes * 60000)
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, position = Config.OxNotifyPosition, description = (_U('waiting_5_minutes'))})
        Wait(300000)
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, position = Config.OxNotifyPosition, description = (_U('waiting_1_minute'))})
        Wait(45000)
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, position = Config.OxNotifyPosition, description = (_U('waiting_10_seconds'))})
        Wait(10000)
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, position = Config.OxNotifyPosition, description = (_U('waiting_5_seconds'))})
        Wait(5000)

        for i, veh in pairs(GetAllVehicles()) do
            if HasVehicleBeenOwnedByPlayer(veh) then
                if not isVehicleOccupied(veh) then
                    DeleteEntity(veh)
                end
            end
        end
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, position = Config.OxNotifyPosition, description = (_U('vehicles_deleted'))})
    end
end)

function isVehicleOccupied(veh)
    for seat = -1, 6 do
        if GetPedInVehicleSeat(veh, seat) ~= 0 then
            return true
        end
    end
    return false
end