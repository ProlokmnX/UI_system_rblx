-- debug.lua
local MainUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/main_ui.lua"))()
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/ui.lua"))()
local Notiy = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/notiy.lua"))()

-- Create the base UI
local mainFrame = MainUI.create(
    "DebugUI",                     -- UI Name
    0.1,                           -- Transparency
    Color3.fromRGB(100, 100, 255), -- Background Color
    UDim2.new(0, 400, 0, 300)      -- Size (Width x Height)
)

-- Add title
UI.addTitle(mainFrame, "Debugging UI", 1234567890)

-- Add a close button
UI.addCloseButton(mainFrame)

-- Add a button for notifications
UI.addButton(mainFrame, "Test Notification", function()
    Notiy.create("Notification Test", "This is a debug notification!", 3, Color3.fromRGB(85, 255, 85), 0.1)
end)

-- Add a button for printing to the console
UI.addButton(mainFrame, "Console Test", function()
    print("Console test successful!")
end)

-- Add a button for error simulation
UI.addButton(mainFrame, "Simulate Error", function()
    error("This is a simulated error for debugging purposes.")
end)
