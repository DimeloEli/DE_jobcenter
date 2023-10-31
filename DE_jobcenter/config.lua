Config = {}

Config.Notify = 'ox' -- 'esx' / 'ox' / 'other'
Config.PedLocation = vector4(-139.05, -634.12, 168.82 - 0.99, 4.93) -- Ped Spawn Location
Config.Ped = 'cs_nigel'
Config.PedDist = 6.0

Config.Jobs = {
    {label = 'Unemployed', name = 'unemployed', grade = 0},
    {label = 'Garbage Collector', name = 'garbage', grade = 0}
}

Config.Blacklistedjobs = {
    'police',
    'ambulance',
    'mechanic'
}

Config.Blip = {
    {
        coords = vector3(-118.06, -606.94, 36.28),
        sprite = 525,
        scale  = 0.5,
        color  = 1,
        label = 'Job Center'
    }
}