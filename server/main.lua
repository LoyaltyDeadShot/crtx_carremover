CreateThread(function()
    while true do
        Wait(Config.Minutes * 60000)
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, description = Config.Timer5MINUTES, position = Config.OxNotifyPosition})
        Wait(300000)
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, description = Config.Timer1MINUTE, position = Config.OxNotifyPosition})
        Wait(45000)
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, description = Config.Timer10SECONDS, position = Config.OxNotifyPosition})
        Wait(10000)
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, description = Config.Timer5SECONDS, position = Config.OxNotifyPosition})
        Wait(5000)

        for i, veh in pairs(GetAllVehicles()) do
            if HasVehicleBeenOwnedByPlayer(veh) then
                if not isVehicleOccupied(veh) then
                    DeleteEntity(veh)
                end
            end
        end
        TriggerClientEvent('ox_lib:notify', -1, { title = Config.OxNotifyTitle, icon= Config.OxNotifyIcon, description = Config.VehiclesDeleted, position = Config.OxNotifyPosition})
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