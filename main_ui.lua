-- Load main_ui.lua
local MainUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/main_ui.lua"))()

-- Create the UI
local myUI = MainUI.create(
    "TestUI",                     -- UI Name
    0.1,                          -- Transparency
    Color3.fromRGB(100, 100, 255),-- Background Color
    1234567890,                   -- Roblox Asset ID for Image
    "My Cool UI",                 -- Title
    UDim2.new(0, 400, 0, 300)     -- Size (Width x Height)
)

-- Add Buttons
myUI.addButton("Click Me!", function()
    print("Button clicked!")
end)

myUI.addButton("Another Button", function()
    print("Another button clicked!")
end)
