-- main_ui.lua
local MainUI = {}

local Notiy = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProlokmnX/UI_system_rblx/main/notiy.lua"))()

Notiy.create("Welcome!", "Hello, player!", 3, Color3.fromRGB(85, 255, 85), 0.2)
Notiy.create("Warning!", "Watch out for dangers!", 4, Color3.fromRGB(255, 85, 85), 0.1)

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Function to create the UI
function MainUI.create(uiName, uiTransparency, uiColor, uiImage, uiTitle, uiSize)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = uiName
    screenGui.Parent = playerGui

    -- Main UI Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = uiSize or UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundTransparency = uiTransparency or 0
    mainFrame.BackgroundColor3 = uiColor or Color3.fromRGB(50, 50, 50)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Parent = screenGui

    -- Rounded Corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = mainFrame

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
    if uiImage then
        local titleImage = Instance.new("ImageLabel")
        titleImage.Size = UDim2.new(0, 40, 0, 40)
        titleImage.Position = UDim2.new(0, 5, 0, 5)
        titleImage.Image = "rbxassetid://" .. tostring(uiImage)
        titleImage.BackgroundTransparency = 1
        titleImage.Parent = titleBar
    end

    -- Title Text
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = uiTitle or "Main UI"
    titleLabel.Size = UDim2.new(1, -50, 1, 0)
    titleLabel.Position = UDim2.new(0, 50, 0, 0)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = titleBar

    -- Draggable Functionality
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)

    -- Buttons
    function MainUI.addButton(buttonText, buttonCallback)
        local button = Instance.new("TextButton")
        button.Text = buttonText or "Button"
        button.Size = UDim2.new(0.9, 0, 0, 40)
        button.Position = UDim2.new(0.05, 0, 0, (#mainFrame:GetChildren() - 1) * 50 + 60)
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

    return MainUI
end

return MainUI
