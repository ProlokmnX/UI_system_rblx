local MainUI = {}

local Button = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/button.lua"))()
local Slider = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/slider.lua"))()
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/ui.lua"))()

function MainUI.create(title, titleColor, bgColor, transparency, iconId)
    local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui", playerGui)
    local mainFrame = UI.create(screenGui, title, titleColor, bgColor, transparency, iconId)

    return {
        addButton = function(text, textColor, bgColor, transparency, iconId, callback)
            Button.create(mainFrame, text, textColor, bgColor, transparency, iconId, callback)
        end,
        addSlider = function(min, max, defaultValue, callback)
            Slider.create(mainFrame, min, max, defaultValue, callback)
        end,
    }
end

return MainUI
