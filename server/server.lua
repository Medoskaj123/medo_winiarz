ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('medo_winiarz:dajpaczke')
AddEventHandler('medo_winiarz:dajpaczke', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('paczka_winogorn', 1)
end)

RegisterServerEvent('medo_winiarz:umyjwinogronoo')
AddEventHandler('medo_winiarz:umyjwinogronoo', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('ugniecionowinogrono', 5)
    xPlayer.addInventoryItem('umytewinogrono', 5)
end)

RegisterServerEvent('medo_winiarz:sprzdajwinogronoo')
AddEventHandler('medo_winiarz:sprzdajwinogronoo', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('butelkowanewino', 1)
    xPlayer.addInventoryItem('money', 300)
end)

RegisterServerEvent('medo_winiarz:butelkujwinoo')
AddEventHandler('medo_winiarz:butelkujwinoo', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('umytewinogrono', 5)
    xPlayer.addInventoryItem('butelkowanewino', 1)
end)

RegisterServerEvent('medo_winiarz:zabierzpaczke')
AddEventHandler('medo_winiarz:zabierzpaczke', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('paczka_winogorn', 1)
end)

RegisterServerEvent('medo_winiarz:ugniecwinogorono')
AddEventHandler('medo_winiarz:ugniecwinogorono', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('ugniecionowinogrono', 5)
end)

RegisterServerEvent('medo_winiarz:wezsianozaauto')
AddEventHandler('medo_winiarz:wezsianozaauto', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('money', 250)
end)

RegisterServerEvent('medo_winiarz:dajsianozaauto')
AddEventHandler('medo_winiarz:dajsianozaaut', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('money', 250)

end)
