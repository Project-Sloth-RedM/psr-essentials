local PSRCore = exports['psr-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
	DropPlayer(source, 'You Have Been Kicked For Being AFK')
end)

PSRCore.Functions.CreateCallback('qb-afkkick:server:GetPermissions', function(source, cb)
    cb(PSRCore.Functions.GetPermission(source))
end)