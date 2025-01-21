-- main.lua
local Notiy = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/notiy.lua"))()

-- Example usage
Notiy.create(
    "Welcome!", 
    "Thanks for using the Notiy system.", 
    5, 
    Color3.fromRGB(85, 170, 255), -- Custom RGB
    0.2 -- Transparency
)
