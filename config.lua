Config = {}

Config.Progressbar = {
    Szukanie = 10 * 1000, -- 10 sekund
}

Config.Pojazd = 'bison3'
Config.Coords = vector4(-1922.4978027344, 2040.5728759766, 140.73529052734, 251.91)

Config.FuelSystem = function(vehicle, level)
    SetVehicleFuelLevel(vehicle, level)
end

Config.Sprzedaz = {
    wino = math.random(10, 15),
}

Config.LokacjeWina = {
    {
        coords = vector3(-1906.0151367188, 2109.8208007813, 131.09222412109),
    },
    {
        coords = vector3(-1895.7978515625, 2109.1520996094, 134.14353942871),
    },
    {
        coords = vector3(-1888.1535644531, 2108.3298339844, 35.85682678223),
    },
    {
        coords = vector3(-1879.8735351563, 2107.685546875, 136.79055786133),
    },
}

Config.Markery = {
    {x = -571.2991, y = -1696.5153, z = 20.6173},
    {x = -585.0408, y = -1689.7080, z =  19.6635},
    {x = -585.9117, y = -1703.7997, z = 19.8357},
    {x = -577.6200, y = -1707.2690, z = 19.8530},
    {x = -555.9897, y = -1684.6169, z = 19.9687}, 
    {x = -498.9272, y = -1714.0450, z = 20.8992}, 
}

Config.Stroj = {
	VINIARZ = {
        hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 13 },
            female = { drawable = 0,  texture = 0 }
        },
        torso = {
            male = { drawable = 108,  texture = 8 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 65,  texture = 2 },
            female = { drawable = 282,  texture = 0 }
        },
        leg = {
            male = { drawable = 38,  texture = 2 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 12,  texture = 6 },
            female = { drawable = 4,  texture = 1 }
        },
	},
}