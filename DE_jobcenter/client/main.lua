local PlayerData = {}
local pedspawned = false

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

CreateThread(function()
    for k, v in pairs(Config.Blip) do
        local blip = AddBlipForCoord(v.coords)

        SetBlipSprite (blip, v.sprite)
		SetBlipScale  (blip, v.scale)
		SetBlipColour (blip, v.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(v.label)
		EndTextCommandSetBlipName(blip)
	end
end)

CreateThread(function()
	while true do
		Wait(1000)
		
        local PedCoords = GetEntityCoords(PlayerPedId())	
		local dist = #(Config.PedLocation.xyz - PedCoords)
			
        if dist < Config.PedDist then
            if not pedspawned then
                pedspawned = true
                SpawnLocalPed(Config.PedLocation.xyz, Config.PedLocation.w)
            end
        else
            pedspawned = false
            for i = 255, 0, -51 do
                Wait(25)
                SetEntityAlpha(ped, i, false)
            end
            DeletePed(ped)
            ped = nil
        end
	end
end)

RegisterNetEvent('DE_jobcenter:jobListing')
AddEventHandler('DE_jobcenter:jobListing', function()
	local jobs = {}
    for k,v in pairs(Config.Jobs) do
        table.insert(jobs, {
            title = v.label,
            description = v.description,
            icon = v.icon,
            event = 'DE_jobcenter:setJob',
            args = { 
                name = v.name, 
                grade = v.grade 
            }
        })
    end
    
    lib.registerContext({
        id = 'job_menu',
        title = 'Job Listings',
        options = jobs
    })

    lib.showContext('job_menu')
end)

RegisterNetEvent('DE_jobcenter:setJob')
AddEventHandler('DE_jobcenter:setJob', function(data)
    for k,v in pairs (Config.Blacklistedjobs) do
        if data.name == v then 
            Notify('error', 'You cannot be hired at this job')
            return
        end
    end

    TriggerServerEvent('DE_jobcenter:setJob:s', data.name, data.grade)
    Notify('inform', 'You have been hired') 
end)
