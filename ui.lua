local UI = {}

function UI.create(title, titleColor, bgColor, transparency, iconId)
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui

    -- Main Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 300)
    frame.Position = UDim2.new(0.5, -200, 0.5, -150) -- Center
    frame.BackgroundColor3 = bgColor or Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = transparency or 0
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    -- Title Bar
    local titleBar = Instance.new("TextLabel")
    titleBar.Size = UDim2.new(1, 0, 0.15, 0)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
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

    -- Icon (Optional)
    if iconId then
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://" .. tostring(iconId)
        icon.Size = UDim2.new(0, 40, 0, 40)
        icon.Position = UDim2.new(0, 5, 0.5, -20)
        icon.BackgroundTransparency = 1
        icon.Parent = titleBar

        titleBar.Text = "   " .. titleBar.Text -- Offset text for icon
    end

    return frame
end

function UI.addButton(parent, text, textColor, bgColor, transparency, iconId, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0.15, 0)
    button.Position = UDim2.new(0.1, 0, 0.85, 0)
    button.BackgroundColor3 = bgColor or Color3.fromRGB(70, 70, 70)
    button.BackgroundTransparency = transparency or 0
    button.Text = text or "Button"
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    button.Parent = parent

    local cornerButton = Instance.new("UICorner")
    cornerButton.CornerRadius = UDim.new(0, 8)
    cornerButton.Parent = button

    -- Icon (Optional)
    if iconId then
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://" .. tostring(iconId)
        icon.Size = UDim2.new(0, 20, 0, 20)
        icon.Position = UDim2.new(0, 5, 0.5, -10)
        icon.BackgroundTransparency = 1
        icon.Parent = button

        button.Text = "   " .. button.Text -- Offset text for icon
    end

    -- Connect Callback
    if callback then
        button.MouseButton1Click:Connect(callback)
    end
end

return UI
