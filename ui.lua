local UI = {}

function UI.create(title, iconId, size, bgColor, transparency)
    -- Set default values for size, bgColor, and transparency
    size = size or UDim2.new(0, 400, 0, 300)
    bgColor = bgColor or Color3.fromRGB(30, 30, 30)
    transparency = transparency or 0.1

    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui

    -- Main Frame
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = UDim2.new(0.5, -size.X.Offset / 2, 0.5, -size.Y.Offset / 2) -- Centered
    frame.BackgroundColor3 = bgColor
    frame.BackgroundTransparency = transparency
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0.15, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    titleBar.Parent = frame

    local cornerTitle = Instance.new("UICorner")
    cornerTitle.CornerRadius = UDim.new(0, 10)
    cornerTitle.Parent = titleBar

    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(1, -50, 1, 0)
    titleText.Position = UDim2.new(0, 50, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = title or "UI"
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 18
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar

    -- Icon (optional)
    if iconId then
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://" .. tostring(iconId)
        icon.Size = UDim2.new(0, 40, 0, 40)
        icon.Position = UDim2.new(0, 5, 0.5, -20)
        icon.BackgroundTransparency = 1
        icon.Parent = titleBar
    end

    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 50, 1, 0)
    closeButton.Position = UDim2.new(1, -50, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 16
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Parent = titleBar

    -- Add rounded corners to the close button
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeButton

    -- Add hover effect
    closeButton.MouseEnter:Connect(function()
        closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50) -- Brighter red on hover
    end)

    closeButton.MouseLeave:Connect(function()
        closeButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85) -- Original color
    end)

    -- Close the UI when clicked
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)


    -- Make draggable
    local isDragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    isDragging = false
                end
            end)
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and isDragging then
            update(input)
        end
    end)

    return frame
end

return UI
