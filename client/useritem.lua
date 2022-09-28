local PSRCore = exports['psr-core']:GetCoreObject()

RegisterNetEvent('useitem:client:Drink', function(itemName)
    local dict = "amb_rest_drunk@world_human_drinking@male_a@idle_a"
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local prop = GetHashKey("p_water01x")
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    RequestModel(prop)
    while not HasModelLoaded(prop) do
        Wait(10)
    end
	local drinkObject = CreateObject(prop, pos.x, pos.y, pos.z, true, true, false)
	local boneIndex = GetEntityBoneIndexByName(playerPed, "SKEL_R_HAND")
	AttachEntityToEntity(drinkObject, playerPed, boneIndex, 0.05, -0.07, -0.05, -75.0, 60.0, 0.0, true, true, false, true,  1, true)
	TaskPlayAnim(playerPed, dict, "idle_a", 1.0, 8.0, -1, 31, 0, false, false, false)
	Wait(5000)
	ClearPedTasks(playerPed)
	DeleteObject(drinkObject)
	SetModelAsNoLongerNeeded(prop)
	TriggerEvent("inventory:client:ItemBox", PSRCore.Shared.Items[itemName], "remove")
	TriggerServerEvent("PSRCore:Server:SetMetaData", "thirst", PSRCore.Functions.GetPlayerData().metadata["thirst"] + ConsumablesDrink[itemName])
end)

RegisterNetEvent('useitem:client:Eat', function(itemName)
    local dict = "mech_inventory@eating@multi_bite@sphere_d8-2_sandwich"
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local prop = GetHashKey("P_BREAD05X")
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    RequestModel(prop)
    while not HasModelLoaded(prop) do
        Wait(10)
    end
    local eatObject = CreateObject(prop, pos.x, pos.y, pos.z, true, true, false)
    local boneIndex = GetEntityBoneIndexByName(playerPed, "SKEL_R_HAND")
    AttachEntityToEntity(eatObject, playerPed, boneIndex, 0.1, -0.01, -0.07, -90.0, 100.0, 0.0, true, true, false, true, 1, true)
    TaskPlayAnim(playerPed, dict, "quick_right_hand", 1.0, 8.0, -1, 31, 0, false, false, false)
    Wait(2000)
    ClearPedTasks(playerPed)
    DeleteObject(eatObject)
    SetModelAsNoLongerNeeded(prop)
	TriggerEvent("inventory:client:ItemBox", PSRCore.Shared.Items[itemName], "remove")
	TriggerServerEvent("PSRCore:Server:SetMetaData", "hunger", PSRCore.Functions.GetPlayerData().metadata["hunger"] + ConsumablesEat[itemName])
end)