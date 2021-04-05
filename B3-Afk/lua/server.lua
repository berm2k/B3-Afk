--̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷
-- في حال تبدل اسم الملف مارح يشتغل السكربت
--̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷-̷

RegisterNetEvent("B3-Afk:webhook") -- Webhook 
AddEventHandler("B3-Afk:webhook", function(Value, ValueTwo, Decimal)
    local date = os.date()
    local connect = {
        {
            ["color"] = Decimal,
            ["fields"] = {
                {
                    ["name"] = ValueTwo,
                    ["value"] = Value,
                }
            },
            ["author"] = {
                ["name"] = "B3-Team",
                ["url"] = "https://discord.gg/2mNts9zxdn",
                ["icon_url"] = "https://media.discordapp.net/attachments/822416718709784626/828410763680677898/B3-AFK.png"
            },
            ["footer"] = {
                ["text"] = "Action Happened: " .. date,
                ["icon_url"] = Config.webhookImage,
            },
        }
    }
    PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = Config.webhookImage}), {['Content-Type'] = 'application/json'})
end)

RegisterCommand( -- الكوماند لتشغيل السكربت
    "الخروج",
    function(source, args, rawCommand)
        TriggerClientEvent("B3-Afk:setAFK", source)
end, false)

RegisterNetEvent("B3-Afk:sendAFKmessagetoServer") -- 
AddEventHandler("B3-Afk:sendAFKmessagetoServer", function(name)
    if Config.afkmessagestoServer then 
        TriggerClientEvent("chatMessage", -1, "^7[^4"..GetPlayerName(source).."^7]".." has gone afk.")
    end
end)

RegisterCommand(-- AFKالكوماند حق وقف ال 
    "العودة",
    function(source, args, rawCommand)
        TriggerClientEvent("B3-Afk:setNot", source)
end, false)

RegisterServerEvent("B3-Afk:kickPlayer") -- kick the player as long as AFKkick config is on
AddEventHandler("B3-Afk:kickPlayer", function(time)
	DropPlayer(source, "You were AFK for "..time.. ". therefore, you were kicked to clear a spot on the server.")
end)

-- Updates
        print("^4"..GetCurrentResourceName() .."^7 is on the ^2newest ^7version!^7")