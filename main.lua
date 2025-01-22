-- main.lua
local MainUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/main_ui.lua"))()
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/ui.lua"))()

-- Create the base UI
local mainFrame = MainUI.create(
    "TestUI",                     -- UI Name
    0.1,                          -- Transparency
    Color3.fromRGB(100, 100, 255),-- Background Color
    UDim2.new(0, 400, 0, 300)     -- Size (Width x Height)
)

-- Add a title
UI.addTitle(mainFrame, "My Cool UI", 1234567890) -- Title with optional image ID

-- Add buttons
UI.addButton(mainFrame, "Click Me!", function()
    print("Button clicked!")
end)

UI.addButton(mainFrame, "Another Button", function()
    print("Another button clicked!")
end)
