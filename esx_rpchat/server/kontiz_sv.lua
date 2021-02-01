ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end

AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, string.len("/")) ~= "/" then
        local name = getIdentity(source)
	    TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, message)
    end
      CancelEvent()
end)
  
RegisterCommand('twt', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local playerHex = GetPlayerIdentifier(source)
    local name = getIdentity(source)
    local item = xPlayer.getInventoryItem('phone')
    local playerId = source
    local job2 = xPlayer.getJob().name
    fal = name.firstname .. " " .. name.lastname
    if item.count >=1 then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.2vw; margin: 0.0vw; background-color: rgba(47, 189, 255, 0.8); border-radius: 61111px;"><i class=></i><img style="vertical-align:middle" src="https://cdn.discordapp.com/attachments/730069138654888011/805549782382280754/pngguru_com-3_1.png"><span style=>@{0}: {1}.</span>',
            args = { fal, msg }
        })
        PerformHttpRequest(Config.Logs, function(err, text, headers) end, 'POST', json.encode({embeds={{title="Tweet | Logs",description="Logs System by Kontiz \n O: "..playerName.."\n Wrote: "..msg.."\n [ID]: "..playerId.."\n Job: "..job2.."",color=11393254}}}), { ['Content-Type'] = 'application/json' })
    else
        TriggerClientEvent('esx:showNotification', source, "~b~You cant write a tweet message because you dont have a phone in your inventory!")
    end
end, false)

RegisterCommand('anon', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    local playerHex = GetPlayerIdentifier(source)
    local name = getIdentity(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('phone')
    local job = xPlayer.job.name
    local playerId = source
    local job2 = xPlayer.getJob().name
    fal = name.firstname .. " " .. name.lastname
    if item.count >=1 then
        if Config.anonPolice and job == 'police' then
            TriggerClientEvent('esx:showNotification', source, "~r~You cant write an anonymous tweet message because you are a policeman!")
        else
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.2vw; margin: 0.0vw; background-color: rgba(255, 0, 0, 0.8); border-radius: 61111px;"><i class=></i><img style="vertical-align:middle" src="https://cdn.discordapp.com/attachments/783115337804939274/805515358605017169/anonymous_mask_PNG32_1.png"><span style=>[Anonymous]: {1}.</span>',
                args = { fal, msg }
            })
            PerformHttpRequest(Config.Logs, function(err, text, headers) end, 'POST', json.encode({embeds={{title="Anon Tweet | Logs",description="Logs System by Kontiz \n O: "..playerName.."\n Wrote: "..msg.."\n [ID]: "..playerId.."\n Job: "..job2.."",color=16711680}}}), { ['Content-Type'] = 'application/json' })
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~You cant write an anonymous tweet message because you dont have a phone in your inventory!")
    end
end, false)

RegisterCommand('ad', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    local steam = GetPlayerName(source)
    local playerHex = GetPlayerIdentifier(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local item = xPlayer.getInventoryItem('phone')
    local playerId = source
    local job2 = xPlayer.getJob().name
    fal = name.firstname .. " " .. name.lastname
    if item.count >=1 then
        if Config.Advertisment and job == 'unemployed' then
            TriggerClientEvent('esx:showNotification', source, "~y~You cant write an anonymous tweet message because you are unemployed!")
        else
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.2vw; margin: 0.0vw; background-color: rgba(229, 255, 0, 0.8); border-radius: 61111px;"><i class=></i><img style="vertical-align:middle" src="https://cdn.discordapp.com/attachments/730069138654888011/805548155902623798/image_3_1.png"><span style=>Advertisment: {1}.</span>',
                args = { fal, msg }
            })
            PerformHttpRequest(Config.Logs, function(err, text, headers) end, 'POST', json.encode({embeds={{title="Advertisment | Logs",description="Logs System by Kontiz \n O: "..playerName.."\n Wrote: "..msg.."\n [ID]: "..playerId.."\n Job: "..job2.."",color=16776960}}}), { ['Content-Type'] = 'application/json' })
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~y~You cant write an advertisment message because you dont have a phone in your inventory!")
    end
end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    local playerHex = GetPlayerIdentifier(source)
    local playerId = source
    
	TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.2vw; margin: 0.0vw; background-color: rgba(0, 0, 0, 0.8); border-radius: 61111px;"><i class=></i><img style="vertical-align:middle" src="https://cdn.discordapp.com/attachments/730069138654888011/805550326424797204/m5JMMrW_1.png"><span style=>OOC:{0} {1}.</span>',
        args = { playerName, msg }
    })
    PerformHttpRequest(Config.Logs, function(err, text, headers) end, 'POST', json.encode({embeds={{title="Out Of Character | Logs",description="Logs System by Kontiz \n O: "..playerName.."\n Wrote: "..msg.."\n [ID]: "..playerId.."",color=0000000}}}), { ['Content-Type'] = 'application/json' })
end, false)

RegisterCommand('rob', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    local playerHex = GetPlayerIdentifier(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local item = xPlayer.getInventoryItem('phone')
    local playerId = source
    local job2 = xPlayer.getJob().name
    if item.count >=1 then
        if Config.robPolice and job == 'police' then
            TriggerClientEvent('esx:showNotification', source, "You cant write a robbery  message because you are a policeman!")   
        else
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.2vw; margin: 0.0vw; background-color: rgba(56, 56, 56, 0.8); border-radius: 61111px;"><i class=></i><img style="vertical-align:middle" src="https://cdn.discordapp.com/attachments/730069138654888011/805548829881008147/image_4_1.png"><span style=>[Robbery]: {1}.</span>',
                args = { playerName, msg }
            })
            PerformHttpRequest(Config.Logs, function(err, text, headers) end, 'POST', json.encode({embeds={{title="Robbery | Logs",description="Logs System by Kontiz \n O: "..playerName.."\n Wrote: "..msg.."\n [ID]: "..playerId.."\n Job: "..job2.."",color=0000000}}}), { ['Content-Type'] = 'application/json' })
        end
    else
        TriggerClientEvent('esx:showNotification', source, "You cant write a robbery message because you dont have a phone in your inventory!")
    end
end, false)

RegisterCommand('elas', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(7)
    local name = getIdentity(source)
    local playerHex = GetPlayerIdentifier(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local item = xPlayer.getInventoryItem('phone')
    if job == 'police' and item.count >= 1 then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.2vw; margin: 0.0vw; background-color: rgba(55, 0, 255, 0.8); border-radius: 61111px;"><i class=></i><img style="vertical-align:middle" src="https://cdn.discordapp.com/attachments/730069138654888011/805547616136986624/unnamed_2_1.png"><span style=>ΕΛ.ΑΣ: {1}.</span>',
            args = { playerName, msg }
        })
        PerformHttpRequest(Config.Logs, function(err, text, headers) end, 'POST', json.encode({embeds={{title="Police | Logs",description="Logs System by Kontiz \n O: "..playerName.."\n Wrote: "..msg.."\n [ID]: "..playerId.."\n Job: "..job2.."",color=139}}}), { ['Content-Type'] = 'application/json' })
    else
        TriggerClientEvent('esx:showNotification', source, "~b~You cant write a police  message because you are not a policeman or you dont have a phone!")
    end
end, false)

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end


