local Slider = {}

function Slider.addToUI(frame, min, max, callback)
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(0.8, 0, 0.1, 0)
    slider.Position = UDim2.new(0.1, 0, 0.6, 0)
    slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    slider.Parent = frame

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
    bar.Parent = slider

    local drag = Instance.new("ImageButton")
    drag.Size = UDim2.new(0, 10, 1, 0)
    drag.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
    drag.Position = UDim2.new(0, 0, 0, 0)
    drag.Parent = slider

    local dragging = false

    drag.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    drag.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
            bar.Size = UDim2.new(pos, 0, 1, 0)
            drag.Position = UDim2.new(pos, 0, 0, 0)
            callback(math.floor(min + (max - min) * pos))
        end
    end)
end

return Slider
