ESX = exports['es_extended']:getSharedObject()
COA = exports['coa-base']
local Szukanie = false
PlayerData = ESX.GetPlayerData()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

--[[

# ZRYWANIE WINOGRON DO PACZEK

]]

function ZbierzWinogrono()
if COA:itemCount('paczka_winogorn') < 1 then
    if COA:itemCount('ugniecone_vino') < 6 then
    Szukanie = true
    if lib.progressBar({
        duration = Config.Progressbar.Szukanie,
        label = 'Zrywanie winogron...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            scenario = 'PROP_HUMAN_BUM_BIN'
        }
    }) then
        Szukanie = false
        TriggerServerEvent('medo_winiarz:dajpaczke')
    else
        Szukanie = false
        COA:Notify('inform', 'Przestałeś zrywać wino')
    end
else
    COA:Notify('inform', 'Nie możesz unieść więcej ugniecionego wina!')
end
else
    COA:Notify('inform', 'Masz już skrzynke z winogornami!')
end
end


--[[

# UGNIATANIE WINOGRON

]]

function UgniecWinogrono()
    if COA:itemCount('paczka_winogorn') < 1 then
        if COA:itemCount('ugniecone_vino') < 6 then
        Szukanie = true
        if lib.progressBar({
            duration = Config.Progressbar.Szukanie,
            label = 'Ugniatanie Winogron...',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
                combat = true,
            },
            anim = {
                scenario = 'WORLD_HUMAN_BUM_WASH'
            }
        }) then
            Szukanie = false
            TriggerServerEvent('medo_winiarz:ugniecwinogorono')
        else
            Szukanie = false
            COA:Notify('inform', 'Przestałeś zrywać wino')
        end
    else
        COA:Notify('inform', 'Nie możesz unieść więcej ugniecionego wina!')
    end
    else
        COA:Notify('inform', 'Masz już skrzynke z winogornami!')
    end
    end
--[[

# WYŁĄCZA BICIE SIĘ ITP GDY MAMY PACZKE W RĘKU

]]

Citizen.CreateThread(function()
    while true do
        for k in pairs(Config.Markery) do
            if PlayerData.job ~= nil and PlayerData.job.name == 'vine' then
                 DrawMarker(2, Config.Markery[k].x, Config.Markery[k].y, Config.Markery[k].z + 0.2, 0, 0, 0, 0, 0, 0, 0.451, 0.451, 0.341, 255, 230, 17, 47 ,0 ,0 ,0 ,0)
             end
        end
        if COA:itemCount('paczka_winogorn') ~= 0 then
            DisableControlAction(0, 24, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 45, true)
            DisableControlAction(0, 21, true)
			DisableControlAction(0, 22, true)
			DisableControlAction(0, 44, true) 
            DisableControlAction(0, 140, true) 
        end
        Citizen.Wait(0)
    end
end)

