local Notify = {}

-- Function to create notifications
function Notify.create(title, message, duration, color, transparency, iconId, soundId)
    local player = game.Players.LocalPlayer
    local playerGui = player:FindFirstChild("PlayerGui")

    -- Create a ScreenGui for notifications
    local screenGui = playerGui:FindFirstChild("Notifications") or Instance.new("ScreenGui")
    screenGui.Name = "Notifications"
    screenGui.Parent = playerGui
    screenGui.ResetOnSpawn = false

    -- Create the notification frame
    local notificationFrame = Instance.new("Frame")
    notificationFrame.Size = UDim2.new(0, 300, 0, 80)
    notificationFrame.Position = UDim2.new(1, -310, 1, -90 - (#screenGui:GetChildren() * 90))
    notificationFrame.BackgroundColor3 = color or Color3.fromRGB(30, 30, 30)
    notificationFrame.BackgroundTransparency = transparency or 0.2
    notificationFrame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = notificationFrame

    -- Add the title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = title or "Notification"
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, -10, 0, 30)
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notificationFrame

    -- Add the message
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Text = message or "Message goes here."
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextSize = 14
    messageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Size = UDim2.new(1, -10, 0, 30)
    messageLabel.Position = UDim2.new(0, 10, 0, 40)
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.Parent = notificationFrame

    -- Add an optional icon
    if iconId then
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://" .. tostring(iconId)
        icon.Size = UDim2.new(0, 40, 0, 40)
        icon.Position = UDim2.new(0, 5, 0, 20)
        icon.BackgroundTransparency = 1
        icon.Parent = notificationFrame

        titleLabel.Position = UDim2.new(0, 50, 0, 5)
        messageLabel.Position = UDim2.new(0, 50, 0, 40)
    end

    -- Play optional sound
    if soundId then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. tostring(soundId)
        sound.Volume = 0.5
        sound.Parent = notificationFrame
        sound:Play()
    end

    -- Auto-destroy the notification
    task.delay(duration or 5, function()
        notificationFrame:Destroy()
    end)
end

return Notify
