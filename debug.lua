-- debug.lua
local MainUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/main_ui.lua"))()
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/ui.lua"))()

-- Create the base UI
local mainFrame = MainUI.create(
    "DebugUI",                     -- UI Name
    0.1,                           -- Transparency
    Color3.fromRGB(100, 100, 255), -- Background Color
    UDim2.new(0, 400, 0, 300)      -- Size (Width x Height)
)

-- Add title
UI.addTitle(mainFrame, "Debugging UI", 7229442422) -- Image ID provided

-- Add a close button
UI.addCloseButton(mainFrame)

-- Add buttons
UI.addButton(mainFrame, "Print Debug Info", function()
    print("Debug info: Test button clicked!")
end)

UI.addButton(mainFrame, "Simulate Error", function()
    error("This is a simulated error for debugging purposes.")
end)