--[[

# TARGETY

]]
--ZRYWANIE--
CreateThread(function()
    for k, v in pairs(Config.LokacjeWina) do
        exports["qtarget"]:AddBoxZone("vine1" .. k, v.coords, 1.5, 1.5, {
            name = "vine1" .. k,
            heading = 40,
            minZ = v.coords["z"] - 2,
            maxZ = v.coords["z"] + 2,
            debugPoly = false
        }, {
            options = {
                {
                    action = function()
                        ZbierzWinogrono()
                    end,
                    icon = "fa fa-hand",
                    label = 'Zerwij winogrono',
                    job = "vine",
                    canInteract = function()
                        if not Szukanie then
                            return true
                        end
                        return false
                    end,
                }
            },
            distance = 2.0
        })
    end
end)
--ODKŁADANIE PACZKI--
RegisterNetEvent('medo_winiarz:odlozpaczke')
AddEventHandler('medo_winiarz:odlozpaczke', function()
    local paczkaCount = COA:itemCount('paczka_winogorn')
    local ugniecioneCount = COA:itemCount('ugniecione_vino')
    if paczkaCount < 6 then
    if ugniecioneCount >= 1 then
    TriggerServerEvent('medo_winiarz:zabierzpaczke')
    local paczka = CreateObject('bkr_prop_coke_heatbasket_01', -1859.1124267578, 2076.6147460938, 140.99440002441-1.0, false, false, false)
    FreezeEntityPosition(paczka, true)
    Citizen.Wait(20000)
    DeleteEntity(paczka)
    else
        COA:Notify('inform', 'Nie masz żadnej paczki!')
    end
else
COA:Notify('inform', 'Masz za dużo ugniecionych winogron jedz je przerobić!')
end
end)
--MYCIE WINA--
RegisterNetEvent('medo_winiarz:umyjwinogrono')
AddEventHandler('medo_winiarz:umyjwinogrono', function()
    local winoCount = COA:itemCount('ugniecionowinogrono')
    local ugniecioneCount = COA:itemCount('umytewinogrono')
    if ugniecioneCount < 5 then
    if winoCount >= 5 then
    TriggerServerEvent('medo_winiarz:umyjwinogronoo')
    else
        COA:Notify('inform', 'Nie masz ugniecionego wina!')
    end
else
COA:Notify('inform', 'Masz za dużo umytych winogron!')
end
end)
--BUTELKOWANIE WINA--
RegisterNetEvent('medo_winiarz:butelkujwino')
AddEventHandler('medo_winiarz:butelkujwino', function()
    local ugniecionewinoCount = COA:itemCount('umytewinogrono')
    local ugniecioneCount = COA:itemCount('butelkowanewino')
    if ugniecioneCount < 10 then
    if ugniecionewinoCount >= 5 then
    TriggerServerEvent('medo_winiarz:butelkujwinoo')
    else
    COA:Notify('inform', 'Nie masz umytego winogrona!')
    end
else
COA:Notify('inform', 'Masz za dużo butelek wina!')
end
end)
--SPRZEDAŻ WINA--
RegisterNetEvent('medo_winiarz:sprzdajwinogrono')
AddEventHandler('medo_winiarz:sprzdajwinogrono', function()
    local butlaCount = COA:itemCount('butelkowanewino')
    if butlaCount > 0 then
    TriggerServerEvent('medo_winiarz:sprzdajwinogronoo')
else
    COA:Notify('inform', 'Nie masz butelek wina!')
    end
end)

exports.qtarget:AddBoxZone("odlozpaczke", vector3(-1859.1124267578, 2076.6147460938, 140.99440002441), 1.6, 1, {
	name="odlozpaczke",
	heading=29,
	debugPoly=false,
	minZ=18.91,
	maxZ=150.41,
	}, {
		options = {
			{
				event = "medo_winiarz:odlozpaczke",
				icon = "fas fa-hand",
				label = "Odłóż paczke",
				job = "vine",
			},

		},
		distance = 2.0
})
exports.qtarget:AddBoxZone("umyjwinogrono", vector3(-1859.025390625, 2071.3181152344, 140.9956817627), 1.6, 1, {
	name="umyjwinogrono",
	heading=29,
	debugPoly=false,
	minZ=18.91,
	maxZ=150.41,
	}, {
		options = {
			{
				event = "medo_winiarz:umyjwinogrono",
				icon = "fas fa-hand",
				label = "Umyj Winogrono",
				job = "vine",
			},

		},
		distance = 2.0
})

exports.qtarget:AddBoxZone("butelkujwino", vector3(-1866.74609375, 2063.166015625, 40.9768371582), 1.6, 1, {
	name="butelkujwino",
	heading=29,
	debugPoly=false,
	minZ=18.91,
	maxZ=150.41,
	}, {
		options = {
			{
				event = "medo_winiarz:butelkujwino",
				icon = "fas fa-hand",
				label = "Butelkuj Wino",
				job = "vine",
			},

		},
		distance = 5.0
})

exports.qtarget:AddTargetModel({-1196822007}, {
		options = {
			{
                action = function()
                    UgniecWinogrono()
                end,
				icon = "fas fa-hand",
				label = "Ugniec Wino",
				job = "vine",
			},

		},
		distance = 2
})
exports.qtarget:AddTargetModel({'a_m_m_hillbilly_01'}, {
	options = {
        {
			event = "medo_winiarz:sprzdajwinogrono",
			icon = "fas fa-hand",
			label = "Sprzedaj Wino",
            job = 'vine'
		},

	},
	distance = 2
})
--[[

# FURKA WYJMOWANIE/CHOWANIE ORAZ STROJE

]]

