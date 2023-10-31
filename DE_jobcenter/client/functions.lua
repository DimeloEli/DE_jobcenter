Notify = function(type, message)
    if Config.Notify == 'esx' then
        ESX.ShowNotification(message, type)
    elseif Config.Notify == 'ox' then
        lib.notify({ type = type, description = message })
    elseif Config.Notify == 'other' then
        -- Notify Stuff Here
    end
end

SpawnLocalPed = function(coords, heading)
    local model = Config.Ped  --- change the ped to your liking

	RequestModel(model)
	while not HasModelLoaded(model) do 
		Wait(5)
	end

	ped = CreatePed(5, model, coords, heading, false, false)
    SetEntityAlpha(ped, 0, false)
	FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    for i = 0, 255, 51 do
        Wait(25)
        SetEntityAlpha(ped, i, false)
    end
    
    exports.ox_target:addLocalEntity(ped, {
        {
            event = 'DE_jobcenter:jobListing',
            icon = "fas fa-university",
            label = "View Job Offerings",
            distance = 4.0
        },
    })
end

loadAnimDict = function(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end