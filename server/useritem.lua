local PSRCore = exports['psr-core']:GetCoreObject()

-- drink water
PSRCore.Functions.CreateUseableItem("water", function(source, item)
    local Player = PSRCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("useitem:client:Drink", source, item.name)
end)

-- eat bread
PSRCore.Functions.CreateUseableItem("bread", function(source, item)
    local Player = PSRCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("useitem:client:Eat", source, item.name)
end)