function setUniform(uniform, playerPed)
	local sex = 0
    if (exports['fivem-appearance']:getPedModel(playerPed) == 'mp_f_freemode_01') then sex = 1 end

    for k, v in pairs(Config.Stroj[uniform]) do
        local drawable = v.male.drawable
        local texture = v.male.texture
        if (sex == 1) then
            drawable = v.female.drawable
            texture = v.female.texture
        end

        TriggerEvent('COA-base:SetClothing', k, drawable, texture)
    end
end

local hasVehicle = false
RegisterNetEvent('medo_winiarz:vehicle', function()
    if COA:itemCount('money') >=250 then
    if not hasVehicle then
    local vehicle = Config.Pojazd
    local coords = Config.Coords
    local TR = PlayerPedId()
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(0)
    end
    if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        local JobVehicle = CreateVehicle(vehicle, coords, 45.0, true, false)
        SetVehicleHasBeenOwnedByPlayer(JobVehicle,  true)
        SetEntityAsMissionEntity(JobVehicle,  true,  true)
        local num = math.random(10, 999)
        local carplate = SetVehicleNumberPlateText(JobVehicle, 'VINE'..num)
        hasVehicle = true
        Config.FuelSystem(JobVehicle, 100.0)
        SetVehicleColours(JobVehicle, 38, 38)
        local id = NetworkGetNetworkIdFromEntity(JobVehicle)
        DoScreenFadeOut(1500)
        Wait(1500)
        SetNetworkIdCanMigrate(id, true)
        TaskWarpPedIntoVehicle(TR, JobVehicle, -1)
        DoScreenFadeIn(1500)
        local plate = GetVehicleNumberPlateText(JobVehicle)
        TriggerServerEvent('COA-addkeys', plate)
        TriggerServerEvent('medo_winiarzb:wezsianozaauto')
    else
        COA:Notify('inform', 'Miejsce wyjmowania pojazdu jest zastawione!')
    end
else
    COA:Notify('inform', 'Musisz schować poprzedni pojazd przed wyjęciem kolejnego!')
end
else
    COA:Notify('inform', 'Potrzebujesz 250$ aby wyjąć pojazd służbowy!')
end
end)

RegisterNetEvent('medo_winiarz:removevehicle', function()
    if hasVehicle then
    local TR92 = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(TR92, true)
    SetEntityAsMissionEntity(TR92, true)
    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
    TriggerServerEvent('COA-removekeys', plate)
    TriggerServerEvent('medo_winiarz:dajsianozaaut')
    DeleteVehicle(vehicle)
    COA:Notify('inform', 'Schowałeś pojazd służbowy!')
    hasVehicle = false
    else
        COA:Notify('inform', 'Nie wyjąłeś żadnego pojazdu!')
    end
end)

RegisterNetEvent('medo_winiarz:viniarzstroj')
AddEventHandler('medo_winiarz:viniarzstroj', function(uniform, playerPed)
    local playerPed = PlayerPedId()
    COA:playAnim(playerPed, 'clothingtie', 'try_tie_negative_a', 2000, false)
    Wait(1000)
    setUniform('VINIARZ', playerPed)
end)

RegisterNetEvent('medo_winiarz:cywilstroj')
AddEventHandler('medo_winiarz:cywilstroj', function(skin)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end)

exports.qtarget:AddTargetModel({'a_m_y_methhead_01'}, {
	options = {
        {
			event = "medo_winiarz:vehicle",
			icon = "fas fa-car",
			label = "Wyjmij Pojazd",
            job = 'vine'
		},
		{
			event = "medo_winiarz:removevehicle",
			icon = "fas fa-car",
			label = "Schowaj Pojazd",
            job = 'vine',
            canInteract = function()
                if hasVehicle then
                    return true
                end
                return false
            end,
		},
	},
	distance = 2
})

exports.qtarget:AddTargetModel({'a_m_m_mlcrisis_01'}, {
	options = {
        {
            event = "medo_winiarz:viniarzstroj",
            icon = "fas fa-tshirt",
            label = "Strój Roboczy",
            job = 'vine'
        },
        {
            event = "medo_winiarz:cywilstroj",
            icon = "fas fa-tshirt",
            label = "Strój Prywatny",
            job = 'vine'
        },
	},
	distance = 2
})
