local Button = {}

function Button.create(parent, text, textColor, bgColor, transparency, iconId, callback)
    local button = Instance.new("TextButton")
    button.Text = text or "Button"
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = bgColor or Color3.fromRGB(50, 50, 50)
    button.BackgroundTransparency = transparency or 0.1
    button.Size = UDim2.new(0, 150, 0, 50)
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

return Button
