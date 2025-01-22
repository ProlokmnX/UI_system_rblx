local UI = {}

-- Create the main UI
function UI.create(title, titleColor, bgColor, transparency, iconId)
    local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui", playerGui)

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 300)
    frame.Position = UDim2.new(0.5, -200, 0.5, -150) -- Centered
    frame.BackgroundColor3 = bgColor or Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = transparency or 0.1
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    -- Title Bar
    local titleBar = Instance.new("TextLabel")
    titleBar.Size = UDim2.new(1, 0, 0.15, 0)
    titleBar.BackgroundColor3 = titleColor or Color3.fromRGB(40, 40, 40)
    titleBar.Text = title or "UI"
    titleBar.Font = Enum.Font.GothamBold
    titleBar.TextSize = 18
    titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleBar.TextXAlignment = Enum.TextXAlignment.Left
    titleBar.Parent = frame

    local cornerTitle = Instance.new("UICorner")
    cornerTitle.CornerRadius = UDim.new(0, 10)
    cornerTitle.Parent = titleBar

    -- Icon
    if iconId then
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://" .. tostring(iconId)
        icon.Size = UDim2.new(0, 40, 0, 40)
        icon.Position = UDim2.new(0, 5, 0.5, -20)
        icon.BackgroundTransparency = 1
        icon.Parent = titleBar

        titleBar.Text = "   " .. titleBar.Text -- Offset text for icon
    end

    -- Draggable UI
    local dragging = false
    local dragStart, startPos

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame:TweenPosition(
                UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y),
                "Out",
                "Sine",
                0.1,
                true
            )
        end
    end)

    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return frame
end

-- Add a button to the UI
function UI.addButton(parent, text, textColor, bgColor, transparency, iconId, callback)
    local button = Instance.new("TextButton")
    button.Text = text or "Button"
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = bgColor or Color3.fromRGB(50, 50, 50)
    button.BackgroundTransparency = transparency or 0.1
    button.Size = UDim2.new(0.9, 0, 0, 50)
    button.Position = UDim2.new(0.05, 0, 0.2, 0) -- Below the title bar
    button.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button

    if iconId then
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://" .. tostring(iconId)
        icon.Size = UDim2.new(0, 20, 0, 20)
        icon.Position = UDim2.new(0, 5, 0.5, -10)
        icon.BackgroundTransparency = 1
        icon.Parent = button

        button.TextXAlignment = Enum.TextXAlignment.Left
        button.Text = "   " .. button.Text -- Offset text for icon
    end

    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return button
end

-- Add a slider to the UI
function UI.addSlider(parent, minValue, maxValue, defaultValue, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(0.9, 0, 0, 50)
    sliderFrame.Position = UDim2.new(0.05, 0, 0.4, 0) -- Positioned below the button
    sliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    sliderFrame.BackgroundTransparency = 0.1
    sliderFrame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = sliderFrame

    local slider = Instance.new("TextLabel")
    slider.Size = UDim2.new(1, -10, 1, -10)
    slider.Position = UDim2.new(0, 5, 0, 5)
    slider.Text = "Slider"
    slider.Font = Enum.Font.GothamBold
    slider.TextSize = 14
    slider.TextColor3 = Color3.fromRGB(255, 255, 255)
    slider.TextXAlignment = Enum.TextXAlignment.Left
    slider.Parent = sliderFrame

    local value = defaultValue or 0
    local function updateSlider(newValue)
        value = newValue
        slider.Text = "Value: " .. tostring(value)
        if callback then
            callback(value)
        end
    end

    -- Example: Call updateSlider when the slider value changes
    updateSlider(defaultValue or minValue)

    return sliderFrame
end

return UI
