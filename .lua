local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Module = {}

-- ===== DRAG =====
local function MakeDraggable(dragHandle, frame)
	local dragging = false
	local dragStart, startPos

	dragHandle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
		end
	end)

	dragHandle.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

-- ===== CREATE =====
function Module.Create()
	local RynixHub = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local TabHolder = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Features = Instance.new("TextLabel")
	local Dash = Instance.new("Frame")
	local Exit = Instance.new("TextButton")
	local ContentLabel = Instance.new("TextLabel")
	local Dash_2 = Instance.new("Frame")

	-- GUI Setup
	RynixHub.Name = "RynixHub"
	RynixHub.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
	RynixHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = RynixHub
	Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Main.BackgroundTransparency = 0.15
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.229, 0, 0.246, 0)
	Main.Size = UDim2.new(0, 491, 0, 275)

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0.107, 0, -0.054, 0)
	Title.Size = UDim2.new(0, 491, 0, 68)
	Title.Font = Enum.Font.ArialBold
	Title.Text = "RYNIX HUB"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 34

	UICorner.Parent = Main

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Main
	TabHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TabHolder.BorderSizePixel = 0
	TabHolder.Size = UDim2.new(0, 121, 0, 275)
	UICorner_2.Parent = TabHolder

	Features.Name = "Features"
	Features.Parent = TabHolder
	Features.BackgroundTransparency = 1
	Features.Position = UDim2.new(0.297, 0, 0.05, 0)
	Features.Size = UDim2.new(0, 48, 0, 12)
	Features.Font = Enum.Font.Fondamento
	Features.Text = "Features"
	Features.TextColor3 = Color3.fromRGB(255, 255, 255)
	Features.TextSize = 17

	Dash.Name = "Dash"
	Dash.Parent = TabHolder
	Dash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Dash.BorderSizePixel = 0
	Dash.Position = UDim2.new(0, 0, 0.156, 0)
	Dash.Size = UDim2.new(0, 121, 0, 2)

	Exit.Name = "Exit"
	Exit.Parent = Main
	Exit.BackgroundTransparency = 1
	Exit.Position = UDim2.new(0.963, 0, 0.032, 0)
	Exit.Size = UDim2.new(0, 18, 0, 5)
	Exit.Font = Enum.Font.SourceSansBold
	Exit.Text = "X"
	Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
	Exit.TextSize = 28

	ContentLabel.Name = "UpdateLabel"
	ContentLabel.Parent = Main
	ContentLabel.BackgroundTransparency = 1
	ContentLabel.Position = UDim2.new(0.281, 0, 0.163, 0)
	ContentLabel.Size = UDim2.new(0, 335, 0, 218)
	ContentLabel.Font = Enum.Font.Fondamento
	ContentLabel.TextColor3 = Color3.fromRGB(252, 252, 252)
	ContentLabel.TextSize = 25

	Dash_2.Name = "Dash"
	Dash_2.Parent = Main
	Dash_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Dash_2.BorderSizePixel = 0
	Dash_2.Position = UDim2.new(0.281, 0, 0.152, 0)
	Dash_2.Size = UDim2.new(0, 335, 0, 2)

	-- Draggable
	MakeDraggable(Title, Main)

	Exit.MouseButton1Click:Connect(function()
		RynixHub:Destroy()
	end)

	-- Dynamic Buttons Table
	local buttons = {}

	-- Update positions dynamically
	local function UpdateButtonPositions()
		for i, btn in ipairs(buttons) do
			btn.Position = UDim2.new(0, 0, 0.1927 + (i-1) * 0.08, 0)
		end
	end

	-- Add a button
	local function AddButton(name, callback)
		local Btn = Instance.new("TextButton")
		local UICornerBtn = Instance.new("UICorner")
		Btn.Name = name
		Btn.Parent = TabHolder
		Btn.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
		Btn.BackgroundTransparency = 1
		Btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Btn.BorderSizePixel = 0
		Btn.Size = UDim2.new(0, 121, 0, 33)
		Btn.Font = Enum.Font.Arial
		Btn.Text = name
		Btn.TextColor3 = Color3.fromRGB(177, 177, 177)
		Btn.TextSize = 17
		UICornerBtn.Parent = Btn
		Btn.MouseButton1Click:Connect(callback)
		table.insert(buttons, Btn)
		UpdateButtonPositions()
		return Btn
	end

	local function UpdateLabel(text)
		ContentLabel.Text = text
	end

	return {
		Gui = RynixHub,
		Main = Main,
		Title = Title,
		TabHolder = TabHolder,
		ContentLabel = ContentLabel,
		AddButton = AddButton,
		UpdateLabel = UpdateLabel
	}
end

return Module
