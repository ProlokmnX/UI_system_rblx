-- ui.lua
local UI = {}

-- Add a title to the main UI
function UI.addTitle(mainFrame, titleText, imageId)
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 50)
    titleBar.BackgroundTransparency = 0.2
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.Parent = mainFrame

    local cornerTitle = Instance.new("UICorner")
    cornerTitle.CornerRadius = UDim.new(0, 10)
    cornerTitle.Parent = titleBar

    -- Title Image
    if imageId then
        local titleImage = Instance.new("ImageLabel")
        titleImage.Size = UDim2.new(0, 40, 0, 40)
        titleImage.Position = UDim2.new(0, 5, 0, 5)
        titleImage.Image = "rbxassetid://" .. tostring(imageId)
        titleImage.BackgroundTransparency = 1
        titleImage.Parent = titleBar
    end

    -- Title Text
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = titleText or "Main UI"
    titleLabel.Size = UDim2.new(1, -50, 1, 0)
    titleLabel.Position = UDim2.new(0, 50, 0, 0)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = titleBar
end

-- Add a button to the main UI
function UI.addButton(mainFrame, buttonText, buttonCallback)
    local button = Instance.new("TextButton")
    button.Text = buttonText or "Button"
    button.Size = UDim2.new(0.9, 0, 0, 40)
    button.Position = UDim2.new(0.05, 0, 0, (#mainFrame:GetChildren() - 1) * 50 + 10)
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Parent = mainFrame

    local cornerButton = Instance.new("UICorner")
    cornerButton.CornerRadius = UDim.new(0, 8)
    cornerButton.Parent = button

    button.MouseButton1Click:Connect(function()
        if buttonCallback then
            buttonCallback()
        end
    end)
end

return UI
