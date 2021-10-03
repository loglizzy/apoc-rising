local Frame = Instance.new("Frame")
local list = Instance.new("ScrollingFrame")
local grid = Instance.new("UIListLayout")
local box = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local top = Instance.new("Frame")
local title = Instance.new("TextLabel")

Frame.Parent = game.CoreGui.RobloxGui
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.7, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 374, 0, 229)

list.Name = "list"
list.Parent = Frame
list.Active = true
list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
list.BackgroundTransparency = 1.000
list.BorderSizePixel = 0
list.Position = UDim2.new(0, 4, 0, 50)
list.Size = UDim2.new(1, -8, 1, -54)
list.ScrollBarThickness = 4

grid.Name = "grid"
grid.Parent = list
grid.FillDirection = Enum.FillDirection.Vertical
grid.SortOrder = Enum.SortOrder.LayoutOrder
grid.Padding = UDim.new(0,2)

box.Name = "box"
box.Parent = Frame
box.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
box.BackgroundTransparency = 0.500
box.BorderSizePixel = 0
box.Position = UDim2.new(0, 4, 0, 24)
box.Size = UDim2.new(1, -8, 0, 22)
box.Font = Enum.Font.SourceSans
box.PlaceholderText = "search name"
box.Text = ""
box.TextColor3 = Color3.fromRGB(0, 0, 0)
box.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 2)
UICorner_2.Parent = box

top.Name = "top"
top.Parent = Frame
top.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
top.BorderColor3 = Color3.fromRGB(71, 71, 71)
top.Size = UDim2.new(1, 0, 0, 20)

local close = Instance.new("ImageButton")
close.Name = "close"
close.Parent = top
close.BackgroundTransparency = 1.000
close.Position = UDim2.new(1, -20, 0, -20)
close.Size = UDim2.new(0, 20, 0, 20)
close.ZIndex = 2
close.Image = "rbxassetid://3926305904"
close.ImageRectOffset = Vector2.new(284, 4)
close.ImageRectSize = Vector2.new(24, 24)

title.Name = "title"
title.Parent = top
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.BorderSizePixel = 0
title.Position = UDim2.new(0, 5, 0, 0)
title.Size = UDim2.new(1, 0, 1, -1)
title.Font = Enum.Font.SourceSans
title.Text = "item spawner"
title.TextColor3 = Color3.fromRGB(189, 189, 189)
title.TextSize = 14.000
title.TextXAlignment = Enum.TextXAlignment.Left

local UserInputService = game:GetService("UserInputService")
local gui = Frame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

return {new=function(v,e)
    local nw = Instance.new("TextButton")
    local icon = Instance.new("ImageButton")
    local UICorner = Instance.new("UICorner")

    nw.Name = "nw"
    nw.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
    nw.BackgroundTransparency = 0.600
    nw.BorderSizePixel = 0
    nw.Position = UDim2.new(0.0178571437, 0, 0.104166664, 0)
    nw.Size = UDim2.new(1, -8, 0, 37)
    nw.Font = Enum.Font.SourceSans
    nw.Text = "                 "..v
    nw.TextColor3 = Color3.fromRGB(0, 0, 0)
    nw.TextSize = 14.000
    nw.TextXAlignment = Enum.TextXAlignment.Left
    
    icon.Name = "icon"
    icon.Parent = nw
    icon.BackgroundTransparency = 1.000
    icon.LayoutOrder = 9
    icon.Position = UDim2.new(0, 5, 0, 5)
    icon.Size = UDim2.new(0, 25, 0, 25)
    icon.ZIndex = 2
    icon.Image = e
    icon.ScaleType = Enum.ScaleType.Fit
    
    UICorner.CornerRadius = UDim.new(0, 2)
    UICorner.Parent = nw
        
    nw.Parent = list
    return nw
    end,list=list,box=box,title=title}
