local Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/notify.lua"))()

-- Identity Check
local identity = syn and syn.get_thread_identity and syn.get_thread_identity() or 7 -- Assuming highest if not accessible

if identity < 5 then
    Notify.create(
        "Identity Check Failed", 
        "Please use level 5 or higher! Level 8 is recommended.", 
        5, 
        Color3.fromRGB(255, 0, 0), 
        0.1, 
        nil, 
        nil
    )
else
    Notify.create(
        "Identity Check Passed", 
        "This script should work fine!", 
        5, 
        Color3.fromRGB(0, 255, 0), 
        0.1, 
        nil, 
        nil
    )
end
