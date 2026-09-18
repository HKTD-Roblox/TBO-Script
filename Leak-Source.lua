local url = "https://peeky.pythonanywhere.com/DaHoodGui"
local success, result = pcall(function()
    return game:HttpGet(url)
end)

if success and result and #result > 0 then
    if writefile then
        writefile("TBO-Script.lua", result)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "TBO Script",
            Text = "Saved successfully to TBO-Script.lua!",
            Duration = 5
        })
    else
        setclipboard(result)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "TBO Script",
            Text = "Successfully copied to Clipboard!",
            Duration = 5
        })
    end
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "TBO Script",
        Text = "Failed to download!",
        Duration = 5
    })
end
