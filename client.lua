RegisterNetEvent("esx_disease:startEffect")
AddEventHandler("esx_disease:startEffect", function()
    local playerPed = PlayerPedId()
    
    -- Loop for periodic effects
    while true do
        Wait(15000)

        -- Apply a low screen shake effect
        ShakeGameplayCam("DRUNK_SHAKE", 0.2) -- Adjust intensity (0.1-1.0)

        -- Health deterioration
        if GetEntityHealth(playerPed) > 100 then
            SetEntityHealth(playerPed, GetEntityHealth(playerPed) - 10)
        end
        
        -- Play coughing animation
        TaskPlayAnim(playerPed, "amb@world_human_cough@male@base", "base", 8.0, -8.0, -1, 49, 0, false, false, false)
    end
end)

RegisterNetEvent("esx_disease:stopEffect")
AddEventHandler("esx_disease:stopEffect", function()
    StopGameplayCamShaking(true) -- Stop screen shake effect
end)


