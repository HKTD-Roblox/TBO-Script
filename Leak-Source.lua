local httpService = game:GetService("HttpService")
local hwid = "unknown"

pcall(function() 
    if gethwid then 
        hwid = gethwid() 
    else 
        hwid = game:GetService("RbxAnalyticsService"):GetClientId() 
    end 
end)

local url = "https://peeky.pythonanywhere.com/DaHoodGui" .. httpService:UrlEncode(hwid) .. "&_cb=" .. tostring(os.clock())

local success, result = pcall(function()
    return httpService:GetAsync(url, true)
end)

if success and writefile then
    writefile("TBO-Script.lua", result)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "TBO Script",
        Text = "Saved successfully to TBO-Script.lua!",
        Duration = 5
    })
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "TBO Script",
        Text = "Failed to fetch or save script from server!",
        Duration = 5
    })
end
