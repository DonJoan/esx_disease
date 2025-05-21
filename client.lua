RegisterNetEvent("esx_disease:startEffect")
AddEventHandler("esx_disease:startEffect", function()
    local playerPed = PlayerPedId()
    while true do
        Wait(15000)
        if GetEntityHealth(playerPed) > 100 then
            SetEntityHealth(playerPed, GetEntityHealth(playerPed) - 10) -- Gradual health loss
        end
        TaskPlayAnim(playerPed, "amb@world_human_cough@male@base", "base", 8.0, -8.0, -1, 49, 0, false, false, false)
    end
end)

RegisterNetEvent("esx_disease:stopEffect")
AddEventHandler("esx_disease:stopEffect", function()
    -- Stop animations and reset health effects
end)


