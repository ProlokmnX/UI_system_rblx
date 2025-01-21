-- main.lua
local HttpService = game:GetService("HttpService")
local Notiy = loadstring(HttpService:GetAsync("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/notiy.lua"))()

-- Example usage
Notiy.create(
    "Welcome!", 
    "Thanks for using the Notiy system.", 
    5, 
    Color3.fromRGB(255, 85, 85), 
    0.1
)
