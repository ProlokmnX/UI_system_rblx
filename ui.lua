local UI = {}

function UI.create(parent, title, titleColor, bgColor, transparency, iconId)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 300)
    frame.Position = UDim2.new(0.5, -200, 0.5, -150)
    frame.BackgroundColor3 = bgColor or Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = transparency or 0.1
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Parent = parent

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

return UI
