RegisterServerEvent('DE_jobcenter:setJob:s')
AddEventHandler('DE_jobcenter:setJob:s', function(name, grade)
	local xPlayer  = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.setJob(name, grade)
    end
end)