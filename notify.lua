-- notiy.lua
local Notiy = {}

local TweenService = game:GetService("TweenService")

local notifications = {}
local container

local function createNotification(title, text, duration, color, transparency)
    if not container then
        container = Instance.new("ScreenGui")
        container.Name = "NotiyContainer"
        container.IgnoreGuiInset = true
        container.ResetOnSpawn = false
        container.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end

    -- Create the notification frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 70)
    frame.Position = UDim2.new(1, -320, 1, -(#notifications * 80 + 80))
    frame.BackgroundTransparency = transparency or 0.1
    frame.BackgroundColor3 = color or Color3.new(0.1, 0.1, 0.1)
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(1, 1)
    frame.Parent = container
    frame.ClipsDescendants = true
    frame.Visible = false

    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 10)

    -- Title
    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.Size = UDim2.new(1, -20, 0, 30)
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.Text = title or "Notification"
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.BackgroundTransparency = 1

    -- Text
    local textLabel = Instance.new("TextLabel", frame)
    textLabel.Size = UDim2.new(1, -20, 0, 25)
    textLabel.Position = UDim2.new(0, 10, 0, 40)
    textLabel.Text = text or "This is a notification."
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 14
    textLabel.TextColor3 = Color3.new(0.9, 0.9, 0.9)
    textLabel.BackgroundTransparency = 1
    textLabel.TextWrapped = true

    -- Show animation
    TweenService:Create(frame, TweenInfo.new(0.5), {Visible = true}):Play()

    -- Add to stack
    table.insert(notifications, frame)

    -- Auto-remove
    task.spawn(function()
        wait(duration or 5)
        TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(1, 0, 1, frame.Position.Y.Offset)}):Play()
        wait(0.5)
        frame:Destroy()
        table.remove(notifications, table.find(notifications, frame))
    end)
end

function Notiy.create(title, text, duration, color, transparency)
    createNotification(title, text, duration, color, transparency)
end

return Notiy
