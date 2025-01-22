local Button = {}

function Button.addToUI(frame, text, callback, bgColor, textColor, iconId)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0.1, 0)
    button.Position = UDim2.new(0.1, 0, 0.8, 0)
    button.BackgroundColor3 = bgColor or Color3.fromRGB(70, 70, 70)
    button.Text = text or "Button"
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    button.Parent = frame

    if iconId then
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://" .. tostring(iconId)
        icon.Size = UDim2.new(0, 20, 0, 20)
        icon.Position = UDim2.new(0, 5, 0.5, -10)
        icon.BackgroundTransparency = 1
        icon.Parent = button

        button.Text = "   " .. button.Text
    end

    button.MouseButton1Click:Connect(callback)
end

return Button
