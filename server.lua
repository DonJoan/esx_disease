ESX = exports["es_extended"]:getSharedObject()
Config = require("config")

local DiseasedPlayers = {}

RegisterNetEvent("esx_disease:checkInfection")
AddEventHandler("esx_disease:checkInfection", function()
    local src = source
    local randomChance = math.random()
    
    if randomChance <= Config.DiseaseChance and not DiseasedPlayers[src] then
        DiseasedPlayers[src] = true
        TriggerClientEvent("esx_disease:startEffect", src)
        TriggerClientEvent("esx:showNotification", src, "You feel sick...")
    end
end)

RegisterNetEvent("esx_disease:cure")
AddEventHandler("esx_disease:cure", function()
    local src = source
    if DiseasedPlayers[src] then
        DiseasedPlayers[src] = nil
        TriggerClientEvent("esx_disease:stopEffect", src)
        TriggerClientEvent("esx:showNotification", src, "You are cured!")
    end
end)

ESX.RegisterUsableItem("antidote", function(source)
    TriggerEvent("esx_disease:cure", source)
end)



