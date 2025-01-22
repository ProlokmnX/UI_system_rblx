local Slider = {}

function Slider.create(parent, min, max, defaultValue, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 60)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(0.9, 0, 0.2, 0)
    sliderBar.Position = UDim2.new(0.05, 0, 0.5, -5)
    sliderBar.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    sliderBar.Parent = frame

    local sliderButton = Instance.new("ImageButton")
    sliderButton.Size = UDim2.new(0, 20, 0, 20)
    sliderButton.Position = UDim2.new((defaultValue - min) / (max - min), -10, 0.5, -10)
    sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderButton.Parent = sliderBar

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(1, 0, 0.3, 0)
    valueLabel.Position = UDim2.new(0, 0, 0, 5)
    valueLabel.Text = "Value: " .. tostring(defaultValue)
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Parent = frame

    local function updateSlider(input)
        local barAbsoluteSize = sliderBar.AbsoluteSize.X
        local barAbsolutePosition = sliderBar.AbsolutePosition.X
        local inputX = math.clamp(input.Position.X - barAbsolutePosition, 0, barAbsoluteSize)
        local percentage = inputX / barAbsoluteSize
        local value = math.floor(min + (max - min) * percentage)

        sliderButton.Position = UDim2.new(percentage, -10, 0.5, -10)
        valueLabel.Text = "Value: " .. tostring(value)

        if callback then
            callback(value)
        end
    end

    sliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local conn
            conn = game:GetService("UserInputService").InputChanged:Connect(function(move)
                if move.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(move)
                end
            end)

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    conn:Disconnect()
                end
            end)
        end
    end)

    return frame
end

return Slider
